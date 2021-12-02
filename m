Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 642ED465C1C
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 03:24:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9F46E8E6;
	Thu,  2 Dec 2021 02:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520F46E8E6
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 02:24:52 +0000 (UTC)
X-UUID: 0f68d2f4c5b24904ab84f28d041a0082-20211202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=AHmsPye+oS64Ia2j1cF6tOC8bwi1WXzPgbpY1A+/Zes=; 
 b=gVwC207Hd9CF1d89Sv/Gp16WE5bj+VcaByiMs8DFovLK4rH5LIXQ4TMkP1uyjPtlcX7kBtpFLQPWYE4wbeeWawLqiQ5v+wHDzOmBogxXH8x4flv+U0QYeqvIrAYc0d3SrUZYI82eLMxB8uBZwlQPhTi895PkqGWPV++0LiKnRKg=;
X-UUID: 0f68d2f4c5b24904ab84f28d041a0082-20211202
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 196802609; Thu, 02 Dec 2021 10:24:48 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 2 Dec 2021 10:24:47 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 2 Dec 2021 10:24:46 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Dec 2021 10:24:45 +0800
Message-ID: <a33337000556c17e7de0f1ffe43cf21f159b4582.camel@mediatek.com>
Subject: Re: [PATCH v11, 01/19] media: mtk-vcodec: Get numbers of register
 bases from DT
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Date: Thu, 2 Dec 2021 10:24:44 +0800
In-Reply-To: <5e350a02-eb4b-5080-8d13-fe01ccf5dd70@collabora.com>
References: <20211129034201.5767-1-yunfei.dong@mediatek.com>
 <20211129034201.5767-2-yunfei.dong@mediatek.com>
 <5e350a02-eb4b-5080-8d13-fe01ccf5dd70@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
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
Cc: Irui Wang <irui.wang@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQmVuamFtaW4sDQoNClRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uLg0KT24gVHVlLCAyMDIx
LTExLTMwIGF0IDE0OjIwICswMTAwLCBCZW5qYW1pbiBHYWlnbmFyZCB3cm90ZToNCj4gTGUgMjkv
MTEvMjAyMSDDoCAwNDo0MSwgWXVuZmVpIERvbmcgYSDDqWNyaXQgOg0KPiA+IERpZmZlcmVudCBw
bGF0Zm9ybSBtYXkgaGFzIGRpZmZlcmVudCBudW1iZXJzIG9mIHJlZ2lzdGVyIGJhc2VzLg0KPiA+
IEdldHMgdGhlDQo+ID4gbnVtYmVycyBvZiByZWdpc3RlciBiYXNlcyBmcm9tIERUIChzaXplb2Yo
dTMyKSAqIDQgYnl0ZXMgZm9yIGVhY2gpLg0KPiA+IA0KPiA+IFJldmlld2VkLWJ5OiBUenVuZy1C
aSBTaGloPHR6dW5nYmlAZ29vZ2xlLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZdW5mZWkgRG9u
ZyA8eXVuZmVpLmRvbmdAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAgLi4uL3BsYXRmb3Jt
L210ay12Y29kZWMvbXRrX3Zjb2RlY19kZWNfZHJ2LmMgIHwgMzcNCj4gPiArKysrKysrKysrKysr
Ky0tLS0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlv
bnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGst
dmNvZGVjL210a192Y29kZWNfZGVjX2Rydi5jIA0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tdGstdmNvZGVjL210a192Y29kZWNfZGVjX2Rydi5jDQo+ID4gaW5kZXggZTZlNmE4MjAzZWVi
Li41OWNhZjIxNjMzNDkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
dGstdmNvZGVjL210a192Y29kZWNfZGVjX2Rydi5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZGVjX2Rydi5jDQo+ID4gQEAgLTc4LDYgKzc4
LDMwIEBAIHN0YXRpYyBpcnFyZXR1cm5fdA0KPiA+IG10a192Y29kZWNfZGVjX2lycV9oYW5kbGVy
KGludCBpcnEsIHZvaWQgKnByaXYpDQo+ID4gICAJcmV0dXJuIElSUV9IQU5ETEVEOw0KPiA+ICAg
fQ0KPiA+ICAgDQo+ID4gK3N0YXRpYyBpbnQgbXRrX3Zjb2RlY19nZXRfcmVnX2Jhc2VzKHN0cnVj
dCBtdGtfdmNvZGVjX2RldiAqZGV2KQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2ID0gZGV2LT5wbGF0X2RldjsNCj4gPiArCWludCByZWdfbnVtLCBpOw0KPiA+ICsN
Cj4gPiArCS8qIFNpemVvZih1MzIpICogNCBieXRlcyBmb3IgZWFjaCByZWdpc3RlciBiYXNlLiAq
Lw0KPiA+ICsJcmVnX251bSA9IG9mX3Byb3BlcnR5X2NvdW50X2VsZW1zX29mX3NpemUocGRldi0+
ZGV2Lm9mX25vZGUsDQo+ID4gInJlZyIsDQo+ID4gKwkJc2l6ZW9mKHUzMikgKiA0KTsNCj4gDQo+
IEl0IGxvb2tzIHN0cmFuZ2UgZm9yIG1lIHRvIGhhdmUgYSAicmVnIiBzaXplIGVxdWFsIHRvIHNp
emVvZih1MzIpICoNCj4gNC4gVXN1YWxseQ0KPiB3ZSBtb3JlIHNlZSByZWcgc2l6ZSA9IHNpemVv
Zih1MzIpLg0KPiANCkZvciB0aGUgZGVmaW5pdGlvbiBvZiByZWcgaW4gZHRzaSBpcyByZWcgPSA8
MCAweDE2MDAwMDAwIDAgMHg4MDA+LA0KTmVlZCB0byB1c2luZyBzaXplb2YodTMyKSAqIDQsIG5v
dCBzaXplb2YodTMyKS4NCj4gPiArCWlmIChyZWdfbnVtIDw9IDAgfHwgcmVnX251bSA+IE5VTV9N
QVhfVkRFQ19SRUdfQkFTRSkgew0KPiANCj4gSWYgcmVnX251bSA9IE5VTV9NQVhfVkRFQ19SRUdf
QkFTRSB5b3Ugd2lsbCBpdGVyYXRlIG91dCBvZiBib3VuZHMgb2YNCj4gZGV2LT5yZWdfYmFzZSBh
cnJheS4NCj4gVGhhdCBuZXZlciBoYXBwZW5zIGJlY2F1c2UgZGV2LT5yZWdfYmFzZSBzaXplIGVx
dWFsDQo+IE5VTV9NQVhfVkNPREVDX1JFR19CQVNFLg0KPiBUaGUgcXVlc3Rpb24gaXMgd2hhdCBp
cyB0aGUgcmVhbCBuZWVkZWQgc2l6ZSBmb3IgZGV2LT5yZWdfYmFzZSBhcnJheQ0KPiA/IE5VTV9N
QVhfVkRFQ19SRUdfQkFTRSBvcg0KPiBOVU1fTUFYX1ZDT0RFQ19SRUdfQkFTRSA/DQo+IA0KPiBO
VU1fTUFYX1ZERUNfUkVHX0JBU0UgaXMgdXNlZCBmb3IgdmlkZW8gZGVjb2RlciwgYW5kDQo+IE5V
TV9NQVhfVkNPREVDX1JFR19CQVNFIGlzIHVzZWQgZm9yIGVuY29kZXIuDQoNClRoZSBtYXggcmVn
aXN0ZXIgbnVtYmVyIG9mIHZpZGVvIGRlY29kZXIgaXMgTlVNX01BWF9WREVDX1JFR19CQVNFLCBh
bmQNCnRoZSByYW5nZXMgaXMgMCB+IE5VTV9NQVhfVkRFQ19SRUdfQkFTRSAtIDEuDQoNCj4gUmVn
YXJkcywNCj4gQmVuamFtaW4NCj4gDQpCZXN0IFJlZ2FyZHMsDQpZdW5mZWkgRG9uZw0KPiA+ICsJ
CWRldl9lcnIoJnBkZXYtPmRldiwgIkludmFsaWQgcmVnaXN0ZXIgcHJvcGVydHkgc2l6ZToNCj4g
PiAlZFxuIiwgcmVnX251bSk7DQo+ID4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gKwl9DQo+ID4g
Kw0KPiA+ICsJZm9yIChpID0gMDsgaSA8IHJlZ19udW07IGkrKykgew0KPiA+ICsJCWRldi0+cmVn
X2Jhc2VbaV0gPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwNCj4gPiBpKTsN
Cj4gPiArCQlpZiAoSVNfRVJSKGRldi0+cmVnX2Jhc2VbaV0pKQ0KPiA+ICsJCQlyZXR1cm4gUFRS
X0VSUihkZXYtPnJlZ19iYXNlW2ldKTsNCj4gPiArDQo+ID4gKwkJbXRrX3Y0bDJfZGVidWcoMiwg
InJlZ1slZF0gYmFzZT0lcCIsIGksIGRldi0NCj4gPiA+cmVnX2Jhc2VbaV0pOw0KPiA+ICsJfQ0K
PiA+ICsNCj4gPiArCXJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICAgc3RhdGljIGludCBm
b3BzX3Zjb2RlY19vcGVuKHN0cnVjdCBmaWxlICpmaWxlKQ0KPiA+ICAgew0KPiA+ICAgCXN0cnVj
dCBtdGtfdmNvZGVjX2RldiAqZGV2ID0gdmlkZW9fZHJ2ZGF0YShmaWxlKTsNCj4gPiBAQCAtMjA2
LDcgKzIzMCw3IEBAIHN0YXRpYyBpbnQgbXRrX3Zjb2RlY19wcm9iZShzdHJ1Y3QNCj4gPiBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gICAJc3RydWN0IHJlc291cmNlICpyZXM7DQo+ID4gICAJ
cGhhbmRsZSBycHJvY19waGFuZGxlOw0KPiA+ICAgCWVudW0gbXRrX3Zjb2RlY19md190eXBlIGZ3
X3R5cGU7DQo+ID4gLQlpbnQgaSwgcmV0Ow0KPiA+ICsJaW50IHJldDsNCj4gPiAgIA0KPiA+ICAg
CWRldiA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmRldiksIEdGUF9LRVJORUwp
Ow0KPiA+ICAgCWlmICghZGV2KQ0KPiA+IEBAIC0yMzgsMTQgKzI2Miw5IEBAIHN0YXRpYyBpbnQg
bXRrX3Zjb2RlY19wcm9iZShzdHJ1Y3QNCj4gPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4g
ICAJCWdvdG8gZXJyX2RlY19wbTsNCj4gPiAgIAl9DQo+ID4gICANCj4gPiAtCWZvciAoaSA9IDA7
IGkgPCBOVU1fTUFYX1ZERUNfUkVHX0JBU0U7IGkrKykgew0KPiA+IC0JCWRldi0+cmVnX2Jhc2Vb
aV0gPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwNCj4gPiBpKTsNCj4gPiAt
CQlpZiAoSVNfRVJSKChfX2ZvcmNlIHZvaWQgKilkZXYtPnJlZ19iYXNlW2ldKSkgew0KPiA+IC0J
CQlyZXQgPSBQVFJfRVJSKChfX2ZvcmNlIHZvaWQgKilkZXYtDQo+ID4gPnJlZ19iYXNlW2ldKTsN
Cj4gPiAtCQkJZ290byBlcnJfcmVzOw0KPiA+IC0JCX0NCj4gPiAtCQltdGtfdjRsMl9kZWJ1Zygy
LCAicmVnWyVkXSBiYXNlPSVwIiwgaSwgZGV2LQ0KPiA+ID5yZWdfYmFzZVtpXSk7DQo+ID4gLQl9
DQo+ID4gKwlyZXQgPSBtdGtfdmNvZGVjX2dldF9yZWdfYmFzZXMoZGV2KTsNCj4gPiArCWlmIChy
ZXQpDQo+ID4gKwkJZ290byBlcnJfcmVzOw0KPiA+ICAgDQo+ID4gICAJcmVzID0gcGxhdGZvcm1f
Z2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfSVJRLCAwKTsNCj4gPiAgIAlpZiAocmVzID09
IE5VTEwpIHsNCg==

