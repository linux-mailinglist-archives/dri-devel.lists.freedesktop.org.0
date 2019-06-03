Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 873E533F96
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E918895D7;
	Tue,  4 Jun 2019 07:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-x141.google.com (mail-it1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B3B8926E;
 Mon,  3 Jun 2019 14:55:10 +0000 (UTC)
Received: by mail-it1-x141.google.com with SMTP id l21so6007527ita.2;
 Mon, 03 Jun 2019 07:55:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xsEOBXElqhiPtz7ujLSby/eJv/lO2FYQtSB33qcd3KA=;
 b=FkHGwq/LkkQkoVts/xHlpILIPWNwyT1CAB9BnXYFRZ016eBW6+jvN0KUENyuCncjL1
 TRrsrGoUF+PR9hLmtV2gqHHChTJaM4L23/Z9JlXqlTP8YIBR0vvDtACUZ+nY1yq5mzim
 dz/35n3/WDvOnalAmpL0LT0NlCMZGKF+iAHpfJbTQYZUk0WA+zfZ4YumV3CFX51nDnFQ
 iSmSPRoLpP/ObqU+tDzptbON8tGDhdXgalbyQwqnp2jhQ+o7zJnH+wolDNvM6K28uoBh
 I/fHoKVFAhQUCOWw32vQKSH+IYGCBOlpU6Bme4UOTiGxXHlXxJzu0FXRDJYiNct+FwFq
 VG/g==
X-Gm-Message-State: APjAAAV7lboarcnJF1lbty02ugfz51l/2omKc1YdVKxeDjgjlBgzuUBK
 5V4//BWpEiVQ9wPivR9+YqzccqiIwuf5CD4TDrI=
X-Google-Smtp-Source: APXvYqzgoaDqOAlH4O3yZ/Aq0odWtMFHQ9rblzkFb8yLmdl6SfPzGLwUQYuj3T0B6y8+Ps7k3vTgKlFr3esVREC7zSo=
X-Received: by 2002:a24:6c4a:: with SMTP id w71mr18344516itb.128.1559573710375; 
 Mon, 03 Jun 2019 07:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190531094619.31704-1-masneyb@onstation.org>
 <20190531094619.31704-3-masneyb@onstation.org>
In-Reply-To: <20190531094619.31704-3-masneyb@onstation.org>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Mon, 3 Jun 2019 08:54:59 -0600
Message-ID: <CAOCk7NppkmSPrfVRAbDnmV=RQ5Rcn4d3xSKZND50gRTG=1K_kg@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] drm/msm: add support for per-CRTC max_vblank_count
 on mdp5
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Approved-At: Tue, 04 Jun 2019 07:14:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=xsEOBXElqhiPtz7ujLSby/eJv/lO2FYQtSB33qcd3KA=;
 b=KEq0piI8pSiwFLF6xpIp/12a91YxRmspnkT43Ts1vAzOP+q9T95ISzvaLbYlmeufYN
 Cty7OllMwbmKaitSsxQoI2yjz3WIp+DMdaR6wM+GQKx3N/gmjk5Z/OfFmCEB7DPoHNGc
 9yut64uKeQPtcLL1mx5j6SfpD+Vy+p8/5Wmh7DLuWc8Ozq7z7IUnxnKIQQDmrhCab2a4
 BeroVPXWl+wewfa2ZO7X/QVKaIJLFo035Bb9vpRxMmoJ1jXAhpvJMkdx0D4r1xgeQ4s5
 Y7mQX2YSrANOlIdIqUfQT06QcunPShV4cdTbJGuGrLX6izqCLtJBdE5DAFRwotaZ/7Wf
 1m8w==
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
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 Dave Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMzEsIDIwMTkgYXQgMzo0NiBBTSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25z
dGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBUaGUgbWRwNSBkcm0va21zIGRyaXZlciBjdXJyZW50bHkg
ZG9lcyBub3Qgd29yayBvbiBjb21tYW5kLW1vZGUgRFNJCj4gcGFuZWxzIGR1ZSB0byAndmJsYW5r
IHdhaXQgdGltZWQgb3V0JyBlcnJvcnMuIFRoaXMgY2F1c2VzIGEgbGF0ZW5jeQo+IG9mIHNlY29u
ZHMsIG9yIHRlbnMgb2Ygc2Vjb25kcyBpbiBzb21lIGNhc2VzLCBiZWZvcmUgY29udGVudCBpcyBz
aG93bgo+IG9uIHRoZSBwYW5lbC4gVGhpcyBoYXJkd2FyZSBkb2VzIG5vdCBoYXZlIHRoZSBzb21l
dGhpbmcgdGhhdCB3ZSBjYW4gdXNlCj4gYXMgYSBmcmFtZSBjb3VudGVyIGF2YWlsYWJsZSB3aGVu
IHJ1bm5pbmcgaW4gY29tbWFuZCBtb2RlLCBzbyB3ZSBuZWVkIHRvCj4gZmFsbCBiYWNrIHRvIHVz
aW5nIHRpbWVzdGFtcHMgYnkgc2V0dGluZyB0aGUgbWF4X3ZibGFua19jb3VudCB0byB6ZXJvLgo+
IFRoaXMgY2FuIGJlIGRvbmUgb24gYSBwZXItQ1JUQyBiYXNpcywgc28gdGhlIGNvbnZlcnQgbWRw
NSB0byB1c2UKPiBkcm1fY3J0Y19zZXRfbWF4X3ZibGFua19jb3VudCgpLgo+Cj4gVGhpcyBjaGFu
Z2Ugd2FzIHRlc3RlZCBvbiBhIExHIE5leHVzIDUgKGhhbW1lcmhlYWQpIHBob25lLgo+Cj4gU2ln
bmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxtYXNuZXliQG9uc3RhdGlvbi5vcmc+Cj4gU3VnZ2Vz
dGVkLWJ5OiBKZWZmcmV5IEh1Z28gPGplZmZyZXkubC5odWdvQGdtYWlsLmNvbT4KClJldmlld2Vk
LWJ5OiBKZWZmcmV5IEh1Z28gPGplZmZyZXkubC5odWdvQGdtYWlsLmNvbT4KCj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfY3J0Yy5jIHwgMTYgKysrKysrKysrKysr
KysrLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jICB8ICAyICst
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2NydGMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfY3J0Yy5jCj4gaW5kZXggYzM3NTFj
OTViNDUyLi42ZmRlMTA5Nzg0NGYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL21kcDUvbWRwNV9jcnRjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRw
NS9tZHA1X2NydGMuYwo+IEBAIC00NTAsNiArNDUwLDE4IEBAIHN0YXRpYyB2b2lkIG1kcDVfY3J0
Y19hdG9taWNfZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4gICAgICAgICBtZHA1X2Ny
dGMtPmVuYWJsZWQgPSBmYWxzZTsKPiAgfQo+Cj4gK3N0YXRpYyB2b2lkIG1kcDVfY3J0Y192Ymxh
bmtfb24oc3RydWN0IGRybV9jcnRjICpjcnRjKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgbWRwNV9j
cnRjX3N0YXRlICptZHA1X2NzdGF0ZSA9IHRvX21kcDVfY3J0Y19zdGF0ZShjcnRjLT5zdGF0ZSk7
Cj4gKyAgICAgICBzdHJ1Y3QgbWRwNV9pbnRlcmZhY2UgKmludGYgPSBtZHA1X2NzdGF0ZS0+cGlw
ZWxpbmUuaW50ZjsKPiArICAgICAgIHUzMiBjb3VudDsKPiArCj4gKyAgICAgICBjb3VudCA9IGlu
dGYtPm1vZGUgPT0gTURQNV9JTlRGX0RTSV9NT0RFX0NPTU1BTkQgPyAwIDogMHhmZmZmZmZmZjsK
PiArICAgICAgIGRybV9jcnRjX3NldF9tYXhfdmJsYW5rX2NvdW50KGNydGMsIGNvdW50KTsKPiAr
Cj4gKyAgICAgICBkcm1fY3J0Y192Ymxhbmtfb24oY3J0Yyk7Cj4gK30KPiArCj4gIHN0YXRpYyB2
b2lkIG1kcDVfY3J0Y19hdG9taWNfZW5hYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm9s
ZF9zdGF0ZSkKPiAgewo+IEBAIC00ODYsNyArNDk4LDcgQEAgc3RhdGljIHZvaWQgbWRwNV9jcnRj
X2F0b21pY19lbmFibGUoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+ICAgICAgICAgfQo+Cj4gICAg
ICAgICAvKiBSZXN0b3JlIHZibGFuayBpcnEgaGFuZGxpbmcgYWZ0ZXIgcG93ZXIgaXMgZW5hYmxl
ZCAqLwo+IC0gICAgICAgZHJtX2NydGNfdmJsYW5rX29uKGNydGMpOwo+ICsgICAgICAgbWRwNV9j
cnRjX3ZibGFua19vbihjcnRjKTsKPgo+ICAgICAgICAgbWRwNV9jcnRjX21vZGVfc2V0X25vZmIo
Y3J0Yyk7Cj4KPiBAQCAtMTAzOSw2ICsxMDUxLDggQEAgc3RhdGljIHZvaWQgbWRwNV9jcnRjX3Jl
c2V0KHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKPiAgICAgICAgICAgICAgICAgbWRwNV9jcnRjX2Rl
c3Ryb3lfc3RhdGUoY3J0YywgY3J0Yy0+c3RhdGUpOwo+Cj4gICAgICAgICBfX2RybV9hdG9taWNf
aGVscGVyX2NydGNfcmVzZXQoY3J0YywgJm1kcDVfY3N0YXRlLT5iYXNlKTsKPiArCj4gKyAgICAg
ICBkcm1fY3J0Y192YmxhbmtfcmVzZXQoY3J0Yyk7Cj4gIH0KPgo+ICBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRybV9jcnRjX2Z1bmNzIG1kcDVfY3J0Y19mdW5jcyA9IHsKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9tZHA1L21kcDVfa21zLmMKPiBpbmRleCA5NzE3OWJlYzg5MDIuLmZjYjBiMDQ1NWFi
ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYwo+IEBAIC03
NTAsNyArNzUwLDcgQEAgc3RydWN0IG1zbV9rbXMgKm1kcDVfa21zX2luaXQoc3RydWN0IGRybV9k
ZXZpY2UgKmRldikKPiAgICAgICAgIGRldi0+ZHJpdmVyLT5nZXRfdmJsYW5rX3RpbWVzdGFtcCA9
IGRybV9jYWxjX3ZibHRpbWVzdGFtcF9mcm9tX3NjYW5vdXRwb3M7Cj4gICAgICAgICBkZXYtPmRy
aXZlci0+Z2V0X3NjYW5vdXRfcG9zaXRpb24gPSBtZHA1X2dldF9zY2Fub3V0cG9zOwo+ICAgICAg
ICAgZGV2LT5kcml2ZXItPmdldF92YmxhbmtfY291bnRlciA9IG1kcDVfZ2V0X3ZibGFua19jb3Vu
dGVyOwo+IC0gICAgICAgZGV2LT5tYXhfdmJsYW5rX2NvdW50ID0gMHhmZmZmZmZmZjsKPiArICAg
ICAgIGRldi0+bWF4X3ZibGFua19jb3VudCA9IDA7IC8qIG1heF92YmxhbmtfY291bnQgaXMgc2V0
IG9uIGVhY2ggQ1JUQyAqLwo+ICAgICAgICAgZGV2LT52YmxhbmtfZGlzYWJsZV9pbW1lZGlhdGUg
PSB0cnVlOwo+Cj4gICAgICAgICByZXR1cm4ga21zOwo+IC0tCj4gMi4yMC4xCj4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
