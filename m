Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D55FC416C41
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 08:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC87A6EDFD;
	Fri, 24 Sep 2021 06:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CD36EDF1;
 Fri, 24 Sep 2021 06:50:53 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 507CB58106F;
 Fri, 24 Sep 2021 02:43:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 24 Sep 2021 02:43:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=42TrVQEBS+T0u
 aTdbmpol3CTMIgV752tP7jigQFe0eQ=; b=CPK5kTuKRqui3pT5A5oFLcMoiRLMD
 /DecsrzBd4f/OBGunPloQSHB/BSiZxsE+iRQpTWxX3UdqjBMDKEBks4PagZimtPK
 ONhgiiA6jUrl9TBz7a/zD1a5e+LqmPgGv+5upWAhh0biFmBuZKxBJ5BBZck3IGO8
 PH+Klo/jJW2JtW9N12YaGRvyzjGn4kcwgrh6OTpqTkOlCnrIfB0mzO7simeiwN+b
 uGfqoqeEcVOxjOE9uR1QNXAM0PYe22vSpLJ5GX8dHgDTi4t5QELjBaBqxjnFL2dn
 dzZ/yaMQ38oU0kIDjz78LPOuxTKaviPAd0JtWo+iUCU1bUF5L+z9uml7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=42TrVQEBS+T0uaTdbmpol3CTMIgV752tP7jigQFe0eQ=; b=Xg4VeC5Z
 OIgWUbwetn5d/iZJd9LG54qVBHbjW9GOqVneIF7AP9O6KcWb8Qpq1ufdO0dmvF7i
 eb8+5Mc8XajsdNswzE54rpHJeunfpC5NGxlQV2ZrBDXM29dfCbTKiIL+rw2kclK9
 N45WUnyQeS15tBFNfQ6u7iEw3nLzlwgWdpm8RXH9UruyGCf65kz6QIZc7B3+3wZr
 xJ4a0RnKoN9ZFJxZd0Oh6W+m7x+YZAdYIIS2E4XvDRJpDF0hWhDAze5re6uW76GH
 bgai4H4u3bCCY5A9a8MwvC5dZ2WF8k10Z+qwbSj+jgeJHPgwJ1friWz/NIIicDK7
 wzGrfR3V7xEubQ==
X-ME-Sender: <xms:r3NNYbFcGl23OgpcGMjFb5SO6hi51JU23R7YgFiwaaTRvz0_sNRktQ>
 <xme:r3NNYYWZooygMnuF7UNVZUaQwZvxjYb_-Q9Nj4n2OpQ2LnGQzuGuDpvKYMeoMOxlA
 M99fyFEpLXJVicCQA>
X-ME-Received: <xmr:r3NNYdIzJcvVjscopI-VWn3cAL0qU81qpyMq64QMsHBqd0gWWMYYrhhGgCK6oIg5ydL->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedunecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:r3NNYZEo4RFt0wLeXlZdSuXw6ZkSVivM5E5agYQ2pwFsnoT8aVtcNw>
 <xmx:r3NNYRVQQEd9v1iG3hQC37E91jYVM-0WkqDf_TaG1j_3j1zvhdmeUQ>
 <xmx:r3NNYUOTl6guybngicq5DC1xewidITwYhY4TvnlJJF5KalX_ZCt-pA>
 <xmx:r3NNYZSPRStSwgnezR5sHtJ9-oImratbfeikKoa0vtnK6GorWXiG7A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 02:43:56 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v2 09/17] drm/omapdrm: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Fri, 24 Sep 2021 08:43:16 +0200
Message-Id: <20210924064324.229457-10-greenfoo@u92.eu>
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

As requested in Documentation/gpu/todo.rst, replace driver calls to
drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
DRM_MODESET_LOCK_ALL_END()

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
Reviewed-by: Sean Paul <sean@poorly.run>
---
 drivers/gpu/drm/omapdrm/omap_fb.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
index 190afc564914..fa7636c13c19 100644
--- a/drivers/gpu/drm/omapdrm/omap_fb.c
+++ b/drivers/gpu/drm/omapdrm/omap_fb.c
@@ -9,6 +9,7 @@
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_drv.h>
 
 #include "omap_dmm_tiler.h"
 #include "omap_drv.h"
@@ -62,15 +63,17 @@ static int omap_framebuffer_dirty(struct drm_framebuffer *fb,
 				  unsigned num_clips)
 {
 	struct drm_crtc *crtc;
+	struct drm_modeset_acquire_ctx ctx;
+	int ret;
 
-	drm_modeset_lock_all(fb->dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(fb->dev, ctx, 0, ret);
 
 	drm_for_each_crtc(crtc, fb->dev)
 		omap_crtc_flush(crtc);
 
-	drm_modeset_unlock_all(fb->dev);
+	DRM_MODESET_LOCK_ALL_END(fb->dev, ctx, ret);
 
-	return 0;
+	return ret;
 }
 
 static const struct drm_framebuffer_funcs omap_framebuffer_funcs = {
-- 
2.33.0

