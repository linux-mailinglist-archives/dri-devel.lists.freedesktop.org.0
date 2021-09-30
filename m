Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E6841D1D8
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 05:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210856E2D1;
	Thu, 30 Sep 2021 03:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB426E2D1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 03:28:16 +0000 (UTC)
X-UUID: 7f99426116984e4e82f32662b5e1824b-20210930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=PUbrJ3OGRNIhFg0lP0OUuhqkMUmrG7lCbGwhX9NNv8I=; 
 b=fyhWP3a8ryvYzvl/+BcS1BevoTk8b7BSv/6fXTrv/0FJHzhAzSJ9EvZsZZOdtHQCJpzPezquq8qd8ib5G+etIueXIhiV6osK9o/XNzlJRd14yCGqik5DCS7rzqn/9x2GItVxSYy7jrBQPSt1k+koUgmZjtjH7drpKIqvXeprZhA=;
X-UUID: 7f99426116984e4e82f32662b5e1824b-20210930
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1737133217; Thu, 30 Sep 2021 11:28:11 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 30 Sep 2021 11:28:11 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Sep 2021 11:28:09 +0800
Message-ID: <79cbf64491273797f218f417234b8c95936bd3b1.camel@mediatek.com>
Subject: Re: [PATCH v8 09/12] media: mtk-vcodec: Get rid of
 mtk_smi_larb_get/put
From: Yong Wu <yong.wu@mediatek.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>
CC: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <youlin.pei@mediatek.com>, Matthias Kaehlcke <mka@chromium.org>,
 <anan.sun@mediatek.com>, <yi.kuo@mediatek.com>, <acourbot@chromium.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Daniel
 Vetter" <daniel@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 <anthony.huang@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>,
 Irui Wang <irui.wang@mediatek.com>
Date: Thu, 30 Sep 2021 11:28:12 +0800
In-Reply-To: <02f444d5-9633-3f9c-2d1f-97ce073d1180@collabora.com>
References: <20210929013719.25120-1-yong.wu@mediatek.com>
 <20210929013719.25120-10-yong.wu@mediatek.com>
 <02f444d5-9633-3f9c-2d1f-97ce073d1180@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFmbmEsDQoNClRoYW5rcyB2ZXJ5IG11Y2ggZm9yIHRoZSByZXZpZXcuDQoNCk9uIFdlZCwg
MjAyMS0wOS0yOSBhdCAxNDoxMyArMDIwMCwgRGFmbmEgSGlyc2NoZmVsZCB3cm90ZToNCj4gDQo+
IE9uIDI5LjA5LjIxIDAzOjM3LCBZb25nIFd1IHdyb3RlOg0KPiA+IE1lZGlhVGVrIElPTU1VIGhh
cyBhbHJlYWR5IGFkZGVkIHRoZSBkZXZpY2VfbGluayBiZXR3ZWVuIHRoZQ0KPiA+IGNvbnN1bWVy
DQo+ID4gYW5kIHNtaS1sYXJiIGRldmljZS4gSWYgdGhlIHZjb2RlYyBkZXZpY2UgY2FsbCB0aGUN
Cj4gPiBwbV9ydW50aW1lX2dldF9zeW5jLA0KPiA+IHRoZSBzbWktbGFyYidzIHBtX3J1bnRpbWVf
Z2V0X3N5bmMgYWxzbyBiZSBjYWxsZWQgYXV0b21hdGljYWxseS4NCj4gPiANCj4gPiBDQzogVGlm
ZmFueSBMaW4gPHRpZmZhbnkubGluQG1lZGlhdGVrLmNvbT4NCj4gPiBDQzogSXJ1aSBXYW5nIDxp
cnVpLndhbmdAbWVkaWF0ZWsuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFlvbmcgV3UgPHlvbmcu
d3VAbWVkaWF0ZWsuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBFdmFuIEdyZWVuIDxldmdyZWVuQGNo
cm9taXVtLm9yZz4NCj4gPiBBY2tlZC1ieTogVGlmZmFueSBMaW4gPHRpZmZhbnkubGluQG1lZGlh
dGVrLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogRGFmbmEgSGlyc2NoZmVsZCA8ZGFmbmEuaGlyc2No
ZmVsZEBjb2xsYWJvcmEuY29tPg0KPiA+IC0tLQ0KPiA+ICAgLi4uL3BsYXRmb3JtL210ay12Y29k
ZWMvbXRrX3Zjb2RlY19kZWNfcG0uYyAgIHwgMzcgKysrLS0tLS0tLS0tLS0NCj4gPiAtLQ0KPiA+
ICAgLi4uL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19kcnYuaCAgICAgIHwgIDMgLS0N
Cj4gPiAgIC4uLi9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZW5jLmMgICAgICB8ICAx
IC0NCj4gPiAgIC4uLi9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZW5jX3BtLmMgICB8
IDQ0ICsrKy0tLS0tLS0tLS0tDQo+ID4gLS0tLS0NCj4gPiAgIDQgZmlsZXMgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKSwgNzUgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19wbS5jDQo+ID4g
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19kZWNfcG0uYw0K
PiA+IGluZGV4IDYwMzhkYjk2ZjcxYy4uZDBiZjlhYTNiMjlkIDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19wbS5jDQo+ID4g
KysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZGVjX3Bt
LmMNCj4gPiBAQCAtOCwxNCArOCwxMiBAQA0KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L29mX2FkZHJl
c3MuaD4NCj4gPiAgICNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9ybS5oPg0KPiA+ICAgI2luY2x1
ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4NCj4gPiAtI2luY2x1ZGUgPHNvYy9tZWRpYXRlay9zbWku
aD4NCj4gPiAgIA0KPiA+ICAgI2luY2x1ZGUgIm10a192Y29kZWNfZGVjX3BtLmgiDQo+ID4gICAj
aW5jbHVkZSAibXRrX3Zjb2RlY191dGlsLmgiDQo+ID4gICANCj4gPiAgIGludCBtdGtfdmNvZGVj
X2luaXRfZGVjX3BtKHN0cnVjdCBtdGtfdmNvZGVjX2RldiAqbXRrZGV2KQ0KPiA+ICAgew0KPiA+
IC0Jc3RydWN0IGRldmljZV9ub2RlICpub2RlOw0KPiA+ICAgCXN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXY7DQo+ID4gICAJc3RydWN0IG10a192Y29kZWNfcG0gKnBtOw0KPiA+ICAgCXN0cnVj
dCBtdGtfdmNvZGVjX2NsayAqZGVjX2NsazsNCj4gPiBAQCAtMjYsMTggKzI0LDcgQEAgaW50IG10
a192Y29kZWNfaW5pdF9kZWNfcG0oc3RydWN0IG10a192Y29kZWNfZGV2DQo+ID4gKm10a2RldikN
Cj4gPiAgIAlwbSA9ICZtdGtkZXYtPnBtOw0KPiA+ICAgCXBtLT5tdGtkZXYgPSBtdGtkZXY7DQo+
ID4gICAJZGVjX2NsayA9ICZwbS0+dmRlY19jbGs7DQo+ID4gLQlub2RlID0gb2ZfcGFyc2VfcGhh
bmRsZShwZGV2LT5kZXYub2Zfbm9kZSwgIm1lZGlhdGVrLGxhcmIiLCAwKTsNCj4gPiAtCWlmICgh
bm9kZSkgew0KPiA+IC0JCW10a192NGwyX2Vycigib2ZfcGFyc2VfcGhhbmRsZSBtZWRpYXRlayxs
YXJiIGZhaWwhIik7DQo+ID4gLQkJcmV0dXJuIC0xOw0KPiA+IC0JfQ0KPiA+ICAgDQo+ID4gLQlw
ZGV2ID0gb2ZfZmluZF9kZXZpY2VfYnlfbm9kZShub2RlKTsNCj4gPiAtCW9mX25vZGVfcHV0KG5v
ZGUpOw0KPiA+IC0JaWYgKFdBUk5fT04oIXBkZXYpKSB7DQo+ID4gLQkJcmV0dXJuIC0xOw0KPiA+
IC0JfQ0KPiA+IC0JcG0tPmxhcmJ2ZGVjID0gJnBkZXYtPmRldjsNCj4gPiAgIAlwZGV2ID0gbXRr
ZGV2LT5wbGF0X2RldjsNCj4gPiAgIAlwbS0+ZGV2ID0gJnBkZXYtPmRldjsNCj4gPiAgIA0KPiA+
IEBAIC00NywxNCArMzQsMTEgQEAgaW50IG10a192Y29kZWNfaW5pdF9kZWNfcG0oc3RydWN0DQo+
ID4gbXRrX3Zjb2RlY19kZXYgKm10a2RldikNCj4gPiAgIAkJZGVjX2Nsay0+Y2xrX2luZm8gPSBk
ZXZtX2tjYWxsb2MoJnBkZXYtPmRldiwNCj4gPiAgIAkJCWRlY19jbGstPmNsa19udW0sIHNpemVv
ZigqY2xrX2luZm8pLA0KPiA+ICAgCQkJR0ZQX0tFUk5FTCk7DQo+ID4gLQkJaWYgKCFkZWNfY2xr
LT5jbGtfaW5mbykgew0KPiA+IC0JCQlyZXQgPSAtRU5PTUVNOw0KPiA+IC0JCQlnb3RvIHB1dF9k
ZXZpY2U7DQo+ID4gLQkJfQ0KPiA+ICsJCWlmICghZGVjX2Nsay0+Y2xrX2luZm8pDQo+ID4gKwkJ
CXJldHVybiAtRU5PTUVNOw0KPiA+ICAgCX0gZWxzZSB7DQo+ID4gICAJCW10a192NGwyX2Vycigi
RmFpbGVkIHRvIGdldCB2ZGVjIGNsb2NrIGNvdW50Iik7DQo+ID4gLQkJcmV0ID0gLUVJTlZBTDsN
Cj4gPiAtCQlnb3RvIHB1dF9kZXZpY2U7DQo+ID4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gICAJ
fQ0KPiA+ICAgDQo+ID4gICAJZm9yIChpID0gMDsgaSA8IGRlY19jbGstPmNsa19udW07IGkrKykg
ew0KPiA+IEBAIC02MywyOSArNDcsMjQgQEAgaW50IG10a192Y29kZWNfaW5pdF9kZWNfcG0oc3Ry
dWN0DQo+ID4gbXRrX3Zjb2RlY19kZXYgKm10a2RldikNCj4gPiAgIAkJCSJjbG9jay1uYW1lcyIs
IGksICZjbGtfaW5mby0+Y2xrX25hbWUpOw0KPiA+ICAgCQlpZiAocmV0KSB7DQo+ID4gICAJCQlt
dGtfdjRsMl9lcnIoIkZhaWxlZCB0byBnZXQgY2xvY2sgbmFtZSBpZCA9DQo+ID4gJWQiLCBpKTsN
Cj4gPiAtCQkJZ290byBwdXRfZGV2aWNlOw0KPiA+ICsJCQlyZXR1cm4gcmV0Ow0KPiA+ICAgCQl9
DQo+ID4gICAJCWNsa19pbmZvLT52Y29kZWNfY2xrID0gZGV2bV9jbGtfZ2V0KCZwZGV2LT5kZXYs
DQo+ID4gICAJCQljbGtfaW5mby0+Y2xrX25hbWUpOw0KPiA+ICAgCQlpZiAoSVNfRVJSKGNsa19p
bmZvLT52Y29kZWNfY2xrKSkgew0KPiA+ICAgCQkJbXRrX3Y0bDJfZXJyKCJkZXZtX2Nsa19nZXQg
KCVkKSVzIGZhaWwiLCBpLA0KPiA+ICAgCQkJCWNsa19pbmZvLT5jbGtfbmFtZSk7DQo+ID4gLQkJ
CXJldCA9IFBUUl9FUlIoY2xrX2luZm8tPnZjb2RlY19jbGspOw0KPiA+IC0JCQlnb3RvIHB1dF9k
ZXZpY2U7DQo+ID4gKwkJCXJldHVybiBQVFJfRVJSKGNsa19pbmZvLT52Y29kZWNfY2xrKTsNCj4g
PiAgIAkJfQ0KPiA+ICAgCX0NCj4gPiAgIA0KPiA+ICAgCXBtX3J1bnRpbWVfZW5hYmxlKCZwZGV2
LT5kZXYpOw0KPiA+ICAgCXJldHVybiAwOw0KPiA+IC1wdXRfZGV2aWNlOg0KPiA+IC0JcHV0X2Rl
dmljZShwbS0+bGFyYnZkZWMpOw0KPiA+IC0JcmV0dXJuIHJldDsNCj4gPiAgIH0NCj4gPiAgIA0K
PiA+ICAgdm9pZCBtdGtfdmNvZGVjX3JlbGVhc2VfZGVjX3BtKHN0cnVjdCBtdGtfdmNvZGVjX2Rl
diAqZGV2KQ0KPiA+ICAgew0KPiA+ICAgCXBtX3J1bnRpbWVfZGlzYWJsZShkZXYtPnBtLmRldik7
DQo+ID4gLQlwdXRfZGV2aWNlKGRldi0+cG0ubGFyYnZkZWMpOw0KPiA+ICAgfQ0KPiANCj4gTm93
IHRoYXQgZnVuY3Rpb25zIG9ubHkgZG8gICdwbV9ydW50aW1lX2Rpc2FibGUoZGV2LT5wbS5kZXYp
Oycgc28gaXQNCj4gd2lsbCBiZSBtb3JlDQo+IHJlYWRhYmxlIHRvIHJlbW92ZSB0aGUgZnVuY3Rp
b24gbXRrX3Zjb2RlY19yZWxlYXNlX2RlY19wbQ0KPiBhbmQgcmVwbGFjZSB3aXRoIHBtX3J1bnRp
bWVfZGlzYWJsZShkZXYtPnBtLmRldik7DQo+IFNhbWUgZm9yIHRoZSAnZW5jJyBlcXVpdmFsZW50
Lg0KDQpNYWtlIHNlbnNlLiBCdXQgSXQgbWF5IGJlIG5vdCBwcm9wZXIgaWYgdXNpbmcgcG1fcnVu
dGltZV9kaXNhYmxlDQphcyB0aGUgc3ltbWV0cnkgd2l0aCBtdGtfdmNvZGVjX2luaXRfZGVjX3Bt
IGluIHRoZSBtdGtfdmNvZGVjX3Byb2JlLg0KDQpNYXliZSB3ZSBzaG91bGQgbW92ZSBwbV9ydW50
aW1lX2VuYWJsZSBvdXQgZnJvbSBtdGtfdmNvZGVjX2luaXRfZGVjX3BtDQppbnRvIG10a192Y29k
ZWNfcHJvYmUuIEkgY291bGQgZG8gYSBuZXcgcGF0Y2ggZm9yIHRoaXMuIElzIHRoaXMgb2sgZm9y
DQp5b3U/DQoNCj4gDQo+IFRoYW5rcywNCj4gRGFmbmENCg0KW3NuaXBdDQo=

