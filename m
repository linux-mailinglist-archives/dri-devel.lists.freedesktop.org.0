Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 545425485DF
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BAF10E861;
	Mon, 13 Jun 2022 14:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4179410E861
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:49:46 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id F2A313200926;
 Mon, 13 Jun 2022 10:49:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 13 Jun 2022 10:49:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131784; x=1655218184; bh=eK
 26XlnBxOVQvR1GXLmFUQaHj30ErJLeiy3wTEsX9zs=; b=BQv79X0mCIRKL8+R2A
 wbMpEfOWfXa+uuWYayMptVYEJcn+pGxclp6oOL9TzHOZ9nhicdz35jgtOoCodKhr
 npl4EW5WNdhLoV2sty4qzKQlYBGSLoigF/N3qnn1imxoFXexX9RDkmQjYD38TRKX
 7SLTDs4oTdahFxePgkpoa2TupG7crniL3R0UOgCoHdIFi0fapMQWIIOK809Syvnz
 gUVRb/MmicKEwm5ruOBhUMADCrFHPxKpwKNUaF8lO9OyL4UnZCBtizLSsGEXNrUl
 fGWYXCSFok911lYL955eUgnr85e/iEhlN6iAwHyTTsnlwQutA6zkLOhDWQKCMODu
 CYuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131784; x=1655218184; bh=eK26XlnBxOVQv
 R1GXLmFUQaHj30ErJLeiy3wTEsX9zs=; b=gaBXrwTIKBvqFcawCoFKH/B5oY5KJ
 czbsJcYgcqYjASmQf63R63TkqROvB6s1xFTcFy5seMPKLanKasomKZxJbuyTqwfH
 dS/18A7RPSx00Ri46A3rtRGCYMLr4vxvjBINpwYhbnLUvRG9pxlbemvmmxpAbPiE
 7vUYqxjYqeyaLLrMt2F7imSJZM8JJDVama+24SjtVrRzH1PWLOe4DRWfnjR2QSll
 uyqjHbIWTs+9MbRWGJrLM01BuLmzjUaAOoT7rfUfxXiN8mVOZPCZEMJ4/FsDUgYs
 ghGybdW8WuYcd7IwhggtcvtGwwYBmx2UKUspmbk5RxBYLnIyzTzz7JWuQ==
X-ME-Sender: <xms:iE6nYqDxgZepO2EryS6RzeYiVpinKAJDJZNrsLAEwzbiAvSw3uSj1Q>
 <xme:iE6nYki93wgI0-jLolCXeCJ-M5dHa2SmvVThF8wwSEny1i1iQcznl2luP4VMotnJs
 U0XM_tJfenFt01yB_U>
X-ME-Received: <xmr:iE6nYtmfErHJqRscA4q9eR3iomhw0rxOS5RhQw2OIPTDsQ_alzcFpbp5P3Pp1PHbx8OmE75Jsl35tt_RXaKFQdjTjucCigGme0k_gCI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:iE6nYoxxeu_mgJvFGcPVKZyYC7I_B1dQeTMY623kprCVqCdr41mYMw>
 <xmx:iE6nYvTkeUrRVrXJ1p9q9-qjx74fuHT-uPE7qPJbCE7IQgmWDYR3gA>
 <xmx:iE6nYjZQcGPdnYGQ73Bv1b9eJS1ST-IVB3D4_bAseDnN7e5PKYGmnw>
 <xmx:iE6nYgLt6MKOIdE5U8HDtapAPmVpNMm9F93-a68AaO_fnN-LlFsH-g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:49:43 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 32/33] drm/vc4: hdmi: Correct HDMI timing registers for
 interlaced modes
Date: Mon, 13 Jun 2022 16:47:59 +0200
Message-Id: <20220613144800.326124-33-maxime@cerno.tech>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

For interlaced modes the timings were not being correctly
programmed into the HDMI block, so correct them.

Fixes: 8323989140f3 ("drm/vc4: hdmi: Support the BCM2711 HDMI controllers")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 03fa2d4c1827..75cba7edaf51 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1035,13 +1035,13 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 		     VC4_SET_FIELD(mode->crtc_vsync_start - mode->crtc_vdisplay,
 				   VC5_HDMI_VERTA_VFP) |
 		     VC4_SET_FIELD(mode->crtc_vdisplay, VC5_HDMI_VERTA_VAL));
-	u32 vertb = (VC4_SET_FIELD(0, VC5_HDMI_VERTB_VSPO) |
-		     VC4_SET_FIELD(mode->crtc_vtotal - mode->crtc_vsync_end +
-				   interlaced,
+	u32 vertb = (VC4_SET_FIELD(mode->htotal >> (2 - pixel_rep),
+				   VC5_HDMI_VERTB_VSPO) |
+		     VC4_SET_FIELD(mode->crtc_vtotal - mode->crtc_vsync_end,
 				   VC4_HDMI_VERTB_VBP));
 	u32 vertb_even = (VC4_SET_FIELD(0, VC5_HDMI_VERTB_VSPO) |
 			  VC4_SET_FIELD(mode->crtc_vtotal -
-					mode->crtc_vsync_end,
+					mode->crtc_vsync_end - interlaced,
 					VC4_HDMI_VERTB_VBP));
 	unsigned long flags;
 	unsigned char gcp;
-- 
2.36.1

