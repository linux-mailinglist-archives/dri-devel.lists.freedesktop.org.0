Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FC725D1D5
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3DB6EA86;
	Fri,  4 Sep 2020 07:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B2F6E570
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:02:58 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id E7831C36;
 Thu,  3 Sep 2020 04:02:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:02:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=UmTMoPKT6+vZq
 KRF7fLIDXkq5JxM6v5QN0TAxmXaq9U=; b=fe9Ql5DnYNxvAEBVnJqG/Vc8eEmYk
 iBn1JyCKbpUGC4xrRIEgC70qoUD2QxI9k7nSlohHswmkzcusLae55fGkKQsvMmRU
 gvvtMgUn/66iGTE88x1Nzw2+/r7nf8x/4RRDfneCYCRJRixjHQ9LZhJJcHq+wYf8
 dz1Uu3FAAO+QLjuX6eXaNLCl0JuDy3ygzXq9oqaS+m21dcJVtgJxqD99VVYXWDmE
 cYq0v0/8B7fCtOjqJEEOmHDytsfIrYLk0N9+uGL/ZS1r6bBh1C+21SHRKiUWXffh
 yZAC68oJfggpKuL8fXLkygYqsqRBlz17GOQXHziQ+d1KtRuQpVEt2GTQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=UmTMoPKT6+vZqKRF7fLIDXkq5JxM6v5QN0TAxmXaq9U=; b=gDGnQ+6O
 J3DttVu1vIc0mEfYOi/FTpcb8YkxLWqGFZtETYNY7sIXeKOT9vE6h8sdHV/I9Jz/
 EUyDRtv2XdB5ukFKP5wkDkjlRcnQjoGnkNccjyRJLHL5HY77bcTf6xGNE7r0D6hj
 E56rd53jQ8eTb/ewAxaYUqYjrPARV3HGGKTLf5okJfj1H+HzSA4MYVxDA9uB7/BF
 NNsY9UzePCLspMyrb933NZ8hLeDHmOGd1TrdtzAKXbnZwZdsjSKnLKtZM2IioGKS
 MIVoFys3jRyy3kd43o0UBj7Mt6UOlJDQctR5feMvXxe0zwM5v8qtXYGpA0JqK7pm
 tYt1xAsG8suoDg==
X-ME-Sender: <xms:MKNQX86KTKf3YfxlwQFy0T7luAm43f_4EyG_MhqN8liIUb_Sjet4jQ>
 <xme:MKNQX95JKuKU_D-fMQA1dK5JIOXoCoVV-Rw63TU4K6abySgyuYOxLV7qUy7KIBRmy
 CBNw7hiTtuysB95L4E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeegtd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:MKNQX7c_Z95Qflhn-Kr-Wgb1ma6vwdwVge7eOcUo7QuZR8-PjiF4Xg>
 <xmx:MKNQXxL3yygBP2U5JfhxAzemQsXaUveQ-YjsPHQtfqbgI6GBcdcbpQ>
 <xmx:MKNQXwIjrjvT8axOln26xiKsF61PatcLglXC6YDRLo8yDnGl4-5-_A>
 <xmx:MKNQX-zFUfaY7js8mKBBDAJsotrR-nLCzFYhRam937mWWmpKXXdGBSjoIjU>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 30042306005F;
 Thu,  3 Sep 2020 04:02:56 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 45/80] drm/vc4: hdmi: Add container_of macros for encoders
 and connectors
Date: Thu,  3 Sep 2020 10:01:17 +0200
Message-Id: <536ecce5898ea75839fa3788b876009d69a5ccae.1599120059.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
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

Reviewed-by: Eric Anholt <eric@anholt.net>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 41 ++++++++++-------------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h | 16 ++++++++++++++-
 2 files changed, 28 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 93865327a8d4..a2053da4e443 100644
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
