Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5C82DBD19
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 09:56:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 516EA89DC1;
	Wed, 16 Dec 2020 08:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524CE6E417
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 15:42:58 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 5E44A435;
 Tue, 15 Dec 2020 10:42:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 15 Dec 2020 10:42:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=3PjO/YkY9aoZz
 090NVZ3qpLTBnO2JDOeVeBPL8Kzcbo=; b=sYroFm1bVB+dgIGiBqev8FGqquLEo
 vnkUNnmPEjsjRb/2x/bvFNiTIkszoF05sAqWaTf6mfRnRchF73AiNsHq16Uv55qw
 NL0CzMK/a20oR1gHRbI3qVVSOj7FT0LQ148vMX3nHADjbZvIO+3+OwSqgNBY6o1R
 BQ5aBKd6IN2PvEJs0xPZ83wsLDmhpp6d2QgVinPoCpqHRb11W/GiyaGae31CNQdc
 Z1hh5z4jCE6sh8pdny/4zxw6SKKz3V6QceySQEnrkkBX/3KkDdwYrpViTpI5HNOS
 2Pa/cN2WD9obYPdYwLyP0RZIe8ZNqKQioyTkzOixB374YdGKIL7Fj5MNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=3PjO/YkY9aoZz090NVZ3qpLTBnO2JDOeVeBPL8Kzcbo=; b=Oufu3uzR
 bfagA1gkqce+NO8Bl+XOx9mP8g99RBl7W4Ym1nk+NuLNwBreHis6dhysXeJD0JvV
 l7XsxCWF7iwSx0zN78G0+KGlFplPz/MkpZXLwk6xsTDTMzJWChEtHYENwOxsxfo9
 aMunEpg8kTIyzUVcSZ/Cf5fMSHJ2GLEo5MQXFhXvptgqt0HTMhHoHthXQcm35Y+m
 Oc5TBZ8IT9/QkL6LR5uSQ2WGQzcHHP3QFzT3sV+xjvEd3fwQrRZbwER+4Iadp9rF
 84D08YfsBwaTYEXrDM4uVbleQgEiDp1fLyU6MY42zxo3BjYCGhHTmNndbGYKm1Le
 C5HqTCMbzLP1VQ==
X-ME-Sender: <xms:gNnYX26FNF8tKniGO2Yn612Rf4qQn9uGoO0CLSlvrYjmhGfeOm4ttw>
 <xme:gNnYX0Td9ua-_5psnc2BAtM0YPRPvNrMnoUGtlXmzuN5k4yDP-UNvTxVSyDf482wi
 OAcM8en4LrZJOkutuY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeltddgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:gNnYXzWLRUefw04hQ2YhTQF9ncw8QaDxSZ9XRtY9G7ndXVQOS7a2-g>
 <xmx:gNnYXxF6FGUlExjZkaxHW3acfxIm--G-jdbBPA9AiYRnedcDxCKi3g>
 <xmx:gNnYX-cQDuDOHm7GZj9WqCVvYUI2aT-ZNmNdzWtcrU-pOCxi7j3X9g>
 <xmx:gdnYX2EGVXjs3GnPPxnWW0wdyBWpHc-CYtxEWi1KqYEfZyw75le3JtKK8to>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B4648240062;
 Tue, 15 Dec 2020 10:42:56 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v7 8/9] drm/vc4: hdmi: Limit the BCM2711 to the max without
 scrambling
Date: Tue, 15 Dec 2020 16:42:42 +0100
Message-Id: <20201215154243.540115-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215154243.540115-1-maxime@cerno.tech>
References: <20201215154243.540115-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 16 Dec 2020 08:55:47 +0000
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
index dbe516d89726..41897b8e9d51 100644
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
@@ -1918,7 +1920,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.debugfs_name		= "hdmi0_regs",
 	.card_name		= "vc4-hdmi-0",
-	.max_pixel_clock	= 297000000,
+	.max_pixel_clock	= HDMI_14_MAX_TMDS_CLK,
 	.registers		= vc5_hdmi_hdmi0_fields,
 	.num_registers		= ARRAY_SIZE(vc5_hdmi_hdmi0_fields),
 	.phy_lane_mapping	= {
@@ -1944,7 +1946,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI1,
 	.debugfs_name		= "hdmi1_regs",
 	.card_name		= "vc4-hdmi-1",
-	.max_pixel_clock	= 297000000,
+	.max_pixel_clock	= HDMI_14_MAX_TMDS_CLK,
 	.registers		= vc5_hdmi_hdmi1_fields,
 	.num_registers		= ARRAY_SIZE(vc5_hdmi_hdmi1_fields),
 	.phy_lane_mapping	= {
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
