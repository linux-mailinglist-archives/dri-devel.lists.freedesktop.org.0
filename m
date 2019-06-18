Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFC449BBF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 10:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C19C96E10A;
	Tue, 18 Jun 2019 08:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::617])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9C96E10F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 08:10:36 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5007.eurprd08.prod.outlook.com (10.255.159.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Tue, 18 Jun 2019 08:10:33 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1987.014; Tue, 18 Jun 2019
 08:10:33 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH 0/2] drm/komeda: Enable dual-link support
Thread-Topic: [PATCH 0/2] drm/komeda: Enable dual-link support
Thread-Index: AQHVJa1NqbKKPTtzuUuByLzGLbgDCg==
Date: Tue, 18 Jun 2019 08:10:33 +0000
Message-ID: <20190618081013.13638-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR0401CA0002.apcprd04.prod.outlook.com
 (2603:1096:202:2::12) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c2a2eb0-9d4d-4d48-5334-08d6f3c46f73
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB5007; 
x-ms-traffictypediagnostic: VE1PR08MB5007:
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB50076EE7B8C5EA43DCD6AE76B3EA0@VE1PR08MB5007.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 007271867D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(346002)(39860400002)(376002)(366004)(199004)(189003)(66446008)(66556008)(54906003)(7736002)(2201001)(66066001)(305945005)(68736007)(386003)(103116003)(55236004)(6506007)(110136005)(14454004)(102836004)(52116002)(8936002)(25786009)(53936002)(316002)(2906002)(478600001)(86362001)(4326008)(81166006)(476003)(6436002)(81156014)(186003)(8676002)(6116002)(256004)(50226002)(6512007)(486006)(99286004)(2616005)(26005)(6486002)(73956011)(36756003)(2501003)(3846002)(66946007)(71200400001)(71190400001)(5660300002)(66476007)(1076003)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5007;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: omGKtdQMYhsv7CyOVRFvtTH0e0bcQqutSCKBiHxwtDSlR+O2pi0HY/f7tsiBqxtRH07MTP+yhHB24p/M/d0sHHNFHTSYXwVT1o+WH+W/Z8DnA7GbjG4H8clOpQM1EZzZQ8krppJF7bjvDu1bb9lu54HPhFvmtNTrDxc671bBbD8Bx3Fb9U1LuvXbX4SeoFVPojOzJ2CGBO+cPxHlcCRcz6ZGI6+JrJUuQl0dUVSLwsGrQ0Z1IBsMibKFH/YvvqDRgEQIx3RK+zmeOPh4T/PzB/zgxTseTawXXqcMw6Zhdp68Q8Ieq9EyW+/+e/eGOaxXxG/uWbz0filZbR+SeszE3eJ1aRQodeZeTs8UQOMZfi2LhmesCzD6EkRkQg9c17vNFUmwNU8Lm3yQ9Nc96xMk5YzYuhYZ7T/T8U8arYFUn7I=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c2a2eb0-9d4d-4d48-5334-08d6f3c46f73
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2019 08:10:33.4718 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5007
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vV3rnIsRt5YAypvnkdbPOeNRNuzNgqqrwOPmScx89fw=;
 b=BQXRxeO3nL/1LMrkrsT392u+8ks5i8Q7mTea3vvotRNsgFlAQXvkLHL/1Kry9oTNH/shxShth/vZtVxGMxu7TyO6rTMNL4wSp61VGGr5AYNizvtqJoTXKt+vsVOviJDB1+tFHWzp1WI9X8O49f2ReyT9vQGkdgu/Nf/T5AEXjBg=
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

S29tZWRhIEhXIGNhbiBzdXBwb3J0IGR1YWwtbGluayB3aGljaCBzcGxpdHMgZGlzcGxheSBmcmFt
ZSB0byB0d28gaGFsdmVzDQoobGVmdC9saW5rMCwgcmlnaHQvbGluazEpIGFuZCBvdXRwdXQgdGhl
bSBieSB0d28gb3V0cHV0IGxpbmtzLg0KRHVlIHRvIHRoZSBoYWx2ZWQgcGl4ZWwgcmF0ZSBvZiBl
YWNoIGxpbmssIHRoZSBweGxjbGsgb2YgZHVhbC1saW5rIGNhbiBiZQ0KcmVkdWNlZCB0d28gdGlt
ZXMgY29tcGFyZSB3aXRoIHNpbmdsZS1saW5rLg0KDQpGb3IgZW5hYmxpbmcgZHVhbC1saW5rOg0K
LSBUaGUgRFQgbmVlZCB0byBjb25maWd1cmUgdHdvIG91dHB1dC1saW5rcyBmb3IgdGhlIHBpcGVs
aW5lIG5vZGUuDQotIEtvbWVkYSBlbmFibGUgZHVhbC1saW5rIHdoZW4gYm90aCBsaW5rMCBhbmQg
bGluazEgaGF2ZSBiZWVuIGNvbm5lY3RlZC4NCg0KRXhhbXBsZSBvZiBob3cgdGhlIHBpcGVsaW5l
IG5vZGUgd2lsbCBsb29rIGxpa2UgZm9yIGR1YWwtbGluayBzZXR1cA0KDQpwaXBlMDogcGlwZWxp
bmVAMCB7DQoJY2xvY2tzID0gPCZmcGdhb3NjMj47DQoJY2xvY2stbmFtZXMgPSAicHhjbGsiOw0K
CXJlZyA9IDwwPjsNCg0KCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KCSNzaXplLWNlbGxzID0gPDA+
Ow0KDQoJcG9ydEAwIHsNCgkJcmVnID0gPDA+Ow0KDQoJCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0K
CQkjc2l6ZS1jZWxscyA9IDwwPjsNCgkJZHAwX3BpcGUwX2xpbmswOiBlbmRwb2ludEAwIHsNCgkJ
CXJlZyA9IDwwPjsNCgkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZGxpbmtfY29ubmVjdG9yX2luMD47
DQoNCgkJfTsNCgkJZHAwX3BpcGUwX2xpbmsxOiBlbmRwb2ludEAxIHsNCgkJCXJlZyA9IDwxPjsN
CgkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZGxpbmtfY29ubmVjdG9yX2luMT47DQoJCX07DQoJfTsN
Cn07DQoNCkphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpICgyKToNCiAgZHJt
L2tvbWVkYTogVXNlIGRybV9kaXNwbGF5X21vZGUgImNydGNfIiBwcmVmaXhlZCBoYXJkd2FyZSB0
aW1pbmdzDQogIGRybS9rb21lZGE6IEVuYWJsZSBkdWFsLWxpbmsgc3VwcG9ydA0KDQogLi4uL2Fy
bS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jICAgIHwgNDIgKysrKystLS0tDQog
Li4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgIHwgODkgKysrKysr
KysrKysrKy0tLS0tLQ0KIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2
LmMgICB8ICA1ICstDQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kcnYu
YyAgIHwgIDggKy0NCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5o
ICAgfCAgNCArLQ0KIC4uLi9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5j
ICB8IDE5ICsrKy0NCiAuLi4vZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUu
aCAgfCAgNiArLQ0KIC4uLi9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYyAg
ICB8ICAyICstDQogOCBmaWxlcyBjaGFuZ2VkLCAxMTggaW5zZXJ0aW9ucygrKSwgNTcgZGVsZXRp
b25zKC0pDQoNCi0tDQoyLjE3LjENCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
