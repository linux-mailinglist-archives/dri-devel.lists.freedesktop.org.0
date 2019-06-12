Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CBB41D8D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 09:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC5A89312;
	Wed, 12 Jun 2019 07:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40040.outbound.protection.outlook.com [40.107.4.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B0289312
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 07:22:59 +0000 (UTC)
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3824.eurprd08.prod.outlook.com (20.178.15.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Wed, 12 Jun 2019 07:22:57 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e9f4:59c8:9be1:910b]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e9f4:59c8:9be1:910b%4]) with mapi id 15.20.1987.010; Wed, 12 Jun 2019
 07:22:56 +0000
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
Thread-Index: AQHVIO+oSj+wbiLcuUCxaZC1rLk9uw==
Date: Wed, 12 Jun 2019 07:22:56 +0000
Message-ID: <1560324143-25099-3-git-send-email-lowry.li@arm.com>
References: <1560324143-25099-1-git-send-email-lowry.li@arm.com>
In-Reply-To: <1560324143-25099-1-git-send-email-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::29) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36fadaf1-f9bf-40b2-987a-08d6ef06ca5f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3824; 
x-ms-traffictypediagnostic: VI1PR08MB3824:
nodisclaimer: True
x-microsoft-antispam-prvs: <VI1PR08MB38245A2256BEF47E75B3489E9FEC0@VI1PR08MB3824.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(376002)(39860400002)(366004)(396003)(199004)(189003)(50226002)(64756008)(99286004)(6116002)(66946007)(305945005)(102836004)(7736002)(66556008)(5660300002)(66476007)(25786009)(68736007)(8676002)(6636002)(53936002)(76176011)(73956011)(256004)(4326008)(6506007)(55236004)(8936002)(386003)(81166006)(86362001)(52116002)(2501003)(2201001)(316002)(6512007)(81156014)(6486002)(6436002)(66446008)(71190400001)(3846002)(54906003)(14454004)(110136005)(2616005)(11346002)(66066001)(486006)(2906002)(478600001)(446003)(36756003)(476003)(72206003)(26005)(186003)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3824;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: I3hltVoY+ensp1hR+z/ALoSvXAIz7p4r4IRCuSwcQp2JNyRiHAyZfDxf73SagO2nuAe619LjkvzoTmfO2bxsHCn2D5l64W1hf5Gi2MmyWsoqYtXpZomVZcuayG+7obpmE2o1VGpR/78NpPb+Wa4hUgI/zkBEY7ooIOhmKmK6tjKN3nEXbyRt4L9q6x3Bb4f8GvzXD4V+9Onzu6K3eMyAuvLMb1rpXaRSKLNSgLsr2dbKH+oNzj1Wy2eo54Deh72FQnG9UfKNfT7zw/quFfoFi6o51jhwie7k9SS4YVgQRRDeSKW4wJrCVN7zjMjZhW/SAzk7zVh9rokxmWbnWaFppohERqnHYHd9tvukszotuS6rOfRx/Jjvnykzx+ytFablZEWKmtHn9m8Lhra2+y5Ehh4VJ9pUjxKCQ9OPVFZaOlM=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36fadaf1-f9bf-40b2-987a-08d6ef06ca5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 07:22:56.8702 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lowry.Li@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3824
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56LNeMIZNC91/x9mnLlBJ5KPOWRS3wH34/bM1FriudE=;
 b=Bz8Xe8FHPNtPlyQYeVj1yuGhwplBITHhPbCcGVPn/Rvzsjrz1r8FDs1LZAlM0TzJlhx6HqTr8R4OblHxyNYa4mKw7mN7J79Hp140TkXowVjSa7Jwc66t4k9qOELcP476202x6tuCBp5iVoc5GiYLtCHCnDRHlPTImYEjW7EK3qs=
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
