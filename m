Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1495C3C9CA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 13:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7C689182;
	Tue, 11 Jun 2019 11:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80053.outbound.protection.outlook.com [40.107.8.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD188918A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 11:13:48 +0000 (UTC)
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3550.eurprd08.prod.outlook.com (20.177.61.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.15; Tue, 11 Jun 2019 11:13:46 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e9f4:59c8:9be1:910b]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e9f4:59c8:9be1:910b%4]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 11:13:46 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>
Subject: [PATCH v2 2/2] drm/komeda: Adds komeda_kms_drop_master
Thread-Topic: [PATCH v2 2/2] drm/komeda: Adds komeda_kms_drop_master
Thread-Index: AQHVIEa84bzVRtMQMUOKgXDAOpomxQ==
Date: Tue, 11 Jun 2019 11:13:45 +0000
Message-ID: <1560251589-31827-3-git-send-email-lowry.li@arm.com>
References: <1560251589-31827-1-git-send-email-lowry.li@arm.com>
In-Reply-To: <1560251589-31827-1-git-send-email-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: SL2PR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:100:2d::17) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39252528-cb13-4c0b-f767-08d6ee5dde7a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3550; 
x-ms-traffictypediagnostic: VI1PR08MB3550:
nodisclaimer: True
x-microsoft-antispam-prvs: <VI1PR08MB3550F62C33B5EE89162DA5E39FED0@VI1PR08MB3550.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:67;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39850400004)(396003)(366004)(346002)(136003)(189003)(199004)(14444005)(305945005)(256004)(11346002)(72206003)(6512007)(476003)(14454004)(99286004)(2616005)(478600001)(52116002)(486006)(6636002)(7736002)(6506007)(26005)(68736007)(66066001)(76176011)(186003)(446003)(2501003)(386003)(36756003)(25786009)(66446008)(3846002)(81156014)(8676002)(316002)(6116002)(66946007)(66556008)(64756008)(66476007)(73956011)(50226002)(8936002)(6486002)(6436002)(71190400001)(86362001)(2906002)(55236004)(110136005)(54906003)(53936002)(71200400001)(4326008)(81166006)(5660300002)(2201001)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3550;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0FiyPYnl8xdfGX5kQMagvLlN8rkZbdkDj4z2QmiXiDz6cNSOtEfSZXyOWn8Myxe8H7CfOACfNn83NHWFhMuebBppr6FlB0ON0/Z2sgY+fkzHXrPnG68KMelLofReJmPlI51eVLZu2GeR2gl+z0wHS1v7H/Mk3h3rVNL1CLeCI/cwwY7G5qeQNMu6hpKWUhLrqA7y8QsrYFSOj+FQQBfG+jN3ObBoCB9M2Qnr6lv1YZoURyNTvmrVBIJ9dHAtPlHtuSoFguZLo145xBx+ETmCtXRNfbAamY8PHFRwoP3jTDcCrL+dTvtlvBh/oYxW0+tAWlxrk97Js1d4jjjdPLhuB5dacb4VyeWQw7e7NEr7rc7FjHx/7oCXQuTnTlQgGNQz1W9gpPaCvmna7kCrNuhpGmN0CAgsfzReI+3qohNcGek=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39252528-cb13-4c0b-f767-08d6ee5dde7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 11:13:45.8919 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lowry.Li@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3550
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Px4O123upaDORe6ZR2GFQwG9BHMNWPHitSyXgYmuohA=;
 b=UhGRnnPAXFqyNb/HOAk2dX04sH/Zpu5PrfrZOW/rLbMSRL8nWJMOMy3pcA40pMtOwnSYWsH/MHInMTT4HJbDq5bG6LLa2WsVMmWQ7WgvuQGnlNbR/mLkOLU5lyRqd0liXZKBvsKwAoUq/FtLN4wRryEhlTV9sn3G5rowlTraBls=
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
Pg0KDQpUaGUga29tZWRhIGludGVybmFsIHJlc291cmNlcyAocGlwZWxpbmVzKSBhcmUgc2hhcmVk
IGJldHdlZW4gY3J0Y3MsDQphbmQgcmVzb3VyY2VzIHJlbGVhc2UgYnkgZGlzYWJsZV9jcnRjLiBU
aGlzIGNvbW1pdCBpcyB3b3JraW5nIGZvciBvbmNlDQp1c2VyIGZvcmdvdCBkaXNhYmxpbmcgY3J0
YyBsaWtlIGFwcCBxdWl0IGFibm9tYWxseSwgYW5kIHRoZW4gdGhlDQpyZXNvdXJjZXMgY2FuIG5v
dCBiZSB1c2VkIGJ5IGFub3RoZXIgY3J0Yy4gQWRkcyBkcm9wX21hc3RlciB0bw0Kc2h1dGRvd24g
dGhlIGRldmljZSBhbmQgbWFrZSBzdXJlIGFsbCB0aGUga29tZWRhIHJlc291cmNlcyBoYXZlIGJl
ZW4NCnJlbGVhc2VkIGFuZCBjYW4gYmUgdXNlZCBmb3IgdGhlIG5leHQgdXNhZ2UuDQoNClNpZ25l
ZC1vZmYtYnk6IExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGxvd3J5LmxpQGFybS5j
b20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMu
YyB8IDEzICsrKysrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQ0K
DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
a21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYw0K
aW5kZXggODU0Mzg2MC4uNjQ3YmNlNSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYw0KQEAgLTU0LDExICs1NCwyNCBAQCBzdGF0aWMgaXJx
cmV0dXJuX3Qga29tZWRhX2ttc19pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkYXRhKQ0KIAly
ZXR1cm4gc3RhdHVzOw0KIH0NCiANCisvKiBLb21lZGEgaW50ZXJuYWwgcmVzb3VyY2VzIChwaXBl
bGluZXMpIGFyZSBzaGFyZWQgYmV0d2VlbiBjcnRjcywgYW5kIHJlc291cmNlcw0KKyAqIGFyZSBy
ZWxlYXNlZCBieSBkaXNhYmxlX2NydGMuIEJ1dCBpZiB1c2VyIGZvcmdldCBkaXNhYmxpbmcgY3J0
YyBsaWtlIGFwcCBxdWl0DQorICogYWJub3JtYWxseSwgdGhlIHJlc291cmNlcyBjYW4gbm90IGJl
IHVzZWQgYnkgYW5vdGhlciBjcnRjLg0KKyAqIFVzZSBkcm9wX21hc3RlciB0byBzaHV0ZG93biB0
aGUgZGV2aWNlIGFuZCBtYWtlIHN1cmUgYWxsIHRoZSBrb21lZGEgcmVzb3VyY2VzDQorICogaGF2
ZSBiZWVuIHJlbGVhc2VkLCBhbmQgY2FuIGJlIHVzZWQgZm9yIHRoZSBuZXh0IHVzYWdlLg0KKyAq
Lw0KK3N0YXRpYyB2b2lkIGtvbWVkYV9rbXNfZHJvcF9tYXN0ZXIoc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwNCisJCQkJICAgc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYpDQorew0KKwlkcm1fYXRv
bWljX2hlbHBlcl9zaHV0ZG93bihkZXYpOw0KK30NCisNCiBzdGF0aWMgc3RydWN0IGRybV9kcml2
ZXIga29tZWRhX2ttc19kcml2ZXIgPSB7DQogCS5kcml2ZXJfZmVhdHVyZXMgPSBEUklWRVJfR0VN
IHwgRFJJVkVSX01PREVTRVQgfCBEUklWRVJfQVRPTUlDIHwNCiAJCQkgICBEUklWRVJfUFJJTUUg
fCBEUklWRVJfSEFWRV9JUlEsDQogCS5sYXN0Y2xvc2UJCQk9IGRybV9mYl9oZWxwZXJfbGFzdGNs
b3NlLA0KIAkuaXJxX2hhbmRsZXIJCQk9IGtvbWVkYV9rbXNfaXJxX2hhbmRsZXIsDQorCS5tYXN0
ZXJfZHJvcAkJCT0ga29tZWRhX2ttc19kcm9wX21hc3RlciwNCiAJLmdlbV9mcmVlX29iamVjdF91
bmxvY2tlZAk9IGRybV9nZW1fY21hX2ZyZWVfb2JqZWN0LA0KIAkuZ2VtX3ZtX29wcwkJCT0gJmRy
bV9nZW1fY21hX3ZtX29wcywNCiAJLmR1bWJfY3JlYXRlCQkJPSBrb21lZGFfZ2VtX2NtYV9kdW1i
X2NyZWF0ZSwNCi0tIA0KMS45LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
