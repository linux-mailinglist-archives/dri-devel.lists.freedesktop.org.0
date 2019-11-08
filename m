Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C68F2F6CA6
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 03:29:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1AF56E817;
	Mon, 11 Nov 2019 02:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820139.outbound.protection.outlook.com [40.107.82.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199886F8B8
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 08:59:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJyWU0h31FC43F7PLDtgG0axCJ9XXUVDVVx8wHNN4PuysJIAxTA7xl3+Mu7rKuPySGrwrwThIu6szs8A/0WihiOoxQ758ZwdnpbNZXzNkp11sGum8iEQDfiRi5crScDukTbv+PjQ/oaqRbYO22mgjXRznnVu7HNZodB0k1c0yItWNa51r9cxRv629nCdz6O+NOMZ2r1k6tX5PqcKoRP24+YgpGGwQr221xTZbGdN6W5+BlkRyUAhg7G+eO3hPNFxI/oXhZUgWBOK/5/jjWdTW2QSH4mCh+/z5v4AXLckw8Dw4NpP9Z2JvrJL+yndwSrgOdcJXrIeE/IXJDrZ7zTOHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5+GYu9VYFD1uOnMGbRWIfFjJqLaFA4oX3QHgEOliP0=;
 b=nH//AnFZVOZuro4vVpuxiZQKRb9pcotK8TP6+8GfHjkhDycWX6cznF6i8gf/ajO1je/m1Jvj8Cfs1MuokFaS3LSRZlngVcJRx652qLx0ZhPLp+muOtyCYJXNoalIdobHlZZJr/uidczIwlZDtsaaMJoQeufKeqyd/6uiQ0b1MBt/9C5KJWgySoys090gO9saHNIaSTk3OtZN/FJmo0OzrEepX58OF/zkH/1BA0N/HWyWS2gunt8Oo21w8Ju1tST/T4Ju7Fb+CXVguKqYOmqw0ioGiruYbOzf8/5Xr6kLEM0Lndm6+oMlokQmhjpd4OpwyUJQ2J+VdxAPRjkiZ0KoaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
Received: from SN6PR04MB4543.namprd04.prod.outlook.com (52.135.120.29) by
 SN6PR04MB4942.namprd04.prod.outlook.com (52.135.114.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Fri, 8 Nov 2019 08:59:29 +0000
Received: from SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::859:2d31:1f00:fa16]) by SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::859:2d31:1f00:fa16%5]) with mapi id 15.20.2430.023; Fri, 8 Nov 2019
 08:59:29 +0000
From: Xin Ji <xji@analogixsemi.com>
To: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda
 <a.hajda@samsung.com>
Subject: [PATCH v4 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Topic: [PATCH v4 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Index: AQHVlhLT9mIfq1mje06JeNP9Te/Hmg==
Date: Fri, 8 Nov 2019 08:59:27 +0000
Message-ID: <67ccead807b7d0a50df479cab2c9d325041224bc.1573203023.git.xji@analogixsemi.com>
References: <cover.1573203022.git.xji@analogixsemi.com>
In-Reply-To: <cover.1573203022.git.xji@analogixsemi.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0036.apcprd03.prod.outlook.com
 (2603:1096:203:2f::24) To SN6PR04MB4543.namprd04.prod.outlook.com
 (2603:10b6:805:a8::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [114.247.245.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 782ee8a9-9f06-4456-7310-08d76429f4e4
x-ms-traffictypediagnostic: SN6PR04MB4942:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR04MB4942AB984473BE8BC5EA31B6C77B0@SN6PR04MB4942.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39850400004)(396003)(366004)(376002)(136003)(346002)(189003)(199004)(71200400001)(256004)(2501003)(486006)(8676002)(54906003)(2906002)(6486002)(107886003)(6512007)(6306002)(11346002)(446003)(6436002)(2616005)(4326008)(476003)(25786009)(102836004)(66066001)(8936002)(26005)(118296001)(7416002)(52116002)(7736002)(66446008)(66476007)(66556008)(66946007)(99286004)(316002)(5660300002)(86362001)(71190400001)(186003)(36756003)(305945005)(386003)(81166006)(110136005)(81156014)(3846002)(6506007)(76176011)(14454004)(6116002)(64756008)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR04MB4942;
 H:SN6PR04MB4543.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DBLSB9luvgYbuGSsNVOTbiyltskqmeKuDE2mgktBGrVI9Dtji22ITF+8POKHN2xobynzSsuDy8E4dPffclr3J0c9frW7TMGT4oxAZf6iZVcd33qrcyN3cyvvDOrFFhV5wDyX/vjM3gQVdegF9E4IgVhQlno0BEE4XGum1ZVo3NyPSDhljuVS/vmKw/pqcBJcw9DPhnbYyrWU9wIAup+9iOwIo/N/p1Y096KNOcPsKVaT7MYYYAZBSjGyKRsDzVMQVEuj/ZBsID7rHrmUSlJQgFE9w6jM2lE/U0ND9cY9Qe+ECrln9LjKItnMqq4pGkPv74ZYUjulvCkOfakGLrmBkFT3bVkoiZrTKl5a2OxJ6W3UTW0HBnxK7V5fGvAnN5rDDlmwN+bylaH5bLf+gX+GiPGPXxsTG/ON2UBA9IqlUXPSbkCrhj1HuaOKRfPOKXRk/it/qdm9W7vT2gUb3toxwDFKmbM0UtlmI5DcOvlKQiQ=
Content-ID: <457F594ADA47CC4FBDFBC5F56E002D87@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 782ee8a9-9f06-4456-7310-08d76429f4e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 08:59:28.3150 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hiu1z2SSoVEDFsKT9cLQ1LCv5eWmMJbvXh7MISMY9KPIDWr14UGQ56/Xes9hmms1dQeqT2BkVi3N01JU0ksi2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4942
X-Mailman-Approved-At: Mon, 11 Nov 2019 02:29:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5+GYu9VYFD1uOnMGbRWIfFjJqLaFA4oX3QHgEOliP0=;
 b=cRuJWMQeN83dRadZQJknUZDy+lAYeJeCI4F4fVB9WRbrUcOhiIEgVL1m9EvnbxDolCRXiuyaurLHeBk8X7Q+VU50H4+rRLqTdv4LYjzJRTVcPpiBaLV0DqNOXD4Rpoz7azq2t96+PaBWpa6P0plr8HaaT5sLvz1Jz4BnKaqqKvg=
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
