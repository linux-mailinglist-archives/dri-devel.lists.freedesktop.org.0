Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7270DEDA0D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 08:43:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDAA6E13B;
	Mon,  4 Nov 2019 07:43:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5346E13B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 07:43:19 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id t4so2098974otr.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Nov 2019 23:43:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KnN2X+Z56m8inPVIEyg78tY9xFg8wm5xX3rrWjSXm00=;
 b=YHIWtvnjBCD/wwUB//qU3IV7C+R9T0PSJdmFW/awe5Ib0LHTyr1DqRmYqypnegjx9B
 HmUpaBjiWKJ7YbYManDGkeR3oOtcr5LZKGoyvFlkfWLWFER5TRgd5PV76EgU2Pi2NVZI
 pEB8Qme3AKAPWbEDOrBWDczQ9XjHJwRZpHRv5s5na6rQKxD62ySaxUoNjA1Xfu6Lf4DV
 d1x5szioCW+YWQ6Et6SnEDefsyHIBikF65pR1annea1v7snSdunb3W4GzwX7CHFBrvcv
 y9xyuW2eIrEM2trdpTN5flOOSH1fhSHAVmkKZiQFjjZ6Cyb9o0hOu4sv19iKvhozUOat
 OTNA==
X-Gm-Message-State: APjAAAVtcGbzJjYiaRUzIrgg8TQH6VPiyYgEOY2nxW2rbQ0oCbgc1I+N
 9dK5/YEoG8jHOvQqGHqQJxVcE34JkneBQvUEi78=
X-Google-Smtp-Source: APXvYqym9VCu2o7HdGZJ4onW/M0U57nIZAzdSu2nWmiH9jlxJelFjPY7QurfIWeAM7vQ6DoHtaIviAs1Q+0ScdiDkkI=
X-Received: by 2002:a05:6830:210e:: with SMTP id
 i14mr3502735otc.250.1572853399036; 
 Sun, 03 Nov 2019 23:43:19 -0800 (PST)
MIME-Version: 1.0
References: <20190927094708.11563-1-geert@linux-m68k.org>
In-Reply-To: <20190927094708.11563-1-geert@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Nov 2019 08:43:07 +0100
Message-ID: <CAMuHMdW7fkPjqppQYESDf4ZLKcCrxhMUyCn0=tm6kxPSxf5mGA@mail.gmail.com>
Subject: Re: [PATCH v2] fbdev: c2p: Fix link failure on non-inlining
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQmFydGxvbWllaiwgQW5kcmV3LAoKT24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMTE6NDcgQU0g
R2VlcnQgVXl0dGVyaG9ldmVuCjxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4gV2hlbiB0
aGUgY29tcGlsZXIgZGVjaWRlcyBub3QgdG8gaW5saW5lIHRoZSBDaHVua3ktdG8tUGxhbmFyIGNv
cmUKPiBmdW5jdGlvbnMsIHRoZSBidWlsZCBmYWlscyB3aXRoOgo+Cj4gICAgIGMycF9wbGFuYXIu
YzooLnRleHQrMHhkNik6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGMycF91bnN1cHBvcnRlZCcK
PiAgICAgYzJwX3BsYW5hci5jOigudGV4dCsweDFkYyk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8g
YGMycF91bnN1cHBvcnRlZCcKPiAgICAgYzJwX2lwbGFuMi5jOigudGV4dCsweGM0KTogdW5kZWZp
bmVkIHJlZmVyZW5jZSB0byBgYzJwX3Vuc3VwcG9ydGVkJwo+ICAgICBjMnBfaXBsYW4yLmM6KC50
ZXh0KzB4MTUwKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgYzJwX3Vuc3VwcG9ydGVkJwo+Cj4g
Rml4IHRoaXMgYnkgbWFya2luZyB0aGUgZnVuY3Rpb25zIF9fYWx3YXlzX2lubGluZS4KPgo+IFdo
aWxlIHRoaXMgY291bGQgYmUgdHJpZ2dlcmVkIGJlZm9yZSBieSBtYW51YWxseSBlbmFibGluZyBi
b3RoCj4gQ09ORklHX09QVElNSVpFX0lOTElOSU5HIGFuZCBDT05GSUdfQ0NfT1BUSU1JWkVfRk9S
X1NJWkUsIGl0IHdhcyBleHBvc2VkCj4gaW4gdGhlIG02OGsgZGVmY29uZmlnIGJ5IGNvbW1pdCBh
YzdjM2U0ZmY0MDFiMzA0ICgiY29tcGlsZXI6IGVuYWJsZQo+IENPTkZJR19PUFRJTUlaRV9JTkxJ
TklORyBmb3JjaWJseSIpLgo+Cj4gRml4ZXM6IDkwMTJkMDExNjYwZWE1Y2YgKCJjb21waWxlcjog
YWxsb3cgYWxsIGFyY2hlcyB0byBlbmFibGUgQ09ORklHX09QVElNSVpFX0lOTElOSU5HIikKPiBS
ZXBvcnRlZC1ieTogbm9yZXBseUBlbGxlcm1hbi5pZC5hdQo+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0
IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+Cj4gUmV2aWV3ZWQtYnk6IE1hc2Fo
aXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+Cj4gLS0tCj4gVGhpcyBp
cyBhIGZpeCBmb3IgdjUuNC1yYzEuCgpDYW4geW91IHBsZWFzZSBhcHBseSB0aGlzIGZvciB2NS40
PwpUaGlzIGlzIG9uZSBvZiB0aGUgNCByZW1haW5pbmcgYnVpbGQgcmVncmVzc2lvbnMsIGNvbXBh
cmVkIHRvIHY1LjMuCgpUaGFua3MhCgo+IHYyOgo+ICAgLSBBZGQgUmV2aWV3ZWQtYnksCj4gICAt
IEZpeCBGaXhlcywKPiAgIC0gQWRkIG1vcmUgZXhwbGFuYXRpb24uCgpHcntvZXRqZSxlZXRpbmd9
cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVu
IC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhr
Lm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkg
Y2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3Rz
IEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
