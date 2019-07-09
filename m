Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6791642BE
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 09:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2DB89C2C;
	Wed, 10 Jul 2019 07:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE88D6E061;
 Tue,  9 Jul 2019 20:21:54 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n9so173204wru.0;
 Tue, 09 Jul 2019 13:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BqI5outTIh2mJn+SptLleo59V8v3BzRwFRtZPJVwOgQ=;
 b=pN5Llwq/LKkwAyiQ0c0O65TseiiXguz2ijbLi9jnTfcVUxaFHadoPceFjcT9Te2ljX
 R1I69InfPQpgPcrWqFZP9OgnOENkbY0O8Uz8ypVbSWQwBfIzQ4uRfAkvE0b+Lw74l0i0
 6LiQ3PcYT0vGSvaN9YOQw62n3cDJ83FyUXlLKsBkpmot7GJjlvRgV5y2GteVst0RrEXE
 pl8tKG+p6Rk/HA5ln9bRJu3ED2DX065WCbZv+CO13DhmMysEPAs4IDXd4jO7xrZ6HmLy
 mXRRGtqbFcSXNKZ3bmcbPZJdZ/sPdT54zVM1GUakSrap8AWKzYkT4cINpqjf4wWE9Dyj
 I27Q==
X-Gm-Message-State: APjAAAWFEoOmPYMDBcAFh/ExJM4x+q/wgbidYmt3E7PABXTf+PMHUi0R
 2rdAw+VnCiNVlvW5HE5q2s4=
X-Google-Smtp-Source: APXvYqyyg9ffu3I2DUs4oDtP0JbKuVnQZDgZxqg1ttyjXVjkFyhhdUXslaD72h3W+yVXC0DikmuOKA==
X-Received: by 2002:a5d:62c1:: with SMTP id o1mr26819925wrv.293.1562703713114; 
 Tue, 09 Jul 2019 13:21:53 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id w24sm16601wmc.30.2019.07.09.13.21.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 13:21:52 -0700 (PDT)
Date: Tue, 9 Jul 2019 13:21:50 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 5/7] drm/amd/display: Use proper enum conversion functions
Message-ID: <20190709202150.GB96242@archlinux-threadripper>
References: <20190704055217.45860-1-natechancellor@gmail.com>
 <20190704055217.45860-6-natechancellor@gmail.com>
 <CAK8P3a1vEtrS7SbhCPVxoYBcroT+Hr3Q4LFs6AJJ8G8GVw5SVA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1vEtrS7SbhCPVxoYBcroT+Hr3Q4LFs6AJJ8G8GVw5SVA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Wed, 10 Jul 2019 07:25:19 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BqI5outTIh2mJn+SptLleo59V8v3BzRwFRtZPJVwOgQ=;
 b=lDfy0y1VmUYZm1hrtwGJCJEuJGPi7rFi+/pbmnmsrMTVoUFkUnGonIB13rNvMQlRPC
 SlkpU3JCozmm5fbgcDROoEPRMZ5bAyGGUWPZo9RHq0Q+xILn0PujWqDPjN4mxZPzh/mI
 0ShwBlUjnW89bm/kFkjgkNpTnGNvR+Xm0ZkLzU9YBmTUxsBrGFznL/9FrU7vXsrmL1TF
 Cao+XoJGkMy5CunOwQ/qAUX2SzT+3Os7R71/kJTxxB9R8En3qINQIEGYnkeVJEmAYrsw
 qMAN62Gr8MExsOpPuF+wRVhymwl4te7xnNP/M2QomcFItK9FHaNrtLJhxtbRloWUVD2a
 yCmg==
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
Cc: clang-built-linux <clang-built-linux@googlegroups.com>,
 Leo Li <sunpeng.li@amd.com>, Rex Zhu <rex.zhu@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMDksIDIwMTkgYXQgMDg6NTE6MzNQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBPbiBUaHUsIEp1bCA0LCAyMDE5IGF0IDc6NTIgQU0gTmF0aGFuIENoYW5jZWxsb3IK
PiA8bmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBjbGFuZyB3YXJuczoK
PiA+Cj4gPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG1fcHBfc211LmM6MzM2Ojg6Cj4gPiB3YXJuaW5nOiBpbXBsaWNpdCBjb252ZXJzaW9u
IGZyb20gZW51bWVyYXRpb24gdHlwZSAnZW51bSBzbXVfY2xrX3R5cGUnCj4gPiB0byBkaWZmZXJl
bnQgZW51bWVyYXRpb24gdHlwZSAnZW51bSBhbWRfcHBfY2xvY2tfdHlwZScKPiA+IFstV2VudW0t
Y29udmVyc2lvbl0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBk
Y190b19zbXVfY2xvY2tfdHlwZShjbGtfdHlwZSksCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ID4gZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3Bw
X3NtdS5jOjQyMToxNDoKPiA+IHdhcm5pbmc6IGltcGxpY2l0IGNvbnZlcnNpb24gZnJvbSBlbnVt
ZXJhdGlvbiB0eXBlICdlbnVtCj4gPiBhbWRfcHBfY2xvY2tfdHlwZScgdG8gZGlmZmVyZW50IGVu
dW1lcmF0aW9uIHR5cGUgJ2VudW0gc211X2Nsa190eXBlJwo+ID4gWy1XZW51bS1jb252ZXJzaW9u
XQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRjX3RvX3BwX2Ns
b2NrX3R5cGUoY2xrX3R5cGUpLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ID4KPiA+IFRoZXJlIGFyZSBm
dW5jdGlvbnMgdG8gcHJvcGVybHkgY29udmVydCBiZXR3ZWVuIGFsbCBvZiB0aGVzZSB0eXBlcywg
dXNlCj4gPiB0aGVtIHNvIHRoZXJlIGFyZSBubyBsb25nZXIgYW55IHdhcm5pbmdzLgo+IAo+IEkg
aGFkIGEgZGlmZmVyZW50IHNvbHV0aW9uIGZvciB0aGlzIG9uZSBhcyB3ZWxsLiBUaGUgZGlmZmVy
ZW5jZSBpcyB0aGF0IHlvdXIKPiBwYXRjaCBrZWVwcyB0aGUgdHlwZXMgYW5kIGFzc3VtZXMgdGhh
dCB0aGUgZnVuY3Rpb25zIGRvIHRoZSByaWdodCB0aGluZwo+IChpLmUuIHRoZSB3YXJuaW5nIHdh
cyBjb3JyZWN0KSwgd2hpbGUgbXkgdmVyc2lvbiBhc3N1bWVzIHRoYXQgdGhlIGNvZGUKPiB3b3Jr
cyBjb3JyZWN0bHksIGJ1dCB0aGUgdHlwZXMgYXJlIHdyb25nIChhIGZhbHNlIHBvc2l0aXZlIHdh
cm5pbmcpLgo+IAo+IE9uZSBvZiB0aGUgdHdvIHBhdGNoZXMgaXMgY29ycmVjdCwgdGhlIG90aGVy
IG9uZSBpcyBicm9rZW4sIGJ1dCBJIGhhdmUKPiBubyBpZGVhIHdoaWNoIG9uZS4KPiAKPiAgICAg
ICBBcm5kCgpJbmRlZWQuIEkgd291bGQgcGVyc29uYWxseSBhcmd1ZSB0aGF0IGlmIHVzaW5nIHRo
ZSBjb3JyZWN0IGNvbnZlcnNpb24KZnVuY3Rpb25zICh3aGljaCBhcmUgaGVyZSB0byBzcGVjaWZp
Y2FsbHkgYXZvaWQgdGhpcyB0eXBlIG9mIHdhcm5pbmcpCmNhdXNlcyBpc3N1ZXMsIHRoaXMgY29k
ZSBzaG91bGQgcHJvYmFibHkgbm90IGJlIHVzaW5nIGVudW1lcmF0ZWQgdHlwZXMKYXQgYWxsIHNp
bmNlIHRoZSBlbnRpcmUgcG9pbnQgaXMgdG8gZW5mb3JjZSBzZW1hbnRpYyBjb3JyZWN0bmVzcywg
bm90Cmp1c3QgYmUgYSBzcGVjaWFsIHdheSB0byByZXByZXNlbnQgc21hbGwgaW50ZWdlciB2YWx1
ZXMsIGVzcGVjaWFsbHkgaW4KdGhlIGNhc2Ugd2hlcmUgdGhlIENMSyB2YWx1ZXMgYXJlIGNvbXBs
ZXRlbHkgZGlmZmVyZW50IG51bWVyaWNhbCB2YWx1ZXMKaW4gdmFyaW91cyBlbnVtZXJhdGVkIHR5
cGVzLiBJIHRoaW5rIGVudW1lcmF0ZWQgdHlwZSBjYXN0cyBhcmUgdWdseSBhbmQKZGVmZWF0IHRo
ZSBwdXJwb3NlIG9mIHRoZW0gYnV0IHRoYXQncyBvYnZpb3VzbHkganVzdCBteSBvcGluaW9uIDop
CgpIb3BlZnVsbHkgd2UgY2FuIGdldCBzb21lIGNsYXJpdHkgb24gdGhpcyBzb29uLgoKQ2hlZXJz
LApOYXRoYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
