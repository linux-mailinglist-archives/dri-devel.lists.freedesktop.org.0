Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CECE4731B6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 17:26:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CECDD10E7D2;
	Mon, 13 Dec 2021 16:26:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBBED10E7D2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 16:26:44 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1FBE65801BD;
 Mon, 13 Dec 2021 11:26:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 13 Dec 2021 11:26:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=5jXA/kJUnHNXe
 i3kWYCHbhB8LRX/fvUqDJgIAUMTB+s=; b=E9NpO9pMbcAk5CJRneUJd3Vq3yOTN
 O+3EzJRaWwkOslq8Z3Pvqa+f33eDh8g0kcJXCL8soucOF4tG/+vfptp+86IvJY24
 dojIz01oWxUszjkeZhPRIAd1HxFAyjs4rggHG8CmjsX1dIsVMPqvefmH9MbpKXoF
 J7EiykSXaLE4iRdvLaXMWyVLOeMvSIX7o8Gs7rJsS3CugjbE/TWTAT3MjHDhix/3
 wqF4dnRCsHUBWVLCmBn4O0xZI86WJsKhOgzUJ0JzkwZtEjMQXfDdT/PaIHhx+y14
 22MiiNn89PhO96uFZke+jlu13QxV5IZctLR7RLVb+IaSB6aPrp2zdnTqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=5jXA/kJUnHNXei3kWYCHbhB8LRX/fvUqDJgIAUMTB+s=; b=gbUsM7uW
 70COHYLi08uXT33wlV0bDGx1ZER5tfJjYTUw/X/m43OZ29MBEHNP6fuKLpHOOr8S
 2OX0aeDWOocffS2UjZ6CRRklA+67WuHs7ROMMSb+jXUWWsay1eZVJTQMarGUgkJe
 S0CNykh2M3RH1KR8J9z1toLsDkF14YOWfE499DujGnc3Em5gSi+65HrhVwnQxw83
 ImEY8B68jsAWxpdRGB8x+M8FtZnj5rrkMmQGiOPp4hPHILRc2cpeA3hMvrk8fnZV
 WXT+CTo7j4u/uJs5a+tFXmCVx+LYBJbUyymMqB8w7ZUzQHHgaheiSwmsvdpw2+/G
 MuQoaPTXVezQZA==
X-ME-Sender: <xms:Q3S3YegwrD_hZ6kCUboZKBntu6q9juaMUX4rPQXZqmDb2N1DzxYXHg>
 <xme:Q3S3YfBeF17X5mYCaSy62FCgFZPxydZb_Uxajpk0ViNuqXHN2vcIWC9kljYeqz79t
 HaYsBOgSP9q9PK_pVY>
X-ME-Received: <xmr:Q3S3YWFk36vE67St8L_K_UidVOYmZYmRcDy6MkDKrAReCbQ5XQve7Aa7aFxZNwieTd964ECklXAZitKk-jSB1_SC1Os6RwoK5EizkBRO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdeklecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Q3S3YXRPnM7F7_Nl2nng9cMdIDzyfxN2GmVjhMremLFMJu7IF_UHCg>
 <xmx:Q3S3YbzQI3sBIoJX62advgbTPrcK-cZzhNVLgoW45XGsIphwNUKEXg>
 <xmx:Q3S3YV5k_5Fn30fDGiVAtWrKCqVobEYMj951y5-QHt18ezwHi30lCQ>
 <xmx:RHS3YcpyxBtiJuTaTgnBUR_bLFnFcr0CKEvX66Q0ZGOj5C1UPP8hOQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Dec 2021 11:26:42 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Ray Jui <rjui@broadcom.com>
Subject: [PATCH RESEND v4 v4 3/4] drm/vc4: Remove conflicting framebuffers
 before callind bind_all
Date: Mon, 13 Dec 2021 17:26:34 +0100
Message-Id: <20211213162635.252582-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211213162635.252582-1-maxime@cerno.tech>
References: <20211213162635.252582-1-maxime@cerno.tech>
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

Acked-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 12694e2201e7..c0d7e510694f 100644
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

