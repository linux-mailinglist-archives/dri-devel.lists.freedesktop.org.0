Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE4C509368
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 01:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E9010E554;
	Wed, 20 Apr 2022 23:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902CE10E554
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 23:10:27 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-e5e433d66dso3633578fac.5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 16:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TRei6a1qHKhnvQ3GEDyy4E1WwK9zRMbycKgIfFir6MI=;
 b=aicu3OOVauGYbi8Leet6cjCpJNEgBJymsZ53QG5imPcqz+s0HavG6bOHqFTs66yXIv
 LrBNrePj1v5MHkeJVRGkNxlEl4w8DZeajSPgP4ajg2fo0tpcYidi6/McS2LDw9BkQUZS
 r2a/rcaqJ5rb8AH4YWOmMMNcZ9dZ/NrIz/2dLjfJAOAhMPDZiZEkIzZfD/ELmXSU12W5
 w3BhYqm0iLRcUZ3zYV6DJgIPvHxd0IAK+TkTwur23IHBuYYHbOErXj+E8w/RhFeP6ibL
 kjTYwtJXxLTUoJb0vT2X+frl2s81XACMBnaR4bw4+tn8zgLS5xDLAUqoQ6X9QHutROOZ
 0GUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TRei6a1qHKhnvQ3GEDyy4E1WwK9zRMbycKgIfFir6MI=;
 b=zE5MQ/BPTMJeYKWvkyWtBsPK+qFMf4Lgrrt6gnLFsgwicOEaYQzgARMFtdxG06EZpF
 s7+YExUrzR55bDmUqrfAECKMEknsejoMiEK8wD3BwGUqvFOm3isn4PvyncgdlJPjTv6e
 zhsu1RiwZdvds5rrDx6KcQ03wvNiVe//DZjTdgiAtkAAkAcpqWcoruz+BWl0WXVZAxqj
 5BE4NEkDE5/N0JT4mMDuyv9a4TwOw6usKz/muv5mJap+9X0ZviAbe13GEAWIp7g2KFob
 c5cwc9pAzQHBfsCCfZghopubKplDZr/lO1Esnq2vXDFgqDS9HQi+sz+8SvXL+azYxx4W
 1/rQ==
X-Gm-Message-State: AOAM533O1CWbsGNIMzYGLVm1qw9pDYllPtxU+27dbrqCdF07pgocm1wL
 Gp2vVrAtQOpzoG6oOP+XdLSsFA==
X-Google-Smtp-Source: ABdhPJwFhn3WUPESS5w8sSu50szxQr6qmD32XDF7sWlOuuj5eugzUOUVYzym5mk0Jr/OIAp4Jq2Jiw==
X-Received: by 2002:a05:6871:1d0:b0:da:b3f:2b28 with SMTP id
 q16-20020a05687101d000b000da0b3f2b28mr2674159oad.199.1650496226847; 
 Wed, 20 Apr 2022 16:10:26 -0700 (PDT)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a4ae931000000b0032933be7230sm7424481ooe.4.2022.04.20.16.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 16:10:26 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCH 2/2] Revert "drm: of: Lookup if child node has panel or bridge"
Date: Wed, 20 Apr 2022 16:12:30 -0700
Message-Id: <20220420231230.58499-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420231230.58499-1-bjorn.andersson@linaro.org>
References: <20220420231230.58499-1-bjorn.andersson@linaro.org>
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
bridge")' attempted to simplify the case of expressing a simple panel
under a DSI controller, by assuming that the first non-graph child node
was a panel or bridge.

Unfortunately for non-trivial cases the first child node might not be a
panel or bridge.  Examples of this can be a aux-bus in the case of
DisplayPort, or an opp-table represented before the panel node.

In these cases the reverted commit prevents the caller from ever finding
a reference to the panel.

This reverts commit '80253168dbfd ("drm: of: Lookup if child node has
panel or bridge")', in favor of using an explicit graph reference to the
panel in the trivial case as well.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/drm_of.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 026e4e29a0f3..9a2cfab3a177 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -244,21 +244,6 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 	if (panel)
 		*panel = NULL;
 
-	/**
-	 * Devices can also be child nodes when we also control that device
-	 * through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
-	 *
-	 * Lookup for a child node of the given parent that isn't either port
-	 * or ports.
-	 */
-	for_each_available_child_of_node(np, remote) {
-		if (of_node_name_eq(remote, "port") ||
-		    of_node_name_eq(remote, "ports"))
-			continue;
-
-		goto of_find_panel_or_bridge;
-	}
-
 	/*
 	 * of_graph_get_remote_node() produces a noisy error message if port
 	 * node isn't found and the absence of the port is a legit case here,
@@ -269,8 +254,6 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 		return -ENODEV;
 
 	remote = of_graph_get_remote_node(np, port, endpoint);
-
-of_find_panel_or_bridge:
 	if (!remote)
 		return -ENODEV;
 
-- 
2.35.1

