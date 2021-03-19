Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A622342760
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 22:03:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B53C6EABC;
	Fri, 19 Mar 2021 21:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47EBE6EABC;
 Fri, 19 Mar 2021 21:03:49 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id l18so4131661edc.9;
 Fri, 19 Mar 2021 14:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WJ6d6HTrmyDK3452g+nAg7aRJkCmSMDuUl8a7TBs5ok=;
 b=hsDjgLJcZvZeqoIt7vkecsYtNvZinrqa7hsfl3R+3GiFXG2jBtrKVFr43bRQvMiTxY
 d0K8zCxCljaExUEn3G/Rowb7bEyoT57axDawROeZbURqAOP8uEK7gFehHxSPc23/tkl+
 4WI/2W/XWUDHimIewb/7qxHGEp4VIl2zVnrnO22emaBZDuABiWjXzLhs7TWznRG4J6Wq
 SvTP7H98eP7FJ9pV1I+7cAh5T34OW57qz9vqJmrOpSaM6B4CJOI3VUhHXMxFVIbm1U+W
 7whqz9w9BMunU3iwPgs48oJhKMzlI4FDV0FJa7zHdvSc6cT20wAwOqcC458iK2fZRXw3
 Ft9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WJ6d6HTrmyDK3452g+nAg7aRJkCmSMDuUl8a7TBs5ok=;
 b=AOMLZae4C3QM5q/U/cdFuiNHvVnI0/cZDslaJLqmQK5JL+Ycm4InDwzW4pRmW5ohIZ
 SJJwMdlU0kyFXy0yEkP9x5bC4+wI4+ErSeEh7mSJbqWzAo87cCHt3/egHihgWNxQQHJC
 cFCkM78Aqt1Dz5leyySxpXe6XiTd0+r6l/D9UgHi6ieBA+RHd+Ueg8F0SJbW8rSArfeG
 GyquD9zpNMbvNaj7QAiV+DzW0657saQDZoXG86Y0nLFUT4kHX6RiPZs7ZDrnmgTdpCrf
 8dOUWiaqXuF9qKI3+8kHcR0rX7jdRYXXXWIqVwolTUhNtYvLEYw1qxjLUXg6ygnrlYl8
 3ckQ==
X-Gm-Message-State: AOAM533sF9oKCTV7koWVtVNnu+2jicdbiaPcooOA6yxz0VIusP02XMCe
 9TrIDkDzOQ2Vuu3hZQG+ToD+RNL+k+Y=
X-Google-Smtp-Source: ABdhPJySHRwTdec+IvieCe/bsIGwdrNgFq+Z+nBCgcDzL01GwxmQ1nrMh7lW4S8rYTDHtAWQPDVz7A==
X-Received: by 2002:a05:6402:51d4:: with SMTP id
 r20mr11876481edd.112.1616187827775; 
 Fri, 19 Mar 2021 14:03:47 -0700 (PDT)
Received: from twisty.localdomain
 (dynamic-2a01-0c23-7833-6000-6cbb-50d4-b91e-5b37.c23.pool.telefonica.de.
 [2a01:c23:7833:6000:6cbb:50d4:b91e:5b37])
 by smtp.gmail.com with ESMTPSA id jj15sm4353122ejc.99.2021.03.19.14.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 14:03:47 -0700 (PDT)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/amd/display: Increase linebuffer pixel depth to 36bpp.
Date: Fri, 19 Mar 2021 22:03:15 +0100
Message-Id: <20210319210317.32369-4-mario.kleiner.de@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20210319210317.32369-1-mario.kleiner.de@gmail.com>
References: <20210319210317.32369-1-mario.kleiner.de@gmail.com>
MIME-Version: 1.0
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
Cc: alexander.deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Testing with the photometer shows that at least Raven Ridge DCN-1.0
does not achieve more than 10 bpc effective output precision with a
16 bpc unorm surface of type SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616,
unless linebuffer depth is increased from LB_PIXEL_DEPTH_30BPP to
LB_PIXEL_DEPTH_36BPP. Otherwise precision gets truncated somewhere
to 10 bpc effective depth.

Strangely this increase was not needed on Polaris11 DCE-11.2 during
testing to get 12 bpc effective precision. It also is not needed for
fp16 framebuffers.

Tested on DCN-1.0 and DCE-11.2.

Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c          | 7 +++++--
 drivers/gpu/drm/amd/display/dc/dce/dce_transform.c         | 6 ++++--
 drivers/gpu/drm/amd/display/dc/dce110/dce110_transform_v.c | 3 ++-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c           | 3 ++-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  | 2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c           | 3 ++-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c         | 2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c           | 3 ++-
 8 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index f1aed40b3124..51e91b546d69 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -1167,9 +1167,12 @@ bool resource_build_scaling_params(struct pipe_ctx *pipe_ctx)
 
 	/**
 	 * Setting line buffer pixel depth to 24bpp yields banding
-	 * on certain displays, such as the Sharp 4k
+	 * on certain displays, such as the Sharp 4k. 36bpp is needed
+	 * to support SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616 and
+	 * SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616 with actual > 10 bpc
+	 * precision on at least DCN display engines.
 	 */
-	pipe_ctx->plane_res.scl_data.lb_params.depth = LB_PIXEL_DEPTH_30BPP;
+	pipe_ctx->plane_res.scl_data.lb_params.depth = LB_PIXEL_DEPTH_36BPP;
 	pipe_ctx->plane_res.scl_data.lb_params.alpha_en = plane_state->per_pixel_alpha;
 
 	pipe_ctx->plane_res.scl_data.recout.x += timing->h_border_left;
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_transform.c b/drivers/gpu/drm/amd/display/dc/dce/dce_transform.c
index 151dc7bf6d23..92b53a30d954 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_transform.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_transform.c
@@ -1647,7 +1647,8 @@ void dce_transform_construct(
 	xfm_dce->lb_pixel_depth_supported =
 			LB_PIXEL_DEPTH_18BPP |
 			LB_PIXEL_DEPTH_24BPP |
-			LB_PIXEL_DEPTH_30BPP;
+			LB_PIXEL_DEPTH_30BPP |
+			LB_PIXEL_DEPTH_36BPP;
 
 	xfm_dce->lb_bits_per_entry = LB_BITS_PER_ENTRY;
 	xfm_dce->lb_memory_size = LB_TOTAL_NUMBER_OF_ENTRIES; /*0x6B0*/
@@ -1675,7 +1676,8 @@ void dce60_transform_construct(
 	xfm_dce->lb_pixel_depth_supported =
 			LB_PIXEL_DEPTH_18BPP |
 			LB_PIXEL_DEPTH_24BPP |
-			LB_PIXEL_DEPTH_30BPP;
+			LB_PIXEL_DEPTH_30BPP |
+			LB_PIXEL_DEPTH_36BPP;
 
 	xfm_dce->lb_bits_per_entry = LB_BITS_PER_ENTRY;
 	xfm_dce->lb_memory_size = LB_TOTAL_NUMBER_OF_ENTRIES; /*0x6B0*/
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_transform_v.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_transform_v.c
index 29438c6050db..45bca0db5e5e 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_transform_v.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_transform_v.c
@@ -708,7 +708,8 @@ bool dce110_transform_v_construct(
 	xfm_dce->lb_pixel_depth_supported =
 			LB_PIXEL_DEPTH_18BPP |
 			LB_PIXEL_DEPTH_24BPP |
-			LB_PIXEL_DEPTH_30BPP;
+			LB_PIXEL_DEPTH_30BPP |
+			LB_PIXEL_DEPTH_36BPP;
 
 	xfm_dce->prescaler_on = true;
 	xfm_dce->lb_bits_per_entry = LB_BITS_PER_ENTRY;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c
index a77e7bd3b8d5..91fdfcd8a14e 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c
@@ -568,7 +568,8 @@ void dpp1_construct(
 	dpp->lb_pixel_depth_supported =
 		LB_PIXEL_DEPTH_18BPP |
 		LB_PIXEL_DEPTH_24BPP |
-		LB_PIXEL_DEPTH_30BPP;
+		LB_PIXEL_DEPTH_30BPP |
+		LB_PIXEL_DEPTH_36BPP;
 
 	dpp->lb_bits_per_entry = LB_BITS_PER_ENTRY;
 	dpp->lb_memory_size = LB_TOTAL_NUMBER_OF_ENTRIES; /*0x1404*/
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index 89912bb5014f..25d198f60a1c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -2470,7 +2470,7 @@ static void update_scaler(struct pipe_ctx *pipe_ctx)
 			pipe_ctx->plane_state->per_pixel_alpha && pipe_ctx->bottom_pipe;
 
 	pipe_ctx->plane_res.scl_data.lb_params.alpha_en = per_pixel_alpha;
-	pipe_ctx->plane_res.scl_data.lb_params.depth = LB_PIXEL_DEPTH_30BPP;
+	pipe_ctx->plane_res.scl_data.lb_params.depth = LB_PIXEL_DEPTH_36BPP;
 	/* scaler configuration */
 	pipe_ctx->plane_res.dpp->funcs->dpp_set_scaler(
 			pipe_ctx->plane_res.dpp, &pipe_ctx->plane_res.scl_data);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c
index f2f44ddf522a..a9e420c7d75a 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c
@@ -432,7 +432,8 @@ bool dpp2_construct(
 	dpp->lb_pixel_depth_supported =
 		LB_PIXEL_DEPTH_18BPP |
 		LB_PIXEL_DEPTH_24BPP |
-		LB_PIXEL_DEPTH_30BPP;
+		LB_PIXEL_DEPTH_30BPP |
+		LB_PIXEL_DEPTH_36BPP;
 
 	dpp->lb_bits_per_entry = LB_BITS_PER_ENTRY;
 	dpp->lb_memory_size = LB_TOTAL_NUMBER_OF_ENTRIES; /*0x1404*/
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index 0726fb435e2a..cd924f4688e1 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -1467,7 +1467,7 @@ static void dcn20_update_dchubp_dpp(
 			plane_state->update_flags.bits.per_pixel_alpha_change ||
 			pipe_ctx->stream->update_flags.bits.scaling) {
 		pipe_ctx->plane_res.scl_data.lb_params.alpha_en = pipe_ctx->plane_state->per_pixel_alpha;
-		ASSERT(pipe_ctx->plane_res.scl_data.lb_params.depth == LB_PIXEL_DEPTH_30BPP);
+		ASSERT(pipe_ctx->plane_res.scl_data.lb_params.depth == LB_PIXEL_DEPTH_36BPP);
 		/* scaler configuration */
 		pipe_ctx->plane_res.dpp->funcs->dpp_set_scaler(
 				pipe_ctx->plane_res.dpp, &pipe_ctx->plane_res.scl_data);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
index 0bc5c5eba7af..9c8138e52ded 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
@@ -1443,7 +1443,8 @@ bool dpp3_construct(
 	dpp->lb_pixel_depth_supported =
 		LB_PIXEL_DEPTH_18BPP |
 		LB_PIXEL_DEPTH_24BPP |
-		LB_PIXEL_DEPTH_30BPP;
+		LB_PIXEL_DEPTH_30BPP |
+		LB_PIXEL_DEPTH_36BPP;
 
 	dpp->lb_bits_per_entry = LB_BITS_PER_ENTRY;
 	dpp->lb_memory_size = LB_TOTAL_NUMBER_OF_ENTRIES; /*0x1404*/
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
