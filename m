Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C54F314E959
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 09:04:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6446FA9A;
	Fri, 31 Jan 2020 08:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B606F91C;
 Thu, 30 Jan 2020 08:33:00 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id m16so2872091wrx.11;
 Thu, 30 Jan 2020 00:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3dxWyTLXrZeEhnN/rlOo+rQE0cKhTGc+Bj4z4DrHgrg=;
 b=n8XC/n5ICIo9IPWZtYzatOWLUbzNLcwQeRbZ9QsawNwzhwXdyK3FgBVtyuCblVUTRO
 LvOc97rEgrifjv3dDkhuV18js9dqjraLeqbFT0e1PSVyvVbOuBlkTAYqDLec5mrGrhjx
 RBZhuAcqQj5g1d9lURFiK+nbm04lvvYU0nGUybd92D33hm1iAc7lQLJ970MGj6LMUa7M
 QKZ2isKVwNAJl34nRuVSv2vjSf8vQTkNx55e8oRpLJUqcPaZ26HKFjAJkFw2OmAqldeG
 IZXjr3kbPnTCPWsCgj39WJacx4fYcVgBisyw8T6s8uul3Pu0ihf6sYP2S08dVCjEvJBT
 +dbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3dxWyTLXrZeEhnN/rlOo+rQE0cKhTGc+Bj4z4DrHgrg=;
 b=X7uQN0yRoQqVE0BV0VEYIsQ7fitYTltxkw4N70HuPW1Mp0Sf7UvCoc0EkyY/BWML55
 UG7gPvWU/QhWAdRbNSG+QW7i3uqm7G1NGTN1z8LrnbLJxzl6C/VufHv6nnO3X/Quu4+K
 GV9f8eqb8rb/8EkjFSo6r1uGAVVMlA9iZgETxNwNWC//WmqfsBYfLxt4yaf8e49UtAva
 lYzgzMZsrvs3cmhhbs3+3de6ekUunM2iqJtLmlM7rRD1kvwBLK1v3IhIeY1FOni2kQeJ
 PF3/54NjMIknO0tAT6KjXRrYfHDLhhFFguCTLq1XwptaCq3kt2Mh8WzI1upl1e+3+LUc
 5gWw==
X-Gm-Message-State: APjAAAUiRS+JA0/s3RAMmKTSbwzuM2GQzvJZhjpJgdYlc2tUafJSoacZ
 CT6gPxXU43s4u5sMBrCDUgQ=
X-Google-Smtp-Source: APXvYqwwDretUyLMrPPyWsa2YOKUZ9nU3+0soaRFgJeZ9shCWmldX09rIgAYp/uxsGRISnW5igwjQA==
X-Received: by 2002:adf:a453:: with SMTP id e19mr3656374wra.305.1580373179237; 
 Thu, 30 Jan 2020 00:32:59 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id i11sm6363678wrs.10.2020.01.30.00.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 00:32:58 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 07/12] drm/i915/sprite: automatic conversion to drm_device
 based logging macros
Date: Thu, 30 Jan 2020 11:32:24 +0300
Message-Id: <20200130083229.12889-8-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200130083229.12889-1-wambui.karugax@gmail.com>
References: <20200130083229.12889-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 31 Jan 2020 08:04:00 +0000
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
Cc: intel-gfx@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Conversion of most instances of the printk based logging macros to the
struct drm_device based logging macros in i915/display/intel_sprite.c
This was done automatically by the following coccinelle script that
matches based on the existence of a struct drm_i915_private device:
@@
identifier fn, T;
@@

fn(...) {
...
struct drm_i915_private *T = ...;
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

@@
identifier fn, T;
@@

fn(...,struct drm_i915_private *T,...) {
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

Checkpatch warnings were fixed manually.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_sprite.c | 60 ++++++++++++---------
 1 file changed, 36 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index 2f277d1fc6f1..8a4b5ad12d58 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -113,8 +113,9 @@ void intel_pipe_update_start(const struct intel_crtc_state *new_crtc_state)
 	 * re-entry as well.
 	 */
 	if (intel_psr_wait_for_idle(new_crtc_state, &psr_status))
-		DRM_ERROR("PSR idle timed out 0x%x, atomic update may fail\n",
-			  psr_status);
+		drm_err(&dev_priv->drm,
+			"PSR idle timed out 0x%x, atomic update may fail\n",
+			psr_status);
 
 	local_irq_disable();
 
@@ -135,8 +136,9 @@ void intel_pipe_update_start(const struct intel_crtc_state *new_crtc_state)
 			break;
 
 		if (!timeout) {
-			DRM_ERROR("Potential atomic update failure on pipe %c\n",
-				  pipe_name(crtc->pipe));
+			drm_err(&dev_priv->drm,
+				"Potential atomic update failure on pipe %c\n",
+				pipe_name(crtc->pipe));
 			break;
 		}
 
@@ -221,17 +223,20 @@ void intel_pipe_update_end(struct intel_crtc_state *new_crtc_state)
 
 	if (crtc->debug.start_vbl_count &&
 	    crtc->debug.start_vbl_count != end_vbl_count) {
-		DRM_ERROR("Atomic update failure on pipe %c (start=%u end=%u) time %lld us, min %d, max %d, scanline start %d, end %d\n",
-			  pipe_name(pipe), crtc->debug.start_vbl_count,
-			  end_vbl_count,
-			  ktime_us_delta(end_vbl_time, crtc->debug.start_vbl_time),
-			  crtc->debug.min_vbl, crtc->debug.max_vbl,
-			  crtc->debug.scanline_start, scanline_end);
+		drm_err(&dev_priv->drm,
+			"Atomic update failure on pipe %c (start=%u end=%u) time %lld us, min %d, max %d, scanline start %d, end %d\n",
+			pipe_name(pipe), crtc->debug.start_vbl_count,
+			end_vbl_count,
+			ktime_us_delta(end_vbl_time,
+				       crtc->debug.start_vbl_time),
+			crtc->debug.min_vbl, crtc->debug.max_vbl,
+			crtc->debug.scanline_start, scanline_end);
 	}
 #ifdef CONFIG_DRM_I915_DEBUG_VBLANK_EVADE
 	else if (ktime_us_delta(end_vbl_time, crtc->debug.start_vbl_time) >
 		 VBLANK_EVASION_TIME_US)
-		DRM_WARN("Atomic update on pipe (%c) took %lld us, max time under evasion is %u us\n",
+		drm_warn(&dev_priv->drm,
+			 "Atomic update on pipe (%c) took %lld us, max time under evasion is %u us\n",
 			 pipe_name(pipe),
 			 ktime_us_delta(end_vbl_time, crtc->debug.start_vbl_time),
 			 VBLANK_EVASION_TIME_US);
@@ -2029,7 +2034,8 @@ int chv_plane_check_rotation(const struct intel_plane_state *plane_state)
 	if (IS_CHERRYVIEW(dev_priv) &&
 	    rotation & DRM_MODE_ROTATE_180 &&
 	    rotation & DRM_MODE_REFLECT_X) {
-		DRM_DEBUG_KMS("Cannot rotate and reflect at the same time\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "Cannot rotate and reflect at the same time\n");
 		return -EINVAL;
 	}
 
@@ -2084,21 +2090,24 @@ static int skl_plane_check_fb(const struct intel_crtc_state *crtc_state,
 
 	if (rotation & ~(DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180) &&
 	    is_ccs_modifier(fb->modifier)) {
-		DRM_DEBUG_KMS("RC support only with 0/180 degree rotation (%x)\n",
-			      rotation);
+		drm_dbg_kms(&dev_priv->drm,
+			    "RC support only with 0/180 degree rotation (%x)\n",
+			    rotation);
 		return -EINVAL;
 	}
 
 	if (rotation & DRM_MODE_REFLECT_X &&
 	    fb->modifier == DRM_FORMAT_MOD_LINEAR) {
-		DRM_DEBUG_KMS("horizontal flip is not supported with linear surface formats\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "horizontal flip is not supported with linear surface formats\n");
 		return -EINVAL;
 	}
 
 	if (drm_rotation_90_or_270(rotation)) {
 		if (fb->modifier != I915_FORMAT_MOD_Y_TILED &&
 		    fb->modifier != I915_FORMAT_MOD_Yf_TILED) {
-			DRM_DEBUG_KMS("Y/Yf tiling required for 90/270!\n");
+			drm_dbg_kms(&dev_priv->drm,
+				    "Y/Yf tiling required for 90/270!\n");
 			return -EINVAL;
 		}
 
@@ -2121,9 +2130,10 @@ static int skl_plane_check_fb(const struct intel_crtc_state *crtc_state,
 		case DRM_FORMAT_Y216:
 		case DRM_FORMAT_XVYU12_16161616:
 		case DRM_FORMAT_XVYU16161616:
-			DRM_DEBUG_KMS("Unsupported pixel format %s for 90/270!\n",
-				      drm_get_format_name(fb->format->format,
-							  &format_name));
+			drm_dbg_kms(&dev_priv->drm,
+				    "Unsupported pixel format %s for 90/270!\n",
+				    drm_get_format_name(fb->format->format,
+							&format_name));
 			return -EINVAL;
 		default:
 			break;
@@ -2139,7 +2149,8 @@ static int skl_plane_check_fb(const struct intel_crtc_state *crtc_state,
 	     fb->modifier == I915_FORMAT_MOD_Yf_TILED_CCS ||
 	     fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS ||
 	     fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS)) {
-		DRM_DEBUG_KMS("Y/Yf tiling not supported in IF-ID mode\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "Y/Yf tiling not supported in IF-ID mode\n");
 		return -EINVAL;
 	}
 
@@ -2166,10 +2177,11 @@ static int skl_plane_check_dst_coordinates(const struct intel_crtc_state *crtc_s
 	 */
 	if ((IS_GEMINILAKE(dev_priv) || IS_CANNONLAKE(dev_priv)) &&
 	    (crtc_x + crtc_w < 4 || crtc_x > pipe_src_w - 4)) {
-		DRM_DEBUG_KMS("requested plane X %s position %d invalid (valid range %d-%d)\n",
-			      crtc_x + crtc_w < 4 ? "end" : "start",
-			      crtc_x + crtc_w < 4 ? crtc_x + crtc_w : crtc_x,
-			      4, pipe_src_w - 4);
+		drm_dbg_kms(&dev_priv->drm,
+			    "requested plane X %s position %d invalid (valid range %d-%d)\n",
+			    crtc_x + crtc_w < 4 ? "end" : "start",
+			    crtc_x + crtc_w < 4 ? crtc_x + crtc_w : crtc_x,
+			    4, pipe_src_w - 4);
 		return -ERANGE;
 	}
 
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
