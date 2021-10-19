Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3480B432EA3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 08:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8526E5B2;
	Tue, 19 Oct 2021 06:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09236E8A5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 06:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1634626378; x=1666162378;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lg3tuBpYiD/5+hEhYgxgN3r0gs7N1LQRS6hKHorT0gY=;
 b=AQqqRAFRHnpU/wf9sFmKN/qvoU+PXBQp2A8TivE5xHBd30MXJZpoqnbW
 YS0UIx8NQ9gQrxyjqZcUOtLaVMhOUy0La/+T+cZEG+5TkgFtscYZdmZ6p
 JwTn1DMlATrVhtZZk4BTYnMatHDiLtPMItBjzNeDp8mkjAJcIWAZ0Q0F7
 Jv6d8kRUMhitOB18inMEK8+FdlEzjr1VIkZSOUCYDAy5Z6B+UOhRtSgld
 GChuUxiKbF/bnVjJxMfrR2Dc78Bs6HGgzNEtYAU7IYlpiGSkNcl77EgX+
 F7iiM9zaaaN6f353GeMCLXIU3ofJbvHXJJnClA/ofABbXwIhXkosdgrCu g==;
X-IronPort-AV: E=Sophos;i="5.85,383,1624312800"; d="scan'208";a="20120008"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 19 Oct 2021 08:52:57 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 19 Oct 2021 08:52:57 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 19 Oct 2021 08:52:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1634626377; x=1666162377;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lg3tuBpYiD/5+hEhYgxgN3r0gs7N1LQRS6hKHorT0gY=;
 b=P59FJZQvZeWHCD5+99nY71skpnfWL9Rvb1Lf1mrc6yeR41aFhNTPz0vd
 mdpH22sI8cYflfG6LzZx5y+eEQnHijkO+fjcNvDvCVvGkykAIItL+nHpB
 25r6HGPnqdQD3Re0OJG/Z7JwbpEUn8+sD5HC0MLxnhK3QXIoyS2I5uQey
 9Gf270yKmXR73eISeW8hS5811Q5j///pRNRatImO7IEFQOFYFeP2kBfCk
 jh0WEng28MecjnWP6NpskS98A74FNdxwkR+WuXgeT+xCfiMVee+1XnkWd
 8S2rehI2+ohjR1x5U/MKCe+X2Q/cF+NX+KYrKPd9O73krqUzqklemlK+B g==;
X-IronPort-AV: E=Sophos;i="5.85,383,1624312800"; d="scan'208";a="20120001"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 19 Oct 2021 08:52:53 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 09634280065;
 Tue, 19 Oct 2021 08:52:53 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 4/4] drm/bridge: ti-sn65dsi83: Add vcc supply regulator
 support
Date: Tue, 19 Oct 2021 08:52:39 +0200
Message-Id: <20211019065239.969988-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019065239.969988-1-alexander.stein@ew.tq-group.com>
References: <20211019065239.969988-1-alexander.stein@ew.tq-group.com>
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

VCC needs to be enabled before releasing the enable GPIO.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 9072342566f3..c55c45d5d29a 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -33,6 +33,7 @@
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
@@ -143,6 +144,7 @@ struct sn65dsi83 {
 	struct mipi_dsi_device		*dsi;
 	struct drm_bridge		*panel_bridge;
 	struct gpio_desc		*enable_gpio;
+	struct regulator		*vcc;
 	int				dsi_lanes;
 	bool				lvds_dual_link;
 	bool				lvds_dual_link_even_odd_swap;
@@ -292,6 +294,11 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
 					struct drm_bridge_state *old_bridge_state)
 {
 	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
+	int ret;
+
+	ret = regulator_enable(ctx->vcc);
+	if (ret)
+		dev_err(ctx->dev, "Failed to enable vcc: %i\n", ret);
 
 	/*
 	 * Reset the chip, pull EN line low for t_reset=10ms,
@@ -536,9 +543,14 @@ static void sn65dsi83_atomic_post_disable(struct drm_bridge *bridge,
 					  struct drm_bridge_state *old_bridge_state)
 {
 	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
+	int ret;
 
 	/* Put the chip in reset, pull EN line low. */
 	gpiod_set_value(ctx->enable_gpio, 0);
+
+	ret = regulator_disable(ctx->vcc);
+	if (ret)
+		dev_err(ctx->dev, "Failed to disable vcc: %i\n", ret);
 }
 
 static enum drm_mode_status
@@ -647,6 +659,12 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
 
 	ctx->panel_bridge = panel_bridge;
 
+	ctx->vcc = devm_regulator_get(dev, "vcc");
+	if (IS_ERR(ctx->vcc))
+		return dev_err_probe(dev, PTR_ERR(ctx->vcc),
+				     "Failed to get supply 'vcc': %pe\n",
+				     ctx->vcc);
+
 	return 0;
 }
 
-- 
2.25.1

