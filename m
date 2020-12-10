Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAED62D5E58
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 15:48:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013F06E42A;
	Thu, 10 Dec 2020 14:48:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56AF06E5CA
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 13:47:07 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id DB275F43;
 Thu, 10 Dec 2020 08:47:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 10 Dec 2020 08:47:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=92GfHmKhRpxPM
 RIUUbECfJaIZvUgJBoz8+NUyhSFyso=; b=KCbe2+Exuycx2mjvU8soWICzlpnyc
 ewDU1us8dR7WN/1Rzbbe7ZpoXcaQnCuT0Q6F6hQ+q8+FhH5EoQp9Nja0LMgt3u2g
 5vmo3ADPfbPRxuU/exlpvtxcSmFlnbKJep3I2FUyJY18T40Ituul4apuR9+efg86
 VmVpT1x+TVRf5QoS2q90Ew6pZ4rT/syAqP9OmS1eBuMxXy5VGGkibHijtp92QqYi
 DtMPRlT8VY2P5x5HI7g2ER6bf55yo4sBmHWAJEWiRqQv3Fue3/GX9V3eBUGpYCEI
 kIxdxntsQl91M4UgZ6xniWwLigZEpB6Hc1RNOcLC3eDFnjZqliN7wdgiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=92GfHmKhRpxPMRIUUbECfJaIZvUgJBoz8+NUyhSFyso=; b=r8VWY44G
 9Ijky47OSugap5Q3EU/c4pM2H7i9zSI4zy2Tiqx6zHsbffEJhUkWu4iBX8yzHuII
 g+QkqtiGUboX3GYlt0yvTb3FS1sRmhDm/5PuYaWO37AuDj1lJWtVfI7QsKJk7NF/
 Z63KZm3vQAJXVFhQaSqOsG5pcGoUwXDC9ZKOk33n7tRFcUFor3l2JzmaAFtCmr9h
 RW8cTAEBFQ6n8wxbwfCfqDMZ80p96coeZrfdkJGFRuMZUC1jIeKFlCAXO972pWvy
 YZZBXxZ/oc89tHaAqvWkhqJPeP5zsayL/y0k7jzJN7KwIluLZOIvDn0/v5VS1TWx
 vpCFZxvTMz6dUQ==
X-ME-Sender: <xms:2SbSX1AI0S1YWHgb7v-8DPLgX-jtPU6v26hjKXG8IPRGX5_eDGNz2A>
 <xme:2SbSXziGLqGpMtEyNGltbCncS5xfSrqS8LW8uMWuciSjmy8RSr_bgB20J4vj4_Byi
 wIbNimjo2ejUrMlpfM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:2SbSXwnOZbBXflG2SfR5zweV2pkh138XobfwZ4lxY57t1af2AZyEXg>
 <xmx:2SbSX_w7pJX198LZjtfBJiirxUJLTTIbMvwOmxmGtMqhkXQj3fsRrg>
 <xmx:2SbSX6S2ZVW_XV6YyUXMP864qVMGbVqE4JJBig1xhhCFsRP1BS_RRw>
 <xmx:2SbSXzDelKdSik8DxV-drrHC1IDKo6i3QFq8-NDd_dicK0ecrK29pPsmFb0>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 13E02108005C;
 Thu, 10 Dec 2020 08:47:04 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 11/15] drm/vc4: hdmi: Remove cec_available flag
Date: Thu, 10 Dec 2020 14:46:44 +0100
Message-Id: <20201210134648.272857-12-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201210134648.272857-1-maxime@cerno.tech>
References: <20201210134648.272857-1-maxime@cerno.tech>
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
Cc: Jason Cooper <jason@lakedaemon.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dom Cobley <popcornmix@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dom Cobley <popcornmix@gmail.com>

Now that our HDMI controller supports CEC for the BCM2711, let's remove
that flag.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ----
 drivers/gpu/drm/vc4/vc4_hdmi.h | 3 ---
 2 files changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d208b7d1d937..327638d93032 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1658,9 +1658,6 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 	u32 value;
 	int ret;
 
-	if (!vc4_hdmi->variant->cec_available)
-		return 0;
-
 	vc4_hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
 						  vc4_hdmi, "vc4",
 						  CEC_CAP_DEFAULTS |
@@ -2074,7 +2071,6 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
 	.debugfs_name		= "hdmi_regs",
 	.card_name		= "vc4-hdmi",
 	.max_pixel_clock	= 162000000,
-	.cec_available		= true,
 	.registers		= vc4_hdmi_fields,
 	.num_registers		= ARRAY_SIZE(vc4_hdmi_fields),
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 27352827f70c..c93ada62f429 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -42,9 +42,6 @@ struct vc4_hdmi_variant {
 	/* Filename to expose the registers in debugfs */
 	const char *debugfs_name;
 
-	/* Set to true when the CEC support is available */
-	bool cec_available;
-
 	/* Maximum pixel clock supported by the controller (in Hz) */
 	unsigned long long max_pixel_clock;
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
