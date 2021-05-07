Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF07A3766B3
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 16:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095556EE20;
	Fri,  7 May 2021 14:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E6B16EE20
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 14:05:30 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 53620F62;
 Fri,  7 May 2021 10:05:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 07 May 2021 10:05:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=eRNtIwuB6xc6Y
 mNPXHbhCUH+fhTJ6mxLZnKvlZ3jvIw=; b=Gw2KSeNId0zMO8odr9LDeEww9YM2K
 +CDcPU9pfmX77CwuTP2LCvPrxCi8YTzvFXjzrI9n76Z1ZhzEHnzX+8a+MS4oVeIN
 yEvuHunnVuHeGJ4h5o6tTT9OkZ/ZKyPsdoywqk69PxARhBRTby+XVx008KbeOf70
 0dgmLCkH+aw+MATGiC9xR9jgDq4sJH8+4lrnZs0a+wMVG9WM49t4vvzp2RZouqvD
 DSQ0kl/w2fWEiESo2IGi9gCLpbQTwZg3K44iGDSzEyS0oKnp1wAkWdCQA/UZXVXE
 SuTuIao9H/fttxQ0JrTFnlypP2sjdYrxdqeG8d05Cg3ePyXQPuih3z2eA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=eRNtIwuB6xc6YmNPXHbhCUH+fhTJ6mxLZnKvlZ3jvIw=; b=MqTM7Ey4
 FgMgFuRtqQ8XrdOi/A03PlhPRZlfL0PXb/fY44Fi+Hn55DrTyqUvGNz0VWZA8G7t
 +pNGzZQqplF0Dacs1cmyxGIoihfPdcvt8PwQ/5M4qSLHDUTC6QMkWZMkgQPeECiU
 NyqrqZqJtSadSH8elifazI6YZSUKcdnME0sV8l/iFcW1V41ss2scCG15w1MZHMdH
 O8bzf7NjSM/3GmMBjCsoQQ1UvphMSqlOibuofAwtfnDGNwNf7dK7XBdIkeoFOIcw
 VeztOjRp4Y5t/7BGqOOEHmTxiEfwiAHWXUNtfWsz+KLaF13z+PONLPAQ6IZmSGaT
 LRxNy3NUlSDG2A==
X-ME-Sender: <xms:J0mVYG5YrmLhCL86ZIjmMgMLh2mekW457Nn7KmJKyvvRyHmnoV3yog>
 <xme:J0mVYP6WDNl1uwoPhbX9PyFQ6Ql81tCY3xFg84Xrvc-PIxXi_lx5oXbBEcQWE74OM
 SMDV61Qw9xG_2FRtbo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegvddgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:J0mVYFfWjCcRH8DWmJ4peof1w39WxQFHTuRKX_uA6VIqkO6pZcocIA>
 <xmx:J0mVYDLZoK5pJukH9MH5Kd31PM7ELc9vBVJDHa9CajhC5uOnzRlGhQ>
 <xmx:J0mVYKIq-68QqGdpr7D1AbTQEE8eMEEr_4667z437YJPqyLHop5PTQ>
 <xmx:J0mVYPbdDpW1n7VgKXKsGjagCXoIRB3uwBvjWnoSmChwzc8L8Q1-OtY3g98>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri,  7 May 2021 10:05:26 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 08/11] drm/vc4: hdmi: Remove firmware logic for MAI threshold
 setting
Date: Fri,  7 May 2021 16:03:31 +0200
Message-Id: <20210507140334.204865-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210507140334.204865-1-maxime@cerno.tech>
References: <20210507140334.204865-1-maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Dom Cobley <popcornmix@gmail.com>, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dom Cobley <popcornmix@gmail.com>

This was a workaround for bugs in hardware on earlier Pi models
and wasn't totally successful.

It makes audio quality worse on a Pi4 at the higher sample rates

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index f74a6b99d4ec..505574e6cfd3 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1213,22 +1213,12 @@ static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
 	audio_packet_config |= VC4_SET_FIELD(channel_mask,
 					     VC4_HDMI_AUDIO_PACKET_CEA_MASK);
 
-	/* Set the MAI threshold.  This logic mimics the firmware's. */
-	if (vc4_hdmi->audio.samplerate > 96000) {
-		HDMI_WRITE(HDMI_MAI_THR,
-			   VC4_SET_FIELD(0x12, VC4_HD_MAI_THR_DREQHIGH) |
-			   VC4_SET_FIELD(0x12, VC4_HD_MAI_THR_DREQLOW));
-	} else if (vc4_hdmi->audio.samplerate > 48000) {
-		HDMI_WRITE(HDMI_MAI_THR,
-			   VC4_SET_FIELD(0x14, VC4_HD_MAI_THR_DREQHIGH) |
-			   VC4_SET_FIELD(0x12, VC4_HD_MAI_THR_DREQLOW));
-	} else {
-		HDMI_WRITE(HDMI_MAI_THR,
-			   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_PANICHIGH) |
-			   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_PANICLOW) |
-			   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_DREQHIGH) |
-			   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_DREQLOW));
-	}
+	/* Set the MAI threshold */
+	HDMI_WRITE(HDMI_MAI_THR,
+		   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_PANICHIGH) |
+		   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_PANICLOW) |
+		   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_DREQHIGH) |
+		   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_DREQLOW));
 
 	HDMI_WRITE(HDMI_MAI_CONFIG,
 		   VC4_HDMI_MAI_CONFIG_BIT_REVERSE |
-- 
2.31.1

