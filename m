Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AECAEC2335
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 16:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800B66E453;
	Mon, 30 Sep 2019 14:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076246E453
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 14:27:14 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UER9D4010738;
 Mon, 30 Sep 2019 09:27:09 -0500
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UER9qU042622;
 Mon, 30 Sep 2019 09:27:09 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 09:27:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 09:27:09 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UER6Ak067205;
 Mon, 30 Sep 2019 09:27:06 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Adam Ford <aford173@gmail.com>, "H. Nikolaus Schaller" <hns@goldelico.com>
References: <20190510194229.20628-1-aford173@gmail.com>
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
 <F3335195-6EB7-4D44-B884-2F29D9238011@goldelico.com>
 <CAHCN7xL9bFxO=2i1DzmRj6A3XwUNdt=DZeJ2a0EZ0f9gcFTy6g@mail.gmail.com>
 <CAHCN7x+vCfPTRE+zzYUwAXdbBzRotTP2hSOgsHB0FdgBhZV5zA@mail.gmail.com>
 <CAHCN7xJDV=R9Ysjhff7=mEXdciwPP_5LQbHwaUT8KvhSkLKw8A@mail.gmail.com>
 <04306a5e-f9be-35a4-1aa1-5795d780e289@ti.com>
Message-ID: <3777f1b1-2d9a-334b-b9e7-99dfda2ae29b@ti.com>
Date: Mon, 30 Sep 2019 17:27:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <04306a5e-f9be-35a4-1aa1-5795d780e289@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569853629;
 bh=19UZeQW7iCMEPJGBu3CVRVx3eQA8RyzMg8BIyoBYUWY=;
 h=Subject:From:To:CC:References:Date:In-Reply-To;
 b=mqAFLfcVc72peDTQaVTX3krGNWa4dUGqG37HuzfVHniEjLFEVSOh8YoKdxbgpNypn
 9JTrY0Nwc+jZwsA4tAyvBkeNUyOL86+NmKHRKznpqBPY2bLbEqdihnIkEZpky/3syV
 aD/H/j8j0s3Fyh4XLDHzYd3fjjECs/1Fh8fCCAe0=
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

T24gMzAvMDkvMjAxOSAxNzoyMCwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cgo+IExldCdzIHNlZSB3
aGF0IFRlcm8gc2F5cywgYnV0IHllYWgsIHNvbWV0aGluZyBpcyBvZGQgaGVyZS4gSSBleHBlY3Rl
ZCAKPiB0aGUgbWF4IGRpdmlkZXIgdG8gYmUgMTYgd2l0aCBUZXJvJ3MgcGF0Y2gsIGJ1dCBJIGRv
bid0IHNlZSBpdCBoYXZpbmcgCj4gdGhhdCBlZmZlY3QuIEkgY2FuIGdldCB0aGUgZGl2IHRvIDMx
Lgo+IAo+IFlvdSBjYW4gc2VlIHRoaXMgZnJvbSB0aGUgY2xvY2sgcmVnaXN0ZXIgMHg0ODAwNGU0
MCAoQ01fQ0xLU0VMX0RTUykuIFRoZSAKPiBsb3dlc3QgYml0cyBhcmUgdGhlIGRpdmlkZXIsIDUg
dG8gMC4gVGhlIFRSTSBzYXlzIG1heCBkaXYgaXMgMzIuCj4gCj4gVGVybyBzYWlkIGZvciBoaW0g
dGhlIGRpdmlkZXJzID4gMTYgZGlkbid0ICJzdGljayIgdG8gdGhlIHJlZ2lzdGVyLiBJJ20gCj4g
bm93IHdvbmRlcmluZyBpZiBoZSBoYXMgYW4gb2xkIGJlYWdsZWJvYXJkIHdpdGggT01BUDM0eHgs
IHdoaWNoIGhhcyBtYXggCj4gZGl2IDE2LgoKU28gdGVzdGluZyBhIGJpdCBtb3JlIGhlcmUsIEkg
Y2FuIHNlZSB0aGUgRFNTIHdvcmtpbmcgZmluZSBhbmQgZnBzIGFzIApleHBlY3RlZCB3aGVuIEkg
d3JpdGUgdmFsdWVzIGRpcmVjdGx5IHRvIENNX0NMS1NFTF9EU1M6NTowLCB3aXRoIApkaXZpZGVy
cyB1cCB0byAzMS4gV2l0aCAzMiwgRFNTIGJyZWFrcy4gVGhlIFRSTSAoQU0vRE0zN3gpIHNheXMg
dmFsdWUgMzIgCmlzIHZhbGlkLgoKICBUb21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFu
ZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNz
IElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
