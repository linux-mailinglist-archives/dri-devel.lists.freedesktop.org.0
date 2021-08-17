Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 141893EE646
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 07:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38866E0F6;
	Tue, 17 Aug 2021 05:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAF46E0F6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 05:36:51 +0000 (UTC)
X-UUID: e7d62cd78f204186908e9e52c27b679a-20210817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=b328J144zpOevt/q/w5Rgs8faNaGXzgEa4YLoCNwF6w=; 
 b=S+xSEupC5vSrgKHhRJrL1U0CDOVhSM0yeVcKUpBVyXq0GY2qSr81HVM6DU3q3XUl/6RvSuAjfM4eSv4y5mJ/VisfFvL0nuMzCSkzhNI/nXENI4b3dtUso+Er2TWhnAzuVfY8DtQ0dmUHAUcjJUYKfRG1zr6ukVOmUPo8jTUhZvQ=;
X-UUID: e7d62cd78f204186908e9e52c27b679a-20210817
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 249429694; Tue, 17 Aug 2021 13:36:46 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 13:36:45 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 17 Aug 2021 13:36:45 +0800
Message-ID: <1629178605.7579.3.camel@mtksdaap41>
Subject: Re: [RFC PATCH 5/5] drm/mediatek: Add mt8195 DisplayPort driver
From: CK Hu <ck.hu@mediatek.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Date: Tue, 17 Aug 2021 13:36:45 +0800
In-Reply-To: <20210816192523.1739365-6-msp@baylibre.com>
References: <20210816192523.1739365-1-msp@baylibre.com>
 <20210816192523.1739365-6-msp@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIE1hcmt1czoNCg0KT24gTW9uLCAyMDIxLTA4LTE2IGF0IDIxOjI1ICswMjAwLCBNYXJrdXMg
U2NobmVpZGVyLVBhcmdtYW5uIHdyb3RlOg0KPiBUaGlzIHBhdGNoIGFkZHMgYSBEaXNwbGF5UG9y
dCBkcml2ZXIgZm9yIHRoZSBNZWRpYXRlayBtdDgxOTUgU29DLg0KPiANCj4gSXQgc3VwcG9ydHMg
Ym90aCBmdW5jdGlvbmFsIHVuaXRzIG9uIHRoZSBtdDgxOTUsIHRoZSBlbWJlZGRlZA0KPiBEaXNw
bGF5UG9ydCBhcyB3ZWxsIGFzIHRoZSBleHRlcm5hbCBEaXNwbGF5UG9ydCB1bml0cy4gSXQgb2Zm
ZXJzDQo+IGhvdC1wbHVnLWRldGVjdGlvbiwgYXVkaW8gdXAgdG8gOCBjaGFubmVscywgYW5kIERp
c3BsYXlQb3J0IDEuNCB3aXRoIHVwDQo+IHRvIDQgbGFuZXMuDQo+IA0KPiBUaGlzIGRyaXZlciBp
cyBiYXNlZCBvbiBhbiBpbml0aWFsIHZlcnNpb24gYnkNCj4gSmFzb24tSkguTGluIDxqYXNvbi1q
aC5saW5AbWVkaWF0ZWsuY29tPi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hcmt1cyBTY2huZWlk
ZXItUGFyZ21hbm4gPG1zcEBiYXlsaWJyZS5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArDQo+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdGtfZHBfb2ZfbWF0Y2hbXSA9IHsN
Cj4gKwl7DQo+ICsJCS5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5NS1kcF90eCIsDQoNCldo
ZXJlIGlzIHRoZSBiaW5kaW5nIGRvY3VtZW50IG9mICJtZWRpYXRlayxtdDgxOTUtZHBfdHgiPw0K
DQo+ICsJCS5kYXRhID0gJm10ODE5NV9kcF9kcml2ZXJfZGF0YSwNCj4gKwl9LA0KPiArCXsNCj4g
KwkJLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1LWVkcF90eCIsDQoNCldoZXJlIGlzIHRo
ZSBiaW5kaW5nIGRvY3VtZW50IG9mICJtZWRpYXRlayxtdDgxOTUtZWRwX3R4Ij8NCg0KPiArCQku
ZGF0YSA9ICZtdDgxOTVfZWRwX2RyaXZlcl9kYXRhLA0KPiArCX0sDQo+ICsJe30sDQo+ICt9Ow0K
PiArTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbXRrX2RwX29mX21hdGNoKTsNCj4gKw0KPiArc3Ry
dWN0IHBsYXRmb3JtX2RyaXZlciBtdGtfZHBfZHJpdmVyID0gew0KPiArCS5wcm9iZSA9IG10a19k
cF9wcm9iZSwNCj4gKwkucmVtb3ZlID0gbXRrX2RwX3JlbW92ZSwNCj4gKwkuZHJpdmVyID0gew0K
PiArCQkubmFtZSA9ICJtZWRpYXRlay1kcm0tZHAiLA0KPiArCQkub2ZfbWF0Y2hfdGFibGUgPSBt
dGtfZHBfb2ZfbWF0Y2gsDQo+ICsJCS5wbSA9ICZtdGtfZHBfcG1fb3BzLA0KPiArCX0sDQo+ICt9
Ow0KPiArDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwX3Jl
Zy5oIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcF9yZWcuaA0KPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjgzYWZjNzlkOThmZg0KPiAtLS0gL2Rl
di9udWxsDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBfcmVnLmgNCj4g
QEAgLTAsMCArMSwzMDk1IEBADQo+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MCAqLw0KPiArLyoNCj4gKyAqIENvcHlyaWdodCAoYykgMjAxOSBNZWRpYVRlayBJbmMuDQo+ICsg
KiBDb3B5cmlnaHQgKGMpIDIwMjEgQmF5TGlicmUNCj4gKyAqLw0KPiArI2lmbmRlZiBfTVRLX0RQ
X1JFR19IXw0KPiArI2RlZmluZSBfTVRLX0RQX1JFR19IXw0KPiArDQo+ICsjZGVmaW5lIE1US19E
UF9TSVBfQ09OVFJPTF9BQVJDSDMyIDB4ODIwMDA1MjMNCj4gKyMgZGVmaW5lIE1US19EUF9TSVBf
QVRGX1ZJREVPX1VOTVVURSAweDIwDQo+ICsjIGRlZmluZSBNVEtfRFBfU0lQX0FURl9FRFBfVklE
RU9fVU5NVVRFIDB4MjENCj4gKyMgZGVmaW5lIE1US19EUF9TSVBfQVRGX1JFR19XUklURSAweDIy
DQo+ICsjIGRlZmluZSBNVEtfRFBfU0lQX0FURl9SRUdfUkVBRCAweDIzDQo+ICsjIGRlZmluZSBN
VEtfRFBfU0lQX0FURl9DTURfQ09VTlQgMHgyNA0KPiArDQo+ICsjZGVmaW5lIFRPUF9PRkZTRVQJ
CTB4MjAwMA0KPiArI2RlZmluZSBFTkMwX09GRlNFVAkJMHgzMDAwDQo+ICsjZGVmaW5lIEVOQzFf
T0ZGU0VUCQkweDMyMDANCj4gKyNkZWZpbmUgVFJBTlNfT0ZGU0VUCQkweDM0MDANCj4gKyNkZWZp
bmUgQVVYX09GRlNFVAkJMHgzNjAwDQo+ICsjZGVmaW5lIFNFQ19PRkZTRVQJCTB4NDAwMA0KPiAr
DQo+ICsjZGVmaW5lIE1US19EUF9IUERfRElTQ09OTkVDVAlCSVQoMSkNCj4gKyNkZWZpbmUgTVRL
X0RQX0hQRF9DT05ORUNUCUJJVCgyKQ0KPiArI2RlZmluZSBNVEtfRFBfSFBEX0lOVEVSUlVQVAlC
SVQoMykNCj4gKw0KPiArI2RlZmluZSBNVEtfRFBfRU5DMF9QMF8zMDAwICAgICAgICAgICAgICAo
RU5DMF9PRkZTRVQgKyAweDAwMCkNCj4gKyMgZGVmaW5lIExBTkVfTlVNX0RQX0VOQzBfUDBfTUFT
SyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgzDQo+ICsjIGRlZmluZSBM
QU5FX05VTV9EUF9FTkMwX1AwX1NISUZUICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDANCj4gKyMgZGVmaW5lIFZJREVPX01VVEVfU1dfRFBfRU5DMF9QMF9NQVNLICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgMHg0DQo+ICsjIGRlZmluZSBWSURFT19NVVRFX1NXX0RQ
X0VOQzBfUDBfU0hJRlQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDINCj4gKyMgZGVm
aW5lIFZJREVPX01VVEVfU0VMX0RQX0VOQzBfUDBfTUFTSyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgMHg4DQo+ICsjIGRlZmluZSBWSURFT19NVVRFX1NFTF9EUF9FTkMwX1AwX1NISUZU
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDMNCj4gKyMgZGVmaW5lIEVOSEFOQ0VEX0ZS
QU1FX0VOX0RQX0VOQzBfUDBfTUFTSyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgxMA0K
PiArIyBkZWZpbmUgRU5IQU5DRURfRlJBTUVfRU5fRFBfRU5DMF9QMF9TSElGVCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA0DQo+ICsjIGRlZmluZSBIRENQX0ZSQU1FX0VOX0RQX0VOQzBfUDBf
TUFTSyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MjANCj4gKyMgZGVmaW5lIEhE
Q1BfRlJBTUVfRU5fRFBfRU5DMF9QMF9TSElGVCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgNQ0KPiArIyBkZWZpbmUgSURQX0VOX0RQX0VOQzBfUDBfTUFTSyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAweDQwDQoNClJlbW92ZSB1c2VsZXNzIGRlZmluaXRpb24u
DQoNClJlZ2FyZHMsDQpDSy4NCg0KPiArIyBkZWZpbmUgSURQX0VOX0RQX0VOQzBfUDBfU0hJRlQg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA2DQo+ICsjIGRlZmluZSBCU19T
WU1CT0xfQ05UX1JFU0VUX0RQX0VOQzBfUDBfTUFTSyAgICAgICAgICAgICAgICAgICAgICAgICAg
IDB4ODANCj4gKyMgZGVmaW5lIEJTX1NZTUJPTF9DTlRfUkVTRVRfRFBfRU5DMF9QMF9TSElGVCAg
ICAgICAgICAgICAgICAgICAgICAgICAgNw0KPiArIyBkZWZpbmUgTUlYRVJfRFVNTVlfREFUQV9E
UF9FTkMwX1AwX01BU0sgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweGZmMDANCj4gKyMg
ZGVmaW5lIE1JWEVSX0RVTU1ZX0RBVEFfRFBfRU5DMF9QMF9TSElGVCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgOA0KPiArDQoNCj4gKw0KPiArI2VuZGlmIC8qX01US19EUF9SRUdfSF8qLw0K
DQo=

