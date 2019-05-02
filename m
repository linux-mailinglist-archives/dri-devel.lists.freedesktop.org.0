Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACF311FC2
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 18:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E2289700;
	Thu,  2 May 2019 16:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140084.outbound.protection.outlook.com [40.107.14.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E7889700
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 16:10:10 +0000 (UTC)
Received: from VI1PR0801MB1935.eurprd08.prod.outlook.com (10.173.73.149) by
 VI1PR0801MB2080.eurprd08.prod.outlook.com (10.173.75.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Thu, 2 May 2019 16:10:07 +0000
Received: from VI1PR0801MB1935.eurprd08.prod.outlook.com
 ([fe80::ec0c:910f:7b71:aff4]) by VI1PR0801MB1935.eurprd08.prod.outlook.com
 ([fe80::ec0c:910f:7b71:aff4%7]) with mapi id 15.20.1856.008; Thu, 2 May 2019
 16:10:07 +0000
From: Ben Davis <Ben.Davis@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 0/2] Add writeback scaling
Thread-Topic: [PATCH v4 0/2] Add writeback scaling
Thread-Index: AQHVAQGC3uJ/DsE8jUWAOzsm4a0XMQ==
Date: Thu, 2 May 2019 16:10:07 +0000
Message-ID: <1556813386-18823-1-git-send-email-ben.davis@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.53]
x-clientproxiedby: LO2P123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::30) To VI1PR0801MB1935.eurprd08.prod.outlook.com
 (2603:10a6:800:89::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f682d4c-dfd7-4ae6-1913-08d6cf18a4e6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0801MB2080; 
x-ms-traffictypediagnostic: VI1PR0801MB2080:
nodisclaimer: True
x-microsoft-antispam-prvs: <VI1PR0801MB2080BDE1C1416304BE69DD1DE5340@VI1PR0801MB2080.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0025434D2D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(39860400002)(136003)(346002)(396003)(189003)(199004)(5660300002)(14454004)(52116002)(305945005)(6512007)(54906003)(6116002)(71190400001)(6486002)(3846002)(66446008)(73956011)(66946007)(64756008)(66556008)(66476007)(53936002)(7736002)(71200400001)(2906002)(26005)(5640700003)(2351001)(6436002)(50226002)(99286004)(316002)(8936002)(386003)(81156014)(6506007)(8676002)(102836004)(14444005)(256004)(86362001)(478600001)(44832011)(2501003)(81166006)(476003)(2616005)(186003)(68736007)(486006)(36756003)(4326008)(6916009)(72206003)(66066001)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0801MB2080;
 H:VI1PR0801MB1935.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RI8M3Z/MLgdiGmviJ/qH3mtS5NTLyts3OJaLQV1hpO+k22Bz3xy3+yOHC6l2QEdzF8KyhePWP79u7H271g5LaJ1xhjfRkaie7MIKXOD+wy4RnnYtwlD6XJSsN9SjvE+bIYqNKHrDgvfCj0TYMKJOfeuKtGLcN9/FkxCHx78ulX9JwV4hDQxrneGZjZh7b9A+2J0gqGgYhYrE3enOJwWbTxuBGdiZxf4OhCCVVH24KpeouET18hffGqhm/5/KLE7brbxa1gtz30u2qsc0YWZJQl4fz2YXB57Gxljqq3coCI7nw+OpU8qwLgw456jZUnuc/AzQl6OzTiXvXniilm/qKRzuAt5F1xzcmhQmpDJixGlFaeIeTtjy6KaZ3C6gBdwiEMF1yTa308tJBSMoid9arA6B6Q5/J9Ri3OCerjP/7hM=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f682d4c-dfd7-4ae6-1913-08d6cf18a4e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2019 16:10:07.6054 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2080
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LK68xXDh+7nAsWevH05gUsgIJUTHgjdnO83SF/uud2A=;
 b=dhB2boadrhRRnlDZ4DuVzLw90Vyl9lCVAQIUfBUlywM/1AxyAJCPh91pYW3eTtaGq5mlgTFDH95cS6eHqP/jIsG1m09KqhbCxIbIlJbAPG5EUqEPg9jh22UId3YyCjHpjaVpcJKAFCnsgsyRkTyds0Gwb3qx9uqCMVIO9z6Povc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ben.Davis@arm.com; 
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, nd <nd@arm.com>,
 "sean@poorly.run" <sean@poorly.run>, Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHN1cHBvcnQgZm9yIHNjYWxpbmcgb24gd3JpdGViYWNrLiBUbyBkbyB0aGlzIGFkZA0Kd3Jp
dGViYWNrX2Rlc3RfeCx5LHcsaCB3cml0ZWJhY2sgY29ubmVjdG9yIHByb3BlcnRpZXMgdG8gc3Bl
Y2lmeSB0aGUNCmRlc2lyZWQgb3V0cHV0IGRpbWVuc2lvbnMuDQpUaGVuIGltcGxlbWVudCBkb3du
c2NhbGluZyBvbiB3cml0ZWJhY2sgZm9yIE1hbGlkcC01NTAgYW5kIE1hbGlkcC02NTANCih1cHNj
YWxpbmcgb24gd3JpdGViYWNrIGlzIG5vdCBzdXBwb3J0ZWQgb24gdGhlc2UgZGV2aWNlcykuDQoN
CnYyOiBVc2UgMCBhcyBkZWZhdWx0IGZvciB3cml0ZWJhY2tfdyxoIGFuZCBzbyB1cGRhdGUgcmFu
Z2UgdG8gdXNlIDEgYXMNCiAgICBtaW5pbXVtLg0KDQp2MzogUmVuYW1lIHByb3BlcnRpZXMgdG8g
c3BlY2lmeSB0aGV5IGFyZSBkZXN0aW5hdGlvbiB3aWR0aC9oZWlnaHQuDQogICAgTWFrZSBzdXJl
IHRoZSB2YWx1ZXMgZnJvbSB0aGUgcHJvcGVydGllcyBhcmUgcGFzc2VkIHRvDQogICAgZW5hYmxl
X21lbXdyaXRlIHJhdGhlciB0aGFuIHRoZSBmcmFtZWJ1ZmZlciBkaW1lbnNpb25zLg0KDQp2NDog
QWRkIHdyaXRlYmFja19kZXN0X3gseSBwcm9wZXJ0aWVzIGFzIHdlbGwgZm9yIGNvbnNpc3RlbmN5
IHdpdGgNCiAgICBwbGFuZSBwcm9wZXJ0aWVzLg0KICAgIFdyaXRpbmcgdG8gYXJiaXRyYXJ5IHgs
eSBvbiB3cml0ZWJhY2sgaXMgbm90IHN1cHBvcnRlZCBvbiB0aGUNCiAgICBoYXJkd2FyZSBzbyB3
ZSBzaW11bGF0ZSB0aGlzIGluIHRoZSBkcml2ZXIuDQogICAgQ2xlYXIgdGhlIHByb3BlcnRpZXMg
b24gZHVwbGljYXRlIHN0YXRlIGZvciByb2J1c3RuZXNzLg0KICAgIFVzZSAwIGFzIG1pbmltdW0g
Zm9yIGFsbCBhZGRlZCBwcm9wZXJ0aWVzLg0KICAgIEFsc28gYWN0dWFsbHkgbWFrZSBzdXJlIHRo
ZSB2YWx1ZXMgZnJvbSB0aGUgcHJvcGVydGllcyBhcmUgcGFzc2VkDQogICAgdG8gZW5hYmxlX21l
bXdyaXRlIGFzIGludGVuZGVkIGluIHYzIGFuZCBzb21lIG90aGVyIGNsZWFuIHVwLg0KDQpCZW4g
RGF2aXMgKDIpOg0KICBkcm06IEFkZCB3cml0ZWJhY2tfZGVzdF94LHksdyxoIHByb3BlcnRpZXMN
CiAgZHJtL21hbGlkcDogRW5hYmxlIHdyaXRlYmFjayBzY2FsaW5nDQoNCiBkcml2ZXJzL2dwdS9k
cm0vYXJtL21hbGlkcF9jcnRjLmMgICAgICAgICB8ICA0NyArKysrKystLS0tLS0NCiBkcml2ZXJz
L2dwdS9kcm0vYXJtL21hbGlkcF9kcnYuYyAgICAgICAgICB8ICAxMCArKy0NCiBkcml2ZXJzL2dw
dS9kcm0vYXJtL21hbGlkcF9kcnYuaCAgICAgICAgICB8ICAgMiArDQogZHJpdmVycy9ncHUvZHJt
L2FybS9tYWxpZHBfaHcuYyAgICAgICAgICAgfCAgNDUgKysrKysrKystLS0tDQogZHJpdmVycy9n
cHUvZHJtL2FybS9tYWxpZHBfaHcuaCAgICAgICAgICAgfCAgMTkgKysrKy0NCiBkcml2ZXJzL2dw
dS9kcm0vYXJtL21hbGlkcF9tdy5jICAgICAgICAgICB8IDExNyArKysrKysrKysrKysrKysrKysr
KysrKystLS0tLS0NCiBkcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9yZWdzLmggICAgICAgICB8
ICAgMSArDQogZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVyLmMgfCAgIDYg
KysNCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMgICAgICAgICB8ICAxNyArKysr
Kw0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMgICAgICAgICAgIHwgIDY2ICsrKysr
KysrKysrKysrKysrDQogaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oICAgICAgICAgICAgICAg
fCAgMjMgKysrKysrDQogaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmggICAgICAgICAgICAg
fCAgMjAgKysrKysNCiAxMiBmaWxlcyBjaGFuZ2VkLCAzMDggaW5zZXJ0aW9ucygrKSwgNjUgZGVs
ZXRpb25zKC0pDQoNCi0tIA0KMi43LjQNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
