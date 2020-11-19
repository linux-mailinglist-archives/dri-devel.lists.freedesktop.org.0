Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C9F2B9C04
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 21:32:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D476E81B;
	Thu, 19 Nov 2020 20:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651746E511
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 09:20:18 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id BD56F58056B;
 Thu, 19 Nov 2020 04:20:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 19 Nov 2020 04:20:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=4cp2xre+gdaTRhZd8Lqk7ewdF0
 77tnpCwdXrx58ZT2A=; b=koyLmdO+SnLyFfJxeR9eIIV2/FhpG9gwTpAOmRxtJA
 jxkqllusj/5YcV7H8JEk6Xtaw15KjO7bHHn3cUid/rGpbaepwOxkQJ/KdW/ciAsg
 cdJxvtuqVZKiRqxplcsFgQm8vnhuxPqh/qNQg5/ORSB7Fopx7edKmDgBVL87KSa6
 ZDYvExuIV+ssQxLuMQXFdkIhYupn3NrHC/9iS8pwm5IfnXb49Psh5E3dHnkaJPc7
 SCD0oU0BH/GWJX57YtoL2FXjU4FdOG+Gm+Ky8+tclChVGx23hzTqFRWeOR13f9mu
 MVB0QgwVWiIh4fz/xVTp48CqJhCeAwBH4c9H0EYWQzBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=4cp2xre+gdaTRhZd8
 Lqk7ewdF077tnpCwdXrx58ZT2A=; b=rmmzHNfHEyqf8s9Vt0JvWDR9kiPObEAXk
 obNMqqk9u0J+ayTn6UNVO30+DYEaaWNoeiyAj2JKXhXcuGjvia+KEEsgzpOfm2hn
 nxXFoKrLCcX2XKLRXJstGEgRxNRMu+RyQhZDdeBZ69aYiwFKqHskDpqtdXK8QHxU
 NeVUQyg+Nzmqtfm8okfP5NtkKw/RFwnXPddrv/mbq+wxROo2vt5GxaMo4fWk1lLI
 +P/lWVRfiF6v0Nzl/9CscqotktUUeXzEQ5kEYDU4ir+D+sPyIGq4ipZZqIvimwYj
 YW1lR3Yrc3HNxGiDGfj9YOhKGRbcMX6RHdZcYDIB9VO7+qs4Sh23Q==
X-ME-Sender: <xms:zji2X3MKVoZHwb6YHDVFpRbR_q18O2FDGBd6NJ_sdinr7dJNdjy7MA>
 <xme:zji2Xx_h_yO9YuTMf2bZjvdQJK0s-napvbqP-1rb5tZDtre1sTkt_ydeHuQFyW_xl
 9lye4OH4l_tLu3LMpY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudefjedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepjeffheduvddvvdelhfegleelfffgieejvdehgfeijedtieeuteejteefueekjeeg
 necukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:zji2X2QMKZqRaj54r925x0iex4CWSbjYcbXqOCa1vVtJ4W2dNcodiA>
 <xmx:zji2X7uKr-2usxEll_jZbkYKZUVJ6TN9XFMq89O3ww6S3q_tIrhDMA>
 <xmx:zji2X_fXCTUKIEd41i_HVUdzr3vawXl8_GUeq-9j-KphXbYNfTA-sQ>
 <xmx:0Ti2X-zVg8syV5J_T_I-dRhfZGTjUmvh_Fi6oSq3pu55yuD1-b_ASg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8F0C4328005D;
 Thu, 19 Nov 2020 04:20:14 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH] drm/vc4: hdmi: Don't poll for the infoframes status on setup
Date: Thu, 19 Nov 2020 10:20:12 +0100
Message-Id: <20201119092012.759575-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 19 Nov 2020 20:32:07 +0000
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

However, we do need to poll when we're disabling since the we can't
update the packet RAM until it has been sent.

Let's add a boolean flag to tell whether we want to poll or not to
support both cases.

Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 285c871b02fb..e1bbdba646db 100644
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
+	ret = vc4_hdmi_stop_packet(encoder, frame->any.type, false);
 	if (ret) {
 		DRM_ERROR("Failed to wait for infoframe to go idle: %d\n", ret);
 		return;
@@ -1055,7 +1059,7 @@ static void vc4_hdmi_audio_reset(struct vc4_hdmi *vc4_hdmi)
 	int ret;
 
 	vc4_hdmi->audio.streaming = false;
-	ret = vc4_hdmi_stop_packet(encoder, HDMI_INFOFRAME_TYPE_AUDIO);
+	ret = vc4_hdmi_stop_packet(encoder, HDMI_INFOFRAME_TYPE_AUDIO, true);
 	if (ret)
 		dev_err(dev, "Failed to stop audio infoframe: %d\n", ret);
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
