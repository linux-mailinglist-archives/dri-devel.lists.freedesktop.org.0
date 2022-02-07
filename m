Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD4A4AC5DB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 17:36:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A75F10F9B2;
	Mon,  7 Feb 2022 16:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4F210FB09
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 16:36:30 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 85FCC5801E3;
 Mon,  7 Feb 2022 11:36:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 07 Feb 2022 11:36:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=tUuaRCM/V57xS9/bxKdm9N2vJq5Tzx
 2/8M4BwH//DCw=; b=EKLjIlwXiuwSfrh1YY+hlnIq0lkj48KvVHElSH8XMkQIjS
 /BCsrIgBFdePDReTCqNA1rrnyMUxoQGJlu4c5utKVaBDT3A9CjLINTUvRyOXCHue
 1U/hxx+AhWB7QXPSAy0XJMYg/R7S/nTkpC1n9qLO/7TeDE210vbybntZDQOlBbjo
 QT8U75d7qt2TANGIRVF0go/+sAw4wHi0L6YFNsExQ2bachUtd+BEdIii5zF5AcWy
 9uw5I6RXSjRzTGwhfXlIi52kr4hWmeRR+Q0TvBbrNDLUWZ6DQ66vtXI0dkPArj0F
 YCx5+M6BtJGbEKJkWgQKNZMzCvEt6zd8tDBqhdmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=tUuaRC
 M/V57xS9/bxKdm9N2vJq5Tzx2/8M4BwH//DCw=; b=g7Y5TPiIhLDun0TfsIw3LW
 GTE+NmIy03RNei/nTYEgOWTLCI2AApJ+FX4ilEfPnwV+90RZvEtppO9uF0E4Dw8Z
 Px0jHbY9yfraODQDC6yi39sIAHE8XO8fBULEo7wDvFMeY12KrheaCURkVDSrvtgR
 oZcb7l6kp6b10gbXlRenGFOePsyU3ZALepHakhka+LhwpWpq/5vytKds0urjSQQS
 esh++tdgFxUa9Kzt2sJ3P78UN+goUa2CbSBecUCgmlrZ0XrlbL2h6QJO/6BCIrtP
 u9o+gl9bCtn3ugb4CxHu/i480KdXNa6i6ip13I02UWZ0/gxYa9PI/8iQwvXQc/tA
 ==
X-ME-Sender: <xms:jUoBYgtUTbZS4nSl9IOptHYZ638_Br5eZkS1gug8A1Hd5Cn77LwlRA>
 <xme:jUoBYtfGiGTvR8DV7o9FnG8fvVL0PbJ0BCpO3dSqPaDmjZ4_iQFtOHGEPWQktTn7g
 fqiImBoLDZjkKEXTSY>
X-ME-Received: <xmr:jUoBYrwrdmiXui4r_rNHRLkAF72XIwhksSXEnR49TY7hj8i3_BpqigR8B7rpHNI92NHwZWe9fP-gcFp-lRZmDTwn6HTJSLlZiFy9_7U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdekkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:jUoBYjPzzkMZQsWkfz5OZ98ahA5krJQxQbsZCZAjmjR_kT_xiv3Jow>
 <xmx:jUoBYg8j5XY9eGgBgeuTn2KMlgW917fQVQG7uw1r3lgxeOxzWKz8wA>
 <xmx:jUoBYrUDylHhhKCxxnEgBP83BI1JEFFCB5PHtedevwgZi4xjEAIGjA>
 <xmx:jUoBYjdogHJDv-y5K-iTcy8LiduMkKzevUYxvvdtoaiZ4OI0XUE5Vg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 11:36:28 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 22/23] drm/imx: ipuv3-plane: Remove redundant color encoding
 and range initialisation
Date: Mon,  7 Feb 2022 17:35:14 +0100
Message-Id: <20220207163515.1038648-23-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207163515.1038648-1-maxime@cerno.tech>
References: <20220207163515.1038648-1-maxime@cerno.tech>
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The imx KMS driver will call drm_plane_create_color_properties() with
a default encoding and range values of BT601 and Limited Range,
respectively.

Since the initial value wasn't carried over in the state, the driver had
to set it again in ipu_plane_state_reset(). However, the helpers have been
adjusted to set it properly at reset, so this is not needed anymore.

Cc: linux-arm-kernel@lists.infradead.org
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/imx/ipuv3-plane.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index 414bdf08d0b0..36b32e8806e3 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -308,11 +308,8 @@ static void ipu_plane_state_reset(struct drm_plane *plane)
 
 	ipu_state = kzalloc(sizeof(*ipu_state), GFP_KERNEL);
 
-	if (ipu_state) {
+	if (ipu_state)
 		__drm_atomic_helper_plane_reset(plane, &ipu_state->base);
-		ipu_state->base.color_encoding = DRM_COLOR_YCBCR_BT601;
-		ipu_state->base.color_range = DRM_COLOR_YCBCR_LIMITED_RANGE;
-	}
 }
 
 static struct drm_plane_state *
-- 
2.34.1

