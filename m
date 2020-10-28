Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA6129E5F4
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 09:13:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C286E891;
	Thu, 29 Oct 2020 08:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648A86E526
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 12:41:16 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id CF2E8580165;
 Wed, 28 Oct 2020 08:41:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 28 Oct 2020 08:41:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=PkuVMKGg+e6Ws
 gwn539mmTehhFrcUsy9ymqe7k7WIbU=; b=DZZQ8Z5BWf3bskv97k4rmtVhazdls
 8sVYeMpku0HnDM3I3gKFqjColgf2sq2fCNYLVLIfztWfF/VySTtIJRV4rbVAUGSq
 fyEb/Edm5frThw26Gv+JGBB1qFqLC67UX/ILl0p4ucrTh87AqP6/nJ66G+EtM6aV
 zfEGaYY35KEyIwcxLB5LNFZomltLGUy8mvdciIFq+OTbrUWbaDs0GuAsVT2YOYKd
 PQVp2in5BWs8qjY8TI+MA5GzBUgRcMrnPwC2sGoE7h59Jwcu6YNFpiADNnHafNMU
 k0JNHBHV6hMExPjERPJeSWFnYc6kbqpPvxua6VCuAtXipUmsOnKJ4rm5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=PkuVMKGg+e6Wsgwn539mmTehhFrcUsy9ymqe7k7WIbU=; b=pequQgtM
 94QpMi+hiXWYFrRgUgaFyAd83kLT+Pyq75bYcocJYuEVyWUE9RD3ZXoNNcfFVCWg
 hxrfZcjpsfFl9Vt9W6E5XQ63/sfbV/iZOPIxw4uYy08ZbPaHqYNYwzSNtmewx6e0
 XKqStDO+wg0qV9Rfr2ourP//zjst0oaLL+fNvNgcYE6b/x3OgdEMDC4daYf6Qq4O
 kJULnZQC/etULCrhN/342/MK4HhxIDce/fWAXxK1pECvi4rYFrh3UkIymM8ujzYP
 XPm1lc1ntqhvMX6a4fnNjsNRIk/C2qcQFmwwIRfS+JPDMnr6zgKSMsEesfT0b/Mb
 nGX7VwClEVWpTA==
X-ME-Sender: <xms:62aZXwTtVAqVXiIV3oJ0n6PAOXN1NoUjnmjdtUozdawGSsF1cURGgA>
 <xme:62aZX9yewPIkQheFWRH4Dm4vEtadaUet7pawa6HFQoBDWdUj2iT1hCg8LNb6Mh9ps
 2O7Xqb2tnmVLzkD9q8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrledugdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeefnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:62aZX92j7ZwUVb8tqbIFYxDcm2cOtLVPwnqKINYUjWN7RBMcxdbE4g>
 <xmx:62aZX0C_Bk352oOAPDculnm0UXjH8ZMCe4QOl4jTlSxAOZDFQyiV9A>
 <xmx:62aZX5iy9uYONGNDNGdIFEuak-owcnIeUgUVtfhZT5soEU2NgcxHhA>
 <xmx:62aZXxyP_0RfLwD6oQQKfgSnYnrRM1JCk1tka2IOEIJtgUXtz7jbxg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 561CE3280063;
 Wed, 28 Oct 2020 08:41:15 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 7/7] drm/vc4: kms: Don't disable the muxing of an active
 CRTC
Date: Wed, 28 Oct 2020 13:41:04 +0100
Message-Id: <469ead5de989938fcf079505cbc232a620e713bc.1603888799.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.3eb3532def69f3610b18104e45b7274bbdc1b0a0.1603888799.git-series.maxime@cerno.tech>
References: <cover.3eb3532def69f3610b18104e45b7274bbdc1b0a0.1603888799.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:12:48 +0000
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
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current HVS muxing code will consider the CRTCs in a given state to
setup their muxing in the HVS, and disable the other CRTCs muxes.

However, it's valid to only update a single CRTC with a state, and in this
situation we would mux out a CRTC that was enabled but left untouched by
the new state.

Fix this by setting a flag on the CRTC state when the muxing has been
changed, and only change the muxing configuration when that flag is there.

Fixes: 87ebcd42fb7b ("drm/vc4: crtc: Assign output to channel automatically")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h |  1 +-
 drivers/gpu/drm/vc4/vc4_kms.c | 84 +++++++++++++++++++++---------------
 2 files changed, 50 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index c6208b040f77..c074c0538e57 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -523,6 +523,7 @@ struct vc4_crtc_state {
 	struct drm_mm_node mm;
 	bool feed_txp;
 	bool txp_armed;
+	bool needs_muxing;
 	unsigned int assigned_channel;
 
 	struct {
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 2aa726b7422c..409aeb19d210 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -224,10 +224,7 @@ static void vc5_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 {
 	struct drm_crtc_state *crtc_state;
 	struct drm_crtc *crtc;
-	unsigned char dsp2_mux = 0;
-	unsigned char dsp3_mux = 3;
-	unsigned char dsp4_mux = 3;
-	unsigned char dsp5_mux = 3;
+	unsigned char mux;
 	unsigned int i;
 	u32 reg;
 
@@ -235,50 +232,59 @@ static void vc5_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 		struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc_state);
 		struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 
-		if (!crtc_state->active)
+		if (!vc4_state->needs_muxing)
 			continue;
 
 		switch (vc4_crtc->data->hvs_output) {
 		case 2:
-			dsp2_mux = (vc4_state->assigned_channel == 2) ? 0 : 1;
+			mux = (vc4_state->assigned_channel == 2) ? 0 : 1;
+			reg = HVS_READ(SCALER_DISPECTRL);
+			HVS_WRITE(SCALER_DISPECTRL,
+				  (reg & ~SCALER_DISPECTRL_DSP2_MUX_MASK) |
+				  VC4_SET_FIELD(mux, SCALER_DISPECTRL_DSP2_MUX));
 			break;
 
 		case 3:
-			dsp3_mux = vc4_state->assigned_channel;
+			if (vc4_state->assigned_channel == VC4_HVS_CHANNEL_DISABLED)
+				mux = 3;
+			else
+				mux = vc4_state->assigned_channel;
+
+			reg = HVS_READ(SCALER_DISPCTRL);
+			HVS_WRITE(SCALER_DISPCTRL,
+				  (reg & ~SCALER_DISPCTRL_DSP3_MUX_MASK) |
+				  VC4_SET_FIELD(mux, SCALER_DISPCTRL_DSP3_MUX));
 			break;
 
 		case 4:
-			dsp4_mux = vc4_state->assigned_channel;
+			if (vc4_state->assigned_channel == VC4_HVS_CHANNEL_DISABLED)
+				mux = 3;
+			else
+				mux = vc4_state->assigned_channel;
+
+			reg = HVS_READ(SCALER_DISPEOLN);
+			HVS_WRITE(SCALER_DISPEOLN,
+				  (reg & ~SCALER_DISPEOLN_DSP4_MUX_MASK) |
+				  VC4_SET_FIELD(mux, SCALER_DISPEOLN_DSP4_MUX));
+
 			break;
 
 		case 5:
-			dsp5_mux = vc4_state->assigned_channel;
+			if (vc4_state->assigned_channel == VC4_HVS_CHANNEL_DISABLED)
+				mux = 3;
+			else
+				mux = vc4_state->assigned_channel;
+
+			reg = HVS_READ(SCALER_DISPDITHER);
+			HVS_WRITE(SCALER_DISPDITHER,
+				  (reg & ~SCALER_DISPDITHER_DSP5_MUX_MASK) |
+				  VC4_SET_FIELD(mux, SCALER_DISPDITHER_DSP5_MUX));
 			break;
 
 		default:
 			break;
 		}
 	}
-
-	reg = HVS_READ(SCALER_DISPECTRL);
-	HVS_WRITE(SCALER_DISPECTRL,
-		  (reg & ~SCALER_DISPECTRL_DSP2_MUX_MASK) |
-		  VC4_SET_FIELD(dsp2_mux, SCALER_DISPECTRL_DSP2_MUX));
-
-	reg = HVS_READ(SCALER_DISPCTRL);
-	HVS_WRITE(SCALER_DISPCTRL,
-		  (reg & ~SCALER_DISPCTRL_DSP3_MUX_MASK) |
-		  VC4_SET_FIELD(dsp3_mux, SCALER_DISPCTRL_DSP3_MUX));
-
-	reg = HVS_READ(SCALER_DISPEOLN);
-	HVS_WRITE(SCALER_DISPEOLN,
-		  (reg & ~SCALER_DISPEOLN_DSP4_MUX_MASK) |
-		  VC4_SET_FIELD(dsp4_mux, SCALER_DISPEOLN_DSP4_MUX));
-
-	reg = HVS_READ(SCALER_DISPDITHER);
-	HVS_WRITE(SCALER_DISPDITHER,
-		  (reg & ~SCALER_DISPDITHER_DSP5_MUX_MASK) |
-		  VC4_SET_FIELD(dsp5_mux, SCALER_DISPDITHER_DSP5_MUX));
 }
 
 static void
@@ -769,21 +775,29 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
 		return -EINVAL;
 
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
+		struct vc4_crtc_state *old_vc4_crtc_state =
+			to_vc4_crtc_state(old_crtc_state);
 		struct vc4_crtc_state *new_vc4_crtc_state =
 			to_vc4_crtc_state(new_crtc_state);
 		struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 		unsigned int matching_channels;
 
-		if (old_crtc_state->enable && !new_crtc_state->enable) {
-			hvs_state->unassigned_channels |= BIT(old_vc4_crtc_state->assigned_channel);
-			new_vc4_crtc_state->assigned_channel = VC4_HVS_CHANNEL_DISABLED;
+		/* Nothing to do here, let's skip it */
+		if ((old_crtc_state->enable && new_crtc_state->enable) ||
+		    (!old_crtc_state->enable && !new_crtc_state->enable)) {
+			new_vc4_crtc_state->needs_muxing = false;
+			continue;
 		}
 
-		if (!new_crtc_state->enable)
-			continue;
+		/* Muxing will need to be modified, mark it as such */
+		new_vc4_crtc_state->needs_muxing = true;
 
-		if (new_vc4_crtc_state->assigned_channel != VC4_HVS_CHANNEL_DISABLED)
+		/* If we're disabling our CRTC, we put back our channel */
+		if (old_crtc_state->enable && !new_crtc_state->enable) {
+			hvs_state->unassigned_channels |= BIT(old_vc4_crtc_state->assigned_channel);
+			new_vc4_crtc_state->assigned_channel = VC4_HVS_CHANNEL_DISABLED;
 			continue;
+		}
 
 		/*
 		 * The problem we have to solve here is that we have
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
