Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4775485C4
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B89A10E826;
	Mon, 13 Jun 2022 14:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C9E10E810
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:48:21 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 1134D3200931;
 Mon, 13 Jun 2022 10:48:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 13 Jun 2022 10:48:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131699; x=1655218099; bh=GQ
 mNCHWiRQ2njI4ZaYb8MBRbXyAYoY1cikYpnW9cwf8=; b=DJ2QYQ5CgWkdBDUqqq
 BLykfGXIUvg9WHOVC9PATRSnG6bxpPU6tFxa1GfmJ98YgPYG433V68hTTPG9JpgV
 g+a4qoaLp3PaBIMYXWBwES0el7ife+wFYRyByx616KSOG2LrsrYSsnynMu2gPm0q
 YbgNyrqp8MQ1UFkkCddBtItqnF16tijx3+HNFvcbMwshSJb+gONhrRlkTYkd/riR
 2b+oMQZFw6+GZZj7I7BFM5TRnv04ytjycFgsfsoKtXwfH4me4T9BXwtEluL0zRIP
 s3CZx9xKb9b9+0psZ0rQUben+NuTuUG3LHVke0W+lwJrx3v9tNGNujctGaQ96gRJ
 mjGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131699; x=1655218099; bh=GQmNCHWiRQ2nj
 I4ZaYb8MBRbXyAYoY1cikYpnW9cwf8=; b=VEpE5ZrBUpfvMz7vx94w6UmktKlVT
 cOs+kDeWMf4HHwyZ7k/HBZsRoEt7YBSL4wSfyahdS04DlZv6iGHPlKyEupJBdyaD
 zCrp9dKp6VBFay8zXXm3PmvC+lI0yT9srfpKtUJ7n/fjA5KvbDv+vWuoKxqjfWBY
 P3IkRFgfQSTIGjA/B9f2I1vavKuZnPhdjWz90IbtfW2K6PAaSMHACdK3ENCjN9vA
 uKH/wNyZs3AERT11AEIm1xWd5WB8ERHpVkRiy1wVqlgT6T2mHc2riibmP4nxHnQF
 cxvzypUsPX3M9p1wP1cqjlazLWhD7tL2Jp6N/pObrOsdE54oO3s7EKxuw==
X-ME-Sender: <xms:M06nYiDH3SvWqP2DYYaTKNIk8roSyjYWrbh9eQZBKxIV-HlPN7WclA>
 <xme:M06nYsikyod_PaOlTLM3-NS0DaRDEyAk63IdWJIj0qME4uNEnO-ZlWnwHlu9hPkdo
 x-OFvCP24m95XxjjXs>
X-ME-Received: <xmr:M06nYlkxFDFcJf2YHkm3zWuZPDzOzHr9t51nEC1124amco4O4a73UEiNRCyQ99khbVPeOpBj_CMtIPKaKmDcB_hrTCKQdHl0kPP69GI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:M06nYgxl3vrt4KXVYfwUoAro2AWI8jmlOTqIO7jW9fjbKWVcU0hJDA>
 <xmx:M06nYnSSzWph67E-iNcCbmPMED89DoRmdpkNiSN9yWTAZKWlrtDRmQ>
 <xmx:M06nYrYv8kZIQzy1QWhbAlZ6kkxPflnnXj6t0lYryI1zD9NT-qc7Kw>
 <xmx:M06nYoKI4mroDx1GUa2uFGFzhov8Go8VWdJy2vj_YDOHJG5lT5aVrQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:48:19 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 05/33] drm/vc4: plane: Fix margin calculations for the
 right/bottom edges
Date: Mon, 13 Jun 2022 16:47:32 +0200
Message-Id: <20220613144800.326124-6-maxime@cerno.tech>
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

The current plane margin calculation code clips the right and bottom
edges of the range based using the left and top margins.

This is obviously wrong, so let's fix it.

Fixes: 666e73587f90 ("drm/vc4: Take margin setup into account when updating planes")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 650c652281e8..a64324179650 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -310,16 +310,16 @@ static int vc4_plane_margins_adj(struct drm_plane_state *pstate)
 					       adjhdisplay,
 					       crtc_state->mode.hdisplay);
 	vc4_pstate->crtc_x += left;
-	if (vc4_pstate->crtc_x > crtc_state->mode.hdisplay - left)
-		vc4_pstate->crtc_x = crtc_state->mode.hdisplay - left;
+	if (vc4_pstate->crtc_x > crtc_state->mode.hdisplay - right)
+		vc4_pstate->crtc_x = crtc_state->mode.hdisplay - right;
 
 	adjvdisplay = crtc_state->mode.vdisplay - (top + bottom);
 	vc4_pstate->crtc_y = DIV_ROUND_CLOSEST(vc4_pstate->crtc_y *
 					       adjvdisplay,
 					       crtc_state->mode.vdisplay);
 	vc4_pstate->crtc_y += top;
-	if (vc4_pstate->crtc_y > crtc_state->mode.vdisplay - top)
-		vc4_pstate->crtc_y = crtc_state->mode.vdisplay - top;
+	if (vc4_pstate->crtc_y > crtc_state->mode.vdisplay - bottom)
+		vc4_pstate->crtc_y = crtc_state->mode.vdisplay - bottom;
 
 	vc4_pstate->crtc_w = DIV_ROUND_CLOSEST(vc4_pstate->crtc_w *
 					       adjhdisplay,
-- 
2.36.1

