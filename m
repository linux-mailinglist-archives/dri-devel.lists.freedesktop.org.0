Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4D540EC7B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 23:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AAA6E974;
	Thu, 16 Sep 2021 21:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E259F6E8E5;
 Thu, 16 Sep 2021 21:25:55 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id F32C82B011DF;
 Thu, 16 Sep 2021 17:16:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 16 Sep 2021 17:16:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=7drGizuMVrgy3
 XtFLhWzlftyWemSxaP+r0ayB6xLFcI=; b=joAmPfTP2CUq1mUhs+7TF0jmnc/n0
 a9l16AYNEAWtSKpPDPLfMnrrxBoeHIJFjfAPKPYvt/E72nlcrwAcZh5yXWmXSMAC
 1EUHZYmXjPnbbbxqiuYvbZER4vR23GP2wNawwz8uy7r+thYVfRdZZXT9677zSbhr
 1NPMYwA2dB9tGZJLYQ7SYyTIJY1cAJZc3NFVi71HSS6w1uh8p/oWC1dR7wU8VfAt
 an0HZEBGXXtYmRQlu5DnEi2YGZAwCYjeEqWRdacjVrX1E88MPP2t7wIA4FNZ0NMC
 sMMfZIk9c8zXUYrVZDh/3ZsNeo2jw33Ep2Q5l2fZFzo6HdUme8DFRsByQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=7drGizuMVrgy3XtFLhWzlftyWemSxaP+r0ayB6xLFcI=; b=mThYdNSJ
 UA6B6s4cAfzUiJoAmUqiQKSBM7j1RuTZztIRudpdIpxQpg3gyWLV1fvKYsEV6sID
 OMasYA5qnor+pcCiQ8i96/HREyYEi6Tc7q4FR/ssNXsUk9KPkGn+6yjDb6mrUbT4
 25bxFE3DuX1ge/PS6kVtxc3rnzqOsvJIdKZiOYTmv/Lqz78zxbsfKoE7iozwOiyK
 74rDN8qDBOBOXlruo3Tkyu/O+Hjbj6wyI8rwbnRajGl3mw3ULAMFgGO1vw/JXyI9
 XKEt336bxwlGW62VfY0cWj2RvpAIKVdJQ8GCveB8AeBJ79C+N/4/5Piql/dFYs8D
 bGHYXUiIhzV6KA==
X-ME-Sender: <xms:E7RDYUYaydmQ4bnDJeZ2cXCy3cG1IHgwnA1NTZBz0XsTZDj5Fd3E0g>
 <xme:E7RDYfYvuZy7QkXcFKq6DsE6UUS_8FbPs2P9Ef-GjmQkKx7PQMj9e1aKUPkXEqJ0X
 IE42L70621vTk499w>
X-ME-Received: <xmr:E7RDYe_HGJ7Sgl39IjzOywbClm6pdVU5jEckgJHFnavIu_het8QDhaOOjTT01snq8PSU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgedgudehvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:E7RDYepGZWuxM7SWGgEc7seslnw_RSITX1SOUJ3eF7S-FMSojRPvNg>
 <xmx:E7RDYfox0T-kxzBzP_7tR1vWKtP0EsEp1Ll7QVHHXpHUdhtCGlLvnA>
 <xmx:E7RDYcR_V37ARJ5VjTaaixOM7M93W_lc_vGOBs9-iEIVMRxEZ-JJqw>
 <xmx:E7RDYS32YQ75566ndscqtpAdV5d2m5LPgSBY7V3Q6CNJN6nEwQ_Z1gzFIzs>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Sep 2021 17:16:00 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH 01/15] dmr: cleanup: drm_modeset_lock_all_ctx() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Thu, 16 Sep 2021 23:15:38 +0200
Message-Id: <20210916211552.33490-2-greenfoo@u92.eu>
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
 drivers/gpu/drm/drm_client_modeset.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index ced09c7c06f9..5f5184f071ed 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -574,6 +574,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 	int num_connectors_detected = 0;
 	int num_tiled_conns = 0;
 	struct drm_modeset_acquire_ctx ctx;
+	int err;
 
 	if (!drm_drv_uses_atomic_modeset(dev))
 		return false;
@@ -585,10 +586,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 	if (!save_enabled)
 		return false;
 
-	drm_modeset_acquire_init(&ctx, 0);
-
-	while (drm_modeset_lock_all_ctx(dev, &ctx) != 0)
-		drm_modeset_backoff(&ctx);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, err);
 
 	memcpy(save_enabled, enabled, count);
 	mask = GENMASK(count - 1, 0);
@@ -743,8 +741,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 		ret = false;
 	}
 
-	drm_modeset_drop_locks(&ctx);
-	drm_modeset_acquire_fini(&ctx);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, err);
 
 	kfree(save_enabled);
 	return ret;
-- 
2.33.0

