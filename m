Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E1ABB6463
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 11:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CA810E1E4;
	Fri,  3 Oct 2025 09:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gSoxTYEe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E7110E1E4
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 09:00:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 318BF1A10BF;
 Fri,  3 Oct 2025 09:00:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0217660683;
 Fri,  3 Oct 2025 09:00:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 44B57102F1C39; 
 Fri,  3 Oct 2025 11:00:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1759482049; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=vewxcAfVxOb+fFtrTVXZN0dTk5mEyTYPA5Q0ZxBR6lc=;
 b=gSoxTYEe3GdQiqsSL/5zMSUEM5D0PLLpwO1obxET5mTXN1d3KgI56K6vcqG+DAq0ttMMup
 kAG20NzrSeDrr2QhIdjSL4NqQ/1Um4V1xBorlvYQ6N64dbI/b7XZMpYjHL2MkHrXaf1ySv
 zbEuTcMk0031W7EAP3LfDhLKPdfAwXfERPb1ryHKeskJlYNj/yCFG9riQa7u4ihe7ck5MG
 UDnMeVESCxfYr+3M2Et3E+jRCIKOrysL5mkjG08kckOkqlRWBfm0LnZCCVGZvW2vUyzB00
 oH2/n9I5hkmCL/aysX2KADGW7UwyUcoudOpZsxXROxz2goauuLe3Xeg8+r3CfA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 03 Oct 2025 10:59:57 +0200
Subject: [PATCH 3/4] drm/bridge: document that adding a bridge is mandatory
 before attach
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251003-b4-drm-bridge-alloc-add-before-attach-v1-3-92fb40d27704@bootlin.com>
References: <20251003-b4-drm-bridge-alloc-add-before-attach-v1-0-92fb40d27704@bootlin.com>
In-Reply-To: <20251003-b4-drm-bridge-alloc-add-before-attach-v1-0-92fb40d27704@bootlin.com>
To: Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
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

At the moment it's not documented that you need to add a bridge before
attaching it. Clarify that.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Link: https://lore.kernel.org/all/20250709-sophisticated-loon-of-rain-6ccdd8@houat/
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_bridge.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 53e7ece36dd940aabd1c0880f296fce7224a12ac..1246a52f8767b52c5f10139aa897824b3c2f28da 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -422,6 +422,9 @@ static bool drm_bridge_is_atomic(struct drm_bridge *bridge)
  * If non-NULL the previous bridge must be already attached by a call to this
  * function.
  *
+ * The bridge to be attached must have been previously added by
+ * drm_bridge_add().
+ *
  * Note that bridges attached to encoders are auto-detached during encoder
  * cleanup in drm_encoder_cleanup(), so drm_bridge_attach() should generally
  * *not* be balanced with a drm_bridge_detach() in driver code.

-- 
2.51.0

