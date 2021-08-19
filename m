Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEBC3F1B38
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 16:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 844D06E837;
	Thu, 19 Aug 2021 14:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F62C6E837
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 14:08:03 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 29CC12B0057D;
 Thu, 19 Aug 2021 10:08:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 19 Aug 2021 10:08:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=xa5fLXMpR5HsaCtK3OGoG34Wqh
 bDpH4JqsfVwnvHb7Q=; b=MQv6e2pzI+DyetvNime9xvoPDtwaTHlFs/PC6AfUhM
 ZI26Jwxk20SYpHv5GCC7I8lb983cW/qCifm0mfgSPlvpSiQKLQXbqrXddL836DjA
 QEYmjSC/nFQK+OD4Jrbl/yEDtsIiWWuVnVN3B83daXextRTeqV0N2NvGtHbcsEs6
 Lke2u8YR5fDimfcPht6sozIHKIHeBPIbPWyU5CBvcBXKmPUS0NLxb5OVSbSwzRlq
 YJNXuR++v08drXTQlmus2zS+8+LHC56qRKPi7sUsL/JpuY9DgXoho1ExsjdzcfWc
 2r6+C5/whj183IKuRFVEfZ2BznzcJ4PHoxd0heW1PMQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xa5fLXMpR5HsaCtK3
 OGoG34WqhbDpH4JqsfVwnvHb7Q=; b=rlmwp5wAKQAXfJkThUzQpBqpjiHigEJFk
 i3izHWPf+48t8vX5FCRwRn1JMidFz0lZ5c7B+X7ckuQ1TQhdlvHO9fyZDHjoHyPi
 2QqmN8oaHMgS+wj0yFHcwEJGCIlrs7r0kGq4cbxB8oXn7JNyD+1PIAfeptopTW82
 iFXq2dZrtwUEGYkjwgTWwzbEpgYZrL2HH7gHw12T90ganaqg6FOWH8Pn4E+zTP8u
 KljZLihm0zgC5krVo6W0iSQRWrhFiRxTnlZCO919NputeEvH0eDg1h/+YZvjhBYG
 SjF4AsE9HdQJBIOnKnrgHg7B7Emm+B5Mq30CkAj6KqZsiPei3iLzg==
X-ME-Sender: <xms:vmUeYWXNDyYb4Ze8IqdYEgs4606UJ3xS1YBuQyw86CwI3cd-yHFr_A>
 <xme:vmUeYSlOVZ55-2WAKdIU6ZMraJbnY2u8S9fdLMLBWm98U5AvbcXUOx0hqyS1CNIzj
 FfMpvrDxJUXH8nfpGc>
X-ME-Received: <xmr:vmUeYaZ1t6HTPQK1lvsx1PEG_W1VJY0_UknGWEnCuLEX0yWCOtKQCFFKTXi-o6rVffx95wJx7zJoIu5kg2VBhvOL9nlKmj7bnwiH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgdejudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigih
 hmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:v2UeYdWnu1zYM_FodZ5P7CjooFHp6b8U9CuBnSO1QOtxxItTYVSOQg>
 <xmx:v2UeYQmYT7_TWw2sWqbdamxRM_POCdlM9wIlAUVb6127-BJfdCYH9g>
 <xmx:v2UeYSdurm6fT1nz2dcpO3CNtNJ2CtxUlmsBLWscsCSUv1kanOzfww>
 <xmx:wWUeYb9M0jO8yhIiFzAHUsTt0NKmWD0sNPvtqZTuNmQwWmBrAEQjs7qmpyw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 10:07:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Cc: bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/vc4: hdmi: Remove unused struct
Date: Thu, 19 Aug 2021 16:07:53 +0200
Message-Id: <20210819140753.930751-1-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commitc7d30623540b ("drm/vc4: hdmi: Remove unused struct") removed the
references to the vc4_hdmi_audio_widgets and vc4_hdmi_audio_routes
structures, but not the structures themselves resulting in two warnings.
Remove it.

Fixes: c7d30623540b ("drm/vc4: hdmi: Remove unused struct")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index b7dc32a0c9bb..1e2d976e8736 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1403,14 +1403,6 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 	return 0;
 }
 
-static const struct snd_soc_dapm_widget vc4_hdmi_audio_widgets[] = {
-	SND_SOC_DAPM_OUTPUT("TX"),
-};
-
-static const struct snd_soc_dapm_route vc4_hdmi_audio_routes[] = {
-	{ "TX", NULL, "Playback" },
-};
-
 static const struct snd_soc_component_driver vc4_hdmi_audio_cpu_dai_comp = {
 	.name = "vc4-hdmi-cpu-dai-component",
 };
-- 
2.31.1

