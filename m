Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9372D5E85
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 15:49:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222446EABC;
	Thu, 10 Dec 2020 14:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F566EA32
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 14:23:43 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 92953F90;
 Thu, 10 Dec 2020 09:23:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 10 Dec 2020 09:23:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=m8DHQoR9hPIMv
 rJpl9/U7Zc9JnFFtxKh79kPl6CivZo=; b=Uge+XqYvZwIzv2b/Yrz7EhHW+yEsK
 tMvO+IRkVYjbFK8zcumgoJbtv4VSe78D8LpmW46IHeK/KCOfi09tJ1hLQBEGaMez
 cJEm2W3gbzMvnLygPbX6RCIjbs1QKm96g9/6U2FQHgLFr3z9i+ONaM+PB1ZEiNRE
 MsJPRyK4dMCwTrLAyyZ7sXYWEZ/CM6kKr44EefjWaD8UhnoN5EYnUfJlUU21kEpV
 Ra1qWvEtE/q4gDmO54gGdOhYZLwlJRHuJmkYUszGQegYb2UqM+xqd05mOIZE5N8u
 c+KvpEJq01rMiqJfM+pI/tL8q83kLHc/8d63xsEymCqyqUAaSiPn8770A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=m8DHQoR9hPIMvrJpl9/U7Zc9JnFFtxKh79kPl6CivZo=; b=CHsGjPfo
 OvhgHyhYEYb+tB4hYxjQvv2rctIPlP9snifd47YtPhw0e7DXg4WI5cO3O82vdeXt
 VdjH7YG5P2o5lPvHtY5UT9sXfG3C00cs7flogtB0/9abt8SHqFXiGanS1rlHRa5b
 H8+ed1DWop5RJRNA0mQjbYPEOWRI/oivCtwbSyniq0egw0J4oE9eVKBOxBKUQ5Cg
 jNB7KC7N98LRMaroa7j5zFok0elhuji2PQEJiDD7fTEoGbQ1CnuUQvupV4Bq5Yfi
 sQ6Hne7tJ3ws2o9Wnk64Y7FsQcIGSwyAjoP627rw89uV/MGWTD9B1xgsRvF7thqR
 kWbX/mpstxNqAg==
X-ME-Sender: <xms:bS_SX8bcrgCjP63_QXZ1o-4K7hFfj5YDfwkAQ6_srSfeM6cDtLCu3w>
 <xme:bS_SX3VlywdSBSrHb4EDma2JzcpFnlbXu0CcFm05RP26UAq1Cr7yO3t_yqFBw19Wb
 5wTUmFnrxrvYd-pmkU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:bS_SXz1Gwq2pahNJz-KAgGh8ZSStGMC5rXPZYgq3rqiBJzSne0rKRQ>
 <xmx:bS_SX-aiue5Nvl3oaL5_6m_FQ4jn_KIumnObb0LFc1F_LPLeh7LqYg>
 <xmx:bS_SX2oJbBwlEGTtWCA_zSRvCWcn_6YQhm7wCwoRbO6EQtYeI8a4qw>
 <xmx:bi_SX2x0ryi6KN0BVps8bvKVXhelh2pqM_2sUkL_UU1P7HFcr0BnndIqKKQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4E674240057;
 Thu, 10 Dec 2020 09:23:41 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v6 8/9] drm/vc4: hdmi: Limit the BCM2711 to the max without
 scrambling
Date: Thu, 10 Dec 2020 15:23:28 +0100
Message-Id: <20201210142329.10640-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201210142329.10640-1-maxime@cerno.tech>
References: <20201210142329.10640-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 10 Dec 2020 14:48:10 +0000
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
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unlike the previous generations, the HSM clock limitation is way above
what we can reach without scrambling, so let's move the maximum
frequency we support to the maximum clock frequency without scrambling.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 553176f9e28d..996c727278fb 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -82,6 +82,8 @@
 #define CEC_CLOCK_FREQ 40000
 #define VC4_HSM_MID_CLOCK 149985000
 
+#define HDMI_14_MAX_TMDS_CLK   (340 * 1000 * 1000)
+
 static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
@@ -1915,7 +1917,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.debugfs_name		= "hdmi0_regs",
 	.card_name		= "vc4-hdmi-0",
-	.max_pixel_clock	= 297000000,
+	.max_pixel_clock	= HDMI_14_MAX_TMDS_CLK,
 	.registers		= vc5_hdmi_hdmi0_fields,
 	.num_registers		= ARRAY_SIZE(vc5_hdmi_hdmi0_fields),
 	.phy_lane_mapping	= {
@@ -1941,7 +1943,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI1,
 	.debugfs_name		= "hdmi1_regs",
 	.card_name		= "vc4-hdmi-1",
-	.max_pixel_clock	= 297000000,
+	.max_pixel_clock	= HDMI_14_MAX_TMDS_CLK,
 	.registers		= vc5_hdmi_hdmi1_fields,
 	.num_registers		= ARRAY_SIZE(vc5_hdmi_hdmi1_fields),
 	.phy_lane_mapping	= {
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
