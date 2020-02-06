Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 666F0153FD7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:18:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA1146F9E6;
	Thu,  6 Feb 2020 08:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BBA6F9E6;
 Thu,  6 Feb 2020 08:01:09 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id t23so5189581wmi.1;
 Thu, 06 Feb 2020 00:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aR7AJa4TpxraXiV/vmD4e1Fv5ZwdaSLdZFP6F1Ug89g=;
 b=vPfw710jv11v5xCBzLTK3/ZPylZloymIH9VHeqyxiIbDNbmW93S1n3BQDGgS7Rqsl+
 VaYhQwLEwZHVANdZHvqePwMY3O8DANqSL8RzWtTjNaHNYFq1LmMflEhvADPdAT9HfR9W
 Iy7H1ca4oeX7HkUDv8Sd/MwQpjXGgtg9Zr3CY3LM/x4IRTmfFLqIYmsenQ87R3/nJGOH
 lgflhnZ6ny51W9l/Xk3cH5qMBDw+4GxL/rAKEaIm55z6LWovA/Get1qEIFBSGExqK4wy
 GE3ubPZptwqgzjdUw809UmVlL3dckbdFJhTVj2MeHPbZxEBbY+X+ff89Hf2mlhBri0Mt
 74oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aR7AJa4TpxraXiV/vmD4e1Fv5ZwdaSLdZFP6F1Ug89g=;
 b=PF4t6EzJvDetFL1AYNP72nAd41NwwzoLryRQ0ruQJAcfIG5QI/dwB4uESw/WNmGCtb
 Nd/HLs9qwU1uEgeiLVu2yA9uY/Q0Olm1drkWi/Fb/r62TqR7/wiAr0e1qJ6YuGLJJuP5
 MejXnow/Mwlw41f2WYekMavx85cDy6aXhtoxuuOhGwMaR1skZCST6CsmVLEz9NhcGVgm
 PpFN9ddD8g4hr8iEB/gslpmrFVSnhLGLyN3yL6MqojmZFoB4rim3rm0C35UCuDhEtHoB
 wtzFcROPVkwG+dduonHe4jZSO47uiJ1PzjBf/UpMhn719G39hUHcqt5FxCFgRFUDrOPM
 2B6g==
X-Gm-Message-State: APjAAAVVexX5qGsBn6cMZuT4sFR5WmZsyqrimXvM05HpPscbj9ZNBIQW
 CrOCnDw8L5dcXQ3Q/sYrU1w=
X-Google-Smtp-Source: APXvYqzjHdlXVZEtCdmvAFtMHRBo1SCTuZ1dS2ZWXy5re36dVbPejP27ZkwxyQGeJ+AOdw7yQvqdOA==
X-Received: by 2002:a7b:c3d1:: with SMTP id t17mr2880770wmj.27.1580976068165; 
 Thu, 06 Feb 2020 00:01:08 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id u8sm2635132wmm.15.2020.02.06.00.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 00:01:07 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 12/12] drm/i915/dpio_phy: convert to drm_device based
 logging macros.
Date: Thu,  6 Feb 2020 11:00:13 +0300
Message-Id: <20200206080014.13759-13-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200206080014.13759-1-wambui.karugax@gmail.com>
References: <20200206080014.13759-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:17:51 +0000
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

Conversion of the printk based logging macros to the struct drm_device
based logging macros in i915/display/intel_dpio_phy.c.
This was achieved using the following coccinelle semantic patch that
matches based on the existence of a drm_i915_private device:
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

Note that this converts both DRM_DEBUG/DRM_DEBUG_DRIVER to drm_dbg().
Checkpatch warnings were fixed manually.

References: https://lists.freedesktop.org/archives/dri-devel/2020-January/253381.html
Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_dpio_phy.c | 28 +++++++++++--------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpio_phy.c b/drivers/gpu/drm/i915/display/intel_dpio_phy.c
index 85d6471ac357..399a7edb4568 100644
--- a/drivers/gpu/drm/i915/display/intel_dpio_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_dpio_phy.c
@@ -294,7 +294,8 @@ void bxt_ddi_phy_set_signal_level(struct drm_i915_private *dev_priv,
 		val |= SCALE_DCOMP_METHOD;
 
 	if ((val & UNIQUE_TRANGE_EN_METHOD) && !(val & SCALE_DCOMP_METHOD))
-		DRM_ERROR("Disabled scaling while ouniqetrangenmethod was set");
+		drm_err(&dev_priv->drm,
+			"Disabled scaling while ouniqetrangenmethod was set");
 
 	intel_de_write(dev_priv, BXT_PORT_TX_DW3_GRP(phy, ch), val);
 
@@ -320,15 +321,15 @@ bool bxt_ddi_phy_is_enabled(struct drm_i915_private *dev_priv,
 
 	if ((intel_de_read(dev_priv, BXT_PORT_CL1CM_DW0(phy)) &
 	     (PHY_POWER_GOOD | PHY_RESERVED)) != PHY_POWER_GOOD) {
-		DRM_DEBUG_DRIVER("DDI PHY %d powered, but power hasn't settled\n",
-				 phy);
+		drm_dbg(&dev_priv->drm,
+			"DDI PHY %d powered, but power hasn't settled\n", phy);
 
 		return false;
 	}
 
 	if (!(intel_de_read(dev_priv, BXT_PHY_CTL_FAMILY(phy)) & COMMON_RESET_DIS)) {
-		DRM_DEBUG_DRIVER("DDI PHY %d powered, but still in reset\n",
-				 phy);
+		drm_dbg(&dev_priv->drm,
+			"DDI PHY %d powered, but still in reset\n", phy);
 
 		return false;
 	}
@@ -348,7 +349,8 @@ static void bxt_phy_wait_grc_done(struct drm_i915_private *dev_priv,
 {
 	if (intel_de_wait_for_set(dev_priv, BXT_PORT_REF_DW3(phy),
 				  GRC_DONE, 10))
-		DRM_ERROR("timeout waiting for PHY%d GRC\n", phy);
+		drm_err(&dev_priv->drm, "timeout waiting for PHY%d GRC\n",
+			phy);
 }
 
 static void _bxt_ddi_phy_init(struct drm_i915_private *dev_priv,
@@ -365,13 +367,14 @@ static void _bxt_ddi_phy_init(struct drm_i915_private *dev_priv,
 			dev_priv->bxt_phy_grc = bxt_get_grc(dev_priv, phy);
 
 		if (bxt_ddi_phy_verify_state(dev_priv, phy)) {
-			DRM_DEBUG_DRIVER("DDI PHY %d already enabled, "
-					 "won't reprogram it\n", phy);
+			drm_dbg(&dev_priv->drm, "DDI PHY %d already enabled, "
+				"won't reprogram it\n", phy);
 			return;
 		}
 
-		DRM_DEBUG_DRIVER("DDI PHY %d enabled with invalid state, "
-				 "force reprogramming it\n", phy);
+		drm_dbg(&dev_priv->drm,
+			"DDI PHY %d enabled with invalid state, "
+			"force reprogramming it\n", phy);
 	}
 
 	val = intel_de_read(dev_priv, BXT_P_CR_GT_DISP_PWRON);
@@ -391,7 +394,8 @@ static void _bxt_ddi_phy_init(struct drm_i915_private *dev_priv,
 				       PHY_RESERVED | PHY_POWER_GOOD,
 				       PHY_POWER_GOOD,
 				       1))
-		DRM_ERROR("timeout during PHY%d power on\n", phy);
+		drm_err(&dev_priv->drm, "timeout during PHY%d power on\n",
+			phy);
 
 	/* Program PLL Rcomp code offset */
 	val = intel_de_read(dev_priv, BXT_PORT_CL1CM_DW9(phy));
@@ -505,7 +509,7 @@ __phy_reg_verify_state(struct drm_i915_private *dev_priv, enum dpio_phy phy,
 	vaf.fmt = reg_fmt;
 	vaf.va = &args;
 
-	DRM_DEBUG_DRIVER("DDI PHY %d reg %pV [%08x] state mismatch: "
+	drm_dbg(&dev_priv->drm, "DDI PHY %d reg %pV [%08x] state mismatch: "
 			 "current %08x, expected %08x (mask %08x)\n",
 			 phy, &vaf, reg.reg, val, (val & ~mask) | expected,
 			 mask);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
