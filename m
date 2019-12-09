Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E8E11689B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 09:51:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165106E0C4;
	Mon,  9 Dec 2019 08:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (mailgw02.mediatek.com [216.200.240.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18406E0C4
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 08:51:22 +0000 (UTC)
X-UUID: ff33343a19fb4fcc9e4480a7861245f0-20191209
X-UUID: ff33343a19fb4fcc9e4480a7861245f0-20191209
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1426792079; Mon, 09 Dec 2019 00:51:20 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 9 Dec 2019 00:52:19 -0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 9 Dec 2019 16:51:03 +0800
Message-ID: <1575881471.14479.2.camel@mtksdaap41>
Subject: Re: [resend PATCH v6 10/12] clk: mediatek: mt8183: switch mmsys to
 platform device probing
From: CK Hu <ck.hu@mediatek.com>
To: <matthias.bgg@kernel.org>
Date: Mon, 9 Dec 2019 16:51:11 +0800
In-Reply-To: <20191207224740.24536-11-matthias.bgg@kernel.org>
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
 <20191207224740.24536-11-matthias.bgg@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=mediatek.com; s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Xr2/g3CmQSCe7XSe29tjEitMS2VOZyuM620kmLXWO6Q=; 
 b=P1xvWC6HDaWhqgmYSncCgQAH8w+XZKpkMz44/oBFhr3zDee4L99O/yiaD85cTEOn8EXnEagEfkFkVPxxVmnbqNJOMLxJS/m3Gz9GOeQyUnuS9vcBkk7Dcx0jEiaGsAWnzwfrYy3zLCfeFRAqBT9QE8qDuQWL09gK29ybu4yV3ig=;
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
Cc: mark.rutland@arm.com, rdunlap@infradead.org, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, ulrich.hecht+renesas@gmail.com,
 linux-clk@vger.kernel.org, drinkcat@chromium.org, wens@csie.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, sean.wang@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org, mbrugger@suse.com, sboyd@kernel.org,
 sean.wang@kernel.org, linux-kernel@vger.kernel.org,
 enric.balletbo@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIE1hdHRoaWFzOg0KDQpPbiBTYXQsIDIwMTktMTItMDcgYXQgMjM6NDcgKzAxMDAsIG1hdHRo
aWFzLmJnZ0BrZXJuZWwub3JnIHdyb3RlOg0KPiBGcm9tOiBNYXR0aGlhcyBCcnVnZ2VyIDxtYnJ1
Z2dlckBzdXNlLmNvbT4NCj4gDQo+IFN3aXRjaCBwcm9iaW5nIGZvciB0aGUgTU1TWVMgdG8gc3Vw
cG9ydCBpbnZvY2F0aW9uIHRvIGENCj4gcGxhaW4gcGFsdGZvcm0gZGV2aWNlLiBUaGUgZHJpdmVy
IHdpbGwgYmUgcHJvYmVkIGJ5IHRoZSBEUk0gc3Vic3lzdGVtLg0KPiANCj4gU2luZ2VkLW9mZi1i
eTogTWF0dGhpYXMgQnJ1Z2dlciA8bWJydWdnZXJAc3VzZS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVy
cy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE4My1tbS5jIHwgMzkgKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxODMt
bW0uYyBiL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxODMtbW0uYw0KPiBpbmRleCA3MjBj
Njk2YjUwNmQuLmU2ZGNhZDE4ZDgxYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9jbGsvbWVkaWF0
ZWsvY2xrLW10ODE4My1tbS5jDQo+ICsrKyBiL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgx
ODMtbW0uYw0KPiBAQCAtMywxNCArMywyMCBAQA0KPiAgLy8gQ29weXJpZ2h0IChjKSAyMDE4IE1l
ZGlhVGVrIEluYy4NCj4gIC8vIEF1dGhvcjogV2VpeWkgTHUgPHdlaXlpLmx1QG1lZGlhdGVrLmNv
bT4NCj4gIA0KPiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4
L2Nsay1wcm92aWRlci5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0K
PiArI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4NCj4gIA0KPiAgI2luY2x1ZGUgImNsay1tdGsuaCIN
Cj4gICNpbmNsdWRlICJjbGstZ2F0ZS5oIg0KPiAgDQo+ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
Y2xvY2svbXQ4MTgzLWNsay5oPg0KPiAgDQo+ICtzdHJ1Y3QgY2xrX210ODE4M19tbV9wcml2IHsN
Cj4gKwlzdHJ1Y3QgY2xrX29uZWNlbGxfZGF0YSAqY2xrX2RhdGE7DQo+ICt9Ow0KPiArDQo+ICBz
dGF0aWMgY29uc3Qgc3RydWN0IG10a19nYXRlX3JlZ3MgbW0wX2NnX3JlZ3MgPSB7DQo+ICAJLnNl
dF9vZnMgPSAweDEwNCwNCj4gIAkuY2xyX29mcyA9IDB4MTA4LA0KPiBAQCAtODQsMjggKzkwLDM3
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2dhdGUgbW1fY2xrc1tdID0gew0KPiAgDQo+ICBz
dGF0aWMgaW50IGNsa19tdDgxODNfbW1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikNCj4gIHsNCj4gLQlzdHJ1Y3QgY2xrX29uZWNlbGxfZGF0YSAqY2xrX2RhdGE7DQo+IC0Jc3Ry
dWN0IGRldmljZV9ub2RlICpub2RlID0gcGRldi0+ZGV2Lm9mX25vZGU7DQo+ICsJc3RydWN0IGNs
a19tdDgxODNfbW1fcHJpdiAqcHJpdmF0ZTsNCj4gKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUg
PSBwZGV2LT5kZXYucGFyZW50LT5vZl9ub2RlOw0KPiArDQo+ICsJcHJpdmF0ZSA9IGRldm1fa3ph
bGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKnByaXZhdGUpLCBHRlBfS0VSTkVMKTsNCj4gKwlpZiAo
IXByaXZhdGUpDQo+ICsJCXJldHVybiAtRU5PTUVNOw0KPiAgDQo+IC0JY2xrX2RhdGEgPSBtdGtf
YWxsb2NfY2xrX2RhdGEoQ0xLX01NX05SX0NMSyk7DQo+ICsJcHJpdmF0ZS0+Y2xrX2RhdGEgPSBt
dGtfYWxsb2NfY2xrX2RhdGEoQ0xLX01NX05SX0NMSyk7DQo+ICsJcGxhdGZvcm1fc2V0X2RydmRh
dGEocGRldiwgcHJpdmF0ZSk7DQoNClRoZXJlIGlzIGEgbW9yZSBzaW1wbGUgbW9kaWZpY2F0aW9u
IHRoYXQgeW91IG5lZWQgbm90IHRvIGRlZmluZSBzdHJ1Y3QNCmNsa19tdDgxODNfbW1fcHJpdiwN
Cg0KY2xrX2RhdGEgPSBtdGtfYWxsb2NfY2xrX2RhdGEoQ0xLX01NX05SX0NMSyk7DQpwbGF0Zm9y
bV9zZXRfZHJ2ZGF0YShwZGV2LCBjbGtfZGF0YSk7DQoNClJlZ2FyZHMsDQpDSw0KDQo+ICANCj4g
IAltdGtfY2xrX3JlZ2lzdGVyX2dhdGVzKG5vZGUsIG1tX2Nsa3MsIEFSUkFZX1NJWkUobW1fY2xr
cyksDQo+IC0JCQljbGtfZGF0YSk7DQo+ICsJCQlwcml2YXRlLT5jbGtfZGF0YSk7DQo+ICANCj4g
LQlyZXR1cm4gb2ZfY2xrX2FkZF9wcm92aWRlcihub2RlLCBvZl9jbGtfc3JjX29uZWNlbGxfZ2V0
LCBjbGtfZGF0YSk7DQo+ICsJcmV0dXJuIG9mX2Nsa19hZGRfcHJvdmlkZXIobm9kZSwgb2ZfY2xr
X3NyY19vbmVjZWxsX2dldCwNCj4gKwkJCXByaXZhdGUtPmNsa19kYXRhKTsNCj4gIH0NCj4gIA0K
PiAtc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgb2ZfbWF0Y2hfY2xrX210ODE4M19t
bVtdID0gew0KPiAtCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTgzLW1tc3lzIiwgfSwN
Cj4gLQl7fQ0KPiAtfTsNCj4gK3N0YXRpYyBpbnQgY2xrX210ODE4M19tbV9yZW1vdmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gK3sNCj4gKwlzdHJ1Y3QgY2xrX210ODE4M19tbV9w
cml2ICpwcml2YXRlID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7DQo+ICsNCj4gKwlrZnJl
ZShwcml2YXRlLT5jbGtfZGF0YSk7DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gIA0KPiAg
c3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgY2xrX210ODE4M19tbV9kcnYgPSB7DQo+ICAJ
LnByb2JlID0gY2xrX210ODE4M19tbV9wcm9iZSwNCj4gKwkucmVtb3ZlID0gY2xrX210ODE4M19t
bV9yZW1vdmUsDQo+ICAJLmRyaXZlciA9IHsNCj4gIAkJLm5hbWUgPSAiY2xrLW10ODE4My1tbSIs
DQo+IC0JCS5vZl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX2Nsa19tdDgxODNfbW0sDQo+ICAJfSwN
Cj4gIH07DQo+IC0NCj4gLWJ1aWx0aW5fcGxhdGZvcm1fZHJpdmVyKGNsa19tdDgxODNfbW1fZHJ2
KTsNCj4gK21vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoY2xrX210ODE4M19tbV9kcnYpOw0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
