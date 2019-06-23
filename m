Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F344F98F
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2019 04:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5205589D5F;
	Sun, 23 Jun 2019 02:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5357F89D5E;
 Sun, 23 Jun 2019 02:42:30 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id k8so238013iot.1;
 Sat, 22 Jun 2019 19:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cnFWOK8KBDczr/rYP2uNrysQXAIVz65G0LlKrMiXR+0=;
 b=hX1yH/oCa/RT7FgtIusqQtBSA8rGzr5zaa9PuIWN2PfWr66v59zV/57JKX0ETJpgTQ
 LosvR4Q5w0BoRgp10+eFtIjwaEUATzaKnzI9LSoiST/bA8ijm/uLgtW9goX6lmVLtqr7
 tgBKaiCKKCD2D4FYZHUJ+2qF3KfEWeN9iTU2DzG2LEhh8sz1DoRFLHUiCeYYbMWISML1
 k2r1fq6opJeiiWkSRiQxkSso3uv4Hg4v6A/miP+ZmaH5HhuYsBBPzHn4JwSZ2JUK5hhh
 nHAQreP3t9c2Aj0HYhPgZ8QG8lhkNGT7tyvdGWWjlv0yNj4NbB+E9rqRFhv+LFUt1gz4
 dNVA==
X-Gm-Message-State: APjAAAUdMcvfF958uB7VGNhx5iArJUIRBzVkMQ1ud4nsTofMfOrmsISa
 Yw+d3QIDCK6uQgiUf3WrKMua15+O9YlTobFLiC4IPLke
X-Google-Smtp-Source: APXvYqy2GZpCglXvbYLgZBHVnuts2GjGG9FMnMJEDZrcmFcTX1F6EYSPadbyZ5TUSlKLzCW5J9JwFaiL6/m4AyZ2Gg4=
X-Received: by 2002:a02:ce92:: with SMTP id y18mr34222866jaq.40.1561257749692; 
 Sat, 22 Jun 2019 19:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190621162117.22533-1-krzk@kernel.org>
In-Reply-To: <20190621162117.22533-1-krzk@kernel.org>
From: Qiang Yu <yuq825@gmail.com>
Date: Sun, 23 Jun 2019 10:42:18 +0800
Message-ID: <CAKGbVbviu4i=KAA1cE5X0_du-FnaCzf5ekbmOCv9g8MWuai6vA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/lima: Mark 64-bit number as ULL to silence
 Smatch warning
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=cnFWOK8KBDczr/rYP2uNrysQXAIVz65G0LlKrMiXR+0=;
 b=qCkQmVpCurrWTAf7i+jAZr5wtWQfHkzFiDFJ01k89OP/MlzDfcOugjeIWZ19eudvjH
 YdPHpVFpWDIiWbu1tHy7nMZNv91uXhFrr9mg5UmO5O4W3yByuAKEnC38/9THElsSNgKt
 SnsyQHQgQZfzR750GKruPbZJPOUSxiconLsixDkNppIxP+phuVhF0H4dRPHvlkcOLhGj
 +ZNfqXKpLE3NE2znt6rZ6xcEyXTjfhrHHIU5CAkkchh0Q0J/wzcO6cgPnI/E+REKZ3QO
 wOuR8v6R/V4zxmVeoNuuIES1MhCNrVxhLqmOKSxdsJKIQLo0BoTWhAQjsj+BQMCeSV9M
 tEHg==
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
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, lima@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzLiBUaGlzIHBhdGNoIHNlcmllcyBhcmU6ClJldmlld2VkLWJ5OiBRaWFuZyBZdSA8eXVx
ODI1QGdtYWlsLmNvbT4KCkknbGwgYXBwbHkgdGhlbSB0byBkcm0tbWlzYy1uZXh0LgoKUmVnYXJk
cywKUWlhbmcKCk9uIFNhdCwgSnVuIDIyLCAyMDE5IGF0IDEyOjIxIEFNIEtyenlzenRvZiBLb3ps
b3dza2kgPGtyemtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBNYXJrIGxvbmcgbnVtYmVycyB3aXRo
IFVMTCB0byBzaWxlbmNlIHRoZSBTbWF0Y2ggd2FybmluZzoKPgo+ICAgICBkcml2ZXJzL2dwdS9k
cm0vbGltYS9saW1hX2RldmljZS5jOjMxNDozMjogd2FybmluZzogY29uc3RhbnQgMHgxMDAwMDAw
MDAgaXMgc28gYmlnIGl0IGlzIGxvbmcgbG9uZwo+Cj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9m
IEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgo+IFJldmlld2VkLWJ5OiBRaWFuZyBZdSA8eXVx
ODI1QGdtYWlsLmNvbT4KPgo+IC0tLQo+Cj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAxLiBBZGQgcmV2
aWV3ZWQtYnkgdGFnCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfdm0uaCB8IDQg
KystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfdm0uaCBiL2RyaXZlcnMv
Z3B1L2RybS9saW1hL2xpbWFfdm0uaAo+IGluZGV4IGNhZWUyZjhhMjliNC4uZTBiZGVkY2YxNGRk
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfdm0uaAo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfdm0uaAo+IEBAIC0xNSw5ICsxNSw5IEBACj4gICNkZWZp
bmUgTElNQV9WTV9OVU1fUFRfUEVSX0JUICgxIDw8IExJTUFfVk1fTlVNX1BUX1BFUl9CVF9TSElG
VCkKPiAgI2RlZmluZSBMSU1BX1ZNX05VTV9CVCAoTElNQV9QQUdFX0VOVF9OVU0gPj4gTElNQV9W
TV9OVU1fUFRfUEVSX0JUX1NISUZUKQo+Cj4gLSNkZWZpbmUgTElNQV9WQV9SRVNFUlZFX1NUQVJU
ICAweEZGRjAwMDAwCj4gKyNkZWZpbmUgTElNQV9WQV9SRVNFUlZFX1NUQVJUICAweDBGRkYwMDAw
MFVMTAo+ICAjZGVmaW5lIExJTUFfVkFfUkVTRVJWRV9ETEJVICAgTElNQV9WQV9SRVNFUlZFX1NU
QVJUCj4gLSNkZWZpbmUgTElNQV9WQV9SRVNFUlZFX0VORCAgICAweDEwMDAwMDAwMAo+ICsjZGVm
aW5lIExJTUFfVkFfUkVTRVJWRV9FTkQgICAgMHgxMDAwMDAwMDBVTEwKPgo+ICBzdHJ1Y3QgbGlt
YV9kZXZpY2U7Cj4KPiAtLQo+IDIuMTcuMQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
