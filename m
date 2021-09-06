Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EC44014F4
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 04:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761BA89AA7;
	Mon,  6 Sep 2021 02:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6141D89AA7
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Sep 2021 02:07:48 +0000 (UTC)
X-UUID: 10b398aa74794caca8fd5bab91b01023-20210906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=EXtYZoiDY1Hx81k3liJRQ0KMhRI64hwhmPGJueRfHcs=; 
 b=JPFhK0FF7VqMx8h/aNEhAPT9vNdZUy0OXG5FgJaDbph3YE4V62xsCqVeBZ4Jtu84Lp8D1JsYIgTof3/7XfMhIAmxgedepxrS5KRT2EwWtSJllkQuyGbiZjtg1h4Xki/RB9f6ONwnGdDW7TgZaSzXs/fID9eMfFJczkdbAVXARGI=;
X-UUID: 10b398aa74794caca8fd5bab91b01023-20210906
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 727199184; Mon, 06 Sep 2021 10:07:43 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Sep 2021 10:07:41 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 6 Sep 2021 10:07:41 +0800
Message-ID: <91ef79906f328833a3b08de5af54b32df247edb4.camel@mediatek.com>
Subject: Re: [PATCH v4 10/17] soc: mediatek: mmsys: Add reset controller
 support for MT8195 vdosys1
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>, Enric
 Balletbo i Serra <enric.balletbo@collabora.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, "jason-jh . lin"
 <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <singo.chang@mediatek.com>,
 <srv_heupstream@mediatek.com>
Date: Mon, 6 Sep 2021 10:07:41 +0800
In-Reply-To: <0cdce7a43a0b74fabc110730d2b2ec9dce5cbbff.camel@pengutronix.de>
References: <20210825100531.5653-1-nancy.lin@mediatek.com>
 <20210825100531.5653-11-nancy.lin@mediatek.com>
 <0cdce7a43a0b74fabc110730d2b2ec9dce5cbbff.camel@pengutronix.de>
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

SGkgUGhpbGlwcCwNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KSSB3aWxsIGJhc2Ugb24gRW5y
aWMncyBwYXRjaHNldCBpbiBteSBuZXh0IHJldmlzaW9uLg0KDQpSZWdhcmRzLA0KTmFuY3kNCg0K
T24gV2VkLCAyMDIxLTA4LTI1IGF0IDEyOjQ2ICswMjAwLCBQaGlsaXBwIFphYmVsIHdyb3RlOg0K
PiBIaSwNCj4gDQo+IE9uIFdlZCwgMjAyMS0wOC0yNSBhdCAxODowNSArMDgwMCwgTmFuY3kuTGlu
IHdyb3RlOg0KPiA+IEFtb25nIG90aGVyIGZlYXR1cmVzIHRoZSBtbXN5cyBkcml2ZXIgc2hvdWxk
IGltcGxlbWVudCBhIHJlc2V0DQo+ID4gY29udHJvbGxlciB0byBiZSBhYmxlIHRvIHJlc2V0IGRp
ZmZlcmVudCBiaXRzIGZyb20gdGhlaXIgc3BhY2UuDQo+ID4gDQo+ID4gRm9yIE1UODE5NSB2ZG9z
eXMxLCBtYW55IGFzeW5jIG1vZHVsZXMgbmVlZCB0byByZXNldCBhZnRlcg0KPiA+IHRoZSBkaXNw
bGF5IHBpcGUgc3RvcHMgYW5kIHJlc3RhcnQuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTmFu
Y3kuTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3Nv
Yy9tZWRpYXRlay9tdDgxOTUtbW1zeXMuaCB8ICAxICsNCj4gPiAgZHJpdmVycy9zb2MvbWVkaWF0
ZWsvbXRrLW1tc3lzLmMgICAgfCA3Ng0KPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
DQo+IA0KPiBDYzogRW5yaWMgLSB0aGlzIHBhdGNoIGNsYXNoZXMgd2l0aCBbMV0sIHBsZWFzZSBj
b29yZGluYXRlLg0KPiANCj4gWzFdIA0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJtLWtlcm5lbC8yMDIxMDgyNTEyMjYxMy52My42
LkkxNWUyNDE5MTQxYTY5YjJlNWM3ZTcwMGMzNGQ5MmE2OWRmNDdlMDRkQGNoYW5nZWlkL19fOyEh
Q1RSTktBOXdNZzBBUmJ3IXloWURrM2FuaGVmeHJZT0NRQmNVZ2lvc0picWRJUkNWMklmTzJ0b1oz
RlppNHQtQWNDTk9jRTV4ZUstSVYwTUMkDQo+ICANCj4gDQo+IHJlZ2FyZHMNCj4gUGhpbGlwcA0K

