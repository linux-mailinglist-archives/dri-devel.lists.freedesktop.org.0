Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 637223BE5B3
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 11:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876E86E867;
	Wed,  7 Jul 2021 09:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB456E867
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 09:36:37 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 514F92B007EB;
 Wed,  7 Jul 2021 05:36:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 07 Jul 2021 05:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=BB1WLfccIT/pYvMjl/3Jvk+n/Q
 /wQoR9zSWQeO9lpRw=; b=wANs8FTqWQrokayuqCGed85Abc80o1m326Tkx8eZeM
 Gg0X+vlImDTMv5tobRnN3DSvEHgOvCC+4UTyVZFy86N1DGBPfd48znN/stjvtGfq
 mFKhuYfozmx8dluqNw/TDoe4v41VswsXzsXG04qQYrkWe4UFkeTDGjf8sWjzA1NE
 9JSS97o4/mf9x5tKLS7AiNdrzCy6qZjhXKns1r5iY3FWW3CuxZEmGaC+bG3nLB8M
 5BfkCG+8FvqtJa7VSAkzhaMTkdW869PPrEZLsmv/DsPG4xsSNAwJRNhzWakzEG1j
 m77av62Patqqk2CWQ0DZLaEyHi3gLzR8TK1YRrYBKFPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=BB1WLfccIT/pYvMjl
 /3Jvk+n/Q/wQoR9zSWQeO9lpRw=; b=bif4o1DWiJy5+z/CHBtEnB5FpwHGryvtT
 wUOSe2R0tzYMnKFrVsOKQ+35SIzy5L+UhWSyuNnvcqo+flKbDT8klI7r//6Jcmp6
 L8dlZCPT9U3SH73BV9dsUaXJMyha9nwLV+rctOYnbrf2DB8B58rMXxox/Xb3v8vT
 GnB5uy/IOA3+StwbEgm78n5tJ4/5JRzAyzKRoFQQiBFqyFhdBR9geOoxfYjp2OdZ
 ORi8tfCCw9IBwBF2TccaC+wV94SHjoBh++0Wp1xWOlCJPeFqJBKYXaInlXCfkLS3
 2kg7m5kqiiKoO71cWKzij3AMSSUQYxY1ufK4wIkhkXD83S/dDcmyw==
X-ME-Sender: <xms:oXXlYLd679MHJQFQ7UAWxpnlyzMGLhFyPg2qRoyjqyMyf_S5tHRqyg>
 <xme:oXXlYBPG4X9u_hyd-MeHdn34P8UEPhzD3SRl2Nu2rZOdE6WR-LaojHJ-ZdYambMle
 _Od9GazmD9xQyGKfcU>
X-ME-Received: <xmr:oXXlYEjA-lVlUqjMl3DwJgAhyB-qY73DZOWEX2zWO-tMotZCgWxXZf5DrPv_cvrsBCyAtIiw7p170j-HMwEafoC4RpVXRvKO6aZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgddujecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigih
 hmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:oXXlYM_6x9vweyT-avO8tXEcyxHSA8k1C7mPRTNh3yiZIFUfexzdbA>
 <xmx:oXXlYHuIkzSbKizdyl_vSdFP0zQ-cDCqZPyj_gEv08K_miPi6Wt_Zw>
 <xmx:oXXlYLE6uuvkTpAEJOBU9z5j5ukUdXqQs2qe0P8uRIOcwrw58Ls2Kw>
 <xmx:o3XlYPO5e8XEZH8oUolOdD-5_qGJMbcXOVwUM-IOOG9JNnh9FqyPwDnkHtk>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 05:36:33 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 1/2] drm/vc4: hdmi: Remove redundant variables
Date: Wed,  7 Jul 2021 11:36:31 +0200
Message-Id: <20210707093632.1468127-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
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
Cc: Emma Anholt <emma@anholt.net>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vc4_hdmi_audio_prepare function and the functions it's calling have
in several occurences multiple dereferences of either the sample rate or
the number of channels.

It turns out that these variables are also passed through the hdmi codec
parameters structure. Convert all the users to use this structure, and
if it's used multiple times use a variable to store it instead of
dereferencing it every time.

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 26 ++++++++++++--------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  2 --
 2 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index cbeec6a5cb90..3165f39a4557 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1176,12 +1176,13 @@ static u32 vc5_hdmi_channel_map(struct vc4_hdmi *vc4_hdmi, u32 channel_mask)
 }
 
 /* HDMI audio codec callbacks */
-static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *vc4_hdmi)
+static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *vc4_hdmi,
+					 unsigned int samplerate)
 {
 	u32 hsm_clock = clk_get_rate(vc4_hdmi->audio_clock);
 	unsigned long n, m;
 
-	rational_best_approximation(hsm_clock, vc4_hdmi->audio.samplerate,
+	rational_best_approximation(hsm_clock, samplerate,
 				    VC4_HD_MAI_SMP_N_MASK >>
 				    VC4_HD_MAI_SMP_N_SHIFT,
 				    (VC4_HD_MAI_SMP_M_MASK >>
@@ -1193,12 +1194,11 @@ static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *vc4_hdmi)
 		   VC4_SET_FIELD(m - 1, VC4_HD_MAI_SMP_M));
 }
 
-static void vc4_hdmi_set_n_cts(struct vc4_hdmi *vc4_hdmi)
+static void vc4_hdmi_set_n_cts(struct vc4_hdmi *vc4_hdmi, unsigned int samplerate)
 {
 	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
 	struct drm_crtc *crtc = encoder->crtc;
 	const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
-	u32 samplerate = vc4_hdmi->audio.samplerate;
 	u32 n, cts;
 	u64 tmp;
 
@@ -1332,27 +1332,25 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 {
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
 	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
+	unsigned int sample_rate = params->sample_rate;
+	unsigned int channels = params->channels;
 	u32 audio_packet_config, channel_mask;
 	u32 channel_map;
 	u32 mai_audio_format;
 	u32 mai_sample_rate;
 
 	dev_dbg(dev, "%s: %u Hz, %d bit, %d channels\n", __func__,
-		params->sample_rate, params->sample_width,
-		params->channels);
-
-	vc4_hdmi->audio.channels = params->channels;
-	vc4_hdmi->audio.samplerate = params->sample_rate;
+		sample_rate, params->sample_width, channels);
 
 	HDMI_WRITE(HDMI_MAI_CTL,
-		   VC4_SET_FIELD(params->channels, VC4_HD_MAI_CTL_CHNUM) |
+		   VC4_SET_FIELD(channels, VC4_HD_MAI_CTL_CHNUM) |
 		   VC4_HD_MAI_CTL_WHOLSMP |
 		   VC4_HD_MAI_CTL_CHALIGN |
 		   VC4_HD_MAI_CTL_ENABLE);
 
-	vc4_hdmi_audio_set_mai_clock(vc4_hdmi);
+	vc4_hdmi_audio_set_mai_clock(vc4_hdmi, sample_rate);
 
-	mai_sample_rate = sample_rate_to_mai_fmt(vc4_hdmi->audio.samplerate);
+	mai_sample_rate = sample_rate_to_mai_fmt(sample_rate);
 	if (params->iec.status[0] & IEC958_AES0_NONAUDIO &&
 	    params->channels == 8)
 		mai_audio_format = VC4_HDMI_MAI_FORMAT_HBR;
@@ -1370,7 +1368,7 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 		VC4_HDMI_AUDIO_PACKET_ZERO_DATA_ON_INACTIVE_CHANNELS |
 		VC4_SET_FIELD(0x8, VC4_HDMI_AUDIO_PACKET_B_FRAME_IDENTIFIER);
 
-	channel_mask = GENMASK(vc4_hdmi->audio.channels - 1, 0);
+	channel_mask = GENMASK(channels - 1, 0);
 	audio_packet_config |= VC4_SET_FIELD(channel_mask,
 					     VC4_HDMI_AUDIO_PACKET_CEA_MASK);
 
@@ -1389,7 +1387,7 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 	channel_map = vc4_hdmi->variant->channel_map(vc4_hdmi, channel_mask);
 	HDMI_WRITE(HDMI_MAI_CHANNEL_MAP, channel_map);
 	HDMI_WRITE(HDMI_AUDIO_PACKET_CONFIG, audio_packet_config);
-	vc4_hdmi_set_n_cts(vc4_hdmi);
+	vc4_hdmi_set_n_cts(vc4_hdmi, sample_rate);
 
 	memcpy(&vc4_hdmi->audio.infoframe, &params->cea, sizeof(params->cea));
 	vc4_hdmi_set_audio_infoframe(encoder);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index b6697b695f71..33e9f665ab8e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -111,8 +111,6 @@ struct vc4_hdmi_audio {
 	struct snd_soc_dai_link_component cpu;
 	struct snd_soc_dai_link_component codec;
 	struct snd_soc_dai_link_component platform;
-	int samplerate;
-	int channels;
 	struct snd_dmaengine_dai_dma_data dma_data;
 	struct hdmi_audio_infoframe infoframe;
 	bool streaming;
-- 
2.31.1

