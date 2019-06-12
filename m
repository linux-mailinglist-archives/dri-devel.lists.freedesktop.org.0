Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4731F41D52
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 09:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D63C89333;
	Wed, 12 Jun 2019 07:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140043.outbound.protection.outlook.com [40.107.14.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3179189346
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 07:16:43 +0000 (UTC)
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB2685.eurprd08.prod.outlook.com (10.175.245.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.15; Wed, 12 Jun 2019 07:16:40 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e9f4:59c8:9be1:910b]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e9f4:59c8:9be1:910b%4]) with mapi id 15.20.1987.010; Wed, 12 Jun 2019
 07:16:40 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>
Subject: [PATCH v3 2/2] dt/bindings: drm/komeda: Adds SMMU support for D71
 devicetree
Thread-Topic: [PATCH v3 2/2] dt/bindings: drm/komeda: Adds SMMU support for
 D71 devicetree
Thread-Index: AQHVIO7HLM7CdTu2g0Gbjr3pOjaQxA==
Date: Wed, 12 Jun 2019 07:16:40 +0000
Message-ID: <1560323768-24817-3-git-send-email-lowry.li@arm.com>
References: <1560323768-24817-1-git-send-email-lowry.li@arm.com>
In-Reply-To: <1560323768-24817-1-git-send-email-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR04CA0066.apcprd04.prod.outlook.com
 (2603:1096:202:14::34) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c2275d2e-8c7e-4b69-c434-08d6ef05ea1a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB2685; 
x-ms-traffictypediagnostic: VI1PR08MB2685:
nodisclaimer: True
x-microsoft-antispam-prvs: <VI1PR08MB26850254F534982C116EDAF79FEC0@VI1PR08MB2685.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(366004)(396003)(346002)(376002)(189003)(199004)(2501003)(86362001)(2201001)(14454004)(36756003)(53936002)(6436002)(2906002)(72206003)(6512007)(71190400001)(71200400001)(6636002)(4326008)(6116002)(6486002)(3846002)(478600001)(81156014)(110136005)(68736007)(186003)(316002)(54906003)(52116002)(486006)(66946007)(66476007)(66446008)(476003)(73956011)(446003)(25786009)(2616005)(11346002)(66556008)(64756008)(99286004)(305945005)(81166006)(7736002)(8936002)(26005)(50226002)(76176011)(8676002)(5660300002)(256004)(55236004)(386003)(102836004)(6506007)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2685;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: r4dbHChxtcrwrB20jZKe9N6VqW5ttMZHXCVBeiVwr5qRUBoSKbBx6AiiHbV0EF2Y7j1CHMXz/4lEijWE3Sg4RKxI05vFmAJj0B/LiQV2IKPmBSYrUkoVTTrgCPzhO/EsQu3mMWG5Ex4/YX82ezVmDP37VhYtSeXW/paiDninmH0a+3mPcJrJClnslP1AKC9+M/FRhATuSrKxzOSM7w0tt71Fy+MvovMxmXsC03zU8/wlJNbetDOQVydWBOpSJtb2WmPgeBhVFaSkqayTWlYdDEvePYwisU5Cn1DnAaSCufen9eFJWGuTqsaDVFyg7RfZFtjdyX+ny512JIN9q8swsl6NnVKlZPTstIT3HYnMeuvKjQSVmpg+OisBcAhN/rHwpqPE1ND7Wc6MAlC8TZooXIBnOaF+c3bxLwtkAR6k9jg=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2275d2e-8c7e-4b69-c434-08d6ef05ea1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 07:16:40.6075 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lowry.Li@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2685
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56LNeMIZNC91/x9mnLlBJ5KPOWRS3wH34/bM1FriudE=;
 b=mz0WGxgu0SpLgm8AT6qbbRNfs//KSGREfp8LpzrhFBcDhL3UJ0KLceYqh92HWmFwLCUuMLNJFCgNHO1acxxrtjjrajHJaCLnWga65XXbtNFYo1JAXNyi527paFQ44a+1MJMoh6xrMB0wdD96euf6FUVO6sOyxlpduk2XBhdN24A=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, "Jonathan Chai
 \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogIkxvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkiIDxMb3dyeS5MaUBhcm0uY29t
Pg0KDQpVcGRhdGVzIHRoZSBkZXZpY2UtdHJlZSBkb2MgYWJvdXQgaG93IHRvIGVuYWJsZSBTTU1V
IGJ5IGRldmljZXRyZWUuDQoNClNpZ25lZC1vZmYtYnk6IExvd3J5IExpIChBcm0gVGVjaG5vbG9n
eSBDaGluYSkgPGxvd3J5LmxpQGFybS5jb20+DQpSZXZpZXdlZC1ieTogTGl2aXUgRHVkYXUgPGxp
dml1LmR1ZGF1QGFybS5jb20+DQpSZXZpZXdlZC1ieTogSmFtZXMgUWlhbiBXYW5nIChBcm0gVGVj
aG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPg0KLS0tDQogRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYXJtLGtvbWVkYS50eHQgfCA3ICsrKysr
KysNCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hcm0sa29tZWRhLnR4dCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FybSxrb21lZGEudHh0DQpp
bmRleCAwMmIyMjY1Li5iMTJjMDQ1IDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYXJtLGtvbWVkYS50eHQNCisrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FybSxrb21lZGEudHh0DQpAQCAtMTEsNiArMTEs
MTAgQEAgUmVxdWlyZWQgcHJvcGVydGllczoNCiAgICAgICAtICJwY2xrIjogZm9yIHRoZSBBUEIg
aW50ZXJmYWNlIGNsb2NrDQogLSAjYWRkcmVzcy1jZWxsczogTXVzdCBiZSAxDQogLSAjc2l6ZS1j
ZWxsczogTXVzdCBiZSAwDQorLSBpb21tdXM6IGNvbmZpZ3VyZSB0aGUgc3RyZWFtIGlkIHRvIElP
TU1VLCBNdXN0IGJlIGNvbmZpZ3VyZWQgaWYgd2FudCB0bw0KKyAgICBlbmFibGUgaW9tbXUgaW4g
ZGlzcGxheS4gZm9yIGhvdyB0byBjb25maWd1cmUgdGhpcyBub2RlIHBsZWFzZSByZWZlcmVuY2UN
CisgICAgICAgIGRldmljZXRyZWUvYmluZGluZ3MvaW9tbXUvYXJtLHNtbXUtdjMudHh0LA0KKyAg
ICAgICAgZGV2aWNldHJlZS9iaW5kaW5ncy9pb21tdS9pb21tdS50eHQNCiANCiBSZXF1aXJlZCBw
cm9wZXJ0aWVzIGZvciBzdWItbm9kZTogcGlwZWxpbmVAbnENCiBFYWNoIGRldmljZSBjb250YWlu
cyBvbmUgb3IgdHdvIHBpcGVsaW5lIHN1Yi1ub2RlcyAoYXQgbGVhc3Qgb25lKSwgZWFjaA0KQEAg
LTQ0LDYgKzQ4LDkgQEAgRXhhbXBsZToNCiAJCWludGVycnVwdHMgPSA8MCAxNjggND47DQogCQlj
bG9ja3MgPSA8JmRwdV9tY2xrPiwgPCZkcHVfYWNsaz47DQogCQljbG9jay1uYW1lcyA9ICJtY2xr
IiwgInBjbGsiOw0KKwkJaW9tbXVzID0gPCZzbW11IDA+LCA8JnNtbXUgMT4sIDwmc21tdSAyPiwg
PCZzbW11IDM+LA0KKwkJCTwmc21tdSA0PiwgPCZzbW11IDU+LCA8JnNtbXUgNj4sIDwmc21tdSA3
PiwNCisJCQk8JnNtbXUgOD4sIDwmc21tdSA5PjsNCiANCiAJCWRwMF9waXBlMDogcGlwZWxpbmVA
MCB7DQogCQkJY2xvY2tzID0gPCZmcGdhb3NjMj4sIDwmZHB1X2FjbGs+Ow0KLS0gDQoxLjkuMQ0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
