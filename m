Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BF53956DA
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 10:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7B16E87E;
	Mon, 31 May 2021 08:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4AC56E87E;
 Mon, 31 May 2021 08:23:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVcpg/TXvpXraLo47I9o+GbbkWzLkHYVpMZhWpQQUvDlikR4CnC4Kf3U1uJEVceIQ5Pemq+zwD2jxLuFHwTNGIbIKkhTNGo7NSgXhnsmVOoVqRZtB69MvzpD3iUnFvZVweJHkLsBSEIIh0gLx06GtO5A1wLaxKw2UVGZlXn7qGjgf7Q7f0/F+zrTpIIQnzAkOM/bSV+FgxLZttpS7GNGasbUf4TKPBgpw2GI+R9WuK2ZZGvU1QY8mXQnSJI51jnKz63VAHv0F4kU7vLyrdfrI9lYqkTFEzrVat0A4w0fpxYz0DBgKACz6FFyRoJqfHe9KXJ9vPjYdUU0WNcfRKA0Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3G67fY+A1y8Dk99cENW8wldF38B0XQQB8LLxN7gkJlU=;
 b=fDVCTjdVWyPmTezsAmERK/5puQOPhfeCkFm+TkH91L3P4++cjFXyBY71yIBEQ3sOMkQ9JqYM9GVOQIkmKo8x8KHtuGvcPjwNtW0JsfooqZoBZf8vzTKopzubN14NpoWI92EGYJOcNv1XJmOJWxSx4givYjhQL1H+haWffaOOPeD1s+Waq/Y70ZpVshhj4pn63UnfMG3rv62IYAlk5eIZ1PnjMLxVI/UW0IPxUGfnKzRPD1vkhNmHExes/V6aY7CB+Tkvs0S6MjEQjQd1obRbazQGxB1wpOFLbMNKzAxnJoqUReeqp55xKuPBOf7IMZ1bwX8XiS9htAT+qe3+RpKvCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=none sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3G67fY+A1y8Dk99cENW8wldF38B0XQQB8LLxN7gkJlU=;
 b=eI162xw66hV/yuaVr9iaP+d2hVbNxmuN9IsLYV8xnX+3gw4lYPGIzWuCO8RPpmNJrdLT+XDo4KaECLHVnJV7tbcNsFFj5IWuoB+3tcpTeVJT2FIQe4XecJno+bC0yrWYlpo1DTbY/BJGJ7pY5Ub4vLfRISfo+dLFJEhZj0/J6fI=
Received: from MW4PR04CA0031.namprd04.prod.outlook.com (2603:10b6:303:6a::6)
 by BY5PR12MB5526.namprd12.prod.outlook.com (2603:10b6:a03:1d7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Mon, 31 May
 2021 08:23:27 +0000
Received: from CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::b7) by MW4PR04CA0031.outlook.office365.com
 (2603:10b6:303:6a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Mon, 31 May 2021 08:23:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT023.mail.protection.outlook.com (10.13.175.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4150.30 via Frontend Transport; Mon, 31 May 2021 08:23:26 +0000
Received: from lang-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 31 May
 2021 03:23:23 -0500
From: Lang Yu <Lang.Yu@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 3/3] drm/amdgpu: allow temporary GTT allocation under
 memory pressure
Date: Mon, 31 May 2021 16:22:41 +0800
Message-ID: <20210531082241.4254-3-Lang.Yu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210531082241.4254-1-Lang.Yu@amd.com>
References: <20210531082241.4254-1-Lang.Yu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8efe37d-e37e-41de-7c31-08d9240d5d3e
X-MS-TrafficTypeDiagnostic: BY5PR12MB5526:
X-Microsoft-Antispam-PRVS: <BY5PR12MB5526BFEB5084EFB0EF3C1EE1FB3F9@BY5PR12MB5526.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s5wuIf6uqgniWwUj251XgyMoKOPnbeDD/xJpkXXK5ZU07uiZrQPQdPQq4y9YThbCDqughhfIZU8MIv10iPsw6FDsDp7dMR/kI+cDebelZYFSpocHp4IoLMgaUsnY7L+/jg8jRCxi7eR5XMYs5k9MjtY9yxHoN7S4a2b58wOsG0oSQAO9tYHVvawOF0fi5cFpQta5tdds2KzCmwPHMHSyN+9vcNd/dmzt+RiomVy65p1+CK4xqR5Z7dFHDD97xONbg7rrNPdBhqugWsat0yEeVvhDnueAaHtYfH3kmEf9DNabfo8lNl+5fFHqlYQZbQP/zjivzgqbhkZoCIR3ZXniYdz01vDka90seBlxpM/+8G3kggRUxO5cOh+oQOUdgw8n9fIl40gessS0wr44hHehBX1c/sKfKhlDRr0c35tufvpHZt7VPiUCl7+m0Wqsm/GDvXwKZwa22lPeSyM9k/eO0x9kS70UyAeCVVeY2Vwpis+7ZeI1rcuFM7dDlZlD2ftqo+oWIh3MVfxHj3zt0YOgkIPUEmqFKTQKJUQIDC/2JsNz61zRNWOgn4BkF3eGvaiFnPU74vHpRYEHU9Gthsxzh267FBjQbS03mkcIh8718Aep8VzGLOPS/yT1/1WRKeZEJtsBFtezUm0KiIwKyzjKtxNN/TFOBy2es0i4u8QqdVDtYayQuc/EndRKr5N3QOYa
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(396003)(136003)(36840700001)(46966006)(70586007)(356005)(36756003)(82740400003)(83380400001)(478600001)(26005)(5660300002)(2616005)(86362001)(70206006)(81166007)(4326008)(7696005)(316002)(54906003)(110136005)(2906002)(1076003)(8676002)(426003)(36860700001)(8936002)(6666004)(336012)(186003)(16526019)(47076005)(82310400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 08:23:26.5547 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8efe37d-e37e-41de-7c31-08d9240d5d3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5526
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
Cc: Marek Olsak <Marek.Olsak@amd.com>, Christian
 Koenig <Christian.Koenig@amd.com>, Huang
 Rui <ray.huang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Lang Yu <Lang.Yu@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6?= <thomas_os@shipmail.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, we have a limitted GTT memory size and need a bounce buffer
when doing buffer migration between VRAM and SYSTEM domain.

The problem is under GTT memory pressure we can't do buffer migration
between VRAM and SYSTEM domain. But in some cases we really need that.
Eespecially when validating a VRAM backing store BO which resides in
SYSTEM domain.

To solve the problem, we allow temporary GTT allocation under memory
pressure and do the following:

1. Change mgr->available into mgr->used (invert the value).
2. Always account all GTT BOs to the used space.
3. Only when it is not a temporary allocation bail out.

v2: still account temporary GTT allocations

Signed-off-by: Lang Yu <Lang.Yu@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 27 ++++++++++-----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     |  4 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  2 +-
 3 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 8860545344c7..393f55f412b7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -111,14 +111,11 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 	struct amdgpu_gtt_node *node;
 	int r;
 
-	spin_lock(&mgr->lock);
-	if ((&tbo->mem == mem || tbo->mem.mem_type != TTM_PL_TT) &&
-	    atomic64_read(&mgr->available) < mem->num_pages) {
-		spin_unlock(&mgr->lock);
+	if ((atomic64_add_return(mem->num_pages, &mgr->used) > man->size) &&
+		!(mem->placement & TTM_PL_FLAG_TEMPORARY)) {
+		atomic64_sub(mem->num_pages, &mgr->used);
 		return -ENOSPC;
 	}
-	atomic64_sub(mem->num_pages, &mgr->available);
-	spin_unlock(&mgr->lock);
 
 	if (!place->lpfn) {
 		mem->mm_node = NULL;
@@ -152,7 +149,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 	kfree(node);
 
 err_out:
-	atomic64_add(mem->num_pages, &mgr->available);
+	atomic64_sub(mem->num_pages, &mgr->used);
 
 	return r;
 }
@@ -178,7 +175,7 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
 		kfree(node);
 	}
 
-	atomic64_add(mem->num_pages, &mgr->available);
+	atomic64_sub(mem->num_pages, &mgr->used);
 }
 
 /**
@@ -191,9 +188,8 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
 uint64_t amdgpu_gtt_mgr_usage(struct ttm_resource_manager *man)
 {
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
-	s64 result = man->size - atomic64_read(&mgr->available);
 
-	return (result > 0 ? result : 0) * PAGE_SIZE;
+	return atomic64_read(&mgr->used) * PAGE_SIZE;
 }
 
 /**
@@ -234,14 +230,17 @@ static void amdgpu_gtt_mgr_debug(struct ttm_resource_manager *man,
 				 struct drm_printer *printer)
 {
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
+	uint64_t used, used_pages;
 
 	spin_lock(&mgr->lock);
 	drm_mm_print(&mgr->mm, printer);
 	spin_unlock(&mgr->lock);
 
-	drm_printf(printer, "man size:%llu pages, gtt available:%lld pages, usage:%lluMB\n",
-		   man->size, (u64)atomic64_read(&mgr->available),
-		   amdgpu_gtt_mgr_usage(man) >> 20);
+	used = amdgpu_gtt_mgr_usage(man);
+	used_pages = used/PAGE_SIZE;
+
+	drm_printf(printer, "man size:%llu pages,  gtt available:%lld pages, usage:%lluMB\n",
+		man->size, used_pages > man->size ? 0 : man->size - used_pages, used >> 20);
 }
 
 static const struct ttm_resource_manager_func amdgpu_gtt_mgr_func = {
@@ -274,7 +273,7 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
 	drm_mm_init(&mgr->mm, start, size);
 	spin_lock_init(&mgr->lock);
-	atomic64_set(&mgr->available, gtt_size >> PAGE_SHIFT);
+	atomic64_set(&mgr->used, 0);
 
 	ret = device_create_file(adev->dev, &dev_attr_mem_info_gtt_total);
 	if (ret) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index c0aef327292a..129d39392859 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -152,9 +152,11 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
 			abo->placements[0].lpfn = 0;
 			abo->placement.busy_placement = &abo->placements[1];
 			abo->placement.num_busy_placement = 1;
+			abo->placements[1].flags |= TTM_PL_FLAG_TEMPORARY;
 		} else {
 			/* Move to GTT memory */
 			amdgpu_bo_placement_from_domain(abo, AMDGPU_GEM_DOMAIN_GTT);
+			abo->placements[0].flags |= TTM_PL_FLAG_TEMPORARY;
 		}
 		break;
 	case TTM_PL_TT:
@@ -538,7 +540,7 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 			hop->fpfn = 0;
 			hop->lpfn = 0;
 			hop->mem_type = TTM_PL_TT;
-			hop->flags = 0;
+			hop->flags |= TTM_PL_FLAG_TEMPORARY;
 			return -EMULTIHOP;
 		}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 2877a924086f..26b67af00550 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -52,7 +52,7 @@ struct amdgpu_gtt_mgr {
 	struct ttm_resource_manager manager;
 	struct drm_mm mm;
 	spinlock_t lock;
-	atomic64_t available;
+	atomic64_t used;
 };
 
 struct amdgpu_preempt_mgr {
-- 
2.25.1

