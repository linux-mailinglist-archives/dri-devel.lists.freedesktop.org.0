Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BA0219950
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764796EA0E;
	Thu,  9 Jul 2020 07:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C980C6E907
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:44:07 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 8E84E109A;
 Wed,  8 Jul 2020 13:44:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:44:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=pt9TFI6RvUVSu
 NKW8zJg2qYLrIvyFPkfvn0jKN0hzvg=; b=fawW+UNA67OCmtPZmc7+8QPifcg45
 6W9E1rBMVS3IaJ2dcwXx8iMarsnkwaOZ+jGG7cVw4XBq/6mjkNaSChtKRzBVZFym
 86EEHTA2d0rwrDt24BiDJgf/UveGfSLuDFxa+DEpGeSTygpQfn1HbWs9ag3VhH/K
 8bDBTYc6vazQg3AM1gP54GfOksl/hqSKBGC1LNGSMnyYmIrCqIFuf2CLCu0/M/jy
 YVZX2iisrlfFsqQR8G8/Z9Wea5rAzYFdGtNb/neFIoT3H9dPMGt7ZBT0wYsTVnJ7
 0815T+CMLNY5pF1zP39Mg/Wq5cX7e0+ZcDp+o+/OZ7K9U/qvyTS59Rm0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=pt9TFI6RvUVSuNKW8zJg2qYLrIvyFPkfvn0jKN0hzvg=; b=pvq3xDsC
 nC4xM6goTgv/ut74GmbByNPRsEz1GDm1iY6ddOYFtd863jbzeL/W5vhRD4cpLj0u
 BAkFsMCuQYdnWXoCB+kFKRpz/1t/bqH4EQPaC/cP6oudHeB6zTg4W0suJu7/dnoW
 T1VjWF5OmrX3TnYi2uNpG2JXiruWM3BiaJkBz10kJ0feCYnfH8lt32PxzkOYCfza
 MKQi3WFAY8VWFC63Y0Drrb1I4Dd8ZQTDOZmCaI4pbpERyac47WSORjVFgs1F9HSa
 r4ITPi0p8SDXgPsLFEe1XuE1pme9MyMrAQ+pbhFYXqeezE36ai/k2fxkQLL12sVP
 9BOve7UA6JaHPA==
X-ME-Sender: <xms:5gUGX76SiD4soAWkwcqOfmYhLoPwqJHHbXTDHWP6wxjgAGp6IK9pKQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepiedvne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:5gUGXw5LG6dW-Miy-MieLcDRrrSE2tSwSWMqAAeDyA_dOPbkxcmEZw>
 <xmx:5gUGXyfhVfhaa-jh3LkMT8XUxtf_SdGDSpFgoNG3BddPddeTOOETHg>
 <xmx:5gUGX8JTsYtEEdcCm6mowVsmejwHVbgHoc6p1KDn4QtCly8aktqCyQ>
 <xmx:5gUGX8q0Rdn7SCmv0bIbwNItLheCWDnSexeUsrppWb5BkJUvzQm4HLJ2dJI>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D31733280059;
 Wed,  8 Jul 2020 13:44:05 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 66/78] drm/vc4: hdmi: Set the b-frame marker to the match
 ALSA's default.
Date: Wed,  8 Jul 2020 19:42:14 +0200
Message-Id: <a0553ce25cb66a4da407405f63711efdf79d61e3.1594230107.git-series.maxime@cerno.tech>
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
index c96d9f2af2bf..e1ef0907a827 100644
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
