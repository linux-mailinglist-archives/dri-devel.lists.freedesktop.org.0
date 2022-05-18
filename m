Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D9052C79F
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 01:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241DB10EBB8;
	Wed, 18 May 2022 23:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B51210EA94
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 23:36:26 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 14D7F83B63;
 Thu, 19 May 2022 01:36:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1652916984;
 bh=CwQOPcaWGh71awRXsPO8GV0BmF0+XwUw7n+g+BZAkZ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VxK2mYn330IerRLNFKBfoaFonx1uVT84dpteDNJDcTG383mOLscqn1bK/kCojVW0R
 IyoCGUdRrzAQry8Xrc1yj9WNTk1/tUwuJbFHmfkS6IrOZUBjOa1u3ErWRzvlNV21io
 cwCPsMLtG8t73YkQO0urOz4N9RXxFSYYEj8jS5YSwJYyBQNVUeOMvaEqOdhECFOTBh
 R7b11rAHKS7h9cvh89eterUaPgi5dtmO2KsYRRpNjJtAovPip2IwN/eTPiFnp1rbEw
 oHBFRlS10NCgYs4PbQTT/vhG5inmjwd5zuAiH1xcxHDDHHLS2NlGMr1cAONRNJft91
 rd+QlSRKWhscg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/bridge: tc358767: Report DSI-to-(e)DP as supported
Date: Thu, 19 May 2022 01:36:01 +0200
Message-Id: <20220518233602.248185-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220518233602.248185-1-marex@denx.de>
References: <20220518233602.248185-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 robert.foss@linaro.org, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DSI-to-e(DP) mode is now supported, update the driver comment
to reflect this. No functional change.

Fixes: 3080c21a043ab ("drm/bridge: tc358767: Add DSI-to-(e)DP mode support")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Marek Vasut <marex@denx.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/bridge/tc358767.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 84e6b5aa8dd1f..a8bb6de9e600a 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -6,7 +6,7 @@
  * The following modes are supported:
  *   DPI->(e)DP -- supported
  *   DSI->DPI .... supported
- *   DSI->(e)DP .. NOT supported
+ *   DSI->(e)DP .. supported
  *
  * Copyright (C) 2016 CogentEmbedded Inc
  * Author: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
-- 
2.35.1

