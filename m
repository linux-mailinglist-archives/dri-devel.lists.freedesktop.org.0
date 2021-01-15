Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DAE2F8378
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974006E0B8;
	Fri, 15 Jan 2021 18:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69EE26E487
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:13:49 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id m4so10184314wrx.9
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DX8peXw6vQkx3jgWc3AcDMwXWV0VAjfbUs3tjUz1hsU=;
 b=ueBZVZqMr1lRsNLHjtgml8MUHZ8WPI5E1fhSjTu3fXUJMjMMvwHI/uSOLq9dNiDaBZ
 l8D48/8MD8sGUTJ7ok+RfTlAepBXTN0/ReLbpyiQ1n5RfIrI7AU71FkZBZlsTKbFbl9C
 GX699dS+59SbIwW+me01VcUegxQz5X+mAv7xP7fiqrUmFKVcuWVZuN5rxP/oyPjX3Xmb
 N4jiZhb9Y3K5PK6yRxA1B+pKsXR7dGiJ+EJyQsUhFa7erqWQesY0p9ab6HkI1sTX/xCW
 pKLVT6RzBila8u6b82o61DhEIKLiKLrfc20PA2LnNCSJ/9d8omqrEejSGYsA5Uprv/26
 pQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DX8peXw6vQkx3jgWc3AcDMwXWV0VAjfbUs3tjUz1hsU=;
 b=GNRZ/1GwU1hLz+baCE9q8RtRcFgPaqLksg8ZaZAHVQWYn1bLcaEBizH+EgHFWaqE1w
 mUcuOYuG0OPygt7Ay1FohF3MLIusGv5QFlmhNPcqqSRW3YDzxzsBuSJFOMVhZvUZUzN4
 MtuA4+cPoS204JEbwbmCFJBfpOw+ArQUO9H8Lvwi1/22uwN5u1jxZZcIqE+shw2NRWBX
 3Pr1+OwgZasASx7HmPSmpG44yxtuTD1TcsXCt0wUp2CORQBhruTvD52q/sPI5Z0niA1u
 LsOKRx8627zSfnxvIaGGyyXeIF9gVIBJMNpiJYmwb37+ZZ/O5o7nt/a/kNtCK3dDLOhr
 hRpA==
X-Gm-Message-State: AOAM5330zXtamqRQvuIIH0UgOxls9MZWWZA4tgQMprcNpGMrUL9IxRvC
 ka0jiS1PrJ40AabtrKw2fUn28g==
X-Google-Smtp-Source: ABdhPJwpTvCHhrRMhMhC083vAOcxnBNtkEy10vvuPrBOfIVJBD37uYFht6hVp6TUpt/pPyifOrjx+w==
X-Received: by 2002:a5d:6607:: with SMTP id n7mr14020998wru.206.1610734428099; 
 Fri, 15 Jan 2021 10:13:48 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:13:47 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 20/40] drm/vmwgfx/vmwgfx_kms: Update worthy function headers
 and demote others
Date: Fri, 15 Jan 2021 18:12:53 +0000
Message-Id: <20210115181313.3431493-21-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181313.3431493-1-lee.jones@linaro.org>
References: <20210115181313.3431493-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 In file included from drivers/gpu/drm/vmwgfx/vmwgfx_kms.c:37:
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c:483: warning: Function parameter or member 'new_state' not described in 'vmw_du_cursor_plane_atomic_check'
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c:483: warning: Excess function parameter 'state' description in 'vmw_du_cursor_plane_atomic_check'
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c:1069: warning: Function parameter or member 'vfb' not described in 'vmw_framebuffer_pin'
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c:1281: warning: Function parameter or member 'dev_priv' not described in 'vmw_kms_srf_ok'
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c:1907: warning: Function parameter or member 'crtc' not described in 'vmw_get_vblank_counter'
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c:1915: warning: Function parameter or member 'crtc' not described in 'vmw_enable_vblank'
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c:1923: warning: Function parameter or member 'crtc' not described in 'vmw_disable_vblank'
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c:2131: warning: Function parameter or member 'mode' not described in 'vmw_guess_mode_timing'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 9293dc19a7683..84143b707cd32 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -467,7 +467,7 @@ int vmw_du_primary_plane_atomic_check(struct drm_plane *plane,
  * vmw_du_cursor_plane_atomic_check - check if the new state is okay
  *
  * @plane: cursor plane
- * @state: info on the new plane state
+ * @new_state: info on the new plane state
  *
  * This is a chance to fail if the new cursor state does not fit
  * our requirements.
@@ -1057,7 +1057,7 @@ static const struct drm_framebuffer_funcs vmw_framebuffer_bo_funcs = {
 	.dirty = vmw_framebuffer_bo_dirty_ext,
 };
 
-/**
+/*
  * Pin the bofer in a location suitable for access by the
  * display system.
  */
@@ -1267,6 +1267,7 @@ static int vmw_kms_new_framebuffer_bo(struct vmw_private *dev_priv,
 /**
  * vmw_kms_srf_ok - check if a surface can be created
  *
+ * @dev_priv: Pointer to device private struct.
  * @width: requested width
  * @height: requested height
  *
@@ -1896,7 +1897,7 @@ bool vmw_kms_validate_mode_vram(struct vmw_private *dev_priv,
 }
 
 
-/**
+/*
  * Function called by DRM code called with vbl_lock held.
  */
 u32 vmw_get_vblank_counter(struct drm_crtc *crtc)
@@ -1904,7 +1905,7 @@ u32 vmw_get_vblank_counter(struct drm_crtc *crtc)
 	return 0;
 }
 
-/**
+/*
  * Function called by DRM code called with vbl_lock held.
  */
 int vmw_enable_vblank(struct drm_crtc *crtc)
@@ -1912,7 +1913,7 @@ int vmw_enable_vblank(struct drm_crtc *crtc)
 	return -EINVAL;
 }
 
-/**
+/*
  * Function called by DRM code called with vbl_lock held.
  */
 void vmw_disable_vblank(struct drm_crtc *crtc)
@@ -2120,7 +2121,7 @@ static struct drm_display_mode vmw_kms_connector_builtin[] = {
  * vmw_guess_mode_timing - Provide fake timings for a
  * 60Hz vrefresh mode.
  *
- * @mode - Pointer to a struct drm_display_mode with hdisplay and vdisplay
+ * @mode: Pointer to a struct drm_display_mode with hdisplay and vdisplay
  * members filled in.
  */
 void vmw_guess_mode_timing(struct drm_display_mode *mode)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
