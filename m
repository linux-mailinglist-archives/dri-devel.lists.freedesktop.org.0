Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 613C6219916
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C9F6E9CA;
	Thu,  9 Jul 2020 07:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D36B86E90B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:42:55 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id D8724102C;
 Wed,  8 Jul 2020 13:42:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:42:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=EXexJCwQMTUDy
 YQ7lLg4Vs8yTtnTcQ1aoSB9BKA2a5Y=; b=d22tZ4TcV12IAbU8ptoQGF+giDSVd
 9UcJwE8wLsZrPnk3IjZX5NNSD2K+bA7eC8l3E0wtFdYKpLZ0xSanS1rRpH7faQ4X
 GJzPIjNT0Y6VOtzwIJRW5F0HP4FbGRq5riihBozik4EhgdLa/bs9BKHhGMGXexsk
 MtvmN/5wpE6UyVUqt/rlHovAfacoqTGcUeKWD8rCMbJPibC1yWzv6X4L3zdyOHXQ
 viKABKZdj42MCSXdYrxc53V0NujARVc4zUAJ+6J0ThNOE4hsNbfCEAcfP4FeiHyg
 A8Qri9Jw63LEk+a+bEAG5mcF1SyY7y/rLvcusC0jzfc979A2IFMcGGs4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=EXexJCwQMTUDyYQ7lLg4Vs8yTtnTcQ1aoSB9BKA2a5Y=; b=k6iWiKim
 zvzxCAJiUk+EdO+qboyYqSbZoa/hI/1qq93sQFn9fsXoZtw3MU1tPwzQhTzoy6Jc
 xDzAP/5sgciOQLXEZGvWLsOvrZu3Rl37GdYSh+PUbFzx7w/Us6v1PLEzOWOxapm+
 FAkgNDIbqvcmuc2s6/v1k9wj3XJEBSYZfcrJyUIPiYNOFgB+f8QDjCDYEDAUU1rI
 aaudDtyPtEiXs7FQrax2kVnY2joJyAm/ZK5zEXLJbC2Tir3srWcqrrCUxjNeKvdT
 6l/kHfr6N9IHt+ybiANC0p5pid4BmgwMolI9YPMrpjCyW9gPJLrV+nYg3cC/kvMk
 VRU9dhfw7AUn6g==
X-ME-Sender: <xms:ngUGX9z_8NmsQI-zhxPuWCB1zm8Zs4Mw7ZcowVw27SK5TLsWBRR4mQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudehne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ngUGX9S0QkCmrMkz74HdHtsxUdctnwmqdXhC2sj3-x4599BAUxcsHg>
 <xmx:ngUGX3XOrc0-BiNSTQIakG8R_XUPGZvCKFAy3_9aRbY3gxWec0_LUQ>
 <xmx:ngUGX_hxPckxUQh2-XVSEWyfe73n23RDSjUQYLEXQhIH2hQlS6P7MA>
 <xmx:ngUGXxAc0zib7e5kV4oRRgKM5OYLMregDqZRBpKcm4XZ9DZcTG04_8rp1bg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 21B78328005A;
 Wed,  8 Jul 2020 13:42:54 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 16/78] drm/vc4: crtc: Add function to compute FIFO level
 bits
Date: Wed,  8 Jul 2020 19:41:24 +0200
Message-Id: <bf7861126e8223cf9d04adfa2ca1c7b728943f13.1594230107.git-series.maxime@cerno.tech>
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

The longer FIFOs in vc5 pixelvalves means that the FIFO full level
doesn't fit in the original register field and that we also have a
secondary field. In order to prepare for this, let's move the registers
fill part to a helper function.

Reviewed-by: Eric Anholt <eric@anholt.net>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 2c64efd2d3d9..1d9e3658ae59 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -234,6 +234,15 @@ static u32 vc4_get_fifo_full_level(struct vc4_crtc *vc4_crtc, u32 format)
 	}
 }
 
+static u32 vc4_crtc_get_fifo_full_level_bits(struct vc4_crtc *vc4_crtc,
+					     u32 format)
+{
+	u32 level = vc4_get_fifo_full_level(vc4_crtc, format);
+
+	return VC4_SET_FIELD(level & 0x3f,
+			     PV_CONTROL_FIFO_LEVEL);
+}
+
 /*
  * Returns the encoder attached to the CRTC.
  *
@@ -336,9 +345,8 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc)
 		CRTC_WRITE(PV_HACT_ACT, mode->hdisplay * pixel_rep);
 
 	CRTC_WRITE(PV_CONTROL,
+		   vc4_crtc_get_fifo_full_level_bits(vc4_crtc, format) |
 		   VC4_SET_FIELD(format, PV_CONTROL_FORMAT) |
-		   VC4_SET_FIELD(vc4_get_fifo_full_level(vc4_crtc, format),
-				 PV_CONTROL_FIFO_LEVEL) |
 		   VC4_SET_FIELD(pixel_rep - 1, PV_CONTROL_PIXEL_REP) |
 		   PV_CONTROL_CLR_AT_START |
 		   PV_CONTROL_TRIGGER_UNDERFLOW |
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
