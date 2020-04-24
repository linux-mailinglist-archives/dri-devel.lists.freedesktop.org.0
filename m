Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECC61B7FD1
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8AE6EB1A;
	Fri, 24 Apr 2020 20:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C766C896B5
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:36:44 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id CEE001454;
 Fri, 24 Apr 2020 11:36:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:36:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=dnMWBW1B1w/jZ
 C3MSxSeAbdqYJK/VD0jClZG37R996E=; b=D2p7eMLCILb3meL9Z0gvK6KXkj5jJ
 GTFAFQKkeCK1xQBkxekoxHl1bBRsWnltamsL8zj3Ubs5K4aeuc4U3LDQY3uNUPHc
 3ZXAtFSo95AAZA7OQ3+TJIKTWlOgvItfJrPy6K8pRbSMlixAYQK6w/1eu/E2ZgJJ
 lJ/uSBUZWXZH7pHlAZOEnjCASHev4lnADjTqGe71Nm4WkakgfnzYb4drlmK6vQhj
 kBF6H/GszuKgl8XCT3zva/JVlc76bgQrSjxFHplw2dp7zWNZminp23uL63qBbrkP
 +c/gLeqsritR8yf0P6UoG7u1xzY3Z09F6FHYXYtTLudsyMZ7OnUTEOB7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=dnMWBW1B1w/jZC3MSxSeAbdqYJK/VD0jClZG37R996E=; b=VFcYJE7f
 dq0T/BvtRgHae1MIWCQhbHgp7EoBsP/zCqAIx4IYe8kTzbOVL8pnKmrSi5BduTqz
 NYBzDi8kom8mcQ+z9v1/RbvCsNmNOvowNswVwrw7GQWaGtWiXFaIPoOYC8aPLsnr
 rJHxoyMDJmzrSb7Np/b73/88h0dq4j07NyCe0/3zgWnYD6BezRAFGTXjUdz5gPU/
 CEklbcq+r4hwuYhe1UNao9gOsuA1zQveJA2OU+cOH2E2SIjrrFLrxFvQLTkU74tu
 5bX5drbqLxq7X/lO9s74ZZiQny4KHEAdvy5Sx9k3ieph0kktHvm6z57Qj7TvJU3h
 qQ3fCGcmORPvnA==
X-ME-Sender: <xms:iwejXj5JKhiDUrVWm0Z78E54W1sq0BiJpnBOM433ioLyR1-Vv_8DMQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpeehudenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:iwejXpeXp6M55-_4Ab3bLZPw-CCs_IdgpNbPgBzxr7FIttiebP6H_Q>
 <xmx:iwejXl1I01zcETrXgTDrQamYwttS6xxbpAEnlacgVEQKunTAak-zCA>
 <xmx:iwejXmxqT_VS26bqoTD0Mcg-YwMMz4OWuKGn0e3aJH1wUbmoB_LKyg>
 <xmx:iwejXgDJ8FwvaXMdeW2lfgKh1qbBWgnhODewSc4zosp0cZqH57Ggf5mKq1o>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 26BA93280068;
 Fri, 24 Apr 2020 11:36:43 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 58/91] drm/vc4: crtc: Disable color management for HVS5
Date: Fri, 24 Apr 2020 17:34:39 +0200
Message-Id: <05b9330e2fcb99c3a8df5029f5f8d169ab4b9cb2.1587742492.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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

The HVS5 uses different color matrices. Disable color management support
for now.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 5bd01c16ea45..47e411cbf5dc 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -443,7 +443,7 @@ static void vc4_crtc_mode_set_nofb(struct drm_crtc *crtc)
 
 	HVS_WRITE(SCALER_DISPBKGNDX(vc4_state->assigned_channel),
 		  SCALER_DISPBKGND_AUTOHS |
-		  SCALER_DISPBKGND_GAMMA |
+		  ((!vc4->hvs->hvs5) ? SCALER_DISPBKGND_GAMMA : 0) |
 		  (interlace ? SCALER_DISPBKGND_INTERLACE : 0));
 
 	/* Reload the LUT, since the SRAMs would have been disabled if
@@ -1159,6 +1159,7 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
+	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_crtc *vc4_crtc;
 	struct drm_crtc *crtc;
 	struct drm_plane *primary_plane, *destroy_plane, *temp;
@@ -1200,12 +1201,16 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 	drm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
 				  &vc4_crtc_funcs, NULL);
 	drm_crtc_helper_add(crtc, &vc4_crtc_helper_funcs);
-	drm_mode_crtc_set_gamma_size(crtc, ARRAY_SIZE(vc4_crtc->lut_r));
 
-	/* We support CTM, but only for one CRTC at a time. It's therefore
-	 * implemented as private driver state in vc4_kms, not here.
-	 */
-	drm_crtc_enable_color_mgmt(crtc, 0, true, crtc->gamma_size);
+	if (!vc4->hvs->hvs5) {
+		drm_mode_crtc_set_gamma_size(crtc, ARRAY_SIZE(vc4_crtc->lut_r));
+
+		/* We support CTM, but only for one CRTC at a
+		 * time. It's therefore implemented as private driver
+		 * state in vc4_kms, not here.
+		 */
+		drm_crtc_enable_color_mgmt(crtc, 0, true, crtc->gamma_size);
+	}
 
 	CRTC_WRITE(PV_INTEN, 0);
 	CRTC_WRITE(PV_INTSTAT, PV_INT_VFP_START);
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
