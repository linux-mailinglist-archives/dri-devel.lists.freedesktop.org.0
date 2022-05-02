Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0622651748A
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC5A10F0D0;
	Mon,  2 May 2022 16:37:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CA510F0CC
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 16:37:49 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 p7-20020a05600c358700b00393e80c59daso242445wmq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 09:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=paocEfPgSqu67n8KLHsQSQJ/DJyKOx4pTU1l0q+u0sU=;
 b=VlkS5sgarlYWn0MnwUTY3aeqE4Snozzu8nEzmHLBPm4YKIU7G+YGuHGBpdnwVjenim
 IisHP/2UQFKrjOj9yR1h4U8zH81F6bicVL0O6wZ1Rl+PebVe7A33GUHVGWHfdEt0fGHL
 50SHMe3EyX1yoojUuwDJKaCiAxz6xAL+d4np6qFo0GrAZQB1yRIrmlaEwFAaxc1PdM/w
 O5Jn5KOZeJhmgH6SJPjXshycuGRsZS2IvvtN8/kob74SDdniTfz+W8ix+Tzle84Aonfu
 If2W70R4KzP2rCZrk7cux5qY36dYnqm6OniYOzgEoSNHZPPeyYENMnS8L9lxJ+6LG9EM
 wXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=paocEfPgSqu67n8KLHsQSQJ/DJyKOx4pTU1l0q+u0sU=;
 b=Kf25nxNfy2/vUxnjw9SgFsAgoQqhMhg9IriVouqbqBv705O7VEyckNyJnztLYpw3YT
 Q47NyLBJN7bMdG/CUWWdY/kWKnARXI/moYMvQcuDUGDmQw2ZAyZc4N876Nr9g1VnoM6t
 6yAdS/sfsAGm4RkJ9mVc46RLaft2r4KydhoifRnR9sIsFAOrutjwTl9mQChfimmESHcl
 9B5+0cnpVNoPolH2CFn4FzO8V0A+Sw56bZG2tVMWT9tRS3GzGu2MiOlhn7+/DU/lg444
 sQPQWxJAiiCdkQE4Rm78m/u2ndB7/Ck/hymxlo+lt2D9MwsgmD6QUg9Ij76sUF6xYZ2F
 F27Q==
X-Gm-Message-State: AOAM530kJcPMsDLwVuofQl39aiOcx9DUr/tFreEIXKALxBSKZhDJaXZz
 FabUqHHh164LghH68LCdnyQ=
X-Google-Smtp-Source: ABdhPJxl04mnJLBE6tuBmOzv32rWsrcZLRuHOgfEtMeSpdmfs0QlfaGTPzlaUDTFvluVRH+0hWC5CQ==
X-Received: by 2002:a1c:f415:0:b0:37f:ab4d:1df2 with SMTP id
 z21-20020a1cf415000000b0037fab4d1df2mr15431594wma.75.1651509467952; 
 Mon, 02 May 2022 09:37:47 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 p14-20020adfaa0e000000b0020c5253d8f6sm7294694wrd.66.2022.05.02.09.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 09:37:47 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, jason@jlekstrand.net, daniels@collabora.com,
 skhawaja@google.com, maad.aldabagh@amd.com, sergemetral@google.com,
 sumit.semwal@linaro.org, gustavo@padovan.org, Felix.Kuehling@amd.com,
 alexander.deucher@amd.com, tzimmermann@suse.de,
 tvrtko.ursulin@linux.intel.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 14/15] drm/amdgpu: switch DM to atomic fence helpers
Date: Mon,  2 May 2022 18:37:21 +0200
Message-Id: <20220502163722.3957-15-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502163722.3957-1-christian.koenig@amd.com>
References: <20220502163722.3957-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Jude Shih <shenshih@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <Roman.Li@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This gives us the standard atomic implicit and explicit fencing rules.

Signed-off-by: Christian König <christian.koenig@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: Roman Li <Roman.Li@amd.com>
Cc: Qingqing Zhuo <qingqing.zhuo@amd.com>
Cc: Jude Shih <shenshih@amd.com>
Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 23 ++++++++-----------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 2ade82cfb1ac..c5b2417adcc6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -83,6 +83,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_audio_component.h>
+#include <drm/drm_gem_atomic_helper.h>
 
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 #include "ivsrcid/dcn/irqsrcs_dcn_1_0.h"
@@ -7627,6 +7628,10 @@ static int dm_plane_helper_prepare_fb(struct drm_plane *plane,
 		goto error_unpin;
 	}
 
+	r = drm_gem_plane_helper_prepare_fb(plane, new_state);
+	if (unlikely(r != 0))
+		goto error_unpin;
+
 	amdgpu_bo_unreserve(rbo);
 
 	afb->address = amdgpu_bo_gpu_offset(rbo);
@@ -9160,7 +9165,6 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 	struct dm_crtc_state *dm_old_crtc_state =
 			to_dm_crtc_state(drm_atomic_get_old_crtc_state(state, pcrtc));
 	int planes_count = 0, vpos, hpos;
-	long r;
 	unsigned long flags;
 	struct amdgpu_bo *abo;
 	uint32_t target_vblank, last_flip_vblank;
@@ -9173,6 +9177,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		struct dc_flip_addrs flip_addrs[MAX_SURFACES];
 		struct dc_stream_update stream_update;
 	} *bundle;
+	int r;
 
 	bundle = kzalloc(sizeof(*bundle), GFP_KERNEL);
 
@@ -9181,6 +9186,10 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		goto cleanup;
 	}
 
+	r = drm_atomic_helper_wait_for_fences(dev, state, false);
+	if (unlikely(r))
+		DRM_ERROR("Waiting for fences timed out!");
+
 	/*
 	 * Disable the cursor first if we're disabling all the planes.
 	 * It'll remain on the screen after the planes are re-enabled
@@ -9235,18 +9244,6 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		}
 
 		abo = gem_to_amdgpu_bo(fb->obj[0]);
-
-		/*
-		 * Wait for all fences on this FB. Do limited wait to avoid
-		 * deadlock during GPU reset when this fence will not signal
-		 * but we hold reservation lock for the BO.
-		 */
-		r = dma_resv_wait_timeout(abo->tbo.base.resv,
-					  DMA_RESV_USAGE_WRITE, false,
-					  msecs_to_jiffies(5000));
-		if (unlikely(r <= 0))
-			DRM_ERROR("Waiting for fences timed out!");
-
 		fill_dc_plane_info_and_addr(
 			dm->adev, new_plane_state,
 			afb->tiling_flags,
-- 
2.25.1

