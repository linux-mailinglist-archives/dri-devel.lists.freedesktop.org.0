Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E0827A812
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991516E107;
	Mon, 28 Sep 2020 07:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1BD6EB34
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 13:07:48 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id C1618580143;
 Fri, 25 Sep 2020 09:07:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 25 Sep 2020 09:07:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=YM2DjL5FV7a6DzHDYshCBUS/UB
 n0d03kAZLJ2AU9u7I=; b=Fa+1kpp9VITzlI2/FwoQaOo0Sf3LHXS3U2CcncbMfj
 cJhwQSSqwpvgHlZ/flVspGN1mfQ78slVPWGPG59C0Th1Kf0v4vGzPPKUsy/juMgH
 3J6kS+ioqlp2ppCJigj+GdJOFjM/STMz7QIep9+SR3AM6stMgmHehwlP6c+v6/dk
 QvspArhVf6/NtXfR3ujt3WFJRZDOxkI+/T/TT/MvD4AqX05t2HILhIAHVH0+yDfj
 0lA+6/OkP15vPEud8f2EzlzXN7yss3Hn5k80VI8DkBOCpYZFVV+j9H2sCgUkjBt5
 9caCAujeV3MKMHM6gdTgF9dFRsGngYCV3h9Fcrdcfndw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=YM2DjL5FV7a6DzHDY
 shCBUS/UBn0d03kAZLJ2AU9u7I=; b=UFDUzS4xiY7zYZLFfdcyaW4duS18dwdOV
 Hkmvdwkz9RNjvR2KrlOV9i+2aVYv82zXEfmIu6W7RjH7DCAWQZq7nE3rGU1Yruoe
 YbeDA3wnRa2m88mrZ7XuMhET9yQ2Dsi4Op9RkEXcZcOK/9/rKNp4BQQnWi9C9wc9
 ZaWSXZVfrV5vJU4YwfxBnEmah4YECI5Ozo5eBprPTYNcDU5+sb7kHbswDLo4s2ag
 u2NfE4uhpbxcINz62UrzgeVmKFIOx23uf9FYQ02CHyql6lkfFrmdEYHahA6vEXQq
 DaSHAHVnuIm6BdtscQBh2yqytZVh28DFrn/Tu6PZZbuEw9XU1e08A==
X-ME-Sender: <xms:outtX2EuULcRLvHjo1l9kKdd_WzBJWXvR7_CTFAllked5aKAjw05og>
 <xme:outtX3UBMT6M0i24jb5_TgKGhO5W6zirNtqg6mV1zO_S0vFGnjFEucjg3DkWdOpTj
 H6_5rrt-lWoItnqYZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:outtXwIVaUcZ0f-c9WH1EFE0o3cBUo0mG3PkG6YGNiu5muilpNfeqg>
 <xmx:outtXwEqWS-PgjzpTthEU7pGgAb8r7QSMgPWLX0lJ21jNLi023kSTA>
 <xmx:outtX8WM4xdHezlvmak6UOam5gS8HQb6HErQwWqDSzG6wSWENCUGAA>
 <xmx:o-ttX9vvs6blIrT6BHRXI4sRiiJYAiV4diaehFhFwX_Tzr9byunRHA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 26306328005A;
 Fri, 25 Sep 2020 09:07:46 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 1/2] drm/vc4: hdmi: Disable Wifi Frequencies
Date: Fri, 25 Sep 2020 15:07:43 +0200
Message-Id: <20200925130744.575725-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's cross-talk on the RPi4 between the 2.4GHz channels used by the WiFi
chip and some resolutions, most notably 1440p at 60Hz.

In such a case, we can either reject entirely the mode, or lower slightly
the pixel frequency to remove the overlap. Let's go for the latter.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../bindings/display/brcm,bcm2711-hdmi.yaml        |  6 ++++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 14 +++++++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |  8 ++++++++
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
index 03a76729d26c..63e7fe999c0a 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
@@ -76,6 +76,12 @@ properties:
   resets:
     maxItems: 1
 
+  raspberrypi,disable-wifi-frequencies:
+    type: boolean
+    description: >
+      Should the pixel frequencies in the WiFi frequencies range be
+      avoided?
+
 required:
   - compatible
   - reg
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index acfb4e235214..74da7c00ecd0 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -877,13 +877,22 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	struct vc4_hdmi_connector_state *vc4_state = conn_state_to_vc4_hdmi_conn_state(conn_state);
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	unsigned long long pixel_rate = mode->clock * 1000;
+	unsigned long long pixel_rate;
 
 	if (vc4_hdmi->variant->broken_odd_h_timings &&
 	    ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
 	     (mode->hsync_end % 2) || (mode->htotal % 2)))
 		return -EINVAL;
 
+	/*
+	 * The 1440p@60 pixel rate is in the same range than the WiFi
+	 * channels. Slightly lower the frequency to bring it out of the
+	 * WiFi range.
+	 */
+	if (vc4_hdmi->disable_wifi_frequencies && mode->clock == 241500)
+		mode->clock = 238560;
+
+	pixel_rate = mode->clock * 1000;
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		pixel_rate *= 2;
 
@@ -1837,6 +1846,9 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 		vc4_hdmi->hpd_active_low = hpd_gpio_flags & OF_GPIO_ACTIVE_LOW;
 	}
 
+	vc4_hdmi->disable_wifi_frequencies =
+		of_property_read_bool(dev->of_node, "raspberrypi,disable-wifi-frequencies");
+
 	pm_runtime_enable(dev);
 
 	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 40e51ece8efe..6618ee758890 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -143,6 +143,14 @@ struct vc4_hdmi {
 	int hpd_gpio;
 	bool hpd_active_low;
 
+	/*
+	 * On some systems (like the RPi4), some modes are in the same
+	 * frequency range than the WiFi channels (1440p@60Hz for
+	 * example). Should we take evasive actions because that system
+	 * has a wifi adapter.
+	 */
+	bool disable_wifi_frequencies;
+
 	struct cec_adapter *cec_adap;
 	struct cec_msg cec_rx_msg;
 	bool cec_tx_ok;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
