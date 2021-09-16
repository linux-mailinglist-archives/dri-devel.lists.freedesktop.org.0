Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B0140EC8A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 23:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD5E6E93D;
	Thu, 16 Sep 2021 21:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B196E934;
 Thu, 16 Sep 2021 21:25:56 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 7CECF2B011E2;
 Thu, 16 Sep 2021 17:16:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 16 Sep 2021 17:16:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=THT3r23bRB3DO
 SyAiuVpoYppTCo9NOFvRLFcWAQJ5Xg=; b=fzPkV/swvhkVUzk2HO/pxss5LUjVv
 rfi/aD58J9VRvld38mJVM01mniZ1GrY3QlwKKMf3C7MnMxp9+SXpfN/JKC5QgkPr
 Q5CgwrNnP3X0Fj6NmNKozImKZKdD/I+4/27dWneSQrbobkvKWiJIH7yNH/eVar1H
 ey2mSHiNzmOpBtAyl6HmkFinNFvCZeZzo637/NOLdEvN8oOwrWIQbuJu4osahaMq
 HPUM0uDodgEadgeXjoCAlUZzPbOkBQoxJ0vNHPOV0poFTZmofwwLWJCwLD883KGf
 RynggfEBlIl9IDFOeHeVYXzKEtNPK689/JjR92PoFEH+LYERvoAMTg2MQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=THT3r23bRB3DOSyAiuVpoYppTCo9NOFvRLFcWAQJ5Xg=; b=d8LkK8Bd
 6XK+FC7BimbCd93EyVc28yF6VPT5T+MvCk2csON9fhpq2v1YIrf3hWbmQVk4nXik
 zbzZ5S2T2JnKQi8kXV7+UAx0lVKMXR4ryI9eOvrotYTBR8ECAVGpWkGV5S5a2HHN
 w915K639KZM4lm3a2nLjokqAbcoNJjRToT2XoScT9t0l3IN97gq7LsjEnsxlZCG6
 yLGkJpA7ABDyWGMEMAFg97nv7meytb9EYS6WVRoiwQBqkabe011e8yfV8NswS2Kj
 oddD56VZsR990BjSCLlwug/3SF5Jkk2xkgvZomCFGCg9s1RLmxd1oom0EVO56KQG
 LN49xTHOHekVWg==
X-ME-Sender: <xms:GLRDYTt659or1fsDtvvlRsyHfwtW4_QwHnUWEzxynzVf9KMZm4W9Eg>
 <xme:GLRDYUcpukyBXQOuEbgPMZMewThUX87g2sjdJr_eVrje6Lh7GrXQgWt-1o-Rp1N-B
 FtgsOKqxn5s8KQYLg>
X-ME-Received: <xmr:GLRDYWy1LYMNwGBBtR3Z8HP4vpbGB9e9CbBHc-407042yF7cPJelJkm88anHyvT3xJsH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgedgudehvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:GLRDYSOz6Be9YGmdd9N_ZLEYc_KIsu9wRRbUmvGKI0KxIe9RCqhbKg>
 <xmx:GLRDYT98jfmWDbYrg9Kt0nZlH0xeqVIyLqZlx89A37KcSnWKf3-4mQ>
 <xmx:GLRDYSUd2QtaDhh7JLgsY7LRT7b4RdJ4Ry3zRvfP8G11USUaSrx3rQ>
 <xmx:GLRDYabibEzn--v-DEbRT_IWmwl2Pkg_EJrOpP18MRKTbHYB8WEoDQVXkNs>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Sep 2021 17:16:05 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH 02/15] dmr/i915: cleanup: drm_modeset_lock_all_ctx() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Thu, 16 Sep 2021 23:15:39 +0200
Message-Id: <20210916211552.33490-3-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916211552.33490-1-greenfoo@u92.eu>
References: <20210916211552.33490-1-greenfoo@u92.eu>
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
---
 drivers/gpu/drm/i915/display/intel_display.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 134a6acbd8fb..997a16e85c85 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -13476,22 +13476,13 @@ void intel_display_resume(struct drm_device *dev)
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

