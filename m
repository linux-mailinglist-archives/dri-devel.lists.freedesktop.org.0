Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C315645963
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 12:55:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818CE10E195;
	Wed,  7 Dec 2022 11:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD3E10E040
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 11:55:16 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 314C95C01D2;
 Wed,  7 Dec 2022 06:55:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 07 Dec 2022 06:55:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1670414116; x=
 1670500516; bh=cgA6d+4dUlDzfnltPNtWykCIIcDwat2TyYFhVCQ2H5Q=; b=Q
 vpz7jsaL5e4J6kpa/2OjsJlH31gDrakx98rbMQWLedhLlOfuEcb8Vy9DvmHaxnFE
 CCUq6g6LsVJWoMEy9uyBv5KXQiw508OM+aVYf6c969HZcktR0nXZy2TeqoKoz4U1
 VnO72AY1SzzWBLzFophr9DodLQp5RvCTDncWbhyRwCiSw1Z5bNEqAqyitzpMWgvV
 9G8cZb+larnbo9GEE+zlDX5VkzOIgjYZ9k1BtGRJOS6vTzvEQdE5vSO/xhAEITcM
 TY5Q9W4ITiNYQdEYEyVJkdOpLZpqPmJ8wgnwa833CxS2FF0wL21IbfZpnakbrpGM
 yv/oGJvkDS9dcd17L0WDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670414116; x=
 1670500516; bh=cgA6d+4dUlDzfnltPNtWykCIIcDwat2TyYFhVCQ2H5Q=; b=r
 HR3WmrYKbHJ2nTOIh71F7giWk5ThI2DIC0wv4zW24fqiIOrOPpLymnJ4okQW5lch
 uoB22gj9ZUM2o8oo72QMdYrCmbAlHE7HOFabJiE6CTTt9ZYNVx4do5xgiz6QDKu2
 UYf42vrZ1OB97+V27Za8uEXsxZY0MZo769PzyMv6a/K5grcz/i+eHf9DJW0Yxnbo
 J7V8vh6njULQ/0KFulKllKiSqgbvoZ1tIVt/3vcTklV+nJCp3PgdPcNMlZ7ozHT3
 WWStQXhQJ47Tj6DGHw2xt6VZB8iffy1rvVAh6pH93EAfmxxZsKL0zWDFZl9TthdR
 26HZC7SL7CQ1dMqpdVojA==
X-ME-Sender: <xms:JH-QY6rBxKyrjJbMkuFIbLD9qeP5yk8cX71lWO7Sibl-zyrZnO_dgg>
 <xme:JH-QY4pNc5KNqlYrMm1pl-cpBHYLTmg-yjGhOXxfiZlhvMQN0nGW3DxxwWNXMWVa2
 TnPDncaDdb1La4UwHg>
X-ME-Received: <xmr:JH-QY_NXWhFfU04b2Ubx-dl59iKb886QqP1kg8c28hLWyHYu66_Y9oVUyut4FtxItJ6knAyA-kSY9QPfFFep9zIJzAS3vZ7ubZd-DaZ1JKKpkQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevvdelieejgedvkeffheekheeilefhgefgffehteekueelvddtueffheet
 ledtffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JH-QY54wY6HHoGNDPHegLo0ifIbO4GgoOvay5OhzoP8pOTFf8nyQGQ>
 <xmx:JH-QY55r1eZ56gozeVhg7S03hp4shyuxKFJ8Pnx6JCK_U2o2f-7tDg>
 <xmx:JH-QY5hiHcIzLUaF3ilNTuD918VTCDG7XC4B6onMLRpdY7Omz-jWBw>
 <xmx:JH-QY2xU7VMOipV9Tj_cm-uHCXEYbMMjp6UKMHB0q1HadSS0FnY3zw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 06:55:15 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 12:53:13 +0100
Subject: [PATCH 02/15] drm/vc4: hvs: Set AXI panic modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hvs-crtc-misc-v1-2-1f8e0770798b@cerno.tech>
References: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
In-Reply-To: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Eric Anholt <eric@anholt.net>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=2370; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=0biGh0FnANUUjG50YK2xmZS4z/LRgsYNW9+V7Hu3tWI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkT6lasOPM64Kbt526bDab1iyb6Pj3tMmvpI8tJNwx3pRzb
 Fsj9qaOUhUGMi0FWTJElRth8SdypWa872fjmwcxhZQIZwsDFKQATSV7G8M98EoukBIfO2tKePZquPz
 jcfklamkd/Trxxt8VBpOaWdREjw2muHM3+4MSaV6f3VZbcW93Gsqpse3DAL5cO4WaFnwpXWQA=
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

The HVS can change AXI request mode based on how full the COB
FIFOs are.
Until now the vc4 driver has been relying on the firmware to
have set these to sensible values.

With HVS channel 2 now being used for live video, change the
panic mode for all channels to be explicitly set by the driver,
and the same for all channels.

Fixes: c54619b0bfb3 ("drm/vc4: Add support for the BCM2711 HVS5")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hvs.c  | 11 +++++++++++
 drivers/gpu/drm/vc4/vc4_regs.h |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index d615ba7db920..b335815eac6a 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -910,6 +910,17 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 		      SCALER_DISPCTRL_DSPEISLUR(2) |
 		      SCALER_DISPCTRL_SCLEIRQ);
 
+	/* Set AXI panic mode.
+	 * VC4 panics when < 2 lines in FIFO.
+	 * VC5 panics when less than 1 line in the FIFO.
+	 */
+	dispctrl &= ~(SCALER_DISPCTRL_PANIC0_MASK |
+		      SCALER_DISPCTRL_PANIC1_MASK |
+		      SCALER_DISPCTRL_PANIC2_MASK);
+	dispctrl |= VC4_SET_FIELD(2, SCALER_DISPCTRL_PANIC0);
+	dispctrl |= VC4_SET_FIELD(2, SCALER_DISPCTRL_PANIC1);
+	dispctrl |= VC4_SET_FIELD(2, SCALER_DISPCTRL_PANIC2);
+
 	HVS_WRITE(SCALER_DISPCTRL, dispctrl);
 
 	/* Recompute Composite Output Buffer (COB) allocations for the displays
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index f0290fad991d..f121905c404d 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -220,6 +220,12 @@
 #define SCALER_DISPCTRL                         0x00000000
 /* Global register for clock gating the HVS */
 # define SCALER_DISPCTRL_ENABLE			BIT(31)
+# define SCALER_DISPCTRL_PANIC0_MASK		VC4_MASK(25, 24)
+# define SCALER_DISPCTRL_PANIC0_SHIFT		24
+# define SCALER_DISPCTRL_PANIC1_MASK		VC4_MASK(27, 26)
+# define SCALER_DISPCTRL_PANIC1_SHIFT		26
+# define SCALER_DISPCTRL_PANIC2_MASK		VC4_MASK(29, 28)
+# define SCALER_DISPCTRL_PANIC2_SHIFT		28
 # define SCALER_DISPCTRL_DSP3_MUX_MASK		VC4_MASK(19, 18)
 # define SCALER_DISPCTRL_DSP3_MUX_SHIFT		18
 

-- 
2.38.1
