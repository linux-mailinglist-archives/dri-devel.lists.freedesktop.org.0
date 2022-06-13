Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6969A5485CC
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC2810E82F;
	Mon, 13 Jun 2022 14:48:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BBC710E81F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:48:46 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id B8E70320092F;
 Mon, 13 Jun 2022 10:48:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 13 Jun 2022 10:48:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131724; x=1655218124; bh=gs
 Z+0dF52jGkjphNjY9ehU/ZgQc7Gx9ag0fLRQvtymQ=; b=cpEyHUL5LVh/qFykau
 KH7BRNaRphYKbp71IM6pi9WAjTfYE4oNEH9n5/SwHXKOhgTJ/rEzP83A7Lx9YHcA
 6LBQhVr18FXcU+GAwqEpxHNp/s2gmJhQO5MN7SKzTyIwe+zKv0i8OubiwRHFiU6Z
 UGrLf5OhwgS/iKvuKyQ+5niXaOR2LMIfJ/r9BXDDX0dDK7WB/xrANT1NJXvJgHHt
 nYLfQwfbNJdVBQUI9GQWatBUtuqandIw9avD2PN2R5a5UB61sWfO15G6o7JLna4J
 S8R/CVtb4y7ETn/yWaRba2SC3mrZnL10pUZFXq65jGg0U+bIDEDZdRfjj34iJH8q
 +12Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131724; x=1655218124; bh=gsZ+0dF52jGkj
 phNjY9ehU/ZgQc7Gx9ag0fLRQvtymQ=; b=h/kJl0dcGFPzBwN/qnU4wT0gF9ket
 pSRnq4N3FiDK7cyVkhSVUzMGo/eGVGM8ZWnWEQ437UyyMhUXKK9VoCGdIvRp1vWO
 O8Ey9NQDHeCdq1U36oRPJwOaMv2w5jzHXJLsl84acDx5t4IQbZmNbi7V2XpFq6ld
 ff78Y4ISWdU/YAClG1kpW/Zn45tsyVpmfFwKtoE4mZ5pdQhj3UeCRzHuyFDIWkxN
 uZWSoywfP5h3pO6aJBC14mzqlukr37M6uZw4wslZFaI4GUU7U5fKDmQUxUDR6cuS
 LSpl6+PYPlMEvSaQ6u3V31XIZNuaVX3SzNv2l4OSgQgCbj4tlNx/bp/1A==
X-ME-Sender: <xms:TE6nYsT86VUquh2LhdQ8Isl7tgkRmoFz6tRn8KPLld3khJq24TiJUQ>
 <xme:TE6nYpzTXhIaNAM-RFErqy-Z-raN7ibNSSN4wlxViGpsxW658w0fE0t-lXBVjN4fD
 jWS0Qt-QoTmX9FLIkY>
X-ME-Received: <xmr:TE6nYp2ZrlcRSGSKsmkKcW4VEYQMxxOQY_BmcpCsnqQT0av5wl93cQKv_uGMsfxxhXF3-vohoEWFwR0H1BJEgDkku5-KhCeKdMq92m0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:TE6nYgDi-TrEksdb0mS0LDJD3iBaZ1zXk5fKMuxjIdGNcvbX6MXM9Q>
 <xmx:TE6nYlj-tDEUODz2Z_aWvrV-jxueY0JDthz_z4vrwatxe_MsOzRwdQ>
 <xmx:TE6nYsr3mRDZFvyEclBsOKvYEOnriB3komO4DU7e9cRhdN5L-NHudQ>
 <xmx:TE6nYjazC7s0uT1SOHc26QAOwBV7tYMsGmKYUl5xCzTz_yOx0hePOA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:48:43 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 13/33] drm/vc4: dsi: Correct pixel order for DSI0
Date: Mon, 13 Jun 2022 16:47:40 +0200
Message-Id: <20220613144800.326124-14-maxime@cerno.tech>
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

For slightly unknown reasons, dsi0 takes a different pixel format
to dsi1, and that has to be set in the pixel valve.

Amend the setup accordingly.

Fixes: a86773d120d7 ("drm/vc4: Add support for feeding DSI encoders from the pixel valve.")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 59b20c8f132b..f74270ad3e13 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -319,7 +319,8 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_encoder *encode
 	u32 pixel_rep = (mode->flags & DRM_MODE_FLAG_DBLCLK) ? 2 : 1;
 	bool is_dsi = (vc4_encoder->type == VC4_ENCODER_TYPE_DSI0 ||
 		       vc4_encoder->type == VC4_ENCODER_TYPE_DSI1);
-	u32 format = is_dsi ? PV_CONTROL_FORMAT_DSIV_24 : PV_CONTROL_FORMAT_24;
+	bool is_dsi1 = vc4_encoder->type == VC4_ENCODER_TYPE_DSI1;
+	u32 format = is_dsi1 ? PV_CONTROL_FORMAT_DSIV_24 : PV_CONTROL_FORMAT_24;
 	u8 ppc = pv_data->pixels_per_clock;
 	bool debug_dump_regs = false;
 
-- 
2.36.1

