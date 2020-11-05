Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E32212A8170
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 15:52:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63AF6ED91;
	Thu,  5 Nov 2020 14:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0D46ED90
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 14:52:20 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id g12so2080781wrp.10
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 06:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zoR5nL3y6WX07329sSplpqvqBToYY/Osic4mjE5dOiE=;
 b=nFSE2PNcG7cmh0Bdu/Jxv3NzVCljiKeBffdfQAlnWgNNsWEHnr9anRWAJ8RDFLEViF
 m0Mn8kaHFPW1Qvm0KNQ1w6nKcEMhPhShH8efGb75qFdRJSFfl9QnQFD5zfrdTSPWKw/f
 AaeRuVcKXygPYcs5XA+BR0qs5zM/t4+cXOozmhE0apmnKGGo8ZcGuiZkTxxrh1o4m47f
 2pqNYTJzN6ECwOElr1+JqwmVCMp4ulUNam8H23EbT0bqtmmkz7thIKHWJu2eKGy8swdT
 E0GAEjE/m6rQwpYiiQr5igWxz5V24Oc3ZNM+cNMx4F3a26x/Q0dW1dAy45FVKb/idBCD
 iXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zoR5nL3y6WX07329sSplpqvqBToYY/Osic4mjE5dOiE=;
 b=jcMYh1xQZuN2dCZLZmPefc0C+Dy2Uo9aDfref9VsmHbVXKgtE/RKnDUTTo23bTNCtI
 EhUMAHgdord0cbApWjw+DMCHdR7UrWdeEY6H7PxcflCbd00mBQe7of4ir46oosmWtlzu
 +h5YPNpuJaEG+Tqn/x6uBN3uy8qkNA+meWlks+YbFCa2SvCEALOig1yB/Fg0LZAlmtrM
 5r66xeLse+5GMUqF57aWuG3ZgHtNuZfHVDwR22TA6j3QVo8BgqRKY2vrcC3aC4Fh9Dpk
 hEY/4Z6r1n9WuDQICnWFFny4Yr+ykjEYzpoKEpwkN4G1u657eFQ83V1XlUcZokC+0UOC
 JA9A==
X-Gm-Message-State: AOAM533kqvi0z6IyjYafc4/glAUYCxBUNEi+Slhoax6HJoOVRWtcN+Z6
 X2JfU/W3iJk77B8OEs6oHfFpkA==
X-Google-Smtp-Source: ABdhPJxsDscnN+g4maf2B8aLyv9Aq1bsygHLBACSxivG8ps1ZUJyW6RrJt3fnaohkUk8LbB3V5sZMQ==
X-Received: by 2002:adf:ef83:: with SMTP id d3mr3414398wro.393.1604587939487; 
 Thu, 05 Nov 2020 06:52:19 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id f5sm2631243wmh.16.2020.11.05.06.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 06:52:18 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 04/19] gpu: drm: omapdrm: omap_irq: Fix a couple of doc-rot
 issues
Date: Thu,  5 Nov 2020 14:45:02 +0000
Message-Id: <20201105144517.1826692-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105144517.1826692-1-lee.jones@linaro.org>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <rob.clark@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The API has been updated, but the header was not.

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/omapdrm/omap_irq.c:115: warning: Function parameter or member 'crtc' not described in 'omap_irq_enable_vblank'
 drivers/gpu/drm/omapdrm/omap_irq.c:115: warning: Excess function parameter 'dev' description in 'omap_irq_enable_vblank'
 drivers/gpu/drm/omapdrm/omap_irq.c:115: warning: Excess function parameter 'pipe' description in 'omap_irq_enable_vblank'
 drivers/gpu/drm/omapdrm/omap_irq.c:142: warning: Function parameter or member 'crtc' not described in 'omap_irq_disable_vblank'
 drivers/gpu/drm/omapdrm/omap_irq.c:142: warning: Excess function parameter 'dev' description in 'omap_irq_disable_vblank'
 drivers/gpu/drm/omapdrm/omap_irq.c:142: warning: Excess function parameter 'pipe' description in 'omap_irq_disable_vblank'

Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <rob.clark@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/omapdrm/omap_irq.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_irq.c b/drivers/gpu/drm/omapdrm/omap_irq.c
index 382bcdc72ac06..8643871e23a83 100644
--- a/drivers/gpu/drm/omapdrm/omap_irq.c
+++ b/drivers/gpu/drm/omapdrm/omap_irq.c
@@ -100,8 +100,7 @@ int omap_irq_enable_framedone(struct drm_crtc *crtc, bool enable)
 
 /**
  * enable_vblank - enable vblank interrupt events
- * @dev: DRM device
- * @pipe: which irq to enable
+ * @crtc: DRM CRTC
  *
  * Enable vblank interrupts for @crtc.  If the device doesn't have
  * a hardware vblank counter, this routine should be a no-op, since
@@ -131,8 +130,7 @@ int omap_irq_enable_vblank(struct drm_crtc *crtc)
 
 /**
  * disable_vblank - disable vblank interrupt events
- * @dev: DRM device
- * @pipe: which irq to enable
+ * @crtc: DRM CRTC
  *
  * Disable vblank interrupts for @crtc.  If the device doesn't have
  * a hardware vblank counter, this routine should be a no-op, since
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
