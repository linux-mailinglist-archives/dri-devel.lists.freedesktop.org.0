Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7802CD0F8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 09:15:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 384EF6E9B2;
	Thu,  3 Dec 2020 08:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48DB6E09C
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 07:46:32 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id F1FF0AF1;
 Thu,  3 Dec 2020 02:46:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 03 Dec 2020 02:46:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=N+BQRic3iW0+eTCgj+5qRIEZsS
 caDy3vJuM6wbY1Gsg=; b=lODXlz6JB8wcaLyV6/KQcilidmua0A/yT/XB93FCY9
 gQdMooYoHmTQg/BDO64owWDoowIrxK7/sKUIDwbmwU6OwGavWmEhGxlrN3CgZrIF
 Hsi9aTeoEe4WeUQ96imtt6m3qpJXwJHD1OfmJv+P+T7B1+8L/DNeOpyZDgADkfok
 HinzPIF+STA/1OwZjYNlE5EunDRoVcBshoON8JW6lPBh7zp2Y16iexjf89sron5l
 7hoLktUKECZz3ewOsbg6U8J/pyXqHAOBklnFvah3GyEvDzoND6D4psGPzskea3Uh
 SU//QGdB7w8/ZfckoYGcjCHsSOOY3TkqZSoJc45s+UeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=N+BQRic3iW0+eTCgj
 +5qRIEZsScaDy3vJuM6wbY1Gsg=; b=YrchcTtuhKZohOTvwE09+tYL6cWd2YLzm
 rFojR+dWpqUBkDMAQCgET45Hv/vL6DeTcwH9oLdWKVDJ1BD6GTV/Du+cKudsdBzm
 M5/zaxyC4QvJ5KWnmjwQ9JQ3pYIurogRmuM+XJBWFAFbDcgkzaQOxj1OvB+tRcpK
 qkn02sfOuLTu3w8yTuo/jaOnaHtMf5GW9iCOJSQoYOSAawKCOXidzN4NGSI9Nmqx
 TiSlPe8Xvc6KtoRJwiswFGOGEgvGTNgnARn31tAlluteVpq/hcW/J8BpCYOOgQyk
 XsP8ApspHe6aVR6yJjm6+gaVb/gU+ivcXwL0fufsKAOKRdmRhiCMQ==
X-ME-Sender: <xms:05fIX_BNa2upBqHSyw7IvSH2XzEsEBbsptCaLaqmhnEHj-vuFJ6yQQ>
 <xme:05fIX1jr62U95HXCKJ_vr-cu6aYsfsSiCB_mS2Q-T3203Ujh86sXqYEuGE-85rPYu
 mMAAFlUiX6NWAyCj2s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeihedgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeej
 geenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:05fIX6mcZJeXz1vXaUhxb7pNRzYcOjuepqWWMjq0St6Chfg1UaxV_g>
 <xmx:05fIXxz2RRlgBaQAgqcYNvddgSS50AtJRKal8KvBlvUJvVi4-QwLnA>
 <xmx:05fIX0S2-gPpt5h4ePS7abNcNYjaxyIwz2fmOUCON4gvRfq63x8JtA>
 <xmx:1JfIX3EBCM6W2BIFl3vltUS_PtSA_kfUGBG-G19c4bgnTkGYvncUpN30uyY>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id F38A2240057;
 Thu,  3 Dec 2020 02:46:26 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2] drm/vc4: hdmi: Don't poll for the infoframes status on
 setup
Date: Thu,  3 Dec 2020 08:46:24 +0100
Message-Id: <20201203074624.721559-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 03 Dec 2020 08:14:41 +0000
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

The infoframes are sent at a regular interval as a data island packet,
so we don't need to wait for them to be sent when we're setting them up.

However, we do need to poll when we're enabling since the we can't
update the packet RAM until it has been sent.

Let's add a boolean flag to tell whether we want to poll or not to
support both cases.

Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v1:
  - Inverted when to poll
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index a2c5b5e9786a..d3c4a9b5bb6d 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -265,7 +265,8 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 }
 
 static int vc4_hdmi_stop_packet(struct drm_encoder *encoder,
-				enum hdmi_infoframe_type type)
+				enum hdmi_infoframe_type type,
+				bool poll)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	u32 packet_id = type - 0x80;
@@ -273,6 +274,9 @@ static int vc4_hdmi_stop_packet(struct drm_encoder *encoder,
 	HDMI_WRITE(HDMI_RAM_PACKET_CONFIG,
 		   HDMI_READ(HDMI_RAM_PACKET_CONFIG) & ~BIT(packet_id));
 
+	if (!poll)
+		return 0;
+
 	return wait_for(!(HDMI_READ(HDMI_RAM_PACKET_STATUS) &
 			  BIT(packet_id)), 100);
 }
@@ -299,7 +303,7 @@ static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
 	if (len < 0)
 		return;
 
-	ret = vc4_hdmi_stop_packet(encoder, frame->any.type);
+	ret = vc4_hdmi_stop_packet(encoder, frame->any.type, true);
 	if (ret) {
 		DRM_ERROR("Failed to wait for infoframe to go idle: %d\n", ret);
 		return;
@@ -1056,7 +1060,7 @@ static void vc4_hdmi_audio_reset(struct vc4_hdmi *vc4_hdmi)
 	int ret;
 
 	vc4_hdmi->audio.streaming = false;
-	ret = vc4_hdmi_stop_packet(encoder, HDMI_INFOFRAME_TYPE_AUDIO);
+	ret = vc4_hdmi_stop_packet(encoder, HDMI_INFOFRAME_TYPE_AUDIO, false);
 	if (ret)
 		dev_err(dev, "Failed to stop audio infoframe: %d\n", ret);
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
