Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 360043D537F
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 09:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3426E5C5;
	Mon, 26 Jul 2021 07:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1474C6E5C5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 07:02:19 +0000 (UTC)
X-UUID: 8c476ab588dd4bbf81066fdef5a2d835-20210726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=TnDpOLMBPd+DG/4dxckfQjpW0HbygoqTWQXU0LBOEZs=; 
 b=N/Io5ybs/myaLIeXps5Ta7a/+D8iouaFoqp8JCy7fRDKylJYZ/1mhhrQWihWi0mxWdycN9p53eSKz6JXvvGKldF8i1PdEu57eRqwCVe7L4VJSKW9UxNcV3fYc9zi3BF/R4mrE3eJ+rCr+nKos9OCr0yJejRxrlpjeXP9tBpPXJs=;
X-UUID: 8c476ab588dd4bbf81066fdef5a2d835-20210726
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 481328926; Mon, 26 Jul 2021 15:02:15 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Jul 2021 15:02:14 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 26 Jul 2021 15:02:14 +0800
Message-ID: <4c0fe16988c559a5a4b1ce714eeaa31f4628f68f.camel@mediatek.com>
Subject: Re: [PATCH v1 1/5] dt-bindings: arm: mediatek: mmsys: add mt8195
 SoC binding
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Mon, 26 Jul 2021 15:02:14 +0800
In-Reply-To: <CAFqH_51qKkxMit5fkSh_AyeNAYwKnoPe09nwJLKaKez26+HUew@mail.gmail.com>
References: <20210722092624.14401-1-jason-jh.lin@mediatek.com>
 <20210722092624.14401-2-jason-jh.lin@mediatek.com>
 <CAFqH_51qKkxMit5fkSh_AyeNAYwKnoPe09nwJLKaKez26+HUew@mail.gmail.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
 fshao@chromium.org, David Airlie <airlied@linux.ie>, singo.chang@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Fabien Parent <fparent@baylibre.com>, devicetree <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "Nancy.Lin" <nancy.lin@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIxLTA3LTIzIGF0IDEzOjEzICswMjAwLCBFbnJpYyBCYWxsZXRibyBTZXJyYSB3
cm90ZToNCj4gSGkgSmFzb24sDQo+IA0KPiBUaGFuayB5b3UgZm9yIHlvdXIgcGF0Y2guDQo+IA0K
PiBNaXNzYXRnZSBkZSBqYXNvbi1qaC5saW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+IGRl
bCBkaWEgZGouLCAyMg0KPiBkZSBqdWwuIDIwMjEgYSBsZXMgMTE6MjY6DQo+ID4gDQo+ID4gVGhl
cmUgYXJlIDIgZGlzcGxheSBoYXJkd2FyZSBwYXRoIGluIG10ODE5NSwgbmFtZWx5IHZkb3N5czAg
YW5kDQo+ID4gdmRvc3lzMSwgc28gYWRkIHRoZWlyIGRlZmluaXRpb24gaW4gbXRrLW1tc3lzIGRv
Y3VtZW50YXRpb24uDQo+ID4gDQo+IA0KPiBKdXN0IGhhdmluZyAyIGRpc3BsYXkgaGFyZHdhcmUg
cGF0aHMgaXMgbm90IGEgcmVhc29uIHRvIGhhdmUgdHdvDQo+IGNvbXBhdGlibGVzLCBpc24ndCB0
aGUgSVAgYmxvY2sgdGhlIHNhbWU/IFdoeSBkbyB5b3UgbmVlZCB0bw0KPiBpbnRyb2R1Y2UNCj4g
dGhlIHR3byBjb21wYXRpYmxlcz8NCj4gDQo+IFRoYW5rcywNCj4gICBFbnJpYw0KPiANCg0KSGkg
RW5yaWMsDQoNClRoYW5rcyBmb3IgcmV2aWV3aW5nIG15IHBhdGNoLg0KDQpUaGUgcmVhc29uIGZv
ciB1c2luZyB0d28gY29tcGF0aWJsZXMgaXMgdGhhdCB2ZG9zeXMwIGFuZCB2ZG9zeXMxIGFyZQ0K
ZGlmZmVyZW50IElQIGJsb2Nrcy4NCg0KQmVjYXVzZSBtbXN5cyBwcm92aWRlcyBjbG9jayBjb250
cm9sLCBvdGhlciBkaXNwbGF5IGZ1bmN0aW9uIGJsb2NrcyBtYXkNCnVzZSB0aGVtIGFzIGNsb2Nr
IHByb3ZpZGVyLg0KDQpFLmcuDQoxLiBtbXN5cyB3aXRoIGNvbXBhdGlibGU9Im1lZGlhdGVrLG10
ODE5NS12ZG9zeXMwIg0KW3Y0LDEvNl0gYXJtNjQ6IGR0czogbXQ4MTk1OiBhZGQgZGlzcGxheSBu
b2RlIGZvciB2ZG9zeXMwDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9s
aW51eC1tZWRpYXRlay9wYXRjaC8yMDIxMDcyMzA5MDIzMy4yNDAwNy0yLWphc29uLWpoLmxpbkBt
ZWRpYXRlay5jb20vDQoNCm92bDA6IGRpc3Bfb3ZsQDFjMDAwMDAwIHsNCgkuLi4NCgljbG9ja3Mg
PSA8JnZkb3N5czAgQ0xLX1ZETzBfRElTUF9PVkwwPjsNCgkuLi4NCn07DQoNCjIuIG1tc3lzIHdp
dGggY29tcGF0aWJsZT0ibWVkaWF0ZWssbXQ4MTk1LXZkb3N5czEiDQpbdjIsMDYvMTRdIGFybTY0
OiBkdHM6IG10ODE5NTogYWRkIGRpc3BsYXkgbm9kZSBmb3IgdmRvc3lzMQ0KDQpodHRwczovL3Bh
dGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyMTA3MjIw
OTQ1NTEuMTUyNTUtNy1uYW5jeS5saW5AbWVkaWF0ZWsuY29tLw0KDQp2ZG8xX3JkbWEwOiB2ZG8x
X3JkbWFAMWMxMDQwMDAgew0KCS4uLg0KCWNsb2NrcyA9IDwmdmRvc3lzMSBDTEtfVkRPMV9NRFBf
UkRNQTA+Ow0KCS4uLg0KfTsNCg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0KDQo+ID4gU2lnbmVk
LW9mZi1ieTogamFzb24tamgubGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0KPiA+IC0t
LQ0KPiA+IHRoaXMgcGF0Y2ggaXMgYmFzZSBvbiBbMV1bMl0NCj4gPiANCj4gPiBbMV0gZHQtYmlu
ZGluZ3M6IGFybTogbWVkaWF0ZWs6IG1tc3lzOiBjb252ZXJ0IHRvIFlBTUwgZm9ybWF0DQo+ID4g
LSANCj4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjEwNTE5MTYxODQ3LjM3NDcz
NTItMS1mcGFyZW50QGJheWxpYnJlLmNvbS9fXzshIUNUUk5LQTl3TWcwQVJidyF5Y2dQRUs0eUJE
b2ppaVpKQzJFOW1Hd3Z4SmJhTHFoeVV4ekpJcTBja0VQLUpWdGVCY2pGZGM2aXhrTmJta25IOGYy
UCQNCj4gPiAgDQo+ID4gWzJdIGR0LWJpbmRpbmdzOiBhcm06IG1lZGlhdGVrOiBtbXN5czogYWRk
IE1UODM2NSBTb0MgYmluZGluZw0KPiA+IC0gDQo+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92
My9fX2h0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9w
YXRjaC8yMDIxMDUxOTE2MTg0Ny4zNzQ3MzUyLTItZnBhcmVudEBiYXlsaWJyZS5jb20vX187ISFD
VFJOS0E5d01nMEFSYncheWNnUEVLNHlCRG9qaWlaSkMyRTltR3d2eEpiYUxxaHlVeHpKSXEwY2tF
UC1KVnRlQmNqRmRjNml4a05ibWp1MkdCckQkDQo+ID4gIA0KPiA+IC0tLQ0KPiA+ICAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssbW1zeXMueWFtbCAgICAgICAg
fA0KPiA+IDIgKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiA+IA0K
PiA+IGRpZmYgLS1naXQNCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9h
cm0vbWVkaWF0ZWsvbWVkaWF0ZWssbW1zeXMueWFtDQo+ID4gbA0KPiA+IGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxtbXN5cy55YW0NCj4g
PiBsDQo+ID4gaW5kZXggMmQ0ZmYwY2UzODdiLi4wNzg5YTk2MTRmMTIgMTAwNjQ0DQo+ID4gLS0t
DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrL21l
ZGlhdGVrLG1tc3lzLnlhbQ0KPiA+IGwNCj4gPiArKysNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssbW1zeXMueWFtDQo+ID4gbA0K
PiA+IEBAIC0zMCw2ICszMCw4IEBAIHByb3BlcnRpZXM6DQo+ID4gICAgICAgICAgICAgICAgLSBt
ZWRpYXRlayxtdDgxNzMtbW1zeXMNCj4gPiAgICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE4
My1tbXN5cw0KPiA+ICAgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MzY1LW1tc3lzDQo+ID4g
KyAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxOTUtdmRvc3lzMA0KPiA+ICsgICAgICAgICAg
ICAgIC0gbWVkaWF0ZWssbXQ4MTk1LXZkb3N5czENCj4gPiAgICAgICAgICAgIC0gY29uc3Q6IHN5
c2Nvbg0KPiA+ICAgICAgICAtIGl0ZW1zOg0KPiA+ICAgICAgICAgICAgLSBjb25zdDogbWVkaWF0
ZWssbXQ3NjIzLW1tc3lzDQo+ID4gLS0NCj4gPiAyLjE4LjANCj4gPiANCi0tIA0K

