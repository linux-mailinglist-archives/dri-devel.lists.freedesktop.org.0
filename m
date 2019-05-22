Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FEF2601D
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 11:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C2589146;
	Wed, 22 May 2019 09:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810077.outbound.protection.outlook.com [40.107.81.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8A8890A8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 09:08:12 +0000 (UTC)
Received: from DM6PR12CA0027.namprd12.prod.outlook.com (2603:10b6:5:1c0::40)
 by DM5PR12MB1276.namprd12.prod.outlook.com (2603:10b6:3:79::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1900.17; Wed, 22 May
 2019 09:08:10 +0000
Received: from CO1NAM03FT047.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by DM6PR12CA0027.outlook.office365.com
 (2603:10b6:5:1c0::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1922.16 via Frontend
 Transport; Wed, 22 May 2019 09:08:10 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT047.mail.protection.outlook.com (10.152.81.48) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1900.16 via Frontend Transport; Wed, 22 May 2019 09:08:09 +0000
Received: from zhoucm1.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 22 May 2019
 04:08:07 -0500
From: Chunming Zhou <david1.zhou@amd.com>
To: <Christian.Koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
 <michel@daenzer.net>
Subject: [PATCH 2/2] enable syncobj test depending on capability
Date: Wed, 22 May 2019 17:08:00 +0800
Message-ID: <20190522090800.15908-2-david1.zhou@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190522090800.15908-1-david1.zhou@amd.com>
References: <20190522090800.15908-1-david1.zhou@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(396003)(346002)(376002)(2980300002)(428003)(189003)(199004)(11346002)(77096007)(53416004)(476003)(126002)(2906002)(2616005)(4326008)(36756003)(2870700001)(76176011)(7696005)(316002)(356004)(6666004)(23676004)(1076003)(70586007)(4744005)(186003)(336012)(50466002)(5660300002)(426003)(446003)(26005)(53936002)(486006)(8936002)(50226002)(5820100001)(86362001)(47776003)(68736007)(110136005)(72206003)(478600001)(8676002)(70206006)(305945005)(2201001)(81166006)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1276; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3549d0ac-6ea6-4510-b500-08d6de9502de
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM5PR12MB1276; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1276:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1276A51A0EB44662469AE87EB4000@DM5PR12MB1276.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-Forefront-PRVS: 0045236D47
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: sBD3LcNoWa0/CtF7cOv++FBlLFykz3b21QiNFz+E6Vo3cz0UTttOCT4U8OZhSJTNQQbBv7pfjxxih7z7UUZErDGKeP+/N8nqn1xDsgzM3NhLVDW8rNmN4SAm6vhXn0tQ8YNIMrzID3LyOVUawTucnwQiIUaSYL7zOAGcsoqHxgC0/0Tg6tsWGkShlvHHSjae9SyVtAU2pBlplNQS/lXFMl5Qy/W7V42yz9ac2WBGYvi/6ikblbdIpDEoQb//1Ku6MRTxV6yEwvKsh76fDxWGwN1zqRSs1/jeyJ9I5qKmT8PINYkfuDeYbE9NkTyKxCZLbYivwa47kY1xJxy+RTqtTus6zQadVQ3QoxDdYQ2+jrXPb6mgvNyNBmY56BM7EbRQ8F3W/PB1RJ1nEhau2ew9EMcwv/1UBE9ergDv5hyG1to=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2019 09:08:09.7235 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3549d0ac-6ea6-4510-b500-08d6de9502de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1276
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enVtJuw7/SsH/1L6CivwTWBoAtt7D50e+y8/FT5H/sc=;
 b=IFo3XPVla+UqiLTNJ9xhWvGMTMLj6JpCPvkYq/rn9N4uUWzdIaePtxE6LgXklBeIEfnq3ZZw2Wmxb1Lg3ZK8ZUuKCntn1KLFRmT9XFCN2T4MhPtHOmCCNmZQ3Ui1kY9XlNbFK6WDx+3wz1NIbNLdYGhP6YpBULFobfF7LK223Bs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; daenzer.net; dkim=none (message not signed)
 header.d=none;daenzer.net; dmarc=permerror action=none header.from=amd.com;
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RmVhdHVyZSBpcyBjb250cm9sbGVkIGJ5IERSTV9DQVBfU1lOQ09CSl9USU1FTElORSBkcm0gY2Fw
YWJpbGl0eS4KClNpZ25lZC1vZmYtYnk6IENodW5taW5nIFpob3UgPGRhdmlkMS56aG91QGFtZC5j
b20+ClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+Ci0tLQogdGVzdHMvYW1kZ3B1L3N5bmNvYmpfdGVzdHMuYyB8IDggKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0cy9hbWRncHUvc3lu
Y29ial90ZXN0cy5jIGIvdGVzdHMvYW1kZ3B1L3N5bmNvYmpfdGVzdHMuYwppbmRleCBhMGM2Mjdk
Ny4uODY5ZWQ4OGUgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2FtZGdwdS9zeW5jb2JqX3Rlc3RzLmMKKysr
IGIvdGVzdHMvYW1kZ3B1L3N5bmNvYmpfdGVzdHMuYwpAQCAtMjIsNiArMjIsNyBAQAogKi8KIAog
I2luY2x1ZGUgIkNVbml0L0Jhc2ljLmgiCisjaW5jbHVkZSAieGY4NmRybS5oIgogCiAjaW5jbHVk
ZSAiYW1kZ3B1X3Rlc3QuaCIKICNpbmNsdWRlICJhbWRncHVfZHJtLmgiCkBAIC0zNiw2ICszNywx
MyBAQCBzdGF0aWMgdm9pZCBhbWRncHVfc3luY29ial90aW1lbGluZV90ZXN0KHZvaWQpOwogCiBD
VV9CT09MIHN1aXRlX3N5bmNvYmpfdGltZWxpbmVfdGVzdHNfZW5hYmxlKHZvaWQpCiB7CisJaW50
IHI7CisJdWludDY0X3QgY2FwID0gMDsKKworCXIgPSBkcm1HZXRDYXAoZHJtX2FtZGdwdVswXSwg
RFJNX0NBUF9TWU5DT0JKX1RJTUVMSU5FLCAmY2FwKTsKKwlpZiAociB8fCBjYXAgPT0gMCkKKwkJ
cmV0dXJuIENVX0ZBTFNFOworCiAJcmV0dXJuIENVX1RSVUU7CiB9CiAKLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
