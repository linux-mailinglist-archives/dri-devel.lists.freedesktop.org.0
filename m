Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7101E59BC
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11426E4DD;
	Thu, 28 May 2020 07:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9258C6E33F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:51:16 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 068495801B2;
 Wed, 27 May 2020 11:51:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:51:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=YlfaQQFIbVFPL
 gp+Wylmd4RFKyipmTjj6tpheBg9HcQ=; b=Y2AhUEKotTsLtyQ22Mz2LaVaiHYxe
 wlQ22K+izgsKJEmZFXM9x97mRbgrWDlay2aN2LXEg2Bh6/ZkJ4T9zR9jS3TSTXy4
 aLNRyAVPSvSV34xY9vjZR2Lj3yXxLvpzGMAoUcN/zHl8qV3T95MVWcX+Dyn453Jd
 I0XrdjgFd50wyb7uIU0rY0g0e2yvoRn+bNp0G4g0ldIon1bwenqkb31ysNANDi3S
 rd/MvAN5/P3EOGq9nmS9wbZV2sSvpftpSEhEytDGnaFovg/QYfIFTypmfh+bN0lr
 Ly7Z9LE7nUxYWfzh4f/hny5dqy6gZVb1Tie2gq+0Ohh1zeOz27575LoMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=YlfaQQFIbVFPLgp+Wylmd4RFKyipmTjj6tpheBg9HcQ=; b=aeU9anFO
 LnU+L0CzXYckkuqVhhewVzCNzBEqkUnhS7wztOLs6AnVWWyorLIG2NmdNlJGx8lB
 D5R+900772aqVDZmJFWiU3ye6yYZIRHWjG04jgyYiGKidRtlMlacRYbkAkyfBqq5
 Y3x1zxJTfw7A2GnuM4wBUqbr2aj7lkRnvk2pE7F+5hLxZjNAMz+jtIP3yu0J5KBF
 Yg8z+z272uIUnjrQeScvwRu2x4dYsSKeRwzZLN2HBK/8scOTf4hV6czQMqxLvTAH
 R4T5yjrJQu/Vl9Qmd7vdIA74fP4E4htSISr3vtMJ9Ozilct80Ix79iF8AhoevSoc
 YA500xzDWi4Rog==
X-ME-Sender: <xms:c4zOXs0eTTF4ZtLFphUaukouSgOloe9cpR5ixEmpmVVt1ilhzXSmXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepheefne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:c4zOXnFndLrwxBDHLUA2gwVcg5Zmqy4gnY-aicW44qx0S6dh-jv7mA>
 <xmx:c4zOXk7pC0qHNt-F0KFXunCoyD3JQyMUcQdB9zwCyuj6N41qegt6ww>
 <xmx:c4zOXl3WeTczrfZAojtmiTXecKKY88FF-LTPks9tK7e67T9WYYL0hw>
 <xmx:dIzOXu2v-nHXiL0R3o13AGGqty-VkChlpWRCLLhWYPTUOZJ77vCTMA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A359F30614FA;
 Wed, 27 May 2020 11:51:15 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 075/105] drm/vc4: hdmi: Add container_of macros for
 encoders and connectors
Date: Wed, 27 May 2020 17:48:45 +0200
Message-Id: <343f2ebfaf29858cee93de344e1abcd0f4c3555d.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:53 +0000
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

Whenever the code needs to access the vc4_hdmi structure from a DRM
connector or encoder, it first accesses the drm_device associated to the
connector, then retrieve the drm_dev private data which gives it a
pointer to our vc4_dev, and will finally follow the vc4_hdmi pointer in
that structure.

That will also give us some trouble when having multiple controllers,
but now that we have our encoder and connector structures that are part
of vc4_hdmi, we can simply call container_of on the DRM connector or
encoder and retrieve the vc4_hdmi structure directly.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 41 ++++++++++-------------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h | 16 ++++++++++++++-
 2 files changed, 28 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 50c67d674331..4a28e0c0c814 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -121,9 +121,7 @@ static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 static enum drm_connector_status
 vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 {
-	struct drm_device *dev = connector->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 
 	if (vc4_hdmi->hpd_gpio) {
 		if (gpio_get_value_cansleep(vc4_hdmi->hpd_gpio) ^
@@ -150,17 +148,13 @@ static void vc4_hdmi_connector_destroy(struct drm_connector *connector)
 
 static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 {
-	struct vc4_hdmi_connector *vc4_connector =
-		to_vc4_hdmi_connector(connector);
-	struct drm_encoder *encoder = vc4_connector->encoder;
-	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
-	struct drm_device *dev = connector->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
+	struct vc4_hdmi_encoder *vc4_encoder = &vc4_hdmi->encoder;
 	int ret = 0;
 	struct edid *edid;
 
-	edid = drm_get_edid(connector, vc4->hdmi->ddc);
-	cec_s_phys_addr_from_edid(vc4->hdmi->cec_adap, edid);
+	edid = drm_get_edid(connector, vc4_hdmi->ddc);
+	cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
 	if (!edid)
 		return -ENODEV;
 
@@ -229,9 +223,7 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 static int vc4_hdmi_stop_packet(struct drm_encoder *encoder,
 				enum hdmi_infoframe_type type)
 {
-	struct drm_device *dev = encoder->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	u32 packet_id = type - 0x80;
 
 	HDMI_WRITE(VC4_HDMI_RAM_PACKET_CONFIG,
@@ -244,9 +236,7 @@ static int vc4_hdmi_stop_packet(struct drm_encoder *encoder,
 static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
 				     union hdmi_infoframe *frame)
 {
-	struct drm_device *dev = encoder->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	u32 packet_id = frame->any.type - 0x80;
 	u32 packet_reg = VC4_HDMI_RAM_PACKET(packet_id);
 	uint8_t buffer[VC4_HDMI_PACKET_STRIDE];
@@ -292,9 +282,8 @@ static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
 
 static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
 {
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
-	struct vc4_dev *vc4 = encoder->dev->dev_private;
-	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
 	struct drm_connector *connector = &vc4_hdmi->connector.base;
 	struct drm_connector_state *cstate = connector->state;
 	struct drm_crtc *crtc = encoder->crtc;
@@ -338,9 +327,7 @@ static void vc4_hdmi_set_spd_infoframe(struct drm_encoder *encoder)
 
 static void vc4_hdmi_set_audio_infoframe(struct drm_encoder *encoder)
 {
-	struct drm_device *drm = encoder->dev;
-	struct vc4_dev *vc4 = drm->dev_private;
-	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	union hdmi_infoframe frame;
 	int ret;
 
@@ -362,9 +349,7 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
 
 static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	int ret;
 
 	HDMI_WRITE(VC4_HDMI_RAM_PACKET_CONFIG, 0);
@@ -383,10 +368,8 @@ static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
 static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 {
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
-	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
-	struct drm_device *dev = encoder->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct vc4_hdmi_encoder *vc4_encoder = &vc4_hdmi->encoder;
 	bool debug_dump_regs = false;
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
 	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index cdc9d90f62ac..749a807cd1f3 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -78,6 +78,22 @@ struct vc4_hdmi {
 	struct debugfs_regset32 hd_regset;
 };
 
+static inline struct vc4_hdmi *
+connector_to_vc4_hdmi(struct drm_connector *connector)
+{
+	struct vc4_hdmi_connector *_connector = to_vc4_hdmi_connector(connector);
+
+	return container_of(_connector, struct vc4_hdmi, connector);
+}
+
+static inline struct vc4_hdmi *
+encoder_to_vc4_hdmi(struct drm_encoder *encoder)
+{
+	struct vc4_hdmi_encoder *_encoder = to_vc4_hdmi_encoder(encoder);
+
+	return container_of(_encoder, struct vc4_hdmi, encoder);
+}
+
 #define HDMI_READ(offset) readl(vc4_hdmi->hdmicore_regs + offset)
 #define HDMI_WRITE(offset, val) writel(val, vc4_hdmi->hdmicore_regs + offset)
 #define HD_READ(offset) readl(vc4_hdmi->hd_regs + offset)
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
