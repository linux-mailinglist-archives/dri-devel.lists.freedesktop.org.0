Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 619812DBD1F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 09:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBE26E051;
	Wed, 16 Dec 2020 08:55:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C086E3EE
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 15:42:51 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 56FFFA92;
 Tue, 15 Dec 2020 10:42:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 15 Dec 2020 10:42:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=pwp+c/LjbgeZT
 C4Eu8CoYE+i66M1vizsdP9IYHdPKFA=; b=IWW0HmZRNEu1QAvE4SojNBNy2NIy3
 IwVXxf+2WSV2agNZIxL4vDpJ1IKgzEwW4tp/TPi/qst7uM6FkOcKxy9y7siNKbak
 rzeHj1Ib8R24d6rrrZiTSpY0QXHBPA7pUKA6GFVCjxu4LkrTqHRG9P43CFZCYL1E
 BnqFWa686TBaRj4HdK5SenOlZGdeTRQVAZCt6JZUVdum8KhE5rqujui3pfsxNLfS
 z+CiknvF/mJvZ6FBDbIUFKgnvEugd7Nv8sFdEzpU+Ah8FCevdywpS1ZLANujArLq
 0TiPwaduNkdi9cSRoILaATZO+fWMBpWNIbkcQDmkaSO45bEfhIw8vpP0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=pwp+c/LjbgeZTC4Eu8CoYE+i66M1vizsdP9IYHdPKFA=; b=GrmTtUH8
 cBb508UWjlgJS7B5cL7uXDUNzWvbQJLGLJXAaZwMY8fK6ay56aiamLp1sACOaVm3
 JKGebpYb8dNbJ0CPHE41xvWYtO+LmKDQr+mSzWUQWEcVJaO5w324+PK2awyoavr8
 NmcQl4QW3gzF54CmOfAdBELLRctmu21j3hVy8JAByI2uyWwXkNfnQOTD37VoWQFK
 UvnPAs/q4Y1AI4dq81iaCX8EyLDLjG7fDVmLo7/WS0Dhj8ls//0y+8Z1Jeu48uM+
 W0hBQRwojLMJqljUrzrQCBLVoOtckjuW9DmgEAulhu482AobSAQzXJqxbfwNb4F2
 gCPclf0hkdNQAA==
X-ME-Sender: <xms:ednYX-0LGP4F9BrQ_72E8UIAngSjee7XtH7l3t3OMg1X7xZHoYwnfA>
 <xme:ednYXzFtkss494XuivYC3QaDylbMjNI-WU0zkT7hX_meDwWMOc7dRimOIBK8L9Zo8
 MzugE2UVGL3qkiY1Yo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeltddgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ednYXwQFFMvsMPBLe38C91V7cnaVY4ic-DA06RNLsQnF2u8JwEbTtA>
 <xmx:ednYXyCw3Cy20j-lKs67-KYvAa5xotbzW6wWAy4wTZzB5zdsRkKedQ>
 <xmx:ednYX42qXj8C8F8VctXnbVpjc89cMe7HgRSU8zKP1dI-cpLbDFhgpw>
 <xmx:ednYX3ad498wbSgRmhjVG-h-bQ-yU_aHfJBTZ7RTRLNxxHXgx5jl7W76_ME>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A0EFF240065;
 Tue, 15 Dec 2020 10:42:49 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v7 3/9] drm/vc4: hdmi: Take into account the clock doubling
 flag in atomic_check
Date: Tue, 15 Dec 2020 16:42:37 +0100
Message-Id: <20201215154243.540115-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215154243.540115-1-maxime@cerno.tech>
References: <20201215154243.540115-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 16 Dec 2020 08:55:47 +0000
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
index 8ce5dd65f6e4..3dac839b0fa5 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -799,6 +799,9 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 		pixel_rate = mode->clock * 1000;
 	}
 
+	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
+		pixel_rate = pixel_rate * 2;
+
 	if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
 		return -EINVAL;
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
