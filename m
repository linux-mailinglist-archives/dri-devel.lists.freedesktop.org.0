Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 658C529FFC3
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538E66ECF4;
	Fri, 30 Oct 2020 08:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE2B6ECBD
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 13:40:25 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 15A1958077C;
 Thu, 29 Oct 2020 09:40:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 29 Oct 2020 09:40:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Eo5VrRb9YJZ27
 T8UrdYJM9gQo/XzFIVZjIot4ZBpts8=; b=s+OEnwHdqVz/Tl0LPtR77Y2hloCFn
 zwX7TKo1Xe1YXEj/oBZqtI4S4MlqmhVI15Qy/cjtLay92/FXWWlpFzH0OC6HAZMT
 v67XA6MABs3kXDT8WPq32gGBR/sBad2dQSJDaBadxPgdURif44a2xXn5kgQu1wy3
 jdFNUm3bL+3lBfpfyBYYZJ/1wA92nROJXZe7PxqBDht/uSRZoeeuGJLjh3ck0who
 uqeeX6okoLPF71ByS04q4JpVuhtv7okUsmxhTQp4aXoAnm92D97aXsoAEGJp+nqo
 aBiLmvgPa3WwlyYf7NXunSCvDvLxtqGrf44QrqzOIDP998LGbxocbZFlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Eo5VrRb9YJZ27T8UrdYJM9gQo/XzFIVZjIot4ZBpts8=; b=qC99dvwn
 u/te1M9yzXR48Bvg3zZTQFwiOgH9Z/VAV2cDRgNwsZSFjBg9lAUXkdKaKNY+M8Re
 LWwcM8AT7CXPSPuQehO/f8meD2IVuKovSOXvV+jIN5nUbujcrt9OoEami1MW88ax
 EZIgpQfaPoHOwDXX2H92w6NA0aQSO128jNjw8EAGfi2lGI0bCz9GVz8ZPZ7xZQdx
 6IS5PS+9LB/oeXpnPmXNibMQ8wTxPefDOG8jZhnWQKjYi6xFx/2BrqtwDMcQYgzd
 Od60l+jn/BCUIfoZRCxdz7K4CIzWwLrH/e7z2QCFnVlB0X/ALxPYc4MFOiC0p0qF
 h7/ny9Yco4kmDA==
X-ME-Sender: <xms:RsaaX11dfEpFdT1mBWWm7B1ucNVao7P1eqwu2AeS8CP8CPHG5WF79g>
 <xme:RsaaX8Fqh3KuEcTLrY72rODxTntNJKWSxXLy04ySizVefEgPuYc509qayvNJmKzj_
 bJ86LqI_fqsRm6Bd-s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleefgdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RsaaX14y3izlA9nfiMnWYjhCqPjHTqdZ9bOGCKEbJMjlskKqbkjTsg>
 <xmx:RsaaXy1SZ_Osr9IAhBZakA_N5TXwYmtQhWay_1CEL-WcdhfRZzqMuQ>
 <xmx:RsaaX4Evkno4qywCEy8YUBnONaCA9uk15QGTGcBVUcqTQZjkt1f54g>
 <xmx:R8aaX-H9xzFnifTRJxLyXd9w3lV_z7qAVOl6w638m8l1JVzaeb1q2Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 75ECD3064683;
 Thu, 29 Oct 2020 09:40:22 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 2/3] drm/vc4: hdmi: Disable Wifi Frequencies
Date: Thu, 29 Oct 2020 14:40:17 +0100
Message-Id: <20201029134018.1948636-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029134018.1948636-1-maxime@cerno.tech>
References: <20201029134018.1948636-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
 dri-devel@lists.freedesktop.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
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

Changes from v1:
  - Change the name of the property
  - Test for a range instead of an exact frequency
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.h |  8 ++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 506c12454086..0d72e519aec4 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -760,6 +760,9 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 {
 }
 
+#define WIFI_2_4GHz_CH1_MIN_FREQ	2400000000ULL
+#define WIFI_2_4GHz_CH1_MAX_FREQ	2422000000ULL
+
 static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 					 struct drm_crtc_state *crtc_state,
 					 struct drm_connector_state *conn_state)
@@ -767,12 +770,27 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	unsigned long long pixel_rate = mode->clock * 1000;
+	unsigned long long tmds_rate;
 
 	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
 	    ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
 	     (mode->hsync_end % 2) || (mode->htotal % 2)))
 		return -EINVAL;
 
+	/*
+	 * The 1440p@60 pixel rate is in the same range than the first
+	 * WiFi channel (between 2.4GHz and 2.422GHz with 22MHz
+	 * bandwidth). Slightly lower the frequency to bring it out of
+	 * the WiFi range.
+	 */
+	tmds_rate = pixel_rate * 10;
+	if (vc4_hdmi->disable_wifi_frequencies &&
+	    (tmds_rate >= WIFI_2_4GHz_CH1_MIN_FREQ &&
+	     tmds_rate <= WIFI_2_4GHz_CH1_MAX_FREQ)) {
+		mode->clock = 238560;
+		pixel_rate = mode->clock * 1000;
+	}
+
 	if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
 		return -EINVAL;
 
@@ -1717,6 +1735,9 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 		vc4_hdmi->hpd_active_low = hpd_gpio_flags & OF_GPIO_ACTIVE_LOW;
 	}
 
+	vc4_hdmi->disable_wifi_frequencies =
+		of_property_read_bool(dev->of_node, "wifi-2.4ghz-coexistence");
+
 	pm_runtime_enable(dev);
 
 	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 6815e93b1a48..3843be830601 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -142,6 +142,14 @@ struct vc4_hdmi {
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
