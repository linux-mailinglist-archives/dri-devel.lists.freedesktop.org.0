Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8B3370E0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 11:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C33897BC;
	Thu,  6 Jun 2019 09:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30053.outbound.protection.outlook.com [40.107.3.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7738A897BC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 09:53:13 +0000 (UTC)
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB4285.eurprd08.prod.outlook.com (20.179.25.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Thu, 6 Jun 2019 09:53:11 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e9f4:59c8:9be1:910b]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e9f4:59c8:9be1:910b%4]) with mapi id 15.20.1965.011; Thu, 6 Jun 2019
 09:53:11 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>
Subject: [PATCH v2 2/2] dt/bindings: drm/komeda: Adds SMMU support for D71
 devicetree
Thread-Topic: [PATCH v2 2/2] dt/bindings: drm/komeda: Adds SMMU support for
 D71 devicetree
Thread-Index: AQHVHE2mr3BUk1ioOkWkaZ2sLFcnGg==
Date: Thu, 6 Jun 2019 09:53:10 +0000
Message-ID: <1559814765-18455-3-git-send-email-lowry.li@arm.com>
References: <1559814765-18455-1-git-send-email-lowry.li@arm.com>
In-Reply-To: <1559814765-18455-1-git-send-email-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0169.apcprd02.prod.outlook.com
 (2603:1096:201:1f::29) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d30e36e1-e296-497e-f49b-08d6ea64c8b9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB4285; 
x-ms-traffictypediagnostic: VI1PR08MB4285:
nodisclaimer: True
x-microsoft-antispam-prvs: <VI1PR08MB428592E44B1E14E52F5D07679F170@VI1PR08MB4285.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(376002)(136003)(396003)(346002)(189003)(199004)(52116002)(6486002)(66066001)(2201001)(4326008)(386003)(6436002)(6116002)(86362001)(3846002)(446003)(76176011)(102836004)(8676002)(2616005)(55236004)(99286004)(476003)(305945005)(7736002)(25786009)(14454004)(53936002)(6512007)(486006)(316002)(68736007)(6636002)(186003)(6506007)(36756003)(50226002)(110136005)(2906002)(71200400001)(71190400001)(2501003)(26005)(11346002)(5660300002)(8936002)(81156014)(72206003)(256004)(81166006)(66556008)(64756008)(66446008)(66476007)(73956011)(478600001)(54906003)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4285;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Pe73M9QPkbvj/u8K+ec1u552PLNFTM7T5nq+F+rlgGW4kInTNLpKiC4CHiGbr4R+L35EBHXQWG4qWqBRjb9bdl4rqmgRJUZHTb896wM6KUwky+WriS5zdnq706mHWrzfJ3JX4BdFLm4wa0VdMabxMGJBqAU2xR22veJ1XVu5CZ4+QVeA237+ocsCvKeYoVHXvjO40LxywB1YQRNN3L3nDs67M2mY1bqaEDMeVdtCSMEPTzZDXYR5U3rYNJda60spfLFliVJYxlTdbZlgeEuw5Qc0xGwtBD9M5vkftFOrv4Odu7GSa3GAqbgjlEPjNDmYpVssqxhYt1HEIj53aKXWhxWvTGax+MJRm6dHimNZ5eVFu8XnRZCnvEzIlWgmuxoADCaICS27SifgktUqQP2v64p8nf1JlGv2CcIATh9d8CE=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d30e36e1-e296-497e-f49b-08d6ea64c8b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 09:53:10.9876 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lowry.Li@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4285
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sl7Qn1204UQlhgDiKp2mJoeQ3g3KynzwhZ57SJ4CoGk=;
 b=E2f1NTSYmNcGOml52FsStZLXmYSixibRyJb+iCIF2BlAFjXCP97D7RaRje6gOaitTndKsQaL2vhTViI/Su7UXcCah+Zwh9kfLG6YkOb05bEaExeKB8qhyQoPBEHo+pmbBcxncKlHk+pnf615ITCaZ9iQH5mQQjvvyLrWezuPxT0=
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

VXBkYXRlcyB0aGUgZGV2aWNlLXRyZWUgZG9jIGFib3V0IGhvdyB0byBlbmFibGUgU01NVSBieSBk
ZXZpY2V0cmVlLg0KDQpTaWduZWQtb2ZmLWJ5OiBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hp
bmEpIDxsb3dyeS5saUBhcm0uY29tPg0KUmV2aWV3ZWQtYnk6IExpdml1IER1ZGF1IDxsaXZpdS5k
dWRhdUBhcm0uY29tPg0KUmV2aWV3ZWQtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xv
Z3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4NCg0KLS0tDQogRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYXJtLGtvbWVkYS50eHQgfCA3ICsrKysrKysN
CiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hcm0sa29tZWRhLnR4dCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FybSxrb21lZGEudHh0DQppbmRl
eCAwMmIyMjY1Li5iMTJjMDQ1IDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvYXJtLGtvbWVkYS50eHQNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FybSxrb21lZGEudHh0DQpAQCAtMTEsNiArMTEsMTAg
QEAgUmVxdWlyZWQgcHJvcGVydGllczoNCiAgICAgICAtICJwY2xrIjogZm9yIHRoZSBBUEIgaW50
ZXJmYWNlIGNsb2NrDQogLSAjYWRkcmVzcy1jZWxsczogTXVzdCBiZSAxDQogLSAjc2l6ZS1jZWxs
czogTXVzdCBiZSAwDQorLSBpb21tdXM6IGNvbmZpZ3VyZSB0aGUgc3RyZWFtIGlkIHRvIElPTU1V
LCBNdXN0IGJlIGNvbmZpZ3VyZWQgaWYgd2FudCB0bw0KKyAgICBlbmFibGUgaW9tbXUgaW4gZGlz
cGxheS4gZm9yIGhvdyB0byBjb25maWd1cmUgdGhpcyBub2RlIHBsZWFzZSByZWZlcmVuY2UNCisg
ICAgICAgIGRldmljZXRyZWUvYmluZGluZ3MvaW9tbXUvYXJtLHNtbXUtdjMudHh0LA0KKyAgICAg
ICAgZGV2aWNldHJlZS9iaW5kaW5ncy9pb21tdS9pb21tdS50eHQNCiANCiBSZXF1aXJlZCBwcm9w
ZXJ0aWVzIGZvciBzdWItbm9kZTogcGlwZWxpbmVAbnENCiBFYWNoIGRldmljZSBjb250YWlucyBv
bmUgb3IgdHdvIHBpcGVsaW5lIHN1Yi1ub2RlcyAoYXQgbGVhc3Qgb25lKSwgZWFjaA0KQEAgLTQ0
LDYgKzQ4LDkgQEAgRXhhbXBsZToNCiAJCWludGVycnVwdHMgPSA8MCAxNjggND47DQogCQljbG9j
a3MgPSA8JmRwdV9tY2xrPiwgPCZkcHVfYWNsaz47DQogCQljbG9jay1uYW1lcyA9ICJtY2xrIiwg
InBjbGsiOw0KKwkJaW9tbXVzID0gPCZzbW11IDA+LCA8JnNtbXUgMT4sIDwmc21tdSAyPiwgPCZz
bW11IDM+LA0KKwkJCTwmc21tdSA0PiwgPCZzbW11IDU+LCA8JnNtbXUgNj4sIDwmc21tdSA3PiwN
CisJCQk8JnNtbXUgOD4sIDwmc21tdSA5PjsNCiANCiAJCWRwMF9waXBlMDogcGlwZWxpbmVAMCB7
DQogCQkJY2xvY2tzID0gPCZmcGdhb3NjMj4sIDwmZHB1X2FjbGs+Ow0KLS0gDQoxLjkuMQ0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
