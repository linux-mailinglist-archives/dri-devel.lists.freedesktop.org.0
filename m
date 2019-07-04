Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F37B55F2E3
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 08:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9086E26D;
	Thu,  4 Jul 2019 06:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2646E26D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 06:31:27 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4799.eurprd08.prod.outlook.com (10.255.112.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Thu, 4 Jul 2019 06:31:24 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1%3]) with mapi id 15.20.2032.019; Thu, 4 Jul 2019
 06:31:24 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH 6/6] drm/komeda: Expose side_by_side by sysfs/config_id
Thread-Topic: [PATCH 6/6] drm/komeda: Expose side_by_side by sysfs/config_id
Thread-Index: AQHVMjIaGnajnYeuekiJOo4o9cpOkg==
Date: Thu, 4 Jul 2019 06:31:24 +0000
Message-ID: <20190704063011.7431-7-james.qian.wang@arm.com>
References: <20190704063011.7431-1-james.qian.wang@arm.com>
In-Reply-To: <20190704063011.7431-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0022.apcprd03.prod.outlook.com
 (2603:1096:203:2e::34) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc62f858-3051-4a93-6c41-08d700493c8e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4799; 
x-ms-traffictypediagnostic: VE1PR08MB4799:
x-microsoft-antispam-prvs: <VE1PR08MB47999218BA74FF3A59B3178CB3FA0@VE1PR08MB4799.eurprd08.prod.outlook.com>
nodisclaimer: True
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(199004)(189003)(14444005)(256004)(305945005)(8936002)(4326008)(99286004)(36756003)(110136005)(2616005)(486006)(2501003)(5660300002)(2906002)(316002)(3846002)(50226002)(1076003)(102836004)(26005)(55236004)(6116002)(66066001)(446003)(11346002)(52116002)(476003)(7736002)(66946007)(76176011)(66446008)(54906003)(66476007)(73956011)(386003)(64756008)(68736007)(66556008)(6506007)(6486002)(103116003)(186003)(53936002)(478600001)(25786009)(86362001)(6436002)(2201001)(6512007)(14454004)(81156014)(81166006)(8676002)(71200400001)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4799;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: S0DVrIP2OgRZz/J5rYtUKMKRLZQ59THAOvHNfb9rGnYTk8UGH0Sd6UMPyO1kvf5+1A9EiR1ktNCQYd06eo3UEhhFNXk6Na2xluqF5KYMvr24jlHFN7iv8a6vdtnXHW019HCP0ZqO1kGgp8WJ3Gd6DiKnula6J35jugX/kOJPVL2N8GJhQIprOp2oosHx5oDghjvx9N4Q/d/wKV7DflGhnhYk3Hu/o3uAoY+VuFWRud4vMNpTpz/l0AFQl3E76OlddSlgBqXeDtqY6zNUfyIeDmETgaPTxVpRDxT/KnpghYVN08jYFaAG46fl5yKbpyTEEAmjdvULONpl5/UyStsptgyZQQ3l3d0nrqh6NCjK6BYarv2QOsDzB+gS3QUFd01aYl+ZIlM4vmph+wrwLWyTijIDnxNVfw/k9zqZoROben8=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc62f858-3051-4a93-6c41-08d700493c8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 06:31:24.7982 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4799
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMSmMOdtH3y6BovOloPIjE3DVQTNjALu3Ub4HyRnkcc=;
 b=IZn9iDkXNIcwxSevMbNMF8fu1wBBEgQp94j1X0trf544ET5/Y79VnP3JtntgQv9GCzM15m2awpwKiLFmINaU02HJw6L2z3YFlz1A9zxi2CRlHF6wQP6Ssue0TqRrsKYk49CtsSmVgSshaN0uyhfBHh1SinPu2zyvAlpzhJjhsC8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUgYXJlIHNvbWUgcmVzdHJpY3Rpb25zIGlmIEhXIHdvcmtzIG9uIHNpZGVfYnlfc2lkZSwg
ZXhwb3NlIGl0IGJ5CmNvbmZpZ19pZCB0byB1c2VyIGZvciB0YWtpbmcgY2FyZSB0aGVtLgoKU2ln
bmVkLW9mZi1ieTogSmFtZXMgUWlhbiBXYW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVz
LnFpYW4ud2FuZ0Bhcm0uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9pbmNs
dWRlL21hbGlkcF9wcm9kdWN0LmggfCAzICsrLQogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfZGV2LmMgICAgICB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkvaW5jbHVkZS9tYWxpZHBfcHJvZHVjdC5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2luY2x1ZGUvbWFsaWRwX3Byb2R1Y3QuaAppbmRleCAxMDUzYjExMzUyZWIuLjk2ZTJl
NDAxNjI1MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2luY2x1ZGUv
bWFsaWRwX3Byb2R1Y3QuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkvaW5jbHVk
ZS9tYWxpZHBfcHJvZHVjdC5oCkBAIC0yNyw3ICsyNyw4IEBAIHVuaW9uIGtvbWVkYV9jb25maWdf
aWQgewogCQkJbl9zY2FsZXJzOjIsIC8qIG51bWJlciBvZiBzY2FsZXJzIHBlciBwaXBlbGluZSAq
LwogCQkJbl9sYXllcnM6MywgLyogbnVtYmVyIG9mIGxheWVycyBwZXIgcGlwZWxpbmUgKi8KIAkJ
CW5fcmljaHM6MywgLyogbnVtYmVyIG9mIHJpY2ggbGF5ZXJzIHBlciBwaXBlbGluZSAqLwotCQkJ
cmVzZXJ2ZWRfYml0czo2OworCQkJc2lkZV9ieV9zaWRlOjEsIC8qIGlmIEhXIHdvcmtzIG9uIHNp
ZGVfYnlfc2lkZSBtb2RlICovCisJCQlyZXNlcnZlZF9iaXRzOjU7CiAJfTsKIAlfX3UzMiB2YWx1
ZTsKIH07CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9kZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rl
di5jCmluZGV4IDJhZWU3MzVhNjgzZi4uMGZjN2I5ZjZmNjQ5IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwpAQCAtODIsNiArODIsNyBAQCBj
b25maWdfaWRfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRl
ICphdHRyLCBjaGFyICpidWYpCiAJbWVtc2V0KCZjb25maWdfaWQsIDAsIHNpemVvZihjb25maWdf
aWQpKTsKCiAJY29uZmlnX2lkLm1heF9saW5lX3N6ID0gcGlwZS0+bGF5ZXJzWzBdLT5oc2l6ZV9p
bi5lbmQ7CisJY29uZmlnX2lkLnNpZGVfYnlfc2lkZSA9IG1kZXYtPnNpZGVfYnlfc2lkZTsKIAlj
b25maWdfaWQubl9waXBlbGluZXMgPSBtZGV2LT5uX3BpcGVsaW5lczsKIAljb25maWdfaWQubl9z
Y2FsZXJzID0gcGlwZS0+bl9zY2FsZXJzOwogCWNvbmZpZ19pZC5uX2xheWVycyA9IHBpcGUtPm5f
bGF5ZXJzOwotLQoyLjIwLjEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
