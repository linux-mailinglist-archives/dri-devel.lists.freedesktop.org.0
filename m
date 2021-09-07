Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFA14026AF
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 12:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D14D89D7D;
	Tue,  7 Sep 2021 10:03:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2052.outbound.protection.outlook.com [40.107.96.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66B189D7D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 10:03:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X8E0ZFsp8NUm4LSr6xkvzEburc5Wl+TvuBepFoP0uYTpCzaNHBf4F6kyid8D7JvaivKL2CoSgHccyxXoH4vkAC7T3mTNnqykhyH0SHgsjgKGZzok0B0Vs1CgD4M+5m0hHOiodm+bmqOXKKwLPDlr6nKCDPBlZOfw5GCpzyAhIe97r4gKTe8zjbSDe6yzvuuLCT1g2l5IhBdF72RPHJVy/KUfrmyQaBaZp83uhHEs4ckmhi3UQCE/0LX7ipjgXY5zryQCRdKsrpD/2mdA58o7PUAoQT/bTWZX0syLsvERtJ5pRBXPeB3agZA2XC4SXpNoRtkShOCeND4XV6jwdMMkNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ymdB83v2h9vcJyo3O2Oe7vm75KEd8RwGnzSjAE6Z1fA=;
 b=NR67NulNzByGMfWgySdiMF2JMXTfOx19787a2owJnYhalV/Y+01bpZu5LS5vjR9DTmQU+Yrba/pM5gle7jQsZsaaJptOgN8CpjqfC6Bv1onPMFLioiN1gv1AEhS8300kx0pBI0ivPGtyVE4ftErtJEdFdrtgu/aTpDUcPzLWeWkKi7F89lfWC0WzP0VRKewVAzCzZUcs3HcsLbOGW3l/9Pk/wDICvTWO/nbBbBTt85GE38/vRbA6WYizXbUbsNJKPMgf8i3Rj4jHFEAI6TgtW72dA1s+VnEeSFkvYgDJ4Va35qZ+GJPAW2ctHKyXgkJnXY9l53UemICnVEltfL0AhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymdB83v2h9vcJyo3O2Oe7vm75KEd8RwGnzSjAE6Z1fA=;
 b=VKiajmruLe6AaeUWGbewWcEVQhE8/bJNqCiJNq1psJylxlk5Xeizp/VQXSiAJCS1sFSYaj/y/qMGwPyZME4vSVXbow1dIAEtWjyHmUqUdsvokXsdZMoUzfxf9f4TksyiQJ7bQ/Cl8BSvTwXN5ng3QH3c7LALu0YDYYGfp4NR2Yo=
Received: from DM5PR12CA0006.namprd12.prod.outlook.com (2603:10b6:4:1::16) by
 MN2PR12MB3264.namprd12.prod.outlook.com (2603:10b6:208:104::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 10:03:21 +0000
Received: from DM6NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:1:cafe::be) by DM5PR12CA0006.outlook.office365.com
 (2603:10b6:4:1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Tue, 7 Sep 2021 10:03:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT047.mail.protection.outlook.com (10.13.172.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 10:03:20 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 7 Sep 2021
 05:03:18 -0500
From: Huang Rui <ray.huang@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Daniel
 Vetter" <daniel.vetter@ffwll.ch>, <dri-devel@lists.freedesktop.org>
CC: Linus Torvalds <torvalds@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, <linux-kernel@vger.kernel.org>,
 <sparclinux@vger.kernel.org>, Huang Rui <ray.huang@amd.com>
Subject: [PATCH] drm/ttm: fix the type mismatch error on sparc64
Date: Tue, 7 Sep 2021 18:03:02 +0800
Message-ID: <20210907100302.3684453-1-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08ed54b0-b979-47b7-f14b-08d971e6b902
X-MS-TrafficTypeDiagnostic: MN2PR12MB3264:
X-Microsoft-Antispam-PRVS: <MN2PR12MB32642EABFEC95568D01B9892ECD39@MN2PR12MB3264.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: scZjuTrRTim9eC76wyqPXm6GV2YRxzqfKRhMMXAMQGEVGliD1vqNNOyH+NG+Zad3PGKF7rcR5KwJgL/hp97zCYPPGHkfk00icOKoqbmBjn3QLEHD5BQzahnfF121l3IwgMlrDa8WY55f4Vwhvr41Y4LDc2inc8QQ3wlpSP7zpauzaxmhOW2vjHlX3XDTnThd1zbLkuf2cEK0tOogFMcZsTuwTR7WJ9b4Ye+0M6LAnefqQitXKDCIyAIiGLg/JbxwLPjbOZLoLLwDAJL+6UFTi7OckYooa5Yf+S/QGWFhNNro+EKtVxqfZNMGPfC7dOHs/7d1Aj4FReEDxJNZgOiZdRiwPppCrx5N34C13JPVwttLPxIpF0JhctZwf402/RtPNCQF7HjEQHl/rEX4ZhWw6veB5mQ2N6hfuhyOA1HQPtS7dFpyFy/0eFxYq3c/mxHGxRvAogQebYwTDK9RvxckIruV1ZXikGct1CpOMfR5OmHOfJB2eYbR5/8DM58zXK3PYQZBllpnoUKUyVw797FCvTLiWWJLerOPERm6TjVZzFluXMPiKOHFQEAoDdQ9a/gWS7oVxRCltN7cl7jrkeZGJHc20elEbhUZxqwaNUwFyoHV3uoEiMszGrRKc0KfastXbB3ZKJkQqtA9GgG8IafItWBAdcoEtShSSI+R03eNQsr0mUFB/PnaYlF9yVLnrmqxhVQ4tXBhZ4oKaiyNiRhXLkihUyVEUTR9y4BdxfnrwRj5l55Tj7nOhe+nV2WyKBgm
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(46966006)(36840700001)(6666004)(1076003)(47076005)(8936002)(4326008)(82740400003)(7696005)(356005)(81166007)(36860700001)(2906002)(26005)(82310400003)(336012)(66574015)(426003)(2616005)(16526019)(186003)(110136005)(478600001)(70586007)(70206006)(5660300002)(316002)(36756003)(83380400001)(54906003)(86362001)(8676002)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 10:03:20.9160 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ed54b0-b979-47b7-f14b-08d971e6b902
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3264
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

__fls() on sparc64 return "int", but here it is expected as "unsigned
long" (x86). It will cause the build errors because the warning becomes
fatal while it is using sparc configuration. As suggested by Linus, it
can use min_t instead of min to force the type as "unsigned int".

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index af1b41369626..c961a788b519 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -382,7 +382,8 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 	else
 		gfp_flags |= GFP_HIGHUSER;
 
-	for (order = min(MAX_ORDER - 1UL, __fls(num_pages)); num_pages;
+	for (order = min_t(unsigned int, MAX_ORDER - 1, __fls(num_pages));
+	     num_pages;
 	     order = min_t(unsigned int, order, __fls(num_pages))) {
 		bool apply_caching = false;
 		struct ttm_pool_type *pt;
-- 
2.25.1

