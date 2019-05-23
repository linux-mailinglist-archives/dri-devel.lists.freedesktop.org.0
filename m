Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0488927B63
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 13:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825EA89DB0;
	Thu, 23 May 2019 11:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::602])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B9389DB0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 11:09:55 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5166.eurprd08.prod.outlook.com (20.179.30.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Thu, 23 May 2019 11:09:52 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1922.017; Thu, 23 May 2019
 11:09:51 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH v2 0/6] Added scaler support for komeda
Thread-Topic: [PATCH v2 0/6] Added scaler support for komeda
Thread-Index: AQHVEVgLjNNoCzSXLUGXHJyPRjpv/w==
Date: Thu, 23 May 2019 11:09:51 +0000
Message-ID: <20190523110933.10742-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0191.apcprd02.prod.outlook.com
 (2603:1096:201:21::27) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26e03f22-4d41-411e-884c-08d6df6f2d4a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB5166; 
x-ms-traffictypediagnostic: VE1PR08MB5166:
x-ms-exchange-purlcount: 2
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB516621B72E11631E64995BC8B3010@VE1PR08MB5166.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(376002)(346002)(136003)(39860400002)(199004)(189003)(6512007)(6306002)(25786009)(50226002)(53936002)(476003)(256004)(5024004)(6436002)(103116003)(2616005)(99286004)(486006)(4326008)(6486002)(81156014)(26005)(81166006)(36756003)(66066001)(54906003)(110136005)(8676002)(2906002)(316002)(8936002)(73956011)(66946007)(2501003)(305945005)(68736007)(7736002)(64756008)(186003)(66556008)(1076003)(966005)(55236004)(66446008)(66476007)(86362001)(6506007)(386003)(71200400001)(71190400001)(478600001)(3846002)(52116002)(6116002)(2201001)(102836004)(14454004)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5166;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: S2nj+l6mDJJY1t41ncDM6zEsb1hwwzVEIbc9ZsENEdNFG3z9yVKBapgQbbK/guJ4cu6BB45hnaGu6ZX6cwxbD5c4VHGAsnVXNpeExL6nE/+KOh0B6MfAtmNLQlPXr/P7IoUezPS5iBy8a8wSDgMikShyyqF2IR5TXwJlK05qszhAp/kIQY+jpxzII//mcIh1nbbJ7RkvTsXkEZY0HOyO/S7HOXFrySiAuKIfpu9UNUxcvpTV/BRbw7yzRaKkhmCjMT6giKU4BiEcFTn6VZWa2+ynn/ZcnWptG/X6BYXmSkEEpQHij/FaD2ZALF6FOZX+F7NkZmEC6MNKABtqROhjQ0Ulxly+0syC2jcDXqClbxA8Sz3o98gL8JxHeVH515/JTpLnKjgAzy2Z2EzFbhm8BUEwEkUy7RLPRTJam6C84/g=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e03f22-4d41-411e-884c-08d6df6f2d4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 11:09:51.7914 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5166
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TakayzVlH1CABK0tK2HkB1gAteDPbjWdRbIYs7prXJQ=;
 b=6FXpWcCewh9BGQD+eTmTz3dItdzQ9uAywuXq946UrUPucfD1zAm79zmpY7fyxSpJlDLaEtCLMf400zJWHtsMsqZF4Kjd2WF+VjSBtOMYMLFw2pKNCXN+Yxxvqw72q59rx7i5w+1CL9XVscRKXuH5Tx0htDQmb+9pSzgLABvfmcM=
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

VGhpcyBwYXRjaCBzZXJpZXMgYWRkZWQgc2NhbGluZyBhbmQgaW1hZ2UgZW5oYW5jZW1lbnQgc3Vw
cG9ydCBmb3Iga29tZWRhDQpkcml2ZXIuDQpFbmFibGVkIHR3byBkaWZmZXJlbnQgc2NhbGluZyB1
c2FnZToNCi0gbGF5ZXIgc2NhbGluZzogc2NhbGluZyBhIGlucHV0IGltYWdlIGJlZm9yZSBjb21w
b3NpdGUgaXQgd2l0aCBvdGhlcnMNCi0gd3JpdGUtYmFjayBzY2FsaW5nOiBzY2FsaW5nIHRoZSBj
b21wb3NpdGlvbiByZXN1bHQgYW5kIHdyaXRlIGl0IHRvIG1lbW9yeQ0KDQpUaGlzIHBhdGNoc2V0
IGRlcGVuZHMgb246DQotIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMv
NTk5MTUvDQotIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNTkwMDAv
DQotIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNTkwMDAvDQoNCnYy
Og0KLSBSZWJhc2UgYW5kIGNvcnJlY3QgdHlwb3MNCi0gUmVuYW1lICJuZWVkc19zY2FsaW5nIiB0
byAiZW5fc2NhbGluZyINCi0gUmVuYW1lICJuZWVkc19pbWdfZW5oYW5jZW1lbnQiIHRvICJlbl9p
bWdfZW5oYW5jZW1lbnQiDQoNCmphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEp
ICg2KToNCiAgZHJtL2tvbWVkYTogQXR0YWNoIHNjYWxlciB0byBkcm0gYXMgcHJpdmF0ZSBvYmpl
Y3QNCiAgZHJtL2tvbWVkYTogQWRkIHRoZSBpbml0aWFsIHNjYWxlciBzdXBwb3J0IGZvciBDT1JF
DQogIGRybS9rb21lZGE6IEltcGxlbWVudCBENzEgc2NhbGVyIHN1cHBvcnQNCiAgZHJtL2tvbWVk
YTogQWRkIHdyaXRlYmFjayBzY2FsaW5nIHN1cHBvcnQNCiAgZHJtL2tvbWVkYTogQWRkIGVuZ2lu
ZSBjbG9jayByZXF1aXJlbWVudCBjaGVjayBmb3IgdGhlIGRvd25zY2FsaW5nDQogIGRybS9rb21l
ZGE6IEFkZCBpbWFnZSBlbmhhbmNlbWVudCBzdXBwb3J0DQoNCiAuLi4vYXJtL2Rpc3BsYXkva29t
ZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgICAgfCAxNzcgKysrKysrKysrKysrKysrKystDQogLi4u
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfZGV2LmMgIHwgICAyICstDQogLi4u
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfZGV2LmggIHwgICAyICsNCiAuLi4v
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYyAgfCAgNjYgKysrKysrLQ0K
IC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmggICB8ICAxNCArLQ0K
IC4uLi9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5jICB8ICAxNCArKw0K
IC4uLi9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oICB8ICAzMiArKyst
DQogLi4uL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jICAgIHwgMTY1ICsr
KysrKysrKysrKysrKy0NCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3Bs
YW5lLmMgfCAgNzUgKysrKysrKy0NCiAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wcml2
YXRlX29iai5jICAgfCAgNDkgKysrKysNCiAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93
Yl9jb25uZWN0b3IuYyAgfCAgIDIgKw0KIDExIGZpbGVzIGNoYW5nZWQsIDU4MyBpbnNlcnRpb25z
KCspLCAxNSBkZWxldGlvbnMoLSkNCg0KLS0gDQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
