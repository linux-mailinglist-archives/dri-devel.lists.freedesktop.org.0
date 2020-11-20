Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A6A2BBEBA
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 12:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D856E9A4;
	Sat, 21 Nov 2020 11:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C2D6E8C9
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 14:42:52 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id B192E58011B;
 Fri, 20 Nov 2020 09:42:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 20 Nov 2020 09:42:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=1UWp71fRzO/I5
 A31TsRlv85FbVFIfey/nLGoNf17D3w=; b=cGBrjmy6JzCRjg2/h+1D1Z8esMSV3
 +oSLIh/CG2cSJMcJ2EZczubRhmu1EkJBjU2GTlW/zrLIK9Og/JN3fTS6k+qFuXLl
 XgxNIVfKef7PY0Vruh6U0mcTk02agh0z7RDowPABEyo0qvAEXJgDbs3PxHWXSjI7
 fSUvUAjzn7sri48g08Y5t1sjsWZgX/rrKTs4z56w2gjQ+jAOtp4P1FMf+A2u+/qY
 vmCgMg4akC3qyxkIt8/0t5ePddLc9V3MVXmKOzljbOL2cIgzMmjrLdGlfn5Kjk9v
 LyKlBp3G4aQxVuwhTKtE6cMC0eo2M8+sxzg8thQFDpM/1UpKgHYF8DB8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=1UWp71fRzO/I5A31TsRlv85FbVFIfey/nLGoNf17D3w=; b=EWegZPbS
 VlY4JbukY+tH7bG4pJPZ1C8cny+B0msy/1EwLw6pdFMbNWL5BFfQmbmBOh5oYngM
 s8JWbnzYzDviXlOKBuoeocNrczw23Xua63TI6naoTjBAKZOyhiGoZ770PTrgZrA3
 aSaijxq/5w14qiAuBh7cGvTfFvOv2OKyuRFionz01npRUk6Ym5iqcMbQkQ7rWpCd
 p4cuscV7qLVmQhlmYEVjBJfLElcKK7Ks6O8E8GFU9cikVFcIZU7RCemmkk7A4HkH
 LtH7E9A869t3TknreLkCdnRJooDnDHNrIAs5cS0gx5w0uSJfNxZS+LJJbC+buJJE
 2qIZ+tIJRK0KDg==
X-ME-Sender: <xms:6tW3X9WkV_jCuI1Co61Vbr1RUNrDEmfkyv_tYHHybqDfgdH59FaNSQ>
 <xme:6tW3X9moum1gGvVzOAlXB15VPn6JiDoG7D8EeLj-ikGEDX3e16lxWBBGOlUqGXkM5
 rekLT3YMfYAbtkIJ74>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudegtddgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:6tW3X5YymTmtAoG-IutpgQA-GgVqFGS_P2BQq21DZsg9EZ0gQBksZQ>
 <xmx:6tW3XwW62CRPlcSSayiObvNvkqXcdsu_xg3UlALN_-N7vMYlb2M-Dw>
 <xmx:6tW3X3l2R3aiMfjyk8-qSShtqt21jnkDOmCOZyh4M_OTC1xyirTmsg>
 <xmx:6tW3X1d6C0lC8o5c-1EjdOfm-7Xl0sYeewBEacTr9XSjWhSNnIAkLA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2A0073064AB7;
 Fri, 20 Nov 2020 09:42:50 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 2/2] drm/vc4: kms: Don't disable the muxing of an active
 CRTC
Date: Fri, 20 Nov 2020 15:42:45 +0100
Message-Id: <20201120144245.398711-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201120144245.398711-1-maxime@cerno.tech>
References: <20201120144245.398711-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 21 Nov 2020 11:34:30 +0000
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
Reviewed-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h |  3 ++
 drivers/gpu/drm/vc4/vc4_kms.c | 81 +++++++++++++++++++----------------
 2 files changed, 48 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index fcfeef0949af..c5f2944d5bc6 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -532,6 +532,9 @@ struct vc4_crtc_state {
 		unsigned int top;
 		unsigned int bottom;
 	} margins;
+
+	/* Transitional state below, only valid during atomic commits */
+	bool update_muxing;
 };
 
 #define VC4_HVS_CHANNEL_DISABLED ((unsigned int)-1)
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 0bbd7b554275..ba310c0ab5f6 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -239,10 +239,7 @@ static void vc5_hvs_pv_muxing_commit(struct vc4_dev *vc4,
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
 
@@ -250,50 +247,59 @@ static void vc5_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 		struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc_state);
 		struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 
-		if (!crtc_state->active)
+		if (!vc4_state->update_muxing)
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
@@ -789,17 +795,20 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
 		struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 		unsigned int matching_channels;
 
-		if (old_crtc_state->enable && !new_crtc_state->enable) {
+		/* Nothing to do here, let's skip it */
+		if (old_crtc_state->enable == new_crtc_state->enable)
+			continue;
+
+		/* Muxing will need to be modified, mark it as such */
+		new_vc4_crtc_state->update_muxing = true;
+
+		/* If we're disabling our CRTC, we put back our channel */
+		if (!new_crtc_state->enable) {
 			hvs_new_state->unassigned_channels |= BIT(old_vc4_crtc_state->assigned_channel);
 			new_vc4_crtc_state->assigned_channel = VC4_HVS_CHANNEL_DISABLED;
+			continue;
 		}
 
-		if (!new_crtc_state->enable)
-			continue;
-
-		if (new_vc4_crtc_state->assigned_channel != VC4_HVS_CHANNEL_DISABLED)
-			continue;
-
 		/*
 		 * The problem we have to solve here is that we have
 		 * up to 7 encoders, connected to up to 6 CRTCs.
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
