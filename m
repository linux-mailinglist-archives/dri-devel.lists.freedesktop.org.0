Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC80A3F6278
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 18:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4DD6E03A;
	Tue, 24 Aug 2021 16:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A42389FFD
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 16:11:57 +0000 (UTC)
X-UUID: 4bbe58949406413090ec486f86b3f6dc-20210825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=fXPeBG+Nlv1CxWMjRr0CGuhcto0PIpsee/0QVL+xfBI=; 
 b=dZUXunRnFlIvYXdi8bsOnsDeKWOBgwb3/End16r7oial3OT3kATkKFqOaa7mjkUeS8R/vuOysRTUbk9mdCYUinnWsL86Se3FQ2ZLxWh1ZfOxxYmGBFBNf6dyE8y3nYxoJlMW6enP5kDVzDRRYm6cNPFX7EBh6lg3DnKfaWPLN18=;
X-UUID: 4bbe58949406413090ec486f86b3f6dc-20210825
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1937388890; Wed, 25 Aug 2021 00:11:52 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 00:11:51 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 25 Aug 2021 00:11:50 +0800
Message-ID: <2ca1c446d01a20cc60010b1069056724bc921faf.camel@mediatek.com>
Subject: Re: [PATCH v8 01/13] dt-bindings: arm: mediatek: mmsys: add mt8195
 SoC binding
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <fshao@chromium.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, Fabien Parent <fparent@baylibre.com>, "Hsin-Yi
 Wang" <hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, DTML <devicetree@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, DRI Development
 <dri-devel@lists.freedesktop.org>
Date: Wed, 25 Aug 2021 00:11:50 +0800
In-Reply-To: <CAAOTY_9Yug-9S4uBkNLTJH+TU8dHCeOjLuwXdNMJ+R89qJyJ9Q@mail.gmail.com>
References: <20210819022327.13040-1-jason-jh.lin@mediatek.com>
 <20210819022327.13040-2-jason-jh.lin@mediatek.com>
 <CAAOTY_9Yug-9S4uBkNLTJH+TU8dHCeOjLuwXdNMJ+R89qJyJ9Q@mail.gmail.com>
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

SGkgQ2h1bi1LdWFuZywNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQpPbiBUaHUsIDIwMjEt
MDgtMTkgYXQgMjM6MDAgKzA4MDAsIENodW4tS3VhbmcgSHUgd3JvdGU6DQo+IEhpLCBKYXNvbjoN
Cj4gDQo+IGphc29uLWpoLmxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4g5pa8IDIwMjHl
ubQ45pyIMTnml6Ug6YCx5ZubIOS4iuWNiDEwOjIz5a+r6YGT77yaDQo+ID4gDQo+ID4gMS4gVGhl
cmUgYXJlIDIgbW1zeXMsIG5hbWVseSB2ZG9zeXMwIGFuZCB2ZG9zeXMxIGluIG10ODE5NS4NCj4g
PiAgICBFYWNoIG9mIHRoZW0gaXMgYm91bmQgdG8gYSBkaXNwbGF5IHBpcGVsaW5lLCBzbyBhZGQg
dGhlaXINCj4gPiAgICBkZWZpbml0aW9uIGluIG10ay1tbXN5cyBkb2N1bWVudGF0aW9uIHdpdGgg
MiBjb21wYXRpYmxlcy4NCj4gPiANCj4gPiAyLiBBZGQgZGVzY3JpcHRpb24gZm9yIHBvd2VyLWRv
bWFpbiBwcm9wZXJ0eS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBqYXNvbi1qaC5saW4gPGph
c29uLWpoLmxpbkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gdGhpcyBwYXRjaCBpcyBiYXNl
IG9uIFsxXVsyXQ0KPiA+IA0KPiA+IFsxXSBkdC1iaW5kaW5nczogYXJtOiBtZWRpYXRlazogbW1z
eXM6IGNvbnZlcnQgdG8gWUFNTCBmb3JtYXQNCj4gPiAtIA0KPiA+IGh0dHBzOi8vdXJsZGVmZW5z
ZS5jb20vdjMvX19odHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVk
aWF0ZWsvcGF0Y2gvMjAyMTA1MTkxNjE4NDcuMzc0NzM1Mi0xLWZwYXJlbnRAYmF5bGlicmUuY29t
L19fOyEhQ1RSTktBOXdNZzBBUmJ3IXc4bzVibW9pTGU5MmpMVDEtX2xWXzBxOW1sY3ZJT2NBQ1Vv
VEktVmphVnYzdEd0S3I0MTRBUXlEbmYxeXdpdnc5QkhKJA0KPiA+ICANCj4gPiBbMl0gZHQtYmlu
ZGluZ3M6IGFybTogbWVkaWF0ZWs6IG1tc3lzOiBhZGQgTVQ4MzY1IFNvQyBiaW5kaW5nDQo+ID4g
LSANCj4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjEwNTE5MTYxODQ3LjM3NDcz
NTItMi1mcGFyZW50QGJheWxpYnJlLmNvbS9fXzshIUNUUk5LQTl3TWcwQVJidyF3OG81Ym1vaUxl
OTJqTFQxLV9sVl8wcTltbGN2SU9jQUNVb1RJLVZqYVZ2M3RHdEtyNDE0QVF5RG5mMXl3bU5GNzlK
WiQNCj4gPiAgDQo+ID4gLS0tDQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRp
YXRlay9tZWRpYXRlayxtbXN5cy55YW1sICB8IDgNCj4gPiArKysrKysrKw0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxtbXN5
cy55YW0NCj4gPiBsDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJt
L21lZGlhdGVrL21lZGlhdGVrLG1tc3lzLnlhbQ0KPiA+IGwNCj4gPiBpbmRleCAyZDRmZjBjZTM4
N2IuLjY4Y2IzMzBkNzU5NSAxMDA2NDQNCj4gPiAtLS0NCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssbW1zeXMueWFtDQo+ID4gbA0K
PiA+ICsrKw0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRp
YXRlay9tZWRpYXRlayxtbXN5cy55YW0NCj4gPiBsDQo+ID4gQEAgLTMwLDYgKzMwLDggQEAgcHJv
cGVydGllczoNCj4gPiAgICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE3My1tbXN5cw0KPiA+
ICAgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTgzLW1tc3lzDQo+ID4gICAgICAgICAgICAg
ICAgLSBtZWRpYXRlayxtdDgzNjUtbW1zeXMNCj4gPiArICAgICAgICAgICAgICAtIG1lZGlhdGVr
LG10ODE5NS12ZG9zeXMwDQo+ID4gKyAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxOTUtdmRv
c3lzMQ0KPiA+ICAgICAgICAgICAgLSBjb25zdDogc3lzY29uDQo+ID4gICAgICAgIC0gaXRlbXM6
DQo+ID4gICAgICAgICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDc2MjMtbW1zeXMNCj4gPiBAQCAt
MzksNiArNDEsMTIgQEAgcHJvcGVydGllczoNCj4gPiAgICByZWc6DQo+ID4gICAgICBtYXhJdGVt
czogMQ0KPiA+IA0KPiA+ICsgIHBvd2VyLWRvbWFpbnM6DQo+ID4gKyAgICBkZXNjcmlwdGlvbjoN
Cj4gPiArICAgICAgQSBwaGFuZGxlIGFuZCBQTSBkb21haW4gc3BlY2lmaWVyIGFzIGRlZmluZWQg
YnkgYmluZGluZ3MNCj4gPiArICAgICAgb2YgdGhlIHBvd2VyIGNvbnRyb2xsZXIgc3BlY2lmaWVk
IGJ5IHBoYW5kbGUuIFNlZQ0KPiA+ICsgICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcG93ZXIvcG93ZXItZG9tYWluLnlhbWwNCj4gPiBmb3IgZGV0YWlscy4NCj4gPiArDQo+
IA0KPiBUaGlzIHBhdGNoIGlzIGFib3V0IG10ODE5NSwgYnV0IG10ODE3MyBtbXN5cyBhbHNvIGhh
cyBwb3dlciBkb21haW4uDQo+IFNvDQo+IG1vdmUgdGhpcyBwYXJ0IHRvIGFub3RoZXIgcGF0Y2gu
DQo+IA0KPiBSZWdhcmRzLA0KPiBDaHVuLUt1YW5nLg0KPiANCk9LLCBJJ2xsIG1vdmUgdGhpcyBw
YXJ0IHRvIGFub3RoZXIgcGF0Y2guDQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4NCg0KPiANCj4g
PiAgICAiI2Nsb2NrLWNlbGxzIjoNCj4gPiAgICAgIGNvbnN0OiAxDQo+ID4gDQo+ID4gLS0NCj4g
PiAyLjE4LjANCj4gPiANCi0tIA0KSmFzb24tSkggTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsu
Y29tPg0K

