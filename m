Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EEB3DE457
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 04:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E92D896EB;
	Tue,  3 Aug 2021 02:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1DE896EB
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 02:24:18 +0000 (UTC)
X-UUID: fab4bc0bd52547dba7335b120b17b2b1-20210803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=YibCADqH2XOJCVXj1Bt0Vvd8PdtC3chR2Y7d+3Ske7s=; 
 b=ao/z+c8ADMmVD1/u6nW/uP2GiIuK9yM/V+1yekLxKyvhPZE3oLGr3USMuJpcx4cDSKaWjlb/CMfF5s4uWw73Y0vz7BrhVbVq1CL0K3pHkBAeE71nS/caBR7/6JterZ2rgWVdM4xNL/Drbk8Tc6LpsqgQ+3JOAzv2tsxnlUjhOXg=;
X-UUID: fab4bc0bd52547dba7335b120b17b2b1-20210803
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 742168053; Tue, 03 Aug 2021 10:24:14 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 10:24:13 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 Aug 2021 10:24:13 +0800
Message-ID: <a18c9073b5dec59a4bdb3253dbc75dd56763da47.camel@mediatek.com>
Subject: Re: [PATCH v5 0/6] Add Mediatek Soc DRM (vdosys0) support for mt8195
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <fshao@chromium.org>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 <hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Date: Tue, 3 Aug 2021 10:24:13 +0800
In-Reply-To: <a8ce9da7-21c2-f9ef-161a-647d3f8748f3@collabora.com>
References: <20210729170737.21424-1-jason-jh.lin@mediatek.com>
 <a8ce9da7-21c2-f9ef-161a-647d3f8748f3@collabora.com>
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

SGkgRW5yaWMsDQoNCk9uIEZyaSwgMjAyMS0wNy0zMCBhdCAxMzo0NSArMDIwMCwgRW5yaWMgQmFs
bGV0Ym8gaSBTZXJyYSB3cm90ZToNCj4gSGkgSmFzb24sDQo+IA0KPiBUaGFuayB5b3UgZm9yIHlv
dXIgcGF0Y2guDQo+IA0KPiBPbiAyOS83LzIxIDE5OjA3LCBqYXNvbi1qaC5saW4gd3JvdGU6DQo+
ID4gVGhlIGhhcmR3YXJlIHBhdGggb2YgdmRvc3lzMCB3aXRoIGVEUCBwYW5lbCBvdXRwdXQgbmVl
ZCB0byBnbw0KPiA+IHRocm91Z2gNCj4gPiBieSBzZXZlcmFsIG1vZHVsZXMsIHN1Y2ggYXMsIE9W
TCwgUkRNQSwgQ09MT1IsIENDT1JSLCBBQUwsIEdBTU1BLA0KPiA+IERJVEhFUiwgRFNDIGFuZCBN
RVJHRS4NCj4gPiANCj4gDQo+IA0KPiBZb3Ugc2FpZCBpbiBvdGhlciBkaXNjdXNzaW9ucyB0aGF0
IHZkb3N5czAgaGFzIGVEUCBwYW5lbCBvdXRwdXQgYW5kDQo+IHZkb3N5czEgaGFzDQo+IERQIG91
dHB1dC4gSXMgaXQgcG9zc2libGUgdG8gc3dpdGNoIHRoZSBvdXRwdXRzPyBXaGF0IEkgYW0gd29u
ZGVyaW5nDQo+IGlzIGlmIHRoaXMNCj4gY29uZmlndXJhdGlvbiBpcyBoYXJkd2FyZSBzcGVjaWZp
YyBvciBib2FyZCBzcGVjaWZpYywgaS5lIGl0J2xsIGJlDQo+IHBvc3NpYmxlIHRvDQo+IGhhdmUg
YW5vdGhlciBib2FyZCB0aGF0IGhhcyBEUCBvdXRwdXQgb24gdmRvc3lzMCBhbmQgZURQIG91dHB1
dCBmb3INCj4gdmRvc3lzMT8NCj4gDQo+IFRoYW5rcywNCj4gICBFbnJpYw0KPiANCg0KQmVjYXVz
ZSB0aGUgY29uZmlndXJhdGlvbiBpcyBoYXJkd2FyZSBzcGVjaWZpYyBpbiBtdDgxOTUgU29DLCBp
dCBpcw0KcG9zc2libGUgdG8gc3dpdGNoIHRoZSBvdXRwdXQgdG8gRFAgb3IgSERNSSBmb3IgdmRv
c3lzMSBhbmQgdG8gc3dpdGNoDQp0aGUgb3V0cHV0IHRvIERTSSBvciBlRFAgZm9yIHZkb3N5czAu
DQpEdWUgdG8gdGhlIGhvdCBwbHVnIHJlcWlyZW1lbnQgZm9yIEhETUkgYW5kIERQLCB2ZG9zeXMx
IHdpbGwgc3VwcG9ydA0KcnVudGltZSBzaXRjaGluZyBvdXRwdXQuIHZkb3N5czAgY2FuIGRvIHRo
YXQgdG9vLCBidXQgdGhlcmUgaXMgbm8gaG90DQpwbHVnIHJlcXVpcmVtZW50IGZvciBEU0kgcGFu
ZWwgb3IgZURQIHBhbmVsLg0KU28gd2UgY29uZmlndXJlIHRoZSBvdXRwdXQgdG8gZURQIGZvciB2
ZG9zeXMwIGluIGJ1aWxkIHRpbWUgY3VycmVudGx5Lg0KDQpJbiBhbm90aGVyIGJvYXJkLCBzdWNo
IGFzIG10ODE3MyBTb0MsIGl0IGRvZXNuJ3QgaGF2ZSB2ZG9zeXMxIGJ1dCBpdCBpcw0KYWJsZSB0
byBzZXQgdGhlIG91dHB1dCB0byBEU0kgYW5kIEhETUkgZm9yIHZkb3N5czAgYXQgdGhlIHNhbWUg
dGltZS4NCg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0KDQo+IA0KPiA+IENoYW5nZSBpbiB2NToN
Cj4gPiAtIGFkZCBwb3dlci1kb21haW4gcHJvcGVydHkgaW50byB2ZG9zeXMwIGFuZCB2ZG9zeXMx
IGR0cyBub2RlLg0KPiA+IC0gYWRkIE1UODE5NSBwcmlmaXggYW5kIHJlbW92ZSB1bnVzZWQgVkRP
MSBkZWZpbmUgaW4gbXQ4MTk1LW1tc3lzLmgNCj4gPiANCj4gPiBDaGFuZ2UgaW4gdjQ6DQo+ID4g
LSBleHRyYWN0IGR0LWJpbmRpbmcgcGF0Y2hlcyB0byBhbm90aGVyIHBhdGNoIHNlcmllcw0KPiA+
ICAgDQo+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vcGF0Y2h3b3JrLmtl
cm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9saXN0Lz9zZXJpZXM9NTE5NTk3X187ISFD
VFJOS0E5d01nMEFSYnchM2p1S1BUM0VhaHZYczlhU1JURFB4UWZhcElpWEZHR3g5OTZLc3M5YjhE
SVR5QTE5cGQ1RjRLMEFXc0VwMVUzQzNGU2wkDQo+ID4gIA0KPiA+IC0gc3F1YXNoIERTQyBtb2R1
bGUgaW50byBtdGtfZHJtX2RkcF9jb21wLmMNCj4gPiAtIGFkZCBjb21lbnQgYW5kIHNpbXBsaWZ5
IE1FUkdFIGNvbmZpZyBmdW5jdGlvbg0KPiA+IA0KPiA+IENoYW5nZSBpbiB2MzoNCj4gPiAtIGNo
YW5nZSBtbXN5cyBhbmQgZGlzcGxheSBkdC1iaW5kaW5ncyBkb2N1bWVudCBmcm9tIHR4dCB0byB5
YW1sDQo+ID4gLSBhZGQgTUVSR0UgYWRkaXRpb25hbCBkZXNjcmlwdGlvbiBpbiBkaXNwbGF5IGR0
LWJpbmRpbmdzIGRvY3VtZW50DQo+ID4gLSBmaXggbWJveGVzLWNlbGxzIG51bWJlciBvZiB2ZG9z
eXMwIG5vZGUgaW4gZHRzDQo+ID4gLSBkcm9wIG11dGV4IGVvZiBjb252ZXJ0IGRlZmluZQ0KPiA+
IC0gcmVtb3ZlIHBtX3J1bnRpbWUgYXBpcyBpbiBEU0MgYW5kIE1FUkdFDQo+ID4gLSBjaGFuZ2Ug
RFNDIGFuZCBNRVJHRSBlbnVtIHRvIGFscGhhYmV0aWMgb3JkZXINCj4gPiANCj4gPiBDaGFuZ2Ug
aW4gdjI6DQo+ID4gLSBhZGQgRFNDIHlhbWwgZmlsZQ0KPiA+IC0gYWRkIG10ODE5NSBkcm0gZHJp
dmVyIHBvcnRpbmcgcGFydHMgaW4gdG8gb25lIHBhdGNoDQo+ID4gLSByZW1vdmUgdXNlbGVzcyBk
ZWZpbmUsIHZhcmlhYmxlLCBzdHJ1Y3R1cmUgbWVtYmVyIGFuZCBmdW5jdGlvbg0KPiA+IC0gc2lt
cGxpZnkgRFNDIGFuZCBNRVJHRSBmaWxlIGFuZCBzd2l0Y2ggdGhyZXJlIG9yZGVyDQo+ID4gDQo+
ID4gamFzb24tamgubGluICg2KToNCj4gPiAgIGFybTY0OiBkdHM6IG10ODE5NTogYWRkIGRpc3Bs
YXkgbm9kZSBmb3IgdmRvc3lzMA0KPiA+ICAgc29jOiBtZWRpYXRlazogYWRkIG10ay1tbXN5cyBz
dXBwb3J0IGZvciBtdDgxOTUgdmRvc3lzMA0KPiA+ICAgc29jOiBtZWRpYXRlazogYWRkIG10ay1t
dXRleCBzdXBwb3J0IGZvciBtdDgxOTUgdmRvc3lzMA0KPiA+ICAgZHJtL21lZGlhdGVrOiBhZGQg
bWVkaWF0ZWstZHJtIG9mIHZkb3N5czAgc3VwcG9ydCBmb3IgbXQ4MTk1DQo+ID4gICBkcm0vbWVk
aWF0ZWs6IGFkZCBEU0Mgc3VwcG9ydCBmb3IgbXQ4MTk1DQo+ID4gICBkcm0vbWVkaWF0ZWs6IGFk
ZCBNRVJHRSBzdXBwb3J0IGZvciBtdDgxOTUNCj4gPiANCj4gPiAgYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay9tdDgxOTUuZHRzaSAgICB8IDExMiArKysrKysrKw0KPiA+ICBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgICAgIHwgICAxICsNCj4gPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kaXNwX2Rydi5oICAgICB8ICAgOCArDQo+ID4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9tZXJnZS5jICAgfCAyNzcNCj4gPiArKysrKysrKysr
KysrKysrKysrKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5j
ICAgIHwgICA2ICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2Nv
bXAuYyB8ICA2MiArKysrKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
ZHBfY29tcC5oIHwgICAyICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZHJ2LmMgICAgICB8ICAzMiArKy0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZHJ2LmggICAgICB8ICAgMSArDQo+ID4gIGRyaXZlcnMvc29jL21lZGlhdGVrL210ODE5NS1t
bXN5cy5oICAgICAgICAgfCAgOTYgKysrKysrKw0KPiA+ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9t
dGstbW1zeXMuYyAgICAgICAgICAgIHwgIDExICsNCj4gPiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsv
bXRrLW11dGV4LmMgICAgICAgICAgICB8ICA5MyArKysrKystDQo+ID4gIGluY2x1ZGUvbGludXgv
c29jL21lZGlhdGVrL210ay1tbXN5cy5oICAgICAgfCAgIDkgKw0KPiA+ICAxMyBmaWxlcyBjaGFu
Z2VkLCA3MDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9tZXJnZS5jDQo+ID4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdDgxOTUtbW1zeXMuaA0KPiA+
IA0KLS0gDQpKYXNvbi1KSCBMaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+DQo=

