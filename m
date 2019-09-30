Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED328C221D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 15:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CE16E02F;
	Mon, 30 Sep 2019 13:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44AA489CE1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 13:35:46 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UDZf9u011071;
 Mon, 30 Sep 2019 08:35:41 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UDZfEs098810;
 Mon, 30 Sep 2019 08:35:41 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 08:35:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 08:35:31 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UDZchM021644;
 Mon, 30 Sep 2019 08:35:39 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To: Adam Ford <aford173@gmail.com>, Tero Kristo <t-kristo@ti.com>
References: <20190510194229.20628-1-aford173@gmail.com>
 <af325707-3e42-493d-e858-77878ef06138@ti.com>
 <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
 <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com>
 <CAHCN7xJexJvh71vyb31ETgo=n_y_CupHH-AZwVK9mZe3GzJfEQ@mail.gmail.com>
 <845055e2-8182-de74-2077-629fdf50ac6c@ti.com>
 <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com>
 <854f6130-c8a8-81cb-aa76-4830f218ae54@ti.com>
 <CAHCN7xKocdiWOdmoWQV3POr84qte6WNt0QbQRAwxKSvU8COB_w@mail.gmail.com>
 <0473526e-df0a-94a5-5c22-debd0084ab16@ti.com>
 <36369388-e9c8-22cd-8c19-e2bdf2d0389b@ti.com>
 <eb2eb1f6-3c9b-7ecb-667e-819033af9c14@ti.com>
 <23eba53a-9304-2ceb-d97e-01891ec0b3ed@ti.com>
 <cb028b1e-05ca-9b22-be5d-c63f5fd56cc4@ti.com>
 <CAHCN7xLKL42ib4t0Lte3sJPoJrKX0TPJR9VWi+uW=fZjUg1ssg@mail.gmail.com>
 <c816d70d-fa5b-a43f-ae7a-6df4589fe484@ti.com>
 <CAHCN7xKKNpQwWZkg-JBncp9=VOcLJFEkcvST=rZqv-i9+5_Q2g@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <d2bec234-be61-5ac1-2899-63d29660a80c@ti.com>
Date: Mon, 30 Sep 2019 16:35:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHCN7xKKNpQwWZkg-JBncp9=VOcLJFEkcvST=rZqv-i9+5_Q2g@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569850542;
 bh=xYtWnenhn+eca6d4SA4M0SG+A6mLvTWAfgkIW6YBQQM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=WjH1Aciw+tVEjXn2qPbglCYcdOquSVCC3r3PJpSyC8eATl7UOK9e9hvRStxhh3FEv
 8vhsTpJ7xszdzLsKQnqRi0HKn/Ne2bVtmI+g5QE/ccQ0xGN5WT4MYU6xbJ+en6Rm0n
 B9HbBDHgTFv0Pc9JEoiwKjmvLg1SxuvGZpI1SY3k=
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Adam Ford <adam.ford@logicpd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMzAvMDkvMjAxOSAxNjoxNywgQWRhbSBGb3JkIHdyb3RlOgoKPj4+IEl0IGxvb2tzIGxpa2Ug
aXQncyB1bmhhcHB5IHRoYXQgaXRzIHRyeWluZyB0byBnZXQgb25lIGZyZXF1ZW5jeSBhbmQKPj4+
IGdldHRpbmcgc29tZXRoaW5nIGRpZmZlcmVudCBpbnN0ZWFkLgo+Pj4KPj4+IFsgICAxMC4wMTQw
OTldIFdBUk5JTkc6IENQVTogMCBQSUQ6IDExMSBhdAo+Pj4gZHJpdmVycy9ncHUvZHJtL29tYXBk
cm0vZHNzL2Rzcy5jOjY1NSBkc3Nfc2V0X2Zja19yYXRlKzB4NzAvMHg5MAo+Pj4gW29tYXBkc3Nd
Cj4+PiBbICAgMTAuMDE0MTI5XSBjbGsgcmF0ZSBtaXNtYXRjaDogMjc4NzA5NjggIT0gMjcwMDAw
MDAKPj4KPj4gSSBiZWxpZXZlIHRoaXMgb25lIGlzIGZvciBUb21pIHRvIGNvbW1lbnQsIGhpcyBk
cml2ZXIgZG9lcyBzb21lIG1hZ2ljCj4+IGNvbXBhcmVzIGZvciB0aGUgcmVxdWVzdGVkIHZzLiBh
Y3R1YWwgcmVjZWl2ZWQgY2xvY2sgcmF0ZXMuIElmIEkgYW0gbm90Cj4+IG1pc3Rha2VuLCB3ZSBh
cmUgb25seSBtb2RpZnlpbmcgYW4gaW50ZWdlciBkaXZpZGVyIGhlcmUsIGFuZCB0aHVzIGl0IGlz
Cj4+IHBoeXNpY2FsbHkgaW1wb3NzaWJsZSB0byBnZXQgYWNjdXJhdGUgMjdNSHogcmF0ZSB0byBk
aXNwbGF5Lgo+IAo+IEkgZGlkbid0IGV4cGVjdCBleGFjdGx5IDI3TUh6LGJ1dCB0aGUgYmFjayB0
cmFjZSBpcyB3aGF0IGNvbmNlcm5zIG1lIG1vcmUuCgpBaCBzb3JyeS4uLiBEU1MgZHJpdmVyIGtu
b3dzIHRoZSBtYXggZGl2aWRlciB2YWx1ZSwgc28gdGhhdCBpdCBjYW4gCml0ZXJhdGUgb3ZlciBh
bGwgdGhlIHJhdGVzIHRvIGZpbmQgYSBnb29kIG9uZS4KCkknbGwgc2VuZCBhIHBhdGNoIGxhdGVy
LCBidXQgbG9vayBmb3Igb21hcDM2MzBfZHNzX2ZlYXRzIGluIGRzcy5jLCBhbmQgCmNoYW5nZSBm
Y2tfZGl2X21heCBmcm9tIDMyIHRvIDE2LgoKPiBIb3dldmVyLCBsb29raW5nIGF0Cj4gIyBjYXQg
Y2xrL2RwbGw0X2NrL2Nsa19yYXRlCj4gODY0MDAwMDAwCj4gCj4gSXQgc2VlbXMgbGlrZSA4NjQw
MDAwMDAgLyAzMiB3b3VsZCBiZSAyNyBNSHosIGJ1dCBpbnN0ZWFkIHdlJ3JlCj4gZGl2aWRpbmcg
aXQgYnkgMzEgeWllbGRpbmcgMjc4NzA5NjguICBJIGRvbid0IGtub3cgdGhlIGNsb2NraW5nCj4g
YXJjaGl0ZWN0dXJlLCBzbyBJIGRvbid0IGtub3cgd2hhdCB5b3VyIHBhdGNoIGFjdHVhbGx5IGRp
ZCBvciBob3cgdGhlCj4gZGl2aWRlIGJ5IDE2IGxpbWl0IHdvcmtlZCBpbnRvIHRoaXMuICBJZiBs
Y2sgY2Fubm90IGRpdmlkZSBieSAzMiwgaXQKPiB3b3VsZCBiZSBuaWNlIHRvIHNlZSBpZiBpdCBj
b3VsZCBkaXZpZGUgYnkgMjcgdG8gZ2V0IHRvIDMyTUh6LiAgRnJvbQo+IHRoZXJlLCB0aGUgcGNr
IGNvdWxkIHRoZW4gZGl2aWRlIGJ5IDQgeWllbGRpbmcgOU1Iei4KClRoYXQncyBwcmV0dHkgb2Rk
LiBXaXRoIFRlcm8ncyBwYXRjaCAoSSBkaWRuJ3QgdGVzdCBpdCB0aG91Z2gpIHRoZSBtYXggCmRp
dmlkZXIgc2hvdWxkIGJlIDE2LiBTbyB0aGUgbWluaW11bSBmY2xrIHJhdGUgc2hvdWxkIGJlIDU0
TUh6LiBCdXQgCnNvbWVob3cgdGhlIGNsb2NrIGZyYW1ld29yayBtYW5hZ2VkIHRvIHByb2R1Y2Ug
Mjc4NzA5NjguLi4KCiAgVG9taQoKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBv
cmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYx
NTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
