Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C52842CB65
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 22:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6906D6EB0F;
	Wed, 13 Oct 2021 20:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D456EB0F;
 Wed, 13 Oct 2021 20:48:56 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0E1B5581175;
 Wed, 13 Oct 2021 16:48:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 13 Oct 2021 16:48:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=7drGizuMVrgy3
 XtFLhWzlftyWemSxaP+r0ayB6xLFcI=; b=eXb05WOvWZqNoqgM4Dpxl8lJhaJ7D
 uySjzLPxiXyCCw3epGTlJ/C0R0P5F61NWt6kkIXQQaSc9cHNF0kY8BKDNeDebeFo
 PE74NUxfKPiAWoJsK/wbOhMs9tiiMRIiacKweFE3GqaqIqXAmd9y7SHcUEh/+yJR
 B3W+DKZ7vtGkZhjPUdA30evZZYMasMcqocBfK3wGOrk1TRO5GzJi1lIEiMwVwd2s
 Ik35BEIJDBqvjI4tH5AV5P66G7q2cA1N6aFm6yUvBl5aiWZ6aISDPu6CDDISzjzx
 PLMTP6lAPOdmkO+neLQHi1LaSTv6KLjA7Um5P6gtNgRAHzXpiwAgPfdJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=7drGizuMVrgy3XtFLhWzlftyWemSxaP+r0ayB6xLFcI=; b=lS8XneQc
 b1cj3qlbgroB9frXOUMyW6SluPvJnv+8M7+mS1F5rEGSDdABsPR4l3DVfx13FkFY
 IiNNGfG1cgNRhM020z7FOOmAP5kzsehGD+W7hHUtXH9Oo3DJ/jSF6kTqxSS8/Neu
 xWCm/g4VTQzF4/p8ROftviZ903nf3/06nDust/qtLxxj9lpdxnBOeFFzqxCG28ub
 odWYPb2izjP0bZpIvywpPwXRDpCOZunF473pCEnY3Qbs/l2EHKUPPzIjFAvheepI
 Jv35Oarvekdr9Y5GcGc/K2PBASy1h7Z9SEC6lRV3ZXswZn/c3Uwp9TeyXl2VC3An
 vBcuxRLHtPkTYQ==
X-ME-Sender: <xms:N0ZnYSuA2s_Os7XYnkL1Kbg65iQoM-nT_H1KFSqqwnRfwUR30vyNuw>
 <xme:N0ZnYXdQyYgZlAxCFpjHgvXDR6OW-bD055vbNEgpj8aAiPOi0LDzJIOn8tjeMAn1T
 Jergh-jXhgD9HyLnw>
X-ME-Received: <xmr:N0ZnYdyEFnOfnbk6_xRctx6Em03kPXF9GoR0J13LYbxkusACDcvSybVNnJoMXJk0xD6X>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgudehudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:N0ZnYdOlp8N6kkhmWiknrBJOe9-i1bWHZpjxiW45Ry3TbmQFfTv0nA>
 <xmx:N0ZnYS_xJAKnjDHpzyD-kCEHYiSsYt69NaAWcde_6RGdesdBr3zoFg>
 <xmx:N0ZnYVWHpbQKcEAY9L5Bf0bk8UzuXbgEsvpdcpJbqtPEzZ50vPw7_w>
 <xmx:OEZnYVbhjV2Or-Lx5rUXGvv5B1pOUrt1WJxeSogvvxZhyWkUSLggOw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 16:48:53 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v4 01/20] drm: cleanup: drm_modeset_lock_all_ctx() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Wed, 13 Oct 2021 22:48:27 +0200
Message-Id: <20211013204846.90026-2-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013204846.90026-1-greenfoo@u92.eu>
References: <20211013204846.90026-1-greenfoo@u92.eu>
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

