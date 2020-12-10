Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A892D5E8A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 15:49:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5FA06EAD3;
	Thu, 10 Dec 2020 14:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4436E8B3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 14:23:36 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 7DBDEF92;
 Thu, 10 Dec 2020 09:23:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 10 Dec 2020 09:23:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=GnfpIF9yI3slx
 eJJOt8lsrDN8PUhUZ1a8Y4ZbZRJHjQ=; b=lRrEWyG9XT9YD+GK76/CNT/Ao//J6
 Z2YMtuQHk0J/xHzasBeyioTwGashBBJmKvENyXaDk94+jpqLxIke2+xMvbtZwYnV
 evYCYGhcbp8G+f44EPUjGOJQ6aHixhwokIwA/UtAfRvfN/rccPpvhDDJ1d2d3WRj
 iYCmCN84tYtIKaswbE2ihttRKkU8lZv4nuBTAMIE+LYo++P7h6RWOMvFP6/3Fypc
 J6cm5KfWynYsBUu5JAHyfrdkgx3jtnqCPKBNCseweVL5KyVZNpO5sMEFG1ioeCmI
 JwmLxqyfbPCQiQUANVZ39gm9AnOfNroVwF94x4rhYeYcV2kAjudQ5jNVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=GnfpIF9yI3slxeJJOt8lsrDN8PUhUZ1a8Y4ZbZRJHjQ=; b=Pw5P5Qzy
 8Pvn/Jy55slbYMrlQRjHnMuMCtt1j94BWQcDmbc7O3rtWYQF9rB08FCiEGLWjafB
 2GaT5zTtO/7akKl56mJLz4fnsxKd05dTlgPO7ICsQPerpzf9gE1NCJ5inZlhyGaW
 zxVMHQDFNvB3U9MNq7BmZS130uK4ypNwFhzlHJ+nxpu6Oh8X9gOMeMoVRLK8FuwS
 W9cp5ymgfQj7bxbBLwWp+yut+Y3zUoSCb5VyZ9cWiZe8FAds7Wl81ImiVG591VRv
 dOJKbW3Gt+yoaoWUsDWmayELSE9RTpMPVxWlQUOhD0EF4TgqVG+4Exmxa++vzRJa
 xAhCcL73uWAXZQ==
X-ME-Sender: <xms:Zi_SX0oPpHhWsDj9RixEwIDmsY2axhI6StpG47ZmxkYYheJcG8U-VQ>
 <xme:Zi_SX6oaxU9ba_aWZJqkFTiqvntBFssoRU7OLDgwigL4aRuefG78ghXOh2qDrZH53
 HeucSUfhSVqv25Gw_s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Zi_SX5Nu-QQ8QdwkwZFEf26eAiONMLCZdtxiV07mFoXY1dwYdNnHVg>
 <xmx:Zi_SX76S8-X-9Bg32vgSlVb6v18R6J48tWkIjcDcYbhRSSm6GB9O2g>
 <xmx:Zi_SXz7z9wXHjdOiHPS-fnJ6HRoRXxI5Tq-_5zFWl3ic2E8cmB1FeA>
 <xmx:Zy_SX9shfagIuOi-FbesdSSE189MfCcDLzW9MREBGB06aZWZrpZ66-JUO3U>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A3DD024005C;
 Thu, 10 Dec 2020 09:23:34 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v6 3/9] drm/vc4: hdmi: Take into account the clock doubling
 flag in atomic_check
Date: Thu, 10 Dec 2020 15:23:23 +0100
Message-Id: <20201210142329.10640-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201210142329.10640-1-maxime@cerno.tech>
References: <20201210142329.10640-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 10 Dec 2020 14:48:10 +0000
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
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 63495f6b4aed ("drm/vc4: hdmi: Make sure our clock rate is within
limits") was intended to compute the pixel rate to make sure we remain
within the boundaries of what the hardware can provide.

However, unlike what mode_valid was checking for, we forgot to take
into account the clock doubling flag that can be set for modes. Let's
honor that flag if it's there.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Fixes: 63495f6b4aed ("drm/vc4: hdmi: Make sure our clock rate is within limits")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 5a608ed1d75e..a88aa20beeb6 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -796,6 +796,9 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 		pixel_rate = mode->clock * 1000;
 	}
 
+	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
+		pixel_rate = pixel_rate * 2;
+
 	if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
 		return -EINVAL;
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
