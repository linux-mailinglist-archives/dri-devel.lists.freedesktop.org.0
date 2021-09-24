Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEFC416C3C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 08:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7726EE3B;
	Fri, 24 Sep 2021 06:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B306EDF7;
 Fri, 24 Sep 2021 06:50:53 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id D5735580B65;
 Fri, 24 Sep 2021 02:43:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 24 Sep 2021 02:43:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=7drGizuMVrgy3
 XtFLhWzlftyWemSxaP+r0ayB6xLFcI=; b=aD9TvLouQJ44fgUO1XPrMKkRIVaAb
 TkeMf42dCy0G8Avl7izAaMwsP8xHiqzmKEl501aMgnO/jIJQYeIZvdTnQFuzn0Yr
 f2vwl87o/sm3wuAiTQ/4KZRM17zildKntns2gScaWUGpo932KZPmSX26aJto/BaD
 nPiOnR2cm96n9TUdOWxoPxHLynCE/ROHOjPac8uYKtj+nfeY8dDEzkVeXi5Z5b5w
 EJzqgluVmI1n0EQvYzTnFUnWRpN7pwjqJX8G4Qp5ipc0nHcH/GnFmG1X0Vp5UCF4
 KvoRmzza0IFr/cvFT3fJEqT340YUZxAGh4AsmOJyX10GDrfJYs77JIO/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=7drGizuMVrgy3XtFLhWzlftyWemSxaP+r0ayB6xLFcI=; b=IXPVXh70
 M1FOF2LjVHnHz+7i1X8Ga5PgYZFv+Mt7qoKoL1U9AdYc1YdF0zPPG/bCgrydebVT
 Zy1uA8sQn1x33BcgTN0xBPIjHLhT89KeCNK21/ZExlfnGVtk14qWQATUVnZq0LPr
 UJ4iJJW/SF0+4kBa2BJx331mRPeH3yyuiDe1nyeKoSL+eF4zeoQvpiVxIxGYKy4a
 hWba/1ihUxNncw8P8vpVcE6jJ0a1xQYklFcvjY2EcA8TOMskIex+5MJhktBVwA5w
 +86g3CsTTbKQqQqE++BkKHmzwGEXjx21CSLFdmVtwIdb6Tc1SlF7hw8+9y1Eu0zy
 v1y/dBlmwIXkfQ==
X-ME-Sender: <xms:l3NNYYH016bVPoNr_YPp0W32phPUw7lPM6Q__23mpFNHJumQbcCA7g>
 <xme:l3NNYRUdgZygbTTbcWAvc7RscNhtDIn02GvcrZcdJyUJd8VMJU8yZaGx9gYw1mUhB
 CPCl8Cbs3GOLLXD4w>
X-ME-Received: <xmr:l3NNYSKY1p97WKuVZkSuZe9e-ile037b-nwuOhFkdB4ViMzM8aVnaM_y7oFop4m2P19z>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:l3NNYaG-SNtFdpZm9yfOXKE1EI_R3knoSLFAd6evyZnlYP2ofSPZGg>
 <xmx:l3NNYeWU7U-5efSb408MqCkdyUI9VKOsimic6B4AMyX2tQ_Jj6az8w>
 <xmx:l3NNYdO_8NWrubNVtlNTRIRa-htM3EOYr_-HlJXntTXcwJQrh49yPw>
 <xmx:l3NNYaTJ_hwbg-uwZRPhxqvdNZlsCms0XKQLEbNtp1zQ2OZ_XsWVqQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 02:43:33 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v2 01/17] drm: cleanup: drm_modeset_lock_all_ctx() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Fri, 24 Sep 2021 08:43:08 +0200
Message-Id: <20210924064324.229457-2-greenfoo@u92.eu>
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

