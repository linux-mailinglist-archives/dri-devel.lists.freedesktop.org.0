Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE32D7BFC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 18:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED24E6E869;
	Tue, 15 Oct 2019 16:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690137.outbound.protection.outlook.com [40.107.69.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4D26E7A0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 09:47:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JV2GguyVgEshT+sg1sf+Y6TtaYnNiILQvQyubbPeYjaCYooFzsIHbDiqFvru8jIxy4qvNb6vh9DV8lHK15zvYAyq8O9HgKv0z+585wGyxhbvZeymdTmGUHZ6+1hl+yzT0HrxnbiObFR67dYXCyTpGlcAx4hPWHclNKn1yeo1EQvPzoloVkRuu6cuteQzpnKWl/WdaqLzrA9D3MGKeyN30jUzLtWZGBA3vSrzQYqFMasOo+382qjYDb1h0h9zgVQZL9iVmNbKvEv2L5AOklD0ynBAiypHLvAMQVE8wW7Qkt76A1XyXfWERfo5MvBWoWLK3Mz8pXhKzCTvTnPM90gRvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5+GYu9VYFD1uOnMGbRWIfFjJqLaFA4oX3QHgEOliP0=;
 b=eeJIKLJ9HkWWGCPQ94K+CrYDBM4rhukYg/qh7djkfbb+cDrI7Mv9NJDx7p3TfA4xPMmg41JtDPxQr1MqDUtUL9PEkzAWkSFEQpB4tdOfDUsHamG8FrYXr4/wJuaiuvq/VnZsaviwVOjjycfQ2yrYtUo5pzB4kGz2muZmNZ7WQRYPpS9A948kVCUu44ciyAoHP2cuIxIBCKRF1y8BTyBBwqp37kFquTGEzzT+nypJSLpTLnJ3vdB+dkwBm+cpAZsf0G5ONX0x7j0B+W1qKSJXuLuoXEjOi3oG3YHjvn6AG/3A8G+dqKOWSLGv57QjY+GqoszDeQWWmaXBjnyQVvE8RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
Received: from SN6PR04MB4543.namprd04.prod.outlook.com (52.135.120.29) by
 SN6PR04MB5360.namprd04.prod.outlook.com (20.178.6.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Tue, 15 Oct 2019 09:47:49 +0000
Received: from SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::c55e:6c70:adbb:cf87]) by SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::c55e:6c70:adbb:cf87%5]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 09:47:49 +0000
From: Xin Ji <xji@analogixsemi.com>
To: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda
 <a.hajda@samsung.com>
Subject: [PATCH v3 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Topic: [PATCH v3 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Index: AQHVgz2aARDq5pUGhEq7iSQbrjmgeg==
Date: Tue, 15 Oct 2019 09:47:49 +0000
Message-ID: <67ccead807b7d0a50df479cab2c9d325041224bc.1571132350.git.xji@analogixsemi.com>
References: <cover.1571132350.git.xji@analogixsemi.com>
In-Reply-To: <cover.1571132350.git.xji@analogixsemi.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0028.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:69::41) To SN6PR04MB4543.namprd04.prod.outlook.com
 (2603:10b6:805:a8::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [114.247.245.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0fa2170f-2f16-42a2-9470-08d75154bd20
x-ms-traffictypediagnostic: SN6PR04MB5360:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR04MB5360B6AE6F5CF2D1A0644DB4C7930@SN6PR04MB5360.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(39850400004)(396003)(366004)(376002)(346002)(189003)(199004)(118296001)(99286004)(6486002)(4326008)(2906002)(256004)(14454004)(66066001)(36756003)(2501003)(5660300002)(25786009)(8936002)(386003)(8676002)(81156014)(6436002)(81166006)(478600001)(71200400001)(71190400001)(486006)(476003)(54906003)(316002)(64756008)(66556008)(2616005)(6306002)(6512007)(110136005)(6506007)(446003)(7416002)(305945005)(7736002)(76176011)(11346002)(3846002)(66946007)(26005)(186003)(52116002)(6116002)(66446008)(102836004)(86362001)(66476007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR04MB5360;
 H:SN6PR04MB4543.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GZzdFdt/kcrL5M229sMgVXQsjkz8ulRrTsv5OqXLVAqAhvfTnlTKcGFQJxbSZC+ngNs9tVindRZn6yKYf/NCfyHNGkG+YfRMK6ylfZ1ryQMDGC0VnCE9MXqC/orooBW45Lxjedi0gMjxXkzNHQjRYzXK7OjuMGXE/k0whevVAO7P1MbJ7ZiWgdOgU+vW4l9nYCiedUW8VS/UvGiKC2RUB6DxkNSZwog62N8+BuMibLtYVc9j6dM13rA/xSKrGlHloRrw3fWqcprRY19ybKjWfo+lGBdDgecKASh8nD1h22nBKbG2+6xyvGJ3QGTYK0cB0OMmc0zpIAuaLokdQjsHHw4POE9HUDZeikOX6Kj9w/PsIN7fmtdeEmK8lrWxm+kHE8JfLLCupejc/ebn5GIxS3zMtzqfIgEdb05dsIcaeM8xYZXtxZFcz1Fh8ORR3m+XkM42Hk3Iv0vHojc8pqvBlg==
Content-ID: <B0C10784B4823C45925D40791815413A@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa2170f-2f16-42a2-9470-08d75154bd20
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 09:47:49.2094 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g42dOBjQ4AHTwICyyI5HrBMsBeCrxo4gg/y3an5HnaNQYdatw8NHTVs5BVOSFhkUAz4cHeBB+5r6zTst19KmOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB5360
X-Mailman-Approved-At: Tue, 15 Oct 2019 16:38:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5+GYu9VYFD1uOnMGbRWIfFjJqLaFA4oX3QHgEOliP0=;
 b=roHHYmBTbOyi1MLwAr5c9y+UuNUBmu9YC8jR/HgBG+tBEG0z+h1/1da3eo1XyL1NqqJFi0BEQxcblqjZ0XLDbSrLq7d/ovuC5TCUU5132gqXMuQ6CRmdtAj5tWM+LZFEtqNALVN06LkYVbKejtyNGFqzI/wfeDoftAY1LRCSWRk=
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
 Nicolas Boichat <drinkcat@chromium.org>, "lkp@intel.com" <lkp@intel.com>,
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
