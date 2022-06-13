Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA7D5485CD
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C0510E81F;
	Mon, 13 Jun 2022 14:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2445510E831
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:48:49 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id D47DF320092F;
 Mon, 13 Jun 2022 10:48:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 13 Jun 2022 10:48:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131727; x=1655218127; bh=KH
 ZRkDe5yeSpJOdGiis5SGfnEIVsa3JE4VNn7r8SFJU=; b=E+x0x/AItqbu4W5JOH
 eWuSjoIUOc1l8UlvoQBTBZ0RoUSztw0+xC/TRQy4f/WGVVHjQJk/c//hP3MdQD2M
 R0GqxqMfhcsR6eqIXXQLtFmEURVNzWN5GMRZUoqKjo3EADBvVCBxZ7yKuidv1WTp
 VlWRBMYQr+qKUnC29tv2WNAxAK/rGGVR9/6defGT68ZWxXovx2i52cqNSaRkTS9T
 /Eake+vmwovF7ijuXoSDxRjsOBuFjGaa5AsEpnbouGWizCH7dXNf0q0t8KA1iU7W
 pjUg8UxO1YYcpe98fJueR8eIROuVg93lZOhasnOP+jxZL8CMDDdmJKW21KMxIMZ1
 P0Vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131727; x=1655218127; bh=KHZRkDe5yeSpJ
 OdGiis5SGfnEIVsa3JE4VNn7r8SFJU=; b=f8ASt34qA/3I12JvRaBzVFn14/iNn
 ooKyZ1cMOPEo+hvx/RWnEpbO34NMwuwJGDla2xaDwdFSQfXauwRJ+NX1W50YCgdR
 hslRXFREXgnmRr3KXu49JBq92VZEiNGsfR1b7C3jdLmFhRHSEIOKplk6wgJBE9pO
 1MK+uuZY1enfwG5dy/Qke52olH/xVODAH1FvqL1iJb+aJx/LS4XWea3ZjVhhxBY9
 gtIGodnztvhOYIwyGyTCLxLg5YsAxoReKTwRqP8dBnpXRkbHFDUux5clsGtLqosW
 YteGqa9MP0mlUJU+RJq8UWVSIRGiKrv74JC4kueAhzXq4HoNKcqyGbscg==
X-ME-Sender: <xms:T06nYj_V5M4nPlFm-i4xmcuzLK6yMMfQ6dTmURbZC1IZ2EdE3ubzkQ>
 <xme:T06nYvuBDy_Gwg5kLAMWrr6lA2Ou5HCyhMqQT7L7Lb9lsdZIcyUGPA9sSpSVxfM4q
 -HQDXGxZ7xQ6_sdOKM>
X-ME-Received: <xmr:T06nYhAyJm1YNQoEmVnt-3evDbf5zEYBAxLF5WODoBkJ6Soi8ka13fr6UXzERjDkgVsVaQ-AV9WB9FzXK9dyIEN_PPnhX7HUvp3vTwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:T06nYvcc4RX5CvA7RVt0sZdI_FBAhayGEFP_nUjqsbHklO8wQ_MWyg>
 <xmx:T06nYoMD17JuN4TfQm6gI3sGoXp7eZVsLmeKDDASxWjDll9tx9TnRA>
 <xmx:T06nYhnNXqqlia6eC683ghiDflk8rrdjKwuV_4LTSl_B97B3R2x1eA>
 <xmx:T06nYn2sPm_XqLMJoUPN1yyMOrq9zIxG4mebFTuqS3RY4eOgziv0FQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:48:46 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 14/33] drm/vc4: dsi: Register dsi0 as the correct vc4 encoder
 type
Date: Mon, 13 Jun 2022 16:47:41 +0200
Message-Id: <20220613144800.326124-15-maxime@cerno.tech>
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

vc4_dsi was registering both dsi0 and dsi1 as VC4_ENCODER_TYPE_DSI1
which seemed to work OK for a single DSI display, but fails
if there are two DSI displays connected.

Update to register the correct type.

Fixes: 4078f5757144 ("drm/vc4: Add DSI driver")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 81a6c4e9576d..97a258c934af 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1518,7 +1518,8 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 		return -ENOMEM;
 
 	INIT_LIST_HEAD(&dsi->bridge_chain);
-	vc4_dsi_encoder->base.type = VC4_ENCODER_TYPE_DSI1;
+	vc4_dsi_encoder->base.type = dsi->variant->port ?
+			VC4_ENCODER_TYPE_DSI1 : VC4_ENCODER_TYPE_DSI0;
 	vc4_dsi_encoder->dsi = dsi;
 	dsi->encoder = &vc4_dsi_encoder->base.base;
 
-- 
2.36.1

