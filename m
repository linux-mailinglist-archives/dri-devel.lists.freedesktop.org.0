Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E7A3094C3
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 12:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F5976ECA2;
	Sat, 30 Jan 2021 11:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B1F6EB41;
 Fri, 29 Jan 2021 18:15:27 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id x21so10237606iog.10;
 Fri, 29 Jan 2021 10:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/0fATYjcdJLSc2/pVck+A/BrJt10YSf2Y8cyXjqnWuw=;
 b=LX8O8N5PPJhGEO22Nlz0IQISCpUCBGBOVdbtSeOSbuiOz8NtikU8KHo1gH88OJ/0GV
 dbTu7GDsXobe7oZIU5RUlu+O9dmvD+CFE8ytZykOAdHhtVowagl/cFghoJaNpmVLhrSS
 1Sx5VeEdk8OWOcza3vurGTThGnYbxliz75ZfOM7KXbA9Gyj32n0MkL+JU6qrJY5cplB8
 U+jX5I6djo/bRD6OFMAw+1fJPo8DJK1aBW7safE7B9RJ5e86Yd4q5SzuImrKtjqpF7XR
 ZvUJc2GGG4jG0dja69qF3+0g0WWtHvZulKcqScrUvU7fTrpn/Q5d73J204rCoCicEcwT
 n+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/0fATYjcdJLSc2/pVck+A/BrJt10YSf2Y8cyXjqnWuw=;
 b=ijpLBMBbtYxzkhGELOF5At8VAib1nO+4KFcEXIpjnfqUEuSuB7ORUGGBAuEIQ8mAjv
 bm0fBOMNMNqvNCMtJRfGNgsZTPR+s2crsccXjNZkBTpCi2kf1c2ziwwNsmIzQdxsiuJ6
 8VN1+cjiNWspYjEmLDjRxQnDcA9mkzuTRIUgKvmBQKBsOkRAMUurxz2X7g0iJiqEKLjh
 K7PofwjNaw8KaZ5nMX2CD5KATh0ooKfmSWaZQ1rLY143e2fDlQdg5ZxJajF+BP/01Qy5
 UF/6BHzrkSmJq9GO2LijE+k2ihBGXtpcmSK6X9CyLeymOwSLHujkERq/GOjc+wrREgZw
 DkoA==
X-Gm-Message-State: AOAM530IeuzCbUZ46jsUHAtO/pC8bQj8xJ2nYy2eVExHv8eKYbQfKKjh
 6VSTK79CIgHVkybYYsI0dWQ=
X-Google-Smtp-Source: ABdhPJwviUtqDztD3m8eCn+z/bX+FT0/4HmeG+Wy4LypLATStdhUBa9wAQKjQFmH/Kct3i8SU3jfIg==
X-Received: by 2002:a5e:c91a:: with SMTP id z26mr4413552iol.89.1611944126885; 
 Fri, 29 Jan 2021 10:15:26 -0800 (PST)
Received: from llvm-development.us-central1-a.c.llvm-285123.internal
 (85.235.72.34.bc.googleusercontent.com. [34.72.235.85])
 by smtp.googlemail.com with ESMTPSA id r129sm4535791iod.14.2021.01.29.10.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 10:15:26 -0800 (PST)
From: Vinicius Tinti <viniciustinti@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/i915: Remove unreachable code
Date: Fri, 29 Jan 2021 18:15:19 +0000
Message-Id: <20210129181519.69963-1-viniciustinti@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 30 Jan 2021 11:28:30 +0000
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
Cc: intel-gfx@lists.freedesktop.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 clang-built-linux@googlegroups.com, Vinicius Tinti <viniciustinti@gmail.com>,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

By enabling -Wunreachable-code-aggressive on Clang the following code
paths are unreachable.

Commit ce22c320b8ca ("drm/i915/sdvo: convert to encoder disable/enable")
Commit 19f1f627b333 ("drm/i915/gt: Move ivb GT workarounds from
init_clock_gating to workarounds")
Commit 0a97015d45ee ("drm/i915: Compress GPU objects in error state")

By removing the unreachable code at
drivers/gpu/drm/i915/display/intel_sdvo.c the function
intel_sdvo_set_encoder_power_state becomes unused.

Commit ea5b213ad4b1 ("drm/i915: Subclass intel_encoder.")

Clang warns unreachable:

drivers/gpu/drm/i915/display/intel_sdvo.c:1768:3: warning: code will never
be executed [-Wunreachable-code]
                intel_sdvo_set_encoder_power_state(intel_sdvo,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/display/intel_sdvo.c:1767:6: note: silence by adding
parentheses to mark code as explicitly dead
        if (0)
            ^
            /* DISABLES CODE */ ( )
drivers/gpu/drm/i915/display/intel_sdvo.c:1852:3: warning: code will never
be executed [-Wunreachable-code]
                intel_sdvo_set_encoder_power_state(intel_sdvo,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/display/intel_sdvo.c:1851:6: note: silence by adding
parentheses to mark code as explicitly dead
        if (0)
            ^
            /* DISABLES CODE */ ( )

drivers/gpu/drm/i915/gt/intel_workarounds.c:884:3: warning: code will never
be executed [-Wunreachable-code]
                wa_masked_dis(wal, CACHE_MODE_0_GEN7, HIZ_RAW_STALL_OPT_DISABLE);
                ^~~~~~~~~~~~~
drivers/gpu/drm/i915/gt/intel_workarounds.c:882:6: note: silence by adding
parentheses to mark code as explicitly dead
        if (0) { /* causes HiZ corruption on ivb:gt1 */
            ^
            /* DISABLES CODE */ ( )

drivers/gpu/drm/i915/i915_gpu_error.c:319:11: warning: code will never be
executed [-Wunreachable-code]
        if (0 && zstream->total_out > zstream->total_in)
                 ^~~~~~~
drivers/gpu/drm/i915/i915_gpu_error.c:319:6: note: silence by adding
parentheses to mark code as explicitly dead
        if (0 && zstream->total_out > zstream->total_in)
            ^
            /* DISABLES CODE */ ( )

Clang warns unused after removing unreachable:

drivers/gpu/drm/i915/display/intel_sdvo.c:696:13: warning: unused function
'intel_sdvo_set_encoder_power_state' [-Wunused-function]
static bool intel_sdvo_set_encoder_power_state(struct intel_sdvo *intel_sdvo,
            ^

Signed-off-by: Vinicius Tinti <viniciustinti@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_sdvo.c   | 30 ---------------------
 drivers/gpu/drm/i915/gt/intel_workarounds.c |  5 ----
 drivers/gpu/drm/i915/i915_gpu_error.c       |  4 ---
 3 files changed, 39 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 4eaa4aa86ecd..45d03b09f8f0 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -693,30 +693,6 @@ static bool intel_sdvo_get_active_outputs(struct intel_sdvo *intel_sdvo,
 				    outputs, sizeof(*outputs));
 }
 
-static bool intel_sdvo_set_encoder_power_state(struct intel_sdvo *intel_sdvo,
-					       int mode)
-{
-	u8 state = SDVO_ENCODER_STATE_ON;
-
-	switch (mode) {
-	case DRM_MODE_DPMS_ON:
-		state = SDVO_ENCODER_STATE_ON;
-		break;
-	case DRM_MODE_DPMS_STANDBY:
-		state = SDVO_ENCODER_STATE_STANDBY;
-		break;
-	case DRM_MODE_DPMS_SUSPEND:
-		state = SDVO_ENCODER_STATE_SUSPEND;
-		break;
-	case DRM_MODE_DPMS_OFF:
-		state = SDVO_ENCODER_STATE_OFF;
-		break;
-	}
-
-	return intel_sdvo_set_value(intel_sdvo,
-				    SDVO_CMD_SET_ENCODER_POWER_STATE, &state, sizeof(state));
-}
-
 static bool intel_sdvo_get_input_pixel_clock_range(struct intel_sdvo *intel_sdvo,
 						   int *clock_min,
 						   int *clock_max)
@@ -1764,9 +1740,6 @@ static void intel_disable_sdvo(struct intel_atomic_state *state,
 		intel_sdvo_disable_audio(intel_sdvo);
 
 	intel_sdvo_set_active_outputs(intel_sdvo, 0);
-	if (0)
-		intel_sdvo_set_encoder_power_state(intel_sdvo,
-						   DRM_MODE_DPMS_OFF);
 
 	temp = intel_de_read(dev_priv, intel_sdvo->sdvo_reg);
 
@@ -1848,9 +1821,6 @@ static void intel_enable_sdvo(struct intel_atomic_state *state,
 			    "sync\n", SDVO_NAME(intel_sdvo));
 	}
 
-	if (0)
-		intel_sdvo_set_encoder_power_state(intel_sdvo,
-						   DRM_MODE_DPMS_ON);
 	intel_sdvo_set_active_outputs(intel_sdvo, intel_sdvo->attached_output);
 
 	if (pipe_config->has_audio)
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index adc9a8ea410a..d60ff2c67138 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -879,11 +879,6 @@ ivb_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
 			   GEN7_FF_VS_SCHED_HW |
 			   GEN7_FF_DS_SCHED_HW);
 
-	if (0) { /* causes HiZ corruption on ivb:gt1 */
-		/* enable HiZ Raw Stall Optimization */
-		wa_masked_dis(wal, CACHE_MODE_0_GEN7, HIZ_RAW_STALL_OPT_DISABLE);
-	}
-
 	/* WaDisable4x2SubspanOptimization:ivb */
 	wa_masked_en(wal, CACHE_MODE_1, PIXEL_SUBSPAN_COLLECT_OPT_DISABLE);
 
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index d8cac4c5881f..6ec699da1dc2 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -315,10 +315,6 @@ static int compress_page(struct i915_vma_compress *c,
 		cond_resched();
 	} while (zstream->avail_in);
 
-	/* Fallback to uncompressed if we increase size? */
-	if (0 && zstream->total_out > zstream->total_in)
-		return -E2BIG;
-
 	return 0;
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
