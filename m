Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C06273D871E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 07:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8596E027;
	Wed, 28 Jul 2021 05:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9B96E027
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 05:21:09 +0000 (UTC)
X-UUID: a3f7b7f9a8ba434ba4bc59eebf1e5dfb-20210728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=K31VI0Q2wfSoWAA+OtQW+zkU6Kz1I+iyytddAARfBA8=; 
 b=ZB0vQuQvmSEEJiM2x7ATikZYSlvnpIzEb511mg+rhTsUnmcderm2N9o3bHjz53MsBDTsAK3nitcZ/ykb90ehPIdifMpSf0qD6+VTZ6S45OXZnlPz5pkD/0CgWGCMlQnN+yI7kDRiX5Qfj+qPUuIja+3kJrelS+eqbMfGLItS4Y8=;
X-UUID: a3f7b7f9a8ba434ba4bc59eebf1e5dfb-20210728
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1555124916; Wed, 28 Jul 2021 13:21:06 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Jul 2021 13:21:04 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 28 Jul 2021 13:21:04 +0800
Message-ID: <c8860122beb3263025fad139e507f496bd563820.camel@mediatek.com>
Subject: Re: [PATCH v2 04/14] dt-bindings: reset: mt8195: Move reset
 controller constants into common location
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Wed, 28 Jul 2021 13:21:04 +0800
In-Reply-To: <CAFqH_50qC985oTcPWDLRJt6yVvwtHsizPOTnTMBh84m6Hy6hFQ@mail.gmail.com>
References: <20210722094551.15255-1-nancy.lin@mediatek.com>
 <20210722094551.15255-5-nancy.lin@mediatek.com>
 <CAFqH_50qC985oTcPWDLRJt6yVvwtHsizPOTnTMBh84m6Hy6hFQ@mail.gmail.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRW5yaWMsDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXcuDQoNCk9uIEZyaSwgMjAyMS0wNy0y
MyBhdCAxMzoxMCArMDIwMCwgRW5yaWMgQmFsbGV0Ym8gU2VycmEgd3JvdGU6DQo+IEhpIE5hbmN5
LA0KPiANCj4gVGhhbmsgeW91IGZvciB5b3VyIHBhdGNoDQo+IA0KPiBNaXNzYXRnZSBkZSBOYW5j
eS5MaW4gPG5hbmN5LmxpbkBtZWRpYXRlay5jb20+IGRlbCBkaWEgZGouLCAyMiBkZQ0KPiBqdWwu
DQo+IDIwMjEgYSBsZXMgMTE6NDY6DQo+ID4gDQo+ID4gVGhlIERUIGJpbmRpbmcgaW5jbHVkZXMg
Zm9yIHJlc2V0IGNvbnRyb2xsZXJzIGFyZSBsb2NhdGVkIGluDQo+ID4gaW5jbHVkZS9kdC1iaW5k
aW5ncy9yZXNldC8uIE1vdmUgdGhlIE1lZGlhdGVrIHJlc2V0IGNvbnN0YW50cyBpbg0KPiA+IHRo
ZXJlLg0KPiA+IA0KPiANCj4gSSB0aGluayB0aGF0IHRoZSBwYXRjaCB0aGF0IGludHJvZHVjZXMg
bXQ4MTk1LXJlc2V0cy5oIGludG8gdGhlDQo+IHJlc2V0LWNvbnRyb2xsZXIgZGlyZWN0b3J5IGRp
ZG4ndCBsYW5kIHlldCwgcGxlYXNlIHN5bmMgd2l0aCB0aGUNCj4gYXV0aG9yIG9mIHRoYXQgcGF0
Y2ggYW5kIGp1c3QgcHV0IGl0IGluIHRoZSBjb3JyZWN0IHBsYWNlIHRoZSBmaXJzdA0KPiB0aW1l
Lg0KPiANCj4gVGhhbmtzLA0KPiAgIEVucmljDQo+IA0KT0ssIEkgd2l0aCBzeW5jIHdpdGggdGhl
IGF1dGhvci4NCg0KPiA+IFNpZ25lZC1vZmYtYnk6IE5hbmN5LkxpbiA8bmFuY3kubGluQG1lZGlh
dGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgaW5jbHVkZS9kdC1iaW5kaW5ncy97cmVzZXQtY29udHJv
bGxlciA9PiByZXNldH0vbXQ4MTk1LXJlc2V0cy5oIHwNCj4gPiAwDQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAwIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pDQo+ID4gIHJlbmFtZSBpbmNsdWRl
L2R0LWJpbmRpbmdzL3tyZXNldC1jb250cm9sbGVyID0+IHJlc2V0fS9tdDgxOTUtDQo+ID4gcmVz
ZXRzLmggKDEwMCUpDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3Mv
cmVzZXQtY29udHJvbGxlci9tdDgxOTUtcmVzZXRzLmgNCj4gPiBiL2luY2x1ZGUvZHQtYmluZGlu
Z3MvcmVzZXQvbXQ4MTk1LXJlc2V0cy5oDQo+ID4gc2ltaWxhcml0eSBpbmRleCAxMDAlDQo+ID4g
cmVuYW1lIGZyb20gaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210ODE5NS1y
ZXNldHMuaA0KPiA+IHJlbmFtZSB0byBpbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0L210ODE5NS1y
ZXNldHMuaA0KPiA+IC0tDQo+ID4gMi4xOC4wDQo+ID4gDQo=

