Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FD12D262F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85EB6E9C3;
	Tue,  8 Dec 2020 08:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9426E89B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 15:57:32 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2B2E458033C;
 Mon,  7 Dec 2020 10:57:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 07 Dec 2020 10:57:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=gxFB8Np/QEjWa
 iAzlctmlNgSlF//rUEtNyq/aYiSj6k=; b=UHniHBi7CFszU426Tv0Vbnf+hBf4c
 hvo9yJXI05iJd5olRKTmU9m9FZxUSWlTESsasIvoLnc99R8iE9e0ZIpGW+dOEU2u
 SNpP4n8eZz3NIUPFxxDMXgwdrOkfYboOujbemyCg43qX+JaQfqLWKkSEACw0MXLM
 CW49xOiRtMQzCdActBL7Cuz0n3mFkTnaJNcUg5CsWZnyLKrLMgWLY80XrMONOrE1
 6rCSP1irLCFQPlubvyK+lPVANS57jfPBzZ02/aynRMmbjPCwNU8/jjwLHtdI9X0L
 RyfYaWaxD3qq2OqKgaGZwKDQ7W98M2q1DB4A49idWOL4aq5P69nST4EmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=gxFB8Np/QEjWaiAzlctmlNgSlF//rUEtNyq/aYiSj6k=; b=VHLFXlfs
 7McX5QmSauROxDqcslDuVg92qap91AM2psPpWMWGhaSUHyvH1j9fD2M+uxYjKOTA
 OLExVCU/w5lNKJ8De9E94gfu99np9Iu/ZL8SYykxFTlJatjuhfvoG51Poi4MZajm
 fZOyHGzQXeF/mH5WZIXFZ7NBnFmZcyaflYPMbLKdcHMYDUIGEc1xx7G0xhJbYhAQ
 ELYmIMmoxvGIdPgi9YTpL7vyjmtSJS9M2q0ARUrrvA/RgSylrM40LfMpaUD4QhO7
 7LSzMc0OL+QhXhVn8vVgpA5wUqXpNirPg7yrp6J0tx9F4j0OFjUlb8LQ9LredfqI
 TdCPYAUXMVvNUw==
X-ME-Sender: <xms:7FDOX-_ZZ7y7J8KvWBKghb-Bo2MoKiRpq1EMkuIeOQLKYVwewZ6wcA>
 <xme:7FDOX1tFhxMYS7B-3yp313XvVLa7RgAQmxL91ba0tnFT_N2c4Oblt0XPICtrWD9Zz
 aNYyDpu2kr4chhUea8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejgedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:7FDOX5BXtiDw16qrH2qtVFyuLdeONqSZ9ocG8iumPPgkdROERuStaA>
 <xmx:7FDOX1W2LjI9GBfg8dFhBSk1-h_7-VRcJHl2zC36xsCnufp1L_lwLA>
 <xmx:7FDOX_A1Uc-RIzuZr_YVw8RK2Yu6RyjKripN7n_6GeMYrHufAQnzyw>
 <xmx:7FDOX--X0SaY-cis0M9gfrhcsEgr1Oo8eVPbkxMkCaZ_6RiCju5ljw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D09221080067;
 Mon,  7 Dec 2020 10:57:31 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 8/9] drm/vc4: hdmi: Limit the BCM2711 to the max without
 scrambling
Date: Mon,  7 Dec 2020 16:57:18 +0100
Message-Id: <20201207155719.17149-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201207155719.17149-1-maxime@cerno.tech>
References: <20201207155719.17149-1-maxime@cerno.tech>
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
index 5310e06efc82..f4ff6b5db484 100644
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
@@ -1911,7 +1913,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.debugfs_name		= "hdmi0_regs",
 	.card_name		= "vc4-hdmi-0",
-	.max_pixel_clock	= 297000000,
+	.max_pixel_clock	= HDMI_14_MAX_TMDS_CLK,
 	.registers		= vc5_hdmi_hdmi0_fields,
 	.num_registers		= ARRAY_SIZE(vc5_hdmi_hdmi0_fields),
 	.phy_lane_mapping	= {
@@ -1937,7 +1939,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
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
