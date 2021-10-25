Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 619B84396F3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 15:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E34789F43;
	Mon, 25 Oct 2021 13:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2069.outbound.protection.outlook.com [40.107.102.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3735E89F3C;
 Mon, 25 Oct 2021 13:01:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d956ngmIcV8B+zDXvH1b5glukgmpQSwNRJnf+m2fY+Fa6YdstIB20ryNTmtiE/Md5vn6wpKy0ndzAMJO5HlIDjuzlDp7RNkcjdxQNwwT2xQJia61UJAiUXhdHZe72HTCHD2kBiKjIAMoM/NZ2R8Trlcc3lwZGKZC3cDOyheVX972TVZgRiCJYojQcdtXRpBURl3iNzC8phQnNCahCGpdsksjAkNGCM8hi3NuHVbJfpL0auvPtJfoH7BnBEle0I8jlMlqCGi+JE68V64lRMyQITzEplBA0ZmgEtAngLfF6kFnzZ3+vJq8Uivvb3WPY/BHvt97FvW6Xy3/P7X3cMnElw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/X9+GHPh4RB87RneassZiM/taK/bTDVPgyv+Ele6j8=;
 b=lnwmJHAJ9XT7uVrZO638r8el8EWKbGVKuHbLLqDis0WUdPnmnX1rhbtndAe+BvKw2MunwFyhKbADPgLhouN4k7OCi+3R8Lyuz+OyUlueBQot+whNjT0GDAFeIdDDGj3JuGVl55qsdRrrbqlRPsBOhS2Kj604p6Y4hNaxUZ9LOtiEleZHZvkxt0BsQ898mo7LHzPwHqVND95xW9Id4tXZ5GxhZl39kjSguKIKJg0zHXI3S1ZNuZRstwQgt5HwYtXW8VRmT8e4SrVs2y62JhhZ7qDw68OTOP37I8/4Aq7nN6bebny+KXGcB9A/qqwMGh8nm9vtknCWK+06BJg3QxGQ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/X9+GHPh4RB87RneassZiM/taK/bTDVPgyv+Ele6j8=;
 b=xnbXjw/lXC+6/r+nkfNyb1gkyKQf3cncowh7t+WVdlGIwz08uTE9fMjjXAKKX9L0tswRTORiaN0m0EXXcooaTQ3dn5olx1oL4565vZYQlAQ1J8BWjpD79jv6C4VsZHiIXJ9HpPQbgqyNldfGTFZfg4AvBCB9tqaIpwR30Bn+ZvM=
Received: from CO2PR04CA0194.namprd04.prod.outlook.com (2603:10b6:104:5::24)
 by DM6PR12MB3787.namprd12.prod.outlook.com (2603:10b6:5:1c1::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Mon, 25 Oct
 2021 13:01:08 +0000
Received: from CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:5:cafe::97) by CO2PR04CA0194.outlook.office365.com
 (2603:10b6:104:5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Mon, 25 Oct 2021 13:01:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT033.mail.protection.outlook.com (10.13.174.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Mon, 25 Oct 2021 13:01:08 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 25 Oct
 2021 08:01:04 -0500
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
CC: <daniel@ffwll.ch>, <christian.koenig@amd.com>,
 <alexander.deucher@amd.com>, <matthew.auld@intel.com>, <tzimmermann@suse.de>, 
 <jani.nikula@linux.intel.com>, Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH 6/8] drm/i915: add free_unused_pages support to i915
Date: Mon, 25 Oct 2021 18:30:29 +0530
Message-ID: <20211025130033.1547667-4-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025130033.1547667-1-Arunpravin.PaneerSelvam@amd.com>
References: <20211025130033.1547667-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5da606c6-d1d7-48ba-7d49-08d997b78311
X-MS-TrafficTypeDiagnostic: DM6PR12MB3787:
X-Microsoft-Antispam-PRVS: <DM6PR12MB378777A0B64DE7F7E3A11343E4839@DM6PR12MB3787.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:389;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UFOxlnhE93SgLNt4vvDnKtDW6xGKcos00//8wbHnFFj4ux5CTN2YbluhA3VUIgDIS2lcD6tDfYjdD8ph0vdkGdrvaQpcX+PNa2rql+DMXi1HxQ8pHjsek2LJgJh5ehh/9zOP40cx6y7xPQV39N61JMsamAjprt07uZtJzMzS4zGzxyR+SBhFn5owcDeOMevrorZv8A3gbwj/ZApwlfjG1/AmmQJz57nj9f7vvNQsVLH1ry3XSM02Ypxl+7b/nljBwwaiyel8OvpZPO/W7yOG6gTjW67u9C0CLGhcONFW5vQNf/l+s9nmyh2xiBoXGEc7HAljtdPgiW3/Fg/fNvvLGXsGT+0R8gMLnTAfTJ/ZfQkBUBcQqaSTOItuALFEzc63jG9+MwZ8mw558MztGB1sAYGcvr7A6x50CjIVytDiWJb9VpSDXqUmkY3am5XowOZy4rMgAF1trEG7+Y4EQeDCmmROUmTzJX/8PskJ13dygBd+TOmQqCajGQB2oWQjmVtzMsGZt3snxMZAm8jFZoOq+quLdCVokItRgmK4U2q24xks4ba2aIrbkNr0rsNCiyJ+EXV1Vw0K44zwq0Ro7WyB+vPPobEFRmulKq60GXZBK/JJAkLHzdDjL+X4HVmq52FjRlavqX879gqagUWjCglWMln+u3sW80YGs07YeOIDaEV7QcTc9ZX5IROBugOFshFA4WCpGImGMfYw2wM1x0dLDl0cUcu5kudZLVdvYncDS1I=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(186003)(316002)(70206006)(356005)(7696005)(508600001)(70586007)(83380400001)(54906003)(36756003)(1076003)(5660300002)(81166007)(8676002)(82310400003)(86362001)(336012)(426003)(26005)(2616005)(2906002)(16526019)(36860700001)(8936002)(6666004)(47076005)(4744005)(4326008)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 13:01:08.1877 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da606c6-d1d7-48ba-7d49-08d997b78311
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3787
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

add drm_buddy_free_unused_pages() support on
contiguous allocation

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index 963468228392..162947af8e04 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -98,6 +98,14 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	if (unlikely(err))
 		goto err_free_blocks;
 
+	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
+		err = drm_buddy_free_unused_pages(mm, (uint64_t)n_pages << PAGE_SHIFT,
+						       &bman_res->blocks);
+
+		if (unlikely(err))
+			goto err_free_blocks;
+	}
+
 	*res = &bman_res->base;
 	return 0;
 
-- 
2.25.1

