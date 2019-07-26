Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBAF76040
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 10:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBBA6E89D;
	Fri, 26 Jul 2019 08:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70054.outbound.protection.outlook.com [40.107.7.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D986E89D
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 08:00:51 +0000 (UTC)
Received: from VI1PR08CA0183.eurprd08.prod.outlook.com (10.175.227.141) by
 HE1PR0801MB1850.eurprd08.prod.outlook.com (10.168.149.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Fri, 26 Jul 2019 08:00:46 +0000
Received: from AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::209) by VI1PR08CA0183.outlook.office365.com
 (2603:10a6:800:d2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2115.14 via Frontend
 Transport; Fri, 26 Jul 2019 08:00:46 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT058.mail.protection.outlook.com (10.152.17.48) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Fri, 26 Jul 2019 08:00:44 +0000
Received: ("Tessian outbound a1fd2c3cfdb0:v26");
 Fri, 26 Jul 2019 08:00:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2c38f58e915841d2
X-CR-MTA-TID: 64aa7808
Received: from f8d90f083fa6.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.1.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6DB61585-75E7-4C17-A824-73EFA900CB4B.1; 
 Fri, 26 Jul 2019 08:00:32 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2053.outbound.protection.outlook.com [104.47.1.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f8d90f083fa6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 26 Jul 2019 08:00:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I18vSTr9RFkgDUFEbMrSGGKiQG1tmrtjLibT3KeRi5qeuQPQuWxQTFy6dJ5NSNTwvJYHNDAjHO/so18/92ONVRsQmR+wMpXJHJw/+GO0bGKmlDnpy8a6H091ec4K9Y2GsHrC43zhtaYmVSxR7hXEVtDPP0uht9Bd6B8p89CKQJzxglnvrLkfcTUViRiwI+hZylvjCiQh4OOnorWzZkLrxT9dFf6zCy461o49ynLskH6eE6dTPWt1fSS2uzlbtMCkXo6ia2GQ7z+V+FV3/icv3X7KibK21ZrrQqlc4p2FqweCjU6UJcPHrViLIweSqOnlUcX9qtS+KZ6svirYQtBExg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9hAvlqZY4rqQmkMA4K7pBcSzfKH1fIUQT0Yt713aek=;
 b=Dx5aIU6QYL+dhWzi0vALhn5RoYLLIp0m04tOsYJ32+SB93MpvgPOqvFu4GNVrdE/TvhHFx993cZbIcj9/r459iHBP/HUr1id5Ws7WbW3GqQhlbQ8x/ufo4Nn9NC+YJIgPKvmUq3wc47kMpYchpT8z2046CblaJmBVQgeiO2+6WjnVUtKLGT8PBzRJ1QClzQFfhz3aUTIX/mopLsBkFhyR4DYM7oA+1Wyjz+oj4p1HblBivZTXTKOaKW8jipApX2Xtdpca13V13j/n4CEoLA32T5ES4edy6bE5vdpr9munRQs8rF+grvgRlsI83oi0pr1WcAQDAqcInqavQ3V+u1oAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3853.eurprd08.prod.outlook.com (20.178.80.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.11; Fri, 26 Jul 2019 08:00:29 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236%2]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 08:00:29 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>
Subject: [PATCH] drm/komeda: Initialize and enable output polling on Komeda
Thread-Topic: [PATCH] drm/komeda: Initialize and enable output polling on
 Komeda
Thread-Index: AQHVQ4gxcUI2LA7y70qnz7F7goWSOw==
Date: Fri, 26 Jul 2019 08:00:29 +0000
Message-ID: <1564128018-22921-1-git-send-email-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0016.apcprd01.prod.exchangelabs.com
 (2603:1096:203:92::28) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ff5f8025-4789-45ad-b97c-08d7119f5cb6
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3853; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB3853:|HE1PR0801MB1850:
X-Microsoft-Antispam-PRVS: <HE1PR0801MB18505242EBB8E2D20BA764979FC00@HE1PR0801MB1850.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:389;OLM:389;
x-forefront-prvs: 01106E96F6
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(136003)(366004)(376002)(189003)(199004)(66476007)(50226002)(66446008)(52116002)(4744005)(86362001)(102836004)(55236004)(2201001)(99286004)(26005)(6512007)(110136005)(8676002)(6116002)(68736007)(186003)(25786009)(14454004)(8936002)(316002)(5660300002)(66066001)(2906002)(2501003)(305945005)(6436002)(478600001)(6636002)(36756003)(81166006)(81156014)(66556008)(4326008)(3846002)(386003)(53936002)(6506007)(7736002)(66946007)(64756008)(54906003)(71190400001)(256004)(71200400001)(486006)(476003)(2616005)(6486002)(5024004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3853;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 6PwNaH/Rs9ix0nQ8HHDRL0MndgXuFTZS8KDG5dFFK3kBsLugawUje6KqR5LObmR+WaTOfA/cB4vNGLRv8CJ8pmCI3nwbIfMzHYzVX9BHPZ/eaHs7VprTXRJyUkpMKOOEOOBcB12l3VQGgvi1R0EwmUxctUMta1Nv2KsS7dn393i9UuREWLNkeUXycU5CKM0xc1GuR0DxO7UmNarNtq4gYB/oUQJ1WvL2SmSRKdqtewKx1n/zT0DV7hpSh9qV8KImLOsTYcV1TXC2p79nZJssWazKCgIMK3yWRUdPZygNEDAt9MABM1P13agxJS5tQstmi/Z3+woF1ynUKxIP2BiBQahDU0GiRaTH96ZSfrrNSWog8XDjCe/goenIIUc0DmrIO82uVpkp/SWH/rPb1jNoPnmbrrolgGJsg+Jf9a9aJ6M=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3853
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(376002)(346002)(2980300002)(199004)(189003)(8746002)(81166006)(2906002)(8676002)(8936002)(81156014)(76130400001)(70586007)(50226002)(305945005)(22756006)(476003)(186003)(47776003)(6486002)(6512007)(86362001)(356004)(5024004)(7736002)(36756003)(3846002)(2616005)(478600001)(2501003)(102836004)(5660300002)(14454004)(63350400001)(36906005)(99286004)(386003)(50466002)(26005)(6636002)(25786009)(26826003)(6506007)(70206006)(2201001)(23756003)(63370400001)(126002)(6116002)(4326008)(486006)(54906003)(110136005)(316002)(66066001)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0801MB1850;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5d1cc015-8268-484a-7700-08d7119f5376
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:HE1PR0801MB1850; 
NoDisclaimer: True
X-Forefront-PRVS: 01106E96F6
X-Microsoft-Antispam-Message-Info: yiq1Y44XrbRQa0FyD27AieYjo0cKu1kI/aHrnvHOwZbflGvBUUXTYjHOJxkTm8hevThRLpKNrrZIsnAmW6LUXVAJFNd/dcAe9Wdew867LsBj8+etxkCb5uR5mfLcz+MX0xpp4ifG95GNw863ehNK/8tJcMCmkOmRJFbwi6hhbWEwCdAU+X/IZnu2J6d/2KD5hKz1Lt/mZBqa+oDpclDwdHXPR+64n/dYSPfQZI4W9cfx3ZHWt6wOsjiZqNVD8CdVk5X1zdxqRT0kbJ/7OM6a+2CmggGUVd8dlak/pflFtHO7myCJ109e/K8X22tj9i3jQ3+c55hp3DFZ6hpIQRHMWu2lBWPfk9DSOndx7z3ugPayqPNgoRqFV8FXcEji7Yru14wFZVew7Kjhr1UG2yTk2noak55yTBObyeokqbZsOtI=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2019 08:00:44.8375 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff5f8025-4789-45ad-b97c-08d7119f5cb6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1850
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9hAvlqZY4rqQmkMA4K7pBcSzfKH1fIUQT0Yt713aek=;
 b=VL3mOys7uIEoxYBQDSMI50MmzJ2paWB1i7DM70EVgVQeiFJNlfVfFi+zjaPC5s7Cf1Ue9qzXPYWxbT51IcnhSNvj7VvBpvHUlgAFEcbfJw4GaMPk/YnyooNPOdUCQgeRsAZIrj64EQjA6qi6r7U0pYRpDjFYKJ48Tc8Cuvy7eXg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9hAvlqZY4rqQmkMA4K7pBcSzfKH1fIUQT0Yt713aek=;
 b=VL3mOys7uIEoxYBQDSMI50MmzJ2paWB1i7DM70EVgVQeiFJNlfVfFi+zjaPC5s7Cf1Ue9qzXPYWxbT51IcnhSNvj7VvBpvHUlgAFEcbfJw4GaMPk/YnyooNPOdUCQgeRsAZIrj64EQjA6qi6r7U0pYRpDjFYKJ48Tc8Cuvy7eXg=
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, "Jonathan Chai
 \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5pdGlhbGl6ZSBhbmQgZW5hYmxlIG91dHB1dCBwb2xsaW5nIG9uIEtvbWVkYS4KClNpZ25lZC1v
ZmYtYnk6IExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGxvd3J5LmxpQGFybS5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMgfCA0
ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jCmluZGV4IDE0NjJiYWMuLjI2ZjI5
MTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2tt
cy5jCkBAIC0xNSw2ICsxNSw3IEBACiAjaW5jbHVkZSA8ZHJtL2RybV9nZW1fZnJhbWVidWZmZXJf
aGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9pcnEuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3Zi
bGFuay5oPgorI2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVyLmg+CiAKICNpbmNsdWRlICJr
b21lZGFfZGV2LmgiCiAjaW5jbHVkZSAia29tZWRhX2ZyYW1lYnVmZmVyLmgiCkBAIC0zMzEsNiAr
MzMyLDggQEAgc3RydWN0IGtvbWVkYV9rbXNfZGV2ICprb21lZGFfa21zX2F0dGFjaChzdHJ1Y3Qg
a29tZWRhX2RldiAqbWRldikKIAlpZiAoZXJyKQogCQlnb3RvIHVuaW5zdGFsbF9pcnE7CiAKKwlk
cm1fa21zX2hlbHBlcl9wb2xsX2luaXQoZHJtKTsKKwogCXJldHVybiBrbXM7CiAKIHVuaW5zdGFs
bF9pcnE6CkBAIC0zNDgsNiArMzUxLDcgQEAgdm9pZCBrb21lZGFfa21zX2RldGFjaChzdHJ1Y3Qg
a29tZWRhX2ttc19kZXYgKmttcykKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtID0gJmttcy0+YmFz
ZTsKIAlzdHJ1Y3Qga29tZWRhX2RldiAqbWRldiA9IGRybS0+ZGV2X3ByaXZhdGU7CiAKKwlkcm1f
a21zX2hlbHBlcl9wb2xsX2ZpbmkoZHJtKTsKIAltZGV2LT5mdW5jcy0+ZGlzYWJsZV9pcnEobWRl
dik7CiAJZHJtX2Rldl91bnJlZ2lzdGVyKGRybSk7CiAJZHJtX2lycV91bmluc3RhbGwoZHJtKTsK
LS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
