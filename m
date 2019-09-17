Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 988CAB4620
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 05:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635D16EADE;
	Tue, 17 Sep 2019 03:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680256EADE;
 Tue, 17 Sep 2019 03:47:37 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id d126so423619vkf.7;
 Mon, 16 Sep 2019 20:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FT/RIUdTYxoXufKJ81lJj05PHESdGDcpbUXpHI2B1IA=;
 b=mIuiMe+rxgYpQl1zwk3mhBxzsWjIAgSxJZ0LC7BWwl9CilX3BStMsjQNSCKGS3MSX3
 MqNAqmlXV9XkMpSYvoU78o+LKn/Ma4QlinGy/ox//Ev3NP0ks4Yu4jRtsurH5qo3keQm
 +Bz2uLZdmVCIPjz7y30XLWPMQXycf5IUSPhvlzA9PfbcG0uKKdUUTHV7DHX7ZtQbRvre
 LIwaM/c2U5HnSwoxtQy/ECKzsiNZjl5EjOlJ9dMvLQaVdKWQkPr7X6/EPdzULXM7gN2C
 zCSntAHwSzwBgX+V3p+UpfCDhm6lGWyTIE8/hI9c+ro/Di3eEFPga/5nNtafSLRM+LiQ
 cC1g==
X-Gm-Message-State: APjAAAVGEOQwH6hc7QajsHGj3psNwytT4qzu3Ub0eMoRjdczXwXvKjFZ
 87Vv+lv/mL6OUJrG+DVXUnU+J7OFlUTiJ6OYoZc=
X-Google-Smtp-Source: APXvYqykNU9g41hbEQoh7m+VCK0ArMrxnq4U2lU3lrZdej0jN1jDO16i1ofYDoBThSzGXf0LRHNOmglm2XynLtaW7kw=
X-Received: by 2002:a1f:d642:: with SMTP id n63mr516309vkg.34.1568692056375;
 Mon, 16 Sep 2019 20:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190916151757.10953-1-thierry.reding@gmail.com>
 <20190916151757.10953-2-thierry.reding@gmail.com>
In-Reply-To: <20190916151757.10953-2-thierry.reding@gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Tue, 17 Sep 2019 13:47:25 +1000
Message-ID: <CACAvsv70b1-LJoaP1ZL2hvy9xMcO1WXqh0ibGzNfpB81ybgrTg@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 1/6] drm/nouveau: fault: Store aperture in fault
 information
To: Thierry Reding <thierry.reding@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=FT/RIUdTYxoXufKJ81lJj05PHESdGDcpbUXpHI2B1IA=;
 b=epw7Vv/GATkuy7oTB/jE3+wXbecbH7G3z4pjzesHgpd4wnJJHThBH1D4LnbZ1uwp6I
 9bLvfVqGZpo7rg5j0HC/wVFbtpREZ8E38opxxT2t0kalGbaoTp9LKyj0WTSdPgVPAVP+
 bN9lh8P4GBohbVWT0uhx4iDqAFkCEbkXJiG9S9x+S1t2plPrz2b/3QRKaLXfDioXBrWb
 D8uP1ROYAQkcgRG16AexMvb14AO78ZALKNhZ2k9jL5LlIOoKRaf0BlixFSL10ZSwwDUQ
 vRfY+MDP2dcnynPQIQ0VJLijPlw0dYMfUVnYgI+iRn2HIWupmeJCnsZmTCchLcYQxem9
 m0eA==
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxNyBTZXAgMjAxOSBhdCAwMToxOCwgVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVk
aW5nQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0Bu
dmlkaWEuY29tPgo+Cj4gVGhlIGZhdWx0IGluZm9ybWF0aW9uIHJlZ2lzdGVyIGNvbnRhaW5zIGRh
dGEgYWJvdXQgdGhlIGFwZXJ0dXJlIHRoYXQKPiBjYXVzZWQgdGhlIGZhaWx1cmUuIFRoaXMgY2Fu
IGJlIHVzZWZ1bCBpbiBkZWJ1Z2dpbmcgYXBlcnR1cmUgcmVsYXRlZAo+IHByb2dyYW1taW5nIGJ1
Z3MuClNob3VsZCB0aGlzIGJlIHBhcnNlZCBmb3IgZmF1bHQgYnVmZmVyIGVudHJpZXMgdG9vPwoK
Pgo+IFNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9zdWJkZXYvZmF1bHQu
aCB8IDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9maWZvL2drMTA0
LmMgICAgfCAzICsrLQo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9mYXVs
dC9ndjEwMC5jICAgfCAxICsKPiAgMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9pbmNs
dWRlL252a20vc3ViZGV2L2ZhdWx0LmggYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9pbmNsdWRl
L252a20vc3ViZGV2L2ZhdWx0LmgKPiBpbmRleCA5NzMyMmY5NWIzZWUuLjFjYzg2MmJjMTEyMiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9pbmNsdWRlL252a20vc3ViZGV2
L2ZhdWx0LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9pbmNsdWRlL252a20vc3Vi
ZGV2L2ZhdWx0LmgKPiBAQCAtMjEsNiArMjEsNyBAQCBzdHJ1Y3QgbnZrbV9mYXVsdF9kYXRhIHsK
PiAgICAgICAgIHU2NCAgYWRkcjsKPiAgICAgICAgIHU2NCAgaW5zdDsKPiAgICAgICAgIHU2NCAg
dGltZTsKPiArICAgICAgIHU4IGFwZXJ0dXJlOwo+ICAgICAgICAgdTggZW5naW5lOwo+ICAgICAg
ICAgdTggIHZhbGlkOwo+ICAgICAgICAgdTggICAgZ3BjOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9maWZvL2drMTA0LmMgYi9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9udmttL2VuZ2luZS9maWZvL2drMTA0LmMKPiBpbmRleCA1ZDRiNjk1Y2FiOGUu
LjgxY2JlMWNjNDgwNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmtt
L2VuZ2luZS9maWZvL2drMTA0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmtt
L2VuZ2luZS9maWZvL2drMTA0LmMKPiBAQCAtNTE5LDkgKzUxOSwxMCBAQCBnazEwNF9maWZvX2Zh
dWx0KHN0cnVjdCBudmttX2ZpZm8gKmJhc2UsIHN0cnVjdCBudmttX2ZhdWx0X2RhdGEgKmluZm8p
Cj4gICAgICAgICBjaGFuID0gbnZrbV9maWZvX2NoYW5faW5zdF9sb2NrZWQoJmZpZm8tPmJhc2Us
IGluZm8tPmluc3QpOwo+Cj4gICAgICAgICBudmttX2Vycm9yKHN1YmRldiwKPiAtICAgICAgICAg
ICAgICAgICAgImZhdWx0ICUwMnggWyVzXSBhdCAlMDE2bGx4IGVuZ2luZSAlMDJ4IFslc10gY2xp
ZW50ICUwMnggIgo+ICsgICAgICAgICAgICAgICAgICAiZmF1bHQgJTAyeCBbJXNdIGF0ICUwMTZs
bHggYXBlcnR1cmUgJTAyeCBlbmdpbmUgJTAyeCBbJXNdIGNsaWVudCAlMDJ4ICIKPiAgICAgICAg
ICAgICAgICAgICAgIlslcyVzXSByZWFzb24gJTAyeCBbJXNdIG9uIGNoYW5uZWwgJWQgWyUwMTBs
bHggJXNdXG4iLAo+ICAgICAgICAgICAgICAgICAgICBpbmZvLT5hY2Nlc3MsIGVhID8gZWEtPm5h
bWUgOiAiIiwgaW5mby0+YWRkciwKPiArICAgICAgICAgICAgICAgICAgaW5mby0+YXBlcnR1cmUs
Cj4gICAgICAgICAgICAgICAgICAgIGluZm8tPmVuZ2luZSwgZWUgPyBlZS0+bmFtZSA6IGVuLAo+
ICAgICAgICAgICAgICAgICAgICBpbmZvLT5jbGllbnQsIGN0LCBlYyA/IGVjLT5uYW1lIDogIiIs
Cj4gICAgICAgICAgICAgICAgICAgIGluZm8tPnJlYXNvbiwgZXIgPyBlci0+bmFtZSA6ICIiLCBj
aGFuID8gY2hhbi0+Y2hpZCA6IC0xLAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9udmttL3N1YmRldi9mYXVsdC9ndjEwMC5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bnZrbS9zdWJkZXYvZmF1bHQvZ3YxMDAuYwo+IGluZGV4IDY3NDdmMDljMmRjMy4uYjVlMzIyOTUy
MzdiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Zh
dWx0L2d2MTAwLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9m
YXVsdC9ndjEwMC5jCj4gQEAgLTEzOCw2ICsxMzgsNyBAQCBndjEwMF9mYXVsdF9pbnRyX2ZhdWx0
KHN0cnVjdCBudmttX2ZhdWx0ICpmYXVsdCkKPiAgICAgICAgIGluZm8uaW5zdCA9ICgodTY0KWlu
c3RoaSA8PCAzMikgfCAoaW5mbzAgJiAweGZmZmZmMDAwKTsKPiAgICAgICAgIGluZm8udGltZSA9
IDA7Cj4gICAgICAgICBpbmZvLmVuZ2luZSA9IChpbmZvMCAmIDB4MDAwMDAwZmYpOwo+ICsgICAg
ICAgaW5mby5hcGVydHVyZSA9IChpbmZvMCAmIDB4MDAwMDBjMDApID4+IDEwOwo+ICAgICAgICAg
aW5mby52YWxpZCAgPSAoaW5mbzEgJiAweDgwMDAwMDAwKSA+PiAzMTsKPiAgICAgICAgIGluZm8u
Z3BjICAgID0gKGluZm8xICYgMHgxZjAwMDAwMCkgPj4gMjQ7Cj4gICAgICAgICBpbmZvLmh1YiAg
ICA9IChpbmZvMSAmIDB4MDAxMDAwMDApID4+IDIwOwo+IC0tCj4gMi4yMy4wCj4KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IE5vdXZlYXUgbWFpbGlu
ZyBsaXN0Cj4gTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
