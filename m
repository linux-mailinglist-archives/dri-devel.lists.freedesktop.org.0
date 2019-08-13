Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 115098AE31
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 06:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F3E6E634;
	Tue, 13 Aug 2019 04:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10070.outbound.protection.outlook.com [40.107.1.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7051D6E634
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 04:56:30 +0000 (UTC)
Received: from DB7PR08CA0065.eurprd08.prod.outlook.com (20.176.237.170) by
 HE1PR0802MB2604.eurprd08.prod.outlook.com (10.175.32.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Tue, 13 Aug 2019 04:56:26 +0000
Received: from DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::208) by DB7PR08CA0065.outlook.office365.com
 (2603:10a6:10:26::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.18 via Frontend
 Transport; Tue, 13 Aug 2019 04:56:26 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT012.mail.protection.outlook.com (10.152.20.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 13 Aug 2019 04:56:24 +0000
Received: ("Tessian outbound 40a263b748b4:v26");
 Tue, 13 Aug 2019 04:56:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c98b36d8a0807742
X-CR-MTA-TID: 64aa7808
Received: from 72c8a93d845b.2 (cr-mta-lb-1.cr-mta-net [104.47.2.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 823FA6D8-80AB-4B6F-AD61-678636BDA14C.1; 
 Tue, 13 Aug 2019 04:56:16 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 72c8a93d845b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 13 Aug 2019 04:56:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aDs23oBNL4yiNYf6D2k6EzSKCvmPrz1ssPg1aWeYfShSyX5V1fsCrakxMaXl7zHkBKI/xvpBSNdShN7D/ipDmPJ7ZxWd5/s+HXaVjyVsG60MJw8C9daI2gWAbP4ERgF6CByJ0uTzShMDHFcEKkSRx7x3zw3+AgOh4+h7gkL/OQUNE+UfHLyxMONi3487aKb0p5Ni2vLOlOquH7l6Vg5/RfLsVErbJ2+YwQ1TnIUfNDSWw5eBCA2m/J5hGp7Nov9Nug+/5uriNlxcuSi7Hb9ZAOZ2Knxlxo7SJK7X3b+04Oa744e34dZnxjRiV+h5qQv4fWNLNq07JyYjY+AohnE4fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+0u85TYIqzebZPwRrp3l710GQKtayDKSXGIPRoI9M0=;
 b=gmvtb98YUejL9TfRKWAoD0CyfQJuMXXU7T4NR0FELOkMm9v+/kJSJJnKOMeTKcRbVL/skJ5Mhv9MnYR5hOl7eTz/i8Sooi1lBLcNDY2tTYaqP/ELQR4eDJQ2HKVhOMjVtYyOTpMjtmUFJfqF3IBIu9LHWhT7dZ9kiliWPYV/CvqKd9BWZk91nchenjBE8avWMoas971aC3dnzQGvkbUUkUP7Emc1nlvNb/DA4nANt4zmVcRsha33Fbi+mSbcjk1NwTzU0xZl9zFPvls03WhEHuEIUNfM5M9i73acZi8ax3PJQvzZi2h6O7ClxAA3SaAX8uDfbiv8GDZoLkpZYl3d2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4752.eurprd08.prod.outlook.com (10.255.112.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Tue, 13 Aug 2019 04:56:13 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134%6]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 04:56:13 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH v2 3/4] drm: Increase DRM_OBJECT_MAX_PROPERTY to 32
Thread-Topic: [PATCH v2 3/4] drm: Increase DRM_OBJECT_MAX_PROPERTY to 32
Thread-Index: AQHVUZNuExuVOSGvIUuvlOEBz51WoQ==
Date: Tue, 13 Aug 2019 04:56:13 +0000
Message-ID: <20190813045536.28239-4-james.qian.wang@arm.com>
References: <20190813045536.28239-1-james.qian.wang@arm.com>
In-Reply-To: <20190813045536.28239-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0070.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::34) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d8a03e7d-04f1-4045-7e1b-08d71faa97d3
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4752; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4752:|HE1PR0802MB2604:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0802MB26049D25479DC260CFFB1F53B3D20@HE1PR0802MB2604.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3383;OLM:3383;
x-forefront-prvs: 01283822F8
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(366004)(346002)(396003)(199004)(189003)(50226002)(5660300002)(2201001)(110136005)(26005)(316002)(66066001)(6116002)(3846002)(305945005)(2906002)(7736002)(103116003)(71190400001)(71200400001)(4744005)(8676002)(1076003)(54906003)(446003)(55236004)(66946007)(478600001)(81156014)(14454004)(386003)(6506007)(4326008)(36756003)(52116002)(2616005)(102836004)(25786009)(256004)(11346002)(14444005)(81166006)(186003)(76176011)(6486002)(64756008)(66556008)(66476007)(99286004)(2501003)(6512007)(6436002)(86362001)(66446008)(8936002)(486006)(476003)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4752;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: ReEIy0SpfB0bF4e+4ch+ModvRHJLMrbASfNAdfw0U/nxFdLFd/XK9d9difLEnNdTPSFC6glpj+HbA8++5XV94N3iOrUCrFrYXEk4jcqVTfB/UGi1pSxXfaFobgqNty8Ph9ueYMkGcmiViTfvbq/lVm+pYysyzuQ1Yr+syLRHcfQME3qciqOxmz/KxC6X3nIIcKAbGc30Rtq001r1Fo3OdJC0W2DC53ro4bOfKUoXi/nMs6XmpdaCB6vnEL3OzjX4FaMRU2iPsoshp4gtp0kR1MuOmwEPEMO0iIjyudosji6j38ONfKUXFZR/bNilSyLOG0nhyz884rqKbMWxVnZ+grUn3G9/stjYrT0vaYkuos2w3bVN4joL3E5/43UuYFmQODOtUDFKFCF/T5U0gxS2tjrdl6DImjZiVMeNJnWZkIc=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4752
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(136003)(346002)(2980300002)(189003)(199004)(5660300002)(14454004)(50466002)(26826003)(23756003)(70586007)(356004)(4744005)(70206006)(103116003)(1076003)(478600001)(76130400001)(22756006)(6116002)(3846002)(316002)(8676002)(54906003)(110136005)(186003)(336012)(7736002)(81166006)(8746002)(81156014)(6486002)(386003)(6506007)(8936002)(102836004)(50226002)(305945005)(446003)(486006)(76176011)(47776003)(26005)(66066001)(99286004)(14444005)(2616005)(2501003)(4326008)(25786009)(86362001)(2906002)(36756003)(63370400001)(2201001)(11346002)(63350400001)(476003)(6512007)(126002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0802MB2604;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4c508d22-354b-495e-4a79-08d71faa90ee
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:HE1PR0802MB2604; 
NoDisclaimer: True
X-Forefront-PRVS: 01283822F8
X-Microsoft-Antispam-Message-Info: G/kH8JtBOp+wdE8EDYsLqPbkO9atkkVh9uGyGYaLRk/V4tnJVEr+ca71mfqH2ZBykhvYXxCiDr/Yxq3o/+Bo5tzUyD0I2XlQPIWN36Bl1vJ3/t3G/f/lEFTMn3s1xkRCDXFOVwrGw8+QClLnYxKl4y4stZ12niqWpRdyd92uk8d2HblZ/0f8xKi6U+Ewlkaa9hg4PyLnzIrWxrCfKh3DzGv4lLCSFKmgmBHN67MNJBOjCMYjLPxaCx5oxgQXUxDKMoeW69GywvMOUy1dBO2nnzrIMdVWnA4OuWwrT+RKBt5gloAamYYFuQy3xmGCPfXIa6Bo+BMiI0kxCayPuuTWG/TSFgKvNyKJujxIrgplqpwERLIIRN8nfZqqmQsoh1X76sDBG+s2WcfZs4/EOk43//PQhbNJ11tJTqs2iXct3BA=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2019 04:56:24.7795 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a03e7d-04f1-4045-7e1b-08d71faa97d3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2604
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+0u85TYIqzebZPwRrp3l710GQKtayDKSXGIPRoI9M0=;
 b=KQ8nSjUMsPy0YMldoGAAxWKGCgZe+Ri+ckkDtD5KPAn50uBDPJlRtwSNBDBMUdCwk3V+GcOmbRsEJ54yYkIx6v9amadXBp9zI2K6/+Vc0mqgkWtUGmJWoTw3NriSvh7+MYVXxy6nrnE15M8he/FJCHpnqvq/PXuW1o7rA0YEo04=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+0u85TYIqzebZPwRrp3l710GQKtayDKSXGIPRoI9M0=;
 b=KQ8nSjUMsPy0YMldoGAAxWKGCgZe+Ri+ckkDtD5KPAn50uBDPJlRtwSNBDBMUdCwk3V+GcOmbRsEJ54yYkIx6v9amadXBp9zI2K6/+Vc0mqgkWtUGmJWoTw3NriSvh7+MYVXxy6nrnE15M8he/FJCHpnqvq/PXuW1o7rA0YEo04=
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
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RFJNX09CSkVDVF9NQVhfUFJPUEVSVFkgbnVtYmVyIDI0IGlzIG5vdCBlbm91Z2ggZm9yIGtvbWVk
YSB1c2FnZSwgaW5jcmVhc2UKaXQgdG8gMzIgdG8gZml0IGtvbWVkYSdzIHJlcXVpcmVtZW50LgoK
U2lnbmVkLW9mZi1ieTogSmFtZXMgUWlhbiBXYW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGph
bWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgotLS0KIGluY2x1ZGUvZHJtL2RybV9tb2RlX29iamVjdC5o
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX21vZGVfb2JqZWN0LmggYi9pbmNsdWRlL2RybS9k
cm1fbW9kZV9vYmplY3QuaAppbmRleCBjMzRhM2U4MDMwZTEuLmZkNzY2NjA0ODE5NyAxMDA2NDQK
LS0tIGEvaW5jbHVkZS9kcm0vZHJtX21vZGVfb2JqZWN0LmgKKysrIGIvaW5jbHVkZS9kcm0vZHJt
X21vZGVfb2JqZWN0LmgKQEAgLTYwLDcgKzYwLDcgQEAgc3RydWN0IGRybV9tb2RlX29iamVjdCB7
CiAJdm9pZCAoKmZyZWVfY2IpKHN0cnVjdCBrcmVmICprcmVmKTsKIH07CiAKLSNkZWZpbmUgRFJN
X09CSkVDVF9NQVhfUFJPUEVSVFkgMjQKKyNkZWZpbmUgRFJNX09CSkVDVF9NQVhfUFJPUEVSVFkg
MzIKIC8qKgogICogc3RydWN0IGRybV9vYmplY3RfcHJvcGVydGllcyAtIHByb3BlcnR5IHRyYWNr
aW5nIGZvciAmZHJtX21vZGVfb2JqZWN0CiAgKi8KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
