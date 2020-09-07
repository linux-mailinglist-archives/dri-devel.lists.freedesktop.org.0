Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7029B25F4D9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 10:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92FA76E3AC;
	Mon,  7 Sep 2020 08:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D446E39B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 08:18:38 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k15so14754202wrn.10
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 01:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bX1s4xMuL5vY2ccVWkeVsR98TkYqApy3vJM/yyJ0UUI=;
 b=xpy/MF7WlNAaepdnXSosFHddhAhU/jmZO82o8zHY6wCRvPW51p6Du1L3QdA5hyh+ik
 hFGY+o5OV8lzi1QtZ4416DJ5yxkukQtNxwePe5bCqdSgWTcYi4FxrxzelPJktF6SpTiM
 f4ZIHH72qSZyKypnocTiV0dUTgiuNzUcW5t71r64Laq0WZzwW00OJyZyW0HEV9tIaa7Y
 GTC7joGdyUaJWKSaMj7BqNXlSqVhhIPfZGbR0B8J8PiSw/ZWrJSK6WKzom3T+7XwWNPk
 V7KKJh8S0Nq0h0/loU+TzSIruF6bhgiYmKYdMS9us3aNOWCcqLn/QZz67/sXQOGWCqbM
 QmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bX1s4xMuL5vY2ccVWkeVsR98TkYqApy3vJM/yyJ0UUI=;
 b=OUhNSIMzfRfJVQxzCyOLj5mUoSCNgmJVrDEDzQqE6SzfpdilFlTeupcqbVQpZs15kw
 StMmeAtAO5LF6UlW00zZ4McPP2CmyXjZWjc21Q+TdFtLRvD5Ap0IIBPPti/cq61lIcXC
 yzjh5xnWKD2NG/3nyFn6lI2wWzNuyVze1B776zElJ0u0kthqQztkemHqAzCM9ViFxGl+
 7V1wUjvjfibM4gydUeBZALMtkS4LK95xM2KutKBsXFU+6L+CTTYSs4G2RhBKWreKxO5O
 ipYlx6Qear/N6VQLD9pfZJ5tJ8Z/Om6NhXiZ4Z/TSGAcUpq5VwlWtNZlB0m5eqJ+DBAy
 BAnQ==
X-Gm-Message-State: AOAM531UALo5XZN5hY7SNugvY41kGxP+2XxZn8Sv9j0B2q/S7WcV+lFL
 RSZRGx1PREHAiY016YGAaQwCflbH5QXS6EDy
X-Google-Smtp-Source: ABdhPJx37EVAY06BMAZdNUlhN9PbcXqw4hXGyZnhzv+klLTi6jqFy02Q485CkAsqiiMLG71JIu+hlg==
X-Received: by 2002:a5d:52c6:: with SMTP id r6mr13292808wrv.141.1599466717335; 
 Mon, 07 Sep 2020 01:18:37 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id q186sm28032205wma.45.2020.09.07.01.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 01:18:36 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch
Subject: [PATCH 5/6] drm/meson: remove useless recursive components matching
Date: Mon,  7 Sep 2020 10:18:24 +0200
Message-Id: <20200907081825.1654-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200907081825.1654-1-narmstrong@baylibre.com>
References: <20200907081825.1654-1-narmstrong@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The initial design was recursive to cover all port/endpoints, but only the first layer
of endpoints should be covered by the components list.
This also breaks the MIPI-DSI init/bridge attach sequence, thus only parse the
first endpoints instead of recursing.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 48 +++++--------------------------
 1 file changed, 7 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 92346653223f..1a4cf910c6a0 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -449,46 +449,6 @@ static int compare_of(struct device *dev, void *data)
 	return dev->of_node == data;
 }
 
-/* Possible connectors nodes to ignore */
-static const struct of_device_id connectors_match[] = {
-	{ .compatible = "composite-video-connector" },
-	{ .compatible = "svideo-connector" },
-	{ .compatible = "hdmi-connector" },
-	{ .compatible = "dvi-connector" },
-	{}
-};
-
-static int meson_probe_remote(struct platform_device *pdev,
-			      struct component_match **match,
-			      struct device_node *parent,
-			      struct device_node *remote)
-{
-	struct device_node *ep, *remote_node;
-	int count = 1;
-
-	/* If node is a connector, return and do not add to match table */
-	if (of_match_node(connectors_match, remote))
-		return 1;
-
-	component_match_add(&pdev->dev, match, compare_of, remote);
-
-	for_each_endpoint_of_node(remote, ep) {
-		remote_node = of_graph_get_remote_port_parent(ep);
-		if (!remote_node ||
-		    remote_node == parent || /* Ignore parent endpoint */
-		    !of_device_is_available(remote_node)) {
-			of_node_put(remote_node);
-			continue;
-		}
-
-		count += meson_probe_remote(pdev, match, remote, remote_node);
-
-		of_node_put(remote_node);
-	}
-
-	return count;
-}
-
 static int meson_drv_probe(struct platform_device *pdev)
 {
 	struct component_match *match = NULL;
@@ -503,8 +463,14 @@ static int meson_drv_probe(struct platform_device *pdev)
 			continue;
 		}
 
-		count += meson_probe_remote(pdev, &match, np, remote);
+		DRM_DEBUG_DRIVER("parent %pOF remote %pOF\n", np, remote);
+
+		DRM_DEBUG_DRIVER("match add %pOF parent %s\n", remote, dev_name(&pdev->dev));
+		component_match_add(&pdev->dev, &match, compare_of, remote);
+
 		of_node_put(remote);
+
+		++count;
 	}
 
 	if (count && !match)
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
