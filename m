Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B8845493A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 15:51:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35DB86E47E;
	Wed, 17 Nov 2021 14:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A07856E188
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 14:50:50 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id E9A0F580874;
 Wed, 17 Nov 2021 09:50:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 17 Nov 2021 09:50:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=qzonQ7o9ZUVo8
 KUbjrot/21pyteCYG+CTBgNW3fAN9E=; b=ATM+7D/krNYW4HVDb1QG53YCR1Run
 P1/yGlc7N2g06NiZBX+cVpBHVNzN4bHFDDxCyGzT0e/ZrqtxqWPfyEihIovf2OZm
 lNJPR1NEe/juvh+RbGD3s/Rj+7bCbEWj3EYGUQivmSgIikSQjYlKfJKN7DDOGmUJ
 nRf7jhUr0kAp8X6/J40983x8Gwmxs9qL9t6+P7/Xa7smKdR68bNPI0PwYXi5hnak
 FN3KTju4iArMD5HvxF5uGN5VjOcnYlqZWu6cLSOVN7OxZ2HXdMWLPSKPwNGnZGSV
 Qdbarz9LwK04Mb9WhtO/OmfUWriVOEaxLCXCf7M7dqdVW5Htk6LwLrGlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=qzonQ7o9ZUVo8KUbjrot/21pyteCYG+CTBgNW3fAN9E=; b=gweAVR6U
 0fi/f4CPRy4xUsCFgy9tsEawncK/81xV6AgLwUOv0xzn1r+FSI04m07JGwWW/Jwm
 DK12x2ywVZZWj4al8OE7ko1wDahLt2E+Y/7aDhw+4Xlf1Jwrb1TRSzSfYfT6xHu8
 Z6URqx9WpX1E6k309xFqP4kDGOaDUuRxj9nN3Of6vRVn2AjOQDiCrDloR7Wx552o
 B2kieFRVCqxIp4N9YLS+Xt/sZKP8KZPuxjJhUVIQ525z32NC3oqPR37UFAAMlI8u
 u3NVFqamfVkFWUOrQu9yatyxmLv1Pz/0Qocl+yfnV4LTa/YzjysaVivQw3cKLl2k
 BnH8p0pDripenA==
X-ME-Sender: <xms:yRaVYQTmaV83-OQhATYvcsHhV7QoEqdtV1RPvrxbT75JDDrCsPHHjw>
 <xme:yRaVYdyjZJBPqtisQ7LtgmcFSzo6bOF4l2lyV1KiTx08NzPQcfFZAWoFNXh0p-bbo
 724volZwwiyn3Rj6uE>
X-ME-Received: <xmr:yRaVYd3EQbT5-7ySsaFFgE04Ya6B5wRW8C5i-STE-DcfI6EzmKRq4UCI8e1whSJnR27xfeY9E_Z50HYb2fnsxVky9Yv-KDinUQFJfMscH3k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeggdeifecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:yRaVYUDMfj106zf8xrviCS2MVJKjFaaRp-MU597Tn0Zna8a58sqj0w>
 <xmx:yRaVYZg7wiEF7H_7JfnQ7Hn1TnHkrC0eTVakPrJx6RZkpFzkxwXEDw>
 <xmx:yRaVYQqMRCJtpOhrgXr93-tzcYIamyIxLRiSKOGxEnEtclCq3xXTXw>
 <xmx:yRaVYSYsehQdpZPyb9lNo3WChVbJMJxeVhnIR_P_fzg1C05Iz-AX-w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Nov 2021 09:50:48 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Scott Branden <sbranden@broadcom.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 3/5] drm/vc4: Remove conflicting framebuffers before callind
 bind_all
Date: Wed, 17 Nov 2021 15:50:38 +0100
Message-Id: <20211117145040.334827-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211117145040.334827-1-maxime@cerno.tech>
References: <20211117145040.334827-1-maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The bind hooks will modify their controller registers, so simplefb is
going to be unusable anyway. Let's avoid any transient state where it
could still be in the system but no longer functionnal.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 16abc3a3d601..8ab89f805826 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -251,6 +251,10 @@ static int vc4_drm_bind(struct device *dev)
 	if (ret)
 		return ret;
 
+	ret = drm_aperture_remove_framebuffers(false, &vc4_drm_driver);
+	if (ret)
+		return ret;
+
 	ret = component_bind_all(dev, drm);
 	if (ret)
 		return ret;
@@ -259,10 +263,6 @@ static int vc4_drm_bind(struct device *dev)
 	if (ret)
 		goto unbind_all;
 
-	ret = drm_aperture_remove_framebuffers(false, &vc4_drm_driver);
-	if (ret)
-		goto unbind_all;
-
 	ret = vc4_kms_load(drm);
 	if (ret < 0)
 		goto unbind_all;
-- 
2.33.1

