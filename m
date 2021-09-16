Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 372DE40ECA5
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 23:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B6606E9DE;
	Thu, 16 Sep 2021 21:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9806E940;
 Thu, 16 Sep 2021 21:25:56 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id EA78C2B011F7;
 Thu, 16 Sep 2021 17:16:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 16 Sep 2021 17:16:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=nH01XLqPXIfEo
 lLg5yobc0MAi8VZM/gVE7nKa7sEIlw=; b=vZR6GCU4Y+DTS1Mm7h2bzVIO3Paka
 T29Vo2iHpuCNyAqvFhZPvKpAlERQGPRSKSWVU9Nbat/b1vI3UN2oR22aAu8IpVLt
 vWwGP/2QthedSktoWva/yz3Fj/0dIsdbTpWm82JqWEMtdm052oOo5fFogEn5poFY
 lyZTfKkDw/mNPkP46EoHrXGnf7Yfa/EF+mD/31sy8OtAsq/0KDLTkATgmRNdq+1k
 DmnWBdgF2u0UrDT6b0+eocqfUSALlNRGfRmv7gGT0/1F76ppZAwh8WGBQl/8XXez
 lEKSjomp6tbJ3Vq0BKAe8YUe2x5X26rG9Id6n2XkrazeyV8q0RbxK6yNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=nH01XLqPXIfEolLg5yobc0MAi8VZM/gVE7nKa7sEIlw=; b=jSjQeKwq
 5NsbATMWjTVVvtucAmegFkjAjMSrb9hQQEZCr3hoMDyYnFtLo8LfaxEhnSNFg4qg
 Ayyhrp6n0xzRilHG7zGj95uEOiSeDGduV0hJriXcHZRduGs2g0k1ZR5r0TRhsMBs
 KuFbkmV8OEDsnYd6NGWNWtPk+LF4CeS2oh087vyGNkGtOxoo5YvLcXdChW59vqGo
 whHyDCYwaK3T7b6wUO0gpVVHQL33Bjsx55Igvz8XzS6cvTV3nzoJsGB1T6JA6qQW
 rSau7sCf33LYKQaerMlH1TlZTvQofXyWPyQoNGNPlvl497f3RIeshjZxGF3t9SKP
 r9pgqg4ZEInrBQ==
X-ME-Sender: <xms:PrRDYUzkRn4_bdy59vuwlz_Y7RCxsppseI8ylqzzTjCSWZUgwz_UYA>
 <xme:PrRDYYSYURs-BqYcIUB0RZRCh99MXEjz9Q_Blvkya2s6VfQrng49Tzq9Eb2G9gmKU
 -mmNUeCd8Ax9TcUEQ>
X-ME-Received: <xmr:PrRDYWXg1Pkwsp6en2FfK_R83kwrmNxzokQiQOdGjVdcaXADN5Nr9RbtHjUGasTaAgv1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgedgudehfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:PrRDYSi1PVkmQeSnGriwNiloT7zK1oUdMAuS1of5nE_lXKzkwPw7HQ>
 <xmx:PrRDYWDWK13uR6Def8ZXfwlgQ9WJ2hAEvVRe7v8-oPqsQnHNoFqVBw>
 <xmx:PrRDYTIjq29bQ_ofN6DgbJUPKCauhvnfHSUuKQC585AKDlxfajrpig>
 <xmx:PrRDYetvSle2C8LMrXQgK20L1Yf2dhwrLh5GY2ZKmyNuJMEdPWkSFqqsuSk>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Sep 2021 17:16:42 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH 11/15] drm/msm: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Thu, 16 Sep 2021 23:15:48 +0200
Message-Id: <20210916211552.33490-12-greenfoo@u92.eu>
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

As requested in Documentation/gpu/todo.rst, replace driver calls to
drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
DRM_MODESET_LOCK_ALL_END()

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 768012243b44..4cbc79eaee17 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1172,14 +1172,16 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 	struct drm_display_mode *mode;
 	struct drm_framebuffer *fb;
 	struct drm_plane_state *state;
+	struct drm_modeset_acquire_ctx ctx;
 	struct dpu_crtc_state *cstate;
 
 	int i, out_width;
+	int ret;
 
 	dpu_crtc = s->private;
 	crtc = &dpu_crtc->base;
 
-	drm_modeset_lock_all(crtc->dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(crtc->dev, ctx, 0, ret);
 	cstate = to_dpu_crtc_state(crtc->state);
 
 	mode = &crtc->state->adjusted_mode;
@@ -1263,7 +1265,7 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 		dpu_crtc->vblank_cb_time = ktime_set(0, 0);
 	}
 
-	drm_modeset_unlock_all(crtc->dev);
+	DRM_MODESET_LOCK_ALL_END(crtc->dev, ctx, ret);
 
 	return 0;
 }
-- 
2.33.0

