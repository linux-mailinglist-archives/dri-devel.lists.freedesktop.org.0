Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A331628F84
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 05:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFF46E067;
	Fri, 24 May 2019 03:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50069.outbound.protection.outlook.com [40.107.5.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7662F6E047
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 03:16:50 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5135.eurprd08.prod.outlook.com (20.179.30.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Fri, 24 May 2019 03:16:47 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1922.017; Fri, 24 May 2019
 03:16:47 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH] drm/komeda: Accept null writeback configurations for writeback
Thread-Topic: [PATCH] drm/komeda: Accept null writeback configurations for
 writeback
Thread-Index: AQHVEd8ee/t54Nf5EUSIM2PBpwEGHg==
Date: Fri, 24 May 2019 03:16:47 +0000
Message-ID: <20190524031628.20533-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:203:36::21) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 778196cb-de6b-491e-22a9-08d6dff64105
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB5135; 
x-ms-traffictypediagnostic: VE1PR08MB5135:
x-ms-exchange-purlcount: 1
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB513588971A67A75FA5A2DB3EB3020@VE1PR08MB5135.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0047BC5ADE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(366004)(136003)(376002)(346002)(189003)(199004)(36756003)(1076003)(26005)(68736007)(6306002)(66066001)(6436002)(6512007)(2906002)(2616005)(8936002)(476003)(186003)(5660300002)(386003)(316002)(53936002)(4326008)(6486002)(2201001)(6116002)(3846002)(110136005)(305945005)(14454004)(55236004)(86362001)(102836004)(6506007)(66476007)(54906003)(66946007)(73956011)(7736002)(66446008)(64756008)(66556008)(256004)(25786009)(71200400001)(486006)(71190400001)(966005)(99286004)(8676002)(103116003)(2501003)(50226002)(52116002)(478600001)(81166006)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5135;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xgIiYazmQNkPBWjt8H4ypghmGVz2dzTzxgaE0vlKgtuLI8kfdN1qKKy3LpabPJk1r+DHaAyD0/l8XWAkZBwEPnHIcX2IpEO/86SMc7lIEP0Fpknobv2RGOaOclc2B80qT2urBlg9LmS8zQe2w9/3rbVMnS4fTOejPc6y3MuB7utq3O/j3fnCl1irW/RU0obJ2lnSUJwC6luN2kkeq1FUHXgGW8ozTwYA6uRw5uTgsHNm9vU1EKUpp9aS5yOKHHgdfsa98UkMc0rI/im9JGV52wc0rgd/BWLvuCKukT/vf0/we4lAq9eTbPKDKxseJCRiv0nv+AlZjN13SRZ+fNm4SnB62ZiVJfoGnR2Lo0u+CMAuKpVCkWfV83b82ubLmk4L6vYhfH55H9pgiGx+43Z3Mdf2wA6kV1rv7gdzxnC4anI=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 778196cb-de6b-491e-22a9-08d6dff64105
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2019 03:16:47.1804 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5135
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KqS2DZUMb5Adwcl0tbc/DbnkYyqnfoMJ/qs5Yvl25lk=;
 b=b8TIeHi87oJcI6A4DSBZ95dilWIyymgW7MdmoFmdQwmcr6md9kBHCCc5rQVo1HIgWTZDoGSMejjN7X2Dug3hN63Qv0VMkekZm07L6byd65KH2XwCEKkIhPrYeJ2Cd/KhnrkDkvXW2MjCr86hneiImfee3JdJRc9UWE1w6K3+nag=
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

VXNlciBtYXkgc2VuZCBudWxsIHdyaXRlYmFjayBjb25maWd1cmF0aW9ucyBmb3Igd3JpdGViYWNr
IGNvbm5lY3RvciBsaWtlOg0KLSBPbmx5IGJpbmQgdGhlIHdyaXRlYmFjayBjb25uZWN0b3IgdG8g
Y3J0Yy4NCi0gc2V0IGEgZmJfaWQoMCkgdG8gd3JpdGViYWNrX2ZiX2lkX3Byb3BlcnR5DQpBbGwg
YWJvdmUgY29uZmlndXJhdGlvbnMgYXJlIG1lYW5pbmdsZXNzIGZvciB3cml0ZWJhY2ssIGJ1dCBz
aW5jZSB0aGV5IGFyZQ0Kc3RpbGwgdmFsaWQgY29uZmlndXJhdGlvbnMsIGFjY2VwdCB0aGVtLg0K
DQpEZXBlbmRzIG9uOg0KLSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVz
LzYwODU2Lw0KDQpTaWduZWQtb2ZmLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5
IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+DQotLS0NCiAuLi4vZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jICB8IDExICsrKysrKy0tLS0tDQog
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCg0KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5l
Y3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29u
bmVjdG9yLmMNCmluZGV4IDIwMjk1MjkxNTcyZi4uMGQ3MzQyNDRmNjYyIDEwMDY0NA0KLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMN
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5l
Y3Rvci5jDQpAQCAtMTMsMTEgKzEzLDcgQEAga29tZWRhX3diX2luaXRfZGF0YV9mbG93KHN0cnVj
dCBrb21lZGFfbGF5ZXIgKndiX2xheWVyLA0KIAkJCSBzdHJ1Y3Qga29tZWRhX2NydGNfc3RhdGUg
KmtjcnRjX3N0LA0KIAkJCSBzdHJ1Y3Qga29tZWRhX2RhdGFfZmxvd19jZmcgKmRmbG93KQ0KIHsN
Ci0Jc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSBjb25uX3N0LT53cml0ZWJhY2tfam9iID8N
Ci0JCQkJICAgICBjb25uX3N0LT53cml0ZWJhY2tfam9iLT5mYiA6IE5VTEw7DQotDQotCWlmICgh
ZmIpDQotCQlyZXR1cm4gLUVJTlZBTDsNCisJc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSBj
b25uX3N0LT53cml0ZWJhY2tfam9iLT5mYjsNCiANCiAJbWVtc2V0KGRmbG93LCAwLCBzaXplb2Yo
KmRmbG93KSk7DQogDQpAQCAtNDIsMTAgKzM4LDE1IEBAIGtvbWVkYV93Yl9lbmNvZGVyX2F0b21p
Y19jaGVjayhzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsDQogCQkJICAgICAgIHN0cnVjdCBk
cm1fY29ubmVjdG9yX3N0YXRlICpjb25uX3N0KQ0KIHsNCiAJc3RydWN0IGtvbWVkYV9jcnRjX3N0
YXRlICprY3J0Y19zdCA9IHRvX2tjcnRjX3N0KGNydGNfc3QpOw0KKwlzdHJ1Y3QgZHJtX3dyaXRl
YmFja19qb2IgKndyaXRlYmFja19qb2IgPSBjb25uX3N0LT53cml0ZWJhY2tfam9iOw0KIAlzdHJ1
Y3Qga29tZWRhX2xheWVyICp3Yl9sYXllcjsNCiAJc3RydWN0IGtvbWVkYV9kYXRhX2Zsb3dfY2Zn
IGRmbG93Ow0KIAlpbnQgZXJyOw0KIA0KKwlpZiAoIXdyaXRlYmFja19qb2IgfHwgIXdyaXRlYmFj
a19qb2ItPmZiKSB7DQorCQlyZXR1cm4gMDsNCisJfQ0KKw0KIAlpZiAoIWNydGNfc3QtPmFjdGl2
ZSkgew0KIAkJRFJNX0RFQlVHX0FUT01JQygiQ2Fubm90IHdyaXRlIHRoZSBjb21wb3NpdGlvbiBy
ZXN1bHQgb3V0IG9uIGEgaW5hY3RpdmUgQ1JUQy5cbiIpOw0KIAkJcmV0dXJuIC1FSU5WQUw7DQot
LSANCjIuMTcuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
