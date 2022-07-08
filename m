Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2CA56B640
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6061E113849;
	Fri,  8 Jul 2022 09:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D6911383D
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:58:05 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 61B583200980;
 Fri,  8 Jul 2022 05:58:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 08 Jul 2022 05:58:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274283; x=1657360683; bh=+P
 yIPoybEqLC59r7fvcsMe9K24LmSGntaJD2qUUmTz8=; b=DXKJUvj7K8tAzcZCDv
 tS/f8qRepd3+3ND6Ko2W4lSMuBAxQBFWSuGlp+5UfnpKSn+QcOyUcv4925DF5+D7
 l9MwEfkKGvhb+RlELCuPOnLSoIA+DZHeuFv/sH15f96C1b7A9G9rzS5PnMFlrZdI
 +GoJ+b+KNYGJxjHag9cYnVQ9cVFHKf7OitHAUyeZRMP2DC8xsiaf/4aulFDUQ+Rz
 GKpuzt5aP4vg7JsGdvkjBFAi8k5MmiFShYq0fjI7AvyVaqycO0oZCcDNby0Z9Lin
 MCvAB3T7JNUyqvFN2rMCRax3ICp09IZZS8CII3z+6r4qBSROEEmd2p13cjvjPy4x
 m6tA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274283; x=1657360683; bh=+PyIPoybEqLC5
 9r7fvcsMe9K24LmSGntaJD2qUUmTz8=; b=LTCZlNxAmGuLIYHQnkkb6txV+OfJ6
 9go0JJ+WhBojxB07tFiUFaw6rGaR47KzQTdUUE3f/h67a247Znj0RL303OOl1ZGv
 bgyQ4YpnqDZNlUvxge6qmsl96KSkVP9I1Ga+UVpSM1tXDyfm42K22TdYKAtYTXls
 o4maaS7M10jJB1hZbbbG7KVdMOHQpCMjV2BpTxgMLki9SmDurywDmyDpWmwnoD8V
 AVY/UWIK0wS1kDNkM6MAuIXYe/f7RghLBxy2e6MBEy6qYQD3FpMYcMf/nTLjFACE
 1V7+fl9zmjeb4KIHVGCTNxv8/soITsGTYPKp9GEhxEFgwoiko3uxugl5g==
X-ME-Sender: <xms:q__HYoJSl-yy8DzXmaNdH_dRxZ78pTn4HB3Iznm7rkRVDAUxI3GGAw>
 <xme:q__HYoIJXcTrhWDRlIIf5UUPLNz9E5UWS3d1myme_DOeSnXpEuf0OslBk3DE-hOl3
 KgokTY5ahTRJkaM2TA>
X-ME-Received: <xmr:q__HYoswYKmpg1Od-lggqLR3DcE6Me_xhyHq7dhJx3RJeherj06sdZq5LWydYmFaq_deJ_J2E5xkoNxiORcH201bLXn0CxlXXlO2IaE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:q__HYlb5mBguUDQgOkfMRlZsB76wcuixo77taef-lrEiJoxvCFOeiQ>
 <xmx:q__HYvYxsZRogZu4QZ-D7oGwh3dSK-alz1DJyPWZu327Q9tO-9v7ZA>
 <xmx:q__HYhDmA2ZuKPP9rRYdvVyVkEIvLI65v0H5JKlrhwXOnqJ6uV2jQg>
 <xmx:q__HYuWpRHHGykCI5WhJlv5ill-KZ1_i4evY1rtC2IAQxvBGsQDBVQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:58:03 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 18/69] drm/vc4: crtc: Remove manual plane removal on error
Date: Fri,  8 Jul 2022 11:56:16 +0200
Message-Id: <20220708095707.257937-19-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When vc4_crtc_bind() fails after vc4_crtc_init() has been called, we have
a loop undoing the plane creation and calling destroy on each plane
registered and matching the possible_crtcs mask.

However, this is redundant with what drm_mode_config_cleanup() is doing, so
let's remove it.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index d391e894ee6c..03a799ba9ee8 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1317,7 +1317,7 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 			       IRQF_SHARED,
 			       "vc4 crtc", vc4_crtc);
 	if (ret)
-		goto err_destroy_planes;
+		return ret;
 
 	platform_set_drvdata(pdev, vc4_crtc);
 
@@ -1325,15 +1325,6 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 				 &vc4_crtc->regset);
 
 	return 0;
-
-err_destroy_planes:
-	list_for_each_entry_safe(destroy_plane, temp,
-				 &drm->mode_config.plane_list, head) {
-		if (destroy_plane->possible_crtcs == drm_crtc_mask(crtc))
-		    destroy_plane->funcs->destroy(destroy_plane);
-	}
-
-	return ret;
 }
 
 static void vc4_crtc_unbind(struct device *dev, struct device *master,
-- 
2.36.1

