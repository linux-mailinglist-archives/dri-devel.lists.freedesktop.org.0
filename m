Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC43444DC8
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 04:36:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E147D7B60D;
	Thu,  4 Nov 2021 03:36:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3082F7B60B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 03:36:22 +0000 (UTC)
X-UUID: c2e73dc25b5e4691b8eec0631de02356-20211104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=jyivBy6suiwNi0Rud/PxmeHxAt9PJF265dfp0MCeEzQ=; 
 b=pQJ6AaFjNaZKSYDrrSxT9w9YVy3S3NpvcH2gGGnwWIJlrgRCkE3v0tcz2royyAgmjPww4WFCuBcfZXOhi8X81hnAnFaW2O8eFBlhCIDyVxK0/tg6eFxfcV6JJTUHWO6ETAusvMKBboyK8ulxUmFqHHZugoqMqZ6lxd8IV4ss8gI=;
X-UUID: c2e73dc25b5e4691b8eec0631de02356-20211104
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jitao.shi@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1617173493; Thu, 04 Nov 2021 11:36:18 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 4 Nov 2021 11:36:17 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkexhb02.mediatek.inc (172.21.101.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Nov 2021 11:36:17 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 4 Nov 2021 11:36:16 +0800
Message-ID: <ad925a6c1438b78f3c79b37fd0a545c9eb153a59.camel@mediatek.com>
Subject: Re: [PATCH v7 1/3] drm/dsi: transer dsi hs packet aligned
From: Jitao Shi <jitao.shi@mediatek.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>
Date: Thu, 4 Nov 2021 11:36:16 +0800
In-Reply-To: <CAAOTY_8H=TE8574xB3FFcGVgN_fTb_83+FT8ei1CDuB4k4-Oew@mail.gmail.com>
References: <20210915223117.7857-1-jitao.shi@mediatek.com>
 <20210915223117.7857-2-jitao.shi@mediatek.com>
 <CAAOTY_8H=TE8574xB3FFcGVgN_fTb_83+FT8ei1CDuB4k4-Oew@mail.gmail.com>
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
Cc: Rex-BC Chen <rex-bc.chen@mediatek.com>, shuijing.li@mediatek.com,
 David Airlie <airlied@linux.ie>, huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgc2lycw0KDQpQbHMgaGVscCB0byByZXZpZXcgdGhpcyBjaGFuZ2UuDQoNCkJlc3QgUmVnYXJk
cw0KSml0YW8uDQoNCk9uIFR1ZSwgMjAyMS0xMC0wNSBhdCAwNzo1MyArMDgwMCwgQ2h1bi1LdWFu
ZyBIdSB3cm90ZToNCj4gSGksIEppdGFvOg0KPiANCj4gSml0YW8gU2hpIDxqaXRhby5zaGlAbWVk
aWF0ZWsuY29tPiDmlrwgMjAyMeW5tDnmnIgxNuaXpSDpgLHlm5sg5LiK5Y2INjozMeWvq+mBk++8
mg0KPiA+IA0KPiA+IFNvbWUgRFNJIGRldmljZXMgcmVxaXJlIHRoZSBocyBwYWNrZXQgc3RhcnRp
bmcgYW5kIGVuZGluZw0KPiA+IGF0IHNhbWUgdGltZSBvbiBhbGwgZHNpIGxhbmVzLiBTbyB1c2Ug
YSBmbGFnIHRvIHRob3NlIGRldmljZXMuDQo+ID4gDQo+IA0KPiBSZXZpZXdlZC1ieTogQ2h1bi1L
dWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+DQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6
IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgaW5jbHVk
ZS9kcm0vZHJtX21pcGlfZHNpLmggfCAyICsrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX21pcGlfZHNp
LmgNCj4gPiBiL2luY2x1ZGUvZHJtL2RybV9taXBpX2RzaS5oDQo+ID4gaW5kZXggYWY3YmE4MDcx
ZWIwLi44ZTg1NjM3OTI2ODIgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX21pcGlf
ZHNpLmgNCj4gPiArKysgYi9pbmNsdWRlL2RybS9kcm1fbWlwaV9kc2kuaA0KPiA+IEBAIC0xNzcs
NiArMTc3LDcgQEAgc3RydWN0IG1pcGlfZHNpX2RldmljZV9pbmZvIHsNCj4gPiAgICogQGxwX3Jh
dGU6IG1heGltdW0gbGFuZSBmcmVxdWVuY3kgZm9yIGxvdyBwb3dlciBtb2RlIGluIGhlcnR6LA0K
PiA+IHRoaXMgc2hvdWxkDQo+ID4gICAqIGJlIHNldCB0byB0aGUgcmVhbCBsaW1pdHMgb2YgdGhl
IGhhcmR3YXJlLCB6ZXJvIGlzIG9ubHkNCj4gPiBhY2NlcHRlZCBmb3INCj4gPiAgICogbGVnYWN5
IGRyaXZlcnMNCj4gPiArICogQGhzX3BhY2tldF9lbmRfYWxpZ25lZDogdHJhbnNmZXIgZHNpIGhz
IHBhY2tldCBlbmRpbmcgYWxpZ25lZA0KPiA+ICAgKi8NCj4gPiAgc3RydWN0IG1pcGlfZHNpX2Rl
dmljZSB7DQo+ID4gICAgICAgICBzdHJ1Y3QgbWlwaV9kc2lfaG9zdCAqaG9zdDsNCj4gPiBAQCAt
MTg5LDYgKzE5MCw3IEBAIHN0cnVjdCBtaXBpX2RzaV9kZXZpY2Ugew0KPiA+ICAgICAgICAgdW5z
aWduZWQgbG9uZyBtb2RlX2ZsYWdzOw0KPiA+ICAgICAgICAgdW5zaWduZWQgbG9uZyBoc19yYXRl
Ow0KPiA+ICAgICAgICAgdW5zaWduZWQgbG9uZyBscF9yYXRlOw0KPiA+ICsgICAgICAgYm9vbCBo
c19wYWNrZXRfZW5kX2FsaWduZWQ7DQo+ID4gIH07DQo+ID4gDQo+ID4gICNkZWZpbmUgTUlQSV9E
U0lfTU9EVUxFX1BSRUZJWCAibWlwaS1kc2k6Ig0KPiA+IC0tDQo+ID4gMi4yNS4xDQo=

