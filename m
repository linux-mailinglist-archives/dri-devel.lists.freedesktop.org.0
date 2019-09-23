Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9D4BB515
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 15:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397146E902;
	Mon, 23 Sep 2019 13:17:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680092.outbound.protection.outlook.com [40.107.68.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71FE6E27A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 09:07:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPH/5d0BwrGY9VQyvv4PDljNgl3feAPF3YCjPLarTYtgeKmYDMUus1sJHmzf6lj/M/90KU/BpPRTkOO8JMOZaWf6VGK60Osru3a146YjC7CGxQZV6g0gHPnlWhmnDSe7mKGEuaN8m+qdi13WUlt8YKUNYYT7Au/2Fa8gR0cnSLZ5fik648VJzIM99HjBz9HQPthAoE+26DNS2WuoGHe6mB1qedc7hHEwdr6yhgX966Jsz85zKHlWW3sB8fCMtATzSXAOcHSHptzic+a0MLnn76eu7oMcPANpP6SrqAMEeI9MS1YUrt+WMeis3QIp69LwtmWMMqEyzqdUBRcKyWZ+Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+S2CWm5kGm/Uu+OLCLguSa5qkZptRgxpnU3HJ34PMk=;
 b=UNvpcWctecbOUexNSdH76IZ/gdLWxAI5V+NmdFqO/NFjH5WvUKQVjWR+oIc03/EOeT+RDF2HdzoPV3WdjGqQNPEEKkEQlua+Fklam22aVrOAd70FZahA9uv7NhPJain81iewgqteJ067MSA5sjHqQeD9OA9g5rVCWzHrJTC7CNoo6bGvf6ogYnx6LC14B0AJhbl+WwSm5Pn37Gn6wouQjHYm+eYDNppP99mZJy62pXLbUQZe0AJMlyWJn5tkJoP5Mmg5ZPiPJlgoHVnQV9E1RBvo2kazjA574R8halOSPaQkPO+TnsIMbxgjKSFLLfzIUecq08DlfgfIhwOKPdqIFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
Received: from MN2PR04MB5886.namprd04.prod.outlook.com (20.179.22.213) by
 MN2PR04MB6079.namprd04.prod.outlook.com (20.178.247.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Mon, 23 Sep 2019 09:07:11 +0000
Received: from MN2PR04MB5886.namprd04.prod.outlook.com
 ([fe80::8520:f80f:ae9:63cd]) by MN2PR04MB5886.namprd04.prod.outlook.com
 ([fe80::8520:f80f:ae9:63cd%6]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 09:07:11 +0000
From: Xin Ji <xji@analogixsemi.com>
To: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda
 <a.hajda@samsung.com>
Subject: [PATCH v1 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Topic: [PATCH v1 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Index: AQHVce5I8PjxKPS5PEGdfXNMa0Wt9w==
Date: Mon, 23 Sep 2019 09:07:10 +0000
Message-ID: <8415b5229354359732052f6ba7ae9ce063c34983.1569229197.git.xji@analogixsemi.com>
References: <cover.1569229197.git.xji@analogixsemi.com>
In-Reply-To: <cover.1569229197.git.xji@analogixsemi.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::13) To MN2PR04MB5886.namprd04.prod.outlook.com
 (2603:10b6:208:a3::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [114.247.245.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a465587d-34dc-47c0-4cb7-08d740056ad9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR04MB6079; 
x-ms-traffictypediagnostic: MN2PR04MB6079:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB6079553C6E9193CAE0C0E149C7850@MN2PR04MB6079.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:854;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(136003)(39840400004)(366004)(346002)(199004)(189003)(66556008)(64756008)(66446008)(11346002)(3846002)(446003)(76176011)(8676002)(6306002)(54906003)(305945005)(7736002)(66476007)(6486002)(4326008)(81156014)(110136005)(25786009)(81166006)(66946007)(6512007)(8936002)(36756003)(6506007)(476003)(386003)(486006)(26005)(102836004)(2906002)(2616005)(71200400001)(186003)(71190400001)(478600001)(118296001)(52116002)(66066001)(14454004)(99286004)(5660300002)(107886003)(6436002)(7416002)(6116002)(86362001)(256004)(2501003)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB6079;
 H:MN2PR04MB5886.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0p9H7mHaP+DkBch2NxtKl+O5RgcBOqKKTtirCFI6/Caae1yKOqbotgSwYiGUhHCuHh0sm0/iQHrWXaIvzYDmB0alkXeMlBHgdgtSqGrpTNunpLFMunu4mkDO3g9pX1kVFUIp3K7Fb0FSoCUBatMWhEACeUeXmac/6e2UZf2OvqYf9gxFN3KplNfla/aO6zV9IrKAD19GtSMAkNpEkxfSxG68ScBqaYvM8CivLvlyyjGDAI1Q2A7u9b9SjHIdzx/AQfVdy0CN82lvFf+b3/0rUw0n/ppMNhJFsZrUp3XUAYycLrZa8wt9a6tdqecnhzCmC6HF4e62d4vhJCjfMzHDQKE/KwfyOzkUWOLOOmLq6leEdo8GhtN6azXD2vuYrf4uVjWyWfp+Fl+Axk7icGxga9ihqFb2L7gmhaT1VGcCWkw=
Content-ID: <B393E0F35731364991EA500670F9D114@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a465587d-34dc-47c0-4cb7-08d740056ad9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 09:07:11.0083 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kz/qouMh6YZnV8K9ufadFstqrRfkc1hvx0ciwAPDTIvvoEaYxlA00gev5myM/eYDXAaYjY3krjqYUwQU7Jg3hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6079
X-Mailman-Approved-At: Mon, 23 Sep 2019 13:17:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+S2CWm5kGm/Uu+OLCLguSa5qkZptRgxpnU3HJ34PMk=;
 b=zai3pCSTIbntRMVTDGPR9UvUfEup9pcxa8GOQcX5bYjMqfTGJ2lGzWgeJtvFXUL+KOUMQhMnrdsVfe0DgUK+xEUZq2n/jfd5ktmKvH+1C1UYp6DBW21r4sNtxSRHsrFOMtNh4fiuRVrZGFm2qaPyOQoqjdjP+Q7q/r1IaKXhQZg=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEFOWDc2MjUgaXMgYW4gdWx0cmEtbG93IHBvd2VyIDRLIE1vYmlsZSBIRCBUcmFuc21pdHRl
ciBkZXNpZ25lZApmb3IgcG9ydGFibGUgZGV2aWNlLiBJdCBjb252ZXJ0cyBNSVBJIHRvIERpc3Bs
YXlQb3J0IDEuMyA0Sy4KCllvdSBjYW4gYWRkIHN1cHBvcnQgdG8geW91ciBib2FyZCB3aXRoIGJp
bmRpbmcuCgpFeGFtcGxlOgoJYW54X2JyaWRnZTogYW54NzYyNUA1OCB7CgkJY29tcGF0aWJsZSA9
ICJhbmFsb2dpeCxhbng3NjI1IjsKCQlyZWcgPSA8MHg1OD47CgkJbG93LXBvd2VyLW1vZGUgPSA8
MT47CgkJZW5hYmxlLWdwaW9zID0gPCZncGlvMCA0NSBHUElPX0FDVElWRV9MT1c+OwoJCXJlc2V0
LWdwaW9zID0gPCZncGlvMCA3MyBHUElPX0FDVElWRV9MT1c+OwoJCXN0YXR1cyA9ICJva2F5IjsK
CQlwb3J0QDAgewoJCQlyZWcgPSA8MD47CgkJCWFueDc2MjVfMV9pbjogZW5kcG9pbnQgewoJCQkJ
cmVtb3RlLWVuZHBvaW50ID0gPCZtaXBpX2RzaV9icmlkZ2VfMT47CgkJCX07CgkJfTsKCX07CgpT
aWduZWQtb2ZmLWJ5OiBYaW4gSmkgPHhqaUBhbmFsb2dpeHNlbWkuY29tPgotLS0KIC4uLi9iaW5k
aW5ncy9kaXNwbGF5L2JyaWRnZS9hbng3NjI1LnlhbWwgICAgICAgICAgIHwgODQgKysrKysrKysr
KysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDg0IGluc2VydGlvbnMoKykKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlk
Z2UvYW54NzYyNS55YW1sCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FueDc2MjUueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbng3NjI1LnlhbWwKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMC4uMjk5MTAzOQotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbng3NjI1LnlhbWwKQEAg
LTAsMCArMSw4NCBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNE
LTItQ2xhdXNlKQorIyBDb3B5cmlnaHQgMjAxOSBBbmFsb2dpeCBTZW1pY29uZHVjdG9yLCBJbmMu
CislWUFNTCAxLjIKKy0tLQorJGlkOiAiaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlz
cGxheS9icmlkZ2UvYW54NzYyNS55YW1sIyIKKyRzY2hlbWE6ICJodHRwOi8vZGV2aWNldHJlZS5v
cmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMiCisKK3RpdGxlOiBBbmFsb2dpeCBBTlg3NjI1IFNs
aW1Qb3J0ICg0SyBNb2JpbGUgSEQgVHJhbnNtaXR0ZXIpCisKK21haW50YWluZXJzOgorICAtIFhp
biBKaSA8eGppQGFuYWxvZ2l4c2VtaS5jb20+CisKK2Rlc2NyaXB0aW9uOiB8CisgIFRoZSBBTlg3
NjI1IGlzIGFuIHVsdHJhLWxvdyBwb3dlciA0SyBNb2JpbGUgSEQgVHJhbnNtaXR0ZXIKKyAgZGVz
aWduZWQgZm9yIHBvcnRhYmxlIGRldmljZXMuCisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6
CisgICAgaXRlbXM6CisgICAgICAtIGNvbnN0OiBhbmFsb2dpeCxhbng3NjI1CisKKyAgcmVnOgor
ICAgIG1heEl0ZW1zOiAxCisKKyAgbG93LXBvd2VyLW1vZGU6CisgICAgZGVzY3JpcHRpb246IExv
dyBwb3dlciBtb2RlIHN1cHBvcnQgZmVhdHVyZQorICAgIG1heEl0ZW1zOiAxCisKKyAgaHBkLWdw
aW9zOgorICAgIGRlc2NyaXB0aW9uOiB1c2VkIGZvciBIUEQgaW50ZXJydXB0CisgICAgbWF4SXRl
bXM6IDEKKworICBlbmFibGUtZ3Bpb3M6CisgICAgZGVzY3JpcHRpb246IHVzZWQgZm9yIHBvd2Vy
IG9uIGNoaXAgY29udHJvbAorICAgIG1heEl0ZW1zOiAxCisKKyAgcmVzZXQtZ3Bpb3M6CisgICAg
ZGVzY3JpcHRpb246IHVzZWQgZm9yIHJlc2V0IGNoaXAgY29udHJvbAorICAgIG1heEl0ZW1zOiAx
CisKKyAgcG9ydEAwOgorICAgIHR5cGU6IG9iamVjdAorICAgIGRlc2NyaXB0aW9uOgorICAgICAg
QSBwb3J0IG5vZGUgcG9pbnRpbmcgdG8gTUlQSSBEU0kgaG9zdCBwb3J0IG5vZGUuCisKKyAgcG9y
dEAxOgorICAgIHR5cGU6IG9iamVjdAorICAgIGRlc2NyaXB0aW9uOgorICAgICAgQSBwb3J0IG5v
ZGUgcG9pbnRpbmcgdG8gTUlQSSBEUEkgaG9zdCBwb3J0IG5vZGUuCisKKyAgcG9ydEAyOgorICAg
IHR5cGU6IG9iamVjdAorICAgIGRlc2NyaXB0aW9uOgorICAgICAgQSBwb3J0IG5vZGUgcG9pbnRp
bmcgdG8gZXh0ZXJuYWwgY29ubmVjdG9yIHBvcnQgbm9kZS4KKworICBwb3J0QDM6CisgICAgdHlw
ZTogb2JqZWN0CisgICAgZGVzY3JpcHRpb246CisgICAgICBBIHBvcnQgbm9kZSBwb2ludGluZyB0
byBpbnRlcm5hbCBwYW5lbCBwb3J0IG5vZGUuCisKKyAgcG9ydEA0OgorICAgIHR5cGU6IG9iamVj
dAorICAgIGRlc2NyaXB0aW9uOgorICAgICAgQSBwb3J0IG5vZGUgcG9pbnRpbmcgdG8gbm9ybWFs
IGVEUCBwb3J0IG5vZGUuCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcKKyAg
LSBwb3J0QDAgfCBwb3J0QDEKKworZXhhbXBsZToKKyAgLSB8CisgICAgYW54X2JyaWRnZTogYW54
NzYyNUA1OCB7CisgICAgICAgIGNvbXBhdGlibGUgPSAiYW5hbG9naXgsYW54NzYyNSI7CisgICAg
ICAgIHJlZyA9IDwweDU4PjsKKyAgICAgICAgbG93LXBvd2VyLW1vZGUgPSA8MD47CisgICAgICAg
IHN0YXR1cyA9ICJva2F5IjsKKyAgICAgICAgcG9ydEAwIHsKKyAgICAgICAgICByZWcgPSA8MD47
CisgICAgICAgICAgYW54NzYyNV8xX2luOiBlbmRwb2ludCB7CisgICAgICAgICAgICByZW1vdGUt
ZW5kcG9pbnQgPSA8Jm1pcGlfZHNpX2JyaWRnZV8xPjsKKyAgICAgICAgICB9OworICAgICAgICB9
OworICAgIH07Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
