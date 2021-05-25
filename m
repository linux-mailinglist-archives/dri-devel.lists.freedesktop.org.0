Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 166B6390261
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 15:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298F66EA46;
	Tue, 25 May 2021 13:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0EB6EA12
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 13:24:49 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9531958071B;
 Tue, 25 May 2021 09:24:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 25 May 2021 09:24:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=0sY59b1TrDjPi
 ASD9RGCdGoF4tj7/vODVPj+KEb/jBw=; b=FvbLE/mCeXK5Z+D8T6eb+aMBfu1dH
 rYc/P9IaptQhvZcmVQQLYCb5eg03tcgUa4+Ryn0CMNPBjnTY3EDZ/d10TbuCs0qR
 a95KOtPvKaRa4N6n+Q2MD1qrAAneJo08+HpFQXKu4id3zXKs8wfXG7QYHk7cHr1b
 RqswjbWS2KIBQYmMH4A/yotceUjRHuHDlRKQkds0d6/dLjWkwfQhqCeW5ZCi8rbA
 Nvcce3byZwft+jstIvvY7nK8KHrC2xIRvN1/L2YLAAW+b7wfsJsMxjHVc7Pdm400
 YLvCTKirBkehtw+DSa487/V+q+xuefBFLHcE2ppFvoM6pC9D/iineNCPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=0sY59b1TrDjPiASD9RGCdGoF4tj7/vODVPj+KEb/jBw=; b=E5iHDMMQ
 s8/Wymo+TMeOKtPcsKpefoYHNZf3Yd11dyjoQdu1QAGeBlzmHR2ngUU0yJIZfVix
 wx7W/rNg90Is/WUoZnl0XU8U5YK05uORKfWjkpqmsqZFXl3r4h/NwS8/svclA5OG
 w/S2XVexpUMjrZH6O1+hLn44GYPOOC7CpvFuxNhIy8w9sLOjsrx1irAT/I/Xz/+D
 /yFGrrHE54JxNfxjtCdZ+sfNYJIXN40NBPIcVVep5JXAXhjaovhPqSZnguo6uHXW
 5YWyR6ITIjrarbwDQ9zvc1mdxN9adkEo5gnR0wcX4LVz2eMXefLxOhm9SRGrVGF+
 4Cukrq1jGblpFA==
X-ME-Sender: <xms:h_qsYNoKOYSCN-ynsi4g6CV4YUIVEmPjUrKGFYNZAYVkn0rj0GzPHw>
 <xme:h_qsYPqW9-AwW5T_WLTu4YukJ2zO3JpEq1YdLgk-xr9JDG4tVxFVqiUrcSaynskWq
 IGSOsrNq0AEW2vIQsM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekuddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:h_qsYKM86CwRDUHpwg1Cppved6egCJB2PtM1rEmjknurtWUSF6CJSg>
 <xmx:h_qsYI6vg0o-laDP0y-YLHLb7hV5gZ1zz8XHBLodhOlFQLWB1p6xOQ>
 <xmx:h_qsYM4X90DCoppFLtS2HbNiB_nsdbVqk-iXCybDKPWE230nxsvXww>
 <xmx:h_qsYIN6hDEaBAWJpDUxuUNZatSx-0aQrO3xinl4CmsipVdT-4aVAg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 25 May 2021 09:24:23 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 09/12] drm/vc4: hdmi: Remove firmware logic for MAI
 threshold setting
Date: Tue, 25 May 2021 15:23:51 +0200
Message-Id: <20210525132354.297468-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210525132354.297468-1-maxime@cerno.tech>
References: <20210525132354.297468-1-maxime@cerno.tech>
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
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>, linux-doc@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, Dom Cobley <popcornmix@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
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
index 0cf9949a749f..b7e3bd89e237 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1269,22 +1269,12 @@ static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
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

