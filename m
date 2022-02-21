Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D8C4BD9FC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 14:42:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E492D10E386;
	Mon, 21 Feb 2022 13:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA64310E386
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 13:42:09 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 133FF5C0228;
 Mon, 21 Feb 2022 08:42:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 21 Feb 2022 08:42:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=c3MG28IkIDDaP+2FD0/HIcBYJMqGLk
 LuATBfhwe3ziM=; b=QMiF/j5noR9aEaeNUhlkwcmOMXiftD0Vz4EGihsGGMAwZ2
 /zOKYLjYfEEfpfBHM6k65v9UhcCpw/6L6ZSdlVmHfn0jagxtUgsW/XAMLzlSZRUS
 9NmclsnK9xBRR3B03obzJpRB2VxurRCE/xI0KUuvkuI/XHI9QQqWNK0jXu4Ddy26
 hToFyrJwKYn4cCWWKXPNsnsHN22uxtUXQE7d9ziY9g+1GDafj47pdXuvU2Fm3lae
 Q2HMWld2mrZlmWGlRvsIX2O1BVhxk6GO3BKnUQ2z8xz8emRgL6tsDR4JLa8Wl7Kq
 gZTNnz7VIUc26qr+V+gb2hX99eJijhSpV1PIspBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=c3MG28
 IkIDDaP+2FD0/HIcBYJMqGLkLuATBfhwe3ziM=; b=nCqwJ+1soxSJdfZaXzqLBU
 wfxGnX1C9ZXskBhFiJeYUani86dXp+jSdtE78x6Z+sLsN+pgLlD4Vbf7G3wAELAS
 A6kWyAcBlisSUnz5H91C2xhMcgA4JTwWFN4DAekz1hN2/xNYW5XFcmDVD98j8TNZ
 jwGaske59nu35IAvBywrh5CfWFI4V5Oqywkktnzc8yBmz36YWKNCgFp0ducXDjy9
 5lW/6ItvwKkqEVFfneE9InwzF08aVMdh+jpqg1OtY9HJo1dPrMo6UBQpjQHhpAT5
 0AfNzeEWIJwVQz1nFhdlj2uW2Ri4gYDP5zG4gPzkrCfYBdJlVIIqOQ/8x+5S3Psw
 ==
X-ME-Sender: <xms:sJYTYoveTFUOgBycevsX3QwDPLnyh0eaXV6Mqe7fqW_1azXZFXF5eQ>
 <xme:sJYTYle_xVuarmJXNqmeKSpKcObSL3UMcSH8MKsx2fp84CFrpwIsH2hKwVnvQUr-i
 tTp3yC9alMzxkYd8KM>
X-ME-Received: <xmr:sJYTYjz6rooHoNboJhLe_zfM7Yu2LFfJOyPYjPrIu8vsWb41QYLcp5EziePlbT_6JDT-F42VJxe6SWEuJbWpnYSaaEW5V8kIxa5hjIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:sJYTYrPfhT1UwM5k_xRif3aGjv38nUc6idkTSDeIhezT-cGs0U95uQ>
 <xmx:sJYTYo_VQijhLp28aCKP29yIzuSga4JCdP5SD4g114k5ufcr3_5h4w>
 <xmx:sJYTYjUEDpOz3aoS8JejF27LLdbyrQw03IuokonquIHU1PRWysjF7w>
 <xmx:sZYTYsTpQK-PaP0ygDYONcG7wFI208wzLrFHmxYGI3UalUfSKKTNdg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 08:42:08 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 4/8] drm/vc4: hvs: Remove dlist setup duplication
Date: Mon, 21 Feb 2022 14:41:51 +0100
Message-Id: <20220221134155.125447-5-maxime@cerno.tech>
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

Setting the DISPLISTx register needs to occur in every case, and we
don't need to protect the register using the event_lock, so we can just
move it after the if branches and simplify a bit the function.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index d225eea6e640..71aa5081eaa3 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -402,15 +402,12 @@ static void vc4_hvs_update_dlist(struct drm_crtc *crtc)
 			crtc->state->event = NULL;
 		}
 
-		HVS_WRITE(SCALER_DISPLISTX(vc4_state->assigned_channel),
-			  vc4_state->mm.start);
-
 		spin_unlock_irqrestore(&dev->event_lock, flags);
-	} else {
-		HVS_WRITE(SCALER_DISPLISTX(vc4_state->assigned_channel),
-			  vc4_state->mm.start);
 	}
 
+	HVS_WRITE(SCALER_DISPLISTX(vc4_state->assigned_channel),
+		  vc4_state->mm.start);
+
 	spin_lock_irqsave(&vc4_crtc->irq_lock, flags);
 	vc4_crtc->current_dlist = vc4_state->mm.start;
 	spin_unlock_irqrestore(&vc4_crtc->irq_lock, flags);
-- 
2.35.1

