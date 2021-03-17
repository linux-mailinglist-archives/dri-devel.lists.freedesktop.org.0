Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F35DE33F41A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 16:44:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80AAA6E80B;
	Wed, 17 Mar 2021 15:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D88E6E7E5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 15:44:07 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id C7A50580A4F;
 Wed, 17 Mar 2021 11:44:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 17 Mar 2021 11:44:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=T3RwAo5kdonWd
 D8AjeiCQdgXUjfyCE7iPeri2uryCiY=; b=chutKb2qoGeNYtULUuNQanyGXvB1Q
 FoTkoSM0+s8vY4EZ6PFv5mRsA92/fH2FdDhLU9M+Kdb6O+uz8+HYv6uXMO2Mygdp
 6HEjmDb5/v//LJvKDiDx4zYBA4QbJAhgflLZXP2GxCFQ2mDoOz9wOvlslL/lVoxV
 UmlNFBe2WGg+0veo26DUC019FfIsYdDCC2U3uj3p3K3sqXkWAm8i9wSoEH910e2S
 +xJP77GRuAQYm6RwDQ4MuWTkwENVgDfAg4xIaqI/QjmT2RW4BoXmIWXurPzHFubi
 NvzdU94hzlSddeOYbm1aM6elBITKzDWXs/9tMT2ijUc3BN4ZATHhVl5yQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=T3RwAo5kdonWdD8AjeiCQdgXUjfyCE7iPeri2uryCiY=; b=mN5P6CNW
 Qm3agJUeovgL9Telut7K3F16oBJhTmU3N3Xr2mT6D3zFCoyGMjem6k0HcACVbVg1
 93ieVsAaDy6l/7Ner8xzm8kXqtKvEmMCok7Iq8gMeE7YtKu7p7jMDjQHwc2y+/M0
 9TsMwStKgY9eH5+j91IAg1mURD1t7ZlTO1ZbBLsmf6ok5yneB3A/2q3M0id2zW3L
 knp7cDe5cGUgPKuBnbIePp1hPfQDE0kY+upFmhcn6LEwmKApdbavvBsMXB3wlvx6
 o+Pbyy/yv3eCriZOtD30MjR2yMGxqJVC2oaboDtIWPgE81L1gPBIoI5oiSGedp16
 qXM7h6hAfXPOrw==
X-ME-Sender: <xms:xiNSYNZlILSrWw4rrAATsOjE7mDcCecgtD41eIz-sFU0KEhLGKoLfw>
 <xme:xiNSYGqkX0GAm1ySBqAQVypjVRzcHAukRy7tPsat-sRqrDXHQyuzaxXPemQzXAdSx
 Ydkd6VOqHokhxnqZxo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:xiNSYCMZbCzfhtsRI9W_gwaAz1ldlIVcsY6Uq4Cxtv36ancYrJB4Ag>
 <xmx:xiNSYBqUjx3w_5GwR9yNK_soWU3jQVr5Ap2jvlJaACQq3KUbyGqVZQ>
 <xmx:xiNSYHc_3vC36m7WEZ899-ukWGPW2qxl3j3Xt5c3A6a_KO8l9cpFdw>
 <xmx:xiNSYAjXcJVtqxXwolXfgFejBE1Gt4xcd0CUGUTouujTv9qsI9qk0g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7262024005A;
 Wed, 17 Mar 2021 11:44:06 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 07/18] drm/vc4: hdmi: Add full range RGB helper
Date: Wed, 17 Mar 2021 16:43:41 +0100
Message-Id: <20210317154352.732095-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317154352.732095-1-maxime@cerno.tech>
References: <20210317154352.732095-1-maxime@cerno.tech>
MIME-Version: 1.0
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We're going to need to tell whether we want to run with a full or
limited range RGB output in multiple places in the code, so let's create
a helper that will return whether we need with full range or not.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index eee9751009c2..fc545072b173 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -95,6 +95,15 @@
 
 #define HDMI_14_MAX_TMDS_CLK   (340 * 1000 * 1000)
 
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
@@ -833,8 +842,7 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 
-	if (vc4_encoder->hdmi_monitor &&
-	    drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_LIMITED) {
+	if (vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode) {
 		if (vc4_hdmi->variant->csc_setup)
 			vc4_hdmi->variant->csc_setup(vc4_hdmi, true);
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
