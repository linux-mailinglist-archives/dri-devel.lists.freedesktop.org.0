Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6788E2F8368
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02636E479;
	Fri, 15 Jan 2021 18:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E1966E457
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:13:28 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id e15so1995502wme.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eZ4SXqHjDfEhTUNGWQvOBhYeab3UcCqVCuaDiiVfWAQ=;
 b=fSoRh3q4uz6YIds/3B+belP3eN9OBqn0u5m7KCnG8CbRMmEvaqB7U80UUa6QIW3gTh
 kjqT2NQYZK2IbR+DpvFCnwsVGmUveVCyBZYD6Dyr212ln1LTaB2qGLUx2J5d8EutCb/p
 fVS8KDR4Dg2VQ+mK6CRyyfsRi/s5yrSTcl4jKymczHxftpNGvUcODxvmxtTJk0ph3XO1
 LohbVA6FPotDa1Hq2Dqj9DUrzWgCaSynqxdoHmVrt8dEmxtfuidOplLkYDk2zJ87+D4E
 Hh7hHNDbC85FOcWHYZYJKcgJOcs0Pdhd1i85xa66akt6YUzqQ/0jFcH+/aDf8gBFU2Vi
 DOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eZ4SXqHjDfEhTUNGWQvOBhYeab3UcCqVCuaDiiVfWAQ=;
 b=NRF3Nrg0na7FILSDEZ3gnxX85HHVYNw9pQJci4keYmiQXW+y8JTJkAiKBlleelvmxH
 0flww2bu55rGSqSNZTBUJRWw8dPmIbC0ZbjiXg9LcFpW/pDoj7Q4DVtMXuo5Ohoi+87P
 dy+HXJQ/T5no9B3Vm+8xMMtgxXbyqamOeYlvVihWGBHMYWOnmilOvq4MsocJrXyeF3oL
 Ijr2nvdXX1xKUM7QtQ30OuVHzf0AODAF13O0EfpBClpQaTh8zowIBfh6qxpWSVXt0qLS
 2NpkZTwmQgAOUfHb/7zUZxj2ZQqk1zrlvuymncBRv57Dtp/LD6rfVsft3Bh+AcL3mkKH
 gAtg==
X-Gm-Message-State: AOAM533INgt094ZpcofUZGzlZ8pe9TOSdTRtDWzMiWEmlMR3yHdAdQDi
 7TY9vO+MWyzCCfV5crPNqOh2yw==
X-Google-Smtp-Source: ABdhPJyaMwGma3U8BAl3CJHR4ESpN+NLARQ+4qCjJY0g6+kivNVYS2BSZ8FkjhlA05W7/6smJjC3uQ==
X-Received: by 2002:a7b:ce92:: with SMTP id q18mr9611096wmj.113.1610734407001; 
 Fri, 15 Jan 2021 10:13:27 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:13:26 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 08/40] drm/vmwgfx/vmwgfx_drv: Fix some kernel-doc misdemeanours
Date: Fri, 15 Jan 2021 18:12:41 +0000
Message-Id: <20210115181313.3431493-9-lee.jones@linaro.org>
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
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 8c3eb00e8b54d..a77b70347aab0 100644
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
