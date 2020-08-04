Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D730F23C18F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 23:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D266E4C1;
	Tue,  4 Aug 2020 21:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F896E40B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 21:32:16 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r4so35761367wrx.9
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 14:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=47JcZu/KnFFqFnaStS2hjXlkg5regQDjSXEYEdPuwqY=;
 b=tKPUh+M48BAwjT5+r2ocdAUqvai6XiYnNHK8hHJ8xzqxlVgRRBmdKWpFn/8sLgPND2
 cEU/Hs/40JPSmn/Z68ArJk7L2bewt9zcGXRKVe5HY+0m1C5S1lFi4+1LT3XMX9rHQ7qA
 GFR5mjMklN6rFaQ8H6B12ScYM8GkhKh3EoGNvtRVxz5wwjKveWaSS6qJFweFDn6I9dnv
 oU0uEMgO1DIrXy6dCrowkKVQWPWzJZaFIgntXgp9tHZLfir3Zhv6lyfN8oQACdJJQKQ4
 o/iDRZbn00XoZd1UIUsxtI0opUuza1BCWvai9FHokUQrRW/X5vUq0gS82JnUckHHtYaa
 X0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=47JcZu/KnFFqFnaStS2hjXlkg5regQDjSXEYEdPuwqY=;
 b=XrlT033Ser0NG71o8/WqYEOYqVd9tJPidPSjzsvJRaz6PEC3akok/PYKY9P9QeUKHh
 WELNyLvdm7z/XuP5Rzn/UTQ1zO38+9MtltAhiScidJ5uBsjOsVWwe34Cm0Ppt6CRe8/J
 V9hEzquJjOJSDM4HlESs70th1gLWcC4umvn6trOjK/PXBuRs5ALzDfBrY+OqsibblMtv
 zkj9OJKDakOmrtVEzKbYIcLUT615RBo1MA0Kh7CmIOfp6buESCVBKcsb0vBM6Q5PnQkN
 a2u1npMDuKNBbT2A0GHa6+nClwpbfxIKFn7rh/Fueh//AOyaUTMbSGHWAue2c2Ymv0xv
 iZtw==
X-Gm-Message-State: AOAM5306fECs9hRZjQkdtUU3a/4FNwAwBCPWGhR/Mwqwaf2aSWYuQ3ei
 FW6Lj9mJ8conkcmGVO8gRmhA4Q==
X-Google-Smtp-Source: ABdhPJxk/R2bCB+oPi6letnIsMqk0D9FRmVaAFLWZVaxpCXKFo2J3MoDr8aD2YSjTBDFIIo2IJAP3Q==
X-Received: by 2002:adf:ec45:: with SMTP id w5mr21363206wrn.415.1596576735306; 
 Tue, 04 Aug 2020 14:32:15 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:aa12:a77f:2000:ce92:471f:873f:fc56])
 by smtp.gmail.com with ESMTPSA id x11sm97612wmc.33.2020.08.04.14.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 14:32:14 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 7/8] drm/amd/display: Add formats for DCC with 2/3 planes.
Date: Tue,  4 Aug 2020 23:31:18 +0200
Message-Id: <20200804213119.25091-8-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200804213119.25091-1-bas@basnieuwenhuizen.nl>
References: <20200804213119.25091-1-bas@basnieuwenhuizen.nl>
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
Cc: maraeo@gmail.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For DCC we will use 2/3 planes to avoid X rendering to the frontbuffer
with DCC compressed images. To make this work with the core KMS
validation we need to add extra formats with the extra planes.

However, due to flexibility we set bpp = 0 for the extra planes and
do the validation ourselves.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index ac913b8f10ef..c38257081868 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -170,6 +170,8 @@ static bool amdgpu_dm_psr_enable(struct dc_stream_state *stream);
 static bool amdgpu_dm_link_setup_psr(struct dc_stream_state *stream);
 static bool amdgpu_dm_psr_disable(struct dc_stream_state *stream);
 
+static const struct drm_format_info *
+amd_get_format_info(const struct drm_mode_fb_cmd2 *cmd);
 
 /*
  * dm_vblank_get_counter
@@ -2007,6 +2009,7 @@ const struct amdgpu_ip_block_version dm_ip_block =
 
 static const struct drm_mode_config_funcs amdgpu_dm_mode_funcs = {
 	.fb_create = amdgpu_display_user_framebuffer_create,
+	.get_format_info = amd_get_format_info,
 	.output_poll_changed = drm_fb_helper_output_poll_changed,
 	.atomic_check = amdgpu_dm_atomic_check,
 	.atomic_commit = amdgpu_dm_atomic_commit,
@@ -3769,6 +3772,98 @@ modifier_gfx9_swizzle_mode(uint64_t modifier)
 	return AMD_FMT_MOD_GET(TILE, modifier);
 }
 
+static const struct drm_format_info dcc_formats[] = {
+	{ .format = DRM_FORMAT_XRGB8888, .depth = 24, .num_planes = 2,
+	  .cpp = { 4, 0, }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1, },
+	 { .format = DRM_FORMAT_XBGR8888, .depth = 24, .num_planes = 2,
+	  .cpp = { 4, 0, }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1, },
+	{ .format = DRM_FORMAT_ARGB8888, .depth = 32, .num_planes = 2,
+	  .cpp = { 4, 0, }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1,
+	   .has_alpha = true, },
+	{ .format = DRM_FORMAT_ABGR8888, .depth = 32, .num_planes = 2,
+	  .cpp = { 4, 0, }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1,
+	  .has_alpha = true, },
+	{ .format = DRM_FORMAT_BGRA8888, .depth = 32, .num_planes = 2,
+	  .cpp = { 4, 0, }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1,
+	  .has_alpha = true, },
+	{ .format = DRM_FORMAT_XRGB2101010, .depth = 30, .num_planes = 2,
+	  .cpp = { 4, 0, }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1, },
+	{ .format = DRM_FORMAT_XBGR2101010, .depth = 30, .num_planes = 2,
+	  .cpp = { 4, 0, }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1, },
+	{ .format = DRM_FORMAT_ARGB2101010, .depth = 30, .num_planes = 2,
+	  .cpp = { 4, 0, }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1,
+	  .has_alpha = true, },
+	{ .format = DRM_FORMAT_ABGR2101010, .depth = 30, .num_planes = 2,
+	  .cpp = { 4, 0, }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1,
+	  .has_alpha = true, },
+	{ .format = DRM_FORMAT_RGB565, .depth = 16, .num_planes = 2,
+	  .cpp = { 2, 0, }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1, },
+};
+
+static const struct drm_format_info dcc_retile_formats[] = {
+	{ .format = DRM_FORMAT_XRGB8888, .depth = 24, .num_planes = 3,
+	  .cpp = { 4, 0, 0 }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1, },
+	 { .format = DRM_FORMAT_XBGR8888, .depth = 24, .num_planes = 3,
+	  .cpp = { 4, 0, 0 }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1, },
+	{ .format = DRM_FORMAT_ARGB8888, .depth = 32, .num_planes = 3,
+	  .cpp = { 4, 0, 0 }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1,
+	   .has_alpha = true, },
+	{ .format = DRM_FORMAT_ABGR8888, .depth = 32, .num_planes = 3,
+	  .cpp = { 4, 0, 0 }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1,
+	  .has_alpha = true, },
+	{ .format = DRM_FORMAT_BGRA8888, .depth = 32, .num_planes = 3,
+	  .cpp = { 4, 0, 0 }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1,
+	  .has_alpha = true, },
+	{ .format = DRM_FORMAT_XRGB2101010, .depth = 30, .num_planes = 3,
+	  .cpp = { 4, 0, 0 }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1, },
+	{ .format = DRM_FORMAT_XBGR2101010, .depth = 30, .num_planes = 3,
+	  .cpp = { 4, 0, 0 }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1, },
+	{ .format = DRM_FORMAT_ARGB2101010, .depth = 30, .num_planes = 3,
+	  .cpp = { 4, 0, 0 }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1,
+	  .has_alpha = true, },
+	{ .format = DRM_FORMAT_ABGR2101010, .depth = 30, .num_planes = 3,
+	  .cpp = { 4, 0, 0 }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1,
+	  .has_alpha = true, },
+	{ .format = DRM_FORMAT_RGB565, .depth = 16, .num_planes = 3,
+	  .cpp = { 2, 0, 0 }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1, },
+};
+
+
+static const struct drm_format_info *
+lookup_format_info(const struct drm_format_info formats[],
+		  int num_formats, u32 format)
+{
+	int i;
+
+	for (i = 0; i < num_formats; i++) {
+		if (formats[i].format == format)
+			return &formats[i];
+	}
+
+	return NULL;
+}
+
+static const struct drm_format_info *
+amd_get_format_info(const struct drm_mode_fb_cmd2 *cmd)
+{
+	uint64_t modifier = cmd->modifier[0];
+
+	if (!IS_AMD_FMT_MOD(modifier))
+		return NULL;
+
+	if (AMD_FMT_MOD_GET(DCC_RETILE, modifier))
+		return lookup_format_info(dcc_retile_formats,
+					  ARRAY_SIZE(dcc_retile_formats),
+					  cmd->pixel_format);
+
+	if (AMD_FMT_MOD_GET(DCC, modifier))
+		return lookup_format_info(dcc_formats, ARRAY_SIZE(dcc_formats),
+					  cmd->pixel_format);
+
+	/* returning NULL will cause the default format structs to be used. */
+	return NULL;
+}
+
 static void
 fill_gfx9_tiling_info_from_modifier(const struct amdgpu_device *adev,
 				  union dc_tiling_info *tiling_info,
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
