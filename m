Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C3B3F6895
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 20:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 707F46E0AF;
	Tue, 24 Aug 2021 17:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11F26E0AF
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 17:59:57 +0000 (UTC)
X-UUID: bbfa37c5da8341558dd159b4280e7cc9-20210825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ECQLI5+vw1UTM2shwxDUmHF5DAhtSRUHapFpM4DAFzg=; 
 b=sgdqL4PmFebk7GnWibxDkCtpMfH/KR+vbr8bDVCIU5vmPmC3rkC+DkFkfiwI6HFgapHD0cL5BotFhlj4qKmhWxeK60HO5WC/vqv4nra9mGOU+gJFT/uWabMcGuCgxL5sbZGrf9j5uyA+11JDyYuvwFXqSO54TdoBg1n78jkcfLo=;
X-UUID: bbfa37c5da8341558dd159b4280e7cc9-20210825
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1323139722; Wed, 25 Aug 2021 01:59:50 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 01:59:28 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 25 Aug 2021 01:59:28 +0800
Message-ID: <27c7b466b6197c9bdb0ced778b77981881a08162.camel@mediatek.com>
Subject: Re: [PATCH v8 03/13] dt-bindings: mediatek: add mediatek,dsc.yaml
 for mt8195 SoC binding
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
Date: Wed, 25 Aug 2021 01:59:27 +0800
In-Reply-To: <CAAOTY_9BUZ3x01FXY=UKmcrqGxmP7bfpqyz7zCJXK=+2xUhrYA@mail.gmail.com>
References: <20210819022327.13040-1-jason-jh.lin@mediatek.com>
 <20210819022327.13040-4-jason-jh.lin@mediatek.com>
 <CAAOTY_9BUZ3x01FXY=UKmcrqGxmP7bfpqyz7zCJXK=+2xUhrYA@mail.gmail.com>
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

SGkgQ2h1bi1LdWFuZywNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQpPbiBTdW4sIDIwMjEt
MDgtMjIgYXQgMDc6MTQgKzA4MDAsIENodW4tS3VhbmcgSHUgd3JvdGU6DQo+IEhpLCBKYXNvbjoN
Cj4gDQo+IGphc29uLWpoLmxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4g5pa8IDIwMjHl
ubQ45pyIMTnml6Ug6YCx5ZubIOS4iuWNiDEwOjIz5a+r6YGT77yaDQo+ID4gDQo+ID4gMS4gQWRk
IG1lZGlhdGVrLGRzYy55YW1sIHRvIGRlc2NyaWJlIERTQyBtb2R1bGUgaW4gZGV0YWlscy4NCj4g
PiAyLiBBZGQgbXQ4MTk1IFNvQyBiaW5kaW5nIHRvIG1lZGlhdGVrLGRzYy55YW1sLg0KPiA+IA0K
PiA+IFNpZ25lZC1vZmYtYnk6IGphc29uLWpoLmxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNv
bT4NCj4gPiAtLS0NCj4gPiAgLi4uL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNjLnlhbWwg
ICAgICAgIHwgNjkNCj4gPiArKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCA2OSBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzYy55
YW0NCj4gPiBsDQo+ID4gDQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNjLnkNCj4gPiBhbWwN
Cj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVr
L21lZGlhdGVrLGRzYy55DQo+ID4gYW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBp
bmRleCAwMDAwMDAwMDAwMDAuLmY5NGE5NWM2YTFjNQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiAr
KysNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlh
dGVrL21lZGlhdGVrLGRzYy55DQo+ID4gYW1sDQo+ID4gQEAgLTAsMCArMSw2OSBAQA0KPiA+ICsj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkN
Cj4gPiArJVlBTUwgMS4yDQo+ID4gKy0tLQ0KPiA+ICskaWQ6IA0KPiA+IGh0dHBzOi8vdXJsZGVm
ZW5zZS5jb20vdjMvX19odHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L21lZGlh
dGVrL21lZGlhdGVrLGRzYy55YW1sKl9fO0l3ISFDVFJOS0E5d01nMEFSYnchMnF3dkpuRlRnSnpm
azFuME9WWHFHbFBqWWNvMmJCVVp0V0Z6YjRuOGd6SFh5RkZKWjdNVDRRV080UkR6bkhtU1d5aU8k
DQo+ID4gIA0KPiA+ICskc2NoZW1hOiANCj4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19f
aHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwqX187SXchIUNUUk5L
QTl3TWcwQVJidyEycXd2Sm5GVGdKemZrMW4wT1ZYcUdsUGpZY28yYkJVWnRXRnpiNG44Z3pIWHlG
RkpaN01UNFFXTzRSRHpuTkMxdzdGWCQNCj4gPiAgDQo+ID4gKw0KPiA+ICt0aXRsZTogbWVkaWF0
ZWsgZGlzcGxheSBEU0MgY29udHJvbGxlcg0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4g
KyAgLSBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KPiANCj4gQWNjb3JkaW5nIHRvIFsxXSwg
dGhlIG1haW50YWluZXIgc2hvdWxkIGJlDQo+IA0KPiBDaHVuLUt1YW5nIEh1IDxjaHVua3Vhbmcu
aHVAa2VybmVsLm9yZz4sIFBoaWxpcHAgWmFiZWwgPA0KPiBwLnphYmVsQHBlbmd1dHJvbml4LmRl
Pg0KPiANCj4gWzFdIA0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly93d3cu
a2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvcHJvY2Vzcy9tYWludGFpbmVycy5odG1sX187ISFD
VFJOS0E5d01nMEFSYnchMnF3dkpuRlRnSnpmazFuME9WWHFHbFBqWWNvMmJCVVp0V0Z6YjRuOGd6
SFh5RkZKWjdNVDRRV080UkR6bk1keDd0QWUkDQo+ICANCk9LLCBJJ2xsIGZpeCBpdCBhbmQgYWxz
byB0aGUgW1BBVENIIHY4IDAyLzEzXSBpbiB0aGlzIHNlcmllcy4NCg0KUmVnYXJkcywNCkphc29u
LUpILkxpbg0KPiANCj4gPiArDQo+ID4gK2Rlc2NyaXB0aW9uOiB8DQo+ID4gKyAgVGhlIERTQyBz
dGFuZGFyZCBpcyBhIHNwZWNpZmljYXRpb24gb2YgdGhlIGFsZ29yaXRobXMgdXNlZCBmb3INCj4g
PiArICBjb21wcmVzc2luZyBhbmQgZGVjb21wcmVzc2luZyBpbWFnZSBkaXNwbGF5IHN0cmVhbXMs
IGluY2x1ZGluZw0KPiA+ICsgIHRoZSBzcGVjaWZpY2F0aW9uIG9mIHRoZSBzeW50YXggYW5kIHNl
bWFudGljcyBvZiB0aGUgY29tcHJlc3NlZA0KPiA+ICsgIHZpZGVvIGJpdCBzdHJlYW0uIERTQyBp
cyBkZXNpZ25lZCBmb3IgcmVhbC10aW1lIHN5c3RlbXMgd2l0aA0KPiA+ICsgIHJlYWwtdGltZSBj
b21wcmVzc2lvbiwgdHJhbnNtaXNzaW9uLCBkZWNvbXByZXNzaW9uIGFuZCBEaXNwbGF5Lg0KPiA+
ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgb25lT2Y6
DQo+ID4gKyAgICAgIC0gaXRlbXM6DQo+ID4gKyAgICAgICAgICAtIGNvbnN0OiBtZWRpYXRlayxt
dDgxOTUtZGlzcC1kc2MNCj4gPiArDQo+ID4gKyAgcmVnOg0KPiA+ICsgICAgbWF4SXRlbXM6IDEN
Cj4gPiArDQo+ID4gKyAgaW50ZXJydXB0czoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0K
PiA+ICsgIGNsb2NrczoNCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9u
OiBEU0MgV3JhcHBlciBDbG9jaw0KPiA+ICsNCj4gPiArICBwb3dlci1kb21haW5zOg0KPiA+ICsg
ICAgZGVzY3JpcHRpb246IEEgcGhhbmRsZSBhbmQgUE0gZG9tYWluIHNwZWNpZmllciBhcyBkZWZp
bmVkIGJ5DQo+ID4gYmluZGluZ3Mgb2YNCj4gPiArICAgICAgdGhlIHBvd2VyIGNvbnRyb2xsZXIg
c3BlY2lmaWVkIGJ5IHBoYW5kbGUuIFNlZQ0KPiA+ICsgICAgICBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcG93ZXIvcG93ZXItZG9tYWluLnlhbWwNCj4gPiBmb3IgZGV0YWlscy4N
Cj4gPiArDQo+ID4gKyAgbWVkaWF0ZWssZ2NlLWNsaWVudC1yZWc6DQo+ID4gKyAgICAgIGRlc2Ny
aXB0aW9uOg0KPiA+ICsgICAgICAgIFRoZSByZWdpc3RlciBvZiBkaXNwbGF5IGZ1bmN0aW9uIGJs
b2NrIHRvIGJlIHNldCBieSBnY2UuDQo+ID4gVGhlcmUgYXJlIDQgYXJndW1lbnRzLA0KPiA+ICsg
ICAgICAgIHN1Y2ggYXMgZ2NlIG5vZGUsIHN1YnN5cyBpZCwgb2Zmc2V0IGFuZCByZWdpc3RlciBz
aXplLiBUaGUNCj4gPiBzdWJzeXMgaWQgdGhhdCBpcw0KPiA+ICsgICAgICAgIG1hcHBpbmcgdG8g
dGhlIHJlZ2lzdGVyIG9mIGRpc3BsYXkgZnVuY3Rpb24gYmxvY2tzIGlzDQo+ID4gZGVmaW5lZCBp
biB0aGUgZ2NlIGhlYWRlcg0KPiA+ICsgICAgICAgIGluY2x1ZGUvaW5jbHVkZS9kdC1iaW5kaW5n
cy9nY2UvPGNoaXA+LWdjZS5oIG9mIGVhY2gNCj4gPiBjaGlwcy4NCj4gPiArICAgICAgJHJlZjog
L3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZS1hcnJheQ0KPiA+ICsgICAg
ICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArcmVxdWlyZWQ6DQo+ID4gKyAgLSBjb21wYXRpYmxl
DQo+ID4gKyAgLSByZWcNCj4gPiArICAtIGludGVycnVwdHMNCj4gPiArICAtIHBvd2VyLWRvbWFp
bnMNCj4gPiArICAtIGNsb2Nrcw0KPiA+ICsNCj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZh
bHNlDQo+ID4gKw0KPiA+ICtleGFtcGxlczoNCj4gPiArICAtIHwNCj4gPiArDQo+ID4gKyAgICBk
c2MwOiBkaXNwX2RzY193cmFwQDFjMDA5MDAwIHsNCj4gPiArICAgICAgICBjb21wYXRpYmxlID0g
Im1lZGlhdGVrLG10ODE5NS1kaXNwLWRzYyI7DQo+ID4gKyAgICAgICAgcmVnID0gPDAgMHgxYzAw
OTAwMCAwIDB4MTAwMD47DQo+ID4gKyAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDY0NSBJ
UlFfVFlQRV9MRVZFTF9ISUdIIDA+Ow0KPiA+ICsgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnNw
bSBNVDgxOTVfUE9XRVJfRE9NQUlOX1ZET1NZUzA+Ow0KPiA+ICsgICAgICAgIGNsb2NrcyA9IDwm
dmRvc3lzMCBDTEtfVkRPMF9EU0NfV1JBUDA+Ow0KPiA+ICsgICAgICAgIG1lZGlhdGVrLGdjZS1j
bGllbnQtcmVnID0gPCZnY2UxIFNVQlNZU18xYzAwWFhYWCAweDkwMDANCj4gPiAweDEwMDA+Ow0K
PiA+ICsgICAgfTsNCj4gPiArDQo+ID4gLS0NCj4gPiAyLjE4LjANCj4gPiANCi0tIA0KSmFzb24t
SkggTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0K

