Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A3121990E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA716E9D1;
	Thu,  9 Jul 2020 07:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1991189240
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:43:10 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 2747B2F3;
 Wed,  8 Jul 2020 13:43:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:43:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=7LPK87dqKcyIS
 7piXBp22WH1e0PljQiexcrFqlswqVc=; b=CJ4D1tZMtX9ki8jFo0TEWgM3bjwH4
 qGttCQzLGh0oPhJ6IDvH63LbzoVtPmtyr3m/mhueQNwnowHmH5uIQQiul1bBbwVU
 de9tw6nK5RafK9q0zmLMVgvrieiUAOhRfMaO/nKlOcLRxtuuP03oxbRO1NEo1rRQ
 MlSrLA7oVbM3a/18l2ITuwqiD0hZniEx6KsPWsbm+PbCOIaLNveEIfqstBLObjIB
 0onjDJGIlx6hOcUt4GxNw2UN1kzo36wnps73MMK13FTg0Q4ME41aolhICPRweAdR
 VHZW02S/BAJB7L/g3qUAV0PTJlagRE044SovImX5In1hGbl7fYfne/e8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=7LPK87dqKcyIS7piXBp22WH1e0PljQiexcrFqlswqVc=; b=gC6OIWuW
 ATsJd1Svd1oHB4uAhEXq63tOwviL/7BRYoDiC2J9/IA3ahKpkezJFyazo+8QY21w
 LX2AjhT5u9RIYkWs/FsEjaxBjt1A7BDigBsUKGK0cEZl7U6gZA2p+kIprUYalmub
 zgzSJaG0Mpf2TZ2i7vV+C9LmTwRic2YzngeRvZkZfMhQNBtTGcWCnBQhSZ6JsRi+
 4DzZDIOHPrlvdudY6w6+ivwaFQSXlBRq4tRKmQ8Uj/m7L4idxCyzIeQNtMiNrpcn
 tjNjE/Q3aBCfktGX322j62dwXjFnLwokRsk2QTCLUginr+6JwDLfDx6efhsIeRwy
 LoredBVzEkAQCg==
X-ME-Sender: <xms:rAUGX2RDY3XWpCStBo4hQyC9XLBbWY73k-kgjm6JFtQ8Nn98lH5C2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvdegne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rAUGX7yl9UknUFllXZZSl0SLZfvw6LP88ltfXao3URDfgtc3a_smNQ>
 <xmx:rAUGXz3RLvki4gpBUndpamRTvA1LIEbb5K9rfZBAJHh8b1vO5btvqw>
 <xmx:rAUGXyBRCzjZ4aQAKDMmfW3D4-z-cTQvK3TOpbV8nshPXjqA-Hc5Iw>
 <xmx:rAUGX_gWRD6j3j5o9gkOSU8gRZTjgrMXDiZ51LyxN63d4JuPKsfGIVVhfVc>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 65749328005E;
 Wed,  8 Jul 2020 13:43:08 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 26/78] drm/vc4: crtc: Remove redundant pixelvalve reset
Date: Wed,  8 Jul 2020 19:41:34 +0200
Message-Id: <35c955e88914f4d22f5bfba5b060489850b764ba.1594230107.git-series.maxime@cerno.tech>
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

Since we moved the pixelvalve configuration to atomic_enable, we're now
first calling the function that resets the pixelvalve and then the one that
configures it.

However, the first thing the latter is doing is calling the reset function,
meaning that we reset twice our pixelvalve. Let's remove the first call.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 2eda2e6429ec..2c5ff45dc315 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -427,7 +427,6 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	require_hvs_enabled(dev);
 
-	vc4_crtc_pixelvalve_reset(crtc);
 	vc4_crtc_config_pv(crtc);
 
 	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_EN);
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
