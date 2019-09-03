Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE42A74D6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 22:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9AB890DB;
	Tue,  3 Sep 2019 20:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-oln040092071070.outbound.protection.outlook.com [40.92.71.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 386DC890DB
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 20:33:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sxtmrce382C7Nzvz/x2if4akRMu8Aso5VbF7Lmhn+4AYYNVUB+y5tML4VFb03zFUNS5eMu3BekLXVux7G2Yhs5T4HtA4lYNHB6Y5H5QqvFBfPtFZdwGfX/olcMWd/cvb9qCHlYYCs2oqTLjvqo//q0/pKoyeHbLuyO4MVJgcQLzdeN4lXoPA6jYOw0Vtn0yZSkpyDREYGRgoxVScE9wBFgSLf+EZh1CNUqrJ1pdDtg+smR0MJbEYX2XsKzT4mE3ND7rxqQ49P1KeIg/4GLlNTFrDSZzz3YmwBsrAGyzwgfPSt1thHTz5kt0FhUJO++WUlz7uO/SjSykhPGTV9I13WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vgudMTu+DzBbrHIdo/PAUYeHSgztm9UT1pB9ZHTeaA=;
 b=imd2rhaBj+N493R4QZPOOLqdiLw0TmAoCRr2o2Y2vsMWATjZVUjldurPcas1Nmp/YLiG4ZTf8+OGDO2NrgH5N/7sUSv7PZUoy1XWYrtBiuJczTWh6X3VotHIRH9SqGuljAH5Mnh1O+pZy5BoKi4Xfm8U33Ftk2UnCY1pDOvTE8YMKNJvumThMeWW5v83Fbai50NIvSOzC3IWPlgm7DsybEtD9eFTuUK8Kb75MZ0wS2Eo4oqp/Supg1JWFCeQQ62120FQN2DjpiDQ7XwYR5FlYP5R7NdMI93MB5PpsY03XUbhx917K/gUvyZnslSb7g/arKornP4fQ+LWkU57SJuVLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (10.152.20.53) by DB5EUR03HT241.eop-EUR03.prod.protection.outlook.com
 (10.152.21.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.16; Tue, 3 Sep
 2019 20:33:48 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.20.52) by
 DB5EUR03FT045.mail.protection.outlook.com (10.152.21.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16 via Frontend Transport; Tue, 3 Sep 2019 20:33:48 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::59e6:329d:5fc7:5181]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::59e6:329d:5fc7:5181%5]) with mapi id 15.20.2241.014; Tue, 3 Sep 2019
 20:33:46 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: =?Windows-1252?Q?Jernej_=8Akrabec?= <jernej.skrabec@siol.net>, Neil
 Armstrong <narmstrong@baylibre.com>, Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [PATCH] drm: bridge/dw_hdmi: add audio sample channel status
 setting
Thread-Topic: [PATCH] drm: bridge/dw_hdmi: add audio sample channel status
 setting
Thread-Index: AQHVYhuf7WuMEFP/bkanUBsGMqjnp6cZtq2AgACIEYCAAAI2AIAAKJWA
Date: Tue, 3 Sep 2019 20:33:46 +0000
Message-ID: <HE1PR06MB40112AD52DAF0E837F23B441ACB90@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <20190903055103.134764-1-cychiang@chromium.org>
 <e1c3483c-baa6-c726-e547-fadf40d259f4@baylibre.com>
 <d8a80ba5-dd2b-f84d-bbfc-9dd5ccbc26e9@baylibre.com>
 <19353031.SdOy5F5fmg@jernej-laptop>
In-Reply-To: <19353031.SdOy5F5fmg@jernej-laptop>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR09CA0066.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::34) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:AF10315B530FE229F9A374172C0658089A8AA56BE7ABC6CA9449045236CA437D;
 UpperCasedChecksum:51ADB11BF299428844BA49B9481ED552C8BD419DED03D02B8B0DE302B2F8CE6B;
 SizeAsReceived:8834; Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [bTm1tx/PMyEUqdpgzrcGqZvVyVOfVuS7]
x-microsoft-original-message-id: <a55d0984-a1a2-706f-8af5-c7922524c518@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:DB5EUR03HT241; 
x-ms-traffictypediagnostic: DB5EUR03HT241:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-message-info: 8TA9+BaXXYlc8dR3QA3CXw4ARIh3bav/y+Z7arww+94zALge8kokweb9M/i7F+aj8pgA653Rkv1hpOcM2PPUlPrGIIMIT9UoBwvgxVtBgDlQnAdArArMe6/m8lF1GFon9E7dQN3XxwrDUiRmO93DOz8vKSjns2ZSbBzBau4udq/VbM0Q6yjLXseo5lWLSCD8
x-ms-exchange-transport-forked: True
Content-ID: <5F902911163D124685C903F119FA8196@eurprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c9eea3de-525e-45d6-e22f-08d730ae04f0
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 20:33:46.4790 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR03HT241
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tzungbi@chromium.org" <tzungbi@chromium.org>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "zhengxing@rock-chips.com" <zhengxing@rock-chips.com>,
 "cain.cai@rock-chips.com" <cain.cai@rock-chips.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "jeffy.chen@rock-chips.com" <jeffy.chen@rock-chips.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "eddie.cai@rock-chips.com" <eddie.cai@rock-chips.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 Yakir Yang <ykk@rock-chips.com>,
 "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "dgreid@chromium.org" <dgreid@chromium.org>,
 "kuankuan.y@gmail.com" <kuankuan.y@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0wMyAyMDowOCwgSmVybmVqIMWga3JhYmVjIHdyb3RlOgo+IEhpIQo+Cj4gRG5l
IHRvcmVrLCAwMy4gc2VwdGVtYmVyIDIwMTkgb2IgMjA6MDA6MzMgQ0VTVCBqZSBOZWlsIEFybXN0
cm9uZyBuYXBpc2FsKGEpOgo+PiBIaSwKPj4KPj4gTGUgMDMvMDkvMjAxOSDDoCAxMTo1MywgTmVp
bCBBcm1zdHJvbmcgYSDDqWNyaXQgOgo+Pj4gSGksCj4+Pgo+Pj4gT24gMDMvMDkvMjAxOSAwNzo1
MSwgQ2hlbmctWWkgQ2hpYW5nIHdyb3RlOgo+Pj4+IEZyb206IFlha2lyIFlhbmcgPHlra0Byb2Nr
LWNoaXBzLmNvbT4KPj4+Pgo+Pj4+IFdoZW4gdHJhbnNtaXR0aW5nIElFQzYwOTg1IGxpbmVhciBQ
Q00gYXVkaW8sIHdlIGNvbmZpZ3VyZSB0aGUKPj4+PiBBdWRpbyBTYW1wbGUgQ2hhbm5lbCBTdGF0
dXMgaW5mb3JtYXRpb24gb2YgYWxsIHRoZSBjaGFubmVsCj4+Pj4gc3RhdHVzIGJpdHMgaW4gdGhl
IElFQzYwOTU4IGZyYW1lLgo+Pj4+IFJlZmVyIHRvIDYwOTU4LTMgcGFnZSAxMCBmb3IgZnJlcXVl
bmN5LCBvcmlnaW5hbCBmcmVxdWVuY3ksIGFuZAo+Pj4+IHdvcmRsZW5ndGggc2V0dGluZy4KPj4+
Pgo+Pj4+IFRoaXMgZml4IHRoZSBpc3N1ZSB0aGF0IGF1ZGlvIGRvZXMgbm90IGNvbWUgb3V0IG9u
IHNvbWUgbW9uaXRvcnMKPj4+PiAoZS5nLiBMRyAyMkNWMjQxKQo+Pj4+Cj4+Pj4gU2lnbmVkLW9m
Zi1ieTogWWFraXIgWWFuZyA8eWtrQHJvY2stY2hpcHMuY29tPgo+Pj4+IFNpZ25lZC1vZmYtYnk6
IENoZW5nLVlpIENoaWFuZyA8Y3ljaGlhbmdAY2hyb21pdW0ub3JnPgo+Pj4+IC0tLQo+Pj4+Cj4+
Pj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwgNTkgKysrKysr
KysrKysrKysrKysrKysrKysKPj4+PiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9k
dy1oZG1pLmggfCAyMCArKysrKysrKwo+Pj4+ICAyIGZpbGVzIGNoYW5nZWQsIDc5IGluc2VydGlv
bnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9w
c3lzL2R3LWhkbWkuYwo+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1o
ZG1pLmMgaW5kZXgKPj4+PiBiZDY1ZDA0Nzk2ODMuLjM0ZDQ2ZTI1ZDYxMCAxMDA2NDQKPj4+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+Pj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4+Pj4gQEAgLTU4Miw2
ICs1ODIsNjMgQEAgc3RhdGljIHVuc2lnbmVkIGludCBoZG1pX2NvbXB1dGVfbih1bnNpZ25lZCBp
bnQKPj4+PiBmcmVxLCB1bnNpZ25lZCBsb25nIHBpeGVsX2Nsayk+PiAKPj4+PiAgCXJldHVybiBu
Owo+Pj4+ICAKPj4+PiAgfQo+Pj4+Cj4+Pj4gK3N0YXRpYyB2b2lkIGhkbWlfc2V0X3NjaG5sKHN0
cnVjdCBkd19oZG1pICpoZG1pKQo+Pj4+ICt7Cj4+Pj4gKwl1OCBhdWRfc2Nobmxfc2FtcGxlcmF0
ZTsKPj4+PiArCXU4IGF1ZF9zY2hubF84Owo+Pj4+ICsKPj4+PiArCS8qIFRoZXNlIHJlZ2lzdGVy
cyBhcmUgb24gUkszMjg4IHVzaW5nIHZlcnNpb24gMi4wYS4gKi8KPj4+PiArCWlmIChoZG1pLT52
ZXJzaW9uICE9IDB4MjAwYSkKPj4+PiArCQlyZXR1cm47Cj4+PiBBcmUgdGhlc2UgbGltaXRlZCB0
byB0aGUgMi4wYSB2ZXJzaW9uICppbiogUkszMjg4LCBvciAyLjBhIHZlcnNpb24gb24gYWxsCj4+
PiBTb0NzID8KPj4gQWZ0ZXIgaW52ZXN0aWdhdGlvbnMsIEFtbG9naWMgc2V0cyB0aGVzZSByZWdp
c3RlcnMgb24gdGhlaXIgMi4wYSB2ZXJzaW9uCj4+IGFzd2VsbCwgYW5kIEplcm5laiAoYWRkZWQg
aW4gQ2MpIHJlcG9ydGVkIG1lIEFsbHdpbm5lciBzZXRzIHRoZW0gb24gdGhlaXIKPj4gPCAyLjBh
IGFuZCA+IDIuMGEgSVBzIHZlcnNpb25zLgo+Pgo+PiBDYW4geW91IGNoZWNrIG9uIHRoZSBSb2Nr
Y2hpcCBJUCB2ZXJzaW9ucyBpbiBSSzMzOTkgPwo+Pgo+PiBGb3IgcmVmZXJlbmNlLCB0aGUgSERN
SSAxLjRhIElQIHZlcnNpb24gYWxsd2lubmVyIHNldHVwcyBpczoKPj4gaHR0cHM6Ly9naXRodWIu
Y29tL0FsbHdpbm5lci1Ib21sZXQvSDMtQlNQNC40LWxpbnV4L2Jsb2IvbWFzdGVyL2RyaXZlcnMv
dmlkZQo+PiBvL2ZiZGV2L3N1bnhpL2Rpc3AyL2hkbWkvaGRtaV9ic3Bfc3VuOGl3Ny5jI0w1MzEt
TDUzOSAocmVnaXN0ZXJzIGEKPj4gInNjcmFtYmxlZCIgYnV0IGEgY3VzdG9tIGJpdCBjYW4gcmVz
ZXQgdG8gdGhlIG9yaWdpbmFsIG1hcHBpbmcsIDB4MTA2NiAuLi4KPj4gMHgxMDZmKQo+IEZvciBl
YXNpZXIgcmVhZGluZywgaGVyZSBpcyBzaW1pbGFyLCBidXQgYW5ub3RhdGVkIHZlcnNpb246IGh0
dHA6Ly9peC5pby8xVWI2Cj4gQ2hlY2sgZnVuY3Rpb24gYnNwX2hkbWlfYXVkaW8oKS4KPgo+IFVu
bGVzcyB0aGVyZSBpcyBhIHNwZWNpYWwgcmVhc29uLCB5b3UgY2FuIGp1c3QgcmVtb3ZlIHRoYXQg
Y2hlY2suCgpBZ3JlZSwgdGhpcyBjaGVjayBzaG91bGQgbm90IGJlIG5lZWRlZCwgQVVEU0NITkxT
NyB1c2VkIHRvIGJlIGNvbmZpZ3VyZWQgaW4gbXkgb2xkCm11bHRpLWNoYW5uZWwgcGF0Y2hlcyB0
aGF0IGhhdmUgc2VlbiBsb3Qgb2YgdGVzdGluZyBvbiBBbWxvZ2ljLCBBbGx3aW5uZXIgYW5kIFJv
Y2tjaGlwIFNvQ3MuCgo+Cj4gQmVzdCByZWdhcmRzLAo+IEplcm5lago+Cj4+IE5laWwKPj4KPj4+
PiArCj4+Pj4gKwlzd2l0Y2ggKGhkbWktPnNhbXBsZV9yYXRlKSB7Cj4+Pj4gKwljYXNlIDMyMDAw
Ogo+Pj4+ICsJCWF1ZF9zY2hubF9zYW1wbGVyYXRlID0gSERNSV9GQ19BVURTQ0hOTFM3X1NNUFJB
VEVfMzJLOwo+Pj4+ICsJCWJyZWFrOwo+Pj4+ICsJY2FzZSA0NDEwMDoKPj4+PiArCQlhdWRfc2No
bmxfc2FtcGxlcmF0ZSA9IEhETUlfRkNfQVVEU0NITkxTN19TTVBSQVRFXzQ0SzE7Cj4+Pj4gKwkJ
YnJlYWs7Cj4+Pj4gKwljYXNlIDQ4MDAwOgo+Pj4+ICsJCWF1ZF9zY2hubF9zYW1wbGVyYXRlID0g
SERNSV9GQ19BVURTQ0hOTFM3X1NNUFJBVEVfNDhLOwo+Pj4+ICsJCWJyZWFrOwo+Pj4+ICsJY2Fz
ZSA4ODIwMDoKPj4+PiArCQlhdWRfc2Nobmxfc2FtcGxlcmF0ZSA9IEhETUlfRkNfQVVEU0NITkxT
N19TTVBSQVRFXzg4SzI7Cj4+Pj4gKwkJYnJlYWs7Cj4+Pj4gKwljYXNlIDk2MDAwOgo+Pj4+ICsJ
CWF1ZF9zY2hubF9zYW1wbGVyYXRlID0gSERNSV9GQ19BVURTQ0hOTFM3X1NNUFJBVEVfOTZLOwo+
Pj4+ICsJCWJyZWFrOwo+Pj4+ICsJY2FzZSAxNzY0MDA6Cj4+Pj4gKwkJYXVkX3NjaG5sX3NhbXBs
ZXJhdGUgPSBIRE1JX0ZDX0FVRFNDSE5MUzdfU01QUkFURV8xNzZLNDsKPj4+PiArCQlicmVhazsK
Pj4+PiArCWNhc2UgMTkyMDAwOgo+Pj4+ICsJCWF1ZF9zY2hubF9zYW1wbGVyYXRlID0gSERNSV9G
Q19BVURTQ0hOTFM3X1NNUFJBVEVfMTkySzsKPj4+PiArCQlicmVhazsKPj4+PiArCWNhc2UgNzY4
MDAwOgo+Pj4+ICsJCWF1ZF9zY2hubF9zYW1wbGVyYXRlID0gSERNSV9GQ19BVURTQ0hOTFM3X1NN
UFJBVEVfNzY4SzsKPj4+PiArCQlicmVhazsKPj4+PiArCWRlZmF1bHQ6Cj4+Pj4gKwkJZGV2X3dh
cm4oaGRtaS0+ZGV2LCAiVW5zdXBwb3J0ZWQgYXVkaW8gc2FtcGxlIHJhdGUgKCV1KVxuIiwKPj4+
PiArCQkJIGhkbWktPnNhbXBsZV9yYXRlKTsKPj4+PiArCQlyZXR1cm47Cj4+Pj4gKwl9Cj4+Pj4g
Kwo+Pj4+ICsJLyogc2V0IGNoYW5uZWwgc3RhdHVzIHJlZ2lzdGVyICovCj4+Pj4gKwloZG1pX21v
ZGIoaGRtaSwgYXVkX3NjaG5sX3NhbXBsZXJhdGUsIEhETUlfRkNfQVVEU0NITkxTN19TTVBSQVRF
X01BU0ssCj4+Pj4gKwkJICBIRE1JX0ZDX0FVRFNDSE5MUzcpOwo+Pj4+ICsKPj4+PiArCS8qCj4+
Pj4gKwkgKiBTZXQgb3JpZ2luYWwgZnJlcXVlbmN5IHRvIGJlIHRoZSBzYW1lIGFzIGZyZXF1ZW5j
eS4KPj4+PiArCSAqIFVzZSBvbmUtY29tcGxlbWVudCB2YWx1ZSBhcyBzdGF0ZWQgaW4gSUVDNjA5
NTgtMyBwYWdlIDEzLgo+Pj4+ICsJICovCj4+Pj4gKwlhdWRfc2NobmxfOCA9ICh+YXVkX3NjaG5s
X3NhbXBsZXJhdGUpIDw8Cj4+Pj4gKwkJCUhETUlfRkNfQVVEU0NITkxTOF9PUklHU0FNUEZSRVFf
T0ZGU0VUOwo+Pj4+ICsKPj4+PiArCS8qIFRoaXMgbWVhbnMgd29yZCBsZW5ndGggaXMgMTYgYml0
LiBSZWZlciB0byBJRUM2MDk1OC0zIHBhZ2UgMTIuICovCj4+Pj4gKwlhdWRfc2NobmxfOCB8PSAy
IDw8IEhETUlfRkNfQVVEU0NITkxTOF9XT1JETEVHTlRIX09GRlNFVDsKClRoaXMgbG9va3Mgd3Jv
bmcsIHVzZXIgY2FuIHVzZSAxNiBhbmQgMjQgYml0IHdpZGUgYXVkaW8gc3RyZWFtcy4KCj4+Pj4g
Kwo+Pj4+ICsJaGRtaV93cml0ZWIoaGRtaSwgYXVkX3NjaG5sXzgsIEhETUlfRkNfQVVEU0NITkxT
OCk7Cj4+Pj4gK30KPj4+PiArCj4+Pj4KPj4+PiAgc3RhdGljIHZvaWQgaGRtaV9zZXRfY2xrX3Jl
Z2VuZXJhdG9yKHN0cnVjdCBkd19oZG1pICpoZG1pLAo+Pj4+ICAKPj4+PiAgCXVuc2lnbmVkIGxv
bmcgcGl4ZWxfY2xrLCB1bnNpZ25lZCBpbnQgc2FtcGxlX3JhdGUpCj4+Pj4gIAo+Pj4+ICB7Cj4+
Pj4KPj4+PiBAQCAtNjIwLDYgKzY3Nyw4IEBAIHN0YXRpYyB2b2lkIGhkbWlfc2V0X2Nsa19yZWdl
bmVyYXRvcihzdHJ1Y3QgZHdfaGRtaQo+Pj4+ICpoZG1pLD4+IAo+Pj4+ICAJaGRtaS0+YXVkaW9f
Y3RzID0gY3RzOwo+Pj4+ICAJaGRtaV9zZXRfY3RzX24oaGRtaSwgY3RzLCBoZG1pLT5hdWRpb19l
bmFibGUgPyBuIDogMCk7Cj4+Pj4gIAlzcGluX3VubG9ja19pcnEoJmhkbWktPmF1ZGlvX2xvY2sp
Owo+Pj4+Cj4+Pj4gKwo+Pj4+ICsJaGRtaV9zZXRfc2NobmwoaGRtaSk7CgpJIHdpbGwgc3VnZ2Vz
dCB0aGlzIGZ1bmN0aW9uIGlzIGNhbGxlZCBmcm9tIG9yIG1lcmdlZCB3aXRoIGR3X2hkbWlfc2V0
X3NhbXBsZV9yYXRlKCkuClNpbWlsYXIgdG8gaG93IEFVRFNDT05GIGFuZCBBVURJQ09ORjAgaXMg
Y29uZmlndXJlZCBmcm9tIGR3X2hkbWlfc2V0X2NoYW5uZWxfY291bnQoKS4KClJlZ2FyZHMsCkpv
bmFzCgo+Pj4+Cj4+Pj4gIH0KPj4+PiAgCj4+Pj4gIHN0YXRpYyB2b2lkIGhkbWlfaW5pdF9jbGtf
cmVnZW5lcmF0b3Ioc3RydWN0IGR3X2hkbWkgKmhkbWkpCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmgKPj4+PiBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5oIGluZGV4Cj4+Pj4gNjk4OGYxMmQ4OWQ5
Li42MTllYmMxYzgzNTQgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9z
eW5vcHN5cy9kdy1oZG1pLmgKPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9w
c3lzL2R3LWhkbWkuaAo+Pj4+IEBAIC0xNTgsNiArMTU4LDE3IEBACj4+Pj4KPj4+PiAgI2RlZmlu
ZSBIRE1JX0ZDX1NQRERFVklDRUlORiAgICAgICAgICAgICAgICAgICAgMHgxMDYyCj4+Pj4gICNk
ZWZpbmUgSERNSV9GQ19BVURTQ09ORiAgICAgICAgICAgICAgICAgICAgICAgIDB4MTA2Mwo+Pj4+
ICAjZGVmaW5lIEhETUlfRkNfQVVEU1NUQVQgICAgICAgICAgICAgICAgICAgICAgICAweDEwNjQK
Pj4+Pgo+Pj4+ICsjZGVmaW5lIEhETUlfRkNfQVVEU1YgICAgICAgICAgICAgICAgICAgICAgICAg
ICAweDEwNjUKPj4+PiArI2RlZmluZSBIRE1JX0ZDX0FVRFNVICAgICAgICAgICAgICAgICAgICAg
ICAgICAgMHgxMDY2Cj4+Pj4gKyNkZWZpbmUgSERNSV9GQ19BVURTQ0hOTFMwICAgICAgICAgICAg
ICAgICAgICAgIDB4MTA2Nwo+Pj4+ICsjZGVmaW5lIEhETUlfRkNfQVVEU0NITkxTMSAgICAgICAg
ICAgICAgICAgICAgICAweDEwNjgKPj4+PiArI2RlZmluZSBIRE1JX0ZDX0FVRFNDSE5MUzIgICAg
ICAgICAgICAgICAgICAgICAgMHgxMDY5Cj4+Pj4gKyNkZWZpbmUgSERNSV9GQ19BVURTQ0hOTFMz
ICAgICAgICAgICAgICAgICAgICAgIDB4MTA2YQo+Pj4+ICsjZGVmaW5lIEhETUlfRkNfQVVEU0NI
TkxTNCAgICAgICAgICAgICAgICAgICAgICAweDEwNmIKPj4+PiArI2RlZmluZSBIRE1JX0ZDX0FV
RFNDSE5MUzUgICAgICAgICAgICAgICAgICAgICAgMHgxMDZjCj4+Pj4gKyNkZWZpbmUgSERNSV9G
Q19BVURTQ0hOTFM2ICAgICAgICAgICAgICAgICAgICAgIDB4MTA2ZAo+Pj4+ICsjZGVmaW5lIEhE
TUlfRkNfQVVEU0NITkxTNyAgICAgICAgICAgICAgICAgICAgICAweDEwNmUKPj4+PiArI2RlZmlu
ZSBIRE1JX0ZDX0FVRFNDSE5MUzggICAgICAgICAgICAgICAgICAgICAgMHgxMDZmCj4+Pj4KPj4+
PiAgI2RlZmluZSBIRE1JX0ZDX0RBVEFDSDBGSUxMICAgICAgICAgICAgICAgICAgICAgMHgxMDcw
Cj4+Pj4gICNkZWZpbmUgSERNSV9GQ19EQVRBQ0gxRklMTCAgICAgICAgICAgICAgICAgICAgIDB4
MTA3MQo+Pj4+ICAjZGVmaW5lIEhETUlfRkNfREFUQUNIMkZJTEwgICAgICAgICAgICAgICAgICAg
ICAweDEwNzIKPj4+Pgo+Pj4+IEBAIC03MDYsNiArNzE3LDE1IEBAIGVudW0gewo+Pj4+Cj4+Pj4g
IC8qIEhETUlfRkNfQVVEU0NITkxTNyBmaWVsZCB2YWx1ZXMgKi8KPj4+PiAgCj4+Pj4gIAlIRE1J
X0ZDX0FVRFNDSE5MUzdfQUNDVVJBQ1lfT0ZGU0VUID0gNCwKPj4+PiAgCUhETUlfRkNfQVVEU0NI
TkxTN19BQ0NVUkFDWV9NQVNLID0gMHgzMCwKPj4+Pgo+Pj4+ICsJSERNSV9GQ19BVURTQ0hOTFM3
X1NNUFJBVEVfTUFTSyA9IDB4MGYsCj4+Pj4gKwlIRE1JX0ZDX0FVRFNDSE5MUzdfU01QUkFURV8x
OTJLID0gMHhlLAo+Pj4+ICsJSERNSV9GQ19BVURTQ0hOTFM3X1NNUFJBVEVfMTc2SzQgPSAweGMs
Cj4+Pj4gKwlIRE1JX0ZDX0FVRFNDSE5MUzdfU01QUkFURV85NksgPSAweGEsCj4+Pj4gKwlIRE1J
X0ZDX0FVRFNDSE5MUzdfU01QUkFURV83NjhLID0gMHg5LAo+Pj4+ICsJSERNSV9GQ19BVURTQ0hO
TFM3X1NNUFJBVEVfODhLMiA9IDB4OCwKPj4+PiArCUhETUlfRkNfQVVEU0NITkxTN19TTVBSQVRF
XzMySyA9IDB4MywKPj4+PiArCUhETUlfRkNfQVVEU0NITkxTN19TTVBSQVRFXzQ4SyA9IDB4MiwK
Pj4+PiArCUhETUlfRkNfQVVEU0NITkxTN19TTVBSQVRFXzQ0SzEgPSAweDAsCj4+Pj4KPj4+PiAg
LyogSERNSV9GQ19BVURTQ0hOTFM4IGZpZWxkIHZhbHVlcyAqLwo+Pj4+ICAKPj4+PiAgCUhETUlf
RkNfQVVEU0NITkxTOF9PUklHU0FNUEZSRVFfTUFTSyA9IDB4ZjAsCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
