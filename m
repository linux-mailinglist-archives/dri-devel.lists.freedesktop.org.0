Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B0C3F5769
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 06:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D8589D57;
	Tue, 24 Aug 2021 04:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE0789D57
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 04:52:12 +0000 (UTC)
X-UUID: 7454551b4be54174af678cfbae7c6b5c-20210824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=cxDUzdJauAEJfC5ccx4EbSYMfVOiu+2+l7gt7ZpWgV4=; 
 b=DVM7UWCFB8M680DKU5NEfVCWjLTmSFBhcOChtEJJbqsaMxbQnvOfE0aNiV4hezEyj6S0bqb38z0a+yOOulTAEhxwLIyiQ8sMfswpNWoPQYQi1xV17D5j3vdmPteSyxsJcL3cxpuaQWoPWJYM2V8Ar3NlDVqWwMve8anjMuLaIn0=;
X-UUID: 7454551b4be54174af678cfbae7c6b5c-20210824
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 334677553; Tue, 24 Aug 2021 12:52:07 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 12:52:06 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Aug 2021 12:52:05 +0800
Message-ID: <b19a2f09b44b4664182720a6bdb526d338f8db37.camel@mediatek.com>
Subject: Re: [PATCH v3 15/15] drm/mediatek: add mediatek-drm of vdosys1
 support for MT8195
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Rob Herring"
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, DTML
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, <singo.chang@mediatek.com>, 
 srv_heupstream <srv_heupstream@mediatek.com>
Date: Tue, 24 Aug 2021 12:52:06 +0800
In-Reply-To: <CAAOTY_99QLpRHLei2PzD8vsuoOaZae++NqczPCM+r9YMZ01btw@mail.gmail.com>
References: <20210818091847.8060-1-nancy.lin@mediatek.com>
 <20210818091847.8060-16-nancy.lin@mediatek.com>
 <CAAOTY_99QLpRHLei2PzD8vsuoOaZae++NqczPCM+r9YMZ01btw@mail.gmail.com>
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

SGkgQ2h1bi1LdWFuZywNCglUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCk9uIFN1biwgMjAyMS0w
OC0yMiBhdCAwOToxNCArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90ZToNCj4gSGksIE5hbmN5Og0K
PiANCj4gTmFuY3kuTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5tDjmnIgx
OOaXpSDpgLHkuIkg5LiL5Y2INToxOOWvq+mBk++8mg0KPiA+IA0KPiA+IEFkZCBkcml2ZXIgZGF0
YSBvZiBtdDgxOTUgdmRvc3lzMSB0byBtZWRpYXRlay1kcm0gYW5kIG1vZGlmeSBkcm0NCj4gPiBm
b3INCj4gPiBtdWx0aS1tbXN5cyBzdXBwb3J0LiBUaGUgdHdvIG1tc3lzICh2ZG9zeXMwIGFuZCB2
ZG9zeXMxKSB3aWxsIGJyaW5nDQo+ID4gdXAgdHdvIGRybSBkcml2ZXJzLCBvbmx5IG9uZSBkcm0g
ZHJpdmVyIHJlZ2lzdGVyIGFzIHRoZSBkcm0gZGV2aWNlLg0KPiA+IEVhY2ggZHJtIGRyaXZlciBi
aW5kcyBpdHMgb3duIGNvbXBvbmVudC4gVGhlIGZpcnN0IGJpbmQgZHJtIGRyaXZlcg0KPiA+IHdp
bGwgYWxsb2NhdGUgdGhlIGRybSBkZXZpY2UsIGFuZCB0aGUgbGFzdCBiaW5kIGRybSBkcml2ZXIN
Cj4gPiByZWdpc3RlcnMNCj4gPiB0aGUgZHJtIGRldmljZSB0byBkcm0gY29yZS4gRWFjaCBjcnRj
IHBhdGggaXMgY3JlYXRlZCB3aXRoIHRoZQ0KPiA+IGNvcnJlc3BvbmRpbmcgZHJtIGRyaXZlciBk
YXRhLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IE5hbmN5LkxpbiA8bmFuY3kubGluQG1lZGlh
dGVrLmNvbT4NCj4gPiANCj4gPiANCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGRwX2Nv
bXBfZnVuY3MgZGRwX292bF9hZGFwdG9yID0gew0KPiA+ICsgICAgICAgLmNsa19lbmFibGUgPSBt
dGtfZXRoZHJfY2xrX2VuYWJsZSwNCj4gPiArICAgICAgIC5jbGtfZGlzYWJsZSA9IG10a19ldGhk
cl9jbGtfZGlzYWJsZSwNCj4gPiArICAgICAgIC5jb25maWcgPSBtdGtfZXRoZHJfY29uZmlnLA0K
PiA+ICsgICAgICAgLnN0YXJ0ID0gbXRrX2V0aGRyX3N0YXJ0LA0KPiA+ICsgICAgICAgLnN0b3Ag
PSBtdGtfZXRoZHJfc3RvcCwNCj4gPiArICAgICAgIC5sYXllcl9uciA9IG10a19ldGhkcl9sYXll
cl9uciwNCj4gPiArICAgICAgIC5sYXllcl9jb25maWcgPSBtdGtfZXRoZHJfbGF5ZXJfY29uZmln
LA0KPiA+ICsgICAgICAgLmVuYWJsZV92YmxhbmsgPSBtdGtfZXRoZHJfZW5hYmxlX3ZibGFuaywN
Cj4gPiArICAgICAgIC5kaXNhYmxlX3ZibGFuayA9IG10a19ldGhkcl9kaXNhYmxlX3ZibGFuaywN
Cj4gPiArfTsNCj4gDQo+IEkgdGhpbmsgZXRoZHIgaXMgaW5zaWRlIHRoZSBncm91cCBvZiBvdmxf
YWRwYXRvci4gSSBwcmV0ZXIgdGhpcw0KPiBmdW5jdGlvbiBpcyBpbXBsZW1lbnRlZCBieSBvdmxf
YWRhcHRvciwgYW5kIG92bF9hZGFwdG9yIGNvbnRyb2wgcmRtYSwNCj4gbWVyZ2UsIGV0aGRyLg0K
PiANCj4gUmVnYXJkcywNCj4gQ2h1bi1LdWFuZy4NCj4gDQpPSywgSSB3aWxsIGNoYW5nZSBpdCB0
byB0aGUgb3ZsX2FkYXB0b3IgZnVuY3Rpb24uDQoNCj4gPiArDQo+ID4gDQo=

