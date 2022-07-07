Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B65EC56AC37
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 21:50:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3570F112085;
	Thu,  7 Jul 2022 19:50:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1101112085;
 Thu,  7 Jul 2022 19:50:02 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4Lf6Sp2Dr6zDr4k;
 Thu,  7 Jul 2022 19:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1657223402; bh=ied7/wQBWyRAGNRM3YJQ9nmwASEEztOFVReHeNDPqs4=;
 h=From:To:Cc:Subject:Date:From;
 b=fOz0/Uf6U90A9zYKjLrYyhaK5DOKfrFIvBM0bBMLHLM9VoHoTj9ZNQ0iwIL5u+zEg
 AXXyOp3vVyjQtpP6Niv30wOp8BgS0agFINCJYPfOw15jlGX0oCHKxGiK25p318rtNi
 ZVCcN8sHivF7gRafsWqVjJfzsx2zMERBdPOxal4w=
X-Riseup-User-ID: 8654BB5CEEAED37E29E93B549D0D383934D30FA2C2F8B642BBBDF6AF5CF020CD
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4Lf6Sk2jRDz5vXK;
 Thu,  7 Jul 2022 19:49:58 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amd/display: Drop dm_sw_gfx7_2d_thin_l_vp and
 dm_sw_gfx7_2d_thin_gl
Date: Thu,  7 Jul 2022 16:49:49 -0300
Message-Id: <20220707194949.103978-1-mairacanal@riseup.net>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As the enum dm_sw_gfx7_2d_thin_gl and dm_sw_gfx7_2d_thin_l_vp are not
used on the codebase, this commit drops those entries from enum
dm_swizzle_mode.

Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 .../dc/dml/dcn20/display_mode_vba_20.c        | 26 +++++-------------
 .../dc/dml/dcn20/display_mode_vba_20v2.c      | 26 +++++-------------
 .../dc/dml/dcn21/display_mode_vba_21.c        | 27 +++++--------------
 .../amd/display/dc/dml/display_mode_enums.h   |  2 --
 .../display/dc/dml/dml_wrapper_translation.c  |  9 -------
 5 files changed, 19 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
index d3b5b6fedf04..4e4cb0927057 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
@@ -938,7 +938,7 @@ static unsigned int CalculateVMAndRowBytes(
 		*MetaRowByte = 0;
 	}
 
-	if (SurfaceTiling == dm_sw_linear || SurfaceTiling == dm_sw_gfx7_2d_thin_gl || SurfaceTiling == dm_sw_gfx7_2d_thin_l_vp) {
+	if (SurfaceTiling == dm_sw_linear) {
 		MacroTileSizeBytes = 256;
 		MacroTileHeight = BlockHeight256Bytes;
 	} else if (SurfaceTiling == dm_sw_4kb_s || SurfaceTiling == dm_sw_4kb_s_x
@@ -3347,26 +3347,12 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 										== dm_420_8
 								|| mode_lib->vba.SourcePixelFormat[k]
 										== dm_420_10))
-				|| (((mode_lib->vba.SurfaceTiling[k] == dm_sw_gfx7_2d_thin_gl
-						|| mode_lib->vba.SurfaceTiling[k]
-								== dm_sw_gfx7_2d_thin_l_vp)
-						&& !((mode_lib->vba.SourcePixelFormat[k]
-								== dm_444_64
+				|| (mode_lib->vba.DCCEnable[k] == true
+						&& (mode_lib->vba.SurfaceTiling[k] == dm_sw_linear
 								|| mode_lib->vba.SourcePixelFormat[k]
-										== dm_444_32)
-								&& mode_lib->vba.SourceScan[k]
-										== dm_horz
-								&& mode_lib->vba.SupportGFX7CompatibleTilingIn32bppAnd64bpp
-										== true
-								&& mode_lib->vba.DCCEnable[k]
-										== false))
-						|| (mode_lib->vba.DCCEnable[k] == true
-								&& (mode_lib->vba.SurfaceTiling[k]
-										== dm_sw_linear
-										|| mode_lib->vba.SourcePixelFormat[k]
-												== dm_420_8
-										|| mode_lib->vba.SourcePixelFormat[k]
-												== dm_420_10)))) {
+										== dm_420_8
+								|| mode_lib->vba.SourcePixelFormat[k]
+										== dm_420_10))) {
 			mode_lib->vba.SourceFormatPixelAndScanSupport = false;
 		}
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
index 63bbdf8b8678..eaa0cdb599ba 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
@@ -998,7 +998,7 @@ static unsigned int CalculateVMAndRowBytes(
 		*MetaRowByte = 0;
 	}
 
-	if (SurfaceTiling == dm_sw_linear || SurfaceTiling == dm_sw_gfx7_2d_thin_gl || SurfaceTiling == dm_sw_gfx7_2d_thin_l_vp) {
+	if (SurfaceTiling == dm_sw_linear) {
 		MacroTileSizeBytes = 256;
 		MacroTileHeight = BlockHeight256Bytes;
 	} else if (SurfaceTiling == dm_sw_4kb_s || SurfaceTiling == dm_sw_4kb_s_x
@@ -3454,26 +3454,12 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 										== dm_420_8
 								|| mode_lib->vba.SourcePixelFormat[k]
 										== dm_420_10))
-				|| (((mode_lib->vba.SurfaceTiling[k] == dm_sw_gfx7_2d_thin_gl
-						|| mode_lib->vba.SurfaceTiling[k]
-								== dm_sw_gfx7_2d_thin_l_vp)
-						&& !((mode_lib->vba.SourcePixelFormat[k]
-								== dm_444_64
+				|| (mode_lib->vba.DCCEnable[k] == true
+						&& (mode_lib->vba.SurfaceTiling[k] == dm_sw_linear
 								|| mode_lib->vba.SourcePixelFormat[k]
-										== dm_444_32)
-								&& mode_lib->vba.SourceScan[k]
-										== dm_horz
-								&& mode_lib->vba.SupportGFX7CompatibleTilingIn32bppAnd64bpp
-										== true
-								&& mode_lib->vba.DCCEnable[k]
-										== false))
-						|| (mode_lib->vba.DCCEnable[k] == true
-								&& (mode_lib->vba.SurfaceTiling[k]
-										== dm_sw_linear
-										|| mode_lib->vba.SourcePixelFormat[k]
-												== dm_420_8
-										|| mode_lib->vba.SourcePixelFormat[k]
-												== dm_420_10)))) {
+										== dm_420_8
+								|| mode_lib->vba.SourcePixelFormat[k]
+										== dm_420_10))) {
 			mode_lib->vba.SourceFormatPixelAndScanSupport = false;
 		}
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
index 8a7485e21d53..198d81861ac5 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
@@ -1342,7 +1342,7 @@ static unsigned int CalculateVMAndRowBytes(
 		*MetaRowByte = 0;
 	}
 
-	if (SurfaceTiling == dm_sw_linear || SurfaceTiling == dm_sw_gfx7_2d_thin_gl || SurfaceTiling == dm_sw_gfx7_2d_thin_l_vp) {
+	if (SurfaceTiling == dm_sw_linear) {
 		MacroTileSizeBytes = 256;
 		MacroTileHeight = BlockHeight256Bytes;
 	} else if (SurfaceTiling == dm_sw_4kb_s || SurfaceTiling == dm_sw_4kb_s_x
@@ -3579,26 +3579,13 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 										== dm_420_8
 								|| mode_lib->vba.SourcePixelFormat[k]
 										== dm_420_10))
-				|| (((mode_lib->vba.SurfaceTiling[k] == dm_sw_gfx7_2d_thin_gl
-						|| mode_lib->vba.SurfaceTiling[k]
-								== dm_sw_gfx7_2d_thin_l_vp)
-						&& !((mode_lib->vba.SourcePixelFormat[k]
-								== dm_444_64
+				|| (mode_lib->vba.DCCEnable[k] == true
+						&& (mode_lib->vba.SurfaceTiling[k]
+								== dm_sw_linear
 								|| mode_lib->vba.SourcePixelFormat[k]
-										== dm_444_32)
-								&& mode_lib->vba.SourceScan[k]
-										== dm_horz
-								&& mode_lib->vba.SupportGFX7CompatibleTilingIn32bppAnd64bpp
-										== true
-								&& mode_lib->vba.DCCEnable[k]
-										== false))
-						|| (mode_lib->vba.DCCEnable[k] == true
-								&& (mode_lib->vba.SurfaceTiling[k]
-										== dm_sw_linear
-										|| mode_lib->vba.SourcePixelFormat[k]
-												== dm_420_8
-										|| mode_lib->vba.SourcePixelFormat[k]
-												== dm_420_10)))) {
+										== dm_420_8
+								|| mode_lib->vba.SourcePixelFormat[k]
+										== dm_420_10))) {
 			mode_lib->vba.SourceFormatPixelAndScanSupport = false;
 		}
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_enums.h b/drivers/gpu/drm/amd/display/dc/dml/display_mode_enums.h
index f394b3f3922a..0e06727d40b3 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_enums.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_enums.h
@@ -89,8 +89,6 @@ enum dm_swizzle_mode {
 	dm_sw_var_s_x = 29,
 	dm_sw_var_d_x = 30,
 	dm_sw_var_r_x = 31,
-	dm_sw_gfx7_2d_thin_l_vp,
-	dm_sw_gfx7_2d_thin_gl,
 };
 enum lb_depth {
 	dm_lb_10 = 0, dm_lb_8 = 1, dm_lb_6 = 2, dm_lb_12 = 3, dm_lb_16 = 4,
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dml_wrapper_translation.c b/drivers/gpu/drm/amd/display/dc/dml/dml_wrapper_translation.c
index 4ec5310a2962..9edcb6fc83c1 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dml_wrapper_translation.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dml_wrapper_translation.c
@@ -35,15 +35,6 @@ static void gfx10array_mode_to_dml_params(
 	case DC_ARRAY_LINEAR_GENERAL:
 		*sw_mode = dm_sw_linear;
 		break;
-	case DC_ARRAY_2D_TILED_THIN1:
-// DC_LEGACY_TILING_ADDR_GEN_ZERO - undefined as per current code hence removed
-#if 0
-		if (compat_level == DC_LEGACY_TILING_ADDR_GEN_ZERO)
-			*sw_mode = dm_sw_gfx7_2d_thin_l_vp;
-		else
-			*sw_mode = dm_sw_gfx7_2d_thin_gl;
-#endif
-		break;
 	default:
 		ASSERT(0); /* Not supported */
 		break;
-- 
2.36.1

