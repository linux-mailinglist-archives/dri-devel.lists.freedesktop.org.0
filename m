Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAE125D1ED
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606CE6EAB7;
	Fri,  4 Sep 2020 07:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FB66E824
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:02:23 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id ACBA8B18;
 Thu,  3 Sep 2020 04:02:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:02:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=5NFnvP2JBLynW
 yZwQN0upyxjvNoms0c6VxUpgb0gKqM=; b=RDmF/WtYQsjOZGJsIATppofns1tXV
 7qVkl50tC9By2BAvGLm7ggqSFZkc3Gy5vwxiK8vWv880bKolo9+rIfNO2Mr/K68D
 11oXHb2FVUsK3QezglqbCN7+mWyAh4rZzHJRvCpzCp5wcqLvJbzM9Euy1fHTuvjo
 aL7EcaTPA7qVAMGAqXXJcaFX5Y3t7jLOw+9OhxC7FJG+HAuaQplykgSIqK6LNkxH
 SLIFwVMh+lAvjeFwr/DHjFM66FKu32QGR0/MJcS2ErFTT0kciiHgYo1kF0zjA+z+
 IOu9msuxu8rRyMTzP+5uCJqsHyuX++5/rohOdtciYSTMqZHaj912tYX3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=5NFnvP2JBLynWyZwQN0upyxjvNoms0c6VxUpgb0gKqM=; b=lnUXH2yT
 usimRGSLROAKxjVehqLOcyrAe/an+ElY5dCVi+eULvH5y609vjLFVXkCN4lle1T9
 z1KfV7WrWQncfzDEvqzRc6VPLInABCOg48IoNmR0i8gkB2u+l1IKhrjLqUKZwX5z
 T+PEYIhVsSkw7telMQRwUiO3+rjnjVvziY5cApdqVv4f32u3VoZEdPv5uAAb8zP7
 8vF/0cNvl5Kwr4fype5QBvYGhcrAUCj3FKNnHC2495J68yANlLkMAFqRwBow/wxB
 auQ+7xUYOlJjXoUTWRMXa3IQj2PNJpRu1pXJXqIgHkEdAkhPYA48UYUec97ZA6z3
 zArXm/e+UaNm8w==
X-ME-Sender: <xms:DqNQXxQ6GXREPezwYl_c0NfGu_Pr4UgzqPiDJ-2cXcgRFNSnbwMj4A>
 <xme:DqNQX6zOUUPqGJ9_1ygH2tQSiaVJrftVfTIYwH02tP56qzeGya-xDTeugIXfya9m7
 k_RmJHNwL9eou9kTGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedule
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:DqNQX23fc8-4EeHN3gwsL0zHX5bLKAwNNJgFWd8dVxN5ru4bNCbh9A>
 <xmx:DqNQX5B7cTK3OomltJBj15Uh01pj1S7AvBoBdW7gUsyVe4bTjGTAGg>
 <xmx:DqNQX6jAWHSJsdHGy_tJ5v32Ju1Qc4MOza1Cch0k0DKYubdgaQ-4DQ>
 <xmx:DqNQXxpREgnpclm90ndi-7VclsCBTCGxT1ILdBwnxWkX3f-TwIrYnaG7eTU>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id EA1AF328005D;
 Thu,  3 Sep 2020 04:02:21 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 20/80] drm/vc4: crtc: Turn pixelvalve reset into a function
Date: Thu,  3 Sep 2020 10:00:52 +0200
Message-Id: <fb31003a9eee02c4b949556299ff41f0a113499a.1599120059.git-series.maxime@cerno.tech>
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

The driver resets the pixelvalve FIFO in a number of occurences without
always using the same sequence.

Since this will be critical for BCM2711, let's move that sequence to a
function so that we are consistent.

Reviewed-by: Eric Anholt <eric@anholt.net>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 41bc61d5a61f..c2ab907611e3 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -267,6 +267,15 @@ static struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc)
 	return NULL;
 }
 
+static void vc4_crtc_pixelvalve_reset(struct drm_crtc *crtc)
+{
+	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+
+	/* The PV needs to be disabled before it can be flushed */
+	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) & ~PV_CONTROL_EN);
+	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_FIFO_CLR);
+}
+
 static void vc4_crtc_config_pv(struct drm_crtc *crtc)
 {
 	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc);
@@ -282,10 +291,7 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc)
 	u32 format = is_dsi ? PV_CONTROL_FORMAT_DSIV_24 : PV_CONTROL_FORMAT_24;
 	u8 ppc = pv_data->pixels_per_clock;
 
-	/* Reset the PV fifo. */
-	CRTC_WRITE(PV_CONTROL, 0);
-	CRTC_WRITE(PV_CONTROL, PV_CONTROL_FIFO_CLR | PV_CONTROL_EN);
-	CRTC_WRITE(PV_CONTROL, 0);
+	vc4_crtc_pixelvalve_reset(crtc);
 
 	CRTC_WRITE(PV_HORZA,
 		   VC4_SET_FIELD((mode->htotal - mode->hsync_end) * pixel_rep / ppc,
@@ -430,9 +436,9 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	require_hvs_enabled(dev);
 
-	/* Reset the PV fifo. */
-	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) |
-		   PV_CONTROL_FIFO_CLR | PV_CONTROL_EN);
+	vc4_crtc_pixelvalve_reset(crtc);
+
+	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_EN);
 
 	/* Enable vblank irq handling before crtc is started otherwise
 	 * drm_crtc_get_vblank() fails in vc4_crtc_update_dlist().
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
