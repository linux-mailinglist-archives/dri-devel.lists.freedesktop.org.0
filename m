Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CAF1E59AA
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1156E4BB;
	Thu, 28 May 2020 07:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DD06E339
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:51:47 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id C2538582101;
 Wed, 27 May 2020 11:51:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:51:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=w9X7BF4nMd1nQ
 c/IzGAPERlbj1jfgqvltCeOfK66pKY=; b=qgIQRMimoBVH2IAS/AkkUDxzQ59uk
 Con0+f2IRGcdM1tEQ5My5bRPNjZ6851/Y4X8i36NcPh2Hh180l+/Ab2HsRT5GvSJ
 kFwgBcvlaSg/ko9XJM3R6aUpUFetvZBxq3k7xIjeADUbSuDr6IdtjsCcyz15B1V8
 CzdG1VmsgWxQQ1W5YZkVeKFea4FT8IAha7rY2FAmi06sZ3LgK07SRxYK3e+bntmx
 WlxJCrxlDVuEtnI4ZpMXsIiJywAc8B6KznppVbSs7ab3FuVsKi99GLVeiyn5tkBV
 LdO+HfNgo2t/hwyRrqxVNhNEPiOEd1ez6X7wDPIxop/Zc1V4lWQlPKl0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=w9X7BF4nMd1nQc/IzGAPERlbj1jfgqvltCeOfK66pKY=; b=1mQDffBz
 lvS5Z0EYIS3v8NUVXEK54eDW1WPjuc6NVy1/RN5D0AreJ7pOknkJvag9qYzsH906
 SJWiaugeR9pf2TL4mXYo3gWnfjEG6p9gxrwvYiWe8ZTJzsWPAO507Jvqen3il5NN
 UKav5h0zelR0qVn+A2UHgjiLLhhHQaXbeWtQyaGxZt96lH0oZjspxcSWikyreqih
 GJ6F9ZscI6XkbbwhAQhM9gEAVWOSMT6aT7fcLWIPgp90FaUzPPP87jIQ3H+i2umU
 X6KXZvTBPJ6HxM4otN5seZQUS+3mEpz0hWh9i1nyoC85fgMYKWWK7pDUj+nxzhHm
 vBQWp4AuvyI12w==
X-ME-Sender: <xms:kozOXtEzFzM2WIJE-mWhje2IgacN9asU8APCcwgB102MVcNObIu9YQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepjedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:kozOXiXyEOTR2XcuqCdfQUUlA5KtPUOdjdshIIgzC8AGw5iO7gsGVw>
 <xmx:kozOXvKvQJyGI1fPPulJ9xi4kzmmHKAiYTquKqAW4oNjNYe3viTLZg>
 <xmx:kozOXjHCmflnyseM9oCaYy2ktVwGestzHYCDR2gqmDmc1kQbAVcKHQ>
 <xmx:kozOXqFPX5VNlEJvphdcMcnpAJyi71bbAIbU-nNfhQt_Q_cjm-MuVw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 66E2330624E4;
 Wed, 27 May 2020 11:51:46 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 095/105] drm/vc4: hdmi: Set the b-frame marker to the match
 ALSA's default.
Date: Wed, 27 May 2020 17:49:05 +0200
Message-Id: <0a8b22baf15ca5c7a3c5bbb6516db17d470ea6de.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:53 +0000
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

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

ALSA's iec958 plugin by default sets the block start preamble
to 8, whilst this driver was programming the hardware to expect
0xF.
Amend the hardware config to match ALSA.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index dcac5e77d2ab..afa71580bfce 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -754,10 +754,11 @@ static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
 
 	vc4_hdmi_audio_set_mai_clock(vc4_hdmi);
 
+	/* The B frame identifier should match the value used by alsa-lib (8) */
 	audio_packet_config =
 		VC4_HDMI_AUDIO_PACKET_ZERO_DATA_ON_SAMPLE_FLAT |
 		VC4_HDMI_AUDIO_PACKET_ZERO_DATA_ON_INACTIVE_CHANNELS |
-		VC4_SET_FIELD(0xf, VC4_HDMI_AUDIO_PACKET_B_FRAME_IDENTIFIER);
+		VC4_SET_FIELD(0x8, VC4_HDMI_AUDIO_PACKET_B_FRAME_IDENTIFIER);
 
 	channel_mask = GENMASK(vc4_hdmi->audio.channels - 1, 0);
 	audio_packet_config |= VC4_SET_FIELD(channel_mask,
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
