Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41471F47E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 12:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D61E89157;
	Tue, 30 Apr 2019 10:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820075.outbound.protection.outlook.com [40.107.82.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD5389157
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 10:51:08 +0000 (UTC)
Received: from MN2PR12MB3151.namprd12.prod.outlook.com (20.178.244.80) by
 MN2PR12MB3614.namprd12.prod.outlook.com (20.178.241.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Tue, 30 Apr 2019 10:51:06 +0000
Received: from MN2PR12MB3151.namprd12.prod.outlook.com
 ([fe80::c45b:31be:3eba:6332]) by MN2PR12MB3151.namprd12.prod.outlook.com
 ([fe80::c45b:31be:3eba:6332%2]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 10:51:06 +0000
From: "Sahu, Satyajit" <Satyajit.Sahu@amd.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH] amdgpu: Query uvd handles info
Thread-Topic: [PATCH] amdgpu: Query uvd handles info
Thread-Index: AQHU/0KcnCug65nra0CSUmQZHYvUhQ==
Date: Tue, 30 Apr 2019 10:51:06 +0000
Message-ID: <20190430104904.23140-1-satyajit.sahu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::14) To MN2PR12MB3151.namprd12.prod.outlook.com
 (2603:10b6:208:d1::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.19.1
x-originating-ip: [165.204.157.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2463c563-ebaa-415d-a04e-08d6cd59bf2f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3614; 
x-ms-traffictypediagnostic: MN2PR12MB3614:
x-microsoft-antispam-prvs: <MN2PR12MB36141A67DD3E18FC30F644E4F53A0@MN2PR12MB3614.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(366004)(396003)(346002)(376002)(199004)(189003)(2351001)(2501003)(2906002)(6506007)(386003)(99286004)(52116002)(6512007)(14444005)(486006)(86362001)(36756003)(26005)(66476007)(66066001)(25786009)(1076003)(4326008)(73956011)(66446008)(66946007)(66556008)(64756008)(71200400001)(3846002)(6916009)(102836004)(97736004)(53936002)(71190400001)(256004)(8936002)(478600001)(6436002)(316002)(6486002)(8676002)(72206003)(7736002)(14454004)(5640700003)(50226002)(68736007)(186003)(54906003)(5660300002)(81156014)(81166006)(2616005)(476003)(6116002)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3614;
 H:MN2PR12MB3151.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kvCOMEES4cRXS95RpSbZe8Zf1gK10/A3M0shz8Je/JU4ZHpz2/gnarDDngXCKBsDWAnx+P4Wi+Hj1CbiStoQ7Y9gzYvU9pEI3MYOOFRcZkzOET/5bsUrgUzwUgdli6ywQOBQLDMAMPM5fJ3AdTguXRmlY1UicZGAD5e+MeDwbEiELuKwLAKtjXXS0eaXa99zoy+Z4LZeOHWB6f95StLm5YHOxltomx+pRolfKFmeFKmg3YKxck5fqvQNQuf69tx1PCeOs3Ha55o7ZM2Nl44C+Fb4oJpHgRwUwbQtwhhrx5Nei99BQQB3fmpwadR3BwSAHJ/LjFIc3xB6/wuzgRx6tofinGNqhbXeN2/UvV705tYDuVWAxmxhcsW42kAsRweBX+UMfD625lZ/Tl+X3A0ndR8bYMTd+n4Ceu+q4IT8bSg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2463c563-ebaa-415d-a04e-08d6cd59bf2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 10:51:06.5398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3614
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJEEvzhaJk/fo5CqxqkGtRco84KtHjU5QBDMucAX9Pk=;
 b=wMj9Ab8J5n4kX/NV/iFE/sIEuVpzQi79GmWdN57FHnbwxTWRUsq61YX6s+t/giXLQ7QWiMjwbMMZIM5HIU9Dn7/2qA6mBfjDQ3i+MA+CbtB3kRU8JqzFugD3waVfbHW2osoEiJqn09ENltwfqPD2G/KCJMCUjpzvgYbY2MucPFU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Satyajit.Sahu@amd.com; 
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
Cc: "Sharma, Deepak" <Deepak.Sharma@amd.com>, "Sahu,
 Satyajit" <Satyajit.Sahu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVlcnkgdGhlIG1heCB1dmQgaGFuZGxlcyBhbmQgdXNlZCB1dmQgaGFuZGxlcy4NCg0KU2lnbmVk
LW9mZi1ieTogU2F0eWFqaXQgU2FodSA8c2F0eWFqaXQuc2FodUBhbWQuY29tPg0KLS0tDQogYW1k
Z3B1L2FtZGdwdS5oICAgICAgICAgIHwgMTQgKysrKysrKysrKysrKysNCiBhbWRncHUvYW1kZ3B1
X2dwdV9pbmZvLmMgfCAxNSArKysrKysrKysrKysrKysNCiAyIGZpbGVzIGNoYW5nZWQsIDI5IGlu
c2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2FtZGdwdS9hbWRncHUuaCBiL2FtZGdwdS9hbWRn
cHUuaA0KaW5kZXggYzQ0YTQ5NWEuLjQwN2I1ZmFlIDEwMDY0NA0KLS0tIGEvYW1kZ3B1L2FtZGdw
dS5oDQorKysgYi9hbWRncHUvYW1kZ3B1LmgNCkBAIC0xMTc0LDYgKzExNzQsMjAgQEAgaW50IGFt
ZGdwdV9xdWVyeV9ncHVfaW5mbyhhbWRncHVfZGV2aWNlX2hhbmRsZSBkZXYsDQogaW50IGFtZGdw
dV9xdWVyeV9pbmZvKGFtZGdwdV9kZXZpY2VfaGFuZGxlIGRldiwgdW5zaWduZWQgaW5mb19pZCwN
CiAJCSAgICAgIHVuc2lnbmVkIHNpemUsIHZvaWQgKnZhbHVlKTsNCiANCisvKioNCisgKiBRdWVy
eSB1dmQgaGFuZGxlcyBpbmZvLg0KKyAqDQorICoNCisgKiBccGFyYW0gICBkZXYgICAgIC0gXGMg
W2luXSBEZXZpY2UgaGFuZGxlLiBTZWUgI2FtZGdwdV9kZXZpY2VfaW5pdGlhbGl6ZSgpDQorICog
XHBhcmFtICAgc2l6ZSAgICAtIFxjIFtpbl0gU2l6ZSBvZiB0aGUgcmV0dXJuZWQgdmFsdWUuDQor
ICogXHBhcmFtICAgdmFsdWUgICAtIFxjIFtvdXRdIFBvaW50ZXIgdG8gdGhlIHJldHVybiB2YWx1
ZS4NCisgKg0KKyAqIFxyZXR1cm4gICAwIG9uIHN1Y2Nlc3Ncbg0KKyAqICAgICAgICAgIDwwIC0g
TmVnYXRpdmUgUE9TSVggZXJyb3IgY29kZQ0KKyAqDQorKi8NCitpbnQgYW1kZ3B1X3F1ZXJ5X3V2
ZF9oYW5kbGVzKGFtZGdwdV9kZXZpY2VfaGFuZGxlIGRldiwNCisgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgc2l6ZSwgdm9pZCAqdmFsdWUpOw0KIC8qKg0KICAqIFF1ZXJ5IGhhcmR3YXJl
IG9yIGRyaXZlciBpbmZvcm1hdGlvbi4NCiAgKg0KZGlmZiAtLWdpdCBhL2FtZGdwdS9hbWRncHVf
Z3B1X2luZm8uYyBiL2FtZGdwdS9hbWRncHVfZ3B1X2luZm8uYw0KaW5kZXggNzc3MDg3ZjIuLjI1
M2M0ZGE3IDEwMDY0NA0KLS0tIGEvYW1kZ3B1L2FtZGdwdV9ncHVfaW5mby5jDQorKysgYi9hbWRn
cHUvYW1kZ3B1X2dwdV9pbmZvLmMNCkBAIC00NCw2ICs0NCwyMSBAQCBkcm1fcHVibGljIGludCBh
bWRncHVfcXVlcnlfaW5mbyhhbWRncHVfZGV2aWNlX2hhbmRsZSBkZXYsIHVuc2lnbmVkIGluZm9f
aWQsDQogCQkJICAgICAgIHNpemVvZihzdHJ1Y3QgZHJtX2FtZGdwdV9pbmZvKSk7DQogfQ0KIA0K
K2RybV9wdWJsaWMgaW50IGFtZGdwdV9xdWVyeV91dmRfaGFuZGxlcyhhbWRncHVfZGV2aWNlX2hh
bmRsZSBkZXYsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIHNpemUsIHZvaWQgKnZhbHVlKQ0KK3sNCisJc3RydWN0IGRybV9hbWRncHVfaW5mbyByZXF1
ZXN0Ow0KKw0KKwltZW1zZXQoJnJlcXVlc3QsIDAsIHNpemVvZihyZXF1ZXN0KSk7DQorCXJlcXVl
c3QucmV0dXJuX3BvaW50ZXIgPSAodWludHB0cl90KXZhbHVlOw0KKwlyZXF1ZXN0LnJldHVybl9z
aXplID0gc2l6ZTsNCisJcmVxdWVzdC5xdWVyeSA9IEFNREdQVV9JTkZPX05VTV9IQU5ETEVTOw0K
KwlyZXF1ZXN0LnF1ZXJ5X2h3X2lwLnR5cGUgPSBBTURHUFVfSFdfSVBfVVZEOw0KKw0KKwlyZXR1
cm4gZHJtQ29tbWFuZFdyaXRlKGRldi0+ZmQsIERSTV9BTURHUFVfSU5GTywgJnJlcXVlc3QsDQor
CQkJICAgICAgIHNpemVvZihzdHJ1Y3QgZHJtX2FtZGdwdV9pbmZvKSk7DQorfQ0KKw0KIGRybV9w
dWJsaWMgaW50IGFtZGdwdV9xdWVyeV9jcnRjX2Zyb21faWQoYW1kZ3B1X2RldmljZV9oYW5kbGUg
ZGV2LCB1bnNpZ25lZCBpZCwNCiAJCQkJCSBpbnQzMl90ICpyZXN1bHQpDQogew0KLS0gDQoyLjE5
LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
