Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA963F1B0C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 15:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E056E985;
	Thu, 19 Aug 2021 13:59:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC166E985
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 13:59:42 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 1D8EC2B005D0;
 Thu, 19 Aug 2021 09:59:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 19 Aug 2021 09:59:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=vrgR/7Ax9Jv2e
 zbaP/CKQhrK7xJEFBCM3d5iboIQxZw=; b=1nBhJdv/dY7RiDWTlJNKV2EN7m3Gn
 6yztKWzx0gxtKbs1HBFOWRzs8yivv0DP+oy7O068uVlZdDwmaQ52pV/RPbMukY5R
 3Z4OeQW3MEFejpIMLK9jgDJEUmXTW4P5i+WYmGkn8pQidw2k/R33AqZmPsDWu49W
 5Gg/6QmLRsRLH63iR+ZFyJXqh4ZOYNVy4OFJhhk53bkaSye+j+btm0+E9mru0t+P
 /J0atD3v/MKHqApT7dTab8AxPpPFOWlyvER+aCruYPkJdN+DQySpHdIX4X7wa82L
 I0vn6AJuMHqqK+wglPCXGPBgKpu6U4F3oviKlw3ZLfekjE38aGuZoQKtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=vrgR/7Ax9Jv2ezbaP/CKQhrK7xJEFBCM3d5iboIQxZw=; b=XOmGFEpb
 dPHs+Q0cR4vhR90CLTyB+zab0Uand8Tc5F+GgjHw/mHglX614bRHkuDMhe/ZkYxd
 nz36IimAB47RmiEwZ8kFOmc0I4KtIaqGUkLLiyPBRdlusAHCtCCovWHVta1JUxT+
 o1dv1pYcW7BBQ6/yrTNBRnBURn9cBvCnvnDbpNl9S6HAoxcOyuHrGAuT4iHs4oFl
 0nq+630ssu24PpOyfcI6YyxbQICXs0eKEE2VIUQoP3Mg0yc6Rr7WDFOsFfUdGvMw
 RTcQxvOpYPowP1IcDo4CPMzPA4Av7Etau2WTCRrW0cXV1WcnSINuaRPawX8ZmDUi
 egHcS6AgjDmQXw==
X-ME-Sender: <xms:zGMeYWQksepWnzPZ2XqKFwxTOQG5lQgZXgKT6ym8MM6wDVzTH9v24A>
 <xme:zGMeYbxyRKDdcwl4vgAJdB3rubOEHcTjILNd9nF74F2DfacGO9q8sQGUYANyttECz
 CxDXPwElkOPbn3gLt8>
X-ME-Received: <xmr:zGMeYT0a6oCjw0pCIkChuOvWStLpovgmiGxRfejJ8HN3XSM4it8gxuswtuI9GfvjDnHF-3T2QRepg1dCtvtjSTB4SfGj6ATnLQm9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:zGMeYSBmX5IIIuSiQRuojMy66z3Tb5NngBdVItPg6dzKywPoVUtepQ>
 <xmx:zGMeYfj_IipYUQbg7rZCUKe8Fnm-YDLD8B8LUQgbCnlcmROTI-zlIA>
 <xmx:zGMeYepoZuxrElK1VT1bwUuKaCL8luXDKM3d4z1Us40cn9NMNBy-pQ>
 <xmx:zGMeYeQR0DLnCB8jb8RxHELN6ZFsYBot1FsedvISbLnJS7Tore9Ogv5SuYg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 09:59:40 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: linux-kernel@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 bcm-kernel-feedback-list@broadcom.com, Emma Anholt <emma@anholt.net>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 1/6] drm/vc4: select PM
Date: Thu, 19 Aug 2021 15:59:26 +0200
Message-Id: <20210819135931.895976-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819135931.895976-1-maxime@cerno.tech>
References: <20210819135931.895976-1-maxime@cerno.tech>
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

We already depend on runtime PM to get the power domains and clocks for
most of the devices supported by the vc4 driver, so let's just select it
to make sure it's there, and remove the ifdef.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/Kconfig    | 1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
index 118e8a426b1a..f774ab340863 100644
--- a/drivers/gpu/drm/vc4/Kconfig
+++ b/drivers/gpu/drm/vc4/Kconfig
@@ -9,6 +9,7 @@ config DRM_VC4
 	select DRM_KMS_CMA_HELPER
 	select DRM_GEM_CMA_HELPER
 	select DRM_PANEL_BRIDGE
+	select PM
 	select SND_PCM
 	select SND_PCM_ELD
 	select SND_SOC_GENERIC_DMAENGINE_PCM
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index c2876731ee2d..602203b2d8e1 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2107,7 +2107,6 @@ static int vc5_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
 	return 0;
 }
 
-#ifdef CONFIG_PM
 static int vc4_hdmi_runtime_suspend(struct device *dev)
 {
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
@@ -2128,7 +2127,6 @@ static int vc4_hdmi_runtime_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 {
-- 
2.31.1

