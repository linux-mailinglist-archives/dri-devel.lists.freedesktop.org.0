Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEAF2AC51
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2019 23:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EEE1897F0;
	Sun, 26 May 2019 21:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-oln040092070048.outbound.protection.outlook.com [40.92.70.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92789897F0
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2019 21:20:07 +0000 (UTC)
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (10.152.18.59) by VE1EUR03HT097.eop-EUR03.prod.protection.outlook.com
 (10.152.19.239) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.16; Sun, 26 May
 2019 21:20:05 +0000
Received: from VI1PR03MB4206.eurprd03.prod.outlook.com (10.152.18.55) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Sun, 26 May 2019 21:20:05 +0000
Received: from VI1PR03MB4206.eurprd03.prod.outlook.com
 ([fe80::883e:1bd6:cd36:5fb0]) by VI1PR03MB4206.eurprd03.prod.outlook.com
 ([fe80::883e:1bd6:cd36:5fb0%4]) with mapi id 15.20.1922.021; Sun, 26 May 2019
 21:20:05 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH 2/4] drm/rockchip: Enable DRM InfoFrame support on RK3328 and
 RK3399
Thread-Topic: [PATCH 2/4] drm/rockchip: Enable DRM InfoFrame support on RK3328
 and RK3399
Thread-Index: AQHVFAjJPuRdg1EVp0Kx4o5U/y99+A==
Date: Sun, 26 May 2019 21:20:05 +0000
Message-ID: <VI1PR03MB42062F51FD88AEB6DADD8734AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
References: <VI1PR03MB420621617DDEAB3596700DE0AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
In-Reply-To: <VI1PR03MB420621617DDEAB3596700DE0AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM5P194CA0019.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::29) To VI1PR03MB4206.eurprd03.prod.outlook.com
 (2603:10a6:803:51::23)
x-incomingtopheadermarker: OriginalChecksum:2F9F864FFCCD18FEB82CD8CE03ED9C81B70E449B994933EE67F2C1E3545D9379;
 UpperCasedChecksum:B7EF89375F1E3B7E4FC9FFC33B9C9C28F0E10F88B54E27966938B966C93A7B84;
 SizeAsReceived:8123; Count:50
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn: [AWzaq9EL1xXMxZ6bhr9jhEiwqzG1hkEr]
x-microsoft-original-message-id: <20190526211954.31938-1-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 50
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031323274)(2017031324274)(2017031322404)(1601125500)(1603101475)(1701031045);
 SRVR:VE1EUR03HT097; 
x-ms-traffictypediagnostic: VE1EUR03HT097:
x-microsoft-antispam-message-info: MMDAyrF7XEnELdmqEZ7is35MB6Ef37uM4MABUUhEdqSY23p7lrqr8HNNHLa0N/ghA59EYLVKKhotYcJPU+8Rz2/ITpbCv+KY0B3kJsXJiP1OcPdyoRQqyssFAZBDiOobXswfjEmbNOspqZ7VJbWqbB73DCtkzniD1V79mIJ4ShSzXvw2AwjDpz5kjaE1l3tB
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 739633f3-2928-4fc0-32c8-08d6e21febc2
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2019 21:20:05.1227 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR03HT097
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
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wens@csie.org" <wens@csie.org>,
 "zhengyang@rock-chips.com" <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBlbmFibGVzIER5bmFtaWMgUmFuZ2UgYW5kIE1hc3RlcmluZyBJbmZvRnJhbWUg
b24gUkszMzI4IGFuZCBSSzMzOTkuDQoNCkNjOiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMu
Y29tPg0KQ2M6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+DQpTaWduZWQtb2ZmLWJ5
OiBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0v
cm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC5jIHwgMiArKw0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kd19o
ZG1pLXJvY2tjaGlwLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hp
cC5jDQppbmRleCA0Y2RjOWY4NmMyZTUuLjFmMzFmMzcyNmYwNCAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMNCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMNCkBAIC00MDUsNiArNDA1LDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBkd19oZG1pX3BsYXRfZGF0YSByazMzMjhfaGRtaV9kcnZfZGF0YSA9
IHsNCiAJLnBoeV9vcHMgPSAmcmszMzI4X2hkbWlfcGh5X29wcywNCiAJLnBoeV9uYW1lID0gImlu
bm9fZHdfaGRtaV9waHkyIiwNCiAJLnBoeV9mb3JjZV92ZW5kb3IgPSB0cnVlLA0KKwkuZHJtX2lu
Zm9mcmFtZSA9IHRydWUsDQogfTsNCiANCiBzdGF0aWMgc3RydWN0IHJvY2tjaGlwX2hkbWlfY2hp
cF9kYXRhIHJrMzM5OV9jaGlwX2RhdGEgPSB7DQpAQCAtNDE5LDYgKzQyMCw3IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZHdfaGRtaV9wbGF0X2RhdGEgcmszMzk5X2hkbWlfZHJ2X2RhdGEgPSB7DQog
CS5jdXJfY3RyICAgID0gcm9ja2NoaXBfY3VyX2N0ciwNCiAJLnBoeV9jb25maWcgPSByb2NrY2hp
cF9waHlfY29uZmlnLA0KIAkucGh5X2RhdGEgPSAmcmszMzk5X2NoaXBfZGF0YSwNCisJLmRybV9p
bmZvZnJhbWUgPSB0cnVlLA0KIH07DQogDQogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgZHdfaGRtaV9yb2NrY2hpcF9kdF9pZHNbXSA9IHsNCi0tIA0KMi4xNy4xDQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
