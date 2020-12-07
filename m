Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C4E2D261B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:33:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6CE6E98C;
	Tue,  8 Dec 2020 08:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B59589C53
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 13:40:01 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 76E74580367;
 Mon,  7 Dec 2020 08:40:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 07 Dec 2020 08:40:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=uQiRsaID/v049
 E4sAiQbiAS3n/CjeYpDkO8TOYFgcKY=; b=Kw9xeYZu8UNPS5BeYKV7ugaCK4mUA
 HUdPUXfj/wFjIHVlgpb+DaiK+ab+SR8McTZed7JC/19AByLM10Lyg0qwngS+K/2m
 JQ+cnIrfgZGmIhxeyLhwqmDXWRz7CTntWeduf1hlMrRnEOobeQAV1WUOcVK0fqx4
 fUE65zKCif7Sl92xfjozXDE12b9Qq+8O+79mp8z9kSoI91w8w2jFFZG/4XWnbZsO
 HIcOwb8wfE/60MF4TXz4Ug4b1eeHxvR2vzvTOOZha38DuKfaL7m9svJ66JXNivZF
 hgIJW9CDbndclke2AgNhw3JRFJ0s5TFkeT3n7sM1IUG90aXt8f0DioMfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=uQiRsaID/v049E4sAiQbiAS3n/CjeYpDkO8TOYFgcKY=; b=fAJZ8MfK
 1cPPGqx6CxAmuoL4h8gA1GeAE+MqnS6hY4jqJYM72XuC8ViWkNbV12n0oAnW+Ex2
 GtCuLuDeXtc2uUuwCN8M8J8Pv+ZWqTQoLNhX0LkoQjYs42QMbAOxqm7m3MQt13Nd
 yxAHmmRpvAJLtcTZP/cXbY+ybcNPHrjpXkERCeYbzZ7puioW0WZ53K0fGsv4m8r1
 8RJ8w99JEVmKfNaDroLuXmzOZopx+6i4xBb/f19UvI5Sz+WdENbUZQaMduWjFbEp
 XAuUiL/p/05xK4i8XnUSZZQgZWX9/X1GWSpZwwhrLxMIq9B1KK2urlNSHdzuMJof
 j5uGzP2zJbwXoA==
X-ME-Sender: <xms:sDDOX7zUFYg69BRXGxJUEUkY6anKgeGLxrJOlSWzOgOjFRTmwVDMqA>
 <xme:sDDOXzSYsvt7BPEaMULhzCsZhwRBY2H6j9zwA4rq6LKbOrQ0b84I-Ke0jEvPwnQY9
 d2g2BbhG3GKQBLShNI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejgedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:sDDOX1XeGf-Uqv-KzxXyusQie-LOT0ukBeDKFkDb1-ks5SP2KC5qmA>
 <xmx:sDDOX1h0A82P3yVtTMp8qxcFSnpIdrnJiBS5jQ9eO0DUtphPy93Uow>
 <xmx:sDDOX9BdYzJvJl4p5CzNahex14lWXs3IQ6a4CmkS1yFwgdGzre2jKw>
 <xmx:sDDOXx0Ggc-aLdEaMOvPnDqrQV1UKLhzuBNvIs-zlIdSvoQDLSdGqQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 237DD1080057;
 Mon,  7 Dec 2020 08:40:00 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 7/8] drm/vc4: hdmi: Limit the BCM2711 to the max without
 scrambling
Date: Mon,  7 Dec 2020 14:39:47 +0100
Message-Id: <20201207133948.2109194-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201207133948.2109194-1-maxime@cerno.tech>
References: <20201207133948.2109194-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unlike the previous generations, the HSM clock limitation is way above
what we can reach without scrambling, so let's move the maximum
frequency we support to the maximum clock frequency without scrambling.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 795fd23c8f58..e759ebd5fa34 100644
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
@@ -1908,7 +1910,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.debugfs_name		= "hdmi0_regs",
 	.card_name		= "vc4-hdmi-0",
-	.max_pixel_clock	= 297000000,
+	.max_pixel_clock	= HDMI_14_MAX_TMDS_CLK,
 	.registers		= vc5_hdmi_hdmi0_fields,
 	.num_registers		= ARRAY_SIZE(vc5_hdmi_hdmi0_fields),
 	.phy_lane_mapping	= {
@@ -1934,7 +1936,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
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
