Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D61216A282
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:39:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832A66E2F0;
	Mon, 24 Feb 2020 09:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858FD6E1F1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:10:37 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 898B460C;
 Mon, 24 Feb 2020 04:10:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:10:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=pOCJc/HnVC85j
 3Vx5lFWCuSpF1HH1ynuNc1kT5PDq8s=; b=Gt/Gy4BpGti69mGkbTAfXSfVVKPrw
 A2QYxtr4b1B0QDpNgQ+K1Ahbhpk1PZUDUfBCbF2ZNpufOiMsmmdTzXETBCaZP4Qe
 WRnKNXxcBHyDblYC6icms5YP1Ub+88wlncQHcOfSEPzMe+R8Kq/TkI51fNvuObn/
 hZAFEV8AQYdDpzwr5Y9/s8wGy56a9k1FdjwUhcpieYSv3AiYgl3G3HFk04oimcss
 A/IoXsm0PV2J0GFc5BcNHiiG6RCV3Zo+6p5q/WV5QRkbSCZu2jhvvBIs4CxVcA2v
 k1OteH4Uuyo6XHdgj3cW69nrGlrJjcscKCNYMiczNU6DO4x103KRqfA3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=pOCJc/HnVC85j3Vx5lFWCuSpF1HH1ynuNc1kT5PDq8s=; b=T0coblBB
 gXwVph/dNGdu7LAlrJZvXLeweaYgajfNcVFZbcyJ4XV/u11LvqCb+xPJwTYbuBFa
 +UmG+4lRTbkrQLX7oSBErfbEH+8gjbZgQ+HGJKFVWuhFrJW9l5ZZwSKEYs9o+NF7
 a36mSVL0tb0k8DSMaRVnXDEG3SmrRJ3cwgBUBNc9nvja5hLupU06Vg5BFXCDOPbu
 doLwEvjyJmjA2FuaMph7S5skHAIyCTNb6hYfxRwpWQ+9e6rMvqIo2wQPksztft0O
 Zvgj9Nbwx48W8kBgJZkfCKHmjOImJTtwvvEwGFyfO1sXlX9HFCw5XwVvJNiS75Sr
 1yd8awgmmW1eQw==
X-ME-Sender: <xms:DJNTXirpqUNalVzZFgxHdUyVQEMfm5T-VewQIDDs1ZZoJdJtReSuiQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgepuddunecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DJNTXk74sHZJBPnTSVZZ8n4Laa4r8tC4E7mAWBkPDK0u2MHE-GklJw>
 <xmx:DJNTXiO6AtZIvSw6YujNMPvpBl6m9DDqp_xcBiVp8fyUXYNU6qyECA>
 <xmx:DJNTXmO8p5Nkl9GI7jpMLt-yyiIWb_tbHvQygY42mVZOlZkZEk5noQ>
 <xmx:DJNTXr3MYhooTT14BBiG2rPwxTBg04OTZQlY_Ho8ltJhX9ePz6dlMHn46XI>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C8FB8328005A;
 Mon, 24 Feb 2020 04:10:35 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 74/89] drm/vc4: hdmi: Add reset callback
Date: Mon, 24 Feb 2020 10:07:16 +0100
Message-Id: <6d50802a495fffc2ff4144ea3252d8952d9dd1b4.1582533919.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:39:03 +0000
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The BCM2711 and BCM283x HDMI controllers use a slightly different reset
sequence, so let's add a callback to reset the controller.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 17 ++++++++++++-----
 drivers/gpu/drm/vc4/vc4_hdmi.h |  3 +++
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 0e8cf0eb1891..29e94eee9f23 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -68,6 +68,15 @@ static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 	return 0;
 }
 
+static void vc4_hdmi_reset(struct vc4_hdmi *vc4_hdmi)
+{
+	HDMI_WRITE(HDMI_SW_RESET_CONTROL,
+		   VC4_HDMI_SW_RESET_HDMI |
+		   VC4_HDMI_SW_RESET_FORMAT_DETECT);
+
+	HDMI_WRITE(HDMI_SW_RESET_CONTROL, 0);
+}
+
 static enum drm_connector_status
 vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 {
@@ -371,11 +380,8 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 		return;
 	}
 
-	HDMI_WRITE(HDMI_SW_RESET_CONTROL,
-		   VC4_HDMI_SW_RESET_HDMI |
-		   VC4_HDMI_SW_RESET_FORMAT_DETECT);
-
-	HDMI_WRITE(HDMI_SW_RESET_CONTROL, 0);
+	if (vc4_hdmi->variant->reset)
+		vc4_hdmi->variant->reset(vc4_hdmi);
 
 	/* PHY should be in reset, like
 	 * vc4_hdmi_encoder_disable() does.
@@ -1406,6 +1412,7 @@ struct vc4_hdmi_variant bcm2835_variant = {
 	.num_registers		= ARRAY_SIZE(vc4_hdmi_fields),
 
 	.init_resources		= vc4_hdmi_init_resources,
+	.reset			= vc4_hdmi_reset,
 };
 
 static const struct of_device_id vc4_hdmi_dt_match[] = {
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index f4c052a78802..270397c9e800 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -34,6 +34,9 @@ struct vc4_hdmi_variant {
 	 * clocks, etc) for that variant.
 	 */
 	int (*init_resources)(struct vc4_hdmi *vc4_hdmi);
+
+	/* Callback to reset the HDMI block */
+	void (*reset)(struct vc4_hdmi *vc4_hdmi);
 };
 
 /* HDMI audio information */
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
