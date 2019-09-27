Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EA0C06A0
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 15:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ADFC6E250;
	Fri, 27 Sep 2019 13:47:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C866E250
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 13:47:53 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8RDlo3s024629;
 Fri, 27 Sep 2019 08:47:50 -0500
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8RDloI0078270
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 27 Sep 2019 08:47:50 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 27
 Sep 2019 08:47:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 27 Sep 2019 08:47:49 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RDllhi057353;
 Fri, 27 Sep 2019 08:47:47 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To: Adam Ford <aford173@gmail.com>
References: <20190510194229.20628-1-aford173@gmail.com>
 <af325707-3e42-493d-e858-77878ef06138@ti.com>
 <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
 <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com>
 <CAHCN7xJexJvh71vyb31ETgo=n_y_CupHH-AZwVK9mZe3GzJfEQ@mail.gmail.com>
 <845055e2-8182-de74-2077-629fdf50ac6c@ti.com>
 <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com>
 <854f6130-c8a8-81cb-aa76-4830f218ae54@ti.com>
 <CAHCN7xKocdiWOdmoWQV3POr84qte6WNt0QbQRAwxKSvU8COB_w@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <0473526e-df0a-94a5-5c22-debd0084ab16@ti.com>
Date: Fri, 27 Sep 2019 16:47:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHCN7xKocdiWOdmoWQV3POr84qte6WNt0QbQRAwxKSvU8COB_w@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569592070;
 bh=OykXQx53deEXmss9utfaaw/zCo/WLHB0gvMxBBwRQUI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Iv7sO60PsxEaPOH9/xlGtO/Lkwm3f4eRoBY8Tz7Zp/QlLO9lspYfS8lZ6nSw4YxWX
 XZAWQGVTO1FkJEiqqAFoVC8c2FRbRZB1K3m2zRUNmpA2GFhRB1GW4VUx1qLuIRLzi7
 w+jaAOM+DcryNMIOMyIwm48SQM5Sde5DskEo41CI=
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
Cc: devicetree <devicetree@vger.kernel.org>, Tony Lindgren <tony@atomide.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tero Kristo <t-kristo@ti.com>,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Adam Ford <adam.ford@logicpd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjcvMDkvMjAxOSAxNTozMywgQWRhbSBGb3JkIHdyb3RlOgoKPj4gSXQgbG9va3MgbGlrZSBh
IGJ1ZyBpbiBvbWFwIGNsb2NrIGhhbmRsaW5nLgo+Pgo+PiBEU1MgdXNlcyBkc3MxX2Fsd29uX2Zj
a18zNDMwZXMyIGFzIGZjbGsuIGRzczFfYWx3b25fZmNrXzM0MzBlczIgY29tZXMKPj4gZnJvbSBk
cGxsNF9jaywgYW5kIHRoZXJlJ3MgYSBkaXZpZGVyIGFmdGVyIHRoZSBQTEwsIGRwbGw0X200X2Nr
Lgo+Pgo+PiBXaGVuIHRoZSBEU1MgZHJpdmVyIHNldHMgZHNzMV9hbHdvbl9mY2tfMzQzMGVzMiBy
YXRlIHRvIDI3MDAwMDAwIG9yCj4+IDI3ODcwOTY3LCB3aGljaCBjYW4gYmUgY3JlYXRlZCB3aXRo
IG00IGRpdmlkZXJzIDMyIGFuZCAzMSwgaXQgbG9va3MgbGlrZQo+PiB0aGUgZGl2aWRlciBnb2Vz
IHRvIGJ5cGFzcywgb3IgdG8gYSB2ZXJ5IHNtYWxsIHZhbHVlLiBEU1MgZ2V0cyBhIHZlcnkKPj4g
aGlnaCBjbG9jayByYXRlIGFuZCBicmVha3MgZG93bi4KPiAKPiBJcyB0aGVyZSBhbnl0aGluZyBJ
IGNhbiBkbyB0byBoZWxwIHRyb3VibGVzaG9vdCB0aGlzPyAgSSBjb3VsZCBpbnNlcnQKPiBhIGhh
Y2sgdGhhdCBjaGVja3MgaWYgd2UncmUgb21hcDMgYW5kIGlmIHNvIG1ha2UgdGhlIGRpdmlkZXIg
ZXF1YWwgdG8KPiA0LCBidXQgdGhhdCBzZWVtcyBsaWtlIGp1c3QgYSBoYWNrLgo+IEkgY2FuIHJ1
biBtb3JlIHRlc3RzIG9yIGluc2VydCBjb2RlIHNvbWV3aGVyZSBpZiB5b3Ugd2FudC4KCkkgdGhp
bmsgaXQncyB1cCB0byBzb21lb25lIHdobydzIGtub3dsZWRnZWFibGUgaW4gb21hcCBjbG9jayBm
cmFtZXdvcmsuIApJJ20ga2luZCBvZiBob3BpbmcgdGhhdCBUZXJvIG9yIFRvbnkgd291bGQgYmUg
d2lsbGluZyB0byBkZWJ1ZyA9KS4gSSBjYW4gCnRyeSB0byBmaW5kIHRpbWUgdG8gZGVidWcgdGhl
IG9tYXAgY2xrIGZyYW1ld29yaywgYnV0IEknbGwgYmUgZ29pbmcgb24gCmJsaW5kbHkgdGhlcmUu
CgogIFRvbWkKCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1
IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290
aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
