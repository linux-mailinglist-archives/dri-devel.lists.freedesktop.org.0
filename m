Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB47510E60D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 07:43:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6E889F53;
	Mon,  2 Dec 2019 06:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6F65E89F53
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 06:43:31 +0000 (UTC)
X-UUID: 7dc2100f29804568af4ecb81e747edfe-20191202
X-UUID: 7dc2100f29804568af4ecb81e747edfe-20191202
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1428788280; Mon, 02 Dec 2019 14:43:29 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 2 Dec 2019 14:43:13 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 2 Dec 2019 14:43:12 +0800
Message-ID: <1575269008.3674.1.camel@mtksdaap41>
Subject: Re: [PATCH v1 3/6] drm/mediatek: handle events when
 enabling/disabling crtc
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Mon, 2 Dec 2019 14:43:28 +0800
In-Reply-To: <20191128024238.9399-4-bibby.hsieh@mediatek.com>
References: <20191128024238.9399-1-bibby.hsieh@mediatek.com>
 <20191128024238.9399-4-bibby.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=mediatek.com; s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=19s7GBXuY9yIpUgA9xWsAVPEjx09DZz7pwIlU0oD5U8=; 
 b=dVb1kjibhL4AnclmLKAjbPqNtPF8qBoEiAA51Rz+JTVgN94B0f3gKLMd6gNxqhwra1Oz04dtbn2+ZdbQlRhRjNi7Uy0AS1I+4wi5+vEUR0Xk9FMzh+se3MolD070LX7ngaswnJWas4sbuvq1Rgz8GgwbquXs5GKnOo5At76QjuI=;
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
Cc: drinkcat@chromium.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tfiga@chromium.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEJpYmJ5Og0KDQpPbiBUaHUsIDIwMTktMTEtMjggYXQgMTA6NDIgKzA4MDAsIEJpYmJ5IEhz
aWVoIHdyb3RlOg0KPiBUaGUgZHJpdmVyIGN1cnJlbnRseSBoYW5kbGVzIHZibGFuayBldmVudHMg
b25seSB3aGVuIHVwZGF0aW5nIHBsYW5lcyBvbg0KPiBhbiBhbHJlYWR5IGVuYWJsZWQgQ1JUQy4g
VGhlIGF0b21pYyB1cGRhdGUgQVBJIGhvd2V2ZXIgYWxsb3dzIHJlcXVlc3RpbmcNCj4gYW4gZXZl
bnQgd2hlbiBlbmFibGluZyBvciBkaXNhYmxpbmcgYSBDUlRDLiBUaGlzIGN1cnJlbnRseSBsZWFk
cyB0bw0KPiBldmVudCBvYmplY3RzIGJlaW5nIGxlYWtlZCBpbiB0aGUga2VybmVsIGFuZCB0byBl
dmVudHMgbm90IGJlaW5nIHNlbnQNCj4gb3V0LiBGaXggaXQuDQoNClJldmlld2VkLWJ5OiBDSyBI
dSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCaWJieSBIc2ll
aCA8YmliYnkuaHNpZWhAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2NydGMuYyB8IDggKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRj
LmMNCj4gaW5kZXggNzFmNDA4OWE4MTE3Li5jYjg3YTUzOGI4ZmYgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMNCj4gQEAgLTMzNCw2ICszMzQsNyBAQCBzdGF0
aWMgaW50IG10a19jcnRjX2RkcF9od19pbml0KHN0cnVjdCBtdGtfZHJtX2NydGMgKm10a19jcnRj
KQ0KPiAgc3RhdGljIHZvaWQgbXRrX2NydGNfZGRwX2h3X2Zpbmkoc3RydWN0IG10a19kcm1fY3J0
YyAqbXRrX2NydGMpDQo+ICB7DQo+ICAJc3RydWN0IGRybV9kZXZpY2UgKmRybSA9IG10a19jcnRj
LT5iYXNlLmRldjsNCj4gKwlzdHJ1Y3QgZHJtX2NydGMgKmNydGMgPSAmbXRrX2NydGMtPmJhc2U7
DQo+ICAJaW50IGk7DQo+ICANCj4gIAlEUk1fREVCVUdfRFJJVkVSKCIlc1xuIiwgX19mdW5jX18p
Ow0KPiBAQCAtMzU3LDYgKzM1OCwxMyBAQCBzdGF0aWMgdm9pZCBtdGtfY3J0Y19kZHBfaHdfZmlu
aShzdHJ1Y3QgbXRrX2RybV9jcnRjICptdGtfY3J0YykNCj4gIAltdGtfZGlzcF9tdXRleF91bnBy
ZXBhcmUobXRrX2NydGMtPm11dGV4KTsNCj4gIA0KPiAgCXBtX3J1bnRpbWVfcHV0KGRybS0+ZGV2
KTsNCj4gKw0KPiArCWlmIChjcnRjLT5zdGF0ZS0+ZXZlbnQgJiYgIWNydGMtPnN0YXRlLT5hY3Rp
dmUpIHsNCj4gKwkJc3Bpbl9sb2NrX2lycSgmY3J0Yy0+ZGV2LT5ldmVudF9sb2NrKTsNCj4gKwkJ
ZHJtX2NydGNfc2VuZF92YmxhbmtfZXZlbnQoY3J0YywgY3J0Yy0+c3RhdGUtPmV2ZW50KTsNCj4g
KwkJY3J0Yy0+c3RhdGUtPmV2ZW50ID0gTlVMTDsNCj4gKwkJc3Bpbl91bmxvY2tfaXJxKCZjcnRj
LT5kZXYtPmV2ZW50X2xvY2spOw0KPiArCX0NCj4gIH0NCj4gIA0KPiAgc3RhdGljIHZvaWQgbXRr
X2NydGNfZGRwX2NvbmZpZyhzdHJ1Y3QgZHJtX2NydGMgKmNydGMpDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
