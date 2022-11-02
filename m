Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83162616BAA
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 19:07:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0576E10E54E;
	Wed,  2 Nov 2022 18:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FE710E51A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 18:07:12 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id d3so26130891ljl.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 11:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lqeu0gWL+fbuCou+DZo8aED2KhTyfiRcmIANTVXwORA=;
 b=t2RcjNYTLDH6G78x+NZ2p6zgnvooU9KdaYMHPzhTzG+QrfQ9aus4ImJHAmAeQtvgGh
 qKC2LALtusMvGxhmfQCMZqSOg4uRh2afE1d8a9y3EzNX+sZ6qwfvU/gxdHcQOSL4nJuY
 sMBzc+0iGcfX22fJxRcyg5GwONyU6kK7+OphLJ7BTpQSmnzMdP0dm8HNvCNQfhGsRhQP
 qaxCANSNkBZoZJOuWVqS60H3l5Zf/u5KNeWowbLH7AXmPuMy77FbGdi55E8QW/0sbDQi
 q9jyNG94WoEJEbKCHTNhZc8I9wTY4Ih8XQr87XS/hx3F6LyDLcR/vNOAu1bEsL/832oX
 3L0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lqeu0gWL+fbuCou+DZo8aED2KhTyfiRcmIANTVXwORA=;
 b=AJPJiExfRhx1Y66xjWxPNJYvg4nEvdFGO0gqhGbeBbuTAocAcWtZheULQi232l1jwr
 KauYSpts5FR/i50D1inz9ca0LoN5W9r7AfgDSgnYrax9k7U6qYT7dNkQ9nDTmbU0gCnc
 KxrnO9fKqYetc8j0pfjhpucLlA1fEmMn/AQKcIoIA5ClsvqZUyZozMlcutNA0qd3NT4d
 it1jbrd6nVxvKZIjwqZfsxueV7YlTbZdIkSxzL1862IpVDOlXPVpzpxwx+w7UL1vsEu+
 1JnNiJAOM21kLdDbPdsthkZv0CEF46RKvTvW4IZMlPjFimwGGn+sV57rS/QO2CouAFUO
 Vdog==
X-Gm-Message-State: ACrzQf1jozC/aL0Gc/Zup2ZM/+g7gZuisegRF0QgBZ8i0CY9CXQ3b7sw
 0YSSVctDekTesGEi9U8rtQNTiw==
X-Google-Smtp-Source: AMsMyM4OqI2jkXW6iTpHuMDg1nyD49qN0z0iiKU9ce9bf5kWHoJd0Kfpkz+Hb68JXqo3KUiQHQ9igg==
X-Received: by 2002:a2e:1f09:0:b0:277:d94:93af with SMTP id
 f9-20020a2e1f09000000b002770d9493afmr9944985ljf.454.1667412430761; 
 Wed, 02 Nov 2022 11:07:10 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 r15-20020ac24d0f000000b00485caa0f5dfsm2085232lfi.44.2022.11.02.11.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 11:07:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Tomi Valkeinen <tomba@kernel.org>
Subject: [PATCH v3 6/7] drm/omap: stop using
 drm_bridge_connector_en/disable_hpd()
Date: Wed,  2 Nov 2022 21:07:04 +0300
Message-Id: <20221102180705.459294-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The functionality of drm_bridge_connector_enable_hpd() and
drm_bridge_connector_disable_hpd() is provided automatically by the
drm_kms_poll helpers. Stop calling these functions manually.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/omapdrm/omap_drv.c | 41 ------------------------------
 1 file changed, 41 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index eaf67b9e5f12..699ed814e021 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -545,44 +545,6 @@ static void omap_modeset_fini(struct drm_device *ddev)
 	drm_mode_config_cleanup(ddev);
 }
 
-/*
- * Enable the HPD in external components if supported
- */
-static void omap_modeset_enable_external_hpd(struct drm_device *ddev)
-{
-	struct omap_drm_private *priv = ddev->dev_private;
-	unsigned int i;
-
-	for (i = 0; i < priv->num_pipes; i++) {
-		struct drm_connector *connector = priv->pipes[i].connector;
-
-		if (!connector)
-			continue;
-
-		if (priv->pipes[i].output->bridge)
-			drm_bridge_connector_enable_hpd(connector);
-	}
-}
-
-/*
- * Disable the HPD in external components if supported
- */
-static void omap_modeset_disable_external_hpd(struct drm_device *ddev)
-{
-	struct omap_drm_private *priv = ddev->dev_private;
-	unsigned int i;
-
-	for (i = 0; i < priv->num_pipes; i++) {
-		struct drm_connector *connector = priv->pipes[i].connector;
-
-		if (!connector)
-			continue;
-
-		if (priv->pipes[i].output->bridge)
-			drm_bridge_connector_disable_hpd(connector);
-	}
-}
-
 /*
  * drm ioctl funcs
  */
@@ -782,7 +744,6 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 	omap_fbdev_init(ddev);
 
 	drm_kms_helper_poll_init(ddev);
-	omap_modeset_enable_external_hpd(ddev);
 
 	/*
 	 * Register the DRM device with the core and the connectors with
@@ -795,7 +756,6 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 	return 0;
 
 err_cleanup_helpers:
-	omap_modeset_disable_external_hpd(ddev);
 	drm_kms_helper_poll_fini(ddev);
 
 	omap_fbdev_fini(ddev);
@@ -822,7 +782,6 @@ static void omapdrm_cleanup(struct omap_drm_private *priv)
 
 	drm_dev_unregister(ddev);
 
-	omap_modeset_disable_external_hpd(ddev);
 	drm_kms_helper_poll_fini(ddev);
 
 	omap_fbdev_fini(ddev);
-- 
2.35.1

