Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E3D495132
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 16:16:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1FC10E440;
	Thu, 20 Jan 2022 15:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D455810E44D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 15:16:50 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 7BE682B00152;
 Thu, 20 Jan 2022 10:16:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 20 Jan 2022 10:16:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=BrE13et0eLLCZ74ghKagtV2SNp3FTE
 EFdkcyhyLiayM=; b=Wn2mRbBJI4ypXjJEqEh090IHL7UMLnyDP9JsNoWrjYUR5O
 FZAJ+PrsRgiZwWHSPyt3lQIokeTUtwMUUyLMnYweMllEpiU3ZiYT4Zeh0ks4eVS2
 tJRywG4HOW7GpKjUppbJvCkfUxaqYb9uxXl7ioBJmyynoYjHVURPpOhZWH2Q1Q1z
 Z24eOccL4mPpG1zyN/Y1ACw7l4xmCq/Z8IEyopySaxxe3FB9nlYj71A1udnt1k9s
 wAVZ/GrWpBh1vMMCNRt58Vpmw5EMtlWUb5AgRS1qIfp0LDDz6ysUV+oUqQLMS6SS
 QLh3vqDzXD7patJXEiQruUHW/wajV4UNtDHmPWTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=BrE13e
 t0eLLCZ74ghKagtV2SNp3FTEEFdkcyhyLiayM=; b=QBHqp01lYhD8DXTsJVhAFS
 XZjZLLzYaH1KSUsUpZhTFPWWZmi6mcFZ1/5JVFyU6jDPDhlgUUrbZ5gOTtL9esml
 W7hEdhmb9DwiKlCbXnk9QXwZsVRE7y+A38kQUgGouY4S1+mKUPj1bcIYNuS9mEEe
 dpTPC9Fo6MjFNXsNtDL11jv82r15F13VKZPXPZ4ESmzChcuVNtxreD9bhDLqr4hU
 c+1GmUA7vBrNxfDFe0VboFsCZU3t8Ll603FqyN98RGnuptdsgF8DE0j0/2bQzHJ2
 h9S3XIinR990ono083UcBJwv/MKjoQCs75ByT59mOVkk+yUOy9kSJmIQqAwNUpoA
 ==
X-ME-Sender: <xms:4HzpYV5HAuvKBFoPnfrF9GSgq-8z_YeXn7HHG633xhNzz9Q3_2uTsQ>
 <xme:4HzpYS7ztLKUv8x5xs9CruvY5vwixHdsg0QOjuHavfPDoqGfFSP05kHJT1V_EF0S4
 MNHYJ-Ag75NuTt2vCo>
X-ME-Received: <xmr:4HzpYcc2T7OQY0WZQEvak3OCsi39RkZ4eVIrTw70oM64_t5LzFyOQ695lfKm9cHlB7mdDuI9NVvoLNS57KCf-noxTTi2SKPGwuosflQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:4HzpYeKISNpOwWoO_nyZNhCM-NiZeGXQvPfRrWE_iY6oYrn5U-8JuA>
 <xmx:4HzpYZIYeYQOirT6MVOB5glggaV_Yz2OqaTHKptr8dRm4GtTTcWA1A>
 <xmx:4HzpYXw-IfeNhWdq1cjGVSRqQ8ZSCIzX1ZLEUjiPXONTzgr3DKCIig>
 <xmx:4XzpYWDzfgdPdZ4YOhlgElyIXPIzXqvBZtA2vUeXDgQ2MQ-odsJpXqJPLqM>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 10:16:48 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 05/16] drm/vc4: hdmi: Add full range RGB helper
Date: Thu, 20 Jan 2022 16:16:14 +0100
Message-Id: <20220120151625.594595-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120151625.594595-1-maxime@cerno.tech>
References: <20220120151625.594595-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We're going to need to tell whether we want to run with a full or
limited range RGB output in multiple places in the code, so let's create
a helper that will return whether we need with full range or not.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index be39e55ae113..7966e3b00332 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -104,6 +104,15 @@ static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode)
 	return (mode->clock * 1000) > HDMI_14_MAX_TMDS_CLK;
 }
 
+static bool vc4_hdmi_is_full_range_rgb(struct vc4_hdmi *vc4_hdmi,
+				       const struct drm_display_mode *mode)
+{
+	struct vc4_hdmi_encoder *vc4_encoder = &vc4_hdmi->encoder;
+
+	return !vc4_encoder->hdmi_monitor ||
+		drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_FULL;
+}
+
 static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
@@ -1119,8 +1128,7 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 
 	mutex_lock(&vc4_hdmi->mutex);
 
-	if (vc4_encoder->hdmi_monitor &&
-	    drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_LIMITED) {
+	if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode)) {
 		if (vc4_hdmi->variant->csc_setup)
 			vc4_hdmi->variant->csc_setup(vc4_hdmi, true);
 
-- 
2.34.1

