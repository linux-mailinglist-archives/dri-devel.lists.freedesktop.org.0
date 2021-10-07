Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 944B6425BBD
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 21:38:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2AC6E84A;
	Thu,  7 Oct 2021 19:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAC96E84A;
 Thu,  7 Oct 2021 19:38:12 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 4B3C82B009FD;
 Thu,  7 Oct 2021 15:38:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 07 Oct 2021 15:38:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=2vRU8CfQA//y8
 mJpNYyM4Fgn9sjm+M/V2WJONp99P2M=; b=rq+oY61s3KnF97is/ht0v3w2H/glU
 kM439zn9ix0lXkvvdyGR9ltRGeqQySTbLJlKhNhptDZDJhGfYjInO8nyLDUz57c+
 NNGKa/xWFkeVcWfPHA+jf8yLkLdsAr0geLC7cqZ1bdOV1gTS0IAgn1mlK4m41otL
 noIbSVhgJVSWnKtPoRQt+eySDPNBWJ9IER7HSza1UfTudGxl9ZJUBEPsY6Ak1bwU
 wW5YcVzqNgQFijx26Zi850uiOZrPGMiuZYhI/ekmyFpPR7jgIO4PhsfPR0dbcyZJ
 xLWXn77yYA8U9qGxOS0t+v+hSOpIBPD2/G1iCpaSNNywuY97f73Q0v/DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=2vRU8CfQA//y8mJpNYyM4Fgn9sjm+M/V2WJONp99P2M=; b=Jn7vzD/s
 uo1T/FSGmhLI8GoMz4+A3+KOIYRJiRLe8l6Zgn9h1uxSSl4kBGvQ3DD0RUwpaXqc
 r2rckLFV4JTYzbGhW2hDiU3/obuFVtj10Jft92UIb+Y7CnGLmnEc5dgqmEksY14l
 xEbso1aS3r5fo37D/5NPF4jqB9doeaijrQ/bHrQGP/PwtW5yzBfnkhWam26ko6Tk
 gN8ObC0lwWLigSYJJlC7ZXwrOherp3kg+UlRZB9KtlaNrmKBShFP3KAqGSG2VXiF
 jbhxDd5RWCfz7/w3a7zhUBNYyOI9I+8j0GmccQt8rmtBbRkieZd3rIRqLgs+JiAS
 MAcjYRSUc7qUJw==
X-ME-Sender: <xms:oUxfYbHKVHYD3Ln0GQdXRkIG2ZEPyDO8Ff489A3jq_RgFqUTPGhNQw>
 <xme:oUxfYYVvVzGImqc7zBRosZhfR0X4sDs4me82a-JuxXnpunoFJUFZE-jW7wT5rf_Tc
 hUKLEg7xmSHqJpZrA>
X-ME-Received: <xmr:oUxfYdJRaKyF2Lllzy0mUkOabWViR18WezZK5A7ilgGkkETJdsmVQ2XOPoEIoaR6LQV0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelkedgudefjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:oUxfYZHuaPBMzdDsFz6MYpJkvZ4IQ3WHUSguCoWrh9scUO98POJRFA>
 <xmx:oUxfYRWe84qyCZw6OLPSetJSyBS13o-n168RvnfBwXLu2b1HGvZcTw>
 <xmx:oUxfYUPJA3zizqPfxPVLPkcqEWNoqrnckd2ZsCNbvQjLp17ZuFuvzA>
 <xmx:oUxfYZTVSnMnhGQXi5Ue1mPFsir835dEAaf49TG_AlVmDnUIM10Itt-7mGs>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Oct 2021 15:38:07 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v3 02/20] drm/i915: cleanup: drm_modeset_lock_all_ctx() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Thu,  7 Oct 2021 21:37:37 +0200
Message-Id: <20211007193755.29579-3-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007193755.29579-1-greenfoo@u92.eu>
References: <20211007193755.29579-1-greenfoo@u92.eu>
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
index 4f0badb11bbb..cb1142447186 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -43,6 +43,7 @@
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_rect.h>
+#include <drm/drm_drv.h>
 
 #include "display/intel_audio.h"
 #include "display/intel_crt.h"
@@ -12656,22 +12657,13 @@ void intel_display_resume(struct drm_device *dev)
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

