Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BAB5F2B4
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 08:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518936E263;
	Thu,  4 Jul 2019 06:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::618])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E290B6E263
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 06:18:58 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4637.eurprd08.prod.outlook.com (10.255.27.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Thu, 4 Jul 2019 06:18:56 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1%3]) with mapi id 15.20.2032.019; Thu, 4 Jul 2019
 06:18:56 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH 6/6] drm/komeda: Expose side_by_side by sysfs/config_id
Thread-Topic: [PATCH 6/6] drm/komeda: Expose side_by_side by sysfs/config_id
Thread-Index: AQHVMjBc6ENIwv9q1EWZDI2YhrNJoA==
Date: Thu, 4 Jul 2019 06:18:56 +0000
Message-ID: <20190704061717.6854-7-james.qian.wang@arm.com>
References: <20190704061717.6854-1-james.qian.wang@arm.com>
In-Reply-To: <20190704061717.6854-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0070.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::34) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f96b871c-6a22-453b-4a7f-08d700477e83
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4637; 
x-ms-traffictypediagnostic: VE1PR08MB4637:
x-microsoft-antispam-prvs: <VE1PR08MB463712610ED53E45E0BFD0A6B3FA0@VE1PR08MB4637.eurprd08.prod.outlook.com>
nodisclaimer: True
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(396003)(136003)(39860400002)(346002)(199004)(189003)(99286004)(110136005)(14444005)(36756003)(68736007)(256004)(52116002)(102836004)(26005)(386003)(55236004)(3846002)(6116002)(6506007)(8676002)(5660300002)(103116003)(486006)(2906002)(54906003)(76176011)(2501003)(186003)(6436002)(81156014)(81166006)(2201001)(476003)(71200400001)(86362001)(305945005)(446003)(7736002)(11346002)(8936002)(478600001)(2616005)(6486002)(66476007)(64756008)(66066001)(66946007)(4326008)(53936002)(50226002)(66446008)(14454004)(316002)(73956011)(66556008)(71190400001)(6512007)(1076003)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4637;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jIX8ZIKNtu87K4PrvPEL/fsdEWeQUU1UEudBhvi71+CxrrmLtxBi3JhcnUsqVosUiJwilj4/wPT5bbWW69Dnloh6rxizkhiRRMClix4ktcZ9rVlW5/fRu6wx0KfPd5vKNOvufSqhk7Ig2iMegB/drZR0/5td3kjlAuALNzGb7J9oBilNK30Ct9CHPpP6DBSAEXgm/q0WJjx1Jj08TBles9DacQfKQgmg+n4Yu71WYUMZEAMAsFhNdy5U/9VHhZCnvAvassybLkr30I99Oz8nxqdl5mA5SaAcNZFwqKoOzdT/zf5JIOe4v7m/lkdRfB/2d5Gcu2JCibB1LcA874vvlXxTAHHO43FEjnG4EI14RMtWy1d/ELXzH27WzGLvFJnmOJh10XR/Uq8HlPtdho5KsdkuqkH5EyYKYXeLOVhJ3BI=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f96b871c-6a22-453b-4a7f-08d700477e83
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 06:18:56.4714 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4637
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMSmMOdtH3y6BovOloPIjE3DVQTNjALu3Ub4HyRnkcc=;
 b=NZvnV8sz4D/vQ+Mqunb900orfOsmCmpcXuQUPhCEmWSAE3D2Ch1Ag/fT9B5Rj96Ejg7vAmK9ZfpLF3QWuUo+YBfMOSB9p10X2w+fCxaBSJQ62dbhJ7noO3ftio0C9WGc094qRVzzMnIH6vkSceKnB7ckfgSGKw9GaAqpUX5nhG8=
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
