Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5266A219949
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C196EA15;
	Thu,  9 Jul 2020 07:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA7E6E908
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:43:04 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 768D02F3;
 Wed,  8 Jul 2020 13:43:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:43:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=36UbLzBQ7RjLW
 xEtt4ofelHXw0uE2Ft29VdIx7RKra8=; b=esDnVTnX3pCTTitKf9lUf+/ntlvjt
 gJHLDqkBO4L3GCOJOywA9NMelo4oeUd+1Z7nB/QIHSgsxlkVbIOqVEOchfvOn7cw
 ohi0LMrteaPsdZw4bVs0qOadFPbnyVF9nv4zsvM98ON/HF2A1A+x6S45zyL2NVIP
 alJrjp4vPtbzcuYDAlWb5Kcb0Yh6HcbmhwW5SlTLBA1UD9WRlbLfoFKN9g1CBPuv
 WkAGZT4DsueNzKOhvKsEIoMMtUNc29o+j1UfkmzUwbyTmTlVN3IFGdYXuiUtWbVz
 VaWlS9KCd8idcfpf/oh1yETP2oD5OBznI/e5jDeSyMopTS00YDMRNC3Nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=36UbLzBQ7RjLWxEtt4ofelHXw0uE2Ft29VdIx7RKra8=; b=e8cnrg0H
 x/BIORGpVMUN+by7N6FjQW+3fWYa+h5a1v4Z3BA/d1FGOCVd/ef+Oa2Q8lEZyuOs
 cYrLg3QGPDk74UQ4aTazLZeC0DdYCAL0dGidUYZgR9qJ7ADqWEGBPsLu8ia550vA
 OclCEvHv8sBWy8Ug3Q3m0bJR8hm+ORzwvYsnBhxhtXIOSQW/x9uojB6V7uDvhahP
 YhGOwv3i/RyYlZyzrYBjbFv7+ICnWCW/lbjAFf6WMyOrkpJVdY8jtFLv5sFJLhV1
 p04wlpFAfKJ0C+NcuTaCGPA6vQzC0jvMf9UNRoWH9mlHwyiu5/Qp7NTnw4FGmurh
 JRpk9ySX4Enh7A==
X-ME-Sender: <xms:pgUGXyoh4ZCOIPUnT6KgdMR_c98ku9dK3I7YAFh-ERd8ZN2a9-dBeQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudelne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:pgUGXwr3VDoe1thV6OrHlAlaDMPmqcPrUwmvCwWgIPf4hP6Ex1Hvog>
 <xmx:pgUGX3ODuIxL3alG7XmtRcotKEKNjr-33f1BLunIZ_XyaGS26UM43w>
 <xmx:pgUGXx62kN0oY0PmrJnAjMSLshvbL5vmngLiseQxWJWc1Ek7F1JehA>
 <xmx:pwUGX8ZXchy7QTsdZ_dzJkkhXnto-qvMjYaFoh5gH5OI-jAMtp667Kh9i1w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id AB0A8328005E;
 Wed,  8 Jul 2020 13:43:02 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 22/78] drm/vc4: crtc: Move HVS init and close to a function
Date: Wed,  8 Jul 2020 19:41:30 +0200
Message-Id: <840cb5324364e431b15d4105c85cebf8d12257f0.1594230107.git-series.maxime@cerno.tech>
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

In order to make further refactoring easier, let's move the HVS channel
setup / teardown to their own function.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 104 +++++++++++++++++++----------------
 1 file changed, 58 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 50f9a9674a7e..78bb1c0b0b76 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -196,6 +196,62 @@ static void vc4_hvs_update_gamma_lut(struct drm_crtc *crtc)
 	vc4_hvs_lut_load(crtc);
 }
 
+static int vc4_hvs_init_channel(struct vc4_dev *vc4, struct drm_crtc *crtc,
+				struct drm_display_mode *mode, bool oneshot)
+{
+	struct vc4_crtc_state *vc4_crtc_state = to_vc4_crtc_state(crtc->state);
+	unsigned int chan = vc4_crtc_state->assigned_channel;
+	u32 dispctrl;
+
+	/* Turn on the scaler, which will wait for vstart to start
+	 * compositing.
+	 * When feeding the transposer, we should operate in oneshot
+	 * mode.
+	 */
+	dispctrl = SCALER_DISPCTRLX_ENABLE;
+
+	if (!vc4->hvs->hvs5)
+		dispctrl |= VC4_SET_FIELD(mode->hdisplay,
+					  SCALER_DISPCTRLX_WIDTH) |
+			    VC4_SET_FIELD(mode->vdisplay,
+					  SCALER_DISPCTRLX_HEIGHT) |
+			    (oneshot ? SCALER_DISPCTRLX_ONESHOT : 0);
+	else
+		dispctrl |= VC4_SET_FIELD(mode->hdisplay,
+					  SCALER5_DISPCTRLX_WIDTH) |
+			    VC4_SET_FIELD(mode->vdisplay,
+					  SCALER5_DISPCTRLX_HEIGHT) |
+			    (oneshot ? SCALER5_DISPCTRLX_ONESHOT : 0);
+
+	HVS_WRITE(SCALER_DISPCTRLX(chan), dispctrl);
+
+	return 0;
+}
+
+static void vc4_hvs_stop_channel(struct drm_device *dev, unsigned int chan)
+{
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+
+	if (HVS_READ(SCALER_DISPCTRLX(chan)) & SCALER_DISPCTRLX_ENABLE)
+		return;
+
+	HVS_WRITE(SCALER_DISPCTRLX(chan),
+		  HVS_READ(SCALER_DISPCTRLX(chan)) | SCALER_DISPCTRLX_RESET);
+	HVS_WRITE(SCALER_DISPCTRLX(chan),
+		  HVS_READ(SCALER_DISPCTRLX(chan)) & ~SCALER_DISPCTRLX_ENABLE);
+
+	/* Once we leave, the scaler should be disabled and its fifo empty. */
+	WARN_ON_ONCE(HVS_READ(SCALER_DISPCTRLX(chan)) & SCALER_DISPCTRLX_RESET);
+
+	WARN_ON_ONCE(VC4_GET_FIELD(HVS_READ(SCALER_DISPSTATX(chan)),
+				   SCALER_DISPSTATX_MODE) !=
+		     SCALER_DISPSTATX_MODE_DISABLED);
+
+	WARN_ON_ONCE((HVS_READ(SCALER_DISPSTATX(chan)) &
+		      (SCALER_DISPSTATX_FULL | SCALER_DISPSTATX_EMPTY)) !=
+		     SCALER_DISPSTATX_EMPTY);
+}
+
 int vc4_hvs_atomic_check(struct drm_crtc *crtc,
 			 struct drm_crtc_state *state)
 {
@@ -268,63 +324,19 @@ void vc4_hvs_atomic_enable(struct drm_crtc *crtc,
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	bool oneshot = vc4_state->feed_txp;
-	u32 dispctrl;
 
 	vc4_hvs_update_dlist(crtc);
-
-	/* Turn on the scaler, which will wait for vstart to start
-	 * compositing.
-	 * When feeding the transposer, we should operate in oneshot
-	 * mode.
-	 */
-	dispctrl = SCALER_DISPCTRLX_ENABLE;
-
-	if (!vc4->hvs->hvs5)
-		dispctrl |= VC4_SET_FIELD(mode->hdisplay,
-					  SCALER_DISPCTRLX_WIDTH) |
-			    VC4_SET_FIELD(mode->vdisplay,
-					  SCALER_DISPCTRLX_HEIGHT) |
-			    (oneshot ? SCALER_DISPCTRLX_ONESHOT : 0);
-	else
-		dispctrl |= VC4_SET_FIELD(mode->hdisplay,
-					  SCALER5_DISPCTRLX_WIDTH) |
-			    VC4_SET_FIELD(mode->vdisplay,
-					  SCALER5_DISPCTRLX_HEIGHT) |
-			    (oneshot ? SCALER5_DISPCTRLX_ONESHOT : 0);
-
-	HVS_WRITE(SCALER_DISPCTRLX(vc4_state->assigned_channel), dispctrl);
+	vc4_hvs_init_channel(vc4, crtc, mode, oneshot);
 }
 
 void vc4_hvs_atomic_disable(struct drm_crtc *crtc,
 			    struct drm_crtc_state *old_state)
 {
 	struct drm_device *dev = crtc->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(old_state);
 	unsigned int chan = vc4_state->assigned_channel;
 
-	if (HVS_READ(SCALER_DISPCTRLX(chan)) &
-	    SCALER_DISPCTRLX_ENABLE) {
-		HVS_WRITE(SCALER_DISPCTRLX(chan),
-			  SCALER_DISPCTRLX_RESET);
-
-		/* While the docs say that reset is self-clearing, it
-		 * seems it doesn't actually.
-		 */
-		HVS_WRITE(SCALER_DISPCTRLX(chan), 0);
-	}
-
-	/* Once we leave, the scaler should be disabled and its fifo empty. */
-
-	WARN_ON_ONCE(HVS_READ(SCALER_DISPCTRLX(chan)) & SCALER_DISPCTRLX_RESET);
-
-	WARN_ON_ONCE(VC4_GET_FIELD(HVS_READ(SCALER_DISPSTATX(chan)),
-				   SCALER_DISPSTATX_MODE) !=
-		     SCALER_DISPSTATX_MODE_DISABLED);
-
-	WARN_ON_ONCE((HVS_READ(SCALER_DISPSTATX(chan)) &
-		      (SCALER_DISPSTATX_FULL | SCALER_DISPSTATX_EMPTY)) !=
-		     SCALER_DISPSTATX_EMPTY);
+	vc4_hvs_stop_channel(dev, chan);
 }
 
 void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
