Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22490376792
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 17:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2816EE59;
	Fri,  7 May 2021 15:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C9E6EE59
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 15:05:51 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 259CF13C9;
 Fri,  7 May 2021 11:05:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 07 May 2021 11:05:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=o1vpHM69iACxU
 rvA0TPL4rBHHWdBe/oK79kIF0/XkL4=; b=N7zGu5Lxb19VVWfy6Pq1O7IrickUn
 9aaqPDRRqCzCuFlKCw2i8ECOSWEdLpV8dBPOIyfcBZ73fELaQamh72TOhifchsSJ
 F9flPYkt7q28Fh9XZh+sL0CJ9rZsIhQ02O5K+agCVM0eMbKnI9uY+EQmTwNR9mO5
 43AsBKwTWl87WwYdGGO7L1ZMq6Xtr9CNisszQ6IemHqyuLW5+LexKF81TgcChl9l
 G+9DmRmChYma50/bbQ5CT87SUtYJsD5Eaj+jzxCXbMTjVqHglI5OgTBuouDp7A2t
 QMbfIwUBIEYfRNqiWlGVphs2sejzO9dSdtwk5V5zoAvjz1sR8psIZH5pA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=o1vpHM69iACxUrvA0TPL4rBHHWdBe/oK79kIF0/XkL4=; b=nXjtpmqI
 DtTDmz+4oQwrx5U2nVyF9uVvxb0MNedsKZSg1vfvXVU2UhBOuAw/VoK3b95AJJmD
 9Wr4lRrEwtH7r1nfqMDE7hfWQx/zXgzkRDQqhsLK5XOziQhoKsjU23q65X/25gQn
 wQSNFCRRz17PObNbFZOnjsFTQHEzPDYXtYlg2uWJQxAMkbqSVXyF4Gz5T1dXE7Pf
 gjA64o+yj2e/C4sHgKZEtplxfoHhJ7hqJX0DWEQmoMX4cZqfSRlglcKJcAQ/dKHX
 XO4eQ97yivqeSOhKbg1cRYJJzpsRzbccUh8nzZaCFKWxDwW24PmZ2KW7suMcuc4a
 zU4oyTCJr0fxdw==
X-ME-Sender: <xms:TFeVYKilUz3GrSCQ6RQT7jnrup453COTrzQxn4CAnc8cGJSWTNNfSQ>
 <xme:TFeVYLCUSPJblZqqf741sGUGuKtCDTyg27LEtnzkXQ7OmVsArkeUr_To62svqgEIH
 wqZkcsQZeMOMqJgHxU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegvddgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:TFeVYCHHHQhFrZvD4k0UWIDREJjgxU5tV6kCukj34Kxms4ulgUYMtw>
 <xmx:TFeVYDTb5Kptzdup0zYVeuCjDarRrpox4ZQb4XH4OuGMf6_5B8GBzw>
 <xmx:TFeVYHzRlchNAKVspHCdZJd8j_X1wd-XzaE_WbpnJiFdW0OJEsz-eg>
 <xmx:TVeVYKo7mtUXDVJA9v79s6PMaCzEjfZSHriI_m8rlYHqcTDF8UUWAHrDrkA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri,  7 May 2021 11:05:47 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH v4 05/12] drm/vc4: crtc: Lookup the encoder from the register
 at boot
Date: Fri,  7 May 2021 17:05:08 +0200
Message-Id: <20210507150515.257424-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210507150515.257424-1-maxime@cerno.tech>
References: <20210507150515.257424-1-maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At boot, we can't rely on the vc4_get_crtc_encoder since we don't have a
state yet and thus will not be able to figure out which connector is
attached to our CRTC.

However, we have a muxing bit in the CRTC register we can use to get the
encoder currently connected to the pixelvalve. We can thus read that
register, lookup the associated register through the vc4_pv_data
structure, and then pass it to vc4_crtc_disable so that we can perform
the proper operations.

Fixes: 875a4d536842 ("drm/vc4: drv: Disable the CRTC at boot time")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 38 ++++++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 36ea684a349b..f715648f89dd 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -413,11 +413,10 @@ static void require_hvs_enabled(struct drm_device *dev)
 }
 
 static int vc4_crtc_disable(struct drm_crtc *crtc,
+			    struct drm_encoder *encoder,
 			    struct drm_atomic_state *state,
 			    unsigned int channel)
 {
-	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, state,
-							   drm_atomic_get_old_connector_state);
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
@@ -458,10 +457,29 @@ static int vc4_crtc_disable(struct drm_crtc *crtc,
 	return 0;
 }
 
+static struct drm_encoder *vc4_crtc_get_encoder_by_type(struct drm_crtc *crtc,
+							enum vc4_encoder_type type)
+{
+	struct drm_encoder *encoder;
+
+	drm_for_each_encoder(encoder, crtc->dev) {
+		struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
+
+		if (vc4_encoder->type == type)
+			return encoder;
+	}
+
+	return NULL;
+}
+
 int vc4_crtc_disable_at_boot(struct drm_crtc *crtc)
 {
 	struct drm_device *drm = crtc->dev;
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+	enum vc4_encoder_type encoder_type;
+	const struct vc4_pv_data *pv_data;
+	struct drm_encoder *encoder;
+	unsigned encoder_sel;
 	int channel;
 
 	if (!(of_device_is_compatible(vc4_crtc->pdev->dev.of_node,
@@ -480,7 +498,17 @@ int vc4_crtc_disable_at_boot(struct drm_crtc *crtc)
 	if (channel < 0)
 		return 0;
 
-	return vc4_crtc_disable(crtc, NULL, channel);
+	encoder_sel = VC4_GET_FIELD(CRTC_READ(PV_CONTROL), PV_CONTROL_CLK_SELECT);
+	if (WARN_ON(encoder_sel != 0))
+		return 0;
+
+	pv_data = vc4_crtc_to_vc4_pv_data(vc4_crtc);
+	encoder_type = pv_data->encoder_types[encoder_sel];
+	encoder = vc4_crtc_get_encoder_by_type(crtc, encoder_type);
+	if (WARN_ON(!encoder))
+		return 0;
+
+	return vc4_crtc_disable(crtc, encoder, NULL, channel);
 }
 
 static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
@@ -489,6 +517,8 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
 	struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state,
 									 crtc);
 	struct vc4_crtc_state *old_vc4_state = to_vc4_crtc_state(old_state);
+	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, state,
+							   drm_atomic_get_old_connector_state);
 	struct drm_device *dev = crtc->dev;
 
 	require_hvs_enabled(dev);
@@ -496,7 +526,7 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
 	/* Disable vblank irq handling before crtc is disabled. */
 	drm_crtc_vblank_off(crtc);
 
-	vc4_crtc_disable(crtc, state, old_vc4_state->assigned_channel);
+	vc4_crtc_disable(crtc, encoder, state, old_vc4_state->assigned_channel);
 
 	/*
 	 * Make sure we issue a vblank event after disabling the CRTC if
-- 
2.31.1

