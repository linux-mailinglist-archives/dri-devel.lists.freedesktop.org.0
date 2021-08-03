Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7135E3DF23A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 18:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8F689BA3;
	Tue,  3 Aug 2021 16:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5C989C17
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 16:11:38 +0000 (UTC)
X-UUID: 512af250da564cc3a0eaba2d4b0b7abd-20210804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=PQvNGawBaUGH/ESbR10yTDKg08E6F+lDTbg2rOp8l1A=; 
 b=cawuXXkBN/jp9dtemeD5ppEBXNy5f+tipqI8eMa7rpr4kN3C6ZPX9wTQcJTF3Ig+K2aYJG9/5pf6/pVjXcAuj5KYaZIDvyZwGPZVn4E1+HK/7088MNwwq1pJRfnhZqRNdEgTos9Rv5zCFGf/tgdCvqS3YVas2yBpfduwSMP6ajg=;
X-UUID: 512af250da564cc3a0eaba2d4b0b7abd-20210804
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 414048223; Wed, 04 Aug 2021 00:11:34 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 Aug 2021 00:11:33 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 4 Aug 2021 00:11:33 +0800
Message-ID: <134fedc082a5d698f2f3a2143c0ce8757f3aaf0c.camel@mediatek.com>
Subject: Re: [PATCH v5 1/6] arm64: dts: mt8195: add display node for vdosys0
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Enric
 Balletbo i Serra" <enric.balletbo@collabora.com>, <fshao@chromium.org>,
 "David Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi
 Wang <hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 "Nancy Lin" <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>, DTML
 <devicetree@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, DRI Development
 <dri-devel@lists.freedesktop.org>
Date: Wed, 4 Aug 2021 00:11:33 +0800
In-Reply-To: <CAAOTY_9sasTb=W3Kkhx-UZ-ATSe_ge8A14pmOHFCOQjag89r0Q@mail.gmail.com>
References: <20210729170737.21424-1-jason-jh.lin@mediatek.com>
 <20210729170737.21424-2-jason-jh.lin@mediatek.com>
 <CAAOTY_9sasTb=W3Kkhx-UZ-ATSe_ge8A14pmOHFCOQjag89r0Q@mail.gmail.com>
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

SGkgQ0ssDQoNCk9uIFN1biwgMjAyMS0wOC0wMSBhdCAwODozNiArMDgwMCwgQ2h1bi1LdWFuZyBI
dSB3cm90ZToNCj4gSGksIEphc29uOg0KPiANCj4gamFzb24tamgubGluIDxqYXNvbi1qaC5saW5A
bWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5tDfmnIgzMOaXpSDpgLHkupQg5LiK5Y2IMTowN+Wvq+mB
k++8mg0KPiA+IA0KPiA+IEFkZCBkaXNwbGF5IG5vZGUgZm9yIHZkb3N5czAuDQo+ID4gDQo+ID4g
U2lnbmVkLW9mZi1ieTogamFzb24tamgubGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0K
PiA+IC0tLQ0KPiA+IFRoaXMgcGF0Y2ggaXMgYmFzZWQgb24gWzFdWzJdWzNdWzRdDQo+ID4gDQo+
ID4gWzFdYXJtNjQ6IGR0czogQWRkIE1lZGlhdGVrIFNvQyBNVDgxOTUgYW5kIGV2YWx1YXRpb24g
Ym9hcmQgZHRzIGFuZA0KPiA+IE1ha2VmaWxlDQo+ID4gLSANCj4gPiBodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1l
ZGlhdGVrL3BhdGNoLzIwMjEwNjAxMDc1MzUwLjMxNTE1LTItc2VpeWEud2FuZ0BtZWRpYXRlay5j
b20vX187ISFDVFJOS0E5d01nMEFSYnchM2JqZmpHZjJHWUo1RlE1RVdzakc5eVBHd2Y2dVZNdjhk
RHlYTFkyVGxxX3NUY3plSUprRURUV1Z0MWR4cDRiN3RvamokDQo+ID4gIA0KPiA+IFsyXWFybTY0
OiBkdHM6IG10ODE5NTogYWRkIElPTU1VIGFuZCBzbWkgbm9kZXMNCj4gPiAtIA0KPiA+IGh0dHBz
Oi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2pl
Y3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyMTA2MTUxNzMyMzMuMjY2ODItMTUtdGluZ2hhbi5z
aGVuQG1lZGlhdGVrLmNvbS9fXzshIUNUUk5LQTl3TWcwQVJidyEzYmpmakdmMkdZSjVGUTVFV3Nq
Rzl5UEd3ZjZ1Vk12OGREeVhMWTJUbHFfc1RjemVJSmtFRFRXVnQxZHhwMHNmWFBjLSQNCj4gPiAg
DQo+ID4gWzNdYXJtNjQ6IGR0czogbXQ4MTk1OiBhZGQgZ2NlIG5vZGUNCj4gPiAtIA0KPiA+IGh0
dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3By
b2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyMTA3MDUwNTM0MjkuNDM4MC00LWphc29uLWpo
LmxpbkBtZWRpYXRlay5jb20vX187ISFDVFJOS0E5d01nMEFSYnchM2JqZmpHZjJHWUo1RlE1RVdz
akc5eVBHd2Y2dVZNdjhkRHlYTFkyVGxxX3NUY3plSUprRURUV1Z0MWR4cDV1dzZjcUIkDQo+ID4g
IA0KPiA+IFs0XWFkZCBtdDgxOTUgU29DIERSTSBiaW5kaW5nDQo+ID4gLSANCj4gPiBodHRwczov
L3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0
L2xpbnV4LW1lZGlhdGVrL2xpc3QvP3Nlcmllcz01MTk1OTdfXzshIUNUUk5LQTl3TWcwQVJidyEz
YmpmakdmMkdZSjVGUTVFV3NqRzl5UEd3ZjZ1Vk12OGREeVhMWTJUbHFfc1RjemVJSmtFRFRXVnQx
ZHhwMHFuMWltUiQNCj4gPiAgDQo+ID4gLS0tDQo+ID4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVk
aWF0ZWsvbXQ4MTk1LmR0c2kgfCAxMTINCj4gPiArKysrKysrKysrKysrKysrKysrKysrKw0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMTEyIGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0
IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTUuZHRzaQ0KPiA+IGIvYXJjaC9h
cm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTUuZHRzaQ0KPiA+IGluZGV4IDA0ZDNlOTUxNzVm
YS4uNGZhNDdjYjJiZWRlIDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVk
aWF0ZWsvbXQ4MTk1LmR0c2kNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVr
L210ODE5NS5kdHNpDQo+ID4gQEAgLTExNTUsOSArMTE1NSwxMjEgQEANCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAjY2xvY2stY2VsbHMgPSA8MT47DQo+ID4gICAgICAgICAgICAgICAgIH07
DQo+ID4gDQo+IA0KPiBbc25pcF0NCj4gDQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBtZXJn
ZTA6IGRpc3BfdnBwX21lcmdlMEAxYzAxNDAwMCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTUtZGlzcC1tZXJnZSI7DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcmVnID0gPDAgMHgxYzAxNDAwMCAwIDB4MTAwMD47DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDY1Ng0KPiA+IElSUV9U
WVBFX0xFVkVMX0hJR0ggMD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcG93ZXItZG9t
YWlucyA9IDwmc3BtDQo+ID4gTVQ4MTk1X1BPV0VSX0RPTUFJTl9WRE9TWVMwPjsNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JnZkb3N5czAgQ0xLX1ZETzBfVlBQX01FUkdF
MD47DQo+IA0KPiBXaHkgdGhpcyBtZXJnZSBoYXMgbm8gYXN5bmMgY2xvY2s/DQo+IA0KPiBSZWdh
cmRzLA0KPiBDaHVuLUt1YW5nLg0KPiANCk9ubHkgdGhlIE1FUkdFIGxpbmtlZCB0byB0aGUgZGlz
cGxheSBmdW5jdGlvbiBibG9jayB0aGF0IGlzIGNyb3NzDQp2ZG9zeXMwIHRvIHZkb3N5czEgbmVl
ZCB0byBhZGQgYXN5bmMgY2xvY2suDQoNCkknbGwgYWRkIHRoaXMgZGVzY3JpcHRpb24gaW50byB0
aGlzIHBhdGNoIFsxXQ0KWzFdIA0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0
L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjEwNzI5MTU0OTEyLjIwMDUxLTQtamFzb24tamgubGlu
QG1lZGlhdGVrLmNvbS8NCg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0KDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgbWVkaWF0ZWssZ2NlLWNsaWVudC1yZWcgPQ0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDwmZ2NlMSBTVUJTWVNfMWMwMVhYWFggMHg0MDAwDQo+ID4g
MHgxMDAwPjsNCj4gPiArICAgICAgICAgICAgICAgfTsNCj4gPiArDQotLSANCkphc29uLUpIIExp
biA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCg==

