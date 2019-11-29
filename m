Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD2710DDAF
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2019 14:24:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971506E0FC;
	Sat, 30 Nov 2019 13:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680134.outbound.protection.outlook.com [40.107.68.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D751D6E09C
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 07:34:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVNkYhk1JpZ78z6HIQb+zfHcqImuYpmvR6o93cujZHHJWmY/GKGq9f4hVJEPmCCaNUIXcdejdiZv+9+b0gu7JaEX9fdrwD5Ojqbqg9tRyothgrK8p4m5pxyLXL5uAem9MeWsupnHmXYsAfKElZ1xf7Yfn1O7Kas4/6bhg6EwdtFMeFoDTHQMLUsADIos7FKwmYj+xHH1nYtMVg5MRZYnxp8oTecbrAU0msNBUdqtyt8i66VO9GfVupELXVzqqgzWAZtJqT8fPt76talbmvp/4rPOXE7n46ak/YS6s9g8GgtxCZjB7ZG8Bto54v9gtwKJpZJ6afhSQZZLDG5Hp3a0mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5+GYu9VYFD1uOnMGbRWIfFjJqLaFA4oX3QHgEOliP0=;
 b=jaHyfTXYdWEwERLWR3+HFtmeadAP3lTsP2C/HuuCFDR4DUgo08lizWvrQqyOGNJvOdqZUGadG15Pk299hnfcM5qtip8LUVnreOXrwjJsGU7BcqzajXo62UUsSseG7N+FbadxJaL9L//qLukx0qUi7ntx42CpFSL3Y/hgZragV+XFoga4svhEc6FgEL3OZvAE1xEIy5hb6Fh6pK02CmtioxVxK6k6N5uVcJlyj1cKoG4AzytFoM2PAYtu9nQjI0Urj85Xz1zfgDLWp6LIL7N7a/2tMdbUFQ5rI0AuXb+1aI25xpe2wyC0j1KlgNWLqHF2w17mOMv6Fe9NeOkSViFfQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
Received: from SN6PR04MB4543.namprd04.prod.outlook.com (52.135.120.29) by
 SN6PR04MB4606.namprd04.prod.outlook.com (52.135.120.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Fri, 29 Nov 2019 07:34:03 +0000
Received: from SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::859:2d31:1f00:fa16]) by SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::859:2d31:1f00:fa16%5]) with mapi id 15.20.2495.014; Fri, 29 Nov 2019
 07:34:03 +0000
From: Xin Ji <xji@analogixsemi.com>
To: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda
 <a.hajda@samsung.com>
Subject: [PATCH v6 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Topic: [PATCH v6 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Index: AQHVpodfM9pIQWhfxUGYdHn9Ng0hsQ==
Date: Fri, 29 Nov 2019 07:34:03 +0000
Message-ID: <67ccead807b7d0a50df479cab2c9d325041224bc.1575012508.git.xji@analogixsemi.com>
References: <cover.1575012508.git.xji@analogixsemi.com>
In-Reply-To: <cover.1575012508.git.xji@analogixsemi.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0138.apcprd02.prod.outlook.com
 (2603:1096:202:16::22) To SN6PR04MB4543.namprd04.prod.outlook.com
 (2603:10b6:805:a8::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [114.247.245.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8111e855-5496-406f-df40-08d7749e81eb
x-ms-traffictypediagnostic: SN6PR04MB4606:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR04MB46065716B84A2B0313FF33FAC7460@SN6PR04MB4606.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0236114672
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(346002)(39850400004)(396003)(136003)(189003)(199004)(76176011)(6512007)(478600001)(36756003)(5660300002)(25786009)(107886003)(6486002)(256004)(6506007)(446003)(186003)(2501003)(8936002)(11346002)(4326008)(2616005)(99286004)(86362001)(81156014)(81166006)(8676002)(52116002)(110136005)(2906002)(7416002)(66476007)(64756008)(3846002)(54906003)(305945005)(66946007)(66446008)(102836004)(66066001)(71190400001)(6436002)(316002)(6116002)(14454004)(66556008)(386003)(118296001)(26005)(7736002)(6306002)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR04MB4606;
 H:SN6PR04MB4543.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jAStlCs1pTodvE8lnjqXxjZrrXbWzLZD42Sksq/fFWIh6PkTtrTjOnGt+LNq5TnkxbRewNO5RIt5SQIG6xu5+LU88Nd31J7NChHFKEezVoi8umguZuojxcPrrmIjyj9Yf/8JIpqD5g5AVNybO2I1e19DcvYSX5700xCmVK10ubLICzOBAhQ52YU8Ac/4HyAkDCIpKWTcTUk3lV/eL5xXn6e1ANsPY2n36XHj3Cj17ePsUV2EWt7zfPnqAXX9R95s2FlnXaoWYOkfqUHKmgjIy3fuk0VAz0MfGlKJzlmLxNRyMIG7zp0m8SsLXEae+eRL6bFF60rqmlFaJzZElA5NHybkm/DkMWSm8M3sO9qIkU5yyYUDKWGk8hnoXY+md3PqjB8ksVEPbwNXFEWnjG6oEfuzMemGpaGx/riajcO/LGXGY5zSscE4V56gVOnl2CnUgTIRnmZDiW/X7RAUTl/uAGu3KLZ6msLmravDzzRsBSs=
Content-ID: <1FB9F5F8891DEE4BAD5C4268094E75EE@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8111e855-5496-406f-df40-08d7749e81eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2019 07:34:03.2986 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fgcw2jkhma+7cMyePMSRSDaS4N0E7kB4OcyoP7RH9kIDo2TZZRNgNXrwqm1hhhFSuP0DpphzNeQnFZP4OA4oYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4606
X-Mailman-Approved-At: Sat, 30 Nov 2019 13:23:59 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5+GYu9VYFD1uOnMGbRWIfFjJqLaFA4oX3QHgEOliP0=;
 b=lVkSrMaL5pL0YdrsMZqqBeldzXAEeuYVd6qZibwgFzzfPmYg6XBBVeCRtosKR3HpJRB/L4X8vaTQUqWRfhVcqY9j/D8ZyM1rDTPJF79T/YAhcp5WeVvIuZwQh/flQygIyN2K0XPqvZPZfnlJpz7R7p67ZD594+THc/3n5yOVp+8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=xji@analogixsemi.com; 
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sheng Pan <span@analogixsemi.com>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEFOWDc2MjUgaXMgYW4gdWx0cmEtbG93IHBvd2VyIDRLIE1vYmlsZSBIRCBUcmFuc21pdHRl
ciBkZXNpZ25lZApmb3IgcG9ydGFibGUgZGV2aWNlLiBJdCBjb252ZXJ0cyBNSVBJIHRvIERpc3Bs
YXlQb3J0IDEuMyA0Sy4KCllvdSBjYW4gYWRkIHN1cHBvcnQgdG8geW91ciBib2FyZCB3aXRoIGJp
bmRpbmcuCgpFeGFtcGxlOgoJYW54NzYyNV9icmlkZ2U6IGVuY29kZXJANTggewoJCWNvbXBhdGli
bGUgPSAiYW5hbG9naXgsYW54NzYyNSI7CgkJcmVnID0gPDB4NTg+OwoJCXN0YXR1cyA9ICJva2F5
IjsKCQlwYW5lbC1mbGFncyA9IDwxPjsKCQllbmFibGUtZ3Bpb3MgPSA8JnBpbyA0NSBHUElPX0FD
VElWRV9ISUdIPjsKCQlyZXNldC1ncGlvcyA9IDwmcGlvIDczIEdQSU9fQUNUSVZFX0hJR0g+OwoJ
CSNhZGRyZXNzLWNlbGxzID0gPDE+OwoJCSNzaXplLWNlbGxzID0gPDA+OwoKCQlwb3J0QDAgewoJ
CSAgcmVnID0gPDA+OwoJCSAgYW54XzFfaW46IGVuZHBvaW50IHsKCQkgICAgcmVtb3RlLWVuZHBv
aW50ID0gPCZtaXBpX2RzaT47CgkJICB9OwoJCX07CgoJCXBvcnRAMiB7CgkJICByZWcgPSA8Mj47
CgkJICBhbnhfMV9vdXQ6IGVuZHBvaW50IHsKCQkgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZwYW5l
bF9pbj47CgkJICB9OwoJCX07Cgl9OwoKU2lnbmVkLW9mZi1ieTogWGluIEppIDx4amlAYW5hbG9n
aXhzZW1pLmNvbT4KLS0tCiAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54NzYyNS55YW1s
ICAgICAgICAgICB8IDkxICsrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5
MSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FueDc2MjUueWFtbAoKZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbng3NjI1Lnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54
NzYyNS55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLjExNDllYmIKLS0t
IC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9icmlkZ2UvYW54NzYyNS55YW1sCkBAIC0wLDAgKzEsOTEgQEAKKyMgU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkKKyMgQ29weXJpZ2h0IDIwMTkgQW5h
bG9naXggU2VtaWNvbmR1Y3RvciwgSW5jLgorJVlBTUwgMS4yCistLS0KKyRpZDogImh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvYnJpZGdlL2FueDc2MjUueWFtbCMiCiskc2No
ZW1hOiAiaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjIgorCit0
aXRsZTogQW5hbG9naXggQU5YNzYyNSBTbGltUG9ydCAoNEsgTW9iaWxlIEhEIFRyYW5zbWl0dGVy
KQorCittYWludGFpbmVyczoKKyAgLSBYaW4gSmkgPHhqaUBhbmFsb2dpeHNlbWkuY29tPgorCitk
ZXNjcmlwdGlvbjogfAorICBUaGUgQU5YNzYyNSBpcyBhbiB1bHRyYS1sb3cgcG93ZXIgNEsgTW9i
aWxlIEhEIFRyYW5zbWl0dGVyCisgIGRlc2lnbmVkIGZvciBwb3J0YWJsZSBkZXZpY2VzLgorCitw
cm9wZXJ0aWVzOgorICAiI2FkZHJlc3MtY2VsbHMiOiB0cnVlCisgICIjc2l6ZS1jZWxscyI6IHRy
dWUKKworICBjb21wYXRpYmxlOgorICAgIGl0ZW1zOgorICAgICAgLSBjb25zdDogYW5hbG9naXgs
YW54NzYyNQorCisgIHJlZzoKKyAgICBtYXhJdGVtczogMQorCisgIHBhbmVsLWZsYWdzOgorICAg
IGRlc2NyaXB0aW9uOiBpbmRpY2F0ZSB0aGUgcGFuZWwgaXMgaW50ZXJuYWwgb3IgZXh0ZXJuYWwu
CisgICAgbWF4SXRlbXM6IDEKKworICBpbnRlcnJ1cHRzOgorICAgIG1heEl0ZW1zOiAxCisKKyAg
ZW5hYmxlLWdwaW9zOgorICAgIGRlc2NyaXB0aW9uOiB1c2VkIGZvciBwb3dlciBvbiBjaGlwIGNv
bnRyb2wsIFBPV0VSX0VOIHBpbiBEMi4KKyAgICBtYXhJdGVtczogMQorCisgIHJlc2V0LWdwaW9z
OgorICAgIGRlc2NyaXB0aW9uOiB1c2VkIGZvciByZXNldCBjaGlwIGNvbnRyb2wsIFJFU0VUX04g
cGluIEI3LgorICAgIG1heEl0ZW1zOiAxCisKKyAgcG9ydEAwOgorICAgIHR5cGU6IG9iamVjdAor
ICAgIGRlc2NyaXB0aW9uOgorICAgICAgQSBwb3J0IG5vZGUgcG9pbnRpbmcgdG8gTUlQSSBEU0kg
aG9zdCBwb3J0IG5vZGUuCisKKyAgcG9ydEAxOgorICAgIHR5cGU6IG9iamVjdAorICAgIGRlc2Ny
aXB0aW9uOgorICAgICAgQSBwb3J0IG5vZGUgcG9pbnRpbmcgdG8gTUlQSSBEUEkgaG9zdCBwb3J0
IG5vZGUuCisKKyAgcG9ydEAyOgorICAgIHR5cGU6IG9iamVjdAorICAgIGRlc2NyaXB0aW9uOgor
ICAgICAgQSBwb3J0IG5vZGUgcG9pbnRpbmcgdG8gcGFuZWwgcG9ydCBub2RlLgorCityZXF1aXJl
ZDoKKyAgLSAiI2FkZHJlc3MtY2VsbHMiCisgIC0gIiNzaXplLWNlbGxzIgorICAtIGNvbXBhdGli
bGUKKyAgLSByZWcKKyAgLSBwb3J0QDAKKyAgLSBwb3J0QDIKKworZXhhbXBsZToKKyAgLSB8Cisg
ICAgYW54NzYyNV9icmlkZ2U6IGVuY29kZXJANTggeworICAgICAgICBjb21wYXRpYmxlID0gImFu
YWxvZ2l4LGFueDc2MjUiOworICAgICAgICByZWcgPSA8MHg1OD47CisgICAgICAgIHN0YXR1cyA9
ICJva2F5IjsKKyAgICAgICAgcGFuZWwtZmxhZ3MgPSA8MT47CisgICAgICAgIGVuYWJsZS1ncGlv
cyA9IDwmcGlvIDQ1IEdQSU9fQUNUSVZFX0hJR0g+OworICAgICAgICByZXNldC1ncGlvcyA9IDwm
cGlvIDczIEdQSU9fQUNUSVZFX0hJR0g+OworICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsK
KyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47CisKKyAgICAgICAgcG9ydEAwIHsKKyAgICAgICAg
ICByZWcgPSA8MD47CisgICAgICAgICAgYW54XzFfaW46IGVuZHBvaW50IHsKKyAgICAgICAgICAg
IHJlbW90ZS1lbmRwb2ludCA9IDwmbWlwaV9kc2k+OworICAgICAgICAgIH07CisgICAgICAgIH07
CisKKyAgICAgICAgcG9ydEAyIHsKKyAgICAgICAgICByZWcgPSA8Mj47CisgICAgICAgICAgYW54
XzFfb3V0OiBlbmRwb2ludCB7CisgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JnBhbmVs
X2luPjsKKyAgICAgICAgICB9OworICAgICAgICB9OworICAgIH07Ci0tIAoyLjcuNAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
