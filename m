Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B87956B6B3
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03793113884;
	Fri,  8 Jul 2022 09:59:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A97113884
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:59:04 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id C0EC732009DD;
 Fri,  8 Jul 2022 05:59:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 08 Jul 2022 05:59:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274343; x=1657360743; bh=k2
 FhxsV9mPWPbH1EYTOLAvFcz7yB/Z3YF3ju3GvOnPM=; b=e4myHfQW5INzSUjU0Z
 SYXivCMJtIDhtG7R8yVI/QakVj9fw/P/vMsJeO33tbYbj5r90TEhb5OG2AyLuEeW
 5Y+x+F4vYho7RZe7rNNVmssvH5/m9rll5P3HMyPs9xEBExdDFjV/BakZnLWCu7mF
 BO/UzHxLs2eiT6E2DTGwH1ntfu7RNfudOuCsN99n+PJrPU48PNHZVn4zF0+Anefi
 yVmX2IySVGcsfLcPkKqv4d9W2EUv9uzpKQIJfCGuxYJbAW7EefQDsUcK2l3b9lWH
 s0efsO5Sd6HodzG9ZAIOJbk8PxZ30xSz2Gkz0INe0M2MT9UglxGxKS2EMypWaq7H
 V1Ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274343; x=1657360743; bh=k2FhxsV9mPWPb
 H1EYTOLAvFcz7yB/Z3YF3ju3GvOnPM=; b=cti5/nKX66DADBPO0lYZBLHOexJ1t
 Vq2DTzUbnp8bPVOOxmDJeyZmHtx5tWFfkEr8DA4VXDUkSzXSg8jInmbADqLUO6fO
 nCr+XxviKwOVPxpgl0sBEXMRnu6vziP+EvVIGFKym0+FmFEcFqYAkge4Tun1BXmM
 oDWAppeH+66kGx+Qtuh877ZvpPfrBvFXCBC9J3IwCmd83XjLjvUZZaWbIBffyi/Y
 wnwBVAUl2yqhpEnr/UbQny0AXybpd318le+k8C3MbLsTeK28IQ0wFeAlDo7ogXPS
 ua9uwbbpcnc2fljvsYldMos6BG/QFVdj6silfqEgxrgYEWVmuu97MS/pg==
X-ME-Sender: <xms:5__HYgt99_kivLTp6BrqpF400c4ZFe88z796lCRg7bx7avS0DKv6bQ>
 <xme:5__HYtc70uC5gddhKwu90ndha7hVmRkeYnvWj93fwVQEVQJt8ksEiVwFwDoV5eWxq
 JutEZ4NpBoUgizMLXo>
X-ME-Received: <xmr:5__HYrz82i7d3kUIocdHRBdzVu8AiRv6_ttPGUVfn0do66g7a312yoM8-_xoneQk32DcHABhxLU0XgF3iGuG1zIAFFXwHI_6ldTNDQ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:5__HYjPwgfwVNDUTUzX10P5nwWT3U-honRQrWinfMH_qGlqYxRYZ7A>
 <xmx:5__HYg_caCb4BCkcgWiFFzgsdlCVH7xltqvT4bWDvvMFcszBjYOUjQ>
 <xmx:5__HYrXIFfFZRMXD1yywqYCi4IKv7mbnRsvdHCAMsEu_xRaw8ipTMw>
 <xmx:5__HYkaPZSanKt5f_AFsViL-WujVTE9IoM6G0UvlYBRwTr3nid18KQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:59:02 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 38/69] drm/vc4: hdmi: Remove call to
 drm_connector_unregister()
Date: Fri,  8 Jul 2022 11:56:36 +0200
Message-Id: <20220708095707.257937-39-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_connector_unregister() is only to be used for connectors that have been
registered through drm_connector_register() after drm_dev_register() has
been called. This is our case here so let's remove the call.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 5681fafa4271..a0b4f75a8085 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -267,12 +267,6 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 	return connector_status_disconnected;
 }
 
-static void vc4_hdmi_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-}
-
 static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 {
 	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
@@ -380,7 +374,7 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
 	.detect = vc4_hdmi_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = vc4_hdmi_connector_destroy,
+	.destroy = drm_connector_cleanup,
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = vc4_hdmi_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -3023,7 +3017,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 err_free_hotplug:
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 err_destroy_conn:
-	vc4_hdmi_connector_destroy(&vc4_hdmi->connector);
+	drm_connector_cleanup(&vc4_hdmi->connector);
 err_destroy_encoder:
 	drm_encoder_cleanup(encoder);
 	pm_runtime_put_sync(dev);
@@ -3067,7 +3061,7 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	vc4_hdmi_audio_exit(vc4_hdmi);
 	vc4_hdmi_cec_exit(vc4_hdmi);
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
-	vc4_hdmi_connector_destroy(&vc4_hdmi->connector);
+	drm_connector_cleanup(&vc4_hdmi->connector);
 	drm_encoder_cleanup(&vc4_hdmi->encoder.base);
 
 	pm_runtime_disable(dev);
-- 
2.36.1

