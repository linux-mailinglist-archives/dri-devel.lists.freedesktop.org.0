Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 340274BD8D1
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 10:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FA910E59E;
	Mon, 21 Feb 2022 09:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C043E10E30C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 09:59:32 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1018158025C;
 Mon, 21 Feb 2022 04:59:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 21 Feb 2022 04:59:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=VPg+UnfrAzU5ntjvg2DJr90goy3Svo
 9ACwSAth3XrMs=; b=S09kgt4/eROIjTu5vAyveowY6F9/TRrCI4TnZtAW5emQg+
 9MQTpciIOVDjMqhj72CVnxhxGoDxfT3RQuyqyeETJgLIUVcpFJLyEmG4+lXL16R4
 hWIB7CgkqinByPWpC5JGCCSbH7xDiXUlYeYY8wZ6xAW7L7TnHdyCYEg1Bw6UsraZ
 /YZJRaSL0yjSxA6oSor8OlP+lj0RrgMatErEId5FRIFb+IGF3Tn4Q0+qoxpgdxc4
 m4f8TvxNouKv0Wz5M10FQjFJucR+RYFr7ToBgpCxE/SOE7CRfXRdwAG2cfvG0xLl
 6VJ1/FX86lY0usA4RZVesqOzYdIYAm+Vyei2A2Hg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=VPg+Un
 frAzU5ntjvg2DJr90goy3Svo9ACwSAth3XrMs=; b=ErXr6gQSk31SG1N8Hr0LQR
 Pfu5kN9/0CkgZp+xgwY3/+0O0g/7LVf1snCCy3D4yBbLBCHxOdAf1EZx9KUo0hO9
 xJDSfnd3ZvqSj0NAbZpV7EfFSCsqD00kFcVj2Ic/LLUODCHBKOVUO4KjP9ImCts/
 /5BXLc2tSEK+7BJQfpEzGqoNTqO2v1k692SmFK1cNDACWAIkQhVkSwafVcbcPAvQ
 ItGma5PYSbidQLwYkHNhOQ2iozpb7EzRXYNzIKQRkD5QkxCG+Om2rDmu7AQMpnX6
 6tIM3lr3E3fODf78RXRZof/KBPXC29syaZ3FYcA1l9f1vtpCNPQyGaL1/2Frw36w
 ==
X-ME-Sender: <xms:g2ITYtH9zmNSIAscNveP51kC1lAEuY8-cM7DK12_CPeRqkzipB-J8w>
 <xme:g2ITYiX0zfkfuZpUS9Sdw5z0LFQ4PqIRBC2DiIRDrJau3thezq_U_nhQHR1CjCMBK
 _jqxz_b4LAeI5TfvWs>
X-ME-Received: <xmr:g2ITYvKJhoV203vF0H-prUGft0m5QqmgW7uODRXradp35oXJcVZa919iqHeJDa0PT-QUtf56buktfE30wb-SpzxZ63sX3Tk4sZ6qcF0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:g2ITYjGUMwalWERLq6WnE7_v9_9yLAi1mkWqlBf76QJPN5ve71C1CQ>
 <xmx:g2ITYjXjiVL9IktXaj-SgW9TDWpis6uGwh1C8mOvP4qVVda1hFOL9g>
 <xmx:g2ITYuP3mfJCpf4KnLfjgVeUmdV33RPlN1eYTZxqPpNopCQv5LGBqQ>
 <xmx:hGITYjQjip2sEUGaSkp82HvIa05N-2arpsvIiTVB8KK6u6Z5oaJwuQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 04:59:31 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v2 04/22] drm/omap: plane: Fix zpos initial value mismatch
Date: Mon, 21 Feb 2022 10:59:00 +0100
Message-Id: <20220221095918.18763-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-1-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomba@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While the omap_plane_init() function calls
drm_plane_create_zpos_property() with an initial value of 0,
omap_plane_reset() will force it to another value depending on the plane
type.

Fix the discrepancy by setting the initial zpos value to the same value
in the drm_plane_create_zpos_property() call.

Reviewed-by: Tomi Valkeinen <tomba@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/omapdrm/omap_plane.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index b35205c4e979..e67baf9a942c 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -533,6 +533,7 @@ struct drm_plane *omap_plane_init(struct drm_device *dev,
 	unsigned int num_planes = dispc_get_num_ovls(priv->dispc);
 	struct drm_plane *plane;
 	struct omap_plane *omap_plane;
+	unsigned int zpos;
 	int ret;
 	u32 nformats;
 	const u32 *formats;
@@ -564,7 +565,16 @@ struct drm_plane *omap_plane_init(struct drm_device *dev,
 	drm_plane_helper_add(plane, &omap_plane_helper_funcs);
 
 	omap_plane_install_properties(plane, &plane->base);
-	drm_plane_create_zpos_property(plane, 0, 0, num_planes - 1);
+
+	/*
+	 * Set the zpos default depending on whether we are a primary or overlay
+	 * plane.
+	 */
+	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
+		zpos = 0;
+	else
+		zpos = omap_plane->id;
+	drm_plane_create_zpos_property(plane, zpos, 0, num_planes - 1);
 	drm_plane_create_alpha_property(plane);
 	drm_plane_create_blend_mode_property(plane, BIT(DRM_MODE_BLEND_PREMULTI) |
 					     BIT(DRM_MODE_BLEND_COVERAGE));
-- 
2.35.1

