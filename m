Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C60772946A
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 11:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9640D6E038;
	Fri, 24 May 2019 09:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe07::61a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225EB6E038
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 09:20:27 +0000 (UTC)
Received: from DB7PR08MB3530.eurprd08.prod.outlook.com (20.177.120.80) by
 DB7PR08MB3100.eurprd08.prod.outlook.com (52.134.110.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Fri, 24 May 2019 09:20:24 +0000
Received: from DB7PR08MB3530.eurprd08.prod.outlook.com
 ([fe80::e41c:9e3c:80bf:25c6]) by DB7PR08MB3530.eurprd08.prod.outlook.com
 ([fe80::e41c:9e3c:80bf:25c6%5]) with mapi id 15.20.1922.019; Fri, 24 May 2019
 09:20:24 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>
Subject: [PATCH] drm/komeda: Creates plane alpha and blend mode properties
Thread-Topic: [PATCH] drm/komeda: Creates plane alpha and blend mode properties
Thread-Index: AQHVEhHr++MhbaMzfUqcV+mgo840iw==
Date: Fri, 24 May 2019 09:20:24 +0000
Message-ID: <1558689598-2215-1-git-send-email-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0163.apcprd02.prod.outlook.com
 (2603:1096:201:1f::23) To DB7PR08MB3530.eurprd08.prod.outlook.com
 (2603:10a6:10:49::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ff16a0a-7b7c-44eb-820f-08d6e0290d4c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DB7PR08MB3100; 
x-ms-traffictypediagnostic: DB7PR08MB3100:
x-ms-exchange-purlcount: 5
nodisclaimer: True
x-microsoft-antispam-prvs: <DB7PR08MB31007D58B8DFA14D263B15CC9F020@DB7PR08MB3100.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0047BC5ADE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(39860400002)(346002)(136003)(396003)(199004)(189003)(66066001)(81166006)(6512007)(81156014)(7736002)(6116002)(8936002)(26005)(50226002)(8676002)(305945005)(2501003)(36756003)(5660300002)(66446008)(316002)(66556008)(966005)(64756008)(72206003)(66946007)(478600001)(68736007)(14454004)(66476007)(25786009)(73956011)(6436002)(6306002)(53936002)(4326008)(86362001)(6486002)(5024004)(256004)(6636002)(71190400001)(71200400001)(52116002)(2906002)(110136005)(2201001)(486006)(186003)(3846002)(54906003)(6506007)(55236004)(386003)(102836004)(476003)(99286004)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR08MB3100;
 H:DB7PR08MB3530.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kNPGmcq+2HYm28OGYT7rcKA8nTUOJdBJwjGwtIsFGJk/w6cGDz34YGvX+3DRCl2uISojvDuGnHFTCGW4Bwcjeu1eu6RWYhtvMesNog4sTgMdk2wVpc10vvCwT8JpPzHEokOyVjtNhFIIQzDKNveub27brP68zTQ1jib1Pb6ZNQW937h52O9m3xVZzQUSbzozfNqpfEEdgahV/dZzTLq+U3yDB1gdcbkl/zxKVdmigYeHsFZkstk2oP2c4uJYzvTifWNCbaA4JKrex4PVMXJtJo9ymm2lLSM45M3LFg5Tp8ZELeMI09IYK8CA7SUMbgiXSYfm1qodjr7IwjV7CD2paLvm+c4ycWT9TWMpxXP+cJKZ80PexMYG+N7U+c+G/rsGvBIpbk/OZUOnrh9B4/8Bqt2zEK0EKyQsWvbRPxq59yo=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff16a0a-7b7c-44eb-820f-08d6e0290d4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2019 09:20:24.6329 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lowry.Li@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3100
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ognNpkl807nBqsQdBLKcGDcw6EvJvcbEgoxEPGpp0E4=;
 b=Z8xkhd+1HP9xgLk8OdYewZgFw9Gg/H8eKwxcbSRjjdMqTZdzlBNLB/GDSUULflLRvUoTf+VRwoConBoMNYSDWdEXlq5xxct9uhhfhkmUcBSEoDruCzry5qrxEG88PqLNt6d2uGdZMUENlK48KrCirXD4j2uuPVP4sCZIVX3VsTg=
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
Pg0KDQpDcmVhdGVzIHBsYW5lIGFscGhhIGFuZCBibGVuZCBtb2RlIHByb3BlcnRpZXMgYXR0YWNo
ZWQgdG8gcGxhbmUuDQoNClRoaXMgcGF0Y2ggZGVwZW5kcyBvbjoNCi0gaHR0cHM6Ly9wYXRjaHdv
cmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy81OTkxNS8NCi0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJl
ZWRlc2t0b3Aub3JnL3Nlcmllcy81ODY2NS8NCi0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0
b3Aub3JnL3Nlcmllcy81OTAwMC8NCi0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3Jn
L3Nlcmllcy81OTAwMi8NCi0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmll
cy81OTQ3MS8NCg0KQ2hhbmdlcyBzaW5jZSB2MToNCi0gQWRkcyBwYXRjaCBkZW5wZW5kZW5jeSBp
biB0aGUgY29tbWVudA0KDQpDaGFuZ2VzIHNpbmNlIHYyOg0KLSBSZW1vdmUgW1JGQ10gZnJvbSB0
aGUgc3ViamVjdA0KDQpDaGFuZ2VzIHNpbmNlIHYzOg0KLSBSZWJhc2UgdGhlIGNvZGUNCg0KU2ln
bmVkLW9mZi1ieTogTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8bG93cnkubGlAYXJt
LmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3Bs
YW5lLmMgfCAxMSArKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCsp
DQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxh
bmUuYw0KaW5kZXggZTdjZDY5MC4uOWI4N2MyNSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMNCkBAIC0zMDMsNiArMzAzLDE3IEBA
IHN0YXRpYyBpbnQga29tZWRhX3BsYW5lX2FkZChzdHJ1Y3Qga29tZWRhX2ttc19kZXYgKmttcywN
CiANCiAJZHJtX3BsYW5lX2hlbHBlcl9hZGQocGxhbmUsICZrb21lZGFfcGxhbmVfaGVscGVyX2Z1
bmNzKTsNCiANCisJZXJyID0gZHJtX3BsYW5lX2NyZWF0ZV9hbHBoYV9wcm9wZXJ0eShwbGFuZSk7
DQorCWlmIChlcnIpDQorCQlnb3RvIGNsZWFudXA7DQorDQorCWVyciA9IGRybV9wbGFuZV9jcmVh
dGVfYmxlbmRfbW9kZV9wcm9wZXJ0eShwbGFuZSwNCisJCQlCSVQoRFJNX01PREVfQkxFTkRfUElY
RUxfTk9ORSkgfA0KKwkJCUJJVChEUk1fTU9ERV9CTEVORF9QUkVNVUxUSSkgICB8DQorCQkJQklU
KERSTV9NT0RFX0JMRU5EX0NPVkVSQUdFKSk7DQorCWlmIChlcnIpDQorCQlnb3RvIGNsZWFudXA7
DQorDQogCWVyciA9IGtvbWVkYV9wbGFuZV9jcmVhdGVfbGF5ZXJfcHJvcGVydGllcyhrcGxhbmUs
IGxheWVyKTsNCiAJaWYgKGVycikNCiAJCWdvdG8gY2xlYW51cDsNCi0tIA0KMS45LjENCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
