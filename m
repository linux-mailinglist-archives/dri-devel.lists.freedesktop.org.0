Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4897D4675AC
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 11:54:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C359073378;
	Fri,  3 Dec 2021 10:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85DC73376
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 10:54:28 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0F4925801B4;
 Fri,  3 Dec 2021 05:54:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 03 Dec 2021 05:54:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=DG+yeIQKjB6EE
 98K86r/BHe6N6NOBTc1vzSbn/iTDvw=; b=Hvk3oD92QMwfneuXQ6aTxjF0E0ixX
 Z/ZuEUVqtrUY+rI306wrjGM9egDBPbEdghwG1w4TMX85AIR0L+5Wa40wuBuQoiRC
 i0D52B7XNKNd9bAYdHCLz1alNwSeikR4shJWuNypc6V492oNMfpaOq2hTvkGJWYj
 2hNTXPnmI8xUW1vFYOuXP+YwOH/Ob+w5C9L14BsYMitSyYYwSsM6UECDbEw9H3rK
 uUv0yZ+2cTliv83c1l7ybZx/upobsLv4aM8A3twgDR0K1ihrzPfixOCWqfe5f01C
 /Liu3spySalDjKBmE1YE8UWQn5o4jP3oLFwmnNNg0tUvzELDgbIA7zvWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=DG+yeIQKjB6EE98K86r/BHe6N6NOBTc1vzSbn/iTDvw=; b=Wfm4lbmc
 gt53YVQaXgi8Ty9hmMq4XONDPrTsXTIgurih6DNIaKQWkT3j2jpSZ7aND44C1BKq
 RU2xg1gsiF+EttmHSv34IvwlA1G+EyAKQxBRIxoXf78m9lEcRLERQkCU9DQJiiRA
 CQXMcURjrSnGsRDb407UmY1ZRi0y7TLFBALViM/BxWpZAQ11/0KTpgAWrtHQogz2
 80qY/YqQztciPrxlZHtNEZYtnxXTXPwrksP1NKUX/altjJTpmRWNQUtTbKzzIT+3
 iyWmi5DFRKh1IArWdbh24H4fKau2PtqtNvO7mcMfPvCVHabz+sBHCc0oF2on/psO
 dGIenoVDM1/lag==
X-ME-Sender: <xms:Y_epYfDyXBMmthNoxwQiEMIUsdoHMlAGS7obtgs5trarSzdAXSJFCw>
 <xme:Y_epYVgsDR5JH3lw_3dSfRrFoNqGCaKnJMTn78XRaSpLo95nlkCZRBogSWLRUOYtg
 SRl5_Rdnr0ZmEJjELQ>
X-ME-Received: <xmr:Y_epYalJ88kCimOiGGc7BROGiFVfM_OKj5UxNsOgKAJG2nunNnnolm4CzuJHVDcLsCG8woFgKXTX294ZOUykCRh3qmIJFdSLojJAqEsTQmlOLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieejgddvfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Y_epYRyfc0v364KNu1QF6TOjFe0P3xnYYAAXvE3m1jMhDV9_Afb2-w>
 <xmx:Y_epYUSrQTPlGqbXzMNCxSsyfcnxJCLiC5WDLFgmSFnxwDCX8J4vpg>
 <xmx:Y_epYUagay4aPoVLGek0n9V7ZKXeQzxyltnyA5-fH3jHgFZxQ1ToiA>
 <xmx:ZPepYd--XsUIgQZWpvYSUdi4yfCBw_kx-BbvUPxBFYE3Q9h240Fo4w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Dec 2021 05:54:27 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 02/11] drm/vc4: hdmi: Add full range RGB helper
Date: Fri,  3 Dec 2021 11:54:11 +0100
Message-Id: <20211203105420.573494-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211203105420.573494-1-maxime@cerno.tech>
References: <20211203105420.573494-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We're going to need to tell whether we want to run with a full or
limited range RGB output in multiple places in the code, so let's create
a helper that will return whether we need with full range or not.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index be39e55ae113..7966e3b00332 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -104,6 +104,15 @@ static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode)
 	return (mode->clock * 1000) > HDMI_14_MAX_TMDS_CLK;
 }
 
+static bool vc4_hdmi_is_full_range_rgb(struct vc4_hdmi *vc4_hdmi,
+				       const struct drm_display_mode *mode)
+{
+	struct vc4_hdmi_encoder *vc4_encoder = &vc4_hdmi->encoder;
+
+	return !vc4_encoder->hdmi_monitor ||
+		drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_FULL;
+}
+
 static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
@@ -1119,8 +1128,7 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 
 	mutex_lock(&vc4_hdmi->mutex);
 
-	if (vc4_encoder->hdmi_monitor &&
-	    drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_LIMITED) {
+	if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode)) {
 		if (vc4_hdmi->variant->csc_setup)
 			vc4_hdmi->variant->csc_setup(vc4_hdmi, true);
 
-- 
2.33.1

