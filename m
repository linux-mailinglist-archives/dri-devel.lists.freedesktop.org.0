Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E058C670B1
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 15:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4CD6E0C2;
	Fri, 12 Jul 2019 13:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A312B6E0C2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 13:57:29 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6CDvNPg079591;
 Fri, 12 Jul 2019 08:57:23 -0500
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6CDvNuF024641
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 12 Jul 2019 08:57:23 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 12
 Jul 2019 08:57:23 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 12 Jul 2019 08:57:23 -0500
Received: from [10.250.97.31] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6CDvKE4004279;
 Fri, 12 Jul 2019 08:57:21 -0500
Subject: Re: [PATCH v3 3/4] dt-bindings: backlight: Add led-backlight binding
To: Pavel Machek <pavel@ucw.cz>
References: <20190710123932.28244-1-jjhiblot@ti.com>
 <20190710123932.28244-4-jjhiblot@ti.com> <20190710191314.GC22995@amd>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <0d513ab5-eeb0-c22c-7ec8-f773e445e5f1@ti.com>
Date: Fri, 12 Jul 2019 15:57:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190710191314.GC22995@amd>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1562939843;
 bh=h/FvatbSmYtmmSo8C36ybsR85uhbjITUgdMf4+sgcKs=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=NHRMTN2vON/H1UxbPmaa6bz1Xi1UB4UWrEtoK0M4wjamG75Qa1bev03jTLJPkbN4K
 TwTc5h0Oxm/ZIkCNb30PXnvU1A4crailkYII29TaUJfsmB1AHaZ+It6i9iXfqclGUx
 E1wCyYC0TRMjGe2isZtcEN9zqeNduFmKec6txm2U=
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 tomi.valkeinen@ti.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, lee.jones@linaro.org, linux-leds@vger.kernel.org,
 dmurphy@ti.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGF2ZWwsCgpPbiAxMC8wNy8yMDE5IDIxOjEzLCBQYXZlbCBNYWNoZWsgd3JvdGU6Cj4gT24gV2Vk
IDIwMTktMDctMTAgMTQ6Mzk6MzEsIEplYW4tSmFjcXVlcyBIaWJsb3Qgd3JvdGU6Cj4+IEFkZCBE
VCBiaW5kaW5nIGZvciBsZWQtYmFja2xpZ2h0Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKZWFuLUph
Y3F1ZXMgSGlibG90IDxqamhpYmxvdEB0aS5jb20+Cj4+IC0tLQo+PiAgIC4uLi9iaW5kaW5ncy9s
ZWRzL2JhY2tsaWdodC9sZWQtYmFja2xpZ2h0LnR4dCB8IDI4ICsrKysrKysrKysrKysrKysrKysK
Pj4gICAxIGZpbGUgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKQo+PiAgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbGVk
LWJhY2tsaWdodC50eHQKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sZWQtYmFja2xpZ2h0LnR4dCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sZWQtYmFja2xpZ2h0LnR4dAo+
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjA0NDRlZWM4ZWZl
MQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9sZWRzL2JhY2tsaWdodC9sZWQtYmFja2xpZ2h0LnR4dAo+PiBAQCAtMCwwICsxLDI4IEBA
Cj4+ICtsZWQtYmFja2xpZ2h0IGJpbmRpbmdzCj4+ICsKPj4gK1RoaXMgYmluZGluZyBpcyB1c2Vk
IHRvIGRlc2NyaWJlIGEgYmFzaWMgYmFja2xpZ2h0IGRldmljZSBtYWRlIG9mCj4+IExFRHMuCj4g
T2suCj4KPj4gK0l0IGNhbiBhbHNvIGJlIHVzZWQgdG8gZGVzY3JpYmUgYSBiYWNrbGlnaHQgZGV2
aWNlIGNvbnRyb2xsZWQgYnkgdGhlIG91dHB1dCBvZgo+PiArYSBMRUQgZHJpdmVyLgo+ID8gVGhl
IExFRCBkcml2ZXIgc2hvdWxkIGJldHRlciBiZSBkcml2aW5nIHNvbWUgTEVEcy4uLgoKV2VsbC4g
d2UgYXJlIGRlcGVuZGVudCBvZiB0aGUgYm9hcmQgZGVzaWduLiBJZiBhIGJvYXJkIGRlc2lnbmVy
IGRlY2lkZWQgCnRvIGNvbnRyb2wgYSBiYWNrbGlnaHQgd2l0aCBhIExFRC1jb250cm9sbGVyLCB0
aGVuIHdlIGhhdmUgdG8gZGVhbCB3aXRoIGl0LgoKSW4gcHJhY3RpY2UgdGhlcmUgYXJlIGEgbG90
IG9mIExFRCBkcml2ZXJzIHRoYXQgYWN0dWFsbHkgZHJpdmUgdGhlIExFRHMgCnVzaW5nIFBXTXMg
YW5kIGNhbiBiZSB1c2VkIGZvciB0aGlzIHB1cnBvc2UuCgpKSgoKPgo+PiArUmVxdWlyZWQgcHJv
cGVydGllczoKPj4gKyAgLSBjb21wYXRpYmxlOiAibGVkLWJhY2tsaWdodCIKPj4gKyAgLSBsZWRz
OiBhIGxpc3Qgb2YgTEVEcwo+PiArCj4+ICtPcHRpb25hbCBwcm9wZXJ0aWVzOgo+PiArICAtIGJy
aWdodG5lc3MtbGV2ZWxzOiBBcnJheSBvZiBkaXN0aW5jdCBicmlnaHRuZXNzIGxldmVscy4gVGhl
IGxldmVscyBtdXN0IGJlCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGluIHRoZSByYW5nZSBh
Y2NlcHRlZCBieSB0aGUgdW5kZXJseWluZyBMRUQgZGV2aWNlcy4KPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgVGhpcyBpcyB1c2VkIHRvIHRyYW5zbGF0ZSBhIGJhY2tsaWdodCBicmlnaHRuZXNz
IGxldmVsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGludG8gYSBMRUQgYnJpZ2h0bmVzcyBs
ZXZlbC4gaWYgbm90IHByb3ZpZGVkLCB0aGUKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWRl
bnRpdHkgbWFwcGluZyBpcyB1c2VkLgo+ICJJZiBpdCBpcyBub3QiCj4gCQkJCQkJCQkJUGF2ZWwK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
