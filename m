Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEA22BDFE
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 05:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D403589AEA;
	Tue, 28 May 2019 03:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00067.outbound.protection.outlook.com [40.107.0.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DED689AEA
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 03:57:00 +0000 (UTC)
Received: from DB7PR08MB3530.eurprd08.prod.outlook.com (20.177.120.80) by
 DB7PR08MB3580.eurprd08.prod.outlook.com (20.177.120.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Tue, 28 May 2019 03:56:56 +0000
Received: from DB7PR08MB3530.eurprd08.prod.outlook.com
 ([fe80::e41c:9e3c:80bf:25c6]) by DB7PR08MB3530.eurprd08.prod.outlook.com
 ([fe80::e41c:9e3c:80bf:25c6%5]) with mapi id 15.20.1943.016; Tue, 28 May 2019
 03:56:56 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>
Subject: [PATCH v3 0/2] drm/komeda: Add rotation support on Komeda driver
Thread-Topic: [PATCH v3 0/2] drm/komeda: Add rotation support on Komeda driver
Thread-Index: AQHVFQlkGAbH4T6eKkaM9Q4LTPO8WA==
Date: Tue, 28 May 2019 03:56:55 +0000
Message-ID: <1559015784-18998-1-git-send-email-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0197.apcprd02.prod.outlook.com
 (2603:1096:201:21::33) To DB7PR08MB3530.eurprd08.prod.outlook.com
 (2603:10a6:10:49::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46fa3474-3ce3-42dd-7bdd-08d6e3208676
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DB7PR08MB3580; 
x-ms-traffictypediagnostic: DB7PR08MB3580:
x-ms-exchange-purlcount: 6
nodisclaimer: True
x-microsoft-antispam-prvs: <DB7PR08MB35801472AAF0AF54D9E414A99F1E0@DB7PR08MB3580.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(346002)(366004)(39860400002)(136003)(189003)(199004)(8936002)(6486002)(2501003)(81166006)(81156014)(6306002)(6436002)(71200400001)(6512007)(86362001)(305945005)(5660300002)(486006)(66066001)(36756003)(478600001)(7736002)(8676002)(71190400001)(50226002)(53936002)(2201001)(316002)(6636002)(2906002)(54906003)(66476007)(66556008)(66446008)(2616005)(73956011)(186003)(26005)(68736007)(476003)(256004)(25786009)(3846002)(6116002)(99286004)(52116002)(386003)(6506007)(102836004)(966005)(55236004)(72206003)(14454004)(66946007)(110136005)(64756008)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR08MB3580;
 H:DB7PR08MB3530.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Z1T4U/qonqngQyk+tph9Jnf3krIa95s2asHem13oIbyPTFzRpXVIS5uHAQbBqTve0ELC1fZZ/DsC7BHXCNfT+zXGd7h0X/19bRu4gTc82EKsD/bkDu2ypWlDWJqAEPOEgp6JSrkT15ZOYAqKqVJ5EtFol7a86OO1O9Kt8UNdr/Y+GkMOz8S6BNyHNr3VWZ+9RdVhXEXrFgNdhr41M7GMyFELiNE0orcxx2OIS/BDC7hzlaIWtus7U71B+4m5imwYVUTFEBxf/SWjl3o0qycWMQYxZju5Xz6hmCnKvrd2Wa9kYiN5AQLp2FjWu7NHGpTgiLKu0qqSmu7CbO3c8Fhq7jOK+y5iE5NV234HQtWVKX5Mhk5pYcOg9y3RsOvMg/zweipnx/G6qpistK8/jJiCKbfgs+94UGJOlGn/qoUlHUw=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46fa3474-3ce3-42dd-7bdd-08d6e3208676
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 03:56:55.9760 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lowry.Li@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3580
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGbJ7FZ6aoRRo74eCLLe7721Tuk7Yfw8G4uNDZFgud0=;
 b=whTR/MPriGawfmvYfnsHegArcZFRE9sle0txoRK3RxWuidynAQ+oxGyGOt+um6myv3xiT7FB8Do4D6CrCEnTdlD9fM8YbFg+/ngjmpjMMo3D7P+plSQz3PjvnojqLSRRqjkmvYqqbXfBbAtbCVLnDO3xgc3ofIjbIlOHrwa3IEE=
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

SGksDQoNClRoaXMgc2VyaWUgYWltcyBhdCBhZGRpbmcgdGhlIHN1cHBvcnQgZm9yIHJvdGF0aW9u
IG9uIEtvbWVkYSBkcml2ZXIuDQpGb3Igcm90YXRpb24sIEQ3MSBkb2Vzbid0IHN1cHBvcnQgUm90
OTAgZm9yIEFGQkMgd2lkZSBibG9jay4gU28gdGhpcyBwYXRjaA0Kc2V0IGFsc28gaW5jbHVkZXMg
dGhlIGxpbWl0YXRpb24gY2hlY2suDQoNClRoaXMgcGF0Y2ggc2VyaWVzIGRlcGVuZHMgb246DQot
IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNTk5MTUvDQotIGh0dHBz
Oi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNTg2NjUvDQotIGh0dHBzOi8vcGF0
Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNTkwMDAvDQotIGh0dHBzOi8vcGF0Y2h3b3Jr
LmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNTkwMDIvDQotIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVk
ZXNrdG9wLm9yZy9zZXJpZXMvNTk0NzEvDQotIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9w
Lm9yZy9zZXJpZXMvNTg3MTAvDQoNCkNoYW5nZXMgc2luY2UgdjE6DQotIE1vZGlmeSBwYXRjaCBk
ZW5wZW5kZW5jeSBpbiB0aGUgY29tbWVudA0KDQpDaGFuZ2VzIHNpbmNlIHYyOg0KLSBSZWJhc2Ug
dGhlIGNvZGUNCg0KUmVnYXJkcywNCkxvd3J5DQoNCkxvd3J5IExpIChBcm0gVGVjaG5vbG9neSBD
aGluYSkgKDIpOg0KICBkcm0va29tZWRhOiBBZGQgcm90YXRpb24gc3VwcG9ydCBvbiBLb21lZGEg
ZHJpdmVyDQogIGRybS9rb21lZGE6IEFkZHMgbGltaXRhdGlvbiBjaGVjayBmb3IgQUZCQyB3aWRl
IGJsb2NrIG5vdCBzdXBwb3J0DQogICAgUm90OTANCg0KIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuYyAgICAgIHwgMTUgKysrKysrKysrKysrKysrDQogLi4u
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mb3JtYXRfY2Fwcy5jICAgfCAgNyAr
KysrKystDQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mb3JtYXRfY2Fw
cy5oICAgfCAxOSArKysrKysrKysrKysrKysrKystDQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9mcmFtZWJ1ZmZlci5jICAgfCAxOCArKysrKysrKystLS0tLS0tLS0NCiAu
Li4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ZyYW1lYnVmZmVyLmggICB8ICA1
ICsrKy0tDQogLi4uL2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRl
LmMgICAgfCAxNSArKysrKysrKysrKysrKy0NCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9wbGFuZS5jICAgICB8IDE4ICsrKysrKysrKysrKysrKysrLQ0KIDcgZmls
ZXMgY2hhbmdlZCwgODIgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pDQoNCi0tIA0KMS45
LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
