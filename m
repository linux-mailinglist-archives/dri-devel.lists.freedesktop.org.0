Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C57F8D0B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 11:41:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F346EB08;
	Tue, 12 Nov 2019 10:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50083.outbound.protection.outlook.com [40.107.5.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD03F6EB08
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 10:40:58 +0000 (UTC)
Received: from AM6PR08CA0001.eurprd08.prod.outlook.com (2603:10a6:20b:b2::13)
 by VI1SPR00MB254.eurprd08.prod.outlook.com (2603:10a6:800:5c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23; Tue, 12 Nov
 2019 10:40:55 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::207) by AM6PR08CA0001.outlook.office365.com
 (2603:10a6:20b:b2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2451.23 via Frontend
 Transport; Tue, 12 Nov 2019 10:40:55 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2430.21 via Frontend Transport; Tue, 12 Nov 2019 10:40:54 +0000
Received: ("Tessian outbound e4042aced47b:v33");
 Tue, 12 Nov 2019 10:40:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 16091eeb146b9c36
X-CR-MTA-TID: 64aa7808
Received: from a79b2280da58.2 (cr-mta-lb-1.cr-mta-net [104.47.10.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8719C66A-E6A7-461B-A2DA-38CA8FCF4D23.1; 
 Tue, 12 Nov 2019 10:40:46 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2053.outbound.protection.outlook.com [104.47.10.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a79b2280da58.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 12 Nov 2019 10:40:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HrFuMHW7ZgK2nUdg2qsI8Sq6A//y971CxGSIvdh9+8HHfm1blvIbAPxsKDSEbK2OwkpgEnmlej+wIkfaMhexD4XP92ucO4R6dZxtCNuJE/NMGmOOdhprcEkR4cdU8jr+J3MzanQT+75U842qhcps40H32MusJk4Q+TToYBWrISNPfMl7LiOV00xYBsM9Hwf3H5bGO6RQyWwgN+pWZZ2nrJvAe6B2m8hY5Y4ZaacLjTJWAmmdxap79lFc5utj/FzyNa7uY2h55qZm7Y3uNmTXy1U/r7HjsciNcmi2YHwS7FYNdvkdjteL07FBQoPgm7Nt9bdK9WtqELl2aDpEurT7VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9TQq3bHNRrYQiNPP2nRVJpod47h6p3GxLvGsKKnTnHo=;
 b=lN73BnBUZv+ZjU9GmObLyFfTMOa+O++A3o/OpizfzB7zum/DHdBuw1vfggVULim4BSD5bZc4AMYZt3j1Hpfba1PQY2itDYotj8z+mwH2FTUSxSUPXm2E9c4dtsenPaFZiwET/qNG/yhBFiaouAtzbquuAbzVCPPAMp5r3bHqH2TdYk8bWKxJHi6npDMuiYqgH3UB4FPf1+BJK83thIyhOCgA8wilTVbukz9LvpM6M4lhQJysxIimT9t+P1jIARcmwgpkNvFhS/yInhv3/1X1fp23ya4xW6tQYDwH2vR63GKXvH4305WN+Lu+P3yF3V6iriZpquk7bq4WhNx2i53uOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM0PR08MB4995.eurprd08.prod.outlook.com (10.255.30.207) by
 AM0PR08MB4082.eurprd08.prod.outlook.com (20.178.119.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Tue, 12 Nov 2019 10:40:45 +0000
Received: from AM0PR08MB4995.eurprd08.prod.outlook.com
 ([fe80::3c0c:3112:ccbf:13d0]) by AM0PR08MB4995.eurprd08.prod.outlook.com
 ([fe80::3c0c:3112:ccbf:13d0%6]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 10:40:45 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 Mihail Atanassov <Mihail.Atanassov@arm.com>, "imirkin@alum.mit.edu"
 <imirkin@alum.mit.edu>
Subject: [PATCH v9 4/4] drm/komeda: Adds gamma and color-transform support for
 DOU-IPS
Thread-Topic: [PATCH v9 4/4] drm/komeda: Adds gamma and color-transform
 support for DOU-IPS
Thread-Index: AQHVmUWjWKw2oVnDAEWCPL8R/YV3Ug==
Date: Tue, 12 Nov 2019 10:40:44 +0000
Message-ID: <20191112103956.19074-5-james.qian.wang@arm.com>
References: <20191112103956.19074-1-james.qian.wang@arm.com>
In-Reply-To: <20191112103956.19074-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0087.apcprd03.prod.outlook.com
 (2603:1096:203:72::27) To AM0PR08MB4995.eurprd08.prod.outlook.com
 (2603:10a6:208:162::15)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4b4ec4e4-66af-4e1a-6964-08d7675ccbd4
X-MS-TrafficTypeDiagnostic: AM0PR08MB4082:|AM0PR08MB4082:|VI1SPR00MB254:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1SPR00MB2548FA137F9EE4E3F5D3ED8B3770@VI1SPR00MB254.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2582;OLM:2582;
x-forefront-prvs: 021975AE46
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(199004)(189003)(64756008)(66476007)(66556008)(66946007)(6116002)(66446008)(3846002)(256004)(386003)(8936002)(6506007)(99286004)(2906002)(1076003)(14444005)(102836004)(103116003)(55236004)(4326008)(36756003)(71200400001)(71190400001)(486006)(305945005)(2501003)(76176011)(50226002)(81156014)(81166006)(26005)(8676002)(52116002)(7736002)(186003)(110136005)(54906003)(5660300002)(316002)(86362001)(66066001)(6512007)(478600001)(2616005)(11346002)(446003)(2201001)(6436002)(25786009)(476003)(6486002)(2171002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4082;
 H:AM0PR08MB4995.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: JVUoa+QCXbQh6WlEr+6RggSotbccpTZmzuLQow8rfBD4g3/sGuHCEYDIdIX3Y5zXqtqimBrZZt5KFY0xWbQHb+UXmvisMLXyyIJ8fBbgfF9BsZxWFDzomM0NxbKTF0JcAAiqETXt4dW7c9FY65e02D8w2FlyO+fsA6eneuCTXJR0vQ9o3oZEyu3InmGGCUF8IeRY9/VOe8tZhnCILkKB9MzUxewIh+fMilgTbi3wUo6Qzq7kv9OQxsSNkF9sTLImzdRdI5c0gBQdAjpFnYhxiQmNdocEMJY69lNO6DmEE6ReHktcdXECIBt7uPvd32xMp20FBV8Mm0Ylt8TN8e7EP5QNwrBjwNlzwFdCuGIJMMh176U4ywBLHn/TftNjvh2s0+xtfK3sf/AWtuqGj8SZdaZitfBVVeZ6itHiw0NDc2cmZ5sFb6o5ZguGM0bd35gH
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4082
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(376002)(136003)(1110001)(339900001)(199004)(189003)(102836004)(50466002)(86362001)(2201001)(305945005)(7736002)(6116002)(3846002)(50226002)(486006)(2501003)(81156014)(81166006)(1076003)(476003)(8676002)(22756006)(126002)(76130400001)(8936002)(8746002)(70586007)(70206006)(386003)(6506007)(5660300002)(2616005)(2906002)(76176011)(105606002)(99286004)(26005)(6512007)(103116003)(2171002)(336012)(4326008)(14454004)(478600001)(36756003)(6486002)(14444005)(26826003)(36906005)(47776003)(110136005)(356004)(316002)(11346002)(23756003)(66066001)(186003)(446003)(25786009)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1SPR00MB254;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 317e8938-a06e-45a2-a0de-08d7675cc5a6
NoDisclaimer: True
X-Forefront-PRVS: 021975AE46
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o8qNU0IRlX5S3AOHri/yoF9Sz5FQ3NtsmroztO8voiB+4gGbiqaMgsmUva2slr54xlvubM/v6fmjcsenGfcfupmYNWjwF50se9CwO4bZxR3gAa3zsZzjqpO2xCzINaD/sUD+TItI6l+DeQix1HNz5LZKrb3UIVgMlw4i4oRikpPEABVF81Ndz9wsWjZO0oDPuiz8xThp5avODYpa8CEYVlRoCHdzT5x1zrEPLBjGCPYtewbidQdQ8/ErsTndJZsIsbMDvnK4x3Qo3FN0wMkbAlWnVnySxFQZWhq8bFpEhUXUwzmZSh0quiDxqrT68jC1laxAJKK8qxpDJ8QftvIxKRI6cc6jcmswvwJGjorlntbfEN2OwYy7SSh/W5W6YsLDQcy85njhSuE/fjfgTlU6vHnPOR1l1nmywRRdT05QnJIzi6wjlsQ6reXfgPfVEsiX
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2019 10:40:54.8990 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b4ec4e4-66af-4e1a-6964-08d7675ccbd4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1SPR00MB254
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9TQq3bHNRrYQiNPP2nRVJpod47h6p3GxLvGsKKnTnHo=;
 b=DGoHfE+hYMD4cT2wlzqS2XtmlAGKLxThc/wqMgP3ZqYdAl54CZ4r+IojipD33GDDTD7/WexZF0g7XTRQ9ecijFgbGaI8+3kEb8gKRtG3bJd1CIcEcog7ejVl2oM+XyK5zJ0KhbMXJmWaaKQwuH1OQmra0huQphRM8RnDxWv+Ss4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9TQq3bHNRrYQiNPP2nRVJpod47h6p3GxLvGsKKnTnHo=;
 b=DGoHfE+hYMD4cT2wlzqS2XtmlAGKLxThc/wqMgP3ZqYdAl54CZ4r+IojipD33GDDTD7/WexZF0g7XTRQ9ecijFgbGaI8+3kEb8gKRtG3bJd1CIcEcog7ejVl2oM+XyK5zJ0KhbMXJmWaaKQwuH1OQmra0huQphRM8RnDxWv+Ss4=
X-Mailman-Original-Authentication-Results: spf=fail (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=none
 action=none header.from=arm.com;
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
 Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogIkxvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkiIDxMb3dyeS5MaUBhcm0uY29t
PgoKQWRkcyBnYW1tYSBhbmQgY29sb3ItdHJhbnNmb3JtIHN1cHBvcnQgZm9yIERPVS1JUFMuCkFk
ZHMgdHdvIGNhcHMgbWVtYmVycyBmZ2FtbWFfY29lZmZzIGFuZCBjdG1fY29lZmZzIHRvIGtvbWVk
YV9pbXByb2Nfc3RhdGUuCklmIGNvbG9yIG1hbmFnZW1lbnQgY2hhbmdlZCwgc2V0IGdhbW1hIGFu
ZCBjb2xvci10cmFuc2Zvcm0gYWNjb3JkaW5nbHkuCgp2NTogUmViYXNlIHdpdGggZHJtLW1pc2Mt
bmV4dAoKU2lnbmVkLW9mZi1ieTogTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8bG93
cnkubGlAYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFu
YXNzb3ZAYXJtLmNvbT4KLS0tCiAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9u
ZW50LmMgICAgfCAyMCArKysrKysrKysrKysrKysrKysrCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2NydGMuYyAgfCAgMiArKwogLi4uL2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX3BpcGVsaW5lLmggIHwgIDMgKysrCiAuLi4vZGlzcGxheS9rb21lZGEva29tZWRh
X3BpcGVsaW5lX3N0YXRlLmMgICAgfCAgNiArKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMzEgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEvZDcxL2Q3MV9jb21wb25lbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEvZDcxL2Q3MV9jb21wb25lbnQuYwppbmRleCBmMGJhMjZlMjgyYzMuLmI2NTE3YzQ2ZTY3MCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Nv
bXBvbmVudC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3
MV9jb21wb25lbnQuYwpAQCAtMTA0NCw3ICsxMDQ0LDkgQEAgc3RhdGljIGludCBkNzFfbWVyZ2Vy
X2luaXQoc3RydWN0IGQ3MV9kZXYgKmQ3MSwKIHN0YXRpYyB2b2lkIGQ3MV9pbXByb2NfdXBkYXRl
KHN0cnVjdCBrb21lZGFfY29tcG9uZW50ICpjLAogCQkJICAgICAgc3RydWN0IGtvbWVkYV9jb21w
b25lbnRfc3RhdGUgKnN0YXRlKQogeworCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdCA9
IHN0YXRlLT5jcnRjLT5zdGF0ZTsKIAlzdHJ1Y3Qga29tZWRhX2ltcHJvY19zdGF0ZSAqc3QgPSB0
b19pbXByb2Nfc3Qoc3RhdGUpOworCXN0cnVjdCBkNzFfcGlwZWxpbmUgKnBpcGUgPSB0b19kNzFf
cGlwZWxpbmUoYy0+cGlwZWxpbmUpOwogCXUzMiBfX2lvbWVtICpyZWcgPSBjLT5yZWc7CiAJdTMy
IGluZGV4LCBtYXNrID0gMCwgY3RybCA9IDA7CiAKQEAgLTEwNTUsNiArMTA1NywyNCBAQCBzdGF0
aWMgdm9pZCBkNzFfaW1wcm9jX3VwZGF0ZShzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqYywKIAlt
YWxpZHBfd3JpdGUzMihyZWcsIEJMS19TSVpFLCBIVl9TSVpFKHN0LT5oc2l6ZSwgc3QtPnZzaXpl
KSk7CiAJbWFsaWRwX3dyaXRlMzIocmVnLCBJUFNfREVQVEgsIHN0LT5jb2xvcl9kZXB0aCk7CiAK
KwlpZiAoY3J0Y19zdC0+Y29sb3JfbWdtdF9jaGFuZ2VkKSB7CisJCW1hc2sgfD0gSVBTX0NUUkxf
RlQgfCBJUFNfQ1RSTF9SR0I7CisKKwkJaWYgKGNydGNfc3QtPmdhbW1hX2x1dCkgeworCQkJbWFs
aWRwX3dyaXRlX2dyb3VwKHBpcGUtPmRvdV9mdF9jb2VmZl9hZGRyLCBGVF9DT0VGRjAsCisJCQkJ
CSAgIEtPTUVEQV9OX0dBTU1BX0NPRUZGUywKKwkJCQkJICAgc3QtPmZnYW1tYV9jb2VmZnMpOwor
CQkJY3RybCB8PSBJUFNfQ1RSTF9GVDsgLyogZW5hYmxlIGdhbW1hICovCisJCX0KKworCQlpZiAo
Y3J0Y19zdC0+Y3RtKSB7CisJCQltYWxpZHBfd3JpdGVfZ3JvdXAocmVnLCBJUFNfUkdCX1JHQl9D
T0VGRjAsCisJCQkJCSAgIEtPTUVEQV9OX0NUTV9DT0VGRlMsCisJCQkJCSAgIHN0LT5jdG1fY29l
ZmZzKTsKKwkJCWN0cmwgfD0gSVBTX0NUUkxfUkdCOyAvKiBlbmFibGUgZ2FtdXQgKi8KKwkJfQor
CX0KKwogCW1hc2sgfD0gSVBTX0NUUkxfWVVWIHwgSVBTX0NUUkxfQ0hENDIyIHwgSVBTX0NUUkxf
Q0hENDIwOwogCiAJLyogY29uZmlnIGNvbG9yIGZvcm1hdCAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCmluZGV4IDI1MjAxNTIxMGZiYy4u
MWM0NTJlYTc1OTk5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9jcnRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfY3J0Yy5jCkBAIC02MTcsNiArNjE3LDggQEAgc3RhdGljIGludCBrb21lZGFfY3J0
Y19hZGQoc3RydWN0IGtvbWVkYV9rbXNfZGV2ICprbXMsCiAKIAljcnRjLT5wb3J0ID0ga2NydGMt
Pm1hc3Rlci0+b2Zfb3V0cHV0X3BvcnQ7CiAKKwlkcm1fY3J0Y19lbmFibGVfY29sb3JfbWdtdChj
cnRjLCAwLCB0cnVlLCBLT01FREFfQ09MT1JfTFVUX1NJWkUpOworCiAJcmV0dXJuIGVycjsKIH0K
IApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
cGlwZWxpbmUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3Bp
cGVsaW5lLmgKaW5kZXggYmQ2Y2E3Yzg3MDM3Li5hYzg3MjVlMjQ4NTMgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmgKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaApAQCAt
MTEsNiArMTEsNyBAQAogI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljLmg+CiAjaW5jbHVkZSA8ZHJt
L2RybV9hdG9taWNfaGVscGVyLmg+CiAjaW5jbHVkZSAibWFsaWRwX3V0aWxzLmgiCisjaW5jbHVk
ZSAia29tZWRhX2NvbG9yX21nbXQuaCIKIAogI2RlZmluZSBLT01FREFfTUFYX1BJUEVMSU5FUwkJ
MgogI2RlZmluZSBLT01FREFfUElQRUxJTkVfTUFYX0xBWUVSUwk0CkBAIC0zMjcsNiArMzI4LDgg
QEAgc3RydWN0IGtvbWVkYV9pbXByb2Nfc3RhdGUgewogCXN0cnVjdCBrb21lZGFfY29tcG9uZW50
X3N0YXRlIGJhc2U7CiAJdTggY29sb3JfZm9ybWF0LCBjb2xvcl9kZXB0aDsKIAl1MTYgaHNpemUs
IHZzaXplOworCXUzMiBmZ2FtbWFfY29lZmZzW0tPTUVEQV9OX0dBTU1BX0NPRUZGU107CisJdTMy
IGN0bV9jb2VmZnNbS09NRURBX05fQ1RNX0NPRUZGU107CiB9OwogCiAvKiBkaXNwbGF5IHRpbWlu
ZyBjb250cm9sbGVyICovCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYwppbmRleCA0MmJkYzYzZGNmZmEuLjA5
MzAyMzRhYmI5ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jCkBAIC04MDIsNiArODAyLDEyIEBAIGtv
bWVkYV9pbXByb2NfdmFsaWRhdGUoc3RydWN0IGtvbWVkYV9pbXByb2MgKmltcHJvYywKIAkJc3Qt
PmNvbG9yX2Zvcm1hdCA9IEJJVChfX2ZmcyhhdmFpbF9mb3JtYXRzKSk7CiAJfQogCisJaWYgKGtj
cnRjX3N0LT5iYXNlLmNvbG9yX21nbXRfY2hhbmdlZCkgeworCQlkcm1fbHV0X3RvX2ZnYW1tYV9j
b2VmZnMoa2NydGNfc3QtPmJhc2UuZ2FtbWFfbHV0LAorCQkJCQkgc3QtPmZnYW1tYV9jb2VmZnMp
OworCQlkcm1fY3RtX3RvX2NvZWZmcyhrY3J0Y19zdC0+YmFzZS5jdG0sIHN0LT5jdG1fY29lZmZz
KTsKKwl9CisKIAlrb21lZGFfY29tcG9uZW50X2FkZF9pbnB1dCgmc3QtPmJhc2UsICZkZmxvdy0+
aW5wdXQsIDApOwogCWtvbWVkYV9jb21wb25lbnRfc2V0X291dHB1dCgmZGZsb3ctPmlucHV0LCAm
aW1wcm9jLT5iYXNlLCAwKTsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
