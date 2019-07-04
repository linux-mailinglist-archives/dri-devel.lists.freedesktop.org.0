Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EE45F2D9
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 08:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6381C6E262;
	Thu,  4 Jul 2019 06:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BCC06E262
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 06:30:55 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5229.eurprd08.prod.outlook.com (10.255.27.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Thu, 4 Jul 2019 06:30:53 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1%3]) with mapi id 15.20.2032.019; Thu, 4 Jul 2019
 06:30:53 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH 1/6] drm/komeda: Add side by side assembling
Thread-Topic: [PATCH 1/6] drm/komeda: Add side by side assembling
Thread-Index: AQHVMjIHiQqcXatIJ0mfrkxe1DUmhw==
Date: Thu, 4 Jul 2019 06:30:53 +0000
Message-ID: <20190704063011.7431-2-james.qian.wang@arm.com>
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
x-ms-office365-filtering-correlation-id: 2440661c-7c6d-429f-4dd5-08d700492948
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB5229; 
x-ms-traffictypediagnostic: VE1PR08MB5229:
x-microsoft-antispam-prvs: <VE1PR08MB52292EC696EF175B26FCABA7B3FA0@VE1PR08MB5229.eurprd08.prod.outlook.com>
nodisclaimer: True
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(189003)(199004)(76176011)(6506007)(66066001)(110136005)(386003)(54906003)(103116003)(2906002)(316002)(186003)(86362001)(2201001)(52116002)(55236004)(99286004)(26005)(102836004)(6486002)(50226002)(25786009)(478600001)(71200400001)(71190400001)(6512007)(6436002)(4326008)(68736007)(53936002)(14454004)(2616005)(476003)(486006)(36756003)(446003)(11346002)(81166006)(8676002)(256004)(14444005)(81156014)(8936002)(305945005)(7736002)(66946007)(6116002)(73956011)(66476007)(66556008)(64756008)(66446008)(3846002)(2501003)(5660300002)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5229;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wC+GUNGESRI6YiBgBAXmSk9kpAUNaaxFY6ZvlKqY7K2ESj79WnRrZWPhPWUs46KhXzblOdeuZOiFcWN8p8uSmtRCXsvYIJMVWcK2GS1MWofLerrm73uMvO79NgUWtPKsng6tD03cq2OAepUZBtduVnp7zUzPlLqWtm4Cp5031X8MNPk0qqeMzp0UmZmBpSODiR7BSVpQdfP9wnj+Nq4ZfKrelTTYQT4ggAXaChPGc290GPTVgS8OSzHrLXWj5neNyYd3l2qSFDjQOeWClNRSA3PcqtyHNLXTuCkyDPhNXzrD/d+igbo1dLRWbVNKZLH8edBBkPFKkXprWlkNQNg8/uuJElUi1mDMej9PRBMGH1vnJGkjqQenSPWhuf8cOtwqGuQvFDbfB2LsdQ+Pc+GJ0EqoI0SZw1lYtxwQ2q7S9+c=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2440661c-7c6d-429f-4dd5-08d700492948
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 06:30:53.2065 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5229
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVyNLvfisJfPXATCCp6wvOxKpnqE6PgX1ACMpSaAYxY=;
 b=PSFRAPWpdvimdQGKr2Ulw0DXH+I+E5StfeF1qUevSZYPNeEbCf0Jq95MJVw5QBGr9vWb89G4BsPTudsEKj8J+04rpk2IFPI7ASwN7hvs81YPzJ9DH9tVNg51sIHgaOaF7LHV9Jfjz3z74Lz/OAhYuQLBREc7yAwxXry1t3rLN5o=
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

S29tZWRhIEhXIGNhbiBzdXBwb3J0IHNpZGUgYnkgc2lkZSwgd2hpY2ggc3BsaXRzIHRoZSBpbnRl
cm5hbCBkaXNwbGF5CnByb2Nlc3NpbmcgdG8gdHdvIHNpbmdsZSBoYWx2ZXMgKExFRlQvUklHSFQp
IGFuZCBoYW5kbGUgdGhlbSBieSB0d28KcGlwZWxpbmVzIHNlcGFyYXRlbHkuCmtvbWVkYSAic2lk
ZSBieSBzaWRlIiBpcyBlbmFibGVkIGJ5IERUIHByb3BlcnR5OiAic2lkZV9ieV9zaWRlX21hc3Rl
ciIsCm9uY2UgRFQgY29uZmlndXJlZCBzaWRlIGJ5IHNpZGUsIGtvbWVkYSBuZWVkIHRvIHZlcmlm
eSBpdCB3aXRoIEhXJ3MKY29uZmlndXJhdGlvbiwgYW5kIGFzc2VtYmxlIGl0IGZvciB0aGUgZnVy
dGhlciB1c2FnZS4KClNpZ25lZC1vZmYtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xv
Z3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYyAgfCAgOSArKystCiAuLi4vZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jICAgfCAgMyArKwogLi4uL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaCAgIHwgIDkgKysrKwogLi4uL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaCAgIHwgIDMgKysKIC4uLi9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9waXBlbGluZS5jICB8IDUwICsrKysrKysrKysrKysrKysrLS0KIC4uLi9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oICB8ICAxICsKIDYgZmlsZXMg
Y2hhbmdlZCwgNjkgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMKaW5kZXggMzc0NGU2ZDFi
YTk2Li5jM2JiMTExYzQ1NGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2NydGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9jcnRjLmMKQEAgLTU5MSwxNiArNTkxLDIxIEBAIGludCBrb21lZGFfa21z
X3NldHVwX2NydGNzKHN0cnVjdCBrb21lZGFfa21zX2RldiAqa21zLAoKIAkJY3J0Yy0+bWFzdGVy
ID0gbWFzdGVyOwogCQljcnRjLT5zbGF2ZSAgPSBrb21lZGFfcGlwZWxpbmVfZ2V0X3NsYXZlKG1h
c3Rlcik7CisJCWNydGMtPnNpZGVfYnlfc2lkZSA9IG1kZXYtPnNpZGVfYnlfc2lkZTsKCiAJCWlm
IChjcnRjLT5zbGF2ZSkKIAkJCXNwcmludGYoc3RyLCAicGlwZS0lZCIsIGNydGMtPnNsYXZlLT5p
ZCk7CiAJCWVsc2UKIAkJCXNwcmludGYoc3RyLCAiTm9uZSIpOwoKLQkJRFJNX0lORk8oIkNSVEMt
JWQ6IG1hc3RlcihwaXBlLSVkKSBzbGF2ZSglcykuXG4iLAotCQkJIGttcy0+bl9jcnRjcywgbWFz
dGVyLT5pZCwgc3RyKTsKKwkJRFJNX0lORk8oIkNSVEMtJWQ6IG1hc3RlcihwaXBlLSVkKSBzbGF2
ZSglcykgc2JzKCVzKS5cbiIsCisJCQkga21zLT5uX2NydGNzLCBtYXN0ZXItPmlkLCBzdHIsCisJ
CQkgY3J0Yy0+c2lkZV9ieV9zaWRlID8gIk9uIiA6ICJPZmYiKTsKCiAJCWttcy0+bl9jcnRjcysr
OworCisJCWlmIChtZGV2LT5zaWRlX2J5X3NpZGUpCisJCQlicmVhazsKIAl9CgogCXJldHVybiAw
OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
ZGV2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwpp
bmRleCBiYjcyNjQyY2ZkNjcuLjJhZWU3MzVhNjgzZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMKQEAgLTE5MSw2ICsxOTEsOSBAQCBzdGF0
aWMgaW50IGtvbWVkYV9wYXJzZV9kdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBrb21lZGFf
ZGV2ICptZGV2KQogCQl9CiAJfQoKKwltZGV2LT5zaWRlX2J5X3NpZGUgPSAhb2ZfcHJvcGVydHlf
cmVhZF91MzIobnAsICJzaWRlX2J5X3NpZGVfbWFzdGVyIiwKKwkJCQkJJm1kZXYtPnNpZGVfYnlf
c2lkZV9tYXN0ZXIpOworCiAJcmV0dXJuIHJldDsKIH0KCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaCBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oCmluZGV4IGU4NjNlYzMyNzc5MC4uYzcwY2My
NWQyNDZmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9kZXYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9kZXYuaApAQCAtMTc2LDYgKzE3NiwxNSBAQCBzdHJ1Y3Qga29tZWRhX2RldiB7CgogCS8qKiBA
aXJxOiBpcnEgbnVtYmVyICovCiAJaW50IGlycTsKKwkvKioKKwkgKiBAc2lkZV9ieV9zaWRlOgor
CSAqCisJICogb24gc2JzIHRoZSB3aG9sZSBkaXNwbGF5IGZyYW1lIHdpbGwgYmUgc3BsaXQgdG8g
dHdvIGhhbHZlcyAoMToyKSwKKwkgKiBtYXN0ZXIgcGlwZWxpbmUgaGFuZGxlcyB0aGUgbGVmdCBw
YXJ0LCBzbGF2ZSBmb3IgdGhlIHJpZ2h0IHBhcnQKKwkgKi8KKwlib29sIHNpZGVfYnlfc2lkZTsK
KwkvKiogQHNpZGVfYnlfc2lkZV9tYXN0ZXI6IG1hc3RlciBwaXBlIGlkIGZvciBzaWRlIGJ5IHNp
ZGUgKi8KKwlpbnQgc2lkZV9ieV9zaWRlX21hc3RlcjsKCiAJLyoqIEBsb2NrOiB1c2VkIHRvIHBy
b3RlY3QgZHBtb2RlICovCiAJc3RydWN0IG11dGV4IGxvY2s7CmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5oCmluZGV4IGQwY2Y4MzgxZDJhYi4uMGRi
ZmQ3YWQ3ODA1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9rbXMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9rbXMuaApAQCAtODQsNiArODQsOSBAQCBzdHJ1Y3Qga29tZWRhX2NydGMgewogCSAqLwog
CXN0cnVjdCBrb21lZGFfcGlwZWxpbmUgKnNsYXZlOwoKKwkvKiogQHNpZGVfYnlfc2lkZTogaWYg
dGhlIG1hc3RlciBhbmQgc2xhdmUgd29ya3Mgb24gc2lkZSBieSBzaWRlIG1vZGUgKi8KKwlib29s
IHNpZGVfYnlfc2lkZTsKKwogCS8qKiBAc2xhdmVfcGxhbmVzOiBrb21lZGEgc2xhdmUgcGxhbmVz
IG1hc2sgKi8KIAl1MzIgc2xhdmVfcGxhbmVzOwoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5jCmluZGV4IDQ1MmU1MDVhMWZkMy4u
MTA0ZTI3Y2MxZGMzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9waXBlbGluZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX3BpcGVsaW5lLmMKQEAgLTMyNiwxNCArMzI2LDU2IEBAIHN0YXRpYyB2b2lk
IGtvbWVkYV9waXBlbGluZV9hc3NlbWJsZShzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICpwaXBlKQog
c3RydWN0IGtvbWVkYV9waXBlbGluZSAqCiBrb21lZGFfcGlwZWxpbmVfZ2V0X3NsYXZlKHN0cnVj
dCBrb21lZGFfcGlwZWxpbmUgKm1hc3RlcikKIHsKLQlzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAq
c2xhdmU7CisJc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYgPSBtYXN0ZXItPm1kZXY7CisJc3RydWN0
IGtvbWVkYV9jb21wb25lbnQgKmNvbXAsICpzbGF2ZTsKKwl1MzIgYXZhaWxfaW5wdXRzOworCisJ
Lyogb24gU0JTLCBzbGF2ZSBwaXBlbGluZSBtZXJnZSB0byBtYXN0ZXIgdmlhIGltYWdlIHByb2Nl
c3NvciAqLworCWlmIChtZGV2LT5zaWRlX2J5X3NpZGUpIHsKKwkJY29tcCA9ICZtYXN0ZXItPmlt
cHJvYy0+YmFzZTsKKwkJYXZhaWxfaW5wdXRzID0gS09NRURBX1BJUEVMSU5FX0lNUFJPQ1M7CisJ
fSBlbHNlIHsKKwkJY29tcCA9ICZtYXN0ZXItPmNvbXBpei0+YmFzZTsKKwkJYXZhaWxfaW5wdXRz
ID0gS09NRURBX1BJUEVMSU5FX0NPTVBJWlM7CisJfQoKLQlzbGF2ZSA9IGtvbWVkYV9jb21wb25l
bnRfcGlja3VwX2lucHV0KCZtYXN0ZXItPmNvbXBpei0+YmFzZSwKLQkJCQkJICAgICAgS09NRURB
X1BJUEVMSU5FX0NPTVBJWlMpOworCXNsYXZlID0ga29tZWRhX2NvbXBvbmVudF9waWNrdXBfaW5w
dXQoY29tcCwgYXZhaWxfaW5wdXRzKTsKCiAJcmV0dXJuIHNsYXZlID8gc2xhdmUtPnBpcGVsaW5l
IDogTlVMTDsKIH0KCitzdGF0aWMgaW50IGtvbWVkYV9hc3NlbWJsZV9zaWRlX2J5X3NpZGUoc3Ry
dWN0IGtvbWVkYV9kZXYgKm1kZXYpCit7CisJc3RydWN0IGtvbWVkYV9waXBlbGluZSAqbWFzdGVy
LCAqc2xhdmU7CisJaW50IGk7CisKKwlpZiAoIW1kZXYtPnNpZGVfYnlfc2lkZSkKKwkJcmV0dXJu
IDA7CisKKwlpZiAobWRldi0+c2lkZV9ieV9zaWRlX21hc3RlciA+PSBtZGV2LT5uX3BpcGVsaW5l
cykgeworCQlEUk1fRVJST1IoIkRUIGNvbmZpZ3VyZWQgc2lkZSBieSBzaWRlIG1hc3Rlci0lZCBp
cyBpbnZhbGlkLlxuIiwKKwkJCSAgbWRldi0+c2lkZV9ieV9zaWRlX21hc3Rlcik7CisJCXJldHVy
biAtRUlOVkFMOworCX0KKworCW1hc3RlciA9IG1kZXYtPnBpcGVsaW5lc1ttZGV2LT5zaWRlX2J5
X3NpZGVfbWFzdGVyXTsKKwlzbGF2ZSA9IGtvbWVkYV9waXBlbGluZV9nZXRfc2xhdmUobWFzdGVy
KTsKKwlpZiAoIXNsYXZlIHx8IHNsYXZlLT5uX2xheWVycyAhPSBtYXN0ZXItPm5fbGF5ZXJzKSB7
CisJCURSTV9FUlJPUigiQ3VycmVudCBIVyBkb2Vzbid0IHN1cHBvcnQgc2lkZSBieSBzaWRlLlxu
Iik7CisJCXJldHVybiAtRUlOVkFMOworCX0KKworCWlmICghbWFzdGVyLT5kdWFsX2xpbmspIHsK
KwkJRFJNX0RFQlVHX0FUT01JQygiU0JTIGNhbiBub3Qgd29yayB3aXRob3V0IGR1YWwgbGluay5c
biIpOworCQlyZXR1cm4gLUVJTlZBTDsKKwl9CisKKwlmb3IgKGkgPSAwOyBpIDwgbWFzdGVyLT5u
X2xheWVyczsgaSsrKQorCQltYXN0ZXItPmxheWVyc1tpXS0+c2JzX3NsYXZlID0gc2xhdmUtPmxh
eWVyc1tpXTsKKworCXJldHVybiAwOworfQorCiBpbnQga29tZWRhX2Fzc2VtYmxlX3BpcGVsaW5l
cyhzdHJ1Y3Qga29tZWRhX2RldiAqbWRldikKIHsKIAlzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICpw
aXBlOwpAQCAtMzQ2LDcgKzM4OCw3IEBAIGludCBrb21lZGFfYXNzZW1ibGVfcGlwZWxpbmVzKHN0
cnVjdCBrb21lZGFfZGV2ICptZGV2KQogCQlrb21lZGFfcGlwZWxpbmVfZHVtcChwaXBlKTsKIAl9
CgotCXJldHVybiAwOworCXJldHVybiBrb21lZGFfYXNzZW1ibGVfc2lkZV9ieV9zaWRlKG1kZXYp
OwogfQoKIHZvaWQga29tZWRhX3BpcGVsaW5lX2R1bXBfcmVnaXN0ZXIoc3RydWN0IGtvbWVkYV9w
aXBlbGluZSAqcGlwZSwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX3BpcGVsaW5lLmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9waXBlbGluZS5oCmluZGV4IDY2ZDc2NjQyYmM1Yi4uNmQzNzQ1YmI4YzFkIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBl
bGluZS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3Bp
cGVsaW5lLmgKQEAgLTIzNiw2ICsyMzYsNyBAQCBzdHJ1Y3Qga29tZWRhX2xheWVyIHsKIAkgKiBu
b3QgdGhlIHNvdXJjZSBidWZmZXIuCiAJICovCiAJc3RydWN0IGtvbWVkYV9sYXllciAqcmlnaHQ7
CisJc3RydWN0IGtvbWVkYV9sYXllciAqc2JzX3NsYXZlOwogfTsKCiBzdHJ1Y3Qga29tZWRhX2xh
eWVyX3N0YXRlIHsKLS0KMi4yMC4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
