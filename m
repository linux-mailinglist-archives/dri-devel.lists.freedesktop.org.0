Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D1A99DF50
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 09:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A177D10E51D;
	Tue, 15 Oct 2024 07:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ta48acNc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EAB10E51D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 07:30:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 282CB5C5CF7;
 Tue, 15 Oct 2024 07:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 975B3C4CEC7;
 Tue, 15 Oct 2024 07:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728977421;
 bh=keUb9CjekSjahuXcS0fp1hkqPH8WA5k0uSQIqftR4l8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ta48acNcynUOpgmz3NbgHOdyKvRbF5kdZTeBYj1zR5EWlO/CWkDpGcAR7vaW0KLlo
 qAkRglYbA8OTOkt3Hhzw4++KYGVUXSV3NhpxOatcTIRPridmwpHPev3rppTCf6xIGi
 UQz4fgcUuYALT7yVtzCjJBkOWpGhvrtZ/F5ySDIHNZUH3Vhe8MzoLC//15pzUrx21Q
 UAEMQpgv/CLlluIryWb44OklhFOLmxO4SXPXaj+nayMwtDWc4W6ANKpMaejOSMcT90
 qYN1aZpf3Q+uP1WKxehU5iXCDsO+gzck9xfu7gsvxJqTrmMdb83QkG/NCwyKzMgruD
 THf1KiqTBKdrQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/imx: legacy-bridge: add MODULE_DESCRIPTION
Date: Tue, 15 Oct 2024 07:29:58 +0000
Message-Id: <20241015073004.4066457-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241015073004.4066457-1-arnd@kernel.org>
References: <20241015073004.4066457-1-arnd@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

Every module should have a description, without this we get a
build time warning.

Fixes: cc3e8a216d6b ("drm/imx: add internal bridge handling display-timings DT node")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c b/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
index 07a78a02a884..3ebf0b9866de 100644
--- a/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
+++ b/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
@@ -85,3 +85,4 @@ struct drm_bridge *devm_imx_drm_legacy_bridge(struct device *dev,
 EXPORT_SYMBOL_GPL(devm_imx_drm_legacy_bridge);
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Freescale i.MX DRM bridge driver for legacy DT bindings");
-- 
2.39.5

