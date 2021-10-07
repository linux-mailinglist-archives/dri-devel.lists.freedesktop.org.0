Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D29D425BBA
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 21:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507C56E83C;
	Thu,  7 Oct 2021 19:38:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09AC66E833;
 Thu,  7 Oct 2021 19:38:07 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 1B17B2B009FD;
 Thu,  7 Oct 2021 15:38:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 07 Oct 2021 15:38:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=7drGizuMVrgy3
 XtFLhWzlftyWemSxaP+r0ayB6xLFcI=; b=KvXB9xq8TlLHSJus6JCKqNaZADhq5
 MVGaDsjNudk2fAZqlWlHUuSbMD2AAakw4R2HKYsN/iQED24zPjG/cMm9ZVOnE8jJ
 noJBzjzkfRn+wrb0loh2pwrZaM+05IntAMTU4YIWChG2hTvAOyFQwpelsthUUeyg
 FBqjf4QCwbGaeB7c4MyR9fOka2oMfQY+zPJ8mbFJy76cIG4qfDftlIDZMKLW9P2g
 tLfsGVwHJeTUAEBRAjJvLL36WICGC6KiNGHD5kyy8JUVEMY63tUyzugmMjDRG4Hl
 eYNUhswO1V5oEBE4a8+0Gd2MYKLFkEp8pmsSMQ+YHISSx6CxoD76w2lug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=7drGizuMVrgy3XtFLhWzlftyWemSxaP+r0ayB6xLFcI=; b=nT9hFVt2
 mc2sYTZLaOCw9Z7Kk5RCVO7eBRMoHclVehYvGhmyMkmQ5f726WohWcOM4Lh6epE4
 8fnNqkbksabDVCOtZDoCEo1UeuqKeXUXpJT0owneJXnL0kWNX6yBvECkF0Nbj3yA
 1ICIaB05UvWI/scUSfqE2JVBCGClTg7kVCvD957pNG3GXX0RFTvQZlcZJPZKgCP4
 QMJ8sSOD61uR26xt0JR1noHpz1jprOA5xNztd5CjbTFWE0rD2f8FQU+JQK4QLsoP
 M7lxQvBwR8n3je4PkI8RxoDALQEPY0+U3fG5CdI0PX0bmgX6Hkkkx2ZRorjN3mDl
 R3FUVqqnMbtpRw==
X-ME-Sender: <xms:nUxfYUxaTBgwdTjYG9xTc4jy7PjZPpS6izJdIgqIrwQ7XR_aQCfRnQ>
 <xme:nUxfYYTWqF_slclXQ4eLhOW9pATKmLpRVrdsV5Nz5hqRgJ9zhYc0Op_XrByguoll7
 b4Ubi9eA0o0egrsaA>
X-ME-Received: <xmr:nUxfYWVGrpz9IuTgKvXhSUB-a_BzCwGI13qlpvrPXJDYb709tyIM5vMlI7JW7r8VXQdc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelkedgudefjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:nUxfYSgjcgnn6GxQbYMqRjjZ8ZyRg3QBcAMVowrDcEnOjF3ROplG-Q>
 <xmx:nUxfYWCsUubJmCzKEHWDKbMAxh6oBou_cHjcpgxYRW2MwJcvrfxnpQ>
 <xmx:nUxfYTJBeAF_rZGm-ZxCw89KYhjCy0FPjUQ3x4C1-SxPipyWS3lJGA>
 <xmx:nUxfYetddlX3vUf2ms7cvrzo2DnVqintbqj0N10dlq5vMp1IxYO2yk7C_8s>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Oct 2021 15:38:02 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v3 01/20] drm: cleanup: drm_modeset_lock_all_ctx() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Thu,  7 Oct 2021 21:37:36 +0200
Message-Id: <20211007193755.29579-2-greenfoo@u92.eu>
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

