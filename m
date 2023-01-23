Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7E9677F04
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:13:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181F610E4B7;
	Mon, 23 Jan 2023 15:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209F410E4B5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 15:13:28 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 k10-20020a17090a590a00b0022ba875a1a4so8567137pji.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ye7rK8XP7CKFg3FA4ZUZc/27br4/mG8uE4vofYp7eK4=;
 b=GTAGiMWTkM+UiZZwCH2uvGr9uNUQaH1ulTDGalDgijsQMk47GyiRtugz59uYlnXlcJ
 iIM3soHB+uYblDR3yaM2voJIIHs0uk9ymghTpKyaWsQ02D6o8kumc7BvqtguUGsLAYoE
 1PEIzxQ+fhQoJaI3kJJiaEt7Fzf42mKkCJlj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ye7rK8XP7CKFg3FA4ZUZc/27br4/mG8uE4vofYp7eK4=;
 b=59fWb57c9Y5teIWwG6/4mCobHZjhtvpOh4srR3Fm+30EuQG1GY8JxktdeIM07r750U
 b/0JzKNoKYyKUk3Za8/YtS4SI/40QmSG7VbDQ2vXjkdc6OS5LmsQb6H8d9F4GcD7fmIz
 mPoh56vjr+yVvEGIr3laZ6H3eKMr8VwkYS8+J1bdrp7umk828mRvsYmRi317d0qFzfT+
 aqKAEhlouK7L26rCYlvfndf4flwVGShpEWKT6u/Y54rp4JadNoi43GxbPUB4dqfxJNi7
 RfLvNfDHvI7E+aPl3hDhZkthfb7DI51MnBja2XzSv6x9OO8adc8nDgpYBzm+fpFcosGw
 0GsA==
X-Gm-Message-State: AFqh2krtmZq6ecDjIaI9Ak0Kxg7IhGLPaC72fxMR811JXVTl8xFAcUFT
 U7tqk/xch6CGFzc0qyrlWED0Pw==
X-Google-Smtp-Source: AMrXdXs8DTjFKb2OWtb66z2sea0wlZNVlzC1mqLlF08ZXPfpn4bUQBpuonL5dGy7dq1e/7wxDD8URQ==
X-Received: by 2002:a17:903:11c7:b0:194:58c7:ab79 with SMTP id
 q7-20020a17090311c700b0019458c7ab79mr32632612plh.63.1674486807702; 
 Mon, 23 Jan 2023 07:13:27 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170903230500b001754fa42065sm19207111plh.143.2023.01.23.07.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:13:27 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
Subject: [RESEND PATCH v11 08/18] drm: exynos: dsi: Handle proper host
 initialization
Date: Mon, 23 Jan 2023 20:42:02 +0530
Message-Id: <20230123151212.269082-9-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123151212.269082-1-jagan@amarulasolutions.com>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Marek Szyprowski <m.szyprowski@samsung.com>

Host transfer() in the DSI master will invoke only when the DSI commands
are sent from DSI devices like DSI Panel or DSI bridges and this host
the transfer wouldn't invoke for I2C-based-DSI bridge drivers.

Handling DSI host initialization in transfer calls misses the controller
setup for I2C configured DSI bridges.

This patch updates the DSI host initialization by calling host to init
from bridge pre_enable as the bridge pre_enable API is invoked by core
as it is common across all classes of DSI device drivers.

The host init during pre_enable is conditional and not invoked for Exynos
as existing downstream drm panels and bridges in Exynos are expecting
the host initialization during DSI transfer.

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v11:
- collect RB from Frieder
Changes for v10:
- update the to simple logic to handle all platforms
Changs for v9 - v8:
- none
Changes for v2:
- check initialized state in samsung_dsim_init
Changes for v1:
- keep DSI init in host transfer

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 27 +++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 902bd46964cb..d4a976d86f08 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -254,6 +254,9 @@ struct exynos_dsi_transfer {
 #define DSIM_STATE_CMD_LPM		BIT(2)
 #define DSIM_STATE_VIDOUT_AVAILABLE	BIT(3)
 
+#define exynos_dsi_hw_is_exynos(hw) \
+	((hw) >= DSIM_TYPE_EXYNOS3250 && (hw) <= DSIM_TYPE_EXYNOS5433)
+
 enum exynos_dsi_type {
 	DSIM_TYPE_EXYNOS3250,
 	DSIM_TYPE_EXYNOS4210,
@@ -1343,6 +1346,9 @@ static int exynos_dsi_init(struct exynos_dsi *dsi)
 {
 	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
 
+	if (dsi->state & DSIM_STATE_INITIALIZED)
+		return 0;
+
 	exynos_dsi_reset(dsi);
 	exynos_dsi_enable_irq(dsi);
 
@@ -1355,6 +1361,8 @@ static int exynos_dsi_init(struct exynos_dsi *dsi)
 	exynos_dsi_set_phy_ctrl(dsi);
 	exynos_dsi_init_link(dsi);
 
+	dsi->state |= DSIM_STATE_INITIALIZED;
+
 	return 0;
 }
 
@@ -1410,6 +1418,16 @@ static void exynos_dsi_atomic_pre_enable(struct drm_bridge *bridge,
 	}
 
 	dsi->state |= DSIM_STATE_ENABLED;
+
+	/*
+	 * For Exynos-DSIM the downstream bridge, or panel are expecting
+	 * the host initialization during DSI transfer.
+	 */
+	if (!exynos_dsi_hw_is_exynos(dsi->plat_data->hw_type)) {
+		ret = exynos_dsi_init(dsi);
+		if (ret)
+			return;
+	}
 }
 
 static void exynos_dsi_atomic_enable(struct drm_bridge *bridge,
@@ -1556,12 +1574,9 @@ static ssize_t exynos_dsi_host_transfer(struct mipi_dsi_host *host,
 	if (!(dsi->state & DSIM_STATE_ENABLED))
 		return -EINVAL;
 
-	if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
-		ret = exynos_dsi_init(dsi);
-		if (ret)
-			return ret;
-		dsi->state |= DSIM_STATE_INITIALIZED;
-	}
+	ret = exynos_dsi_init(dsi);
+	if (ret)
+		return ret;
 
 	ret = mipi_dsi_create_packet(&xfer.packet, msg);
 	if (ret < 0)
-- 
2.25.1

