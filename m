Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 643AA32B832
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:44:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68986E406;
	Wed,  3 Mar 2021 13:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C376E406
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:44:00 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id w7so5211594wmb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b0iGOR+oUMpMNe+ms/bEjIiPtMEjVOFpPaMripgJlBc=;
 b=H3A2bX0qU2J5eGZ//pel/mRnd6dBhTswU4+t4zHgTV1HaBUd95Rb0EzZSbPgzbZrjq
 j8ESjAX9QTleaddGPj46Px/f02U74SKXKsnFH2XyTcqMSfbp+1XAD5FLrihvK8hM+EhA
 2ASRRySAxjh/USI9McXkFJpFLpzo9+Cg7uFLx6Xb5QDNMaihiJ3Slp/Y4qpVN3DMfBIu
 xFGZJIGlBr/M83m8F/+IbGa3yazSF3ygRCyOMPnZ8yoAUy4BWCfWQ+jS3gylTb1AIgRs
 VKb0OC//m7ammGv/OHvD29p4+5R5ui6nO1sYFJZyinjRzkAkz/VWvti6q5motDgxnvBH
 KdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b0iGOR+oUMpMNe+ms/bEjIiPtMEjVOFpPaMripgJlBc=;
 b=Pc55pH8lTniStegumL9V+FI87HfBlM74K64FjN3OEHGR7YFa5y3dvFQSs98Cv6EIB5
 obETXnNVcv3jvbx7CkDNDfWwN186u+cPAnl/jJgQG+wRmPhqDX0sFuHjS5UPxHo2Kct4
 I3bJ/Gp0ngTZA3ooT6VPiZVzCJtLI/eV5aZ5mJe34Tv9rI+OGO7RHXZFU6SSHZiZjj5b
 CmnBvvbJL40Ji1rwSlx9bxQTG+z9Lg18W6JA3bsgxCrszltEn3gv0quIinDMGrDUWiuY
 1IzqQhITld/eehRnLWzll40lR6lPeYo35CV3RGXaK5fvhOOSEPJgWEboIOm4jUtwU0mG
 HHmw==
X-Gm-Message-State: AOAM532xTIINtgGwGgCOuu934dqcC34cF5D9CjYkkjfniDq9CtJDEMfM
 PCminGACXsiq9VnZ+cXyP5XogA==
X-Google-Smtp-Source: ABdhPJxc7emTJGKEjU9Wo29D+VPtdHhPYwwuByMM/om5mfLeEVGGuVWbdFK9Ox6gGaBrHg5C5yenmQ==
X-Received: by 2002:a7b:cb05:: with SMTP id u5mr9207361wmj.46.1614779039360;
 Wed, 03 Mar 2021 05:43:59 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:43:58 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 26/53] drm/vmwgfx/vmwgfx_drv: Fix some kernel-doc misdemeanours
Date: Wed,  3 Mar 2021 13:42:52 +0000
Message-Id: <20210303134319.3160762-27-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
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

 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:164: warning: Function parameter or member 'ioctl' not described in 'VMW_IOCTL_DEF'
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:164: warning: Function parameter or member 'func' not described in 'VMW_IOCTL_DEF'
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:164: warning: Function parameter or member 'flags' not described in 'VMW_IOCTL_DEF'
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:170: warning: cannot understand function prototype: 'const struct drm_ioctl_desc vmw_ioctls[] = '
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:542: warning: Function parameter or member 'dev_priv' not described in 'vmw_get_initial_size'
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:611: warning: Function parameter or member 'dev_priv' not described in 'vmw_dma_masks'
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:611: warning: Excess function parameter 'dev' description in 'vmw_dma_masks'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Zack Rusin <zackr@vmware.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210115181313.3431493-9-lee.jones@linaro.org
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index dd69b51c40e41..ef81a68dd4bd4 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -153,7 +153,7 @@
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_VMW_MSG,			\
 		struct drm_vmw_msg_arg)
 
-/**
+/*
  * The core DRM version of this macro doesn't account for
  * DRM_COMMAND_BASE.
  */
@@ -161,7 +161,7 @@
 #define VMW_IOCTL_DEF(ioctl, func, flags) \
   [DRM_IOCTL_NR(DRM_IOCTL_##ioctl) - DRM_COMMAND_BASE] = {DRM_IOCTL_##ioctl, flags, func}
 
-/**
+/*
  * Ioctl definitions.
  */
 
@@ -526,7 +526,7 @@ static void vmw_release_device_late(struct vmw_private *dev_priv)
 	vmw_fifo_release(dev_priv, &dev_priv->fifo);
 }
 
-/**
+/*
  * Sets the initial_[width|height] fields on the given vmw_private.
  *
  * It does so by reading SVGA_REG_[WIDTH|HEIGHT] regs and then
@@ -599,7 +599,7 @@ static int vmw_dma_select_mode(struct vmw_private *dev_priv)
 /**
  * vmw_dma_masks - set required page- and dma masks
  *
- * @dev: Pointer to struct drm-device
+ * @dev_priv: Pointer to struct drm-device
  *
  * With 32-bit we can only handle 32 bit PFNs. Optionally set that
  * restriction also for 64-bit systems.
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
