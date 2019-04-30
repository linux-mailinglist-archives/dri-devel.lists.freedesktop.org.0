Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48417F069
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 08:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F066893A7;
	Tue, 30 Apr 2019 06:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70047.outbound.protection.outlook.com [40.107.7.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C85189349
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 06:19:43 +0000 (UTC)
Received: from DB7PR08MB3530.eurprd08.prod.outlook.com (20.177.120.80) by
 DB7PR08MB3130.eurprd08.prod.outlook.com (52.134.110.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Tue, 30 Apr 2019 06:19:40 +0000
Received: from DB7PR08MB3530.eurprd08.prod.outlook.com
 ([fe80::90f3:99ab:9445:1187]) by DB7PR08MB3530.eurprd08.prod.outlook.com
 ([fe80::90f3:99ab:9445:1187%3]) with mapi id 15.20.1856.008; Tue, 30 Apr 2019
 06:19:40 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>
Subject: [PATCH v1 2/2] dt/bindings: drm/komeda: Adds SMMU support for D71
 devicetree
Thread-Topic: [PATCH v1 2/2] dt/bindings: drm/komeda: Adds SMMU support for
 D71 devicetree
Thread-Index: AQHU/xyuIsyUhsTpy0q582Dqt45LtA==
Date: Tue, 30 Apr 2019 06:19:34 +0000
Message-ID: <1556605118-22700-3-git-send-email-lowry.li@arm.com>
References: <1556605118-22700-1-git-send-email-lowry.li@arm.com>
In-Reply-To: <1556605118-22700-1-git-send-email-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2P15301CA0024.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::34) To DB7PR08MB3530.eurprd08.prod.outlook.com
 (2603:10a6:10:49::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 329dee61-49a1-40ee-50d4-08d6cd33d04b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DB7PR08MB3130; 
x-ms-traffictypediagnostic: DB7PR08MB3130:
nodisclaimer: True
x-microsoft-antispam-prvs: <DB7PR08MB313068058B9DBF91BA92FBCE9F3A0@DB7PR08MB3130.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(376002)(136003)(396003)(366004)(189003)(199004)(6436002)(36756003)(110136005)(386003)(97736004)(8676002)(81156014)(81166006)(14454004)(26005)(3846002)(478600001)(5660300002)(8936002)(54906003)(2501003)(55236004)(102836004)(6486002)(25786009)(6506007)(6116002)(76176011)(4326008)(256004)(316002)(68736007)(305945005)(66066001)(7736002)(86362001)(72206003)(2201001)(486006)(2616005)(2906002)(6512007)(73956011)(6666004)(66946007)(446003)(53936002)(11346002)(476003)(6636002)(50226002)(66446008)(66476007)(52116002)(71200400001)(71190400001)(186003)(64756008)(99286004)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR08MB3130;
 H:DB7PR08MB3530.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XIvDxC4Hqa+QMCtoCRzMjZhcVmVQQzCPYUdzKdU1oe1j7C9+rNGNUdVF+1bixS//ax1Ks8C6+x4lq3HAI1jGwPS421hbyTSlvmMojZzGk8Ps9JhUsitBWkGYPkTzYDWdECiHSy/ovL/eYQF3kNvjfYUzUydEodmeOVqP/Ot44OGwI+9Il+IZgbS2wXMI1t97kHlbVlV9k3zeYEjWAb9Z70ZIGsd8nFNBtpt7D0BPWmk+Jd3IXI3dEM2TA+9SKnohLgDRyD7g6uvSYZGrkzUh+qvhzql5O85nxbAT4SHoIm8CO/ZSdHqh9tjDh5z5NHYnrDWYy6c/CRD1JonItxZPz6kP3jftPRrXzWJ0WtoXu8eyi/hgwH9RH5gJlOZ8uCf5AmKNIJ8YbGoXDYrS7M7tm2n2No3bxj7/uV+9do3BO5c=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 329dee61-49a1-40ee-50d4-08d6cd33d04b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 06:19:34.5660 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3130
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x23vJnRDmjtQJCyno+k0trfgn/Q6gh1JDJ4ny5d17aM=;
 b=edLPykXcfStuQqO0UZ+eSpczesYa24YsOxpYracsS5US7/fFIm2LDEnhtwOXWiNX0Osbep5hfMdQdWp5uz3akvVx4BYU2kdLg1L/sCqntNlxXg4O6NEfDY3KhaWOUnUvetGszO6TX4lqXfHJp9AUuypk2CLFIj3y+7li7JhY2SA=
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
bmEpIDxsb3dyeS5saUBhcm0uY29tPg0KLS0tDQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvYXJtLGtvbWVkYS50eHQgfCA3ICsrKysrKysNCiAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9hcm0sa29tZWRhLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FybSxrb21lZGEudHh0DQppbmRleCAwMmIyMjY1Li5iMTJj
MDQ1IDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvYXJtLGtvbWVkYS50eHQNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L2FybSxrb21lZGEudHh0DQpAQCAtMTEsNiArMTEsMTAgQEAgUmVxdWlyZWQgcHJv
cGVydGllczoNCiAgICAgICAtICJwY2xrIjogZm9yIHRoZSBBUEIgaW50ZXJmYWNlIGNsb2NrDQog
LSAjYWRkcmVzcy1jZWxsczogTXVzdCBiZSAxDQogLSAjc2l6ZS1jZWxsczogTXVzdCBiZSAwDQor
LSBpb21tdXM6IGNvbmZpZ3VyZSB0aGUgc3RyZWFtIGlkIHRvIElPTU1VLCBNdXN0IGJlIGNvbmZp
Z3VyZWQgaWYgd2FudCB0bw0KKyAgICBlbmFibGUgaW9tbXUgaW4gZGlzcGxheS4gZm9yIGhvdyB0
byBjb25maWd1cmUgdGhpcyBub2RlIHBsZWFzZSByZWZlcmVuY2UNCisgICAgICAgIGRldmljZXRy
ZWUvYmluZGluZ3MvaW9tbXUvYXJtLHNtbXUtdjMudHh0LA0KKyAgICAgICAgZGV2aWNldHJlZS9i
aW5kaW5ncy9pb21tdS9pb21tdS50eHQNCiANCiBSZXF1aXJlZCBwcm9wZXJ0aWVzIGZvciBzdWIt
bm9kZTogcGlwZWxpbmVAbnENCiBFYWNoIGRldmljZSBjb250YWlucyBvbmUgb3IgdHdvIHBpcGVs
aW5lIHN1Yi1ub2RlcyAoYXQgbGVhc3Qgb25lKSwgZWFjaA0KQEAgLTQ0LDYgKzQ4LDkgQEAgRXhh
bXBsZToNCiAJCWludGVycnVwdHMgPSA8MCAxNjggND47DQogCQljbG9ja3MgPSA8JmRwdV9tY2xr
PiwgPCZkcHVfYWNsaz47DQogCQljbG9jay1uYW1lcyA9ICJtY2xrIiwgInBjbGsiOw0KKwkJaW9t
bXVzID0gPCZzbW11IDA+LCA8JnNtbXUgMT4sIDwmc21tdSAyPiwgPCZzbW11IDM+LA0KKwkJCTwm
c21tdSA0PiwgPCZzbW11IDU+LCA8JnNtbXUgNj4sIDwmc21tdSA3PiwNCisJCQk8JnNtbXUgOD4s
IDwmc21tdSA5PjsNCiANCiAJCWRwMF9waXBlMDogcGlwZWxpbmVAMCB7DQogCQkJY2xvY2tzID0g
PCZmcGdhb3NjMj4sIDwmZHB1X2FjbGs+Ow0KLS0gDQoxLjkuMQ0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
