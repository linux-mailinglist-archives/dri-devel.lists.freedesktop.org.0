Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5106327A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:57:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2050F8936E;
	Tue,  9 Jul 2019 07:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20044.outbound.protection.outlook.com [40.107.2.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FF58936E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 07:57:21 +0000 (UTC)
Received: from AM4PR08CA0055.eurprd08.prod.outlook.com (2603:10a6:205:2::26)
 by VI1PR0802MB2607.eurprd08.prod.outlook.com (2603:10a6:800:b9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.19; Tue, 9 Jul
 2019 07:57:17 +0000
Received: from VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::205) by AM4PR08CA0055.outlook.office365.com
 (2603:10a6:205:2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.18 via Frontend
 Transport; Tue, 9 Jul 2019 07:57:16 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT007.mail.protection.outlook.com (10.152.18.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 9 Jul 2019 07:57:15 +0000
Received: ("Tessian outbound a1cd17a9f69b:v23");
 Tue, 09 Jul 2019 07:57:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 03038269163b7d30
X-CR-MTA-TID: 64aa7808
Received: from c78b36e33537.2 (cr-mta-lb-1.cr-mta-net [104.47.0.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CA6CCEF2-7370-4625-B2E9-28D8EFB98D99.1; 
 Tue, 09 Jul 2019 07:57:06 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c78b36e33537.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 09 Jul 2019 07:57:06 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4816.eurprd08.prod.outlook.com (10.255.112.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Tue, 9 Jul 2019 07:57:02 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1%3]) with mapi id 15.20.2032.019; Tue, 9 Jul 2019
 07:57:02 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH 0/2] drm/komeda: Add new product "D32" support
Thread-Topic: [PATCH 0/2] drm/komeda: Add new product "D32" support
Thread-Index: AQHVNivkfsTufjYJCUi/AKchas7bNw==
Date: Tue, 9 Jul 2019 07:57:02 +0000
Message-ID: <20190709075640.22012-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2P15301CA0001.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::11) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f9307d14-c8fb-49a1-11f1-08d704430eae
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4816; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4816:|VI1PR0802MB2607:
X-Microsoft-Antispam-PRVS: <VI1PR0802MB26078A937B9F9296F8D86849B3F10@VI1PR0802MB2607.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3173;OLM:3173;
x-forefront-prvs: 0093C80C01
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(189003)(199004)(66066001)(305945005)(7736002)(2201001)(64756008)(8676002)(81156014)(81166006)(66946007)(73956011)(66446008)(1076003)(8936002)(186003)(66556008)(86362001)(54906003)(110136005)(66476007)(55236004)(386003)(316002)(6506007)(102836004)(71190400001)(71200400001)(52116002)(5660300002)(14454004)(6436002)(103116003)(68736007)(3846002)(6116002)(478600001)(4326008)(36756003)(25786009)(6486002)(53936002)(4744005)(99286004)(6512007)(50226002)(26005)(2501003)(256004)(486006)(14444005)(2906002)(2616005)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4816;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: HMZpwUTooPbtR5CSW8TMznPu91DtTTAmZbAMF2m99zM4qz4tj14nnDPBcvgekuSuXnHoJpFk3lS26OkKgDHW6D39wLgHYjCd5qry4Q0JLG9kTkJSTKuXUVYPuXMfuz5cz8JzWbiYqOiCqCAlnry7K+wtkDDzUCyQ2rRj/n9Y2CKCzV7u+PGsc1pbN1q5k22M3ZV4WMACFKXDnTNSKojcMVru0WNh3LsF7ebu2+8LBf/pAuQzXkyFS+YPzUvkMWps8z2ibq5WRAC9+jqpAE6hXR1puwR1euqYUIFkyvxBWl3XGCbhLsizE40T1OTygkFxq8cevhJw64e4zsCRIBygF4B/zDUrPw4oZNI7kh+gIlc66Nl45oRUY9UpPlzOvubvyOeGUqCO1GcSiY25klSrsNwTf1Boj9G9WfNrWf8vIuI=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4816
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(136003)(396003)(2980300002)(189003)(199004)(186003)(5660300002)(6486002)(4744005)(66066001)(22756006)(81166006)(81156014)(8676002)(70206006)(70586007)(2501003)(99286004)(1076003)(3846002)(7736002)(6512007)(47776003)(336012)(478600001)(26826003)(103116003)(486006)(476003)(126002)(6116002)(305945005)(23756003)(14454004)(2906002)(63370400001)(63350400001)(8936002)(25786009)(2201001)(8746002)(2616005)(316002)(50226002)(36906005)(50466002)(14444005)(26005)(36756003)(102836004)(76130400001)(6506007)(386003)(86362001)(110136005)(4326008)(54906003)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2607;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: c08669e5-92c6-4387-801f-08d7044306b0
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0802MB2607; 
NoDisclaimer: True
X-Forefront-PRVS: 0093C80C01
X-Microsoft-Antispam-Message-Info: LnFCinsU4BaohvoCagzGr5rFOq1Fy0COyzdZ0g49s8ZAAHlUX+Eo9UUQA/+Ofw3xJQQpMmLCbfd092++5pYKxKbE3zanAkw6Wg4Wc8otQ/BbTSoRzbTidwkmJ2tvP9P94DsdYhqW/fU7PYCgurk+kco08hheI/Duzi7nzyJz4mSOhuHzsNqOPfKFlt4NmRDE/FJT8hAH82wo+9WBgTeyaEFYaSay7iX/VvyyxBx8x1EH9yHj6KgbvgfyWve21O3T5cQUnd0U2n9tXTlOt+/knREdMJY5xaYdljtfzFRzhilggJCGGzN/PwHXoYtIs2REw6pZKYOE6XAeuRff2GyQF0RJ/MVWbjJMXuQRXkyuZCKtDe068aGQ8Ev9uI/9d3rbMD0zipIhsF2TGoZ9w2KqZCk1hexV0aHKiP5/T3eDFsQ=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2019 07:57:15.0532 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9307d14-c8fb-49a1-11f1-08d704430eae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2607
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9SHeghH8YsF/Lbm6khjeKdt4e0RMCnaqrZAcIjzcA0=;
 b=OtEuElw9saz0MOZsHtpTrG0zvkOMmpL56V7Ua20lX/X4wBEt6NJSARtDNh0PZSd61xEHhtU9aBanmOHJOwZPl5iCen2sR5dzI/H5zqeYxkSIgB2Da7I8oETBpjdnvM6hHO+r7gmDcYjE0crr4+D4q/PEqOx2KYuawAFaXVLKK1k=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9SHeghH8YsF/Lbm6khjeKdt4e0RMCnaqrZAcIjzcA0=;
 b=OtEuElw9saz0MOZsHtpTrG0zvkOMmpL56V7Ua20lX/X4wBEt6NJSARtDNh0PZSd61xEHhtU9aBanmOHJOwZPl5iCen2sR5dzI/H5zqeYxkSIgB2Da7I8oETBpjdnvM6hHO+r7gmDcYjE0crr4+D4q/PEqOx2KYuawAFaXVLKK1k=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=temperror action=none header.from=arm.com;
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

VGhpcyBzZXJpZXMgZW5hYmxlcyBuZXcgcHJvZHVjdCAiRDMyIiBzdXBwb3J0CgpKYW1lcyBRaWFu
IFdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSAoMik6CiAgZHJtL2tvbWVkYTogVXBkYXRlIHRo
ZSBjaGlwIGlkZW50aWZ5CiAgZHJtL2tvbWVkYTogRW5hYmxlIG5ldyBwcm9kdWN0IEQzMiBzdXBw
b3J0CgogLi4uL2RybS9hcm0vZGlzcGxheS9pbmNsdWRlL21hbGlkcF9wcm9kdWN0LmggIHwgIDMg
Ky0KIC4uLi9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYyAgICB8ICAyICst
CiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuYyAgfCA3MCArKysr
KysrKysrKysrLS0tLS0tCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9y
ZWdzLmggfCAxMyArKysrCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rl
di5jICAgfCA2MiArKysrKysrKy0tLS0tLS0tCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2Rldi5oICAgfCAxNCArLS0tCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2Rydi5jICAgfCAxMCArLS0KIDcgZmlsZXMgY2hhbmdlZCwgMTA0IGluc2VydGlv
bnMoKyksIDcwIGRlbGV0aW9ucygtKQoKLS0KMi4yMC4xCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
