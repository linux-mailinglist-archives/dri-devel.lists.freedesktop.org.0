Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD9D1090E0
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 16:16:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 459576E14B;
	Mon, 25 Nov 2019 15:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83C489E63;
 Mon, 25 Nov 2019 15:16:50 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id z10so18445468wrs.12;
 Mon, 25 Nov 2019 07:16:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jhdtl5esqr1oouba5Vga68joRb3d2BYdNhlaTCrtJsA=;
 b=W6FCa5y2u+UXEIlrMltg40gAIZLRAbo7NEPvloACwpQJwDVsEUi3l8BT6ATrsRFdrT
 cKfBHAs/6Z+3JkamuBgHKZB8szcpVJr1tuPJGQvyQMPrZA5d2zt9xFjaEAL8EXAC9RIJ
 H1Hk4XR3qX7IZqgBT7KLK4pTQRtm1ZWoM6c+lVctjGR8aYzN1YCp+1z+d4YrNkoaCv7V
 NbFXUqMCtaAVlklHXB41O62+fFpJltdKeLP0enmZKneUg3rGNxLoP+K0uwjSTmtl1pJA
 AovARJOwSBzVx69uEfEQlHSaBWEgZJHSNG7YS6xtQGFYJwgVoZyvYNZrh/CIp7hry2OF
 +GYw==
X-Gm-Message-State: APjAAAWD8J+CpNvp7cYEOpxCjXBIYEocJKvGBj8NwCPGeblV4TPDyBf3
 8B3cs2+dMRNVXgf8bNEhx22Dm4oSGMpfjaVi3fg=
X-Google-Smtp-Source: APXvYqxf9OB4XuHYFRVgJ92qEJPWbONU8mJwgyOpfTO7ay9+u7JYIKVTyhh+/cE0yKpuQWgW1hddoZ+CHA1i1imHVUo=
X-Received: by 2002:adf:f010:: with SMTP id j16mr33077254wro.206.1574695009196; 
 Mon, 25 Nov 2019 07:16:49 -0800 (PST)
MIME-Version: 1.0
References: <20191125145843.15764-1-yuehaibing@huawei.com>
In-Reply-To: <20191125145843.15764-1-yuehaibing@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Nov 2019 10:16:37 -0500
Message-ID: <CADnq5_Mn1vsXzEGA254spvhaAaW+Q4y20orjWBbz2doVCvbYrw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/powerplay: remove set but not used variable
 'stretch_amount2'
To: YueHaibing <yuehaibing@huawei.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=jhdtl5esqr1oouba5Vga68joRb3d2BYdNhlaTCrtJsA=;
 b=NlX9MLNxTpMm9Sqq1Qz/KIsTMoyor6q15lCpYtrm/uv+ku5+OyGfw8NXABmUm9Ff3p
 PXKq9PgOs+Hfxx4xqTeM0b/9UYZOvpyZrFFh6yIEhq1aJIDoonsNO/2ndK38JALo0NXX
 FIZAC9pXTiw60X89/gGCepZCcK8hUG/LC+R7nSQm9/F5vpnc20ZSY5iyhgEVZQVyl4bJ
 HnRHeKd1GLP2hD7Uk+gjAUipQvBJs+5oXoaWGCRDxq7zRKP05mR53fRKrPd5w/r27n1l
 18wzKoP6lITqPzOjLybMYcyH8JMasyuQclChiyX6SZ0mVk6qE6V9V9gma5LDFP3hyaQO
 GBBA==
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
Cc: Chen Wandun <chenwandun@huawei.com>, Dave Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Prike Liang <Prike.Liang@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, yu kuai <yukuai3@huawei.com>, "Quan,
 Evan" <evan.quan@amd.com>, Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMjUsIDIwMTkgYXQgMTA6MDAgQU0gWXVlSGFpYmluZyA8eXVlaGFpYmluZ0Bo
dWF3ZWkuY29tPiB3cm90ZToKPgo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3Bvd2Vy
cGxheS9zbXVtZ3IvdmVnYW1fc211bWdyLmM6Cj4gIEluIGZ1bmN0aW9uIHZlZ2FtX3BvcHVsYXRl
X2Nsb2NrX3N0cmV0Y2hlcl9kYXRhX3RhYmxlOgo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
Ly4uL3Bvd2VycGxheS9zbXVtZ3IvdmVnYW1fc211bWdyLmM6MTQ4OToyOToKPiAgd2FybmluZzog
dmFyaWFibGUgc3RyZXRjaF9hbW91bnQyIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1z
ZXQtdmFyaWFibGVdCj4KPiBJdCBpcyBuZXZlciB1c2VkLCBzbyBjYW4gYmUgcmVtb3ZlZC4KPgo+
IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KCkFwcGxp
ZWQuICB0aGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9zbXVtZ3IvdmVnYW1fc211bWdyLmMgfCAxMCArKysrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3ZlZ2FtX3NtdW1nci5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3ZlZ2FtX3NtdW1nci5jCj4gaW5kZXggNTA4OTZl
OS4uYjBlMGQ2NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9z
bXVtZ3IvdmVnYW1fc211bWdyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9zbXVtZ3IvdmVnYW1fc211bWdyLmMKPiBAQCAtMTQ4Niw3ICsxNDg2LDcgQEAgc3RhdGljIGlu
dCB2ZWdhbV9wb3B1bGF0ZV9jbG9ja19zdHJldGNoZXJfZGF0YV90YWJsZShzdHJ1Y3QgcHBfaHdt
Z3IgKmh3bWdyKQo+ICAgICAgICAgc3RydWN0IHZlZ2FtX3NtdW1nciAqc211X2RhdGEgPQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIChzdHJ1Y3QgdmVnYW1fc211bWdyICopKGh3bWdyLT5zbXVf
YmFja2VuZCk7Cj4KPiAtICAgICAgIHVpbnQ4X3QgaSwgc3RyZXRjaF9hbW91bnQsIHN0cmV0Y2hf
YW1vdW50Miwgdm9sdF9vZmZzZXQgPSAwOwo+ICsgICAgICAgdWludDhfdCBpLCBzdHJldGNoX2Ft
b3VudCwgdm9sdF9vZmZzZXQgPSAwOwo+ICAgICAgICAgc3RydWN0IHBobV9wcHRfdjFfaW5mb3Jt
YXRpb24gKnRhYmxlX2luZm8gPQo+ICAgICAgICAgICAgICAgICAgICAgICAgIChzdHJ1Y3QgcGht
X3BwdF92MV9pbmZvcm1hdGlvbiAqKShod21nci0+cHB0YWJsZSk7Cj4gICAgICAgICBzdHJ1Y3Qg
cGhtX3BwdF92MV9jbG9ja192b2x0YWdlX2RlcGVuZGVuY3lfdGFibGUgKnNjbGtfdGFibGUgPQo+
IEBAIC0xNTI1LDExICsxNTI1LDkgQEAgc3RhdGljIGludCB2ZWdhbV9wb3B1bGF0ZV9jbG9ja19z
dHJldGNoZXJfZGF0YV90YWJsZShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICh0YWJsZV9pbmZvLT5jYWNfZHRwX3RhYmxlLT51Y0NLU19MRE9fUkVGU0VM
ICE9IDApID8KPiAgICAgICAgICAgICAgICAgICAgICAgICB0YWJsZV9pbmZvLT5jYWNfZHRwX3Rh
YmxlLT51Y0NLU19MRE9fUkVGU0VMIDogNTsKPiAgICAgICAgIC8qIFBvcHVsYXRlIENLUyBMb29r
dXAgVGFibGUgKi8KPiAtICAgICAgIGlmIChzdHJldGNoX2Ftb3VudCA9PSAxIHx8IHN0cmV0Y2hf
YW1vdW50ID09IDIgfHwgc3RyZXRjaF9hbW91bnQgPT0gNSkKPiAtICAgICAgICAgICAgICAgc3Ry
ZXRjaF9hbW91bnQyID0gMDsKPiAtICAgICAgIGVsc2UgaWYgKHN0cmV0Y2hfYW1vdW50ID09IDMg
fHwgc3RyZXRjaF9hbW91bnQgPT0gNCkKPiAtICAgICAgICAgICAgICAgc3RyZXRjaF9hbW91bnQy
ID0gMTsKPiAtICAgICAgIGVsc2Ugewo+ICsgICAgICAgaWYgKCEoc3RyZXRjaF9hbW91bnQgPT0g
MSB8fCBzdHJldGNoX2Ftb3VudCA9PSAyIHx8Cj4gKyAgICAgICAgICAgICBzdHJldGNoX2Ftb3Vu
dCA9PSA1IHx8IHN0cmV0Y2hfYW1vdW50ID09IDMgfHwKPiArICAgICAgICAgICAgIHN0cmV0Y2hf
YW1vdW50ID09IDQpKSB7Cj4gICAgICAgICAgICAgICAgIHBobV9jYXBfdW5zZXQoaHdtZ3ItPnBs
YXRmb3JtX2Rlc2NyaXB0b3IucGxhdGZvcm1DYXBzLAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgUEhNX1BsYXRmb3JtQ2Fwc19DbG9ja1N0cmV0Y2hlcik7Cj4gICAgICAgICAgICAg
ICAgIFBQX0FTU0VSVF9XSVRIX0NPREUoZmFsc2UsCj4gLS0KPiAyLjcuNAo+Cj4KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGlu
ZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
