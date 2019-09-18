Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74570B6855
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 18:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA4A6F413;
	Wed, 18 Sep 2019 16:40:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-oln040092065083.outbound.protection.outlook.com [40.92.65.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA866F413
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 16:40:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nL7aCXJl+j3xz8HA8Z3dbe9ynx/vP8NW3qk19tqO7/COl5MnaUAWtWJhw4DeD/sqglcIN2yFMsaht2OBfnaLVthXZ3GbTLmddGCcPBscVUZqyt5o+sHSUzlZL6gm1Tl87DWQz9EYjsieYhMr6w9bCS8m0GKUCbZS4e0tvHRSkyR3k09kxWtV8kquSuyNWb3pyrdXfsnJ1Pqh0xVNcUX1yzckvP3xx6BVACMzBoKIYDxJL3HEbH3wjq3tcB1rDIBwB3UmundnQpSyIez+zqiP69UMGJLVZqoktuMSsrdbwJ6xYRxJ/VkQRuRYWAnHi604egEPvpGS6e1eU4tszh3QpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZMoTrg56wEkE8XpkGb9arGpKt8/F5VQCd2IUr0oFi0=;
 b=P7aBMY2ot8OGq4zE7J+esdugwocuvLpqmBtx/dvcfIupjxgKMgZC0YmrrV9C0XHf9wLzLqgKwGVP722im0tsTw7aQQRmv5CBoGD6B0NmYWwNH50VG3QgaiyqbcNBQVvCn8f4Fgaq1JY9PtP4PpjQVhYryigWbRXGQf/vza8VzMND5xVPznFf8+c7duc9+/DDF6wfW7Vv3QZok29RxBkCoyfgre/SMuwjPibZ5euv/rRAbw8KI8+83NGeA/Cv+b3tYpQwK7BDrJ2zrCJHNTJLPc8adtJ5e6JUuHSKoPfEqg60qjGjfuM0oZWT2S9i8wFNAxdI2K5T8fwxC93jgoL7XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR01FT061.eop-EUR01.prod.protection.outlook.com
 (10.152.0.58) by HE1EUR01HT096.eop-EUR01.prod.protection.outlook.com
 (10.152.1.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.14; Wed, 18 Sep
 2019 16:39:59 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.0.53) by
 HE1EUR01FT061.mail.protection.outlook.com (10.152.1.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.14 via Frontend Transport; Wed, 18 Sep 2019 16:39:59 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::59e6:329d:5fc7:5181]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::59e6:329d:5fc7:5181%5]) with mapi id 15.20.2263.023; Wed, 18 Sep 2019
 16:39:59 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: Neil Armstrong <narmstrong@baylibre.com>, "a.hajda@samsung.com"
 <a.hajda@samsung.com>, "Laurent.pinchart@ideasonboard.com"
 <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 0/4] drm/bridge: dw-hdmi: Add support for HDR metadata
Thread-Topic: [PATCH 0/4] drm/bridge: dw-hdmi: Add support for HDR metadata
Thread-Index: AQHVFAiaQjT/HgX19UmwJWGXQ9hJLKcxx7oAgACPmYA=
Date: Wed, 18 Sep 2019 16:39:59 +0000
Message-ID: <HE1PR06MB401185B9616FCB5524019C46AC8E0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <VI1PR03MB420621617DDEAB3596700DE0AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
 <4bfa909e-eff1-1514-48f0-c5cd9bb612b9@baylibre.com>
In-Reply-To: <4bfa909e-eff1-1514-48f0-c5cd9bb612b9@baylibre.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0101CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:77::19) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:005AA4195355F0554AAF16A3A6DB578104F749AB6A5925C8AEF7EBA36603E5B9;
 UpperCasedChecksum:715329D88BC1C38A2C084A3EA7A3704FFAE6B60DD61262AD62ACBE7047375063;
 SizeAsReceived:8050; Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [cRtwBS9LZwSuwlqa4wt2L02PZCTK9RdM]
x-microsoft-original-message-id: <adc6f556-a601-b2fb-4cda-44cb9285ddee@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:HE1EUR01HT096; 
x-ms-traffictypediagnostic: HE1EUR01HT096:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-message-info: ywS+/yMT0ArwLFWptynsR6mWmkeGnzMrQTyWF1V8yKkWPFZb9h7LTDB+cTdwrBKxFqoX2q/ufUfQt2SZFReCuky1sTtRNH6x/jRH9xe4ZgiWmJQ+3UF/chdjpwOlJhTuSw7k7xXtGxn1pmrE/9zsNdzKPnvYi6J70wrYNbYyRhWJjPagSB7YEeT1R7QiM+Yb
x-ms-exchange-transport-forked: True
Content-ID: <E16A196484C51E47878FCD603DAC1296@eurprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: eca20f24-df28-43af-2996-08d73c56d82c
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 16:39:59.3788 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT096
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
Cc: "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wens@csie.org" <wens@csie.org>,
 "zhengyang@rock-chips.com" <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmVpbCwNCg0KT24gMjAxOS0wOS0xOCAxMDowNSwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6DQo+
IEhpIEpvbmFzLA0KPg0KPiBPbiAyNi8wNS8yMDE5IDIzOjE4LCBKb25hcyBLYXJsbWFuIHdyb3Rl
Og0KPj4gQWRkIHN1cHBvcnQgZm9yIEhEUiBtZXRhZGF0YSB1c2luZyB0aGUgaGRyX291dHB1dF9t
ZXRhZGF0YSBjb25uZWN0b3IgcHJvcGVydHksDQo+PiBjb25maWd1cmUgRHluYW1pYyBSYW5nZSBh
bmQgTWFzdGVyaW5nIEluZm9GcmFtZSBhY2NvcmRpbmdseS4NCj4+DQo+PiBBIGRybV9pbmZvZnJh
bWUgZmxhZyBpcyBhZGRlZCB0byBkd19oZG1pX3BsYXRfZGF0YSB0aGF0IHBsYXRmb3JtIGRyaXZl
cnMNCj4+IGNhbiB1c2UgdG8gc2lnbmFsIHdoZW4gRHluYW1pYyBSYW5nZSBhbmQgTWFzdGVyaW5n
IGluZm9mcmFtZXMgaXMgc3VwcG9ydGVkLg0KPj4gVGhpcyBmbGFnIGlzIG5lZWRlZCBiZWNhdXNl
IEFtbG9naWMgR1hCQiBhbmQgR1hMIHJlcG9ydCBzYW1lIERXLUhETUkgdmVyc2lvbiwNCj4+IGFu
ZCBvbmx5IEdYTCBzdXBwb3J0IERSTSBJbmZvRnJhbWUuDQo+Pg0KPj4gVGhlIGZpcnN0IHBhdGNo
IGFkZCBmdW5jdGlvbmFsaXR5IHRvIGNvbmZpZ3VyZSBEUk0gSW5mb0ZyYW1lIGJhc2VkIG9uIHRo
ZQ0KPj4gaGRyX291dHB1dF9tZXRhZGF0YSBjb25uZWN0b3IgcHJvcGVydHkuDQo+Pg0KPj4gVGhl
IHJlbWFpbmluZyBwYXRjaGVzIHNldHMgdGhlIGRybV9pbmZvZnJhbWUgZmxhZyBvbiBzb21lIFNv
Q3Mgc3VwcG9ydGluZw0KPj4gRHluYW1pYyBSYW5nZSBhbmQgTWFzdGVyaW5nIEluZm9GcmFtZS4N
Cj4+DQo+PiBOb3RlIHRoYXQgdGhpcyB3YXMgYmFzZWQgb24gdG9wIG9mIGRybS1taXNjLW5leHQg
YW5kIE5laWwgQXJtc3Ryb25nJ3MNCj4+ICJkcm0vbWVzb246IEFkZCBzdXBwb3J0IGZvciBIRE1J
Mi4wIFlVVjQyMCA0azYwIiBzZXJpZXMgYXQgWzFdDQo+IERvIHlvdSBwbGFuIHRvIHJlc2VuZCB0
aGlzIHNlcmllID8NCg0KVGhhbmtzIGZvciByZW1pbmRpbmcgbWUsIEkgd2lsbCBzZW5kIGEgdjIg
cmViYXNlZCBvbiBkcm0tbWlzYy1uZXh0IGFzIHNvb24gYXMgSSBoYXZlIHNvbWUgZnJlZSB0aW1l
IChuZXh0IHdlZWspLg0KDQpSZWdhcmRzLA0KSm9uYXMNCg0KPg0KPiBUaGUgImRybS9tZXNvbjog
QWRkIHN1cHBvcnQgZm9yIEhETUkyLjAgWVVWNDIwIDRrNjAiIHNlcmllIGlzIG5vIG1vcmUNCj4g
dmFsaWQgd2l0aCB0aGUgZm9ybWF0IG5lZ29jaWF0aW9uIHdvcmsgZnJvbSBib3Jpcywgc28geW91
IHNob3VsZCByZWJhc2UNCj4gb24gZHJtLW1pc2MtbmV4dCAhDQo+DQo+IFRoYW5rcywNCj4NCj4g
TmVpbA0KPg0KPj4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMv
NTg3MjUvI3JldjINCj4+DQo+PiBKb25hcyBLYXJsbWFuICg0KToNCj4+ICAgZHJtL2JyaWRnZTog
ZHctaGRtaTogQWRkIER5bmFtaWMgUmFuZ2UgYW5kIE1hc3RlcmluZyBJbmZvRnJhbWUgc3VwcG9y
dA0KPj4gICBkcm0vcm9ja2NoaXA6IEVuYWJsZSBEUk0gSW5mb0ZyYW1lIHN1cHBvcnQgb24gUksz
MzI4IGFuZCBSSzMzOTkNCj4+ICAgZHJtL21lc29uOiBFbmFibGUgRFJNIEluZm9GcmFtZSBzdXBw
b3J0IG9uIEdYTCwgR1hNIGFuZCBHMTJBDQo+PiAgIGRybS9zdW40aTogRW5hYmxlIERSTSBJbmZv
RnJhbWUgc3VwcG9ydCBvbiBINg0KPj4NCj4+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9w
c3lzL2R3LWhkbWkuYyAgIHwgMTA5ICsrKysrKysrKysrKysrKysrKysrDQo+PiAgZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmggICB8ICAzNyArKysrKysrDQo+PiAgZHJp
dmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYyAgICAgICB8ICAgNSArDQo+PiAgZHJp
dmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3X2hkbWktcm9ja2NoaXAuYyB8ICAgMiArDQo+PiAgZHJp
dmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuYyAgICAgICB8ICAgMiArDQo+PiAgZHJp
dmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuaCAgICAgICB8ICAgMSArDQo+PiAgaW5j
bHVkZS9kcm0vYnJpZGdlL2R3X2hkbWkuaCAgICAgICAgICAgICAgICB8ICAgMSArDQo+PiAgNyBm
aWxlcyBjaGFuZ2VkLCAxNTcgaW5zZXJ0aW9ucygrKQ0KPj4NCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
