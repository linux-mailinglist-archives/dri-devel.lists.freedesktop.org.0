Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6194BD9FF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 14:42:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670DB10E3A7;
	Mon, 21 Feb 2022 13:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A4810E386
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 13:42:12 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5CE3A5C022C;
 Mon, 21 Feb 2022 08:42:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 21 Feb 2022 08:42:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=ni7kRpxEQP2Tkhl0vs79fy51SvbOJG
 UP4EOKTq3N1Zg=; b=CeYjSrIu98fbHLdf+wMJlgKTGcyA2hJCQyNO6o2a3ZS8xD
 4kBHb529ykLpFc4b6OD9bkE08N0LTkHiAEbNF+oczTDA6p4vqE3tflxDOXVWxLHW
 /VhNwONZnjnt6OCy+qw1c+55/Ml2L9djOW4LB/9ZFqDVb0PfY6g4AKjU5/KM8CCx
 rLPsi6hTtEO5sbq+ogBBrMExxWiOrodwS/xD8GXjSsCel5qf4YRFcTqchpSZBufz
 P57yJmODZ3hD9k+TT75JertHbYx3ZxE2v6KpdPLlUmGPz4T/1qVcNJ88Qi2nT4+R
 Wg3ySZDHhWoGYaBYxPqSsm7V9TsfU+4srtIQIiNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ni7kRp
 xEQP2Tkhl0vs79fy51SvbOJGUP4EOKTq3N1Zg=; b=Put6drfXFmHUyf7C9mEgts
 coGDfwHk/UYsyOx5nOQJe2aZtjEfP4Y3sKXKKds1E3g6SmRq1BDrQrzSeNosbArK
 sTKrEGa6QTmZNcPJm2ZfeDqtPJqiLhTjDNQkIX+JgPobnUHqs0Zfrxp3whUCLryy
 kqGouJr5Lj2o4FC1a8KCmz4rlt1XiXOuOqAZb89oSlYkJPfoL+AhxY4ZQyjnuOMG
 jdFY9F7KCfHQ7In135wkq/0PnGMjQes/RyZczwUWlwA4vuaCBBcSvr1kucMrN794
 WXaBHskY5oavrEsJuBcXos/cOZ3spW9b1722VV3yEYj02XPef4MShKA/7nyJY14Q
 ==
X-ME-Sender: <xms:spYTYqEqXelF0p0Fb00ocJ0vYvN0asycp3Z8ZOrUOwaGYKZF-yOdCw>
 <xme:spYTYrXoWUN2dhrAFqD0jjY-tMEWp7ZnZ7B8Ne2chOm8zMH3Kxguo1363QUVBdlgQ
 Ej4lkThpUHwWa8fr9Y>
X-ME-Received: <xmr:spYTYkILl-iOTTbkAOwpBRolgFOmZ-_0EUwGOgUotDKANSXoPcquQ1SW6s2RrDzBTv6R0gxhOKL-9Ug3qn8SY-u6NEyZ0XIWa02ZjmI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:s5YTYkGDKJ7o-OozFZVrlLR74SxwP0ClsNJdOygy4R-7FW5jqSusdA>
 <xmx:s5YTYgUNXFexKVFWxJc8XENgPCEnsrrEsaElVm62XDRmu0X-s4qjyw>
 <xmx:s5YTYnOlZr3yM_IqOTOm2GzmDiJRtX-9Z14ntFSYt-HBV8ccSHXlKw>
 <xmx:s5YTYkpIB06fs5Itg1YyvoTLPs8RA-oXUgDkQEwarf93MNasIcstIw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 08:42:10 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 5/8] drm/vc4: hvs: Move the dlist setup to its own function
Date: Mon, 21 Feb 2022 14:41:52 +0100
Message-Id: <20220221134155.125447-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221134155.125447-1-maxime@cerno.tech>
References: <20220221134155.125447-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vc4_hvs_update_dlist function mostly deals with setting up the
vblank events and setting up the dlist entry pointer to our current
active one.

We'll want to do the former separately from the vblank handling in later
patches, so let's move it to a function of its own.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 71aa5081eaa3..2d540fc11357 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -382,10 +382,19 @@ int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	return 0;
 }
 
+static void vc4_hvs_install_dlist(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
+
+	HVS_WRITE(SCALER_DISPLISTX(vc4_state->assigned_channel),
+		  vc4_state->mm.start);
+}
+
 static void vc4_hvs_update_dlist(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
 	unsigned long flags;
@@ -405,9 +414,6 @@ static void vc4_hvs_update_dlist(struct drm_crtc *crtc)
 		spin_unlock_irqrestore(&dev->event_lock, flags);
 	}
 
-	HVS_WRITE(SCALER_DISPLISTX(vc4_state->assigned_channel),
-		  vc4_state->mm.start);
-
 	spin_lock_irqsave(&vc4_crtc->irq_lock, flags);
 	vc4_crtc->current_dlist = vc4_state->mm.start;
 	spin_unlock_irqrestore(&vc4_crtc->irq_lock, flags);
@@ -434,6 +440,7 @@ void vc4_hvs_atomic_enable(struct drm_crtc *crtc,
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	bool oneshot = vc4_crtc->feeds_txp;
 
+	vc4_hvs_install_dlist(crtc);
 	vc4_hvs_update_dlist(crtc);
 	vc4_hvs_init_channel(vc4, crtc, mode, oneshot);
 }
@@ -509,8 +516,10 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 	 * If the CRTC is being disabled, there's no point in updating this
 	 * information.
 	 */
-	if (crtc->state->active && old_state->active)
+	if (crtc->state->active && old_state->active) {
+		vc4_hvs_install_dlist(crtc);
 		vc4_hvs_update_dlist(crtc);
+	}
 
 	if (crtc->state->color_mgmt_changed) {
 		u32 dispbkgndx = HVS_READ(SCALER_DISPBKGNDX(channel));
-- 
2.35.1

