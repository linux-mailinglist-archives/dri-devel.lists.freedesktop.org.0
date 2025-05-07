Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC83AAE74F
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 19:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B2310E864;
	Wed,  7 May 2025 17:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="LUQTyw06";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6382110E861;
 Wed,  7 May 2025 17:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=2du0cOyGNjNJ8UpDVle2A2RTs5qK9EdSvnrILemNlQA=; b=LUQTyw063+W9fved
 ukcncdzT0CnIq63tF6Ojk+te4fddzk5dxznnIvRu/ZmD8vXrbWDarYiXFQBMGkCANTboafLCI/Nz3
 E8KzkzY7MQzsRUpjxt+ldeuzKqGwy1tfd78GSdR69Jjs+xG5fDewGToAVJiY8L80/plUUkiMWdt/l
 KLUr/FaHHQAqaiAWW3IxBvbzooLuam6qqt3m9RtEqJ/7EYZFdJP7iRl61xvNHBIsBCPMZRpGLlNtn
 R7OtsgLYe5nEomJBGzW2iafoLYHYgVkCzJxbyCwFwz+u/N9uN8GO/s9IU7VPO0qyfxqj4KWmvrrBN
 +zYCoT4dxNERNPrw6w==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1uCi9S-002EIU-2K;
 Wed, 07 May 2025 17:01:46 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com, kenneth.feng@amd.com, christian.koenig@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 1/3] drm/amd/pm/smu13: Remove unused
 smu_v13_0_init_display_count
Date: Wed,  7 May 2025 18:01:43 +0100
Message-ID: <20250507170145.102508-2-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507170145.102508-1-linux@treblig.org>
References: <20250507170145.102508-1-linux@treblig.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

smu_v13_0_init_display_count() was added in 2020 by
commit c05d1c401572 ("drm/amd/swsmu: add aldebaran smu13 ip support (v3)")
but is unused.

See discussion on:
https://lore.kernel.org/all/DM4PR12MB5165D85BD85BC8FC8BF7A3B48E88A@DM4PR12MB5165.namprd12.prod.outlook.com/
that it really isn't neede.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h   |  2 --
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c | 12 ------------
 2 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
index 6f74783472e5..1b4a46126a04 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
@@ -162,8 +162,6 @@ int smu_v13_0_notify_memory_pool_location(struct smu_context *smu);
 int smu_v13_0_system_features_control(struct smu_context *smu,
 				      bool en);
 
-int smu_v13_0_init_display_count(struct smu_context *smu, uint32_t count);
-
 int smu_v13_0_set_allowed_mask(struct smu_context *smu);
 
 int smu_v13_0_notify_display_change(struct smu_context *smu);
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index 03242f65e262..9893657dfa61 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -749,18 +749,6 @@ int smu_v13_0_set_tool_table_location(struct smu_context *smu)
 	return ret;
 }
 
-int smu_v13_0_init_display_count(struct smu_context *smu, uint32_t count)
-{
-	int ret = 0;
-
-	if (!smu->pm_enabled)
-		return ret;
-
-	ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_NumOfDisplays, count, NULL);
-
-	return ret;
-}
-
 int smu_v13_0_set_allowed_mask(struct smu_context *smu)
 {
 	struct smu_feature *feature = &smu->smu_feature;
-- 
2.49.0

