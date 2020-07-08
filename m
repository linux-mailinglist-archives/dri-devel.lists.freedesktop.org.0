Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B6321993C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:06:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8066E9D4;
	Thu,  9 Jul 2020 07:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9116E907
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:43:02 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id EED85FD0;
 Wed,  8 Jul 2020 13:43:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:43:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=PXyOrhteRhuIW
 3gAa3UTeL+v8wa9wTNvkAai0iITr1g=; b=QnD9HeXpBI4112vzPdB+Fcw+vkmZ2
 ToR7uIAdTpegqZ0Ufy8QvbRi0ILu08S5BcbP3hBtWBqoB12zDrwUTasAOHbCWU2f
 s2IkjV58BeWvNoB1NrCnuo7w5QNaEX/dDDs35KApVJ1rrdLT3ry0n2A2d+IMQ0UT
 AZLD3pbc5osrVQvl0YLvObB4xQXs/cmBXv1Fs2cUBhhHCvoul7nn7gNuFxdmDZU8
 3sxvLZAYZSV83qrWGXJrG1mhzOruBiDNDmsWBDdhe9NXbaOMYTahy+nRXcvj+p19
 WGFJyXG53e4BbLfmm1AaYpHWcc/bfQmyFHXob9h2dCVTKILKUL/vbze6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=PXyOrhteRhuIW3gAa3UTeL+v8wa9wTNvkAai0iITr1g=; b=BR6M2hXu
 BEw0yS+B9mXUo2bHdvMcpMacVV2VZjqF6VqXMFTOc+JZc/MubTKUNTFjXPSb2LQA
 xbBVAH/WF9QaY4bpic8/E1en4qtJShcV+SXKcDqp+yloZ9nMxOvhA8jEWICfytn0
 7rjp/tiwKTi+e6/ApMX5QQOyAEPCFo4qWwBOa8Bndx3fKHGCsMkhPr8GqSmqWJtl
 lviu2hx0XV0/UyzuTt/G/y9HW43j7+OBhSA5Nwk6bo2cGCyaa8bOsgi8OynqUEZt
 kIlrEEW5EgjXc7VIoai3ajGVRm+eSuKjjEgrsli3gwsJsXNMAib8cDODe+FnS5IA
 AkrSWff5lGSrFA==
X-ME-Sender: <xms:pQUGXzxlQBAHEaXMtdqROMu1d5ND1im7slR88m5hGwjT68uPdYTKgg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudelne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:pQUGX7QepWn4Xu8m4TutUrwXcRa5KWSbpubHdge-ZeqqgaD6Ooiz0A>
 <xmx:pQUGX9UiNLKAc9v2wzgACmxm_mpcMvx3ACfJgNacniFRlojhPpd5yw>
 <xmx:pQUGX9ievc6OxYiIpkD_s8VfOFnnuPJjZcDFQx8GnsQPK-VaoLbQTQ>
 <xmx:pQUGX_C9I3l_EDjcdGogw7tz-dOczlfA9ooiueSx_49yuIk86-kSrCM_K_s>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4859D30600B7;
 Wed,  8 Jul 2020 13:43:01 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 21/78] drm/vc4: crtc: Move PV dump to config_pv
Date: Wed,  8 Jul 2020 19:41:29 +0200
Message-Id: <bb369aede3a6d0463805faabeb5f598a369b54bf.1594230107.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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

Now that we only configure the PixelValve in vc4_crtc_config_pv, it doesn't
really make much sense to dump its register content in its caller.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index c2ab907611e3..181d3fd57bc7 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -290,6 +290,14 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc)
 		       vc4_encoder->type == VC4_ENCODER_TYPE_DSI1);
 	u32 format = is_dsi ? PV_CONTROL_FORMAT_DSIV_24 : PV_CONTROL_FORMAT_24;
 	u8 ppc = pv_data->pixels_per_clock;
+	bool debug_dump_regs = false;
+
+	if (debug_dump_regs) {
+		struct drm_printer p = drm_info_printer(&vc4_crtc->pdev->dev);
+		dev_info(&vc4_crtc->pdev->dev, "CRTC %d regs before:\n",
+			 drm_crtc_index(crtc));
+		drm_print_regset32(&p, &vc4_crtc->regset);
+	}
 
 	vc4_crtc_pixelvalve_reset(crtc);
 
@@ -359,30 +367,20 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc)
 		   PV_CONTROL_WAIT_HSTART |
 		   VC4_SET_FIELD(vc4_encoder->clock_select,
 				 PV_CONTROL_CLK_SELECT));
-}
-
-static void vc4_crtc_mode_set_nofb(struct drm_crtc *crtc)
-{
-	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
-	bool debug_dump_regs = false;
 
 	if (debug_dump_regs) {
 		struct drm_printer p = drm_info_printer(&vc4_crtc->pdev->dev);
-		dev_info(&vc4_crtc->pdev->dev, "CRTC %d regs before:\n",
+		dev_info(&vc4_crtc->pdev->dev, "CRTC %d regs after:\n",
 			 drm_crtc_index(crtc));
 		drm_print_regset32(&p, &vc4_crtc->regset);
 	}
+}
 
+static void vc4_crtc_mode_set_nofb(struct drm_crtc *crtc)
+{
 	vc4_crtc_config_pv(crtc);
 
 	vc4_hvs_mode_set_nofb(crtc);
-
-	if (debug_dump_regs) {
-		struct drm_printer p = drm_info_printer(&vc4_crtc->pdev->dev);
-		dev_info(&vc4_crtc->pdev->dev, "CRTC %d regs after:\n",
-			 drm_crtc_index(crtc));
-		drm_print_regset32(&p, &vc4_crtc->regset);
-	}
 }
 
 static void require_hvs_enabled(struct drm_device *dev)
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
