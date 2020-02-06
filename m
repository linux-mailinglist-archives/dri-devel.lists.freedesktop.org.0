Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56879153FD2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:18:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981D46F9DA;
	Thu,  6 Feb 2020 08:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE1F6F9DC;
 Thu,  6 Feb 2020 08:00:54 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a6so5882416wrx.12;
 Thu, 06 Feb 2020 00:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GF+GwZVlFfWX394NfNiHt+gnPUWs7Vyd/x0Y4+mn0tM=;
 b=QNthv9lvjk8WgJGMBvtOmYYtJUxJnDQpIorUEni4zx8ayZy4etFIqyv/EZtpIQUZz8
 nc+ERxwsG2hIh9P3q3GfEA4225MBtji50hmxTH2GJmHdSxOOB52epxJyUZ4mNsOSIjxo
 bDqAaFXKGU8gtm5UJBY23N0/Bt04AD36zS+h6wYcIqXuRjE15zg3u2zWIWV17FfCoGwO
 lTGJGhK8FlXKm6v56yqiY4Uh6Iyh9EcU1K0DXm9OElGgq+YqlG7SHLQL8JoAvOHj6V4K
 NdcBG2wKX237+yyyUDVjDB84EQkbicdHGUQSheOJErHlJDfQA4hOPZZtkY+f8Ql/vA6e
 G8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GF+GwZVlFfWX394NfNiHt+gnPUWs7Vyd/x0Y4+mn0tM=;
 b=Gr05wCVQN2RIX4okq1mwXLWsPURdNXU0o6C0K7DfLG0+4xgiv8YpDNd4fePHFUeGfm
 KA0cwchi/5GF0W+Vfy83QJag8LIWLdkMT2PE9NPFtoHq6PG129ReOiZ0zk9IeWBCDOjD
 ZtkM+LHkKGUtPeK9V0dm7/bgcugwmoBqsD+1u9i166jhQNx3xhYuItwSRnpuHGQ62Xcw
 eFQE61ozwWsoKIBF5TH6UQKqAJecVwjimxAFsMvoG4WdrhEiwXKhXX72l985IKfXas/A
 Dv+9+xcL+dPU2eQ/+61XS467c3qsSyzb7wu2+CGdyHYkb1mmMiYB+hpgSUsDK749UecG
 jGSg==
X-Gm-Message-State: APjAAAWj4LkayciTh5oC1zrsSW4MdPuLf5S83rNqz3PjyeCG3sPUX23Q
 vOlJKk/18ZardZBpHWQitDrv1lSCgI0=
X-Google-Smtp-Source: APXvYqxY5m9lMPSFLgSHzLNIslhGA9YWF2I+0JCofW0ZigJ6YK/4apfv0DUmS9szJRbgf5zJgAOrvQ==
X-Received: by 2002:adf:ea0f:: with SMTP id q15mr2362010wrm.356.1580976053144; 
 Thu, 06 Feb 2020 00:00:53 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id u8sm2635132wmm.15.2020.02.06.00.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 00:00:52 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 08/12] drm/i915/combo_phy: convert to struct drm_device
 logging macros.
Date: Thu,  6 Feb 2020 11:00:09 +0300
Message-Id: <20200206080014.13759-9-wambui.karugax@gmail.com>
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

Conversion of the printk based drm logging macros to the struct
drm_device based logging macros in i915/display/intel_combo_phy.c.
This transformation was achieved using the following coccinelle script
that matches based on the existence of a drm_i915_private device
pointer:
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

This converts DRM_DEBUG/DRM_DEBUG_DRIVER to drm_dbg().
New checkpatch warnings were addressed manually.

References: https://lists.freedesktop.org/archives/dri-devel/2020-January/253381.html
Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 .../gpu/drm/i915/display/intel_combo_phy.c    | 23 +++++++++++--------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_combo_phy.c b/drivers/gpu/drm/i915/display/intel_combo_phy.c
index dc5525ee8dee..9ff05ec12115 100644
--- a/drivers/gpu/drm/i915/display/intel_combo_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_combo_phy.c
@@ -97,10 +97,11 @@ static bool check_phy_reg(struct drm_i915_private *dev_priv,
 	u32 val = intel_de_read(dev_priv, reg);
 
 	if ((val & mask) != expected_val) {
-		DRM_DEBUG_DRIVER("Combo PHY %c reg %08x state mismatch: "
-				 "current %08x mask %08x expected %08x\n",
-				 phy_name(phy),
-				 reg.reg, val, mask, expected_val);
+		drm_dbg(&dev_priv->drm,
+			"Combo PHY %c reg %08x state mismatch: "
+			"current %08x mask %08x expected %08x\n",
+			phy_name(phy),
+			reg.reg, val, mask, expected_val);
 		return false;
 	}
 
@@ -172,7 +173,8 @@ static void cnl_combo_phys_uninit(struct drm_i915_private *dev_priv)
 	u32 val;
 
 	if (!cnl_combo_phy_verify_state(dev_priv))
-		DRM_WARN("Combo PHY HW state changed unexpectedly.\n");
+		drm_warn(&dev_priv->drm,
+			 "Combo PHY HW state changed unexpectedly.\n");
 
 	val = intel_de_read(dev_priv, CHICKEN_MISC_2);
 	val |= CNL_COMP_PWR_DOWN;
@@ -212,7 +214,8 @@ static bool ehl_vbt_ddi_d_present(struct drm_i915_private *i915)
 	 * in the log and let the internal display win.
 	 */
 	if (ddi_d_present)
-		DRM_ERROR("VBT claims to have both internal and external displays on PHY A.  Configuring for internal.\n");
+		drm_err(&i915->drm,
+			"VBT claims to have both internal and external displays on PHY A.  Configuring for internal.\n");
 
 	return false;
 }
@@ -308,8 +311,9 @@ static void icl_combo_phys_init(struct drm_i915_private *dev_priv)
 		u32 val;
 
 		if (icl_combo_phy_verify_state(dev_priv, phy)) {
-			DRM_DEBUG_DRIVER("Combo PHY %c already enabled, won't reprogram it.\n",
-					 phy_name(phy));
+			drm_dbg(&dev_priv->drm,
+				"Combo PHY %c already enabled, won't reprogram it.\n",
+				phy_name(phy));
 			continue;
 		}
 
@@ -368,7 +372,8 @@ static void icl_combo_phys_uninit(struct drm_i915_private *dev_priv)
 
 		if (phy == PHY_A &&
 		    !icl_combo_phy_verify_state(dev_priv, phy))
-			DRM_WARN("Combo PHY %c HW state changed unexpectedly\n",
+			drm_warn(&dev_priv->drm,
+				 "Combo PHY %c HW state changed unexpectedly\n",
 				 phy_name(phy));
 
 		/*
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
