Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DE333F416
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 16:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F213B6E7E5;
	Wed, 17 Mar 2021 15:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C156E7E5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 15:44:08 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 663F6580A59;
 Wed, 17 Mar 2021 11:44:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 17 Mar 2021 11:44:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=NH4vEAaXwHZNQ
 HOgtYjRcAtq0gaBvT3EbM00ErXRqto=; b=iPVynGISAUUeWxXJa0+j+c6iqDga4
 ywrkmSIy7E2JHRPDnFwbhwuNwFN98dgQU3OtDk2WPg/pkJJpXMckbaEuLBAx1oLS
 rgafYtYJW7aqtgm1OysXBj8fmWxWefSqgurXnLp+vlohg/wdzVUqhdtx/FJSaKbv
 QydH3YrGBKQTC2gdYZGrNplM6TGgB3bBmoGXunVwDlffy4YyfhTrjiyO3kjAHo49
 fUv7s/YE10CIdiG9e3J60IxSSnc/95uTkIrdIkf4H8CddD7uEBKX4vgTCG9L95GZ
 nJ6mTplM8YK0P3gu1gT/0ijTBEk7nNGHcOSFtq4rNusBj43b+JtE9OXpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=NH4vEAaXwHZNQHOgtYjRcAtq0gaBvT3EbM00ErXRqto=; b=LmqQvjpO
 iTYPO/wx1DY0+LJSvVyTk7m2jORvnEo54GyHg7Y0PIQ0eEBVy2fbs927K9Nrkw5B
 bs/hA8vQVR/09UZQ+n/t1mVVCwTXgOWW5CiuFAyFPLbnofQ0m7R7uxHv8KWcmS4P
 8r+kgmUtI2RPY0ZnppJDWbon8rzArqgeiF3zJgGtGygYuvLS5BdrXf65leFw3goT
 c4QohJqRGIhTiOOZEFo9yfIFKDROaRyclssvx1uWfFoaejk6tixI96zY9dInIpyn
 2K/5YgZwMliOe9PMZouleTgXCshKW2jcH3aZpETa6l9ATzEMuhzv22Apbba+p2aZ
 kPNiUPUYzYpIyA==
X-ME-Sender: <xms:yCNSYJJe-XhoXqG1IpQJEat42aoXI0sx_t3s5b6FbfUU-WFzW6d0ZA>
 <xme:yCNSYOffqTvTpHMX6HPKk_I1BaPl8K6H5BZ8FYYO2OVDaL7WjxLIUziTevJrNtLcJ
 g5TQNJHGl7UBTKTRDY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:yCNSYI-u5yeVshzMokwrpYPRw1mqqJxxD83R8RUTXgenPkueVwudjw>
 <xmx:yCNSYLrrfaHYZwzNdxuzpdPaXe-mNLQskvUr9V0AmjnZEqXNbnRZng>
 <xmx:yCNSYNDw5o3r1wV1RzgRdjcqJzT4oQtUydJeb62Nml88nxip1PHdEA>
 <xmx:yCNSYPyV19Zf9z_YXhK_p1jJ5bbCAtSGtgpr3XvRCD2arQgaGUYalg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 16BE624005A;
 Wed, 17 Mar 2021 11:44:07 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 08/18] drm/vc4: hdmi: Use full range helper in csc functions
Date: Wed, 17 Mar 2021 16:43:42 +0100
Message-Id: <20210317154352.732095-9-maxime@cerno.tech>
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

The CSC callbacks takes a boolean as an argument to tell whether we're
using the full range or limited range RGB.

However, with the upcoming YUV support, the logic will be a bit more
complex. In order to address this, let's make the callbacks take the
entire mode, and call our new helper to tell whether the full or limited
range RGB should be used.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 14 ++++++++------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  3 ++-
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index fc545072b173..bb2fffa2d495 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -494,14 +494,15 @@ static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
 {
 }
 
-static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
+static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
+			       const struct drm_display_mode *mode)
 {
 	u32 csc_ctl;
 
 	csc_ctl = VC4_SET_FIELD(VC4_HD_CSC_CTL_ORDER_BGR,
 				VC4_HD_CSC_CTL_ORDER);
 
-	if (enable) {
+	if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode)) {
 		/* CEA VICs other than #1 requre limited range RGB
 		 * output unless overridden by an AVI infoframe.
 		 * Apply a colorspace conversion to squash 0-255 down
@@ -529,13 +530,14 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
 	HDMI_WRITE(HDMI_CSC_CTL, csc_ctl);
 }
 
-static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
+static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
+			       const struct drm_display_mode *mode)
 {
 	u32 csc_ctl;
 
 	csc_ctl = 0x07;	/* RGB_CONVERT_MODE = custom matrix, || USE_RGB_TO_YCBCR */
 
-	if (enable) {
+	if (vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode)) {
 		/* CEA VICs other than #1 requre limited range RGB
 		 * output unless overridden by an AVI infoframe.
 		 * Apply a colorspace conversion to squash 0-255 down
@@ -844,12 +846,12 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 
 	if (vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode) {
 		if (vc4_hdmi->variant->csc_setup)
-			vc4_hdmi->variant->csc_setup(vc4_hdmi, true);
+			vc4_hdmi->variant->csc_setup(vc4_hdmi, mode);
 
 		vc4_encoder->limited_rgb_range = true;
 	} else {
 		if (vc4_hdmi->variant->csc_setup)
-			vc4_hdmi->variant->csc_setup(vc4_hdmi, false);
+			vc4_hdmi->variant->csc_setup(vc4_hdmi, mode);
 
 		vc4_encoder->limited_rgb_range = false;
 	}
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 3cebd1fd00fc..3d88261d463e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -77,7 +77,8 @@ struct vc4_hdmi_variant {
 	void (*reset)(struct vc4_hdmi *vc4_hdmi);
 
 	/* Callback to enable / disable the CSC */
-	void (*csc_setup)(struct vc4_hdmi *vc4_hdmi, bool enable);
+	void (*csc_setup)(struct vc4_hdmi *vc4_hdmi,
+			  const struct drm_display_mode *mode);
 
 	/* Callback to configure the video timings in the HDMI block */
 	void (*set_timings)(struct vc4_hdmi *vc4_hdmi,
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
