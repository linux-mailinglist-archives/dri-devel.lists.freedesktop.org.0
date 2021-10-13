Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A81FA42B21C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 03:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D55188A23;
	Wed, 13 Oct 2021 01:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CEF56E9F9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 01:17:16 +0000 (UTC)
X-UUID: 95088808a2954397beafa37b1f51ae8a-20211013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=t7k1wvNec9YBr9g8AUC0Ax/3BfSKfgXeVcp0+CHknXw=; 
 b=gSOSFIYR15LI3h2XykYFJbMAFA/8uSLSYAH7h1HmaTrx0h7TEpp+GI6pIFqlQ86p6Xa0Uem7ynBZ/hWAK+9BA/FxZ2Sw4p0bw3key4huIN1MZ2KvAirdIJMfVimcr6ogGC+DzbCH9PKR6OPAXy0AXpvUlNG4cWF6MXHATcocpaI=;
X-UUID: 95088808a2954397beafa37b1f51ae8a-20211013
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 98030683; Wed, 13 Oct 2021 09:17:12 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Oct 2021 09:17:12 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 13 Oct 2021 09:17:11 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Oct 2021 09:17:09 +0800
Message-ID: <b3fa00e8b66658e120279e37261cbdb5db7edf52.camel@mediatek.com>
Subject: Re: [PATCH v6, 00/15] Using component framework to support multi
 hardware decode
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
CC: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Irui Wang
 <irui.wang@mediatek.com>, linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, srv_heupstream
 <srv_heupstream@mediatek.com>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 13 Oct 2021 09:17:13 +0800
In-Reply-To: <CAAEAJfCHEBFc8B7C0bu7UxtJdffvDarqgA-rset1wPjLOiV01A@mail.gmail.com>
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
 <CAAEAJfDOt_GyDPojcj5P6Wou9HC2GC8YzRt2wYyqdrCOjfeOog@mail.gmail.com>
 <3b9463e88d88ce85205da08f8263252da7726ade.camel@mediatek.com>
 <aba7fb4ffe6e45ac90869b5017468386bce64d28.camel@mediatek.com>
 <b7ed8b71578a98704e9b8ca29cac63c67cc14b3f.camel@mediatek.com>
 <CAAEAJfCHEBFc8B7C0bu7UxtJdffvDarqgA-rset1wPjLOiV01A@mail.gmail.com>
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

SGkgRXplcXVpZWwsDQoNClRoYW5rcyBmb3IgeW91ciBmZWVkYmFjaywNCg0KVGhlIGRyaXZlciBj
YW4gd29yayB3ZWxsIG5vdyBhY2NvcmRpbmcgdG8geW91ciBhZHZpY2Ugd2l0aA0Kb2ZfcGxhdGZv
cm1fcG9wdWxhdGUgaW50ZXJmYWNlLg0KDQpJbiBvcmRlciB0byBzZXBhcmF0ZSBwYXJlbnQgbm9k
ZSB3aXRoIGNoaWxkcmVuIG5vZGUsIHBhcmVudCBub2RlIGlzDQptYXN0ZXIgZGV2aWNlLCBjaGls
ZHJlbiBub2RlIGlzIGNvbXBvbmVudCBkZXZpY2UuDQoNClRoZSBtYXN0ZXIgYW5kIGNvbXBvbmVu
dCBhcmUgcmVnaXN0ZXJlZCBwbGF0Zm9ybSBkZXZpY2UuDQoNCg0KQ291bGQgeW91IHBsZWFzZSBo
ZWxwIHRvIHJldmlldyB0aGUgcGF0Y2ggYWdhaW4gd2hlbiB5b3UgYXJlIGZyZWU6DQoNCmh0dHBz
Oi8vcGF0Y2h3b3JrLmxpbnV4dHYub3JnL3Byb2plY3QvbGludXgtbWVkaWEvY292ZXIvMjAyMTEw
MTEwNzAyNDcuNzkyLTEteXVuZmVpLmRvbmdAbWVkaWF0ZWsuY29tLw0KDQpCZXN0IFJlZ2FyZHMs
DQpZdW5mZWkgRG9uZw0KDQpPbiBTdW4sIDIwMjEtMDktMjYgYXQgMTE6NTEgLTAzMDAsIEV6ZXF1
aWVsIEdhcmNpYSB3cm90ZToNCj4gT24gU3VuLCAyNiBTZXB0IDIwMjEgYXQgMDU6MjcsIHl1bmZl
aS5kb25nQG1lZGlhdGVrLmNvbQ0KPiA8eXVuZmVpLmRvbmdAbWVkaWF0ZWsuY29tPiB3cm90ZToN
Cj4gPiANCj4gPiBIaSBFemVxdWllbCwNCj4gPiANCj4gPiBDb3VsZCB5b3UgcGxlYXNlIGhlbHAg
dG8gZ2l2ZSBzb21lIGZlZWRiYWNrIHdoZW4geW91IGFyZSBmcmVlIGZvcg0KPiA+IGlvbW11DQo+
ID4gbGltaXRhdGlvbj8NCj4gPiANCj4gDQo+IEhvdyBhYm91dCB5b3Ugd29yayBvbiB0aGUgYXJj
aGl0ZWN0dXJlIEkgb3JpZ2luYWxseSBzdWdnZXN0ZWQ/DQo+IA0KPiBBcyB0aGUgc2F5aW5nIGdv
ZXMsIHRhbGsgaXMgY2hlYXAsIHNob3cgdXMgdGhlIGNvZGUuDQo+IFNvIGxldCdzIHNlZSB0aGUg
Y29kZSBhbmQgbGV0J3MgZGlzY3VzcyB0aGUgbGltaXRhdGlvbnMNCj4gd2l0aCB0aGUgY29kZS4N
Cj4gDQo+ID4gQWNjb3JkaW5nIHRvIGdvb2dsZSdzIHN1Z2dlc3Rpb24sIGl0J3MgYmV0dGVyIG5v
dCB0byB1c2UgdjRsMiBhc3luYw0KPiA+IGFsc28uDQo+IA0KPiBIdW0/IEkgaGF2ZW4ndCBzZWVu
IHN1Y2ggb2JqZWN0aW9uIG9uIHRoZSBtYWlsaW5nIGxpc3QuDQo+IA0KPiBUaGFua3MsDQo+IEV6
ZXF1aWVsDQo=

