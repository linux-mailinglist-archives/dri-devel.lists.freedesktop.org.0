Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F77E125D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 08:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370266E960;
	Wed, 23 Oct 2019 06:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130043.outbound.protection.outlook.com [40.107.13.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFE76E960
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 06:43:16 +0000 (UTC)
Received: from VI1PR08CA0158.eurprd08.prod.outlook.com (2603:10a6:800:d1::12)
 by VI1PR0801MB1983.eurprd08.prod.outlook.com (2603:10a6:800:86::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Wed, 23 Oct
 2019 06:43:12 +0000
Received: from AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::207) by VI1PR08CA0158.outlook.office365.com
 (2603:10a6:800:d1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.20 via Frontend
 Transport; Wed, 23 Oct 2019 06:43:12 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT041.mail.protection.outlook.com (10.152.17.186) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.23 via Frontend Transport; Wed, 23 Oct 2019 06:43:11 +0000
Received: ("Tessian outbound e4042aced47b:v33");
 Wed, 23 Oct 2019 06:43:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3f0e5afd2a6b8878
X-CR-MTA-TID: 64aa7808
Received: from b8d509519dc2.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.8.51]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9F5E5C31-FCD1-401F-B28B-E7595C5FECF3.1; 
 Wed, 23 Oct 2019 06:43:04 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2051.outbound.protection.outlook.com [104.47.8.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b8d509519dc2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 23 Oct 2019 06:43:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDD9eDug6PJPtn+KoeO51N8Wir4M8XEPu5iEO6Z9CjxnUkVSAja7lv6IHfqomdOjV2IVFe0mA0lwl2R+CVmTCJO4I4Tn2UREnzU4lbvZchnaz48B1+upshLUXsnkzpcJ6Xi03/I5JdfbNsLDyTKyF2jHmCkZgNGIiJKVQ+MvJEVtRpcX+AnjHWYgqVLbBmFA18pfwEgmnF2t22AgZCtojN41pKPaTUN1UeYXLHsv+wLM+6s/A2I7gl1X7ZsvI/0Jl1jOLpqa5v5mTEPnHq5veDSeUqktXUsm2B2wB8ibLbFK0OVJYoi+86v6d271r3TpMimJ53kBBOb+xui1MSTMtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dwl4JXh3gudDNqqnWSO4qmhHyZFD7hivyUxQxR0plGY=;
 b=GyQRI8z9pe3mJbbOdfyj+Oa1YD8Y+oWJPEoPS0UvH7db+Z856MyzCNPWLD/2yBkfJhnt8g0gmNm55t9St3r4/wVr5jn7WIcOrRnxS5XWxGTyd0nOVDuyQzhLaOIA5G5B3k+8AWBRGbCCpgd6iNwLkH0LbnANjzCaFPipru4imU7KB/j6UCOHOnW+LOGtqiFzpS3xoXsVGQZjZPzU7rkdJrmLliCy3hhsfiHuxjecISOOvEmr05dVR0HGTKpNoHGHF8igQsk71sixmYEZ1e3sEEOYSkmtwoetcOMt29HrseFDfWF481mCCCNjPvJwny7oo9aL09pI7gmYCvlDSxjkRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4672.eurprd08.prod.outlook.com (10.255.112.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.22; Wed, 23 Oct 2019 06:43:03 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2367.022; Wed, 23 Oct 2019
 06:43:03 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>
Subject: [PATCH v7 2/4] drm/komeda: Add drm_lut_to_fgamma_coeffs()
Thread-Topic: [PATCH v7 2/4] drm/komeda: Add drm_lut_to_fgamma_coeffs()
Thread-Index: AQHViW0eTRzKlLORfEigId1iRu45AQ==
Date: Wed, 23 Oct 2019 06:43:02 +0000
Message-ID: <20191023064226.10969-3-james.qian.wang@arm.com>
References: <20191023064226.10969-1-james.qian.wang@arm.com>
In-Reply-To: <20191023064226.10969-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0184.apcprd02.prod.outlook.com
 (2603:1096:201:21::20) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9769c705-54d7-4ec0-3a43-08d757844615
X-MS-TrafficTypeDiagnostic: VE1PR08MB4672:|VE1PR08MB4672:|VI1PR0801MB1983:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0801MB1983E621A4E60EA2B2690216B36B0@VI1PR0801MB1983.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2043;OLM:2043;
x-forefront-prvs: 019919A9E4
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(189003)(199004)(7736002)(25786009)(2906002)(386003)(71200400001)(4326008)(36756003)(305945005)(6506007)(66066001)(2201001)(71190400001)(102836004)(5660300002)(26005)(478600001)(52116002)(14444005)(55236004)(316002)(86362001)(186003)(6116002)(76176011)(3846002)(256004)(2171002)(66446008)(66946007)(103116003)(64756008)(6512007)(1076003)(66556008)(50226002)(66476007)(476003)(6436002)(8936002)(446003)(2501003)(11346002)(2616005)(6486002)(14454004)(486006)(54906003)(99286004)(81166006)(8676002)(81156014)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4672;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: fp4LKsL/+am5Me5BtVSYezdXE3Pvjta396ABbaGdtnmlhEFfrm9ZG/QnHoLenEt+jEimTK9cBFinTT+hHZLMv2ttu2sRMapNc7INeqyTGCCqF2YR8y+OGdc8PRq6X9HlzE8lQEf8j8rrIZt1ISqBmQd0g5irLxc1ImuMmCSKWJLBaCZJGORUa9ULdnRdjslQFImr/gZzUno+D+G8zY+xBgfema6d8j5D7fX8XDbfnW5bQdDTdl4Ry8PTlkuXGgQMxYRAlPGPGjPbcdcWlJ9eBA9fSUCX5UhDQzWUjxMsydf1IafvEKJ4bdz2gnPfGHR27XIc9HTlYkx8n/7IZWdhfbF5yvjCQNSx6TPFqIhdvQNYryG3C8Dgc6sY+YphfqOT7tbPByvazBsd3nudBn1Jk640qHDQzuhcbaX8/2ZnLZ4=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4672
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(39860400002)(396003)(1110001)(339900001)(199004)(189003)(70586007)(81156014)(8746002)(22756006)(356004)(8676002)(305945005)(70206006)(66066001)(7736002)(81166006)(8936002)(1076003)(2906002)(50226002)(76130400001)(5660300002)(47776003)(25786009)(105606002)(2501003)(86362001)(14444005)(2201001)(76176011)(50466002)(476003)(186003)(36756003)(110136005)(446003)(2616005)(23756003)(6512007)(103116003)(336012)(54906003)(6506007)(26826003)(6116002)(102836004)(26005)(316002)(99286004)(36906005)(386003)(6486002)(2171002)(478600001)(486006)(14454004)(4326008)(11346002)(126002)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0801MB1983;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: c5eac636-4a83-4e9b-00c1-08d757844098
NoDisclaimer: True
X-Forefront-PRVS: 019919A9E4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q1tA56erTzaaT9yVi6L3Iu2yMRWbWTGlpuHSAsstEIl6rUFTfLmEnImS1M17zP8QH3P0leU00mDc9LSnnTzRF02BzEiUMF+vhMamOql4EQiIx8CfV7bgIrDR8tRJ359+cH8CmEWww9B5NwPREVmaHSSr9DBt2DbpFOigXKD22oSjKds9P9eHZFbp96Id5rd8wRY7ZbMwapmqFMTiuau0jiwebpbZ/+kxA07wExmngiKIPM2MhYi81WPu4GnWQoSC1zALy/9btd+GH69kWgjkzmiBfrKLfsyZR3MZGyEnOIywgI8kbUTsNR5Okq+GcGE7oVFRldVecGfRUYA6DuwLIr4Gf0GLVvBHDCYbbuGkBICE5RCR8jkFIozaCQZR61Q/5z4XnfbGCSLarkBuTPLARGQpUYoRXRUTrBAskMsUmAedvD8Guv58WzQ9JcH1aYCw
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2019 06:43:11.8749 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9769c705-54d7-4ec0-3a43-08d757844615
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1983
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dwl4JXh3gudDNqqnWSO4qmhHyZFD7hivyUxQxR0plGY=;
 b=qAJ9pAUPPZGyS6WwxCPJincnvsW7AubD4Iib93fcAyAI7tFhmd5zFdT0g2Xc04me9EVY+E/naL+I2OAzzRHVm0NRN6zfJT8zGObGLUMlO9ao3Zw1FqXZIa/cjMCbZeidLTYdoEEJDtqn6CIjZHIDz9n8DX1fWFgFYzNaBrpz3L8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dwl4JXh3gudDNqqnWSO4qmhHyZFD7hivyUxQxR0plGY=;
 b=qAJ9pAUPPZGyS6WwxCPJincnvsW7AubD4Iib93fcAyAI7tFhmd5zFdT0g2Xc04me9EVY+E/naL+I2OAzzRHVm0NRN6zfJT8zGObGLUMlO9ao3Zw1FqXZIa/cjMCbZeidLTYdoEEJDtqn6CIjZHIDz9n8DX1fWFgFYzNaBrpz3L8=
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

VGhpcyBmdW5jdGlvbiBpcyB1c2VkIHRvIGNvbnZlcnQgZHJtIGNvbG9yIGx1dCB0byBrb21lZGEg
SFcgcmVxdWlyZWQgY3VydmUKY29lZmZzIHZhbHVlcy4KClNpZ25lZC1vZmYtYnk6IGphbWVzIHFp
YW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4K
UmV2aWV3ZWQtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4K
LS0tCiAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMgICAgfCA1MiAr
KysrKysrKysrKysrKysrKysrCiAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9t
Z210LmggICAgfCAgOSArKystCiAyIGZpbGVzIGNoYW5nZWQsIDYwIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMKaW5kZXggOWQxNGE5MmRiYjE3Li5jMTgwY2U3MGMyNmMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Nv
bG9yX21nbXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9jb2xvcl9tZ210LmMKQEAgLTY1LDMgKzY1LDU1IEBAIGNvbnN0IHMzMiAqa29tZWRhX3NlbGVj
dF95dXYycmdiX2NvZWZmcyh1MzIgY29sb3JfZW5jb2RpbmcsIHUzMiBjb2xvcl9yYW5nZSkKIAog
CXJldHVybiBjb2VmZnM7CiB9CisKK3N0cnVjdCBnYW1tYV9jdXJ2ZV9zZWN0b3IgeworCXUzMiBi
b3VuZGFyeV9zdGFydDsKKwl1MzIgbnVtX29mX3NlZ21lbnRzOworCXUzMiBzZWdtZW50X3dpZHRo
OworfTsKKworc3RydWN0IGdhbW1hX2N1cnZlX3NlZ21lbnQgeworCXUzMiBzdGFydDsKKwl1MzIg
ZW5kOworfTsKKworc3RhdGljIHN0cnVjdCBnYW1tYV9jdXJ2ZV9zZWN0b3Igc2VjdG9yX3RibFtd
ID0geworCXsgMCwgICAgNCwgIDQgICB9LAorCXsgMTYsICAgNCwgIDQgICB9LAorCXsgMzIsICAg
NCwgIDggICB9LAorCXsgNjQsICAgNCwgIDE2ICB9LAorCXsgMTI4LCAgNCwgIDMyICB9LAorCXsg
MjU2LCAgNCwgIDY0ICB9LAorCXsgNTEyLCAgMTYsIDMyICB9LAorCXsgMTAyNCwgMjQsIDEyOCB9
LAorfTsKKworc3RhdGljIHZvaWQKK2RybV9sdXRfdG9fY29lZmZzKHN0cnVjdCBkcm1fcHJvcGVy
dHlfYmxvYiAqbHV0X2Jsb2IsIHUzMiAqY29lZmZzLAorCQkgIHN0cnVjdCBnYW1tYV9jdXJ2ZV9z
ZWN0b3IgKnNlY3Rvcl90YmwsIHUzMiBudW1fc2VjdG9ycykKK3sKKwlzdHJ1Y3QgZHJtX2NvbG9y
X2x1dCAqbHV0OworCXUzMiBpLCBqLCBpbiwgbnVtID0gMDsKKworCWlmICghbHV0X2Jsb2IpCisJ
CXJldHVybjsKKworCWx1dCA9IGx1dF9ibG9iLT5kYXRhOworCisJZm9yIChpID0gMDsgaSA8IG51
bV9zZWN0b3JzOyBpKyspIHsKKwkJZm9yIChqID0gMDsgaiA8IHNlY3Rvcl90YmxbaV0ubnVtX29m
X3NlZ21lbnRzOyBqKyspIHsKKwkJCWluID0gc2VjdG9yX3RibFtpXS5ib3VuZGFyeV9zdGFydCAr
CisJCQkgICAgIGogKiBzZWN0b3JfdGJsW2ldLnNlZ21lbnRfd2lkdGg7CisKKwkJCWNvZWZmc1tu
dW0rK10gPSBkcm1fY29sb3JfbHV0X2V4dHJhY3QobHV0W2luXS5yZWQsCisJCQkJCQlLT01FREFf
Q09MT1JfUFJFQ0lTSU9OKTsKKwkJfQorCX0KKworCWNvZWZmc1tudW1dID0gQklUKEtPTUVEQV9D
T0xPUl9QUkVDSVNJT04pOworfQorCit2b2lkIGRybV9sdXRfdG9fZmdhbW1hX2NvZWZmcyhzdHJ1
Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmx1dF9ibG9iLCB1MzIgKmNvZWZmcykKK3sKKwlkcm1fbHV0
X3RvX2NvZWZmcyhsdXRfYmxvYiwgY29lZmZzLCBzZWN0b3JfdGJsLCBBUlJBWV9TSVpFKHNlY3Rv
cl90YmwpKTsKK30KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2NvbG9yX21nbXQuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2NvbG9yX21nbXQuaAppbmRleCBhMmRmMjE4ZjU4ZTcuLjA4YWI2OTI4MTY0OCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29s
b3JfbWdtdC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2NvbG9yX21nbXQuaApAQCAtMTEsNyArMTEsMTQgQEAKICNpbmNsdWRlIDxkcm0vZHJtX2NvbG9y
X21nbXQuaD4KIAogI2RlZmluZSBLT01FREFfTl9ZVVYyUkdCX0NPRUZGUwkJMTIKKyNkZWZpbmUg
S09NRURBX05fUkdCMllVVl9DT0VGRlMJCTEyCisjZGVmaW5lIEtPTUVEQV9DT0xPUl9QUkVDSVNJ
T04JCTEyCisjZGVmaW5lIEtPTUVEQV9OX0dBTU1BX0NPRUZGUwkJNjUKKyNkZWZpbmUgS09NRURB
X0NPTE9SX0xVVF9TSVpFCQlCSVQoS09NRURBX0NPTE9SX1BSRUNJU0lPTikKKyNkZWZpbmUgS09N
RURBX05fQ1RNX0NPRUZGUwkJOQorCit2b2lkIGRybV9sdXRfdG9fZmdhbW1hX2NvZWZmcyhzdHJ1
Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmx1dF9ibG9iLCB1MzIgKmNvZWZmcyk7CiAKIGNvbnN0IHMz
MiAqa29tZWRhX3NlbGVjdF95dXYycmdiX2NvZWZmcyh1MzIgY29sb3JfZW5jb2RpbmcsIHUzMiBj
b2xvcl9yYW5nZSk7CiAKLSNlbmRpZgorI2VuZGlmIC8qX0tPTUVEQV9DT0xPUl9NR01UX0hfKi8K
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
