Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EED52CFC0
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 11:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A1611B2F7;
	Thu, 19 May 2022 09:52:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8C611B2EC
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 09:52:04 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6536E83BDB;
 Thu, 19 May 2022 11:52:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1652953922;
 bh=FabFjKys0PjvsUpRZzjTSjZ4fj1wVVLBbO0AL64YS1w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pbLtoJU5SrJE1+huChh3F/gPhPyY1FkxzhbEjHcr8LLREDrmfaCGTnhBOcl5txpWH
 GlVxm27ohHI6dB3h5J2hfVY5WMemA6p555lTHOCwNl2TldPESR8cXA8F/z5imMOdTQ
 A9c6RlRu39iiA9fPYmBcMKCj3vC89bwTO2L8frzEvELxogs5IaHJdsda/gzszsxyxJ
 ySYIN2NkCEJGbMqDMqrAe5MMc+B2kCJcVUIyd4TaOequML+jf+R7R5xWr/NdXVU04O
 9oQ7ISbBQ74Rd3dEoeHs9wMknQPmvGdVpRwkSFAB4sDhyiqjWdk5H14WWUzUqKyE29
 JB2A+aezmZfDA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/bridge: tc358767: Report DSI-to-(e)DP as supported
Date: Thu, 19 May 2022 11:51:37 +0200
Message-Id: <20220519095137.11896-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220519095137.11896-1-marex@denx.de>
References: <20220519095137.11896-1-marex@denx.de>
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
Cc: Marek Vasut <marex@denx.de>, Maxime Ripard <maxime@cerno.tech>,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 robert.foss@linaro.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DSI-to-e(DP) mode is now supported, update the driver comment
to reflect this. No functional change.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
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
V2: - Shorten the comment, since all modes are supported. This also
      fixes disparity between -- and ... spacer on 1st and 2nd line
      of the comment.
    - Add RB from Andrzej and Lucas
---
 drivers/gpu/drm/bridge/tc358767.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index f78c2ad845159..45ea829d56601 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -3,10 +3,7 @@
  * TC358767/TC358867/TC9595 DSI/DPI-to-DPI/(e)DP bridge driver
  *
  * The TC358767/TC358867/TC9595 can operate in multiple modes.
- * The following modes are supported:
- *   DPI->(e)DP -- supported
- *   DSI->DPI .... supported
- *   DSI->(e)DP .. NOT supported
+ * All modes are supported -- DPI->(e)DP / DSI->DPI / DSI->(e)DP .
  *
  * Copyright (C) 2016 CogentEmbedded Inc
  * Author: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
-- 
2.35.1

