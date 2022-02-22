Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 583EB4BFF02
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 17:41:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE9710E850;
	Tue, 22 Feb 2022 16:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1A210E850
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 16:40:52 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 453A75800DC;
 Tue, 22 Feb 2022 11:40:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 22 Feb 2022 11:40:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=YXgGYClXSB/DNIcqvbE8m1jofkT8RZ
 S7ek0SEgfiCZE=; b=eCb4FAtsYRxvrWMY9ZosmLbHd3tnez34zgL7mrOxvBXvpj
 a5tRRCvtpFE1TiyQ12Sc5dsvpk/nP6rTK1BcnXogfKiOs13WIZyNmPM/QHa9tO5Z
 c0UNjrMuPEw0n2wMuZnBrJfdpVi+NVR5mxHuPGF44ZjepX4nLnTnznCDk3vf/G9/
 qfQLoZxQlBSW6QC9nwvgwv55wwe0HbEOnkAevF05yNKSOyf34xlTjxVLtNx1Er++
 Y/KFt9um93oSw3KkUWRfqHTkBgdlrz4CWJ1b0niTsbf3dqCVR2FHWnCgESzq8Yr1
 vHh+vstzxKGRHBJbzxhNnbiuVmHGWgSC55ljKDsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=YXgGYC
 lXSB/DNIcqvbE8m1jofkT8RZS7ek0SEgfiCZE=; b=dSaI0NLyKwQMy7de84W3tI
 gOmKcr5d4nmeMvwbdcrIrE2XFo0xmdGY2j9WhFgLIkFX6z0o6Z5Kl/NtQT4tc8+e
 BhaMTQGf1s43pkYFZeImvJUkBS5Azrcf/wXyZ0vFBIVvk0L87x0VaoCJR9qHMi8f
 JR3xBGiy05nAJfRXN9xOhQZrApT2A9D15YkGpXp8cqfJmuaCBaWnKHPy9UOn4byp
 S3yXEkz0NTjzwmNg3KSwW5MmDNu0BrO7qQQ2FUeRHdFwwRz+bynA8Tyq0cxwE/nt
 HlFdQpwikt5NUqKLVIaLhw4qn/+CSQmvREUFd7mWNZYqq7fDu73+qF5i0bAgAfng
 ==
X-ME-Sender: <xms:FBIVYvFClVk6rW_UuCzxlvmfAPhLS-gABCBCyfrcDYs9AOionQICRw>
 <xme:FBIVYsUi1DqAl_dARUy_a8En5ZlRQ6-aGXP7lhZ2MH3zcaMUM56WiDse_W5r9qn8b
 oxdwn3DEMljn4wmQzM>
X-ME-Received: <xmr:FBIVYhIkjH52pS1cYSUn0xcHzSpeNC2CUz_YSogLgznx8bSWpBadPowXJJfRZEXjnytBDQbifMQsSl0lmha_FKYySVAb4p1-dHURyHk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeekgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:FBIVYtHzjuv82UVxkDffPhH35EIXzu_kxTekpU2WzxNxr1DRgtF5hQ>
 <xmx:FBIVYlVa2_nNOAgs_8TVVCZjttmMEEfSCUlOU9UUG0OlsbQqwl5UhA>
 <xmx:FBIVYoNw0PJWuRcSD3EvWRlc3XIyfBISp4HHad4qlbX3njsq7vhPCQ>
 <xmx:FBIVYuMrUYZQ_bxRMM96gRkzh7mDWcB-dU5N1MlZQsu8N3Bsb-bJBw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 11:40:51 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v6 2/7] drm/vc4: hdmi: Move clock validation to its own
 function
Date: Tue, 22 Feb 2022 17:40:37 +0100
Message-Id: <20220222164042.403112-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222164042.403112-1-maxime@cerno.tech>
References: <20220222164042.403112-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Werner Sembach <wse@tuxedocomputers.com>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our code is doing the same clock rate validation in multiple instances.
Let's create a helper to share the rate validation.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index c70e5059b077..d4cebb524578 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1245,6 +1245,19 @@ static void vc4_hdmi_encoder_atomic_mode_set(struct drm_encoder *encoder,
 	mutex_unlock(&vc4_hdmi->mutex);
 }
 
+static enum drm_mode_status
+vc4_hdmi_encoder_clock_valid(const struct vc4_hdmi *vc4_hdmi,
+			     unsigned long long clock)
+{
+	if (clock > vc4_hdmi->variant->max_pixel_clock)
+		return MODE_CLOCK_HIGH;
+
+	if (vc4_hdmi->disable_4kp60 && clock > HDMI_14_MAX_TMDS_CLK)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
 #define WIFI_2_4GHz_CH1_MIN_FREQ	2400000000ULL
 #define WIFI_2_4GHz_CH1_MAX_FREQ	2422000000ULL
 
@@ -1288,10 +1301,7 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		tmds_char_rate = tmds_char_rate * 2;
 
-	if (tmds_char_rate > vc4_hdmi->variant->max_pixel_clock)
-		return -EINVAL;
-
-	if (vc4_hdmi->disable_4kp60 && (tmds_char_rate > HDMI_14_MAX_TMDS_CLK))
+	if (vc4_hdmi_encoder_clock_valid(vc4_hdmi, tmds_char_rate) != MODE_OK)
 		return -EINVAL;
 
 	vc4_state->tmds_char_rate = tmds_char_rate;
@@ -1310,13 +1320,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 	     (mode->hsync_end % 2) || (mode->htotal % 2)))
 		return MODE_H_ILLEGAL;
 
-	if ((mode->clock * 1000) > vc4_hdmi->variant->max_pixel_clock)
-		return MODE_CLOCK_HIGH;
-
-	if (vc4_hdmi->disable_4kp60 && vc4_hdmi_mode_needs_scrambling(mode))
-		return MODE_CLOCK_HIGH;
-
-	return MODE_OK;
+	return vc4_hdmi_encoder_clock_valid(vc4_hdmi, mode->clock * 1000);
 }
 
 static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
-- 
2.35.1

