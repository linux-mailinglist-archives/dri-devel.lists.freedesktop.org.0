Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D84B25D1CB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:11:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85CF86E0EE;
	Fri,  4 Sep 2020 07:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13CC6E570
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:02:08 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id BDB4FC31;
 Thu,  3 Sep 2020 04:02:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:02:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=wyZnkPrjeR+Sr
 s6RkXx8kdY3RbDYufoeU6U9xNeTsbk=; b=EJwJy9nxaCRWMqFiZyMaME02+5vGt
 oHjaDbxqBU3nnXACaH6c+mmexpj7BuZE28HaVD1lIWOTeenO+flp1l+nToDAIcOn
 nyhAwN/TM4BwAq3B8QHEyI6PkNFvhUK2Nyuk5VjMPOpPzJ2qkDHRL/Hx3BFwyxCV
 AC4D3sQHHmDZAkT/9aA7IQ0coItIQjAkb41hoQv0PzREZnS+1z0icZ2UaXf0/vg0
 9u43XIdnoRNRy586EolItLisBdDhq50kjl7Ry6TUrSv3Leyb5CiozvHhRhZrxs3S
 uHiMxdLa31IwYFx/S77p3ip+jTk1FhYujEiFKBgmjf4psK9SUBmVBA8Iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=wyZnkPrjeR+Srs6RkXx8kdY3RbDYufoeU6U9xNeTsbk=; b=k9iAZLRQ
 qF2uoEly4rrIn21rYBopKh5EnAGW4lPUUOXUJHxI7J2XmJTvkgW8km7+pyTok/nt
 C9YnwWBwFtp+Z5itHbkC4JmmeojEM+u20hsZvSyPeXpNYDJQlmz85OhqJOR9pLvM
 zV45Bl4rbuv1Jg7EPyfThr1XuNLM2Y/ZoXmSPwqtQg4pIUcot30Wwz4mAllvZE6h
 CQi3jZpjtDZGaHwHcncratKrrCSZqmMDYurb2b/3k04QlBaNEuymuQ3s4dxlfjOM
 y9R2XuPYexGn3ZYkTylHYYwhU+udsJS4v41IlzMaCPpirZYY0y+ImWrj6AWExKDX
 w+t9TM85Izcstg==
X-ME-Sender: <xms:_6JQX1-Sh1MDFh8efgiMR6NQZ8-cuWt0WBOLIAr4MVlcZNduzZfTkw>
 <xme:_6JQX5vIxPfJfsxu7mm4Y5Wr15VyZzU_9tO2WpAzCi2LbsDL5zdEbSBozFUOCQrEq
 -0HFSMZ9PXvE9_dJ2E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeeine
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_6JQXzAESZvsZ1mdz60YkVhOIJMfhG86qkafde5NlSqMAMtusqofSA>
 <xmx:_6JQX5dU_XjCUQEMYHjjM14wXPH5zXqTVblxVteVjFSc1dJyQfnJ8g>
 <xmx:_6JQX6NyVEcZgxT9fpwLjI4FZMdmU44qmB_MFxNPm8oscnD5rG_pBw>
 <xmx:_6JQX7nQuuBertvN1Zsq8FDJgE_B9HE_wl6W9SajexTT6Qo1UM-RZe8TRx4>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0327A306005B;
 Thu,  3 Sep 2020 04:02:06 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 09/80] drm/vc4: crtc: Move the cob allocation outside of
 bind
Date: Thu,  3 Sep 2020 10:00:41 +0200
Message-Id: <484cbd4b00cfeee425295df438222258cc39a3dd.1599120059.git-series.maxime@cerno.tech>
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

The COB allocation depends on the HVS channel used for a given
pixelvalve.

While the channel allocation was entirely static in vc4, vc5 changes
that and at bind time, a pixelvalve can be assigned to multiple
HVS channels.

Let's prepare that rework by allocating the COB when it's actually
needed.

Reviewed-by: Eric Anholt <eric@anholt.net>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 35 +++++++++++++++++------------------
 drivers/gpu/drm/vc4/vc4_drv.h  |  2 +--
 2 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 9faae22cb0f8..fdecaba77836 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -65,6 +65,20 @@ static const struct debugfs_reg32 crtc_regs[] = {
 	VC4_REG32(PV_HACT_ACT),
 };
 
+static unsigned int
+vc4_crtc_get_cob_allocation(struct vc4_dev *vc4, unsigned int channel)
+{
+	u32 dispbase = HVS_READ(SCALER_DISPBASEX(channel));
+	/* Top/base are supposed to be 4-pixel aligned, but the
+	 * Raspberry Pi firmware fills the low bits (which are
+	 * presumably ignored).
+	 */
+	u32 top = VC4_GET_FIELD(dispbase, SCALER_DISPBASEX_TOP) & ~3;
+	u32 base = VC4_GET_FIELD(dispbase, SCALER_DISPBASEX_BASE) & ~3;
+
+	return top - base + 4;
+}
+
 static bool vc4_crtc_get_scanout_position(struct drm_crtc *crtc,
 					  bool in_vblank_irq,
 					  int *vpos, int *hpos,
@@ -74,6 +88,7 @@ static bool vc4_crtc_get_scanout_position(struct drm_crtc *crtc,
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+	unsigned int cob_size;
 	u32 val;
 	int fifo_lines;
 	int vblank_lines;
@@ -109,8 +124,9 @@ static bool vc4_crtc_get_scanout_position(struct drm_crtc *crtc,
 			*hpos += mode->crtc_htotal / 2;
 	}
 
+	cob_size = vc4_crtc_get_cob_allocation(vc4, vc4_crtc->channel);
 	/* This is the offset we need for translating hvs -> pv scanout pos. */
-	fifo_lines = vc4_crtc->cob_size / mode->crtc_hdisplay;
+	fifo_lines = cob_size / mode->crtc_hdisplay;
 
 	if (fifo_lines > 0)
 		ret = true;
@@ -823,22 +839,6 @@ static void vc4_set_crtc_possible_masks(struct drm_device *drm,
 	}
 }
 
-static void
-vc4_crtc_get_cob_allocation(struct vc4_crtc *vc4_crtc)
-{
-	struct drm_device *drm = vc4_crtc->base.dev;
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
-	u32 dispbase = HVS_READ(SCALER_DISPBASEX(vc4_crtc->channel));
-	/* Top/base are supposed to be 4-pixel aligned, but the
-	 * Raspberry Pi firmware fills the low bits (which are
-	 * presumably ignored).
-	 */
-	u32 top = VC4_GET_FIELD(dispbase, SCALER_DISPBASEX_TOP) & ~3;
-	u32 base = VC4_GET_FIELD(dispbase, SCALER_DISPBASEX_BASE) & ~3;
-
-	vc4_crtc->cob_size = top - base + 4;
-}
-
 int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
 		  const struct drm_crtc_funcs *crtc_funcs,
 		  const struct drm_crtc_helper_funcs *crtc_helper_funcs)
@@ -870,7 +870,6 @@ int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
 	 * implemented as private driver state in vc4_kms, not here.
 	 */
 	drm_crtc_enable_color_mgmt(crtc, 0, true, crtc->gamma_size);
-	vc4_crtc_get_cob_allocation(vc4_crtc);
 
 	for (i = 0; i < crtc->gamma_size; i++) {
 		vc4_crtc->lut_r[i] = i;
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 0bc150daafb2..d80fc3bbb450 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -477,8 +477,6 @@ struct vc4_crtc {
 	u8 lut_r[256];
 	u8 lut_g[256];
 	u8 lut_b[256];
-	/* Size in pixels of the COB memory allocated to this CRTC. */
-	u32 cob_size;
 
 	struct drm_pending_vblank_event *event;
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
