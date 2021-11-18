Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B61D845592E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 11:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C716E9C2;
	Thu, 18 Nov 2021 10:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 926216E96D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 10:38:21 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id EB3CB580916;
 Thu, 18 Nov 2021 05:38:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 18 Nov 2021 05:38:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=G1t7vylcsSNeR
 l5th91rZ5R4nGF6kCO3PrUHizPzPyE=; b=AoAcN3ZEXets+FLjET8SgEaKQAb9C
 76Rs+W+7n3I9cOAD0xQGrHB8Enr8SV0KVt85W2hgp6+PDk2bSEOX+EiB8SOARCri
 U4p15rb6E/4cZXLPghK2zmhuYvJVrgwVR0dXWBiYvaW3Fg0I2R2fBFrDMb8DLBxV
 YkvkKQ5XFaeiMOrYg+3xuirzGMxfG1aJWScW4wf+0MOiYlzVNUdVcFyDcbvBpSEk
 BemRKcRk+SYYt9pu5W9lNOAnmUnvj0UdNzBl0X6bgP9kAFj6KZnGbiapvM6SuGxB
 ise6gDeyjmNC171n0rDmUTzZ1wG670IWHo5vrhYH5lNO/fooAzG7bzd+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=G1t7vylcsSNeRl5th91rZ5R4nGF6kCO3PrUHizPzPyE=; b=nPQc/UA/
 eVKJCdNntMPafUq4vVvaFHHc09tmrVQm2Jqg4NsfcrRa5j8JfIy2HitE2hjoyAGZ
 x6DFl0C5s81FVdv3HGvTi6RONWNt61WOPAz0KyijXL2MD0YXg2T5+MzeD0UelQF6
 9NVrDjUkomJMzT2hDdxWkgm+Yaw0MmHmLtp7CIG/TpZV2weFVYiWLFgGN4phfYEz
 y4q4OKVSpwAwqmeb30uAwneI8fdbzf10a8bn8VQa9coG2SiZe8J7GRGgaZi730Hu
 ekGrgL5CdxGtnauphjO2EeFr2dGAo/s0W6uSGVNgEvn8gFp8VDkmfAbJ4NwwBRzo
 9hux/uaKnYKn8g==
X-ME-Sender: <xms:HC2WYcdJtSD2YjzgB8HfNif2OeOXtZ9iSR21maSjK0gyOfFVZIdMrQ>
 <xme:HC2WYeNP46ovXlCoZUfaLWoOAav3EZfhajU4pGpQP3I2051XOOiaMTy7kOL_nqLnn
 hPkoFJFl-v_jlpPUhk>
X-ME-Received: <xmr:HC2WYdhNM3MvNrKJvQ8dt0f7VWUj5LbfEph8cDB4nXit-0tHVGY2L7bgbWjsohSsHrSWgewVWR82YRDHgD6caw_EyCar04imtG4kb5spl-k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeigdduiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HC2WYR-hy3yXcf_bZFrHkEFPyG0D_YcEcV2IJB0_eMA-dFdveGGhlQ>
 <xmx:HC2WYYs4TbysFMakoi7qkGWZfwHuQKV4KBLBkMYAuOFJI2qwV8X4Cw>
 <xmx:HC2WYYGRuLjlqLlT-hAz_28V2PpKKv_F8NI_v0d17b1uHB41K2X4Wg>
 <xmx:HC2WYaJHFwbY-MiQSu01LwHmX2pCuAXJmPBxge_GyQvsL1Z4NJTmQw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Nov 2021 05:38:19 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 01/13] drm/connector: Add helper to check if a mode
 requires scrambling
Date: Thu, 18 Nov 2021 11:38:02 +0100
Message-Id: <20211118103814.524670-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211118103814.524670-1-maxime@cerno.tech>
References: <20211118103814.524670-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Most drivers supporting the HDMI scrambling seem to have the HDMI 1.4
maximum frequency open-coded, and a function to test whether a display
mode is above that threshold to control whether or not scrambling should
be enabled.

Let's create a common define and helper for drivers to reuse.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 include/drm/drm_modes.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
index 29ba4adf0c53..3bbf98ae59ae 100644
--- a/include/drm/drm_modes.h
+++ b/include/drm/drm_modes.h
@@ -424,6 +424,26 @@ static inline bool drm_mode_is_stereo(const struct drm_display_mode *mode)
 	return mode->flags & DRM_MODE_FLAG_3D_MASK;
 }
 
+/**
+ * drm_mode_hdmi_requires_scrambling - Checks if a mode requires HDMI Scrambling
+ * @mode: DRM display mode
+ * @bpc: Pixels bit depth
+ *
+ * Checks if a given display mode requires the scrambling to be enabled.
+ *
+ * Returns:
+ * A boolean stating whether it's required or not.
+ */
+static inline bool
+drm_mode_hdmi_requires_scrambling(const struct drm_display_mode *mode,
+				  unsigned char bpc)
+{
+	unsigned long long clock = mode->crtc_clock * bpc;
+	do_div(clock, 8);
+
+	return mode->clock > 340000;
+}
+
 struct drm_connector;
 struct drm_cmdline_mode;
 
-- 
2.33.1

