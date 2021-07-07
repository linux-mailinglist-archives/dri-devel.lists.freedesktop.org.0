Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4313BE5B4
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 11:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8116E07B;
	Wed,  7 Jul 2021 09:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8F96E86B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 09:36:41 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id B09992B007EC;
 Wed,  7 Jul 2021 05:36:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 07 Jul 2021 05:36:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=wVBBzFCHibvTl
 8Q5E+ycDHlkR8pOTwe/HKyytHOGfpI=; b=DpQdUOi9VX0cus6fLgI1F1c811SIS
 JXdyu7zfyRo510SFJ/+xpaA3Qxc1dzMj9y7Mb/IAxV0ipqCXeHw0hlYER14O3Up8
 W7Ca9c/vM0+ciYE6b9kiPFs+iKwY/oD/0hnU1zya9czk52IBrHafHv8uZvoo8yx/
 DK5gvYNuZPB7beoKRqISVCWMS0kUvy1Z2AOQ6uNkqPXyrrjPBjY6/BHe/07EeTQN
 ev0cXlxDma2m2TL37dd+bKozYONq4Pe/7PKVUcbigkXOSSRekvwt+ZljfY/WdG+8
 PVd2utOSHTqAD6I9f8zQtH8WLv4CsoQvIJ/G6hybV1jezUcEAL6qsPICQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=wVBBzFCHibvTl8Q5E+ycDHlkR8pOTwe/HKyytHOGfpI=; b=mLwGomye
 GpVlbvWeEmnWdyhaUXD1RemQf/Vo4G+OflWYFCuWgBySIDVBnqLRMOW69nr7gf/K
 XI/CYcjywOdICiD59VoAibqH1bkd70apCOArwDEVVjZO0GEFqltCfvzGsZ29Qr5q
 B+dLpUS1WbsPdWJH+rqi6K54Rek+wffi0pMnF4NB1DBLZW15DWsBV0P6Hnl7QnMi
 /iTVCj77WG/AW5l8dRHyWrymQL9f5/yv7CilugRLf7dcdeVvzt4Jry8g0vKqScPo
 zmLiFdRKo5hVwgKR51Q76J2Mw4B8D5ZsQ/5uN0hlrc12GXZ00u7B4ZEOjlBLe0sD
 dDwDmJqHbyOVng==
X-ME-Sender: <xms:p3XlYJMhvwExupWRU1pSwRBf7kos0tTqFAyIv51tQqY3XLVjh8tfxA>
 <xme:p3XlYL95BSw8VjvJSRosqdlGLlm8hmti6Z3G2VYwP7MYZFwIhIxgEIV-I3wD-VCni
 gV56lVXSzx7uwC71ZY>
X-ME-Received: <xmr:p3XlYITIKn9KU8YSVrBTYCfIIwTmeE_BYrQplc2Xa7wGn8CslFFfBtO3swO02ttBStkF20mJBZNeznz_XYmLHNVcx1Aoqau5q6di>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgddujecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:p3XlYFtk8SsVOaEGqRbcX8r58j051ikVFaZFG9jU7PqLW9v8VeHu9w>
 <xmx:p3XlYBdBGUDH_VP5PuG95_EakxzjDJGZmsNnmFjTREnqbMu_yKjSfw>
 <xmx:p3XlYB39VW-j2omhZ_0iNvT6NDfqPzCb2KK2aVDFdB7nVCRRny3_7w>
 <xmx:p3XlYMv5VwUcnT8G3Gy7czcg0iY0ZGCjS1F96XeTO7kqVj-jqOvzsa6ckjQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 05:36:38 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 2/2] drm/vc4: hdmi: Remove unused struct
Date: Wed,  7 Jul 2021 11:36:32 +0200
Message-Id: <20210707093632.1468127-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210707093632.1468127-1-maxime@cerno.tech>
References: <20210707093632.1468127-1-maxime@cerno.tech>
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
 Phil Elwell <phil@raspberrypi.com>, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 91e99e113929 ("drm/vc4: hdmi: Register HDMI codec") removed the
references to the vc4_hdmi_audio_component_drv structure, but not the
structure itself resulting in a warning. Remove it.

Fixes: 91e99e113929 ("drm/vc4: hdmi: Register HDMI codec")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 3165f39a4557..1bb06c872175 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1403,18 +1403,6 @@ static const struct snd_soc_dapm_route vc4_hdmi_audio_routes[] = {
 	{ "TX", NULL, "Playback" },
 };
 
-static const struct snd_soc_component_driver vc4_hdmi_audio_component_drv = {
-	.name			= "vc4-hdmi-codec-dai-component",
-	.dapm_widgets		= vc4_hdmi_audio_widgets,
-	.num_dapm_widgets	= ARRAY_SIZE(vc4_hdmi_audio_widgets),
-	.dapm_routes		= vc4_hdmi_audio_routes,
-	.num_dapm_routes	= ARRAY_SIZE(vc4_hdmi_audio_routes),
-	.idle_bias_on		= 1,
-	.use_pmdown_time	= 1,
-	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
-};
-
 static const struct snd_soc_component_driver vc4_hdmi_audio_cpu_dai_comp = {
 	.name = "vc4-hdmi-cpu-dai-component",
 };
-- 
2.31.1

