Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5B18BCF18
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 15:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3002510FC67;
	Mon,  6 May 2024 13:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lR9oKcUP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0F310FCBC
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 13:36:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8061FCE0E89;
 Mon,  6 May 2024 13:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B47FC4DDE1;
 Mon,  6 May 2024 13:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715002557;
 bh=0kDtbAaVTUzCfU0u7ieyZBAWWC/9d6iWWtENhJGOYbs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=lR9oKcUPpndQp18qBV2mivcjy5kCKkBF2vXx/0ArM+BTUOKgA1xP3vAJGn+Flb0eT
 ykzkprANmvCZsVEeLfqtVIhJWrmhZMrEH++iJMmN9TEzWSR4IbXrpJfYycMRFQHrRm
 P0iURHTBT2I627ep7jAhQsCgQ4qXcpNqb1FhnDHOduu5LVnf/CG1h+UEsmH72UMjDl
 wm+mTtr80qXdKbW2c4xhJoglyiYi5fnBirDDMqCgXJseEKdDyCYeHv4QvIusbD847m
 MPQuOzC5k93U5fsv0gDViI1ej/aRkesOWMzvxK4CA/lXlbXxxTsshhNpJcDOk3enw7
 ukHmYtM8RpLQQ==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 06 May 2024 15:34:40 +0200
Subject: [PATCH 11/20] drm/bridge: tc358775: reformat weird indentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-tc358775-fix-powerup-v1-11-545dcf00b8dd@kernel.org>
References: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
In-Reply-To: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Vinay Simha BN <simhavcs@gmail.com>, 
 Tony Lindgren <tony@atomide.com>
Cc: Daniel Semkowicz <dse@thaumatec.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.4
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

Reformat the indentation of the mipi_dsi_device_info initialization.
While at it, move it to the top of the function.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/bridge/tc358775.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index be2175571b99..e6d1f0c686ac 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -557,14 +557,15 @@ static const struct drm_bridge_funcs tc_bridge_funcs = {
 
 static int tc_attach_host(struct tc_data *tc)
 {
+	const struct mipi_dsi_device_info info = {
+		.type = "tc358775",
+		.channel = 0,
+		.node = NULL,
+	};
 	struct device *dev = tc->dev;
 	struct mipi_dsi_host *host;
 	struct mipi_dsi_device *dsi;
 	int ret;
-	const struct mipi_dsi_device_info info = { .type = "tc358775",
-							.channel = 0,
-							.node = NULL,
-						};
 
 	host = of_find_mipi_dsi_host_by_node(tc->host_node);
 	if (!host)

-- 
2.39.2

