Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD9664597B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 12:56:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E642610E3A0;
	Wed,  7 Dec 2022 11:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B4310E39B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 11:55:36 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id EF51B5C01BF;
 Wed,  7 Dec 2022 06:55:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 07 Dec 2022 06:55:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1670414135; x=
 1670500535; bh=Wm2sdSf8u2q2uQlXhqnmSxLJ4nHWBcCS1Wr6SNkE9cg=; b=D
 s5+LsKeA/mXx7512s56pQK5x4ldUNcS5XPL6+zCoUZGm0fEkUV+LIX3nqm3tlk6O
 Y/vZiT3A525yht4LOkwDbKo104g6sesecN1VgYRJ9t+7r2FMrQ5JfbTCw9OLHqgn
 1XZi+bvu3sLhmPPN81nEkrsS8o8385ngQAHxQ233rMNmDLGaIWQZw5SrbPxusN+A
 ZhDLB1L4tvP4pyujNgW3FHZizTQFDemNnf0UTlySVk70sKjXm1BoigMxRbbhtXVl
 va0DOgfpvGOXA+I18hgJLC2TDSwQRj0BpWbauKriEzbNz+6TLqc30Vl2PKu6F7lM
 aO2tLBbglCqYkKYEQMa/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670414135; x=
 1670500535; bh=Wm2sdSf8u2q2uQlXhqnmSxLJ4nHWBcCS1Wr6SNkE9cg=; b=a
 tdm9i4e4UcLJpm0mUNzKi1LE4eTMPQLEkzQpJg1UK30xVf1xmUz1hb7qtLMy7U5O
 wX3QyATDTpOK8CJEEih0oNjt91dBXP4T/iBcXjY6zBoGaQ9NaRQDZdgWWzcvPW7I
 90+wOU2nXAQ7JYrXCqgrmsLg7DlYL5vaWeiMsCj8KTy1bpD0ZQayB4bVZhPjrF+p
 Qc8phaEda0jixrbxu47mg0AW6CtoDPAES+lshtciAFV2C2QKHvYYov1sATPcIPT/
 u3FDI5B501wjPdhEla5T2DLGzrMjVdYgJUAlF2sFPLvZqpKWUyTOA1Hv2x/rZdc1
 ZZnBoHk37zD3n9O76Z0Lw==
X-ME-Sender: <xms:N3-QY5eR8xo6ivSfFoGl3Byy_EhXc-OWvPVUUeL4WsJmK7CNoyfoEQ>
 <xme:N3-QY3PDrL9v656TvrJltwnvyhoAA2AKKVZdstFiQ4DLESK8BHkA9RPKw71WMdBfd
 A_1C8Sf6Ub9yX1SGtA>
X-ME-Received: <xmr:N3-QYyjijLNouGdIAVy4AUPW4eYAxqEnSt7d6W82CAC4IL0azCJveZ8FmKHKk_1xG92PWg4U1mDWUOPejfSrDMw1PdMyqQmxHYbK5mDQR0D-pQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevvdelieejgedvkeffheekheeilefhgefgffehteekueelvddtueffheet
 ledtffenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:N3-QYy-n73fpoG1gIx8LgWnxKT2VUqila7b9Y2p6osJ4x4GBvDgFVQ>
 <xmx:N3-QY1st1n7AN0M2ABZNIADk3Q3aJwdTpzNXQsMS3Rn2oEEV_9eDaQ>
 <xmx:N3-QYxGuu6g_wFYfASlUQV3dxDC32R6xme8zR88WQRGJdjbH7wo5vQ>
 <xmx:N3-QYwmCH-6KiCIsS5qtPMkaOZ399pg2r0v63RG7xNCpAe1YLcKvOw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 06:55:35 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 12:53:24 +0100
Subject: [PATCH 13/15] drm/vc4: crtc: Fix timings for VEC modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hvs-crtc-misc-v1-13-1f8e0770798b@cerno.tech>
References: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
In-Reply-To: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Eric Anholt <eric@anholt.net>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=4655; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=8MEVk2yY+UhcSNlj2wPChZWHKoYLQ+Me0jsSJnr2jVI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkT6lYuCKsze6d1LOCZqXF9zfxDfxLnCF74IHFhQVJvfubc
 P45OHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjIy+sM/4sORgsw396aeXB50vGamx
 yHioN5KldJ32fz235/c/IKT0+G/xVmt1+43F11OOqO3endHT8nKVZ/Zf0SunDH/QfCsjsY1BgB
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Maxime Ripard <maxime@cerno.tech>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>

This commit fixes vertical timings of the VEC (composite output) modes
to accurately represent the 525-line ("NTSC") and 625-line ("PAL") ITU-R
standards.

Previous timings were actually defined as 502 and 601 lines, resulting
in non-standard 62.69 Hz and 52 Hz signals being generated,
respectively.

Changes to vc4_crtc.c have also been made, to make the PixelValve
vertical timings accurately correspond to the DRM modeline in interlaced
modes. The resulting VERTA/VERTB register values have been verified
against the reference values set by the Raspberry Pi firmware.

Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 71 ++++++++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 333529ed3a0d..91181cac01e4 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -326,8 +326,14 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_encoder *encode
 	bool is_dsi = (vc4_encoder->type == VC4_ENCODER_TYPE_DSI0 ||
 		       vc4_encoder->type == VC4_ENCODER_TYPE_DSI1);
 	bool is_dsi1 = vc4_encoder->type == VC4_ENCODER_TYPE_DSI1;
+	bool is_vec = vc4_encoder->type == VC4_ENCODER_TYPE_VEC;
 	u32 format = is_dsi1 ? PV_CONTROL_FORMAT_DSIV_24 : PV_CONTROL_FORMAT_24;
 	u8 ppc = pv_data->pixels_per_clock;
+
+	u16 vert_bp = mode->crtc_vtotal - mode->crtc_vsync_end;
+	u16 vert_sync = mode->crtc_vsync_end - mode->crtc_vsync_start;
+	u16 vert_fp = mode->crtc_vsync_start - mode->crtc_vdisplay;
+
 	bool debug_dump_regs = false;
 	int idx;
 
@@ -355,49 +361,60 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_encoder *encode
 		   VC4_SET_FIELD(mode->hdisplay * pixel_rep / ppc,
 				 PV_HORZB_HACTIVE));
 
-	CRTC_WRITE(PV_VERTA,
-		   VC4_SET_FIELD(mode->crtc_vtotal - mode->crtc_vsync_end +
-				 interlace,
-				 PV_VERTA_VBP) |
-		   VC4_SET_FIELD(mode->crtc_vsync_end - mode->crtc_vsync_start,
-				 PV_VERTA_VSYNC));
-	CRTC_WRITE(PV_VERTB,
-		   VC4_SET_FIELD(mode->crtc_vsync_start - mode->crtc_vdisplay,
-				 PV_VERTB_VFP) |
-		   VC4_SET_FIELD(mode->crtc_vdisplay, PV_VERTB_VACTIVE));
-
 	if (interlace) {
+		bool odd_field_first = false;
+		u32 field_delay = mode->htotal * pixel_rep / (2 * ppc);
+		u16 vert_bp_even = vert_bp;
+		u16 vert_fp_even = vert_fp;
+
+		if (is_vec) {
+			/* VEC (composite output) */
+			++field_delay;
+			if (mode->htotal == 858) {
+				/* 525-line mode (NTSC or PAL-M) */
+				odd_field_first = true;
+			}
+		}
+
+		if (odd_field_first)
+			++vert_fp_even;
+		else
+			++vert_bp;
+
 		CRTC_WRITE(PV_VERTA_EVEN,
-			   VC4_SET_FIELD(mode->crtc_vtotal -
-					 mode->crtc_vsync_end,
-					 PV_VERTA_VBP) |
-			   VC4_SET_FIELD(mode->crtc_vsync_end -
-					 mode->crtc_vsync_start,
-					 PV_VERTA_VSYNC));
+			   VC4_SET_FIELD(vert_bp_even, PV_VERTA_VBP) |
+			   VC4_SET_FIELD(vert_sync, PV_VERTA_VSYNC));
 		CRTC_WRITE(PV_VERTB_EVEN,
-			   VC4_SET_FIELD(mode->crtc_vsync_start -
-					 mode->crtc_vdisplay,
-					 PV_VERTB_VFP) |
+			   VC4_SET_FIELD(vert_fp_even, PV_VERTB_VFP) |
 			   VC4_SET_FIELD(mode->crtc_vdisplay, PV_VERTB_VACTIVE));
 
-		/* We set up first field even mode for HDMI.  VEC's
-		 * NTSC mode would want first field odd instead, once
-		 * we support it (to do so, set ODD_FIRST and put the
-		 * delay in VSYNCD_EVEN instead).
+		/* We set up first field even mode for HDMI and VEC's PAL.
+		 * For NTSC, we need first field odd.
 		 */
 		CRTC_WRITE(PV_V_CONTROL,
 			   PV_VCONTROL_CONTINUOUS |
 			   (is_dsi ? PV_VCONTROL_DSI : 0) |
 			   PV_VCONTROL_INTERLACE |
-			   VC4_SET_FIELD(mode->htotal * pixel_rep / (2 * ppc),
-					 PV_VCONTROL_ODD_DELAY));
-		CRTC_WRITE(PV_VSYNCD_EVEN, 0);
+			   (odd_field_first
+				   ? PV_VCONTROL_ODD_FIRST
+				   : VC4_SET_FIELD(field_delay,
+						   PV_VCONTROL_ODD_DELAY)));
+		CRTC_WRITE(PV_VSYNCD_EVEN,
+			   (odd_field_first ? field_delay : 0));
 	} else {
 		CRTC_WRITE(PV_V_CONTROL,
 			   PV_VCONTROL_CONTINUOUS |
 			   (is_dsi ? PV_VCONTROL_DSI : 0));
+		CRTC_WRITE(PV_VSYNCD_EVEN, 0);
 	}
 
+	CRTC_WRITE(PV_VERTA,
+		   VC4_SET_FIELD(vert_bp, PV_VERTA_VBP) |
+		   VC4_SET_FIELD(vert_sync, PV_VERTA_VSYNC));
+	CRTC_WRITE(PV_VERTB,
+		   VC4_SET_FIELD(vert_fp, PV_VERTB_VFP) |
+		   VC4_SET_FIELD(mode->crtc_vdisplay, PV_VERTB_VACTIVE));
+
 	if (is_dsi)
 		CRTC_WRITE(PV_HACT_ACT, mode->hdisplay * pixel_rep);
 

-- 
2.38.1
