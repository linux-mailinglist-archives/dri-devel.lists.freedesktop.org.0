Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E2B216A7
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 12:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB7689872;
	Fri, 17 May 2019 10:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150043.outbound.protection.outlook.com [40.107.15.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F1089872
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 10:05:03 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5055.eurprd08.prod.outlook.com (10.255.159.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Fri, 17 May 2019 10:05:00 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1900.010; Fri, 17 May 2019
 10:05:00 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH 0/2] drm/komeda: Add format: Y0L2, P010, YUV420_8/10BIT
Thread-Topic: [PATCH 0/2] drm/komeda: Add format: Y0L2, P010, YUV420_8/10BIT
Thread-Index: AQHVDJf9OPsJbOFl80ybA5lrH/7nHQ==
Date: Fri, 17 May 2019 10:05:00 +0000
Message-ID: <20190517100425.18716-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0222.apcprd02.prod.outlook.com
 (2603:1096:201:20::34) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5aab042-966c-4a80-db2b-08d6daaf1f35
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB5055; 
x-ms-traffictypediagnostic: VE1PR08MB5055:
x-ms-exchange-purlcount: 4
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB5055A3BBB5F8CF261A0E22B4B30B0@VE1PR08MB5055.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(376002)(346002)(366004)(396003)(199004)(189003)(4326008)(66556008)(81156014)(8676002)(66476007)(71190400001)(25786009)(81166006)(66446008)(316002)(486006)(2501003)(8936002)(966005)(50226002)(73956011)(66946007)(68736007)(66066001)(64756008)(2616005)(256004)(53936002)(2201001)(86362001)(386003)(6506007)(52116002)(6116002)(6306002)(1076003)(3846002)(99286004)(54906003)(2906002)(110136005)(36756003)(55236004)(6486002)(6512007)(476003)(5660300002)(478600001)(186003)(103116003)(4744005)(14454004)(71200400001)(26005)(305945005)(6436002)(7736002)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5055;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Q2zd0TloQEE+/UFTPDYW+eTUNSFhHf+K/oqK+WOD7DeKt0+v9Te3roucTiHHcZHmQhkiEvDR+OQmzwchm6aDTdehx/d0JyE+0YuO9xkfoWg4d1+i9ntGLiC+OshBGPocJRY9KPlOhf0wnpug3BbTwhhcGjtr/ZD9WChAeee8EPTztZWHUe6XFBS3tQcvuQFg+Q6TZXK5nCSj9KHV8KrTkWwG9KYNbtffb1LqzPR30X6epn/rL2YSbirPzWzlK6N7lJnoeH/Tt5P2akkPa+YOxUQDxFdetdEgp/8C3/+ru+BRETIeNbh3Bd10QKYAQAY1kzIIO1TGNorwqn/p2+yN2tCURhRxhXSm9lGInlXSnj+qHpJ18t4aA/QL8XtwHNTkXaMpGsKgcr+RWBAo9RPdaZLbI95dW2OeE5kko2IMhwk=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5aab042-966c-4a80-db2b-08d6daaf1f35
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 10:05:00.4584 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5055
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGmfojIJ/wE5puU1MKAPL7fUkE3vXR1QA7kzLRgwyXA=;
 b=MmY9SNq48QzflT3uHGLih7kXSQ4vUQur8fpXv3Ou45hq+6xEFopPe+6HegvDoYqvAb7VOfpS3evn8Qe4SkHPw1hHQMqBDkuVeJyVC0gNC8gujczMFIV6wMxsMKhvX/4i8/Waozi5N9ZRivibflKd82ybFncke1Zy3Pmm+X0ilz4=
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

VGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBuZXcgZm9ybWF0czoNCi0gYmxvY2sgZm9ybWF0IHN1cHBv
cnQgZm9yIFkwTDIsIFAwMTANCi0gQUZCQyBmb3JtYXQgWVVWNDIwXzhfQklULCBZVVY0MjBfMTBf
QklUIA0KDQpUaGlzIHBhdGNoIHNlcmllcyBkZXBlbmRzIG9uOg0KLSBodHRwczovL3BhdGNod29y
ay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzU4NzEwLw0KLSBodHRwczovL3BhdGNod29yay5mcmVl
ZGVza3RvcC5vcmcvc2VyaWVzLzU5MDAwLw0KLSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3Rv
cC5vcmcvc2VyaWVzLzU5MDAyLw0KLSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcv
c2VyaWVzLzYwNjk4Lw0KDQpKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSAo
Mik6DQogIGRybS9rb21lZGE6IEFkZCBrb21lZGFfZmJfY2hlY2tfc3JjX2Nvb3Jkcw0KICBkcm0v
a29tZWRhOiBBZGQgZm9ybWF0IHN1cHBvcnQgZm9yIFkwTDIsIFAwMTAsIFlVVjQyMF84LzEwQklU
DQoNCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9pbmNsdWRlL21hbGlkcF9pby5oICAgfCAgNyAr
Kw0KIC4uLi9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYyAgICB8IDU4ICsr
KysrKystLS0tLS0tDQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfZGV2
LmMgIHwgNzIgKysrKysrKystLS0tLS0tLS0NCiAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9mb3JtYXRfY2Fwcy5oICAgfCAgMiAtDQogLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
ZnJhbWVidWZmZXIuYyAgIHwgNzggKysrKysrKysrKysrLS0tLS0tLQ0KIC4uLi9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2ZyYW1lYnVmZmVyLmggICB8ICAyICsNCiAuLi4vZGlzcGxheS9rb21l
ZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMgICAgfCAzNCArKysrKy0tLQ0KIDcgZmlsZXMgY2hh
bmdlZCwgMTQzIGluc2VydGlvbnMoKyksIDExMCBkZWxldGlvbnMoLSkNCg0KLS0gDQoyLjE3LjEN
Cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
