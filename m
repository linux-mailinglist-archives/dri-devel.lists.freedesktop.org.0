Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 975C91E599B
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923FF6E488;
	Thu, 28 May 2020 07:44:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059296E33A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:50:28 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6E7ED58208B;
 Wed, 27 May 2020 11:50:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:50:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=GAOeZq/xDTflc
 6+P9LvBBHtQ9OlNDddl/lapwGwoANs=; b=cgimq93HzfgKRS6nQic9ZXJgcznq7
 feFRMqB03YBMQWWq1b+bVSj/YpqnQTTZ7qI/hAGiApbVOvzABTMYmil/xS+cwHBh
 +D8XXng7/de7pN5Et12Zz8Tc/QjEo72vIlwKzhd6lbv3kOje/4dD8/USN+39+ngD
 fNtOwzNhogquofQl2hFmoGeQmTBKHsCArTKtNYc3ZlzObMoFmBYuMtZnkw5ZzEOo
 /+xKjrtiEgFIWSfMTD/tI06w5MjLrMck6Es+btliBSX1d4l84IuD4vLKwd5Ps6XP
 Jpg3hw8Kiyd1RUYZyOXImYgaIhr5+KwgdnwqBrcHpWUDL+NNIzK5k00dQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=GAOeZq/xDTflc6+P9LvBBHtQ9OlNDddl/lapwGwoANs=; b=kmDEp8eU
 cmwjzM9Z1zO8xSDTSEJDUHynohjfK1PCbcxanoMa04/A4xa76ipoMndA3kMONFgj
 UJSVySYgPcZBcF+PcyDFz7UrGWGGCZLxI/auSl2WNmdE15F7EmjkQY6Hf69qvgOx
 qVjFCaFIz0xzCsi7YJf4jg1/EbzPvo5116RzPJNqAASIb+vzOg0ugWHkNEF3sln+
 uUhtpIArAszMcUHKgVIUWAEMi0BbTW2emtgsNUE7T0xKqneO+p9lUOK19MeI+iVa
 2EhrsqTp1Ol3cXCBicFLTb8k+paI27u7lxv1lTT4Y97H8rNvc14wgOOKqiSBeCrr
 NpY128nQ9VdBXw==
X-ME-Sender: <xms:Q4zOXkazRh37YV4SnK8xjokLg1tb7ezshx9C5MikkgMutmHCvhmCIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvdehne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Q4zOXvZUqTwumq3GQPgyl_IwNuKVir2V-YsRGrinksEbnIO9FYXQ5g>
 <xmx:Q4zOXu-IlpTh-fXIXDi8N31lycdWcV5x1AicnbzZ_B9f42ZKybbOhg>
 <xmx:Q4zOXupzVkZgmioJvv77Bb-QS2UnNIPay_4r88Bq4M0737zsetkYZA>
 <xmx:Q4zOXrIIimuNMJbJWpoP-V5mjdb8yB23cQzVLHUNXW-s_sT52ZVN6g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 11EDF3280060;
 Wed, 27 May 2020 11:50:26 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 044/105] drm/vc4: crtc: Move the HVS gamma LUT setup to our
 init function
Date: Wed, 27 May 2020 17:48:14 +0200
Message-Id: <aa92d353d0cf3673a5d36a60fb82f7a5634270ac.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since most of the HVS channel is setup in the init function, let's move the
gamma setup there too.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 2352a63fd26b..87bbd68d44db 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -201,6 +201,8 @@ static int vc4_hvs_init_channel(struct vc4_dev *vc4, struct drm_crtc *crtc,
 {
 	struct vc4_crtc_state *vc4_crtc_state = to_vc4_crtc_state(crtc->state);
 	unsigned int chan = vc4_crtc_state->assigned_channel;
+	bool interlace = mode->flags & DRM_MODE_FLAG_INTERLACE;
+	u32 dispbkgndx;
 	u32 dispctrl;
 
 	/* Turn on the scaler, which will wait for vstart to start
@@ -225,6 +227,20 @@ static int vc4_hvs_init_channel(struct vc4_dev *vc4, struct drm_crtc *crtc,
 
 	HVS_WRITE(SCALER_DISPCTRLX(chan), dispctrl);
 
+	dispbkgndx = HVS_READ(SCALER_DISPBKGNDX(chan));
+	dispbkgndx &= ~SCALER_DISPBKGND_GAMMA;
+	dispbkgndx &= ~SCALER_DISPBKGND_INTERLACE;
+
+	HVS_WRITE(SCALER_DISPBKGNDX(chan), dispbkgndx |
+		  SCALER_DISPBKGND_AUTOHS |
+		  ((!vc4->hvs->hvs5) ? SCALER_DISPBKGND_GAMMA : 0) |
+		  (interlace ? SCALER_DISPBKGND_INTERLACE : 0));
+
+	/* Reload the LUT, since the SRAMs would have been disabled if
+	 * all CRTCs had SCALER_DISPBKGND_GAMMA unset at once.
+	 */
+	vc4_hvs_lut_load(crtc);
+
 	return 0;
 }
 
@@ -427,8 +443,6 @@ void vc4_hvs_mode_set_nofb(struct drm_crtc *crtc)
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
-	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
-	bool interlace = mode->flags & DRM_MODE_FLAG_INTERLACE;
 
 	if (vc4_crtc->data->hvs_output == 2) {
 		u32 dispctrl;
@@ -453,16 +467,6 @@ void vc4_hvs_mode_set_nofb(struct drm_crtc *crtc)
 			   ~SCALER_DISPCTRL_DSP3_MUX_MASK;
 		HVS_WRITE(SCALER_DISPCTRL, dispctrl | dsp3_mux);
 	}
-
-	HVS_WRITE(SCALER_DISPBKGNDX(vc4_state->assigned_channel),
-		  SCALER_DISPBKGND_AUTOHS |
-		  ((!vc4->hvs->hvs5) ? SCALER_DISPBKGND_GAMMA : 0) |
-		  (interlace ? SCALER_DISPBKGND_INTERLACE : 0));
-
-	/* Reload the LUT, since the SRAMs would have been disabled if
-	 * all CRTCs had SCALER_DISPBKGND_GAMMA unset at once.
-	 */
-	vc4_hvs_lut_load(crtc);
 }
 
 void vc4_hvs_mask_underrun(struct drm_device *dev, int channel)
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
