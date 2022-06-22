Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A494554D2D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 119B21132E0;
	Wed, 22 Jun 2022 14:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8834E112D96
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:33:21 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 470C3320093A;
 Wed, 22 Jun 2022 10:33:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 22 Jun 2022 10:33:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908399; x=1655994799; bh=8I
 /P0GQiGV+MpIsISc0/d1Xogwhpg2+eMI8V1N5jzqk=; b=RnNNoOVxk/5WPbwlK1
 33ZML6r9C4Twyc1fWzzBWt8Lx+ngu+lClWYrK5luxGiojbX+UT4uPJTjHt1uUGcT
 MDGTIuusOwVCtiyvpKFqjJFbZWZiqXrb2365Cguj1ZwY9QydtfaWM2M/acwkcTjX
 wvxbTcIN7q2P4kBEPO6Ti//3FMjCUX7KHjU/0HBdRtvPogGgX+lk7/sqLCYHcbC6
 qV0vijAgPI/vH53GKZNtGid7XjvgqW/qI241qWcYKT0uY+95VfakzF1GW3a04LRg
 VYmBgCnXWf19phIQkhX34D3K1GjvIgcli3KAMieOwMz4Z9Ng40G0F+T/eD4ImIXc
 3Bwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908399; x=1655994799; bh=8I/P0GQiGV+Mp
 IsISc0/d1Xogwhpg2+eMI8V1N5jzqk=; b=RvMMdqSHdYQOH9gsJGS7LL4+A6UvQ
 upEETmHpmD10BtD1vQ7VxVA2L9IjFcc3Jz7bl4RroyOnbJyXHk7SlEZFSUr+GtpJ
 kGGF3V0gPOY746fjE9Zj5m6z3b2QwCaExpE1GbE5cGzMs15Ltq9ij1zNP0Fq2+IG
 xywVPEZZNIBVaMMwVSoAau6K7tG3noig5pJfr0QXFTZeyPs6oKfm1CntCu7IPmW4
 yYR+3weygPfg81hzoc1J0apfXuI8W8c4bVsTprfkZEvJeMysHcz/7CmgagMZ5i1G
 6Q9Xcj9637H8QlxmO8p06DnaePI5ufmbrbcNAf83hnbS8F3pzb50R3KTA==
X-ME-Sender: <xms:LyizYvcVAkGAaSmYLDmzjfBuyh8qHFI-YN-VNSQn86n7rIDADgp0jw>
 <xme:LyizYlNgSUesQT2PfFUekXKlBaj2CjkJHZpzgl-d1gK67xrv-cwQd-bFJjMzQT81I
 5WjMR9F6ITlZMxxVcc>
X-ME-Received: <xmr:LyizYojtrARD0ev4z5zLg_pLGnANPA9L8B0kCsobue8f73C9FZ1aIFrw2QNBdaaGFFZR7qprisAXen7VT5wrRoOCzse4xZa-ybRjloU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LyizYg-_TIl26RMMXEk6ETu5QTqiMrhJZN0klq04aH2L0tPc2_820w>
 <xmx:LyizYruXbMk5hEzs4vMqEmFUdaX82kHWVVpl376nDKWhIw0CY6Zx7g>
 <xmx:LyizYvE42d6r1Hv0hMwUIb6BLPjVue7AMsxxBgjnRQCJkJKN_tTxDw>
 <xmx:LyizYhUzzK_yizM3tdmPZ7cpmoGGi1ZULflAr9o0hB0xR9qp6epY0g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:33:19 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 21/68] drm/vc4: crtc: Switch to DRM-managed CRTC
 initialization
Date: Wed, 22 Jun 2022 16:31:22 +0200
Message-Id: <20220622143209.600298-22-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current code will call drm_crtc_cleanup() when the device is
unbound. However, by then, there might still be some references held to
that CRTC, including by the userspace that might still have the DRM
device open.

Let's switch to a DRM-managed initialization to clean up after ourselves
only once the DRM device has been last closed.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 16 ++++++----------
 drivers/gpu/drm/vc4/vc4_drv.h  |  1 -
 drivers/gpu/drm/vc4/vc4_txp.c  |  1 -
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index dadf962b0bb5..851e4a470939 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -205,11 +205,6 @@ static bool vc4_crtc_get_scanout_position(struct drm_crtc *crtc,
 	return ret;
 }
 
-void vc4_crtc_destroy(struct drm_crtc *crtc)
-{
-	drm_crtc_cleanup(crtc);
-}
-
 static u32 vc4_get_fifo_full_level(struct vc4_crtc *vc4_crtc, u32 format)
 {
 	const struct vc4_crtc_data *crtc_data = vc4_crtc_to_vc4_crtc_data(vc4_crtc);
@@ -1054,7 +1049,6 @@ void vc4_crtc_reset(struct drm_crtc *crtc)
 
 static const struct drm_crtc_funcs vc4_crtc_funcs = {
 	.set_config = drm_atomic_helper_set_config,
-	.destroy = vc4_crtc_destroy,
 	.page_flip = vc4_page_flip,
 	.set_property = NULL,
 	.cursor_set = NULL, /* handled by drm_mode_cursor_universal */
@@ -1232,6 +1226,7 @@ int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
 	struct drm_crtc *crtc = &vc4_crtc->base;
 	struct drm_plane *primary_plane;
 	unsigned int i;
+	int ret;
 
 	/* For now, we create just the primary and the legacy cursor
 	 * planes.  We should be able to stack more planes on easily,
@@ -1246,8 +1241,11 @@ int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
 	}
 
 	spin_lock_init(&vc4_crtc->irq_lock);
-	drm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
-				  crtc_funcs, NULL);
+	ret = drmm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
+					 crtc_funcs, NULL);
+	if (ret)
+		return ret;
+
 	drm_crtc_helper_add(crtc, crtc_helper_funcs);
 
 	if (!vc4->is_vc5) {
@@ -1327,8 +1325,6 @@ static void vc4_crtc_unbind(struct device *dev, struct device *master,
 	struct platform_device *pdev = to_platform_device(dev);
 	struct vc4_crtc *vc4_crtc = dev_get_drvdata(dev);
 
-	vc4_crtc_destroy(&vc4_crtc->base);
-
 	CRTC_WRITE(PV_INTEN, 0);
 
 	platform_set_drvdata(pdev, NULL);
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index df4ff6747eeb..6afa873f0def 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -850,7 +850,6 @@ int vc4_crtc_disable_at_boot(struct drm_crtc *crtc);
 int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
 		  const struct drm_crtc_funcs *crtc_funcs,
 		  const struct drm_crtc_helper_funcs *crtc_helper_funcs);
-void vc4_crtc_destroy(struct drm_crtc *crtc);
 int vc4_page_flip(struct drm_crtc *crtc,
 		  struct drm_framebuffer *fb,
 		  struct drm_pending_vblank_event *event,
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 4c2f0862fc88..949db41c50fb 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -383,7 +383,6 @@ static void vc4_txp_disable_vblank(struct drm_crtc *crtc) {}
 
 static const struct drm_crtc_funcs vc4_txp_crtc_funcs = {
 	.set_config		= drm_atomic_helper_set_config,
-	.destroy		= vc4_crtc_destroy,
 	.page_flip		= vc4_page_flip,
 	.reset			= vc4_crtc_reset,
 	.atomic_duplicate_state	= vc4_crtc_duplicate_state,
-- 
2.36.1

