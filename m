Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B66A554D28
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC25112B5A;
	Wed, 22 Jun 2022 14:33:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7133112BE2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:33:08 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id A65FD3200979;
 Wed, 22 Jun 2022 10:33:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 22 Jun 2022 10:33:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908387; x=1655994787; bh=G8
 q/gr8xs9MvIhTpl1lpBwFcEmdtosmowCRF4Vs9SAs=; b=CSeqviK0IXKyC9izl5
 lEi7oSXVyw0/MATXrY4npiw5wvOPw1pJzCMAYixzs7Vkilgoa1dJ2d6wAA52sn1Y
 FGluiegCjV4LwmDViMO22uFYl1QBhxSg7DROCS2m6fg7dA5cD0C5HGY/UFFRGpoi
 oF65GoZeisLEGFcZ5VEED0u64SrWTCfkmVavuBxSIY3woWW7RDMVl4N0S7F4+OFR
 6ZJ2D3fE9s9avXB0/0sQTpZ3bwQ1w0UG5909wySVGDEisP+va0E7jYal/+oRSlb0
 5gGGgvtM9Owv5SIiTJKFnADi20kqbR8C0uZ2iEiMa9BeQDUstUQi40lLv+kjXAic
 /v+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908387; x=1655994787; bh=G8q/gr8xs9MvI
 hTpl1lpBwFcEmdtosmowCRF4Vs9SAs=; b=qdNKswz+KTYewoAIm68aRXLEbzUsb
 Z2jsu+UvNb+JXNNapifQEuP7JB/kSuS44e4s2Imucm4Le7Vx+3mAv+RkmkXpm/ZL
 ec/6cPAzZZBCvlfM2PF+U4rEbDqiP8N4TqBkg/32PCnomjPHKkOpZuuoCyLrqTg6
 Z9rsL8h7v+ZKhUN8paUYTKP1e7qrHc+07qPx0V4fNW5teN06I8HEb5RHhG2TgF8l
 s5n9OdVsinUWSsQwOxMetxie/gQ8b/UgamYgTmeydM0CZo8yBXm9LkBsPknhifXe
 VvCFBQS4EKb99gS4lRbRzeaHEw1gGHY//tkNNxnZYhyfc5fTW10GRCaHQ==
X-ME-Sender: <xms:IyizYpXLV3jh6U3CAL-1tmCPEjuZ3U3RRtDx3FQw069Lg22WMZn9bQ>
 <xme:IyizYpmom0nsnJ0YUesOQcbQ5rofKczciIvPb-79OBoC8_dA33hQ_Ogzc4PULy60D
 4pfnxgYYWhVNc5VYow>
X-ME-Received: <xmr:IyizYlaXLEOAffXHPrcZlSIIbV_fi7JliE3NiQAwOiExBHQolVb754DWzqMTOFS8sYm11ixc4hiCH5IiN1snQRALcZqLwWJRPz7_vso>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:IyizYsUfHwbUoBU6IVzoskstZcEj2JPcIv8blH2pQBbkC_B4XXDy8Q>
 <xmx:IyizYjlJq-2YbQZSOD4i5-VIVbUBU4u_PrXtBGksbnUUyLpjhmBWBQ>
 <xmx:IyizYpf_KYUf1L5LoZJRV1CIzF2Tw7FNYu2d5qCqu2JYaoD7oHXH9g>
 <xmx:IyizYsBGUdkcSCC_liclUAPwXN-3zLHfNW1DO624kyh23Wr0DuWHhA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:33:06 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 17/68] drm/vc4: crtc: Remove manual plane removal on error
Date: Wed, 22 Jun 2022 16:31:18 +0200
Message-Id: <20220622143209.600298-18-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 32c0dd6a7348..e559fdb217a5 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1312,7 +1312,7 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 			       IRQF_SHARED,
 			       "vc4 crtc", vc4_crtc);
 	if (ret)
-		goto err_destroy_planes;
+		return ret;
 
 	platform_set_drvdata(pdev, vc4_crtc);
 
@@ -1320,15 +1320,6 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
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

