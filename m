Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A1F3EEA4D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 11:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A95B6E155;
	Tue, 17 Aug 2021 09:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B776E155
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 09:50:49 +0000 (UTC)
X-UUID: 9c69e53500bb449eac10fd99357ceeda-20210817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=9piB8QNC7LNa64Cxv1P75hKgH9XVdHP2w7RePzDZ4fk=; 
 b=L5qIzwW7xyWjnugL4FtfxyaoU+iRv2v9Z8ocrmBLkYwkivPEblb+9rcsU0gP5D8NUCnNLx36o175HB62DABE34JR9JvUptKIIqGmCYqeL9PiFrPjJn1OfQNYqf/G+SD0s86dlLJBKjCatg0r6zVVqkrEO8vODPnIj8YdfkezQXg=;
X-UUID: 9c69e53500bb449eac10fd99357ceeda-20210817
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1046885607; Tue, 17 Aug 2021 17:50:46 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 17 Aug 2021 17:50:44 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 17 Aug 2021 17:50:44 +0800
Message-ID: <1629193844.19746.2.camel@mtksdaap41>
Subject: Re: [RFC PATCH 2/5] drm/mediatek: dpi: Add dpintf support
From: CK Hu <ck.hu@mediatek.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Date: Tue, 17 Aug 2021 17:50:44 +0800
In-Reply-To: <20210816192523.1739365-3-msp@baylibre.com>
References: <20210816192523.1739365-1-msp@baylibre.com>
 <20210816192523.1739365-3-msp@baylibre.com>
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
U2NobmVpZGVyLVBhcmdtYW5uIHdyb3RlOg0KPiBkcGludGYgaXMgdGhlIGRpc3BsYXlwb3J0IGlu
dGVyZmFjZSBoYXJkd2FyZSB1bml0LiBUaGlzIHVuaXQgaXMgc2ltaWxhcg0KPiB0byBkcGkgYW5k
IGNhbiByZXVzZSBtb3N0IG9mIHRoZSBjb2RlLg0KPiANCj4gVGhpcyBwYXRjaCBhZGRzIHN1cHBv
cnQgZm9yIG10ODE5NS1kcGludGYgdG8gdGhpcyBkcGkgZHJpdmVyLiBNYWluDQo+IGRpZmZlcmVu
Y2VzIGFyZToNCj4gIC0gU29tZSBmZWF0dXJlcy9mdW5jdGlvbmFsIGNvbXBvbmVudHMgYXJlIG5v
dCBhdmFpbGFibGUgZm9yIGRwaW50Zg0KPiAgICB3aGljaCBhcmUgbm93IGV4Y2x1ZGVkIGZyb20g
Y29kZSBleGVjdXRpb24gb25jZSBpc19kcGludGYgaXMgc2V0DQo+ICAtIGRwaW50ZiBjYW4gYW5k
IG5lZWRzIHRvIGNob29zZSBiZXR3ZWVuIGRpZmZlcmVudCBjbG9ja2RpdmlkZXJzIGJhc2VkDQo+
ICAgIG9uIHRoZSBjbG9ja3NwZWVkLiBUaGlzIGlzIGRvbmUgYnkgY2hvb3NpbmcgYSBkaWZmZXJl
bnQgY2xvY2sgcGFyZW50Lg0KPiAgLSBUaGVyZSBhcmUgdHdvIGFkZGl0aW9uYWwgY2xvY2tzIHRo
YXQgbmVlZCB0byBiZSBtYW5hZ2VkLiBUaGVzZSBhcmUNCj4gICAgb25seSBzZXQgZm9yIGRwaW50
ZiBhbmQgd2lsbCBiZSBzZXQgdG8gTlVMTCBpZiBub3Qgc3VwcGxpZWQuIFRoZQ0KPiAgICBjbGtf
KiBjYWxscyBoYW5kbGUgdGhlc2UgYXMgbm9ybWFsIGNsb2NrcyB0aGVuLg0KPiAgLSBTb21lIHJl
Z2lzdGVyIGNvbnRlbnRzIGRpZmZlciBzbGlnaHRseSBiZXR3ZWVuIHRoZSB0d28gY29tcG9uZW50
cy4gVG8NCj4gICAgd29yayBhcm91bmQgdGhpcyBJIGFkZGVkIHJlZ2lzdGVyIGJpdHMvbWFza3Mg
d2l0aCBhIERQSU5URl8gcHJlZml4DQo+ICAgIGFuZCB1c2UgdGhlbSB3aGVyZSBkaWZmZXJlbnQu
DQo+IA0KPiBCYXNlZCBvbiBhIHNlcGFyYXRlIGRyaXZlciBmb3IgZHBpbnRmIGNyZWF0ZWQgYnkN
Cj4gSmFzb24tSkguTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPi4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IE1hcmt1cyBTY2huZWlkZXItUGFyZ21hbm4gPG1zcEBiYXlsaWJyZS5jb20+DQo+
IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyAgICAgIHwgMjgyICsr
KysrKysrKysrKysrKysrKysrLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cGlfcmVncy5oIHwgIDEyICsNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjQ3IGluc2VydGlvbnMoKyks
IDQ3IGRlbGV0aW9ucygtKQ0KPiANCg0KW3NuaXBdDQoNCj4gIA0KPiArc3RhdGljIHZvaWQgbXRr
X2RwaV9zZXRfcGl4ZWxfY2xrX3BhcmVudChzdHJ1Y3QgbXRrX2RwaSAqZHBpLA0KPiArCQkJCQkg
dW5zaWduZWQgaW50IGZhY3RvcikNCj4gK3sNCj4gKwlzdHJ1Y3QgY2xrICpuZXdfcGFyZW50Ow0K
PiArDQo+ICsJc3dpdGNoIChmYWN0b3IpIHsNCj4gKwljYXNlIDE2Og0KPiArCQluZXdfcGFyZW50
ID0gZHBpLT50dmRfY2xrc1tNVEtfRFBJX1RWRFBMTF9EMTZdLmNsazsNCj4gKwkJYnJlYWs7DQo+
ICsJY2FzZSA4Og0KPiArCQluZXdfcGFyZW50ID0gZHBpLT50dmRfY2xrc1tNVEtfRFBJX1RWRFBM
TF9EOF0uY2xrOw0KPiArCQlicmVhazsNCj4gKwljYXNlIDQ6DQo+ICsJCW5ld19wYXJlbnQgPSBk
cGktPnR2ZF9jbGtzW01US19EUElfVFZEUExMX0Q0XS5jbGs7DQo+ICsJCWJyZWFrOw0KPiArCWNh
c2UgMjoNCj4gKwkJbmV3X3BhcmVudCA9IGRwaS0+dHZkX2Nsa3NbTVRLX0RQSV9UVkRQTExfRDJd
LmNsazsNCj4gKwkJYnJlYWs7DQo+ICsJZGVmYXVsdDoNCj4gKwkJbmV3X3BhcmVudCA9IE5VTEw7
DQo+ICsJfQ0KPiArCWlmIChuZXdfcGFyZW50KQ0KPiArCQljbGtfc2V0X3BhcmVudChkcGktPnBp
eGVsX2NsaywgbmV3X3BhcmVudCk7DQoNCkkgcHJlZmVyIHRoYXQgZHBpLT5waXhlbF9jbGsgcHJv
dmlkZSBzZXRfcmF0ZSgpIGludGVyZmFjZSwgYW5kIGxldCBjbG9jaw0KZHJpdmVyIHRvIGNvbnRy
b2wgdGhlIHBhcmVudCBvZiBkcGktPnBpeGVsX2Nsay4NCg0KUmVnYXJkcywNCkNLDQoNCj4gK30N
Cj4gKw0KPiAgc3RhdGljIGludCBtdGtfZHBpX3NldF9kaXNwbGF5X21vZGUoc3RydWN0IG10a19k
cGkgKmRwaSwNCj4gIAkJCQkgICAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpDQo+ICB7
DQo+IEBAIC00NjUsNiArNTY4LDggQEAgc3RhdGljIGludCBtdGtfZHBpX3NldF9kaXNwbGF5X21v
ZGUoc3RydWN0IG10a19kcGkgKmRwaSwNCj4gIAlkcm1fZGlzcGxheV9tb2RlX3RvX3ZpZGVvbW9k
ZShtb2RlLCAmdm0pOw0KPiAgCXBsbF9yYXRlID0gdm0ucGl4ZWxjbG9jayAqIGZhY3RvcjsNCj4g
IA0KPiArCW10a19kcGlfc2V0X3BpeGVsX2Nsa19wYXJlbnQoZHBpLCBmYWN0b3IpOw0KPiArDQo+
ICAJZGV2X2RiZyhkcGktPmRldiwgIldhbnQgUExMICVsdSBIeiwgcGl4ZWwgY2xvY2sgJWx1IEh6
XG4iLA0KPiAgCQlwbGxfcmF0ZSwgdm0ucGl4ZWxjbG9jayk7DQo+ICANCg0KDQo=

