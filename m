Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CDC645964
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 12:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF7210E1A4;
	Wed,  7 Dec 2022 11:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B296A10E195
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 11:55:18 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 193EB5C01C2;
 Wed,  7 Dec 2022 06:55:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 07 Dec 2022 06:55:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1670414118; x=
 1670500518; bh=zfh+DFvtRGGbEZ4zGoqcZy3My+UVQYZ3yqCxeBPCRGE=; b=W
 spIhQoCXldF6DL59sNy/YlIi/DVbARJyzQOhwpz0KQMgPTUsNpAQ68PI+UeVwC2J
 EIHDaZu3bLtsDsSnPKIGMO33wQ6lGNhwx6ecdaZPADReEftkCNXuxmtQ04OWQ4MP
 lKLn0gouAvRkg4+QgO0CulMb7yNJH3rjqxvAZ4VLVD7WDiuOLwkAqhG70Px/MVb4
 khHgdurWhYenuWZLJdL7hcRO85KuRH2xL8AMebqGLhJGagOC8WNMO1Iq/g2TWm3b
 FlblRxTQdjzVbdRyp+ipbJFsd+993ilGGNdnevr1CfFIx9sW1aYhXKLGIdO88L8D
 0+MEZ8R9xFL+rCGpWNJig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670414118; x=
 1670500518; bh=zfh+DFvtRGGbEZ4zGoqcZy3My+UVQYZ3yqCxeBPCRGE=; b=E
 pK/+OeXOL6dzZZd3fbOD/mXFISQhadUAjiGKytOpKj7DP7AIdITFlovgwWL8OTsa
 dTjjdj1+EJJwf1oFpj7MSWjYMZjBwNyYnXL9XtFqaRa5m3UTfG/PQz0e2/h+vW7t
 QNHnxZGkOLUXo4O8GjL+tGqUuT4Sb2x3GJmxsvStIX2tOZRmN3lzMRJGBxUGgDDM
 7cEpyl4xePUvTnmTYAazzMFi36JHzkE1n5weLlle6zcUF9Rzho5JkGwqyISkAcuU
 yAo5DmeV8p7L6B8EaflSVLEMKic/2mXPqwI4rLZHXIFJcgGM5FrRGc3OTuJ5XyQu
 S97PqC7v6K6T7bq+2tcfw==
X-ME-Sender: <xms:JX-QYzhmki8rnKCmbSHOgIPJhx25b5bFbQaN8Z0_sd7D46eYKQsdGA>
 <xme:JX-QYwDywdxU_573t0xybiL6d7WvTaWwGz8VXbSFAcdSkaDptQpLHPivCKYgJZ75R
 CAtp5ign6VQFalofqo>
X-ME-Received: <xmr:JX-QYzFiYE0HpmlA97Fg-Ibi5-78QddEf62AFOF53Nw-aXPvgyaJjngfjTxoWi8gcEYucYkACnra8pEReRoW7LH8rPp6sj130r9t0wrYywLjEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevvdelieejgedvkeffheekheeilefhgefgffehteekueelvddtueffheet
 ledtffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JX-QYwRBUdIpI6RDrdp3w5wQkRPVYgXiefIm8uJ5KNSegdPQOkZyDw>
 <xmx:JX-QYwwL9jCxPVxif0n92fGTGQdzeU0lA0Hi1F-IQ0M2ChDZohvNdQ>
 <xmx:JX-QY24Ypv4ul4E3GU-mDZfOV2A-TcAlLuO83c0PMD5dUUpV_rXLhw>
 <xmx:Jn-QYxpbm6oEbocZx57e-7vWOiw1VVnGMh_Ww2WNSXhDc3tL-aYyJA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 06:55:17 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 12:53:14 +0100
Subject: [PATCH 03/15] drm/vc4: hvs: SCALER_DISPBKGND_AUTOHS is only valid on
 HVS4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hvs-crtc-misc-v1-3-1f8e0770798b@cerno.tech>
References: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
In-Reply-To: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Eric Anholt <eric@anholt.net>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=2507; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=bHSsWi5ORj0LfVSQpBfXbWIYaEJTcfVkf2cBdvnCRG0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkT6lZYV/x+brOo2cVpbzfrY1W7C4tlZFeLBFT9+7E1Jvdt
 6ZJVHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZiI/idGhhMvcr1599uIeQvve+sTc9
 bLXeRD3KXjbrdN783/sPGSmhnDH55JKyYlvGbW2Rx6Ja3H6f00FZ03nzZwHu97m13i9dFuBT8A
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Maxime Ripard <maxime@cerno.tech>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The bit used for SCALER_DISPBKGND_AUTOHS in SCALER_DISPBKGNDX
has been repurposed on HVS5 to configure whether a display can
win back-to-back arbitration wins for the COB.

This is not desirable, therefore only select this bit on HVS4,
and explicitly clear it on HVS5.

Fixes: c54619b0bfb3 ("drm/vc4: Add support for the BCM2711 HVS5")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hvs.c  | 10 ++++++----
 drivers/gpu/drm/vc4/vc4_regs.h |  1 +
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index b335815eac6a..57d99e7199ee 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -370,28 +370,30 @@ static int vc4_hvs_init_channel(struct vc4_hvs *hvs, struct drm_crtc *crtc,
 	 * mode.
 	 */
 	dispctrl = SCALER_DISPCTRLX_ENABLE;
+	dispbkgndx = HVS_READ(SCALER_DISPBKGNDX(chan));
 
-	if (!vc4->is_vc5)
+	if (!vc4->is_vc5) {
 		dispctrl |= VC4_SET_FIELD(mode->hdisplay,
 					  SCALER_DISPCTRLX_WIDTH) |
 			    VC4_SET_FIELD(mode->vdisplay,
 					  SCALER_DISPCTRLX_HEIGHT) |
 			    (oneshot ? SCALER_DISPCTRLX_ONESHOT : 0);
-	else
+		dispbkgndx |= SCALER_DISPBKGND_AUTOHS;
+	} else {
 		dispctrl |= VC4_SET_FIELD(mode->hdisplay,
 					  SCALER5_DISPCTRLX_WIDTH) |
 			    VC4_SET_FIELD(mode->vdisplay,
 					  SCALER5_DISPCTRLX_HEIGHT) |
 			    (oneshot ? SCALER5_DISPCTRLX_ONESHOT : 0);
+		dispbkgndx &= ~SCALER5_DISPBKGND_BCK2BCK;
+	}
 
 	HVS_WRITE(SCALER_DISPCTRLX(chan), dispctrl);
 
-	dispbkgndx = HVS_READ(SCALER_DISPBKGNDX(chan));
 	dispbkgndx &= ~SCALER_DISPBKGND_GAMMA;
 	dispbkgndx &= ~SCALER_DISPBKGND_INTERLACE;
 
 	HVS_WRITE(SCALER_DISPBKGNDX(chan), dispbkgndx |
-		  SCALER_DISPBKGND_AUTOHS |
 		  ((!vc4->is_vc5) ? SCALER_DISPBKGND_GAMMA : 0) |
 		  (interlace ? SCALER_DISPBKGND_INTERLACE : 0));
 
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index f121905c404d..95deacdc31e7 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -366,6 +366,7 @@
 
 #define SCALER_DISPBKGND0                       0x00000044
 # define SCALER_DISPBKGND_AUTOHS		BIT(31)
+# define SCALER5_DISPBKGND_BCK2BCK		BIT(31)
 # define SCALER_DISPBKGND_INTERLACE		BIT(30)
 # define SCALER_DISPBKGND_GAMMA			BIT(29)
 # define SCALER_DISPBKGND_TESTMODE_MASK		VC4_MASK(28, 25)

-- 
2.38.1
