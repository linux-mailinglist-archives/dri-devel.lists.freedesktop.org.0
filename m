Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F2F4EDBD1
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 16:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E5D10F038;
	Thu, 31 Mar 2022 14:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C5210EF0F
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 14:37:53 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 053195C01DE;
 Thu, 31 Mar 2022 10:37:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 31 Mar 2022 10:37:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=EwCp/DR+rW/qEY57wYmp8SO8XM0oma
 p1E8ZRNb6qI4w=; b=XidymD/T0iGhgBUu4DycoGXgSlfA+z+mu1an9q9/2qiOng
 UHi+pIuIELATqzgcIvQC0tzioljaCtJTXJBvgV7GH5tJNKEjmZVrYrI+uym5lVEz
 8SlY/bWEXQHPuOgNZVe2el36xOeGGuAOT74S3ntHilHsLvefznLcmcwCiNhbto2Z
 tOIzakJql1eyBE9zuEDCvwJYN1aRcdA+ZBiQq+Bz8pPRMxk+btCsuKWRHkq27x2K
 ODbilkbtTbnHeaOO0ngXoOFikJn2pr/TBOUwePNYFgO5PFDN99pagvPtQVkqjaJE
 NRlqAeKpEMIwKI3tr3czJRJsXYvK2MfkzmqDsVGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=EwCp/D
 R+rW/qEY57wYmp8SO8XM0omap1E8ZRNb6qI4w=; b=n2MBw+ihtuoxt5iKV7grSr
 m8VP/ib/GX7eB3GWpNTNGWnKBUTxbsj8X7XoZK/Yl/NxghRzZI7R5xyWlIVp0XYY
 0/4LQy1iir7hXwE/djCf2co6u5jhYoBteRjZR7dH5Lrb8w6iIjL1XyjPv12vGYV+
 tSb0htKslrWKDvbFHQmJQKo9eUbeGzLYvkbydamKYnRUnVMVgrHSVxE6+mtZW1u5
 cqthhLn2Ar3SJpI/XDmStiuiK3aRclXLI1orrFE0umcQ2qGpxGOL5wYftIajnpfi
 1tq+aY0pY1wTyxmKXN0q2K8YDPpVIyb1cTsw47zW7XcYOmB8nQClT0oG/LPWFp8Q
 ==
X-ME-Sender: <xms:wLxFYp9zp6Em9qoES2b4s90ONICNOP8oB1IJlnIMStlpMeNb_rHEpg>
 <xme:wLxFYtswtwZuJ1HdJc26EEm6XUH7EQ5QW6q9O2dzdPYD_JLTs7elnmq7hSiSZFUmW
 UGNqp5cwLvW0eM4Gr8>
X-ME-Received: <xmr:wLxFYnDnKF2DMsnjKFPUitLogUW1VTKnRcAFO1Qxj-rtxf5MnuT9qSFsx2VTc4C8sggP1Vg57STR9WHYAj-W8Kn1hrBZqzqyT-mPPDo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wLxFYteWfCqUR91VNo5KWE1G6oaUtJiKlViIaT2Jz-ghvmyC9An12A>
 <xmx:wLxFYuMnCcMmMrAD-70jW5iF675_kJA52m97qM8zIM_W6K1vt7cbrA>
 <xmx:wLxFYvmJ5mQLum1YQjXVPfUVDQh64gU3S5eoVQbM7CiXvx2JZfscUw>
 <xmx:wLxFYrq7YQk-t2TkhFZj5CFkFr4AVQzNSkK7rjb7HoU1zSgIcBsTkQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 31 Mar 2022 10:37:52 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/7] drm/vc4: hvs: Fix frame count register readout
Date: Thu, 31 Mar 2022 16:37:39 +0200
Message-Id: <20220331143744.777652-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331143744.777652-1-maxime@cerno.tech>
References: <20220331143744.777652-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
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

