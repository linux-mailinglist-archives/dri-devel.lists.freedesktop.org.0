Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA265485DD
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABA210E85E;
	Mon, 13 Jun 2022 14:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3AD10E84D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:49:40 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id C62313200931;
 Mon, 13 Jun 2022 10:49:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 13 Jun 2022 10:49:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131778; x=1655218178; bh=QV
 Nx/yeWPbbKVNoFu+GBDxoyvyt/ydYR7DZmpYTHHyU=; b=A0qCjv+mwuy/xDY/Hm
 9Ei+Dm9LgT+EKoX7B6Yi0aS8jr4VTFNV2X1I9NxXJE7MiuWc3pU95+whV9gaSGNZ
 utXj0jNSXa1HjTJjQFr4+BrXuCTWq6R9OJhkb7Vd7aL40n21qZ9rauJ3T4CRdPvX
 bWBk2I2V8lf6rVVF2YMgV2mkzBuRiQf38CD3Gsv5YS7WHBkiE5H2YmtaeUupPrH4
 c0AKw8ABIob1z4mHNix4aygkyRShd2/BdgnPE1MHzVzimU7fJt+R6R4tDKE2ArI7
 WeXZwUQopi7/wl5oR10jkX7nqhY24DNe6CcKwRSzgYj+o/U+ITJGhAHXX67n8MkC
 X4Ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131778; x=1655218178; bh=QVNx/yeWPbbKV
 NoFu+GBDxoyvyt/ydYR7DZmpYTHHyU=; b=czogiTYLYSAA6zosAHuEB6IQ3BE+i
 ZR5OA2UCkaJ2YkNcQMZazLy1yef1O+Oiwa5Misudfxt0IIl559dccdOU+jlUlYe4
 OoyUx4EAoMmV4mUeIEVD4fYATu8qloJH79hOYx1wfcEuV8FvEmHmjzo+aTTnd0Ht
 X1b/RVnMfpja3wBAWhgMq2ELyeHPEr0SsfmWLpD9qvnXHwcNt/6rgTuDIM+0sw97
 VzfUhdSiSR4qnJIqUGyHVJ6A+F4/B5tEcbc/fa/693BIGIkaJDDAbmIdx87NaT5J
 ckqfCjvirFCQqmCKvY4D03SxbR+vqGGHlXVMGT/DdhYlhw/mD5HJMrSWQ==
X-ME-Sender: <xms:gk6nYrs1WsewNucLtsTW6d2zmRYHq3JmEjXeN8ng08mMZnwyQ2RlPw>
 <xme:gk6nYsf-COgLd9r64hOxgRA6NSDnBjo3f_kc02cLuvO4A_gIZD2CLpb8bOXXaSaQ6
 KtyUfQeOD6z4YhTy9o>
X-ME-Received: <xmr:gk6nYuycj0kuuhSUut0BVk31XRS8fl0tDrH6wrydEqbgalAI76bT94jzJlP6qoWRS_RZI7w0YixOMUou6PZTBD9XMr1yKbR_0Za8eDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:gk6nYqNEle_fgcXEhNPi-s9rN2ddT50P6t-2yRvRwSCd4RqQYiqM1w>
 <xmx:gk6nYr9vwPrCPgp8wcfnj_Ye9y19E9Yy8ZpaMZ8ut6nXtVfawdCoOA>
 <xmx:gk6nYqXKT8-VDvrOLFKTTs0K-f9UiGUgDfgH3XRatFvOupZPMqYt6A>
 <xmx:gk6nYmkElsiTHutSTE-sT68ro37wzqkWA2C9U8K4-TOUg7WO9J2Bwg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:49:37 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 30/33] drm/vc4: hdmi: Fix timings for interlaced modes
Date: Mon, 13 Jun 2022 16:47:57 +0200
Message-Id: <20220613144800.326124-31-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613144800.326124-1-maxime@cerno.tech>
References: <20220613144800.326124-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>

Increase the number of post-sync blanking lines on odd fields instead of
decreasing it on even fields. This makes the total number of lines
properly match the modelines.

Additionally fix the value of PV_VCONTROL_ODD_DELAY, which did not take
pixels_per_clock into account, causing some displays to invert the
fields when driven by bcm2711.

Fixes: 682e62c45406 ("drm/vc4: Fix support for interlaced modes on HDMI.")
Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c |  7 ++++---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 12 ++++++------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index f74270ad3e13..e4e8c8a4c804 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -346,7 +346,8 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_encoder *encode
 				 PV_HORZB_HACTIVE));
 
 	CRTC_WRITE(PV_VERTA,
-		   VC4_SET_FIELD(mode->crtc_vtotal - mode->crtc_vsync_end,
+		   VC4_SET_FIELD(mode->crtc_vtotal - mode->crtc_vsync_end +
+				 interlace,
 				 PV_VERTA_VBP) |
 		   VC4_SET_FIELD(mode->crtc_vsync_end - mode->crtc_vsync_start,
 				 PV_VERTA_VSYNC));
@@ -358,7 +359,7 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_encoder *encode
 	if (interlace) {
 		CRTC_WRITE(PV_VERTA_EVEN,
 			   VC4_SET_FIELD(mode->crtc_vtotal -
-					 mode->crtc_vsync_end - 1,
+					 mode->crtc_vsync_end,
 					 PV_VERTA_VBP) |
 			   VC4_SET_FIELD(mode->crtc_vsync_end -
 					 mode->crtc_vsync_start,
@@ -378,7 +379,7 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_encoder *encode
 			   PV_VCONTROL_CONTINUOUS |
 			   (is_dsi ? PV_VCONTROL_DSI : 0) |
 			   PV_VCONTROL_INTERLACE |
-			   VC4_SET_FIELD(mode->htotal * pixel_rep / 2,
+			   VC4_SET_FIELD(mode->htotal * pixel_rep / (2 * ppc),
 					 PV_VCONTROL_ODD_DELAY));
 		CRTC_WRITE(PV_VSYNCD_EVEN, 0);
 	} else {
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 95974f757b47..305807791ebd 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -983,12 +983,12 @@ static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 				   VC4_HDMI_VERTA_VFP) |
 		     VC4_SET_FIELD(mode->crtc_vdisplay, VC4_HDMI_VERTA_VAL));
 	u32 vertb = (VC4_SET_FIELD(0, VC4_HDMI_VERTB_VSPO) |
-		     VC4_SET_FIELD(mode->crtc_vtotal - mode->crtc_vsync_end,
+		     VC4_SET_FIELD(mode->crtc_vtotal - mode->crtc_vsync_end +
+				   interlaced,
 				   VC4_HDMI_VERTB_VBP));
 	u32 vertb_even = (VC4_SET_FIELD(0, VC4_HDMI_VERTB_VSPO) |
 			  VC4_SET_FIELD(mode->crtc_vtotal -
-					mode->crtc_vsync_end -
-					interlaced,
+					mode->crtc_vsync_end,
 					VC4_HDMI_VERTB_VBP));
 	unsigned long flags;
 
@@ -1036,12 +1036,12 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 				   VC5_HDMI_VERTA_VFP) |
 		     VC4_SET_FIELD(mode->crtc_vdisplay, VC5_HDMI_VERTA_VAL));
 	u32 vertb = (VC4_SET_FIELD(0, VC5_HDMI_VERTB_VSPO) |
-		     VC4_SET_FIELD(mode->crtc_vtotal - mode->crtc_vsync_end,
+		     VC4_SET_FIELD(mode->crtc_vtotal - mode->crtc_vsync_end +
+				   interlaced,
 				   VC4_HDMI_VERTB_VBP));
 	u32 vertb_even = (VC4_SET_FIELD(0, VC5_HDMI_VERTB_VSPO) |
 			  VC4_SET_FIELD(mode->crtc_vtotal -
-					mode->crtc_vsync_end -
-					interlaced,
+					mode->crtc_vsync_end,
 					VC4_HDMI_VERTB_VBP));
 	unsigned long flags;
 	unsigned char gcp;
-- 
2.36.1

