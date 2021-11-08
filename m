Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE7E447864
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 02:54:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A8B6E16F;
	Mon,  8 Nov 2021 01:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FB46E16F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 01:54:15 +0000 (UTC)
X-UUID: 9c3a9f0c39de4a09a7ee1a189a5fb3bd-20211108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=SXkG4NjbYJJgNkjrAZEd7/3hvt2eAwcw3HNQYVZE3eA=; 
 b=krWFjMcTe/NO6pREzvcu3izL9+5Zyav6qp/yncCbKv4dx2HF4k9uhGjqR7sinujgb17ZWh7pZO9E+SvHhZGOzyRCzLa32F0/kALSKzqDYMMsmbESTiVtKz+4glsd2MR8X0FGbroKK5jhhB5fsqA39xePQNfpQI0UP8JNuJRbdoU=;
X-UUID: 9c3a9f0c39de4a09a7ee1a189a5fb3bd-20211108
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1026459904; Mon, 08 Nov 2021 09:54:11 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Nov 2021 09:54:10 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 8 Nov 2021 09:54:09 +0800
Message-ID: <ad3abc26caaa5de5cc11b06b687e3d4e2c995a07.camel@mediatek.com>
Subject: Re: [PATCH v11, 0/2] soc: mediatek: mmsys: add mt8192 mmsys support
From: yongqiang.niu <yongqiang.niu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
Date: Mon, 8 Nov 2021 09:54:09 +0800
In-Reply-To: <e3f30009-31ae-f37d-5016-bc8677d8d364@gmail.com>
References: <20211008020504.1678-1-yongqiang.niu@mediatek.com>
 <e3f30009-31ae-f37d-5016-bc8677d8d364@gmail.com>
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 David Airlie <airlied@linux.ie>, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIxLTEwLTA4IGF0IDEzOjM3ICswMjAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3Rl
Og0KPiANCj4gT24gMDgvMTAvMjAyMSAwNDowNSwgWW9uZ3FpYW5nIE5pdSB3cm90ZToNCj4gPiBi
YXNlIHY1LjE1DQo+ID4gDQo+ID4gWW9uZ3FpYW5nIE5pdSAoMik6DQo+ID4gICAgc29jOiBtZWRp
YXRlazogbW1zeXM6IGFkZCBjb21wIE9WTF8yTDIvUE9TVE1BU0svUkRNQTQNCj4gPiAgICBzb2M6
IG1lZGlhdGVrOiBtbXN5czogQWRkIG10ODE5MiBtbXN5cyByb3V0aW5nIHRhYmxlDQo+IA0KPiBJ
J20gYSBiaXQgcHV6emxlZCB0aGF0IHlvdSBrZWVwIG9uIHNlbmRpbmcgdGhpcyBzZXJpZXMgd2hp
bGUgSQ0KPiBhY2NlcHRlZCBhbiBvbGRlciANCj4gb25lIGxvbmcgdGltZSBhZ286DQo+IA0KaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9lNGFmYTcxMi05OTM2LTE1ZmMtYWQ0My01NzY5NDg3
NThmNmNAZ21haWwuY29tLw0KPiANCj4gQXMgeW91IGRvbid0IHByb3ZpZGUgYSBjaGFuZ2Vsb2cg
SSdtIG5vdCBhYmxlIHRvIGZpbmQgb3V0IHdoYXQgaGFzDQo+IGNoYW5nZWQuIEkgDQo+IGFsc28g
YXNrZWQgeW91IHRvIGRvdWJsZSBjaGVjayBpZiB0aGUgZml4dXAgSSBkaWQgd2FzIGNvcnJlY3Qs
IGJ1dA0KPiB5b3UgbmV2ZXIgDQo+IGFuc3dlcmVkLg0KPiANCj4gSWYgdGhlcmUgYXJlIGFueXRo
aW5nIHRvIGZpeCBmb3IgdGhpcyBzZXJpZXMgdGhhdCdzIG5vdCBpbiBteSB0cmVlDQo+IHlldCwg
cGxlYXNlIA0KPiBzZW5kIGEgZm9sbG93LXVwIHBhdGNoLg0KPiANCj4gUmVnYXJkcywNCj4gTWF0
dGhpYXMNCj4gDQoNCnRoZSBmaXh1cCB5b3UgaGF2ZSBhZGQgaXMgY29ycmVjdC4NCnRoaXMgdmVy
c2lvbiBvbmx5IGFkanVzdCB0aGUgaGVhZGVyIGZpbGVyIGluY2x1ZGUgc2VxdWVuY2UgaW4gbXRr
LQ0KbW1zeXMuYw0KDQpvcmlnaW5hbCB2ZXJzaW9uDQoNCiNpbmNsdWRlICJtdDgzNjUtbW1zeXMu
aCINCiNpbmNsdWRlICJtdDgxOTItbW1zeXMuaCINCg0KbmV3IHZlcnNpb24NCiNpbmNsdWRlICJt
dDgxOTItbW1zeXMuaCINCiNpbmNsdWRlICJtdDgzNjUtbW1zeXMuaCINCg0KPiA+IA0KPiA+ICAg
ZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXQ4MTkyLW1tc3lzLmggICAgfCA3Nw0KPiA+ICsrKysrKysr
KysrKysrKysrKysrKysrKysrDQo+ID4gICBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMu
YyAgICAgICB8IDExICsrKysNCj4gPiAgIGluY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1t
bXN5cy5oIHwgIDMgKw0KPiA+ICAgMyBmaWxlcyBjaGFuZ2VkLCA5MSBpbnNlcnRpb25zKCspDQo+
ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXQ4MTkyLW1tc3lz
LmgNCj4gPiANCg==

