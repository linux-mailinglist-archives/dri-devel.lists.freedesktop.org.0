Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4E6AAD240
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 02:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E9E10E722;
	Wed,  7 May 2025 00:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="HF+/InVA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E3910E729;
 Wed,  7 May 2025 00:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=409FBbvDS2Us+ovAjAHcsc9xHm8JBy90GPNyffM0qoU=; b=HF+/InVAf8DFiG1p
 Xcz9dHF2r4H4tNXgV6XwSdKDucX1f/Ja/RjPdahEDpJaiS1UAkqK4nUrkSRJOvwtZhCvIil4o4tA3
 tnLO61iOm2iX+7DAtrHD2J2a7jZVvhbjq/kLwLuIdegBEJfHtQD/7cx1HE7/13Z0F7pidxbSRBupn
 kY286Ll7J7blspcexphXgTYdW+xcAmL+dIM6Q0RIs4CAyYM/vQIbg57NeWjVq4+OD68tsc2g8OJgO
 RjnxdtXEA5a9e7OXIPJQ1zXWDwDgk3e3QSlnbpU32ymhpO3JWcZgmKlcit377WJcvXXb9/qoyb4jX
 X6ab79rpey9mq7HGRA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1uCSaI-0021Kc-2M;
 Wed, 07 May 2025 00:24:26 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com, kenneth.feng@amd.com, christian.koenig@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 2/3] drm/amd/pm/smu11: Remove unused
 smu_v11_0_get_dpm_level_range
Date: Wed,  7 May 2025 01:24:24 +0100
Message-ID: <20250507002425.93421-3-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507002425.93421-1-linux@treblig.org>
References: <20250507002425.93421-1-linux@treblig.org>
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

The last use of smu_v11_0_get_dpm_level_range() was removed in 2020 by
commit 46a301e14e8a ("drm/amd/powerplay: drop unnecessary Navi1x specific
APIs")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h  |  5 ---
 .../gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c    | 39 -------------------
 2 files changed, 44 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h
index ed8304d82831..56ae555bb52a 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h
@@ -281,11 +281,6 @@ int smu_v11_0_set_single_dpm_table(struct smu_context *smu,
 				   enum smu_clk_type clk_type,
 				   struct smu_11_0_dpm_table *single_dpm_table);
 
-int smu_v11_0_get_dpm_level_range(struct smu_context *smu,
-				  enum smu_clk_type clk_type,
-				  uint32_t *min_value,
-				  uint32_t *max_value);
-
 int smu_v11_0_get_current_pcie_link_width_level(struct smu_context *smu);
 
 uint16_t smu_v11_0_get_current_pcie_link_width(struct smu_context *smu);
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
index 25fabf336a64..78e4186d06cc 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
@@ -2059,45 +2059,6 @@ int smu_v11_0_set_single_dpm_table(struct smu_context *smu,
 	return 0;
 }
 
-int smu_v11_0_get_dpm_level_range(struct smu_context *smu,
-				  enum smu_clk_type clk_type,
-				  uint32_t *min_value,
-				  uint32_t *max_value)
-{
-	uint32_t level_count = 0;
-	int ret = 0;
-
-	if (!min_value && !max_value)
-		return -EINVAL;
-
-	if (min_value) {
-		/* by default, level 0 clock value as min value */
-		ret = smu_v11_0_get_dpm_freq_by_index(smu,
-						      clk_type,
-						      0,
-						      min_value);
-		if (ret)
-			return ret;
-	}
-
-	if (max_value) {
-		ret = smu_v11_0_get_dpm_level_count(smu,
-						    clk_type,
-						    &level_count);
-		if (ret)
-			return ret;
-
-		ret = smu_v11_0_get_dpm_freq_by_index(smu,
-						      clk_type,
-						      level_count - 1,
-						      max_value);
-		if (ret)
-			return ret;
-	}
-
-	return ret;
-}
-
 int smu_v11_0_get_current_pcie_link_width_level(struct smu_context *smu)
 {
 	struct amdgpu_device *adev = smu->adev;
-- 
2.49.0

