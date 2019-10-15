Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4762FD7BEC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 18:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB6866E853;
	Tue, 15 Oct 2019 16:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750137.outbound.protection.outlook.com [40.107.75.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3ED56E61D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 07:33:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lG2rM5djP0CxkzT8JIpNQp0NLSYQF9y6mAl4YlJAeU6wzwFOD7nU1Ix8AQDpY4qNBCgH0wSnx6dpY9QXFgd5LFHW7BFaSdnPL6xhB77zUhxxWvIFEkVQ0el7pDe/oRKQxDA4Q+l1308JySetrFcP1ngLKOvkme6oA3NNWUgBIk6CGG6xuaqRw3bcr33eDiy8ewTphNU2rqyoH93NZNyOb2mUFd4MAeYkaV64d0yhq0qVmFUt1YCihE0tHGOHz7BCdkXsAKFaTHpOd2iYHRoEugyCMgmFzda9acCnK5aR2i0z3t9WFhkRd+VlyFSLo8Cm3vD3Ue/BtcFf0d1zP7LNZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5+GYu9VYFD1uOnMGbRWIfFjJqLaFA4oX3QHgEOliP0=;
 b=QLVPDKp2ijFrLtI7hKvEPtuGqMgSSMpf6ILn1u2vfo+zE9y6G6eROp31ka/UMcz731WiwQiVUJWXpdq1W2lcixqh3tkV+nTZX1sEJODsEQm9KrzEd0P15ANgmKe3NQz66a/4Obz7YLDLve5apc5CMqGG7RN0ukT/nZypG9pxmr2QzqjgMMZlsR6YSrALLemHQjXfv/tGa5cJhIf/xVPjzbIW7kP+zdUNqL97TWO7zlaFGn52Xupu2Obv9kS2kCHUt1mRJPUVEedLjMs2FKoiKl/plS/kp0F8zQP7AErtNODblvk31z2k8DUtF3YyPP9wuXKczc14ohC6WITTgTSA7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
Received: from SN6PR04MB4543.namprd04.prod.outlook.com (52.135.120.29) by
 SN6PR04MB4254.namprd04.prod.outlook.com (52.135.71.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 15 Oct 2019 07:33:42 +0000
Received: from SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::c55e:6c70:adbb:cf87]) by SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::c55e:6c70:adbb:cf87%5]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 07:33:42 +0000
From: Xin Ji <xji@analogixsemi.com>
To: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda
 <a.hajda@samsung.com>
Subject: [PATCH v3 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Topic: [PATCH v3 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Index: AQHVgyre+S/t6KpHxkeNBy40Rhs+Kw==
Date: Tue, 15 Oct 2019 07:33:41 +0000
Message-ID: <67ccead807b7d0a50df479cab2c9d325041224bc.1571124579.git.xji@analogixsemi.com>
References: <cover.1571124579.git.xji@analogixsemi.com>
In-Reply-To: <cover.1571124579.git.xji@analogixsemi.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR04CA0133.eurprd04.prod.outlook.com (2603:10a6:207::17)
 To SN6PR04MB4543.namprd04.prod.outlook.com
 (2603:10b6:805:a8::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [114.247.245.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3c83893-f8b1-4c50-e349-08d75142009d
x-ms-traffictypediagnostic: SN6PR04MB4254:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR04MB42545BBA73B828295AE09AC5C7930@SN6PR04MB4254.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39840400004)(346002)(136003)(376002)(366004)(199004)(189003)(305945005)(256004)(316002)(71200400001)(186003)(107886003)(36756003)(71190400001)(110136005)(81156014)(81166006)(54906003)(6506007)(76176011)(7416002)(99286004)(86362001)(386003)(66446008)(66946007)(64756008)(14454004)(66476007)(52116002)(8676002)(8936002)(7736002)(66556008)(118296001)(6116002)(6436002)(3846002)(66066001)(5660300002)(4326008)(2501003)(2906002)(102836004)(478600001)(6486002)(26005)(486006)(6512007)(2616005)(25786009)(476003)(446003)(11346002)(6306002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR04MB4254;
 H:SN6PR04MB4543.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bTM6ZKNLu646IvCcfoGqXIV6eV/YDMAmTPq06hGroi6GWQCcdDtYHhFsQN9FiUNtjkml7KwIiRFSVeTiyAvWGnrZDVvj01b4ONyBH2aNo6DjuURT8a684vr0cTwOIHCWxHK5jRmbJahg4YTKKLPQ7R8bY/1/ewpLMZLFzpVgegM2tB0JqcZagcgv+poXST+Ps76Ph3t75x+imq8hbiEDyefjIZt+XeJsZNW3Qqyz8/25ZfYJ8E67vTDOI0qvsOPVCJ0gVIGrEEBFUGvXdyoQ+JjV4QJUYKAJX7jXcVY2xEjJ6gGfyewxcKdcqaVimwblW6XygFD9OrBc8BBGcGM7pdB1oqwNDOxSUmvH1jFdnLozYBrK+3sbgD72uZQgc4r+fFcaZRe6NcYpkl7WvldkMBbPn52dNTbsLsynhuKAJGZyon/jtEHB/pq/2FKiOj/BoEpnGFk7FJHkOCb/OmdJBQ==
Content-ID: <5542EDD13B600F4AAB83B2BE8F0A6C4A@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c83893-f8b1-4c50-e349-08d75142009d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 07:33:42.0320 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AYyMqhNvnxQVAXysP6ntH+i7TE3k7LxcBU1deL1H9FJv55yN7Oq47oEzE9FUZ2IA2QQgukQ4vyjOitp8dddARA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4254
X-Mailman-Approved-At: Tue, 15 Oct 2019 16:38:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5+GYu9VYFD1uOnMGbRWIfFjJqLaFA4oX3QHgEOliP0=;
 b=teY1jyB8PuOUU1Cl/yh0zG/nVWvTWrYYf+v4+zQnv6xH4mUDsXaYaNiFaoj1GQ39s5FKyYQMsFH9Awx0Ad5KUNiAADkspIAHQILZhqZ+TQ7ibrTyKzPmLsC8jzw2B5iVv3Ig/ajVxp/8wnhXB0xkAljzOnZT+aMy773g/yd3BN4=
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
 Nicolas Boichat <drinkcat@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
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
