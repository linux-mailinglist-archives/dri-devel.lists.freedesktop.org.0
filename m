Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A981E25D1D7
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643D46EA91;
	Fri,  4 Sep 2020 07:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C126E19A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:02:22 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 5FF99BC0;
 Thu,  3 Sep 2020 04:02:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:02:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=X+84pQ5Ji+hRE
 qIJ2avNpvapmI/2Mjwn8Hg4UcxwJ6c=; b=RJT1ocmlxZJRWa6nMR85uPaFmxo4L
 GNvdaviJhnBDoUvnnfja9xH6oK7cn43i6VqMd9XyP5gWZ0xbgY+1ZG4wg9ASUK6+
 y6h191ZgVWp0JT+hARFbm/47RByirxKqdIT5FGFXxn3FbIxn9f+3Kl5kC30tyZxn
 WPmYdViNXcvWgJeLvLkUinl8yxgbxC3NZxSd6eYzUIzj0Jrz7SAZuCqTCDPyVoBK
 deH0ZZagh5nwjfCCGMUSWb6yGe0aag0FcwmjowEVmcL+OEMpXM82Vol8OQurB/Sf
 WX/dWkX4YfWFGJmkop3/xEk63Fl9wvjXbwKvzQ2U4fiswDL58uiZyiWHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=X+84pQ5Ji+hREqIJ2avNpvapmI/2Mjwn8Hg4UcxwJ6c=; b=fYC6A0ji
 xA4nzVJT6LP/au+C+tzDu8T9tRa2R2P/C8z6JMLUZEubyJ581MX/YiJ2ttuN3QF5
 3Npa0e9DgSEE4ZLEPw5cfBBEve9on6Cy3HOOqyacGnJ047q5wHWLB2pMy2A2XV20
 TmCHsYPevweNSfaLmC6BvxUsyUi1HMkJ1zXmsUi4R1j0mJb7zVBeF5nrTrBQ3hqm
 tcrc3cot2HAbQmGDhcspvYRh9R9z3Jcfo21hyVc0sNP7m8tvS60b7drAFDtNKRDK
 KXbU+Uf37agwZEGlZEiTb8QSL+uWpytRCwfrGGa5zosWWW8bq0BROlWl8Q44clfs
 4cXF9+DJIPKMeg==
X-ME-Sender: <xms:DKNQX4Qf7qUIT1M_10NFu4zF1lPGLz5LENKgVRUCPL1u79YeDGdEJw>
 <xme:DKNQX1wfWmTq-sfpaEecFPnDDMNr7UK_BQfbtQVQIVUuDVDMWET-O9naNWNWktuhI
 VKKPPvGIPSRbkULDEE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeduge
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:DKNQX11avFpeTIBsBtntmCDLbBPXfgbQgmsOYtCZ5qgHUE7zEG6MWA>
 <xmx:DKNQX8BzARSg8k1DoKUs8JDt9tpEruROO63xDakL-lZkvBFWJJEtSA>
 <xmx:DKNQXxiN4EOL17qwN4xg0SXXpu4P98ikSSeLkgqH2fBOVuCp9KLcTA>
 <xmx:DaNQX8pIk7ek91F7LqR-j1tVyN5ZjOxSLUz9OpjKzyn_SuN9SiuQ-uhCxd0>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9D6423060060;
 Thu,  3 Sep 2020 04:02:20 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 19/80] drm/vc4: crtc: Disable color management for HVS5
Date: Thu,  3 Sep 2020 10:00:51 +0200
Message-Id: <e528e2edf0a1be3930196d437e548114dd9fcf59.1599120059.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HVS5 uses different color matrices. Disable color management support
for now.

Reviewed-by: Eric Anholt <eric@anholt.net>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 17 +++++++++++------
 drivers/gpu/drm/vc4/vc4_hvs.c  |  2 +-
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 04744223460a..41bc61d5a61f 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -874,6 +874,7 @@ int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
 		  const struct drm_crtc_funcs *crtc_funcs,
 		  const struct drm_crtc_helper_funcs *crtc_helper_funcs)
 {
+	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct drm_crtc *crtc = &vc4_crtc->base;
 	struct drm_plane *primary_plane;
 	unsigned int i;
@@ -893,13 +894,17 @@ int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
 	drm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
 				  crtc_funcs, NULL);
 	drm_crtc_helper_add(crtc, crtc_helper_funcs);
-	drm_mode_crtc_set_gamma_size(crtc, ARRAY_SIZE(vc4_crtc->lut_r));
-	drm_crtc_enable_color_mgmt(crtc, 0, false, crtc->gamma_size);
 
-	/* We support CTM, but only for one CRTC at a time. It's therefore
-	 * implemented as private driver state in vc4_kms, not here.
-	 */
-	drm_crtc_enable_color_mgmt(crtc, 0, true, crtc->gamma_size);
+	if (!vc4->hvs->hvs5) {
+		drm_mode_crtc_set_gamma_size(crtc, ARRAY_SIZE(vc4_crtc->lut_r));
+
+		drm_crtc_enable_color_mgmt(crtc, 0, false, crtc->gamma_size);
+
+		/* We support CTM, but only for one CRTC at a time. It's therefore
+		 * implemented as private driver state in vc4_kms, not here.
+		 */
+		drm_crtc_enable_color_mgmt(crtc, 0, true, crtc->gamma_size);
+	}
 
 	for (i = 0; i < crtc->gamma_size; i++) {
 		vc4_crtc->lut_r[i] = i;
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 31a9bc5ef84e..fa61cad3a53d 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -443,7 +443,7 @@ void vc4_hvs_mode_set_nofb(struct drm_crtc *crtc)
 
 	HVS_WRITE(SCALER_DISPBKGNDX(vc4_state->assigned_channel),
 		  SCALER_DISPBKGND_AUTOHS |
-		  SCALER_DISPBKGND_GAMMA |
+		  ((!vc4->hvs->hvs5) ? SCALER_DISPBKGND_GAMMA : 0) |
 		  (interlace ? SCALER_DISPBKGND_INTERLACE : 0));
 
 	/* Reload the LUT, since the SRAMs would have been disabled if
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
