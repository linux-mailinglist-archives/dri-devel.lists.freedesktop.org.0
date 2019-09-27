Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31309C08E1
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 17:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923586E0AD;
	Fri, 27 Sep 2019 15:48:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA8E6E0AD
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 15:48:01 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8RFlwsx028604;
 Fri, 27 Sep 2019 10:47:58 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8RFlwN2037608
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 27 Sep 2019 10:47:58 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 27
 Sep 2019 10:47:49 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 27 Sep 2019 10:47:49 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RFltEh071020;
 Fri, 27 Sep 2019 10:47:55 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To: Tero Kristo <t-kristo@ti.com>, Adam Ford <aford173@gmail.com>
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
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <eb2eb1f6-3c9b-7ecb-667e-819033af9c14@ti.com>
Date: Fri, 27 Sep 2019 18:47:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <36369388-e9c8-22cd-8c19-e2bdf2d0389b@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569599278;
 bh=U37r5TojFgcS5DwKcw0E6Hys+tinXCxumASCFgqCX8M=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=n0Dr10Fc+4D7YJlreDJ02Ho/MKselqyZ6JuPychdRGigTx8dWWa2gK6i2fqY5dVQc
 IUPJMUBCpnPe8DrSvyAnfIiHNm4vGE9zwJvOxkba71HzXwN4KHTMU/1RfIyWs0RCMF
 vVrX5avWBICkiZbB3QrrbQqe4DGgEkXTJSC9ZWrM=
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

T24gMjcvMDkvMjAxOSAxODozNywgVGVybyBLcmlzdG8gd3JvdGU6Cgo+IElmIHlvdSBjYW4gcHJv
dmlkZSBkZXRhaWxzIGFib3V0IHdoYXQgY2xvY2sgZnJhbWV3b3JrIC8gZHJpdmVyIGRvZXMgCj4g
d3JvbmcgKHNhbXBsZSBjbGtfc2V0X3h5eiBjYWxsIHNlcXVlbmNlLCBleHBlY3RlZCByZXN1bHRz
IHZpYSAKPiBjbGtfZ2V0X3h5eiwgYW5kIHdoYXQgZmFpbHMpLCBJIGNhbiB0YWtlIGEgbG9vayBh
dCBpdC4gSnVzdCByZXBvcnRpbmcgCj4gYXJiaXRyYXJ5IGRpc3BsYXkgZHJpdmVyIGlzc3VlcyBJ
IHdvbid0IGJlIGFibGUgdG8gZGVidWcgYXQgYWxsIChJIGRvbid0IAo+IGhhdmUgYWNjZXNzIHRv
IGFueSBvZiB0aGUgZGlzcGxheXMsIG5vciBkbyBJIHdhbnQgdG8gd2FzdGUgdGltZSAKPiBkZWJ1
Z2dpbmcgdGhlbSB3aXRob3V0IGFic29sdXRlbHkgbm8ga25vd2xlZGdlIHdoYXRzb2V2ZXIuKQoK
SSB1c2VkIHlvdXIgaGFjayBwYXRjaGVzIHRvIGFsbG93IGNoYW5naW5nIHJhdGVzIHZpYSBkZWJ1
Z2ZzLiBBbmQgc2V0IApkc3MxX2Fsd29uX2Zja18zNDMwZXMyIHRvIDI3MDAwMDAwIG9yIDI3ODcw
OTY3LiBUaGUgZW5kIHJlc3VsdCB3YXMgdGhhdCAKRFNTIGdldHMgc29tZSB2ZXJ5IGhpZ2ggY2xv
Y2sgZnJvbSBkc3MxX2Fsd29uX2Zja18zNDMwZXMyLCBhcyB0aGUgZnJhbWUgCnJhdGUganVtcHMg
dG8gbWFueSBodW5kcmVkcyBmcHMuCgpTbywgdGhlc2UgbnVtYmVycyBhcmUgbm90IHJlYWwsIGJ1
dCB0byBnaXZlIHRoZSBpZGVhIHdoYXQgSSBzYXcuIFJ1bm5pbmcgCmZpcnN0IHdpdGggNTAgTUh6
LCBJIGNhbiBzZWUsIHNheSwgNDAgZnBzLiBUaGVuIEkgc2V0IHRoZSBjbG9jayB0byAzMCAKTUh6
LCBhbmQgZnBzIGRyb3BwZWQgdG8sIHNheSwgMzBmcHMsIGFzIGV4cGVjdGVkIHdpdGggbG93ZXIg
Y2xvY2suIFRoZW4gCkkgc2V0IHRoZSBjbG9jayB0byAyN01IeiAob3IgdGhlIG90aGVyIG9uZSks
IGV4cGVjdGluZyBhIGJpdCBsb3dlciBmcHMsIApidXQgaW5zdGVhZCBJIHNhdyBodW5kcmVkcyBv
ZiBmcHMuCgpJIGRvbid0IGtub3cgaWYgdGhlcmUncyBhbnkgb3RoZXIgd2F5IHRvIG9ic2VydmUg
dGhlIHdyb25nIGNsb2NrIHJhdGUgCmJ1dCBoYXZlIHRoZSBkc3MgZW5hYmxlZCBhbmQgcnVubmlu
ZyBrbXN0ZXN0IG9yIHNpbWlsYXIuIEkgY2FuIGhlbHAgeW91IApzZXQgdGhhdCB1cCBuZXh0IHdl
ZWssIHNob3VsZCBiZSB0cml2aWFsLiBZb3UgZG9uJ3QgbmVlZCBhIGRpc3BsYXkgZm9yIHRoYXQu
CgogIFRvbWkKCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1
IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290
aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
