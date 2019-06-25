Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97135550FE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 16:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA296E10F;
	Tue, 25 Jun 2019 14:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810041.outbound.protection.outlook.com [40.107.81.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13076E10E;
 Tue, 25 Jun 2019 14:01:54 +0000 (UTC)
Received: from CY4PR1201CA0004.namprd12.prod.outlook.com
 (2603:10b6:910:16::14) by MWHPR12MB1166.namprd12.prod.outlook.com
 (2603:10b6:300:7::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.13; Tue, 25 Jun
 2019 14:01:53 +0000
Received: from DM3NAM03FT008.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by CY4PR1201CA0004.outlook.office365.com
 (2603:10b6:910:16::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2008.16 via Frontend
 Transport; Tue, 25 Jun 2019 14:01:53 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT008.mail.protection.outlook.com (10.152.82.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2008.13 via Frontend Transport; Tue, 25 Jun 2019 14:01:52 +0000
Received: from hwentlanhp.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 25 Jun 2019
 09:01:52 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <airlied@gmail.com>, <natechancellor@gmail.com>
Subject: [PATCH] drm/amd/display: Use msleep instead of udelay for 8ms wait
Date: Tue, 25 Jun 2019 10:00:46 -0400
Message-ID: <20190625140046.31682-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <CAPM=9txaQ43GwOzXSE3prTRLbMt+ip=s_ssmFzWsfsTYdLssaw@mail.gmail.com>
References: <CAPM=9txaQ43GwOzXSE3prTRLbMt+ip=s_ssmFzWsfsTYdLssaw@mail.gmail.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(136003)(376002)(396003)(2980300002)(428003)(199004)(189003)(68736007)(50466002)(36756003)(81166006)(4326008)(6666004)(426003)(186003)(47776003)(356004)(48376002)(14444005)(305945005)(70206006)(53936002)(2616005)(11346002)(8936002)(81156014)(8676002)(446003)(476003)(53416004)(316002)(26005)(77096007)(54906003)(110136005)(5660300002)(44832011)(76176011)(2870700001)(2906002)(4744005)(72206003)(1076003)(478600001)(486006)(86362001)(7696005)(336012)(126002)(70586007)(51416003)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1166; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7dbd7018-1c18-4bf2-175d-08d6f975ad2c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1166; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1166:
X-Microsoft-Antispam-PRVS: <MWHPR12MB116640AFBDF7B1F757608FC78CE30@MWHPR12MB1166.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 0079056367
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: FUf/ugQMFnurU++uU85eo/NPfFmqD4B4QfDTjngAVbaEgnsPY65UP3tavgfOtlXyJG9CwdeNjf43cYkrsWaIbLSEYqyz+g+IGeUedKxvaG9l5wYw82hGUjRjLn4tOmF3RMrFURUEt/u3qdZFvR6CUBFfdxbiI/2MhL8CHYYwuE2FqzDkL9Hhj92LGciSbidE2unRmriJrjT56XF5+7JfxpCP2jXZnR1Daj7Eseies0oPKc4aW/OGwE3KT9uwe/5sQYyZMJgJGZwgf1p3YveK0hV+AXUYebB0QbXCN/MdlhNvNf6gmyiTernP555cpZ3U2snP8/MG0bfBJeZ6gldMdW6V2xaxGXzexqh2o/H4PI4GmfHSHEJGjchZ8AVkCW9sTmSdxW6O6JSNBBq57L66YL2YoPh/pzIWCn9eMhveogk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2019 14:01:52.7838 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dbd7018-1c18-4bf2-175d-08d6f975ad2c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1166
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8xOtvZnGag/13sI6VqtomdUe88yUmY+6Rqe0SzGArk=;
 b=ulkxi+CeMGw4km8ckzEmmZ88m2Sn585nMN+zMAzxocwwQmN7IgmBWi/dgJdVQskSkmC2Cr44AXGA6tln0TAHjAVjq/KJsX0gdMa3QnnuTP9jwNPl+Z0BSDHZmiHD47EhxORuZY9macEVymVYBPbvc6m9mOsHpvifATHuLDjPxrI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: sunpeng.li@amd.com, Anthony.Koo@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, Jun.Lei@amd.com, Bhawanpreet.Lakha@amd.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YXJtMzIncyB1ZGVsYXkgb25seSBhbGxvd3MgdmFsdWVzIHVwIHRvIDIwMDAgbWljcm9zZWNvbmRz
LiBtc2xlZXAKZG9lcyB0aGUgdHJpY2sgZm9yIHVzIGhlcmUgYXMgdGhlcmUgaXMgbm8gcHJvYmxl
bSBpZiB0aGlzIGlzbid0Cm1pY3Jvc2Vjb25kIGFjY3VyYXRlIGFuZCB0YWtlcyBhIHRhZCBsb25n
ZXIuCgpTaWduZWQtb2ZmLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKaW5kZXggNGMzMTkz
MGYxY2RmLi5mNWQwMmY4OWIzZjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9jb3JlL2RjX2xpbmsuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19saW5rLmMKQEAgLTU0OCw3ICs1NDgsNyBAQCBzdGF0aWMgdm9pZCByZWFkX2Vk
cF9jdXJyZW50X2xpbmtfc2V0dGluZ3Nfb25fZGV0ZWN0KHN0cnVjdCBkY19saW5rICpsaW5rKQog
CQkJYnJlYWs7CiAJCX0KIAotCQl1ZGVsYXkoODAwMCk7CisJCW1zbGVlcCg4KTsKIAl9CiAKIAlB
U1NFUlQoc3RhdHVzID09IERDX09LKTsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
