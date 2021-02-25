Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4A13252DD
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 16:59:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3626ECCB;
	Thu, 25 Feb 2021 15:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E296ECAE
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 15:59:21 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 5A110B86;
 Thu, 25 Feb 2021 10:59:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 25 Feb 2021 10:59:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=dfi/4Dq0to2vt
 jvCTwhERJaLrX609oIOKE/vQQOV18Q=; b=TXt3fGbtDJg/i8N2BgmmQ3jOYm6n/
 lCS8bDR3xN+Sy3Jixe75DaRscIOaGyYZLFZQPLMJqPxG29OYPgX8mecCUZoCUXo1
 aQLsBM9N/vMcG2lPEQFUWa0fbTPAQr9QkfWIaMpVFqMZfoNi7XnIbzgivtzA7hkn
 Cc4v22ruem0vF/WCsdqW+6zTFhvev9DTGmkO0jNpGIXA+afG/N1kI/nrue1AHi78
 +UQAax8vDJKPPaj6Ug34qKX9OmA5X+Gf/UalmRoY1YjauO9Bvuw5cntg49tQT1SQ
 XjZ+KcGSUyoiv4BiUtCi/2xbvoZJa5Ksrk8P2mafGkiJHDoJH+1d2pk9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=dfi/4Dq0to2vtjvCTwhERJaLrX609oIOKE/vQQOV18Q=; b=BHS/ECab
 3ZHWUBBZolSIBJfXetZnIKEQ0Dc5QjHbEkrJBjIbKvomA/ayOV8XzhZ2j7zR/6K3
 fcjZnzhV4A4YeKO1/1xSE6+JTxBEDLL/x5IiPlzRzt679MKbzltS7qLSE2lda5GP
 gnKDH7GAQEFZeOFXlZjEp7bRBTZC4VNlqsygUbmo9tq9rQ87K/ZxMG5DGP/Iuyoh
 r3ikv/hFDC6t1077o+utj8wYARp7hl2u0kH1wP6XGxj+xkhf0ah+O8WAtayK7JMs
 YFOm7PhBm7UUY3oGyh/MGX6V4+6V3xjq3MsnViZq5+wYbdn7zHVc5Cy8cFPSUN09
 dLsNm3BUpk6kVg==
X-ME-Sender: <xms:V8k3YHKSKg-rirQod_ikfHe5LgsJKjXyOceuNYHplkOPl6DKIKRU0Q>
 <xme:V8k3YCCt96wJa5uHSicql8l12DyTPLlJz29FX9XvC0-l2VeffLYqYu2rtqx8uPwY5
 wVBQNbTj4wWwcZQjVA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeelgdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:V8k3YIAJkicNA8F5HaLevdrfqwSgtTmEnUI9dUMBC9EjBFcJ7NWdBA>
 <xmx:V8k3YMA1WFUuhcQ8OZ0kGXmDyVrStAje0yej5tCzR9GBzBNv4Pbmqg>
 <xmx:V8k3YLof79ipTwl8O8UekeR-fdzVWkDJSmZGCp-7RKnODGGgtosKnw>
 <xmx:WMk3YK8GuxeBxgYZTFJ3ItiNUIXB06vdtPFGYaMtWnwXJmgjjALpjNC7F20>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B9953108006C;
 Thu, 25 Feb 2021 10:59:19 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 4/8] drm/vc4: hdmi: Check and warn if we can't reach 4kp60
 frequencies
Date: Thu, 25 Feb 2021 16:59:05 +0100
Message-Id: <20210225155909.1853812-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210225155909.1853812-1-maxime@cerno.tech>
References: <20210225155909.1853812-1-maxime@cerno.tech>
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
 David Airlie <airlied@linux.ie>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Daniel Vetter <daniel.vetter@intel.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to reach the frequencies needed to output at 594MHz, the
firmware needs to be configured with the appropriate parameters in the
config.txt file (enable_hdmi_4kp60 and force_turbo).

Let's detect it at bind time, warn the user if we can't, and filter out
the relevant modes.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 17 +++++++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.h |  8 ++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index b5bc742993a4..f05f6da286f7 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -953,6 +953,9 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
 		return -EINVAL;
 
+	if (vc4_hdmi->disable_4kp60 && (pixel_rate > HDMI_14_MAX_TMDS_CLK))
+		return -EINVAL;
+
 	vc4_state->pixel_rate = pixel_rate;
 
 	return 0;
@@ -972,6 +975,9 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 	if ((mode->clock * 1000) > vc4_hdmi->variant->max_pixel_clock)
 		return MODE_CLOCK_HIGH;
 
+	if (vc4_hdmi->disable_4kp60 && ((mode->clock * 1000) > HDMI_14_MAX_TMDS_CLK))
+		return MODE_CLOCK_HIGH;
+
 	return MODE_OK;
 }
 
@@ -1986,6 +1992,17 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	vc4_hdmi->disable_wifi_frequencies =
 		of_property_read_bool(dev->of_node, "wifi-2.4ghz-coexistence");
 
+	if (variant->max_pixel_clock == 600000000) {
+		struct vc4_dev *vc4 = to_vc4_dev(drm);
+		long max_rate = clk_get_max_rate(vc4->hvs->core_clk);
+
+		if (max_rate < 550000000) {
+			drm_warn(drm, "The core clock cannot reach frequencies high enough to support 4k @ 60Hz.");
+			drm_warn(drm, "Please change your config.txt file to add hdmi_enable_4kp60 and force_turbo");
+			vc4_hdmi->disable_4kp60 = true;
+		}
+	}
+
 	if (vc4_hdmi->variant->reset)
 		vc4_hdmi->variant->reset(vc4_hdmi);
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 3cebd1fd00fc..3cd021136402 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -154,6 +154,14 @@ struct vc4_hdmi {
 	 */
 	bool disable_wifi_frequencies;
 
+	/*
+	 * Even if HDMI0 on the RPi4 can output modes requiring a pixel
+	 * rate higher than 297MHz, it needs some adjustments in the
+	 * config.txt file to be able to do so and thus won't always be
+	 * available.
+	 */
+	bool disable_4kp60;
+
 	struct cec_adapter *cec_adap;
 	struct cec_msg cec_rx_msg;
 	bool cec_tx_ok;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
