Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6B142B1D0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 03:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBB66E051;
	Wed, 13 Oct 2021 01:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 691176E051
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 01:08:29 +0000 (UTC)
X-UUID: 4915edeb9e3a439b8345c27e9e01e9a3-20211013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Wo5UR62GlfUL19duHdY33pqBzIfdVlywwUiTsVrdB9Y=; 
 b=ntE7ZJg7bHqFtCQ0l2P9nW5f9dlxp5mkubMVgd83ZgZSY3rr9HPT/tQrAzXXsXT35DD82yQ2rTAiB1DgBMSkJb8EXUNEa8vN+llUbBwMvFN1t6TWr/hP3acYgG0ISE3me9Vo6s8ppxszXo2veQYUZeylFv74ukXwL1eM7D/MQmY=;
X-UUID: 4915edeb9e3a439b8345c27e9e01e9a3-20211013
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 317307619; Wed, 13 Oct 2021 09:08:24 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 13 Oct 2021 09:08:23 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 13 Oct 2021 09:08:22 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Oct 2021 09:08:20 +0800
Message-ID: <11498cb8b7f1754f6134ce8143bd4f81272d0ffc.camel@mediatek.com>
Subject: Re: [PATCH v7, 00/15] Support multi hardware decode using
 of_platform_populate
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 13 Oct 2021 09:08:24 +0800
In-Reply-To: <73f83f00-5d49-ba77-f46d-9c0855dc5268@collabora.com>
References: <20211011070247.792-1-yunfei.dong@mediatek.com>
 <73f83f00-5d49-ba77-f46d-9c0855dc5268@collabora.com>
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

SGkgQW5kcnplaiwNCg0KDQpPbiBUdWUsIDIwMjEtMTAtMTIgYXQgMTY6MjcgKzAyMDAsIEFuZHJ6
ZWogUGlldHJhc2lld2ljeiB3cm90ZToNCj4gSGkgWXVuZmVpIERvbmcsDQo+IA0KPiBXIGRuaXUg
MTEuMTAuMjAyMSBvIDA5OjAyLCBZdW5mZWkgRG9uZyBwaXN6ZToNCj4gPiBUaGlzIHNlcmllcyBh
ZGRzIHN1cHBvcnQgZm9yIG11bHRpIGhhcmR3YXJlIGRlY29kZSBpbnRvIG10ay12Y29kZWMsIA0K
PiA+IGJ5IGZpcnN0DQo+ID4gYWRkaW5nIHVzZSBvZl9wbGF0Zm9ybV9wb3B1bGF0ZSB0byBtYW5h
Z2UgZWFjaCBoYXJkd2FyZQ0KPiA+IGluZm9ybWF0aW9uOiBpbnRlcnJ1cHQsDQo+ID4gY2xvY2ss
IHJlZ2lzdGVyIGJhc2VzIGFuZCBwb3dlci4gU2Vjb25kbHkgYWRkIGNvcmUgdGhyZWFkIHRvIGRl
YWwNCj4gPiB3aXRoIGNvcmUNCj4gPiBoYXJkd2FyZSBtZXNzYWdlLCBhdCB0aGUgc2FtZSB0aW1l
LCBhZGQgbXNnIHF1ZXVlIGZvciBkaWZmZXJlbnQNCj4gPiBoYXJkd2FyZQ0KPiA+IHNoYXJlIG1l
c3NhZ2VzLiBMYXN0bHksIHRoZSBhcmNoaXRlY3R1cmUgb2YgZGlmZmVyZW50IHNwZWNzIGFyZSBu
b3QNCj4gPiB0aGUgc2FtZSwNCj4gPiB1c2luZyBzcGVjcyB0eXBlIHRvIHNlcGFyYXRlIHRoZW0u
DQo+ID4gDQo+ID4gVGhpcyBzZXJpZXMgaGFzIGJlZW4gdGVzdGVkIHdpdGggYm90aCBNVDgxODMg
YW5kIE1UODE3My4gRGVjb2RpbmcNCj4gPiB3YXMgd29ya2luZw0KPiA+IGZvciBib3RoIGNoaXBz
Lg0KPiA+IA0KPiA+IFBhdGNoZXMgMX4zIHJld3JpdGUgZ2V0IHJlZ2lzdGVyIGJhc2VzIGFuZCBw
b3dlciBvbi9vZmYgaW50ZXJmYWNlLg0KPiA+IA0KPiA+IFBhdGNoIDQgYWRkIHRvIHN1cHBvcnQg
bXVsdGkgaGFyZHdhcmUuDQo+ID4gDQo+ID4gUGF0Y2ggNSBzZXBhcmF0ZSB2aWRlbyBlbmNvZGVy
IGFuZCBkZWNvZGVyIGRvY3VtZW50DQo+ID4gDQo+ID4gUGF0Y2hlcyA2LTE1IGFkZCBpbnRlcmZh
Y2VzIHRvIHN1cHBvcnQgY29yZSBoYXJkd2FyZS4NCj4gDQo+IFdoaWNoIHRyZWUgZG9lcyB0aGUg
c2VyaWVzIGFwcGx5IHRvPw0KDQpJIGRvbid0IHVuZGVyc3RhbmQgeW91ciBtZWFuIGNsZWFybHku
IE1lZGlhIHRyZWU/DQoNCllvdSBjYW4gZ2V0IHRoZSBwYXRjaGVzIGZyb20gdGhpcyBsaW5rOg0K
DQpodHRwczovL3BhdGNod29yay5saW51eHR2Lm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhL2NvdmVy
LzIwMjExMDExMDcwMjQ3Ljc5Mi0xLXl1bmZlaS5kb25nQG1lZGlhdGVrLmNvbS8NCg0KVGhhbmtz
LA0KWXVuZmVpIERvbmcNCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiBBbmRyemVqDQo=

