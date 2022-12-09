Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA69648504
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 16:25:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E50610E541;
	Fri,  9 Dec 2022 15:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A62510E541
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 15:25:21 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 q17-20020a17090aa01100b002194cba32e9so8474136pjp.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 07:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PD94MxZvqnUHdTxMPOsMMefL4P5i3Lz9kxEOBEFMSCo=;
 b=fgweV2Uq8N0wlYzgaQf47mr3LjVRC1L35wZBye2l2ywZp+X8ADFusTUNhQw0f6lk9P
 27uxEklHfJHgkztkRzT1ebKwWhf2Udt8AhGxxpIPfi97mUiVEHs+clm3w73iqJ7r9QNu
 FXBQ4h7VvNyx0yT2X5+zkU0QluR+oe92T2T3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PD94MxZvqnUHdTxMPOsMMefL4P5i3Lz9kxEOBEFMSCo=;
 b=qU2hN/Sf/rurFGFE8hdxtU648BeLVd6Lptmy6EZR/+PnIVYlSEijJaxZ+7UpzveKWa
 PODLKiHa718wHbBVwONwvGEA/ndxMX1GND7iUb2d0vgPGAXZovvJODc2aOsV5kr9G1Bj
 +IjPfn7k1MKDJapNp/zPEJXga4YPclQmNndmX72WuidLW+j9940QDHZ49lL6TbxuGK7O
 mr6sgpBEb8gmyHZDMVkCABPwxLGxfYLIfWIOBxoGqcCdR4RVETSCExrMP6eoYYcFF/kO
 v2viC3MO09Yv98P5zGdeazCKC0GsVGGBgXNHa9n+xhXVqbYJtN+Aq5+/E28ZUbvOCx8O
 MSHQ==
X-Gm-Message-State: ANoB5pnfO+l2M8q9JA6NG+TNYyi7BmH6O0abMQb+/2xIHlsxx8S8jKzB
 kzN0KTKN7BcM6RiK4acCsgstdw==
X-Google-Smtp-Source: AA0mqf55QoYZLG6Nui2W9ugkOWOA5s1EfgG0BbVEJCTMmNiChg7PB7qm/TxsNC8i1BTTAMeUFXU6Ww==
X-Received: by 2002:a17:902:e845:b0:189:f8d0:7b8f with SMTP id
 t5-20020a170902e84500b00189f8d07b8fmr6620275plg.63.1670599521074; 
 Fri, 09 Dec 2022 07:25:21 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:6ba1:bbda:c542:ba0b])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a170902ec8e00b00188c5f0f9e9sm1477587plg.199.2022.12.09.07.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 07:25:20 -0800 (PST)
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
Subject: [PATCH v9 03/18] drm: exynos: dsi: Restore proper bridge chain order
Date: Fri,  9 Dec 2022 20:53:28 +0530
Message-Id: <20221209152343.180139-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209152343.180139-1-jagan@amarulasolutions.com>
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
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

Restore the proper bridge chain by finding the previous bridge
in the chain instead of passing NULL.

This establishes a proper bridge chain while attaching downstream
bridges.

v9, v4:
* none

v3:
* new patch

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index ec673223d6b7..e5b1540c4ae4 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1428,7 +1428,8 @@ static int exynos_dsi_attach(struct drm_bridge *bridge,
 {
 	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
 
-	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, NULL, flags);
+	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
+				 flags);
 }
 
 static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
@@ -1474,7 +1475,10 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 
 	drm_bridge_add(&dsi->bridge);
 
-	drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
+	drm_bridge_attach(encoder, &dsi->bridge,
+			  list_first_entry_or_null(&encoder->bridge_chain,
+						   struct drm_bridge,
+						   chain_node), 0);
 
 	/*
 	 * This is a temporary solution and should be made by more generic way.
-- 
2.25.1

