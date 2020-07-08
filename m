Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF4321993B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423BF6E9F6;
	Thu,  9 Jul 2020 07:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6DF6E905
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:42:57 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 562742F9;
 Wed,  8 Jul 2020 13:42:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:42:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=HkiTRHDRcKQFe
 ogJN9Y5aUs89Zq2q/ZZ3owtDz8nOYE=; b=goMJXvn8uQS85EcIfUZ1z6gG15hAB
 4sVRLbJnMhAlpMAkUZ5vv+nVDCYh9/a4flaqp1lHS4i6qVECxyhpc0B/sfR2NtDx
 DXV7AgAJOdTZKYWeSMonvde94jVHovtdOPXicg05hwXXGOtRehkMqZyoBnUn0wD0
 sBRjhQGgip8Cm7lV3DvW6EqlJpJ6SLmCagrATnCBd+yXrUrd55EMhxx53V+sb16Z
 TVcb3J/VqZkRBFtcijC4tT3TMg37TsLgBVov/2FXv2eOwp24PiDvKTY8d+5aG26v
 owUQCJF2dDdbFN8s3bGuHK0NVBhpbTD3yS0XRYPKQPXv9ezS3hKMQ/B1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=HkiTRHDRcKQFeogJN9Y5aUs89Zq2q/ZZ3owtDz8nOYE=; b=K02FgOrP
 IxIKjeMr4h5WiQlY04906hM2nlPdMqXQgi7iFeQimS/GQvSf6J2DgmUPDgou0WIv
 XjwWmElqoHpXLTrlSE6AFAgvTIiQMNCKuOf5Ersz8jcQqrB+iwuLYDvZyu1rn8TW
 Kg13hlUzTTqke96kF17IPJUk2mR2dRvJVInLyUHcVgOyuiRxa53Xy0DgkQInp7Ml
 EjcgdmCb3ZbM2VTLHFbCaAWC5xDAei82hxnHWVzQpEVLmx1ziGRXIixMOcj+ijS3
 fl8Mc2zANX+Hat4T3BejaCMWsbFeiKnS39YiVeODjqKBQfBdedNZha93u77sJjns
 AYoGakW65IKbzw==
X-ME-Sender: <xms:nwUGX0JwdKGpQzNNrDANqSTGfiegxbcK8ySLOCvSqZziri8go3s8Yw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudehne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:nwUGX0I0PVyxXXykbF8p49y_sXGyc7VZgTNh63CyO6cKrcDIXiBE0w>
 <xmx:nwUGX0vkOqPNjQx6Ug8Rw28dc1-tjTLZl4D_SBEJ_506RzwVH-Pcxw>
 <xmx:nwUGXxYCNi0ULr9lhlIWCY9kPTGikExpFruWQeCrdwJPoQuWzSJfxw>
 <xmx:nwUGX_5SREZJGpiWgAyP7f1pRpcb7TgzakTztixuYMr5KEgWQYpJhAalUTg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9020430600B1;
 Wed,  8 Jul 2020 13:42:55 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 17/78] drm/vc4: crtc: Rename HDMI encoder type to HDMI0
Date: Wed,  8 Jul 2020 19:41:25 +0200
Message-Id: <a2ebc10abdb686649c0562836d782488a90a8949.1594230107.git-series.maxime@cerno.tech>
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

The previous generations were only supporting a single HDMI controller, but
that's about to change, so put an index as well to differentiate between
the two controllers.

Reviewed-by: Eric Anholt <eric@anholt.net>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 2 +-
 drivers/gpu/drm/vc4/vc4_drv.h  | 2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 1d9e3658ae59..04744223460a 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -835,7 +835,7 @@ static const struct vc4_pv_data bcm2835_pv2_data = {
 	.fifo_depth = 64,
 	.pixels_per_clock = 1,
 	.encoder_types = {
-		[PV_CONTROL_CLK_SELECT_DPI_SMI_HDMI] = VC4_ENCODER_TYPE_HDMI,
+		[PV_CONTROL_CLK_SELECT_DPI_SMI_HDMI] = VC4_ENCODER_TYPE_HDMI0,
 		[PV_CONTROL_CLK_SELECT_VEC] = VC4_ENCODER_TYPE_VEC,
 	},
 };
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 179010b9a010..5781773aec4b 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -426,7 +426,7 @@ to_vc4_plane_state(struct drm_plane_state *state)
 
 enum vc4_encoder_type {
 	VC4_ENCODER_TYPE_NONE,
-	VC4_ENCODER_TYPE_HDMI,
+	VC4_ENCODER_TYPE_HDMI0,
 	VC4_ENCODER_TYPE_VEC,
 	VC4_ENCODER_TYPE_DSI0,
 	VC4_ENCODER_TYPE_DSI1,
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index a057db0d9baa..d9e48fbd7519 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1310,7 +1310,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 					GFP_KERNEL);
 	if (!vc4_hdmi_encoder)
 		return -ENOMEM;
-	vc4_hdmi_encoder->base.type = VC4_ENCODER_TYPE_HDMI;
+	vc4_hdmi_encoder->base.type = VC4_ENCODER_TYPE_HDMI0;
 	hdmi->encoder = &vc4_hdmi_encoder->base.base;
 
 	hdmi->pdev = pdev;
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
