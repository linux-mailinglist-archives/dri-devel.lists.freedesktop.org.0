Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB088416C38
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 08:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3B06EDF7;
	Fri, 24 Sep 2021 06:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C536EDF6;
 Fri, 24 Sep 2021 06:50:53 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6BC92580B75;
 Fri, 24 Sep 2021 02:43:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 24 Sep 2021 02:43:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=OqazDwlqGLeCW
 8on6jqoWGyiDynRUp/lRFNar3oIuVo=; b=o8MLSu9QdD7+d0xFbK6ipk/Ys89+s
 dECh0OLqHpqJw9/xEm4jDEv4tUEC9dmKMoc8wyg1uiWV64j0+xaeKuV+0ZY03S/V
 w8B+yBTJtDAR8WEsT260qhHlWMh38brPgw3tdz75srfzOWWt2YS6U3sM3CN43jXP
 Yro9iBszUWHdc2cNlSGvgNaS8UPU0ycA7dma1L85sUGULcDB983kdCf6w5fY/WBm
 /n+4Sz54heyS/xssLXRgH3qyMAbZ4x59lnBefAZmWSmPme+2qWNA8PJcbqt4bJ5g
 /x6VL7Z8rc1eD8lWEtZIKp+cgG3APoc/MdzEovAdxqspf33hIwgZNKlIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=OqazDwlqGLeCW8on6jqoWGyiDynRUp/lRFNar3oIuVo=; b=gCMmZ3ir
 sjbJ+n/GKUO15m5PqyWcNa95tcVr9fWEv/qs5fkX+GET4AoUotETXkFCnhUqkZCM
 Rao+5e8s8e5RZ9QnYVQJIO1JVjkYbUdHDhrHazGnQ2c2J9lze1c9mskr0gt0rvnw
 P5hxOrczVb4KI8Yu67i7f2H2HrYkip6n3oAf7LgqDdMcVeJ+apunja9XhbBwFLCq
 t4/DiD1ZBuUl3BXzVFtXzb8Bwo087GbYavKqiQqqnIj4t2CoXi3bRVeKdk6xOmmM
 hFtmrH6nLFC5BItzCQUJc2ZviQaYL+gtpzB9YZRU+iKp4pHfgez9k7Y3iKXP4dGl
 1eGLDJkLJWHaDQ==
X-ME-Sender: <xms:mnNNYZ1U04fg4kl6wNKQqMgpZ9L3vcwwjHnr_i0CPt6fSM0F_SIAHA>
 <xme:mnNNYQExsiFBtYyHhUY5X_M6kUH9EGJjvdXmK9O2j4lqRnMEjWMf8kLBGPpOvkcUH
 GMGKS81SqLOffcuKQ>
X-ME-Received: <xmr:mnNNYZ4bMnOT82k7jK12QYfHZMHl8HZoHMTzJOJUQoBKZiNPY1_6RcOdWwwNjzsOvan4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:mnNNYW0isc82wUEyfEe8lhELWr-QqNRIqhOZNRWxyBniMK3fKDpmPg>
 <xmx:mnNNYcFaGRL4Lo4uQtMEIPlC4UjQSY1SFIARX8CEHezuEgxahR8_2A>
 <xmx:mnNNYX-mJwWw_ywbdy9r-kf2F1cbTFDwpmtCbM4HKuwqzPn-rFsqsw>
 <xmx:mnNNYXC4t7RSpxcaeRbBhVZRVpxQn-G5UHn9_flIIe_ea_706uWo1g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 02:43:35 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v2 02/17] drm/i915: cleanup: drm_modeset_lock_all_ctx() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Fri, 24 Sep 2021 08:43:09 +0200
Message-Id: <20210924064324.229457-3-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210924064324.229457-1-greenfoo@u92.eu>
References: <20210924064324.229457-1-greenfoo@u92.eu>
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

As requested in Documentation/gpu/todo.rst, replace the boilerplate code
surrounding drm_modeset_lock_all_ctx() with DRM_MODESET_LOCK_ALL_BEGIN()
and DRM_MODESET_LOCK_ALL_END()

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
Reviewed-by: Sean Paul <sean@poorly.run>
---
 drivers/gpu/drm/i915/display/intel_display.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 134a6acbd8fb..2bf01416d656 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -43,6 +43,7 @@
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_rect.h>
+#include <drm/drm_drv.h>
 
 #include "display/intel_audio.h"
 #include "display/intel_crt.h"
@@ -13476,22 +13477,13 @@ void intel_display_resume(struct drm_device *dev)
 	if (state)
 		state->acquire_ctx = &ctx;
 
-	drm_modeset_acquire_init(&ctx, 0);
-
-	while (1) {
-		ret = drm_modeset_lock_all_ctx(dev, &ctx);
-		if (ret != -EDEADLK)
-			break;
-
-		drm_modeset_backoff(&ctx);
-	}
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 
-	if (!ret)
-		ret = __intel_display_resume(dev, state, &ctx);
+	ret = __intel_display_resume(dev, state, &ctx);
 
 	intel_enable_ipc(dev_priv);
-	drm_modeset_drop_locks(&ctx);
-	drm_modeset_acquire_fini(&ctx);
+
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
 	if (ret)
 		drm_err(&dev_priv->drm,
-- 
2.33.0

