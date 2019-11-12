Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BD9F8A39
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 09:13:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359B06EA62;
	Tue, 12 Nov 2019 08:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820131.outbound.protection.outlook.com [40.107.82.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 208EE6E22B
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 06:33:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZeRc4z88YWQcJ5/vwHWtpGYie0x/c3wQsvBn1INMtHrqmBlCE3ueRBvIa0uUYhY1peyhSlWCl0T2OAnapDBIDLAiM1CnOmL3DEyvpBeUEEwutO1gW/TaMRAU7IleFGi8W1Bo3wB5Fu1kDFCnOb+ZN7yq9d4TH7Om7BcWuSlfzAKEH2yzah/BYtvdsWUk+1Y+7trjIRmjmjdMeQqCw+LJasEtt+wOHSen3eYrt6l7ku8M8AqBPAwrTSyu9M5I1kqOf4ntp/2qZKNJHIPe8Pm/xsJofCcHAbZEsQXk6qJOjDILO/cso+uN7LVu0g28poAsIZCaZ9R+ivR8fzjp/V7gvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5+GYu9VYFD1uOnMGbRWIfFjJqLaFA4oX3QHgEOliP0=;
 b=K0SNY3/rQ/4XDNXbgzAnZh0iDqkfHTg+SroVl7c4vh8uTL5uWz4vLzPQjLfnGah0zDjSxiBqBONSkYtWMs7FYMrMBv3qX/iydVJU2mhPvUxDt1zTdOBPg9/bhA5ckQNCf9ZEXWRw+nRXIhgPsRC16E6yNn5c3tV3t34Xq8saEwYqP+Wzm6Kl2xcPugA0ndLYMA1Rx/QUVRmaosBdkDX4NeR7R5ogknJJCiZ8W6muyhohYxYy6FZI/zCRcgPTVmqaynqXYB4xfDX8gGc9rpFCXBAUHxvzjjmLr0O4hsjhNQbnBEaKMXOndnVFyX1tGVpBQH9n17kC26i+YywPa2N75Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
Received: from SN6PR04MB4543.namprd04.prod.outlook.com (52.135.120.29) by
 SN6PR04MB4288.namprd04.prod.outlook.com (52.135.72.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Tue, 12 Nov 2019 06:33:30 +0000
Received: from SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::859:2d31:1f00:fa16]) by SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::859:2d31:1f00:fa16%5]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 06:33:30 +0000
From: Xin Ji <xji@analogixsemi.com>
To: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda
 <a.hajda@samsung.com>
Subject: [PATCH v5 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Topic: [PATCH v5 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Index: AQHVmSMZqzZdIpzJL0O/xSQqLi248A==
Date: Tue, 12 Nov 2019 06:33:30 +0000
Message-ID: <67ccead807b7d0a50df479cab2c9d325041224bc.1573540100.git.xji@analogixsemi.com>
References: <cover.1573540100.git.xji@analogixsemi.com>
In-Reply-To: <cover.1573540100.git.xji@analogixsemi.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR01CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:203:92::35) To SN6PR04MB4543.namprd04.prod.outlook.com
 (2603:10b6:805:a8::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [114.247.245.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f50372c7-da1f-4419-e399-08d7673a3b82
x-ms-traffictypediagnostic: SN6PR04MB4288:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR04MB4288C532E2D47AA8C67593C3C7770@SN6PR04MB4288.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39840400004)(346002)(376002)(396003)(136003)(189003)(199004)(66066001)(26005)(4326008)(6506007)(6306002)(6512007)(102836004)(6436002)(386003)(2906002)(6486002)(486006)(476003)(446003)(11346002)(2616005)(52116002)(76176011)(186003)(107886003)(118296001)(66446008)(64756008)(66556008)(66476007)(66946007)(86362001)(256004)(8936002)(99286004)(71200400001)(3846002)(71190400001)(25786009)(110136005)(7416002)(54906003)(5660300002)(2501003)(36756003)(81156014)(81166006)(478600001)(8676002)(305945005)(316002)(7736002)(6116002)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR04MB4288;
 H:SN6PR04MB4543.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KRomdSYjK6S5i+DRIIlqrc60/L86WbzUpHhy/N5Bfgzp7cLWBXOU8XZwnCiPDTuMKdvQZDla+UX8AEVVIOH7I5O465PRD7fUQF7Gp4wLQ5RylvbvLjK7S976G9tGB6S5RJVxz/8zK5IE11Yatx/e4j9FyVVHR2eKbwUA8ndguL5H30VxNzUP5F9NZlAV/nAv7gvqFAmAcMDLOQ2FJmHiqeuwDWZ73qLqRXYkvu0Mdhruvxxitert4Dh9EtuKMknCTi5ccCw1AQ/G2Sxtc3cRMjUNfQcFfyo3HVs4KQX2QxZ4Iek8lPZ14atPQ6CHwtmwdl02Pm/SdcazmKQzJZu/BjAKg2BjY2ZBaqliKlHAHeFH8GxKZ9KJfqTtvS6oqeq3UrkInQfCCVrYeX2/Jt+t36A05JJhYUsrM+H0ErfbOH5SJJoN3Pm0N9ACQzjNwgrO/3AcWTwnjAXLS4G0pN9yIAUiNcoeXHjm6VWTgsS38l0=
Content-ID: <62656DF881A3F7439A9F7675021F5EAB@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f50372c7-da1f-4419-e399-08d7673a3b82
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 06:33:30.3080 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Qv0O74+xhZPs6Ly6DHkdNUh0kUm0QQsYAMSLizWJEpPmiBxKyMSpINmBHlbrK/hUpgHIkz46wAzGrgE5uGKSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4288
X-Mailman-Approved-At: Tue, 12 Nov 2019 08:13:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5+GYu9VYFD1uOnMGbRWIfFjJqLaFA4oX3QHgEOliP0=;
 b=iFA9I8sD2x4S8UyIgxkDRii9yvI6UbUYf94XetR3l6qpFvTcpHCoNv77mXvmuHQ1YWIRys0AZD7CY6EN/h60cVkH1SOBf8vhoLKw6YcVMQiqbW8edbuqzPqarGBDEddgqEvGIUyAOWVLSK8XpJ4oO2EOdksYE7Ebn5xNZuxBtvA=
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
