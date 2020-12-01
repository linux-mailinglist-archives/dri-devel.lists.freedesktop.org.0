Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 494BA2CB6A8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:20:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8AA6EA0E;
	Wed,  2 Dec 2020 08:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D046E53E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 13:13:00 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id CF07D5804E6;
 Tue,  1 Dec 2020 08:12:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 01 Dec 2020 08:12:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=rvf9RMe9+Ycot
 LmaTWocWH+h8csehOYpOFvtfcwUEtQ=; b=tKBOB6KSrpwbL3vilUGi2UYmvVJiy
 e3HnkvYCebHvhJonSKhOpF9Vxi1z1bN/62TJ8ZTE38cFkkY31n3LWV694MvuUDWD
 wphs8ZGw1envdY5UGOOYkYOob3gfJUtAl4adPvi0fym7oVJ5o9jHkLj3hBvNllJq
 f++EPzIajxtWjVYPBbIUKsjg5kiYeaQShiiP9xlp952c/MwN6912h86Z97F5BzEO
 xx3e7pTVEFtX0D5p8er0Uce8uhejXp2lWnTCm8JUwm+70kuvlzYUvAHSz9xJSYYw
 v/PLEYR/JMfB7p0a4/okZf/viJ0pdWBCbrdTJWltI1+9JUf2pgqjZtuAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=rvf9RMe9+YcotLmaTWocWH+h8csehOYpOFvtfcwUEtQ=; b=Sjr6kKDo
 W6UeoziB3ijOjDEabBOYMevPsRVSfiahuKgWotDKtYfsnVz1ZNTz96k0peofrpGj
 OVILPO2Tn7zLxNTw40xVdUaNlR3vK0dYAmQHc6/GrivqZqhvuw5zsDe7Qshbdju4
 sA8++uuwgtMpnpybTcpba32XEq6OTfSd0OwltxhCscunaebfjxoEIql+iZfYUAqq
 FV9dZ667DttCEhhRpRXnKfmATux3vsddjn+/K1POQDDhnhh7Ui1hWetzzyMTVRu3
 irnkfRMNdZOn9USgmj20xwZRj8W9h+iJk9eZDv0wcEIhXD06gEr5QppJZGGNziTc
 vLaQaWkAOWHsjg==
X-ME-Sender: <xms:W0HGX7MIRZhOUwl4u3l-yKrDXYU8YRhbo9RwoyDMNTNsD9PHfjEKfw>
 <xme:W0HGX1-iL2Jq-r0409QGQmjw8EFjk7M33XmbQIUUBmY7FDllUnC9Mlxdoboh_zQOB
 7gLEtirQuaZCo6WUPo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeivddgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:W0HGX6TUHaMr53gn6s5FLsi0WhTd47h14yC8JTLVTNJDKsRaDCqFhw>
 <xmx:W0HGX_tN0sQ7GtYHTgWyD2fjbRC1-_KwdsZ4GTTwFmcHZ-9NZLIiSQ>
 <xmx:W0HGXzd6Qonox3c9lmMvcg3NsUsZx4rQNsdB_9xgERvnVW1bwsovdw>
 <xmx:W0HGXywuO7iglsWisDwVX4vRVSmm06XHD8TZxTzt6CpmOKuNY7luow>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4E1E01080064;
 Tue,  1 Dec 2020 08:12:59 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 6/7] drm/vc4: hdmi: Limit the BCM2711 to the max without
 scrambling
Date: Tue,  1 Dec 2020 14:12:48 +0100
Message-Id: <20201201131249.438273-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201201131249.438273-1-maxime@cerno.tech>
References: <20201201131249.438273-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 02 Dec 2020 08:19:47 +0000
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
Cc: linux-rpi-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
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
index 64eff72d60b2..b5a97931af30 100644
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
@@ -1906,7 +1908,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.debugfs_name		= "hdmi0_regs",
 	.card_name		= "vc4-hdmi-0",
-	.max_pixel_clock	= 297000000,
+	.max_pixel_clock	= HDMI_14_MAX_TMDS_CLK,
 	.registers		= vc5_hdmi_hdmi0_fields,
 	.num_registers		= ARRAY_SIZE(vc5_hdmi_hdmi0_fields),
 	.phy_lane_mapping	= {
@@ -1932,7 +1934,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
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
