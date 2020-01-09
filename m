Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B1C135FC1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB4A6E943;
	Thu,  9 Jan 2020 17:51:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CBDD6E3C1;
 Thu,  9 Jan 2020 09:07:02 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y17so6524070wrh.5;
 Thu, 09 Jan 2020 01:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g8+nW7WUiZHp/JTJe3ieEHrqcqpq+rbcRaXX3uhxHvs=;
 b=OC+bfD98D0zbY38YLn1j6UUzuvzFCsCffoXx6rd75N/l27A6rInDg3eqrAq7JhZSfe
 DG5TH/0OgKZMoNsKVCR/F/6ZHsSuZdI8h7T1WnTUa2RarMO3IpiAncNvcQT5KgsrIXWj
 ThXdo7sidBhOB/wY6g5Dk7DOGKxzxCzzHPz1qfbfghYVMB46sLHofTAzlAxFm403evhO
 iUHPp/RTMP1zLjtRwtLJT7ZGYZcFaL31inuCWL38jRxnOD+isDXRSYD/HTysAgCHNrsS
 z8SlhxOv8pI4DC6jGm5x6ju+zg14BuRzJu1vYod4KgYc0QrnolfPoEpGQdoLItjjWRSj
 HTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g8+nW7WUiZHp/JTJe3ieEHrqcqpq+rbcRaXX3uhxHvs=;
 b=FwN7Tmg+cM2Z/XMcHW+D+Dn9KguAskdaTT+ngckMo2Tq0Kwi4qrd+HNRaGOix2YIYx
 gTn5XXIELgFqgeXP+AoIh4YWZxzEci5KUtInUniMZxukAX1VBhwo0NK/ttZgUTzWeCIO
 2xdCo+urXN4hIMozpIubKUW+fIxywwi1pvsD0cXsnK2COrJIX+0LCh+oqRmrPElF6+Sd
 sPFAwDUWUFvlYyJvx6DFzzEz522a6Yld52RuhrxhnN03t6PYBfcA7mNk9SvY/ZFOx4nP
 98TCJ260nOqQ8Uqyo7m9R1PbD5YAHI4o3SXCw2kkdf45BbdXWrU5AoYK0f3E6Bm4cx6F
 KUuA==
X-Gm-Message-State: APjAAAU4Bi2kES/jhEGQolYZmy62YYEAiaCIEAnogkJe6V9V+YCtTv8E
 jhm5XWGsQ5gvT8q+9qlJwJg=
X-Google-Smtp-Source: APXvYqzCEUpEv+edqK9ll9+pCMUADVtECHnGemRB5PnQJQWZIgbIFRMja/Fq8jnHGZy/6Mx18My0Mw==
X-Received: by 2002:adf:fa87:: with SMTP id h7mr9357843wrr.172.1578560821062; 
 Thu, 09 Jan 2020 01:07:01 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id i8sm8004734wro.47.2020.01.09.01.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 01:07:00 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 3/5] drm/i915: conversion to new logging macros in
 i915/intel_device_info.c
Date: Thu,  9 Jan 2020 12:06:44 +0300
Message-Id: <e404429ff2a5e5080867f577beccd7b578a671cd.1578560355.git.wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1578560355.git.wambui.karugax@gmail.com>
References: <cover.1578560355.git.wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jan 2020 17:51:28 +0000
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

This replaces the printk and struct device based logging macros with the
new struct drm_device style based logging macros i915/intel_device_info.c.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/intel_device_info.c | 25 +++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index 6670a0763be2..fcdacd6d4aa5 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -974,10 +974,11 @@ void intel_device_info_runtime_init(struct drm_i915_private *dev_priv)
 		    sfuse_strap & SFUSE_STRAP_DISPLAY_DISABLED ||
 		    (HAS_PCH_CPT(dev_priv) &&
 		     !(sfuse_strap & SFUSE_STRAP_FUSE_LOCK))) {
-			DRM_INFO("Display fused off, disabling\n");
+			drm_info(&dev_priv->drm,
+				 "Display fused off, disabling\n");
 			info->pipe_mask = 0;
 		} else if (fuse_strap & IVB_PIPE_C_DISABLE) {
-			DRM_INFO("PipeC fused off\n");
+			drm_info(&dev_priv->drm, "PipeC fused off\n");
 			info->pipe_mask &= ~BIT(PIPE_C);
 		}
 	} else if (HAS_DISPLAY(dev_priv) && INTEL_GEN(dev_priv) >= 9) {
@@ -1000,8 +1001,9 @@ void intel_device_info_runtime_init(struct drm_i915_private *dev_priv)
 		 * in the mask.
 		 */
 		if (enabled_mask == 0 || !is_power_of_2(enabled_mask + 1))
-			DRM_ERROR("invalid pipe fuse configuration: enabled_mask=0x%x\n",
-				  enabled_mask);
+			drm_err(&dev_priv->drm,
+				"invalid pipe fuse configuration: enabled_mask=0x%x\n",
+				enabled_mask);
 		else
 			info->pipe_mask = enabled_mask;
 
@@ -1036,7 +1038,8 @@ void intel_device_info_runtime_init(struct drm_i915_private *dev_priv)
 		gen12_sseu_info_init(dev_priv);
 
 	if (IS_GEN(dev_priv, 6) && intel_vtd_active()) {
-		DRM_INFO("Disabling ppGTT for VT-d support\n");
+		drm_info(&dev_priv->drm,
+			 "Disabling ppGTT for VT-d support\n");
 		info->ppgtt_type = INTEL_PPGTT_NONE;
 	}
 
@@ -1084,7 +1087,7 @@ void intel_device_info_init_mmio(struct drm_i915_private *dev_priv)
 
 		if (!(BIT(i) & vdbox_mask)) {
 			info->engine_mask &= ~BIT(_VCS(i));
-			DRM_DEBUG_DRIVER("vcs%u fused off\n", i);
+			drm_dbg(&dev_priv->drm, "vcs%u fused off\n", i);
 			continue;
 		}
 
@@ -1096,8 +1099,8 @@ void intel_device_info_init_mmio(struct drm_i915_private *dev_priv)
 		if (INTEL_GEN(dev_priv) >= 12 || logical_vdbox++ % 2 == 0)
 			RUNTIME_INFO(dev_priv)->vdbox_sfc_access |= BIT(i);
 	}
-	DRM_DEBUG_DRIVER("vdbox enable: %04x, instances: %04lx\n",
-			 vdbox_mask, VDBOX_MASK(dev_priv));
+	drm_dbg(&dev_priv->drm, "vdbox enable: %04x, instances: %04lx\n",
+		vdbox_mask, VDBOX_MASK(dev_priv));
 	GEM_BUG_ON(vdbox_mask != VDBOX_MASK(dev_priv));
 
 	for (i = 0; i < I915_MAX_VECS; i++) {
@@ -1108,10 +1111,10 @@ void intel_device_info_init_mmio(struct drm_i915_private *dev_priv)
 
 		if (!(BIT(i) & vebox_mask)) {
 			info->engine_mask &= ~BIT(_VECS(i));
-			DRM_DEBUG_DRIVER("vecs%u fused off\n", i);
+			drm_dbg(&dev_priv->drm, "vecs%u fused off\n", i);
 		}
 	}
-	DRM_DEBUG_DRIVER("vebox enable: %04x, instances: %04lx\n",
-			 vebox_mask, VEBOX_MASK(dev_priv));
+	drm_dbg(&dev_priv->drm, "vebox enable: %04x, instances: %04lx\n",
+		vebox_mask, VEBOX_MASK(dev_priv));
 	GEM_BUG_ON(vebox_mask != VEBOX_MASK(dev_priv));
 }
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
