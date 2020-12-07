Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 318602D2630
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:33:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34EDE6E9C8;
	Tue,  8 Dec 2020 08:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C581589933
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 15:57:25 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 40CE158032D;
 Mon,  7 Dec 2020 10:57:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 07 Dec 2020 10:57:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=OdBDmnWruLtXn
 5QoiUIiA+CX0Vd/A2CPhgP7L/v2rBo=; b=pLmc2s0j0xklXbfrgHX2/opQnGysy
 tFqQLPtp8nCZQgEuH9KR+7Coa7JezYaq4JE2KrZsS7sBEnqp5+/ywcehYB8/11Cv
 Cz25Rx40DTCIt/T95qQA8FVJbssSaRKunz4X5xDjMQrn6S3tzv5otWwsorKXO0lE
 bJXe/APf3GhH/+RbXTbTok2d4zUyZvReNPbXHACy74rvmUvzrmex/rtOtrBbIV4Y
 q+x2Ye/pwI0stVKG8DRk05EqnF8NAPuLcMxXSofvTOdao9JTEJp9SrgKIW6lVdJA
 GKQN/t4dYsQBdpINChIdjKAXhcCut7CQ+V23FDgyXicxKV3s+0eEkv8FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=OdBDmnWruLtXn5QoiUIiA+CX0Vd/A2CPhgP7L/v2rBo=; b=cSDiQOgu
 162kduMdfMOQzLt+UlEKS5+iCJ3tcT9NAsFBRnEkOCnDUEQM6pxQGM/hbZ4aBN0A
 g4NzcM+zNmsTzXdC63oTJerWbI6ut3K2CY5AlhHOvqQI7J7m0OhRGG/FHwpouC+9
 tX9J+dUHxa04TKVCH3IHHwLhg/QBWzvo5yeBIRsXmXQfHlXg7IntGsWDxZ69Psnr
 Dwih5du36BTOW9oA83lY/e9PgWX9qv4oWnPmW1/JPuWg9f4GsSiSphq0flG6BLSn
 ehevxf1ccHZDPHkGLzHD2QS/NQJY/OQKhGGSXxtgKYMXCQgJu9c+c319qfmIRPkw
 lXsgYQrrCAQWCQ==
X-ME-Sender: <xms:5VDOX74hfX14qeMbuRcX1wGnCpZm3KNAZDf0OcqdTaICg8CA7ypgug>
 <xme:5VDOX0lTMbH19EhVmjc3CbQAItG4r3FTw__rcSZ0o1vtcAgmiCduiieNZOwJRkH0N
 NpPgwl7W0J50_QCXd8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejgedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:5VDOX8Rm4yDPjRYifDE1ObkUK-SFxQeTqUcMDg2sIbfOPmgRMWKyBg>
 <xmx:5VDOXzFJxOe2kZN3EjR0jd95MY99hg31Weme9CIb_wksCgHYYye4Dw>
 <xmx:5VDOXxH_9mWAmQ195EEtm9tZYB4KH6TxQCmuMbuhFaSI4T89j6DjLg>
 <xmx:5VDOX_VurMUJRE2KmaGcEtnEjVVfKKTSYIr_6tHbDEZXfmJGrn7g_w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id DB91C1080063;
 Mon,  7 Dec 2020 10:57:24 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 3/9] drm/vc4: hdmi: Take into account the clock doubling
 flag in atomic_check
Date: Mon,  7 Dec 2020 16:57:13 +0100
Message-Id: <20201207155719.17149-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201207155719.17149-1-maxime@cerno.tech>
References: <20201207155719.17149-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: linux-rpi-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
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
