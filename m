Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CD7605857
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 09:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C8410E3B1;
	Thu, 20 Oct 2022 07:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCA210F261;
 Wed, 19 Oct 2022 15:15:51 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 d18-20020a05683025d200b00661c6f1b6a4so9674426otu.1; 
 Wed, 19 Oct 2022 08:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YSVgaKNXyxpO41DTy0BTahGVEiOe5fIDHOgNw0HwhPM=;
 b=cCbTjFt+C5i0OVzcCHYuZzDRxMgeqNVGqFVUD+UeT4GQu+O1iPL9HnNphGCLOOyNa4
 XUCBZVDPXZK43OOd1YQMu/f/u3MszrQne0aFnaZT25PST6VaXIhdBHX1zEqXoGDrNf22
 0eDyYL3UoK09bkfyDu+LL8pGout1AfknvWMdSY1pzTO94N18wXQ8izdfOvDnNsFqc3eA
 18gWlcNlZx1efYPcchHg76f6MwoNpMOtK5KJocgCtPdFuJNn+NA6Q5kHZKKJmlblECbn
 UJeLDGLy/Z4fNpt7dvZuxcUntFpZnTa09GqFByKkqqYTWV+/PVGNGtkFnbV6JpLg82/D
 qNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YSVgaKNXyxpO41DTy0BTahGVEiOe5fIDHOgNw0HwhPM=;
 b=VlBowhvM8BT6PRAGWksmTuDI2Qze8dhbu1bmnRgE22fEeaMF7zWwSTdMtPPOW0dd6v
 E5kCyosykOMbgBshxxI3NmuhVXdpB/L6qVViI62svayB4dPEjJk0KGomkFx24JAi2ds6
 jf7Qwwm1EuMQ7BEdcG0TLsZch0UKDS+s3SMBj90iIbq+GwnIUeay3RjfuGjfLu95gvsV
 7wJZHqIsGrai7vc7XuYvRptCJobyMWkUJA4yScmvP+UOmGX5Kn88QIAZPO8XfLRiP2LD
 iKapZmahSSnJm2qAtR4jdxU/sQk9W+mTD5csROALyQnAoKlWaChde2AjFJPa06JV6feU
 4qhA==
X-Gm-Message-State: ACrzQf3piKjBw6lvwHkma+eBhb6B5xG67miNFqPX41Uv6Hp8wySW0STc
 ZlikCUHS7FM+RIWESSIc4OI=
X-Google-Smtp-Source: AMsMyM6rbHe6IbHaUmgRC1aH6iIMov2Nl64pN/edAXH6uoCOmsf2ixnJtpb4/cSPzWSKg7Mj8utmmQ==
X-Received: by 2002:a05:6830:4b5:b0:661:d8ee:b4ac with SMTP id
 l21-20020a05683004b500b00661d8eeb4acmr4123516otd.296.1666192550659; 
 Wed, 19 Oct 2022 08:15:50 -0700 (PDT)
Received: from smeagol.fibertel.com.ar ([201.235.4.68])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a4aa9c5000000b00480e77f90f9sm707635oon.41.2022.10.19.08.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 08:15:49 -0700 (PDT)
From: =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>
To: harry.wentland@amd.com
Subject: [PATCH] drm/amd/display: Revert logic for plane modifiers
Date: Wed, 19 Oct 2022 12:15:43 -0300
Message-Id: <20221019151543.22753-1-samsagax@gmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Oct 2022 07:21:18 +0000
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
Cc: sunpeng.li@amd.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com,
 =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This file was split in commit 5d945cbcd4b16a29d6470a80dfb19738f9a4319f
("drm/amd/display: Create a file dedicated to planes") the logic in
dm_plane_format_mod_supported() function got changed by a switch logic.
That change broke drm_plane modifiers setting on series 5000 APUs
(tested on OXP mini AMD 5800U and HP Dev One 5850U PRO)
leading to Gamescope not working as reproted on GitHub[1]

To reproduce the issue, enter a TTY and run:

$ gamescope -- vkcube

With said commit applied it will abort. This one restores the old logic,
fixing the issue that affects Gamescope.

[1](https://github.com/Plagman/gamescope/issues/624)

Signed-off-by: Joaquín Ignacio Aramendía <samsagax@gmail.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 50 +++----------------
 1 file changed, 8 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index dfd3be49eac8..81c1fc9468b8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1371,6 +1371,8 @@ static bool dm_plane_format_mod_supported(struct drm_plane *plane,
 	const struct drm_format_info *info = drm_format_info(format);
 	struct hw_asic_id asic_id = adev->dm.dc->ctx->asic_id;
 
+	int i;
+
 	enum dm_micro_swizzle microtile = modifier_gfx9_swizzle_mode(modifier) & 3;
 
 	if (!info)
@@ -1386,49 +1388,13 @@ static bool dm_plane_format_mod_supported(struct drm_plane *plane,
 		return true;
 	}
 
-	/* check if swizzle mode is supported by this version of DCN */
-	switch (asic_id.chip_family) {
-	case FAMILY_SI:
-	case FAMILY_CI:
-	case FAMILY_KV:
-	case FAMILY_CZ:
-	case FAMILY_VI:
-		/* asics before AI does not have modifier support */
-		return false;
-	case FAMILY_AI:
-	case FAMILY_RV:
-	case FAMILY_NV:
-	case FAMILY_VGH:
-	case FAMILY_YELLOW_CARP:
-	case AMDGPU_FAMILY_GC_10_3_6:
-	case AMDGPU_FAMILY_GC_10_3_7:
-		switch (AMD_FMT_MOD_GET(TILE, modifier)) {
-		case AMD_FMT_MOD_TILE_GFX9_64K_R_X:
-		case AMD_FMT_MOD_TILE_GFX9_64K_D_X:
-		case AMD_FMT_MOD_TILE_GFX9_64K_S_X:
-		case AMD_FMT_MOD_TILE_GFX9_64K_D:
-			return true;
-		default:
-			return false;
-		}
-		break;
-	case AMDGPU_FAMILY_GC_11_0_0:
-	case AMDGPU_FAMILY_GC_11_0_1:
-		switch (AMD_FMT_MOD_GET(TILE, modifier)) {
-		case AMD_FMT_MOD_TILE_GFX11_256K_R_X:
-		case AMD_FMT_MOD_TILE_GFX9_64K_R_X:
-		case AMD_FMT_MOD_TILE_GFX9_64K_D_X:
-		case AMD_FMT_MOD_TILE_GFX9_64K_S_X:
-		case AMD_FMT_MOD_TILE_GFX9_64K_D:
-			return true;
-		default:
-			return false;
-		}
-		break;
-	default:
-		ASSERT(0); /* Unknown asic */
-		break;
+	/* Check that the modifier is on the list of the plane's supported modifiers. */
+	for (i = 0; i < plane->modifier_count; i++) {
+		if (modifier == plane->modifiers[i])
+			break;
 	}
+	if (i == plane->modifier_count)
+		return false;
 
 	/*
 	 * For D swizzle the canonical modifier depends on the bpp, so check
-- 
2.38.0

