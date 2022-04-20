Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D057E509367
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 01:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724DD10E274;
	Wed, 20 Apr 2022 23:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F7A10E274
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 23:10:26 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-e2a00f2cc8so3640105fac.4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 16:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gdbvXFvPlODxwWrm89MVekUAyc4cmb0QzNZ5AG9eFow=;
 b=EIrQ4znQvoRLhPbawBtJopfbUloIV6vDLCxZk3sov+7xSyIliKoQDb839QzGpgLDQo
 BqTL/gRHVYKJUjuwrZF1D6PtoXmLKXvsRJO1UHFgfHiVFKnSv78BKD7wqpvuI4zk7rpK
 /wAa+6cjF2x6WZP1ngaHFOc/f8kYLqo8M2iRnVtLUi5aRnqn1CTrkdZTSAeD6f+SrhvT
 x3MXw+mHXXSpB1yrW41SLawFwtsbScYebG6PLX+FWsmWTa+YjK6fbGyJtotp60dO+ONS
 ZbIYLcuwIb+/SBJwyMH7zP3BWTZyNagbxjIrWCWNTkKbFKALjUXE9ecA78YzFVOsTo1g
 Xbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gdbvXFvPlODxwWrm89MVekUAyc4cmb0QzNZ5AG9eFow=;
 b=aHXxT7/z4W8pRQsee6AXWufSb9T32cZDmtJ0uIXhQ3IDX8qIJvnKvjxcqcOaBaUor5
 PbLAlJH35++9fTIErzU6XuIzbgbINBarBUXZxrxfXf1AM1XU/6hLFrqS+L49lQxL6+0l
 GGc7ji2jDOgBnc6xRUKBN2JB+KHJhPuDGoTWtXowcwp5KeyTuwbMnEmYHRAHtRsPZR2m
 2hAjhKAnGMasIntTWiiR+ZJuGuhPy2MbSVJGg7xrR9y9SNTiCeheFcywyQ9v0LjK+TwW
 deJJU0Q75NnuIFTbb37gF4i6+qd7N66IblkAoRRclVwKx+5A2TcIO8AMSq2Xa3PlOAea
 wG8A==
X-Gm-Message-State: AOAM532VpP3ssmWvEsZ3N1l5ZYBjnfgEDynJ1y96G7iZfv7Zrom1xv0b
 bOHp4DvqXM+sajM2veO0HIKbgZBrutlEBinS
X-Google-Smtp-Source: ABdhPJzPxgkBrvYOoWCIf9X6VfGoaFD8q7kori051/muyYdzC7jXkmvbY1cdg5Sms4Q5n+dspakupw==
X-Received: by 2002:a05:6870:d1c9:b0:e5:9f16:c94f with SMTP id
 b9-20020a056870d1c900b000e59f16c94fmr2629205oac.273.1650496225618; 
 Wed, 20 Apr 2022 16:10:25 -0700 (PDT)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a4ae931000000b0032933be7230sm7424481ooe.4.2022.04.20.16.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 16:10:25 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCH 1/2] Revert "drm: of: Properly try all possible cases for
 bridge/panel detection"
Date: Wed, 20 Apr 2022 16:12:29 -0700
Message-Id: <20220420231230.58499-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit '80253168dbfd ("drm: of: Lookup if child node has panel or
bridge")' introduced the ability to describe a panel under a display
controller without having to use a graph to connect the controller to
its single child panel (or bridge).

The implementation of this would find the first non-graph node and
attempt to acquire the related panel or bridge. This prevents cases
where any other child node, such as a aux bus for a DisplayPort
controller, or an opp-table to find the referenced panel.

Commit '67bae5f28c89 ("drm: of: Properly try all possible cases for
bridge/panel detection")' attempted to solve this problem by not
bypassing the graph reference lookup before attempting to find the panel
or bridge.

While this does solve the case where a proper graph reference is
present, it does not allow the caller to distinguish between a
yet-to-be-probed panel or bridge and the absence of a reference to a
panel.

One such case is a DisplayPort controller that on some boards have an
explicitly described reference to a panel, but on others have a
discoverable DisplayPort display attached (which doesn't need to be
expressed in DeviceTree).

This reverts commit '67bae5f28c89 ("drm: of: Properly try all possible
cases for bridge/panel detection")', as a step towards reverting commit
'80253168dbfd ("drm: of: Lookup if child node has panel or bridge")'.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/drm_of.c | 99 ++++++++++++++++++++--------------------
 1 file changed, 49 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index f4df344509a8..026e4e29a0f3 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -214,29 +214,6 @@ int drm_of_encoder_active_endpoint(struct device_node *node,
 }
 EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
 
-static int find_panel_or_bridge(struct device_node *node,
-				struct drm_panel **panel,
-				struct drm_bridge **bridge)
-{
-	if (panel) {
-		*panel = of_drm_find_panel(node);
-		if (!IS_ERR(*panel))
-			return 0;
-
-		/* Clear the panel pointer in case of error. */
-		*panel = NULL;
-	}
-
-	/* No panel found yet, check for a bridge next. */
-	if (bridge) {
-		*bridge = of_drm_find_bridge(node);
-		if (*bridge)
-			return 0;
-	}
-
-	return -EPROBE_DEFER;
-}
-
 /**
  * drm_of_find_panel_or_bridge - return connected panel or bridge device
  * @np: device tree node containing encoder output ports
@@ -259,44 +236,66 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 				struct drm_panel **panel,
 				struct drm_bridge **bridge)
 {
-	struct device_node *node;
-	int ret;
+	int ret = -EPROBE_DEFER;
+	struct device_node *remote;
 
 	if (!panel && !bridge)
 		return -EINVAL;
-
 	if (panel)
 		*panel = NULL;
-	if (bridge)
-		*bridge = NULL;
-
-	/* Check for a graph on the device node first. */
-	if (of_graph_is_present(np)) {
-		node = of_graph_get_remote_node(np, port, endpoint);
-		if (node) {
-			ret = find_panel_or_bridge(node, panel, bridge);
-			of_node_put(node);
-
-			if (!ret)
-				return 0;
-		}
-	}
 
-	/* Otherwise check for any child node other than port/ports. */
-	for_each_available_child_of_node(np, node) {
-		if (of_node_name_eq(node, "port") ||
-		    of_node_name_eq(node, "ports"))
+	/**
+	 * Devices can also be child nodes when we also control that device
+	 * through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
+	 *
+	 * Lookup for a child node of the given parent that isn't either port
+	 * or ports.
+	 */
+	for_each_available_child_of_node(np, remote) {
+		if (of_node_name_eq(remote, "port") ||
+		    of_node_name_eq(remote, "ports"))
 			continue;
 
-		ret = find_panel_or_bridge(node, panel, bridge);
-		of_node_put(node);
+		goto of_find_panel_or_bridge;
+	}
+
+	/*
+	 * of_graph_get_remote_node() produces a noisy error message if port
+	 * node isn't found and the absence of the port is a legit case here,
+	 * so at first we silently check whether graph presents in the
+	 * device-tree node.
+	 */
+	if (!of_graph_is_present(np))
+		return -ENODEV;
+
+	remote = of_graph_get_remote_node(np, port, endpoint);
+
+of_find_panel_or_bridge:
+	if (!remote)
+		return -ENODEV;
+
+	if (panel) {
+		*panel = of_drm_find_panel(remote);
+		if (!IS_ERR(*panel))
+			ret = 0;
+		else
+			*panel = NULL;
+	}
+
+	/* No panel found yet, check for a bridge next. */
+	if (bridge) {
+		if (ret) {
+			*bridge = of_drm_find_bridge(remote);
+			if (*bridge)
+				ret = 0;
+		} else {
+			*bridge = NULL;
+		}
 
-		/* Stop at the first found occurrence. */
-		if (!ret)
-			return 0;
 	}
 
-	return -EPROBE_DEFER;
+	of_node_put(remote);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
 
-- 
2.35.1

