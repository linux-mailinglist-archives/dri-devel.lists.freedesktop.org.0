Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFCE2F837E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:14:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075AB6E4AA;
	Fri, 15 Jan 2021 18:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B317C6E0B8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:14:07 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id k10so8213702wmi.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VgdN0p+9AgauwlBNqjDX7pzGp2g9M32RauIGJ4AYbRc=;
 b=i2F9vJU29UmIkMrVeNmOEvrBiEDn+LqthGClGyh9B3Jod0f/J1EXtUwx0US6OXDk9D
 r9gqrt1MI0ARJGo8ozkLG+E9nVGMm47Kb4Xsg06qGQi5C8srGBS3T93dWnd8QXH+Qasx
 iQ/mJUpJtPz2/YRXTQgBud8r5U9mnKe/DKI32KjtRV5xF15jm24cGMpFQkCNNBOC/dTh
 6Aev2ZPmNoEs/pQ3vnMkTTwQei7bYaAetIDgVl7Vp/6wZGEnG6RQiATQE0q71Vh3htwR
 tDbueFONUOs9np+F+6vgJ4B9KwNSVSAxFMkWRuHMYe9e5gjky6hep/W9QLvQCzDCDqnR
 CM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VgdN0p+9AgauwlBNqjDX7pzGp2g9M32RauIGJ4AYbRc=;
 b=r0TbT5NXg22/1Ij9dpnOtAJIHRdvpzKsquUKinxHv/x/nB5mS0COMuoINMnxY6zt8c
 k/vlettSeHl/ySNPTHDmrgti2ZG+cpC/Fy+MVAIt3jpbXcSfJXNcfUgXETxfHBdCghO0
 DLkFjup2MHOjWr201fm6Ek0Y26xu0JIImGke4NeKcoYUMtBF30t78VoN4GR2acHfwG+0
 b4GPsXxl03j9EekmgkQV1Kki0/3ZoHXwsI7HvmIEMC9hXx8qMkjrdBo5GA89EzoIjX7V
 8mOHhq/9GQ8F6oR8rHNE9HXLKUoY+rGo/kGQhskJBOeoxe/Cgg/Nfy6zfEUPENB1vCXK
 2+Mw==
X-Gm-Message-State: AOAM533VSTTWjeYnLDYgA4DFIPsBBpu+34INwytqFb6jC/bvoPQ4fQ51
 XC0Cf5MtMh2HKmToxLWYI6vtWg==
X-Google-Smtp-Source: ABdhPJyaF23bN/RVQAfvgVkV76AdvEQ423UVLbsTMdtr/c4fN/ZfEyAVy5log7dRXgTvHOBLPEEpbg==
X-Received: by 2002:a1c:68d5:: with SMTP id d204mr9863246wmc.178.1610734446131; 
 Fri, 15 Jan 2021 10:14:06 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:14:05 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 33/40] drm/vmwgfx/vmwgfx_surface: Fix some kernel-doc related
 issues
Date: Fri, 15 Jan 2021 18:13:06 +0000
Message-Id: <20210115181313.3431493-34-lee.jones@linaro.org>
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

 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c:55: warning: Function parameter or member 'prime' not described in 'vmw_user_surface'
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c:55: warning: Function parameter or member 'backup_base' not described in 'vmw_user_surface'
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c:78: warning: cannot understand function prototype: 'struct vmw_surface_dirty '
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c:173: warning: Function parameter or member 'header' not described in 'vmw_surface_dma'
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c:173: warning: Function parameter or member 'body' not described in 'vmw_surface_dma'
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c:173: warning: Function parameter or member 'cb' not described in 'vmw_surface_dma'
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c:173: warning: Function parameter or member 'suffix' not described in 'vmw_surface_dma'
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c:181: warning: Function parameter or member 'header' not described in 'vmw_surface_define'
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c:181: warning: Function parameter or member 'body' not described in 'vmw_surface_define'
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c:189: warning: Function parameter or member 'header' not described in 'vmw_surface_destroy'
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c:189: warning: Function parameter or member 'body' not described in 'vmw_surface_destroy'
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c:555: warning: Function parameter or member 'readback' not described in 'vmw_legacy_srf_unbind'
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c:1067: warning: Function parameter or member 'res' not described in 'vmw_gb_surface_create'
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c:1067: warning: Excess function parameter 'srf' description in 'vmw_gb_surface_create'
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c:1067: warning: Excess function parameter 'cmd_space' description in 'vmw_gb_surface_create'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index f6cab77075a04..c3e55c1376eb8 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -41,10 +41,12 @@
 /**
  * struct vmw_user_surface - User-space visible surface resource
  *
+ * @prime:          The TTM prime object.
  * @base:           The TTM base object handling user-space visibility.
  * @srf:            The surface metadata.
  * @size:           TTM accounting size for the surface.
- * @master: master of the creating client. Used for security check.
+ * @master:         Master of the creating client. Used for security check.
+ * @backup_base:    The TTM base object of the backup buffer.
  */
 struct vmw_user_surface {
 	struct ttm_prime_object prime;
@@ -69,7 +71,7 @@ struct vmw_surface_offset {
 };
 
 /**
- * vmw_surface_dirty - Surface dirty-tracker
+ * struct vmw_surface_dirty - Surface dirty-tracker
  * @cache: Cached layout information of the surface.
  * @size: Accounting size for the struct vmw_surface_dirty.
  * @num_subres: Number of subresources.
@@ -162,7 +164,7 @@ static const struct vmw_res_func vmw_gb_surface_func = {
 	.clean = vmw_surface_clean,
 };
 
-/**
+/*
  * struct vmw_surface_dma - SVGA3D DMA command
  */
 struct vmw_surface_dma {
@@ -172,7 +174,7 @@ struct vmw_surface_dma {
 	SVGA3dCmdSurfaceDMASuffix suffix;
 };
 
-/**
+/*
  * struct vmw_surface_define - SVGA3D Surface Define command
  */
 struct vmw_surface_define {
@@ -180,7 +182,7 @@ struct vmw_surface_define {
 	SVGA3dCmdDefineSurface body;
 };
 
-/**
+/*
  * struct vmw_surface_destroy - SVGA3D Surface Destroy command
  */
 struct vmw_surface_destroy {
@@ -544,6 +546,7 @@ static int vmw_legacy_srf_bind(struct vmw_resource *res,
  *
  * @res:            Pointer to a struct vmw_res embedded in a struct
  *                  vmw_surface.
+ * @readback:       Readback - only true if dirty
  * @val_buf:        Pointer to a struct ttm_validate_buffer containing
  *                  information about the backup buffer.
  *
@@ -1060,8 +1063,8 @@ int vmw_surface_reference_ioctl(struct drm_device *dev, void *data,
 /**
  * vmw_surface_define_encode - Encode a surface_define command.
  *
- * @srf: Pointer to a struct vmw_surface object.
- * @cmd_space: Pointer to memory area in which the commands should be encoded.
+ * @res:        Pointer to a struct vmw_resource embedded in a struct
+ *              vmw_surface.
  */
 static int vmw_gb_surface_create(struct vmw_resource *res)
 {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
