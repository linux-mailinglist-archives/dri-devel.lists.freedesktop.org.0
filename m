Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0ED4BD9FE
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 14:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB6610E3A4;
	Mon, 21 Feb 2022 13:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9943810E392
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 13:42:05 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id EC0C15C00C9;
 Mon, 21 Feb 2022 08:42:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 21 Feb 2022 08:42:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=EwCp/DR+rW/qEY57wYmp8SO8XM0oma
 p1E8ZRNb6qI4w=; b=LjvHadDyVsDHrFKPvu/iXeDZffIrQe+sTIEfJ5hxAM2k+l
 MILCOG2zg7l3LRWvBCzD4eVP/pyMN9SwztZKzSsb6cS7s37EOrb0DKfm6blSrHAe
 wjeyZc+SLbt1Q7loVAcIt9jNUXs8iE2OWbAPn4JMzIWzVPkCEULVZYewPYu/kC8a
 NOeSWnZRnWVSLzc2x4KtcQ6SFFuqE1jUqfTRz8zSMAaidurq5CfBqPLoHygBvD6N
 3Pfp34gCQycOkUOJO8bmD1hAMfItyBQ7zBRnw7RHtmPOFZLwgfdBAt5mh68Mv30J
 FVawIpgxR8ivW8vezPLgXoYIPxp+W7V9yKGB/2vQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=EwCp/D
 R+rW/qEY57wYmp8SO8XM0omap1E8ZRNb6qI4w=; b=f0dZigFxwwjMrGD0mblxkv
 2TktTlcDD9aUDXQ8yMU0yLy1rLKd68vv7V4GO0XDwAqeTurT0VYqIdhs9JSO3isM
 KkLvaDSAiqI6lFWcSCPmI1b9ZBpwrqYt3KnPT1zDrRSmLl200wIAfDBKhbqoJuPy
 W0gGw2UjnLCezuuK6kCKle2DHhzY4eqkfDTYqwvN8ETwPP8zxnZ0Kn5h3Qt2XQjQ
 FrzoujcPhvQGquEtcfF7m3DZJnvGFuD+M0v43mN3866q68bgkI9D11rcJaa9TdIU
 z6X0porSjwmjTNfLN2rbmSjo0/P1Y6CuNPSXnU/e14oV9qyX53oXYkyEmFD3ZDAw
 ==
X-ME-Sender: <xms:rJYTYgeUKbq1pQkbgwMWZjTEY3hcTdKD9LPeLc_yavZjItuw1JXL9Q>
 <xme:rJYTYiNtHG-9qWQRQiZaZTajMErtZvd-Lyg5eBlEEVug3KIHZmojQf0xpJFmBt3CB
 ADqcCwEWwuR9wVgCDE>
X-ME-Received: <xmr:rJYTYhhCzMYJQadTB74eO97q93ZtB8F7hvHvND3wme3l9EFP8EEo8YjsMQYsZ0qLsm5WLA0q-HQrJpfKvi7f6HEpeir_5Lxyy9X8cNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rJYTYl8gXSvfVleLKHFruNJbec3KWSiCo4z3da1503FgINxFCehMmA>
 <xmx:rJYTYsvmk5f0tf6gMm2H3dBY_GZRwBdPdrITJNxF3vnSPR-xFvFnBA>
 <xmx:rJYTYsFCXrm-6tAu1VmdLACjp7I812GfEi8Se71THsT5YjtXdgAU8A>
 <xmx:rJYTYqDg7zzDxRTIEqhpUAACN64gwp0O6le63Q-5Sr7uiYwDDUuueQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 08:42:04 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 2/8] drm/vc4: hvs: Fix frame count register readout
Date: Mon, 21 Feb 2022 14:41:49 +0100
Message-Id: <20220221134155.125447-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221134155.125447-1-maxime@cerno.tech>
References: <20220221134155.125447-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to get the field currently being output, the driver has been
using the display FIFO frame count in the HVS, reading a 6-bit field at
the offset 12 in the DISPSTATx register.

While that field is indeed at that location for the FIFO 1 and 2, the
one for the FIFO0 is actually in the DISPSTAT1 register, at the offset
18.

Fixes: e538092cb15c ("drm/vc4: Enable precise vblank timestamping for interlaced modes.")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c |  2 +-
 drivers/gpu/drm/vc4/vc4_drv.h  |  1 +
 drivers/gpu/drm/vc4/vc4_hvs.c  | 23 +++++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_regs.h | 12 ++++++++++--
 4 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index e6cc47470e03..72fadce38d32 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -123,7 +123,7 @@ static bool vc4_crtc_get_scanout_position(struct drm_crtc *crtc,
 		*vpos /= 2;
 
 		/* Use hpos to correct for field offset in interlaced mode. */
-		if (VC4_GET_FIELD(val, SCALER_DISPSTATX_FRAME_COUNT) % 2)
+		if (vc4_hvs_get_fifo_frame_count(dev, vc4_crtc_state->assigned_channel) % 2)
 			*hpos += mode->crtc_htotal / 2;
 	}
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 4329e09d357c..801da3e8ebdb 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -935,6 +935,7 @@ void vc4_irq_reset(struct drm_device *dev);
 extern struct platform_driver vc4_hvs_driver;
 void vc4_hvs_stop_channel(struct drm_device *dev, unsigned int output);
 int vc4_hvs_get_fifo_from_output(struct drm_device *dev, unsigned int output);
+u8 vc4_hvs_get_fifo_frame_count(struct drm_device *dev, unsigned int fifo);
 int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state);
 void vc4_hvs_atomic_begin(struct drm_crtc *crtc, struct drm_atomic_state *state);
 void vc4_hvs_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state);
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 604933e20e6a..c8cae10500b9 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -197,6 +197,29 @@ static void vc4_hvs_update_gamma_lut(struct drm_crtc *crtc)
 	vc4_hvs_lut_load(crtc);
 }
 
+u8 vc4_hvs_get_fifo_frame_count(struct drm_device *dev, unsigned int fifo)
+{
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	u8 field = 0;
+
+	switch (fifo) {
+	case 0:
+		field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT1),
+				      SCALER_DISPSTAT1_FRCNT0);
+		break;
+	case 1:
+		field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT1),
+				      SCALER_DISPSTAT1_FRCNT1);
+		break;
+	case 2:
+		field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT2),
+				      SCALER_DISPSTAT2_FRCNT2);
+		break;
+	}
+
+	return field;
+}
+
 int vc4_hvs_get_fifo_from_output(struct drm_device *dev, unsigned int output)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index 33410718089e..bae8c9cd6f7c 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -379,8 +379,6 @@
 # define SCALER_DISPSTATX_MODE_EOF		3
 # define SCALER_DISPSTATX_FULL			BIT(29)
 # define SCALER_DISPSTATX_EMPTY			BIT(28)
-# define SCALER_DISPSTATX_FRAME_COUNT_MASK	VC4_MASK(17, 12)
-# define SCALER_DISPSTATX_FRAME_COUNT_SHIFT	12
 # define SCALER_DISPSTATX_LINE_MASK		VC4_MASK(11, 0)
 # define SCALER_DISPSTATX_LINE_SHIFT		0
 
@@ -403,9 +401,15 @@
 						 (x) * (SCALER_DISPBKGND1 - \
 							SCALER_DISPBKGND0))
 #define SCALER_DISPSTAT1                        0x00000058
+# define SCALER_DISPSTAT1_FRCNT0_MASK		VC4_MASK(23, 18)
+# define SCALER_DISPSTAT1_FRCNT0_SHIFT		18
+# define SCALER_DISPSTAT1_FRCNT1_MASK		VC4_MASK(17, 12)
+# define SCALER_DISPSTAT1_FRCNT1_SHIFT		12
+
 #define SCALER_DISPSTATX(x)			(SCALER_DISPSTAT0 +        \
 						 (x) * (SCALER_DISPSTAT1 - \
 							SCALER_DISPSTAT0))
+
 #define SCALER_DISPBASE1                        0x0000005c
 #define SCALER_DISPBASEX(x)			(SCALER_DISPBASE0 +        \
 						 (x) * (SCALER_DISPBASE1 - \
@@ -415,7 +419,11 @@
 						 (x) * (SCALER_DISPCTRL1 - \
 							SCALER_DISPCTRL0))
 #define SCALER_DISPBKGND2                       0x00000064
+
 #define SCALER_DISPSTAT2                        0x00000068
+# define SCALER_DISPSTAT2_FRCNT2_MASK		VC4_MASK(17, 12)
+# define SCALER_DISPSTAT2_FRCNT2_SHIFT		12
+
 #define SCALER_DISPBASE2                        0x0000006c
 #define SCALER_DISPALPHA2                       0x00000070
 #define SCALER_GAMADDR                          0x00000078
-- 
2.35.1

