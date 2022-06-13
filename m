Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 190CD5485D7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF60D10E848;
	Mon, 13 Jun 2022 14:49:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8CF10E846
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:49:21 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 3E9F0320090B;
 Mon, 13 Jun 2022 10:49:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 13 Jun 2022 10:49:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131759; x=1655218159; bh=ms
 265eIbtpWCoYnEf+uoOKRHLwQGyfstqCaFkIRBqW8=; b=ePMTP6QF/QqXhz1Dri
 48LGoLXCoNkum922kdotqL05vOhfVV5hJVuTxWEF9guzX615i07k2lxYdXW3CZRy
 gD2nPmk56E9o8PAQszrv4d7nUvphoXjwTFh0R9g7jbNU/ZBjYN0iIUXGNTCteiKO
 RGSibGXD+FJWRJMeVlZHqZYWDBTNf5xZ9a93WB3NdyvU6VY8Cf3SrOR76E5WWvhs
 EtclbWo8Xght1+6jBIy/3scXmUHwqUYjDOnceBqfV3z/TBm1wPoB5OkMOWQSZ2rZ
 gPg7nFXcejsNAsQODE0wX4vXSszyaI1ZGImfK+Gp7sAy6mpSXgCdYKQsKjYd5Qkf
 yzaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131759; x=1655218159; bh=ms265eIbtpWCo
 YnEf+uoOKRHLwQGyfstqCaFkIRBqW8=; b=HRlNnYR5LKMd1Hnr9xiNnYrX0qa8v
 GhaFWtiXQkBf4BTu2JrmqhTfJCk+m7yrWC8jTQkQWd9zcM6Rbr9HqcZLXcOhlYdk
 thUpD94SQX+XaQ+VA4rQRVLOrycAmlZ3jx/FpAcA6BjDzvoShecuoRrO7+pWdYBZ
 Qa5Gr6M0BWXBizI5T+KcQG/La1k8Zmq3MaZu9OrMBi1ns3svxyxh3D4+l3LYS7P9
 BynGGmkymSVhn70NuHGdPOElCeYFb8ffIx3eVJiekVWNHI7iMQQb+FuzfI4+9lSS
 VYVOzfGdp6sBsvhJMQpNFTbdnHmM6yzo4zhapzBc2ZkAJwriGeOvFU8Gw==
X-ME-Sender: <xms:b06nYk9LsRBOQ--KL9op2B88BCTqbpVmlxUHaaP0wCHiKZBpHHv_Jg>
 <xme:b06nYssm8Js7zHmfXJVgIKEPxqSuInzU16tNIfoFEEgT6iUg3Bl58B5p1gTvDBMA7
 RLPYcGBzbZ5NIF2CHo>
X-ME-Received: <xmr:b06nYqA-n-x1a3xqcd3ILYNKim0QC825z8-7vVYEhb08sox6z8QqF877-YwM6Oy8nr61PyKprf7hiPxgccWY3AWoEiSWdu07WPHvCv0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:b06nYkfWdJJfrXGL-9TiSOzT7pjfvMnl4U3JkWUfuyIebnQpwF57JQ>
 <xmx:b06nYpPK-qsRyOmlBv8pUsrPyxjOShpQltREJIXbfeFwUgRXxalM9w>
 <xmx:b06nYunuMkakcfyWNQdp-Wr-QNeeW4JDQ64G8IIHxMhXsfq1iSXQFA>
 <xmx:b06nYs0klldrutxLkAr1AtkX08QxNo2zk5cMQUlyGlmLHN8WZDXq8Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:49:19 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 24/33] drm/vc4: hdmi: Stop checking for enabled output in audio
Date: Mon, 13 Jun 2022 16:47:51 +0200
Message-Id: <20220613144800.326124-25-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613144800.326124-1-maxime@cerno.tech>
References: <20220613144800.326124-1-maxime@cerno.tech>
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
Cc: Dom Cobley <popcornmix@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dom Cobley <popcornmix@gmail.com>

The current HDMI driver, in vc4_hdmi_audio_can_stream() checks whether
the display output is enabled.

This has been there in one form or the other since the introduction of
the audio support in the VC4 HDMI driver in commit bb7d78568814
("drm/vc4: Add HDMI audio support"), but no justification for this check
is in the commit message, or in the discussions around the patches.

One can only assume this was done to prevent a user from playing audio
on the ALSA soundcard when the monitor doesn't support it.

However, this is causing some issues. Indeed, Kodi, for example, was
hitting some errors if it was streaming audio during a modeset. With the
theory above, it does make sense, but the display and audio threads are
typically completely different processes with no opportunity to
synchronise which makes it hard to workaround.

Removing that check also doesn't seem to cause any trouble, so let's
just remove it.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 30 +++---------------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  6 ------
 2 files changed, 3 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 654c4116b669..0dc7e57715af 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -788,15 +788,6 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
 	mutex_unlock(&vc4_hdmi->mutex);
 }
 
-static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
-{
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-
-	mutex_lock(&vc4_hdmi->mutex);
-	vc4_hdmi->output_enabled = false;
-	mutex_unlock(&vc4_hdmi->mutex);
-}
-
 static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 			       struct drm_connector_state *state,
 			       const struct drm_display_mode *mode)
@@ -1370,15 +1361,6 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 	mutex_unlock(&vc4_hdmi->mutex);
 }
 
-static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
-{
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-
-	mutex_lock(&vc4_hdmi->mutex);
-	vc4_hdmi->output_enabled = true;
-	mutex_unlock(&vc4_hdmi->mutex);
-}
-
 static void vc4_hdmi_encoder_atomic_mode_set(struct drm_encoder *encoder,
 					     struct drm_crtc_state *crtc_state,
 					     struct drm_connector_state *conn_state)
@@ -1672,8 +1654,6 @@ static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
 	.atomic_check = vc4_hdmi_encoder_atomic_check,
 	.atomic_mode_set = vc4_hdmi_encoder_atomic_mode_set,
 	.mode_valid = vc4_hdmi_encoder_mode_valid,
-	.disable = vc4_hdmi_encoder_disable,
-	.enable = vc4_hdmi_encoder_enable,
 };
 
 static u32 vc4_hdmi_channel_map(struct vc4_hdmi *vc4_hdmi, u32 channel_mask)
@@ -1770,19 +1750,15 @@ static inline struct vc4_hdmi *dai_to_hdmi(struct snd_soc_dai *dai)
 
 static bool vc4_hdmi_audio_can_stream(struct vc4_hdmi *vc4_hdmi)
 {
-	lockdep_assert_held(&vc4_hdmi->mutex);
+	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
 
-	/*
-	 * If the controller is disabled, prevent any ALSA output.
-	 */
-	if (!vc4_hdmi->output_enabled)
-		return false;
+	lockdep_assert_held(&vc4_hdmi->mutex);
 
 	/*
 	 * If the encoder is currently in DVI mode, treat the codec DAI
 	 * as missing.
 	 */
-	if (!(HDMI_READ(HDMI_RAM_PACKET_CONFIG) & VC4_HDMI_RAM_PACKET_ENABLE))
+	if (!display->is_hdmi)
 		return false;
 
 	return true;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 1520387b317f..1159b2992fb1 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -212,12 +212,6 @@ struct vc4_hdmi {
 	 */
 	struct drm_display_mode saved_adjusted_mode;
 
-	/**
-	 * @output_enabled: Is the HDMI controller currently active?
-	 * Protected by @mutex.
-	 */
-	bool output_enabled;
-
 	/**
 	 * @scdc_enabled: Is the HDMI controller currently running with
 	 * the scrambler on? Protected by @mutex.
-- 
2.36.1

