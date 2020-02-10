Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81166157045
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 09:12:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57AAE6E90A;
	Mon, 10 Feb 2020 08:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919E06E90A
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 08:12:19 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01A8CI6s092158;
 Mon, 10 Feb 2020 02:12:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581322338;
 bh=2ixt7DRT7uhxoX67fqPlD7h7YnzEL0p4J0zBiKlYc9w=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=ghTZxMh8kbHUCYhuX5NFT8uGoQBMikcRYsp2QCFdLX6bjxvxLbu1qNMObupi6NZIm
 9TniRSKpURVqbu7mGFC8+tCHTq+opdpvvejMiA8YmXtqVHyoDEXGhiOJgMz57zTk4R
 Ud1MAdSoagEfYDNV29+UKUr0OliRPhHs098i1TS0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01A8CIUl011392;
 Mon, 10 Feb 2020 02:12:18 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 10
 Feb 2020 02:12:18 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 10 Feb 2020 02:12:18 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01A8CGEb056997;
 Mon, 10 Feb 2020 02:12:17 -0600
Subject: Re: [PATCH] drm/bridge: sii902x: Select SND_SOC_HDMI_CODEC if SND_SOC
 is configured
To: Jyri Sarha <jsarha@ti.com>, <dri-devel@lists.freedesktop.org>
References: <20191129152342.29145-1-jsarha@ti.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <6feb1477-30ab-f420-ec21-1e3c82da82bd@ti.com>
Date: Mon, 10 Feb 2020 10:12:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191129152342.29145-1-jsarha@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: tomi.valkeinen@ti.com, thierry.reding@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyOS8xMS8yMDE5IDE3LjIzLCBKeXJpIFNhcmhhIHdyb3RlOgo+IFRvIGVuYWJsZSBIRE1J
IGF1ZGlvIHRoZSBTTkRfU09DX0hETUlfQ09ERUMgbmVlZHMgdG8gYmUKPiBjb25maWd1cmVkLiBF
bmFibGUgSERNSSBhdWRpbyBieSBzZWxlY3RpbmcgU05EX1NPQ19IRE1JX0NPREVDIGlmCj4gU05E
X1NPQyBpcyBjb25maWd1cmVkLiBTTkRfU09DX0hETUlfQ09ERUMgaGFzIG5vIGNvbmZpZyBtZW51
IGVudHJ5IGFuZAo+IHNob3VsZCBiZSBzZWxlY3RlZCBhdG9tYXRpY2FsbHkgYnkgdGhlIGRyaXZl
cnMgdXNpbmcgaXQuCgpSZXZpZXdlZC1ieTogUGV0ZXIgVWpmYWx1c2kgPHBldGVyLnVqZmFsdXNp
QHRpLmNvbT4KCj4gCj4gU2lnbmVkLW9mZi1ieTogSnlyaSBTYXJoYSA8anNhcmhhQHRpLmNvbT4K
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnIHwgMSArCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcKPiBpbmRleCAy
NmZmMDdhZDI4N2IuLjBhNjBhNTZjZTZkYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL0tjb25maWcKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcKPiBA
QCAtMTE4LDYgKzExOCw3IEBAIGNvbmZpZyBEUk1fU0lJOTAyWAo+ICAJc2VsZWN0IERSTV9LTVNf
SEVMUEVSCj4gIAlzZWxlY3QgUkVHTUFQX0kyQwo+ICAJc2VsZWN0IEkyQ19NVVgKPiArCXNlbGVj
dCBTTkRfU09DX0hETUlfQ09ERUMgaWYgU05EX1NPQwo+ICAJLS0taGVscC0tLQo+ICAJICBTaWxp
Y29uIEltYWdlIHNpaTkwMnggYnJpZGdlIGNoaXAgZHJpdmVyLgo+ICAKPiAKCi0gUMOpdGVyCgpU
ZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxz
aW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2ls
ZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
