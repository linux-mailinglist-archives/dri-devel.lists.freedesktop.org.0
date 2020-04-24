Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF58E1B802D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA8D6EB60;
	Fri, 24 Apr 2020 20:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C3D89E0C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:37:25 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 44E2E11F1;
 Fri, 24 Apr 2020 11:37:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:37:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=qM30a07mPbGXB
 BI2Y4ig/6giNahyOvAGq+KhX3qMQ5M=; b=WNpa0ngjL4QlDZmS0JLitAsfpoTju
 8rJNCIXrm+Yob8XlUeLGJPnZ4QeBI4ocKDyKiwakgpPYQb88H/1Ta0PJrOqJX4kB
 s7Ixvih7BGhVJbFPYaFpmFG7KhAqoO4jcXJ++21iGMUBKpXINUr34r/1yvMnaJ3h
 g5glbWPXZ+OZjBPi1mixNLBMOyfCxwUSl/S3hWtUZGAq3KgaItrqMqcfjXb5cQe2
 zPD91qd7kDXzwmHJLTts8llCCyUeWWuc2MiNguZmapOy7PudsQIptECq/p7U6huD
 n7ufbsdL4dFx7lMNS/INbtydXB8Ly2JsTolqsJVP1hcN/7gFW/7dMjYwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=qM30a07mPbGXBBI2Y4ig/6giNahyOvAGq+KhX3qMQ5M=; b=U9EbtuQQ
 inSd7/vd/U7Zl6k6vX0rgWF/zbW3ew/LDf7/E20TmhezIfaODifLK67X0um6DBxK
 8NMfjqXB5dLXJbA2vZUIhgSXvSAdf9oY879+xfUHskQNwm/wHeMQUOlJnYiFnHVf
 QoFaT3gPjgo+Q8/AExqA27P8kqVfUZeTtXktqf51fEcZfSJdQuh477pHpI3+RoMQ
 fWS6izymT1gP9fUw6WcXQuOL+XfUtoyd/tkvWADijZ65F2u//u08cZrcA5HgcSbc
 VR5vy5r5QWXaHOUdWOrAwnd55MtMzEFxlQPsIE36PlXll+YBE5qzkmKSpQZ692I1
 XEyt5zCsXWR4LA==
X-ME-Sender: <xms:swejXvUEVi1cgG4rfjhMUnUfdVjH_3iugXGf32UbXqw0GdjxxvWBVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpeejkeenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:swejXr0vFT_AVlWokKr0KXHq_pFu94APAwYootc9LV3Ffj4Pv1vdTQ>
 <xmx:swejXmYO0I4L8ITuL61g0a37R9zrROLx2QuMiHW4Cl0OoYnoKzYUQA>
 <xmx:swejXurOjIRHAXOU8KKH1FQOzvtaGBxmcdKsxRdXg8C3dQwTgp8f4Q>
 <xmx:swejXuy9j4K4IwJa2T8-qiFAwc9gEaiWOfRFZQmZCtkubzWdEugl8-WsgcE>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7B6933065D93;
 Fri, 24 Apr 2020 11:37:23 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 87/91] drm/vc4: hdmi: Set the b-frame marker to the match
 ALSA's default.
Date: Fri, 24 Apr 2020 17:35:08 +0200
Message-Id: <e6c4d744b63c49045d91ccf9b831246fdbcf4f15.1587742492.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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
index cac55386236f..7c43c039e669 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -756,10 +756,11 @@ static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
 
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
