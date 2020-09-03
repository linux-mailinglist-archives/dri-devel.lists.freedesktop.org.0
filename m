Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 271DE25D21D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA336EAB5;
	Fri,  4 Sep 2020 07:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51C36E581
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:02:42 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id B0086B84;
 Thu,  3 Sep 2020 04:02:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:02:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=8CjhO/oufe9mi
 iuIeroM+ywrY892Ab6UeAx03HtursY=; b=APVIBb0kwprBJkq9p21ofQoKMiAJl
 0VwIv7fJAav6M3/Pc8GgyLENntY1d4Z+amaQC58PYKauOPrD33T1MhdwD25t5iOc
 Rv5V1dy2oIh/11FOMTNa7TSRNhQneF0LYB9UQiNcUe21wELTjbrXatsVZC0JDbeY
 NAQ9+s68rOrA40pHqi0wZUFOK9ZItC0kEPx1WLO18RnABfqWk3B5T/v8zx93Zv4r
 VqxL7uP3m5IYc+FgoVpi+mkoxjGHuR8l4FTqlNADfbEyG/ClApv+1ll25ZzuwqCk
 jY+pFTOO/7DWiyNFNw7oSG3k0QTpFVUDd/S7L9pup2fvdye2NKH0nY5Ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=8CjhO/oufe9miiuIeroM+ywrY892Ab6UeAx03HtursY=; b=Ms44j6wG
 5I7E8/myrnjYOX1HJ/t2J9B0bQCu4U2iSIYJx22UBWyIsNR+nYrvddENox9eXJn8
 xoxe/twpRoiCtTY1wTv9yhr/vnINzubsE1yya5ujHH16BrAHBrpnvOU60mqVoRBq
 inqjSw58Vvt5CiF9szElzkomsNfn574vlvTimgwt1xpjyW31fK235wIE06RJJrLO
 GAeoJcSUMBoTHs+UhRlVS2aEAgpbM3J4OZ/YgpdhKUJhQqJAtEIPJJlkRZaeKIvT
 tj5uV4vMbknZu3u0W4JUfTQrY9eMXgpYwacN1x6DpA1bnSAYRolja7AguDZuVTTR
 ykN9n0UZC6gERA==
X-ME-Sender: <xms:IaNQXzRso1Bc5g08hSCge7vt7EaoAJ4Tipf1J-P-l5UsgJp1_OWEeA>
 <xme:IaNQX0zmsUgU_KtBVpQ5QZfoux5vRQmUuiDBgetN1NLPGqVzrV9Se6MeVmMNs_Rqi
 9OWy9YWcB244jUkIPI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeefvd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:IaNQX42uF_Y-2dFUO35aQIVH_jRbZjtmijM0W_6eVTXsxroW5vi8GA>
 <xmx:IaNQXzBsx4ME8ovjDEwqW2achlCOCtRLxWZVGF6xVPI-g8U9bVjUXg>
 <xmx:IaNQX8j0n9-uZ_NpcQhDf6XUvpDhZ0u76Ap613YGhX9a5B7SEqN7lQ>
 <xmx:IaNQX7rqly4r12R4joof_dvBZixz1SKRoK3l8TEmnLakanDfZ8QfsjkZByE>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id EA5AD3280064;
 Thu,  3 Sep 2020 04:02:40 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 34/80] drm/vc4: crtc: Move the CRTC disable out
Date: Thu,  3 Sep 2020 10:01:06 +0200
Message-Id: <5288fb72ed2da643085dce1bc7f6d6f656bf176e.1599120059.git-series.maxime@cerno.tech>
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

We'll need to reuse the part that disables the HVS and PixelValve during
boot too, so let's create a separate function.

Reviewed-by: Eric Anholt <eric@anholt.net>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 00b2c2b011d1..4156c5f66877 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -384,20 +384,14 @@ static void require_hvs_enabled(struct drm_device *dev)
 		     SCALER_DISPCTRL_ENABLE);
 }
 
-static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
-				    struct drm_crtc_state *old_state)
+static int vc4_crtc_disable(struct drm_crtc *crtc, unsigned int channel)
 {
-	struct drm_device *dev = crtc->dev;
-	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc);
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
+	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+	struct drm_device *dev = crtc->dev;
 	int ret;
 
-	require_hvs_enabled(dev);
-
-	/* Disable vblank irq handling before crtc is disabled. */
-	drm_crtc_vblank_off(crtc);
-
 	CRTC_WRITE(PV_V_CONTROL,
 		   CRTC_READ(PV_V_CONTROL) & ~PV_VCONTROL_VIDEN);
 	ret = wait_for(!(CRTC_READ(PV_V_CONTROL) & PV_VCONTROL_VIDEN), 1);
@@ -421,15 +415,31 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
 	 */
 	mdelay(20);
 
-	if (vc4_encoder->post_crtc_disable)
+	if (vc4_encoder && vc4_encoder->post_crtc_disable)
 		vc4_encoder->post_crtc_disable(encoder);
 
 	vc4_crtc_pixelvalve_reset(crtc);
-	vc4_hvs_atomic_disable(crtc, old_state);
+	vc4_hvs_stop_channel(dev, channel);
 
-	if (vc4_encoder->post_crtc_powerdown)
+	if (vc4_encoder && vc4_encoder->post_crtc_powerdown)
 		vc4_encoder->post_crtc_powerdown(encoder);
 
+	return 0;
+}
+
+static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
+				    struct drm_crtc_state *old_state)
+{
+	struct vc4_crtc_state *old_vc4_state = to_vc4_crtc_state(old_state);
+	struct drm_device *dev = crtc->dev;
+
+	require_hvs_enabled(dev);
+
+	/* Disable vblank irq handling before crtc is disabled. */
+	drm_crtc_vblank_off(crtc);
+
+	vc4_crtc_disable(crtc, old_vc4_state->assigned_channel);
+
 	/*
 	 * Make sure we issue a vblank event after disabling the CRTC if
 	 * someone was waiting it.
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
