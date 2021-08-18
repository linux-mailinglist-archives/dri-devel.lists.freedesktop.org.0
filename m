Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9EF3EF99D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 06:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0956E39B;
	Wed, 18 Aug 2021 04:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175CA6E39B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 04:42:14 +0000 (UTC)
X-UUID: 426a7e68deee48e29de53f664d743190-20210818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=s2eYxQ8WBamf7VOtmtmHxiE6CjpqtO24kF2KWeIi2hs=; 
 b=O5KQ9VRFGfne05GY2JAg9XKHbIPhAy0p7lZx6cw4amZ6y8Silx+aEvM56f3Z6nb10FkqyYwmqjaNJrn0uG6T79azkUbXYXF8mgQ50q6bOSk9YX5aqgR1nBP/7zmMb5P8IaHcWe9OJrFQxlECBUGLzSJlnE7pSrA22bXEHhShGto=;
X-UUID: 426a7e68deee48e29de53f664d743190-20210818
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 208174303; Wed, 18 Aug 2021 12:42:09 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 12:42:09 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Aug 2021 12:42:09 +0800
Message-ID: <1629261729.11678.2.camel@mtksdaap41>
Subject: Re: [RFC PATCH 5/5] drm/mediatek: Add mt8195 DisplayPort driver
From: CK Hu <ck.hu@mediatek.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Date: Wed, 18 Aug 2021 12:42:09 +0800
In-Reply-To: <20210816192523.1739365-6-msp@baylibre.com>
References: <20210816192523.1739365-1-msp@baylibre.com>
 <20210816192523.1739365-6-msp@baylibre.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIE1hcmt1czoNCg0KT24gTW9uLCAyMDIxLTA4LTE2IGF0IDIxOjI1ICswMjAwLCBNYXJrdXMg
U2NobmVpZGVyLVBhcmdtYW5uIHdyb3RlOg0KPiBUaGlzIHBhdGNoIGFkZHMgYSBEaXNwbGF5UG9y
dCBkcml2ZXIgZm9yIHRoZSBNZWRpYXRlayBtdDgxOTUgU29DLg0KPiANCj4gSXQgc3VwcG9ydHMg
Ym90aCBmdW5jdGlvbmFsIHVuaXRzIG9uIHRoZSBtdDgxOTUsIHRoZSBlbWJlZGRlZA0KPiBEaXNw
bGF5UG9ydCBhcyB3ZWxsIGFzIHRoZSBleHRlcm5hbCBEaXNwbGF5UG9ydCB1bml0cy4gSXQgb2Zm
ZXJzDQo+IGhvdC1wbHVnLWRldGVjdGlvbiwgYXVkaW8gdXAgdG8gOCBjaGFubmVscywgYW5kIERp
c3BsYXlQb3J0IDEuNCB3aXRoIHVwDQo+IHRvIDQgbGFuZXMuDQo+IA0KPiBUaGlzIGRyaXZlciBp
cyBiYXNlZCBvbiBhbiBpbml0aWFsIHZlcnNpb24gYnkNCj4gSmFzb24tSkguTGluIDxqYXNvbi1q
aC5saW5AbWVkaWF0ZWsuY29tPi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hcmt1cyBTY2huZWlk
ZXItUGFyZ21hbm4gPG1zcEBiYXlsaWJyZS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL0tjb25maWcgICAgICB8ICAgIDcgKw0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL01ha2VmaWxlICAgICB8ICAgIDIgKw0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcC5jICAgICB8IDMwMjUgKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RwX3JlZy5oIHwgMzA5NSArKysrKysrKysrKysrKysrKysrKysr
KysrDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDYxMjkgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYw0KPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBfcmVnLmgNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9LY29uZmlnDQo+IGluZGV4IDI5NzZkMjFlOWEzNC4uZDgxZWIzNTIxYzFj
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2NvbmZpZw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2NvbmZpZw0KPiBAQCAtMjgsMyArMjgsMTAgQEAg
Y29uZmlnIERSTV9NRURJQVRFS19IRE1JDQo+ICAJc2VsZWN0IFBIWV9NVEtfSERNSQ0KPiAgCWhl
bHANCj4gIAkgIERSTS9LTVMgSERNSSBkcml2ZXIgZm9yIE1lZGlhdGVrIFNvQ3MNCj4gKw0KPiAr
Y29uZmlnIE1US19EUFRYX1NVUFBPUlQNCj4gKwl0cmlzdGF0ZSAiRFJNIERQVFggU3VwcG9ydCBm
b3IgTWVkaWF0ZWsgU29DcyINCj4gKwlkZXBlbmRzIG9uIERSTV9NRURJQVRFSw0KPiArCXNlbGVj
dCBHRU5FUklDX1BIWQ0KDQpXaHkgc2VsZWN0IEdFTkVSSUNfUEhZPw0KSWYgdGhpcyBpcyBhIHBo
eSBkcml2ZXIsIHBsYWNlIHRoaXMgZHJpdmVyIGluIGRyaXZlcnMvcGh5L21lZGlhdGVrLw0KDQpS
ZWdhcmRzLA0KQ0sNCg0KPiArCWhlbHANCj4gKwkgIERSTS9LTVMgRGlzcGxheSBQb3J0IGRyaXZl
ciBmb3IgTWVkaWF0ZWsgU29Dcy4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9NYWtlZmlsZQ0KPiBpbmRl
eCBkYzU0YTdhNjkwMDUuLjZiOWQxNDhhYjdmZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL01ha2VmaWxlDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9N
YWtlZmlsZQ0KPiBAQCAtMjAsMyArMjAsNSBAQCBtZWRpYXRlay1kcm0taGRtaS1vYmpzIDo9IG10
a19jZWMubyBcDQo+ICAJCQkgIG10a19oZG1pX2RkYy5vDQo+ICANCg0KDQo=

