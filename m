Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E113D1D57
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 07:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D421B6E487;
	Thu, 22 Jul 2021 05:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC07D6E487
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 05:25:45 +0000 (UTC)
X-UUID: 0ad324f709c5432a9a0dd2c666540d2f-20210722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=bwvssxEh+WWqfF7JHzWygUD9tmJwKCWEMgEs0tG9/P8=; 
 b=KCaE7TThpr8gr58aWTZ73BIP+EAEN1L9h8YEq2zz/KJCAP7s2vePCf1M6NxssvxmyYiVdG8JyYcXcs3GPBsLCVTHPWz3RR4r4awpDoCasYWcIfB2/eZabo3RDmABOMX5xWuzo4wGjnlvlLo49gCSbOkyUPVrNsC2XOiNey+S2hY=;
X-UUID: 0ad324f709c5432a9a0dd2c666540d2f-20210722
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 341859683; Thu, 22 Jul 2021 13:25:42 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 13:25:41 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Jul 2021 13:25:41 +0800
Message-ID: <1626931541.16442.15.camel@mtksdaap41>
Subject: Re: [PATCH v1 06/10] drm/mediatek: add ETHDR support for MT8195
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>
Date: Thu, 22 Jul 2021 13:25:41 +0800
In-Reply-To: <3f8b55c75f97e46901c9380fefd2c15a8c5a2a72.camel@mediatek.com>
References: <20210717090408.28283-1-nancy.lin@mediatek.com>
 <20210717090408.28283-7-nancy.lin@mediatek.com>
 <CAAOTY__1iiptUgYy2G4BOyYEkqLVO3BRWhMru0p=aB3JcBzd_A@mail.gmail.com>
 <3f8b55c75f97e46901c9380fefd2c15a8c5a2a72.camel@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIE5hbmN5Og0KDQpPbiBUaHUsIDIwMjEtMDctMjIgYXQgMDk6MzIgKzA4MDAsIE5hbmN5Lkxp
biB3cm90ZToNCj4gSGkgQ2h1bi1LdWFuZywNCj4gDQo+IE9uIE1vbiwgMjAyMS0wNy0xOSBhdCAw
Nzo1NiArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90ZToNCj4gPiBIaSwgTmFuY3k6DQo+ID4gDQo+
ID4gTmFuY3kuTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5tDfmnIgxN+aX
pSDpgLHlha0g5LiL5Y2INTowNOWvq+mBk++8mg0KPiA+ID4gDQo+ID4gPiBBZGQgRVRIRFIgbW9k
dWxlIGZpbGVzOg0KPiA+ID4gRVRIRFIgaXMgZGVzaWduZWQgZm9yIEhEUiB2aWRlbyBhbmQgZ3Jh
cGhpY3MgY29udmVyc2lvbiBpbiB0aGUNCj4gPiA+IGV4dGVybmFsDQo+ID4gPiBkaXNwbGF5IHBh
dGguIEl0IGhhbmRsZXMgbXVsdGlwbGUgSERSIGlucHV0IHR5cGVzIGFuZCBwZXJmb3JtcyB0b25l
DQo+ID4gPiBtYXBwaW5nLCBjb2xvciBzcGFjZS9jb2xvciBmb3JtYXQgY29udmVyc2lvbiwgYW5k
IHRoZW4gY29tYmluZXMNCj4gPiA+IGRpZmZlcmVudCBsYXllcnMsIG91dHB1dCB0aGUgcmVxdWly
ZWQgSERSIG9yIFNEUiBzaWduYWwgdG8gdGhlDQo+ID4gPiBzdWJzZXF1ZW50IGRpc3BsYXkgcGF0
aC4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogTmFuY3kuTGluIDxuYW5jeS5saW5AbWVk
aWF0ZWsuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01h
a2VmaWxlICAgICAgICAgICB8ICAgMyArLQ0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZGlzcF9kcnYuaCAgICAgfCAgIDggKw0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2RkcF9jb21wLmMgfCAgMTEgKw0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmggfCAgIDEgKw0KPiA+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jICAgICAgfCAgIDQgKw0KPiA+ID4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5oICAgICAgfCAgIDEgKw0KPiA+ID4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYyAgICAgICAgfCA1MzcNCj4gPiA+ICsrKysrKysr
KysrKysrKysrKysrDQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5o
ICAgICAgICB8ICAyMCArDQo+ID4gPiAgOCBmaWxlcyBjaGFuZ2VkLCA1ODQgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2V0aGRyLmMNCj4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5oDQo+ID4gPiANCj4gPiA+ICsNCj4gPiA+ICt2
b2lkIG10a19ldGhkcl9sYXllcl9vbihzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBp
ZHgsDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgY21kcV9wa3QgKmNtZHFf
cGt0KQ0KPiA+ID4gK3sNCj4gPiA+ICsgICAgICAgc3RydWN0IG10a19ldGhkciAqcHJpdiA9IGRl
dl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiA+ID4gKyAgICAgICBzdHJ1Y3QgbXRrX2V0aGRyX2NvbXAg
Km1peGVyID0gJnByaXYtDQo+ID4gPiA+ZXRoZHJfY29tcFtFVEhEUl9NSVhFUl07DQo+ID4gPiAr
DQo+ID4gPiArICAgICAgIGRldl9kYmcoZGV2LCAiJXMrIGlkeDolZCIsIF9fZnVuY19fLCBpZHgp
Ow0KPiA+ID4gKw0KPiA+ID4gKyAgICAgICBpZiAoaWR4IDwgNCkNCj4gPiA+ICsgICAgICAgICAg
ICAgICBtdGtfZGRwX3dyaXRlX21hc2soY21kcV9wa3QsIEJJVChpZHgpLCAmbWl4ZXItDQo+ID4g
PiA+Y21kcV9iYXNlLA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBt
aXhlci0+cmVncywgTUlYX1NSQ19DT04sDQo+ID4gPiBCSVQoaWR4KSk7DQo+ID4gPiArfQ0KPiA+
ID4gKw0KPiA+ID4gK3ZvaWQgbXRrX2V0aGRyX2xheWVyX29mZihzdHJ1Y3QgZGV2aWNlICpkZXYs
IHVuc2lnbmVkIGludCBpZHgsDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IGNtZHFfcGt0ICpjbWRxX3BrdCkNCj4gPiA+ICt7DQo+ID4gPiArICAgICAgIHN0cnVjdCBtdGtf
ZXRoZHIgKnByaXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gPiA+ICsgICAgICAgc3RydWN0
IG10a19ldGhkcl9jb21wICptaXhlciA9ICZwcml2LQ0KPiA+ID4gPmV0aGRyX2NvbXBbRVRIRFJf
TUlYRVJdOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAgICBkZXZfZGJnKGRldiwgIiVzKyBpZHg6JWQi
LCBfX2Z1bmNfXywgaWR4KTsNCj4gPiA+ICsNCj4gPiA+ICsgICAgICAgc3dpdGNoIChpZHgpIHsN
Cj4gPiA+ICsgICAgICAgY2FzZSAwOg0KPiA+ID4gKyAgICAgICAgICAgICAgIG10a19kZHBfd3Jp
dGVfbWFzayhjbWRxX3BrdCwgMCwgJm1peGVyLT5jbWRxX2Jhc2UsDQo+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIG1peGVyLT5yZWdzLCBNSVhfTDBfU1JDX1NJWkUsDQo+
ID4gPiB+MCk7DQo+ID4gPiArICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gPiArICAgICAgIGNh
c2UgMToNCj4gPiA+ICsgICAgICAgICAgICAgICBtdGtfZGRwX3dyaXRlX21hc2soY21kcV9wa3Qs
IDAsICZtaXhlci0+Y21kcV9iYXNlLA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBtaXhlci0+cmVncywgTUlYX0wxX1NSQ19TSVpFLA0KPiA+ID4gfjApOw0KPiA+ID4g
KyAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ID4gKyAgICAgICBjYXNlIDI6DQo+ID4gPiArICAg
ICAgICAgICAgICAgbXRrX2RkcF93cml0ZV9tYXNrKGNtZHFfcGt0LCAwLCAmbWl4ZXItPmNtZHFf
YmFzZSwNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWl4ZXItPnJl
Z3MsIE1JWF9MMl9TUkNfU0laRSwNCj4gPiA+IH4wKTsNCj4gPiA+ICsgICAgICAgICAgICAgICBi
cmVhazsNCj4gPiA+ICsgICAgICAgY2FzZSAzOg0KPiA+ID4gKyAgICAgICAgICAgICAgIG10a19k
ZHBfd3JpdGVfbWFzayhjbWRxX3BrdCwgMCwgJm1peGVyLT5jbWRxX2Jhc2UsDQo+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1peGVyLT5yZWdzLCBNSVhfTDNfU1JDX1NJ
WkUsDQo+ID4gPiB+MCk7DQo+ID4gPiArICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gPiArICAg
ICAgIGRlZmF1bHQ6DQo+ID4gPiArICAgICAgICAgICAgICAgZGV2X2RiZyhkZXYsICIlcyBXcm9u
ZyBsYXllciBJRFxuIiwgX19mdW5jX18pOw0KPiA+ID4gKyAgICAgICAgICAgICAgIGJyZWFrOw0K
PiA+ID4gKyAgICAgICB9DQo+ID4gDQo+ID4gV2h5IG5vdCBqdXN0DQo+ID4gDQo+ID4gICAgICAg
ICAgICAgICAgbXRrX2RkcF93cml0ZV9tYXNrKGNtZHFfcGt0LCAwLCAmbWl4ZXItPmNtZHFfYmFz
ZSwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWl4ZXItPnJlZ3MsIE1J
WF9TUkNfQ09OLA0KPiA+IEJJVChpZHgpKTsNCj4gPiANCj4gDQo+IFRoZXJlIGFyZSB0d28gbW9k
ZXMgaW4gTWl4ZXIuDQo+IDEuIEJhY2tncm91bmQgcmVsYXkgbW9kZTogYWxsIGxheWVycyBvZmYN
Cj4gMi4gTm9ybWFsIG1peCBtb2RlOiBhdCBsZWFzdCBvbmUgbGF5ZXIgb24NCj4gVGhlIHRpbWlu
ZyBvZiB0aGUgdHdvIG1vZGVzIGlzIGRpZmZlcmVudCwgc28ga2VlcCB1c2luZyB0aGUgbm9ybWFs
IG1peA0KPiBtb2RlLg0KPiBKdXN0IHNldCB0aGUgbGF5ZXIgcmVnaW9uIHRvIDAgd2hlbiB0aGUg
bGF5ZXIgb2ZmLg0KDQpsYXllcl9vbigpIGFuZCBsYXllcl9vZmYoKSBkb2VzIGRpZmZlcmVudCB0
aGluZ3MuIENvbXBhcmluZyBiZWZvcmUgdHVybg0Kb24gYSBsYXllciB3aXRoIGFmdGVyIHR1cm4g
b24tPm9mZiBhIGxheWVyLCB0aGUgcmVnaXN0ZXIgc2V0dGluZyBhcmUNCmRpZmZlcmVudC4gSSB3
b3VsZCBsaWtlIGp1c3QgcmVzdG9yZSB0aGUgcmVnaXN0ZXIuIA0KDQpSZWdhcmRzLA0KQ0sNCg0K
PiANCj4gPiA+ICt9DQo+ID4gPiArDQoNCg0K

