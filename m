Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE5A2AC55
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2019 23:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC2789733;
	Sun, 26 May 2019 21:20:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-oln040092067051.outbound.protection.outlook.com [40.92.67.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC2389733
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2019 21:20:41 +0000 (UTC)
Received: from VE1EUR02FT016.eop-EUR02.prod.protection.outlook.com
 (10.152.12.57) by VE1EUR02HT120.eop-EUR02.prod.protection.outlook.com
 (10.152.13.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.16; Sun, 26 May
 2019 21:20:39 +0000
Received: from VI1PR03MB4206.eurprd03.prod.outlook.com (10.152.12.55) by
 VE1EUR02FT016.mail.protection.outlook.com (10.152.12.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Sun, 26 May 2019 21:20:39 +0000
Received: from VI1PR03MB4206.eurprd03.prod.outlook.com
 ([fe80::883e:1bd6:cd36:5fb0]) by VI1PR03MB4206.eurprd03.prod.outlook.com
 ([fe80::883e:1bd6:cd36:5fb0%4]) with mapi id 15.20.1922.021; Sun, 26 May 2019
 21:20:39 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH 4/4] drm/sun4i: Enable DRM InfoFrame support on H6
Thread-Topic: [PATCH 4/4] drm/sun4i: Enable DRM InfoFrame support on H6
Thread-Index: AQHVFAjd+8FRSaD9s06/eG9Vpeitjg==
Date: Sun, 26 May 2019 21:20:38 +0000
Message-ID: <VI1PR03MB4206740285A775280063E303AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
References: <VI1PR03MB420621617DDEAB3596700DE0AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
In-Reply-To: <VI1PR03MB420621617DDEAB3596700DE0AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6PR0202CA0018.eurprd02.prod.outlook.com
 (2603:10a6:209:15::31) To VI1PR03MB4206.eurprd03.prod.outlook.com
 (2603:10a6:803:51::23)
x-incomingtopheadermarker: OriginalChecksum:39FDC37F0D6079638BEBDC4B6495A92E1FFE3068C06548128ADA719A139E386A;
 UpperCasedChecksum:4E0C77E1B0E4F7AB2251787617D700249A49BF8898BC910E9254900F4B98C5D3;
 SizeAsReceived:8091; Count:50
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn: [vP+N9OTlA2i0XOtrhUj0j49BqiSlFZhC]
x-microsoft-original-message-id: <20190526212029.32049-1-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 50
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:VE1EUR02HT120; 
x-ms-traffictypediagnostic: VE1EUR02HT120:
x-microsoft-antispam-message-info: DwfEtM1U/LPIbKulFrNml/1YpEh91v8Yy9Ye7COkwcN+pVsIcdgZhftt/zFcdBRoTmkPvZUz28+oGrRZbewv6NAxrRlEO1AaVpF4WxCNEfGOQuyHqFCLFSeDGNFjZ2zwnzirnuG96JrSR6WEQhjyhQKID4stVttn6wzzxQFdf2voWHovyFvgLrstyz4P8otF
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f35009-a6f0-4b72-2d11-08d6e21ffff8
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2019 21:20:38.9439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR02HT120
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
b24gSDYuDQoNCkNjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPg0K
Q2M6IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BzaW9sLm5ldD4NClNpZ25lZC1vZmYt
Ynk6IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2Ry
bS9zdW40aS9zdW44aV9kd19oZG1pLmMgfCAyICsrDQogZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1
bjhpX2R3X2hkbWkuaCB8IDEgKw0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQoN
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfZHdfaGRtaS5jIGIvZHJp
dmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuYw0KaW5kZXggMzlkODUwOWQ5NmEwLi5i
ODAxNjRkZDhhZDggMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfZHdf
aGRtaS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfZHdfaGRtaS5jDQpAQCAt
MTg5LDYgKzE4OSw3IEBAIHN0YXRpYyBpbnQgc3VuOGlfZHdfaGRtaV9iaW5kKHN0cnVjdCBkZXZp
Y2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLA0KIAlzdW44aV9oZG1pX3BoeV9pbml0KGhk
bWktPnBoeSk7DQogDQogCXBsYXRfZGF0YS0+bW9kZV92YWxpZCA9IGhkbWktPnF1aXJrcy0+bW9k
ZV92YWxpZDsNCisJcGxhdF9kYXRhLT5kcm1faW5mb2ZyYW1lID0gaGRtaS0+cXVpcmtzLT5kcm1f
aW5mb2ZyYW1lOw0KIAlzdW44aV9oZG1pX3BoeV9zZXRfb3BzKGhkbWktPnBoeSwgcGxhdF9kYXRh
KTsNCiANCiAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgaGRtaSk7DQpAQCAtMjU1LDYgKzI1
Niw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3VuOGlfZHdfaGRtaV9xdWlya3Mgc3VuOGlfYTgz
dF9xdWlya3MgPSB7DQogDQogc3RhdGljIGNvbnN0IHN0cnVjdCBzdW44aV9kd19oZG1pX3F1aXJr
cyBzdW41MGlfaDZfcXVpcmtzID0gew0KIAkubW9kZV92YWxpZCA9IHN1bjhpX2R3X2hkbWlfbW9k
ZV92YWxpZF9oNiwNCisJLmRybV9pbmZvZnJhbWUgPSB0cnVlLA0KIH07DQogDQogc3RhdGljIGNv
bnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc3VuOGlfZHdfaGRtaV9kdF9pZHNbXSA9IHsNCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfZHdfaGRtaS5oIGIvZHJpdmVycy9n
cHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuaA0KaW5kZXggNzIwYzVhYThhZGMxLi4yYTBlYzA4
ZWUyMzYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfZHdfaGRtaS5o
DQorKysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfZHdfaGRtaS5oDQpAQCAtMTc4LDYg
KzE3OCw3IEBAIHN0cnVjdCBzdW44aV9kd19oZG1pX3F1aXJrcyB7DQogCWVudW0gZHJtX21vZGVf
c3RhdHVzICgqbW9kZV92YWxpZCkoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwNCiAJ
CQkJCSAgIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKTsNCiAJdW5zaWduZWQg
aW50IHNldF9yYXRlIDogMTsNCisJdW5zaWduZWQgaW50IGRybV9pbmZvZnJhbWUgOiAxOw0KIH07
DQogDQogc3RydWN0IHN1bjhpX2R3X2hkbWkgew0KLS0gDQoyLjE3LjENCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
