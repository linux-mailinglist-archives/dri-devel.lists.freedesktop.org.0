Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 091B3DB7AC
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 21:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869676EA7A;
	Thu, 17 Oct 2019 19:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CC06EA6E;
 Thu, 17 Oct 2019 19:39:30 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id v17so3742791wml.4;
 Thu, 17 Oct 2019 12:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UT7xyfmARtbEtz9Y3P51WBO86VZDU8L5BW9LMX2rhrk=;
 b=C3xOoSJJWJX8LTmHGRMhLOc8aAsQRAY/Y6TVmvp/hcPZCTqNAVPICnWoFmD8RAOSew
 g+61+bspES7yYzcAGIHrb38cZiJ4K8154EOPWypwg30EAtE+ih3Qc5C88gfqIXApRifP
 MFc8bGEN4VGVeL9HtLZXY4tBAUUNciZEol0wrdAu/qmEO0p62xephng3cEhYXAf5LK1g
 4Or5VxswFoxonajhoVrcvLCPKvfOoBjwLDvXmv6QwAt4o+0jNGXNeLOEZUwJQYepVB6G
 mdxOM14ar0KchLl1Gg6pzbtKik6A/JDaLMejrvM4X1drvGOjRc9BA6NTcfOOqdhAAxs9
 p50A==
X-Gm-Message-State: APjAAAX/XrDPkSURxHwgJ10Sqj/o55knoGrntti1pwO5hdeD/jcMUcdY
 ntvWrOM0wNlB+MRzxEFmV0o9U8qkpZHDQ+vrVxw=
X-Google-Smtp-Source: APXvYqxFc+O7akcYwllXsKik8VtXmNju27+Py4FJrgLhvBrH3SJUxpMt75kL12Si+WJaOepzoTSxsq6QlFhuCtYQfzU=
X-Received: by 2002:a1c:968b:: with SMTP id y133mr4217351wmd.141.1571341168937; 
 Thu, 17 Oct 2019 12:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <20191017091216.GA31278@mwanda>
In-Reply-To: <20191017091216.GA31278@mwanda>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 17 Oct 2019 15:39:14 -0400
Message-ID: <CADnq5_N50-qL9KStb9_1kSqHgXb3fO=AzqOgAVzKDHSONZPXvw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/vi: silence an uninitialized variable warning
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=UT7xyfmARtbEtz9Y3P51WBO86VZDU8L5BW9LMX2rhrk=;
 b=fdnqU84kyd8LvUPwLhr4cU06XsQnW+iWOwh9twDQARCEVUUCeR/EG9BQnruYq5KaUq
 U0J+C4bu06SKnm5OI6m/GqQz/uWYB486DTxbeSORe9UK/4sKl8GRzKSFb08sSR2RVjdw
 IlRsy9gjFXiCgzttMxmuXAyqGVoLL+pbE3qmz5W24lfpyB0vvFef+It3zFnLE2h5F67e
 MP51W49M4gws0b1zF4k1uJSE2N3Ac3kQYzRHbSeJQc2F9FKW1oORO5UueuY4lw1ptGho
 n6cQXkPVqE/DlQ3cI54zFqGNgn6L6Ryzjpi7ZEk70eIiKdFC3t1xrIkME7nOoMcH280C
 AWkw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jim Qu <Jim.Qu@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Rex Zhu <rex.zhu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgNToxMiBBTSBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVu
dGVyQG9yYWNsZS5jb20+IHdyb3RlOgo+Cj4gU21hdGNoIGNvbXBsYWlucyB0aGF0IHdlIG5lZWQg
dG8gaW5pdGlhbGl6ZWQgIipjYXAiIG90aGVyd2lzZSBpdCBjYW4KPiBsZWFkIHRvIGFuIHVuaW5p
dGlhbGl6ZWQgdmFyaWFibGUgYnVnIGluIHRoZSBjYWxsZXIuICBUaGlzIHNlZW1zIGxpa2UgYQo+
IHJlYXNvbmFibGUgd2FybmluZyBhbmQgaXQgZG9lc24ndCBodXJ0IHRvIHNpbGVuY2UgaXQgYXQg
bGVhc3QuCj4KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92aS5jOjc2NyB2aV9hc2ljX3Jl
c2V0X21ldGhvZCgpIGVycm9yOiB1bmluaXRpYWxpemVkIHN5bWJvbCAnYmFjb19yZXNldCcuCj4K
PiBGaXhlczogNDI1ZGIyNTUzZTQzICgiZHJtL2FtZGdwdTogZXhwb3NlIEJBQ08gaW50ZXJmYWNl
cyB0byB1cHBlciBsZXZlbCBmcm9tIFBQIikKPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVy
IDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+CgpBcHBsaWVkLiAgdGhhbmtzIQoKQWxleAoKPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kX3Bvd2VycGxheS5jIHwgMSAr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZF9wb3dlcnBsYXkuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2FtZF9wb3dlcnBsYXkuYwo+IGluZGV4IDgzMTk2Yjc5ZWRkNS4uZjRm
ZjE1Mzc4ZTYxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2Ft
ZF9wb3dlcnBsYXkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZF9w
b3dlcnBsYXkuYwo+IEBAIC0xNDIxLDYgKzE0MjEsNyBAQCBzdGF0aWMgaW50IHBwX2dldF9hc2lj
X2JhY29fY2FwYWJpbGl0eSh2b2lkICpoYW5kbGUsIGJvb2wgKmNhcCkKPiAgewo+ICAgICAgICAg
c3RydWN0IHBwX2h3bWdyICpod21nciA9IGhhbmRsZTsKPgo+ICsgICAgICAgKmNhcCA9IGZhbHNl
Owo+ICAgICAgICAgaWYgKCFod21ncikKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
Cj4KPiAtLQo+IDIuMjAuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
