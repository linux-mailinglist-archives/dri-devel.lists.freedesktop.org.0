Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B620755FFFD
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648BC14A60D;
	Wed, 29 Jun 2022 12:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB2714A5FB
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:36:10 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 398A43200959;
 Wed, 29 Jun 2022 08:36:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 29 Jun 2022 08:36:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506168; x=1656592568; bh=eS
 KXCkF4yBc3ncJQcipMYtTvBbGuSTQyVcpyk239L8g=; b=ZHkKPBQwrZ6qg+xXUP
 eTZFV+hmNdNFojrVL1GG0TCJs5+YwM8BCsvtarLj+Xnfb2Lf4MM00lxDcJslP2Rq
 fqup0j2hSmgcJYZgvlSdA5sW0lGSm11Ath9gFuGRF/2+l+3CegdbhBGk0lNLAlcR
 IPpx/Yw9Ydbsr93kh4/rcPOgesEPtrHjH/cQ0TYUXQYoU0rhjVlDiIutb74PMwCy
 nUJVQXjifSazrqkrupbg1f1qIHf//boUOrmTedHxEepGlge8vtoA1hdysNHnz2nY
 vZDgJZLcryo592si+9E030c8bqsvf5upR2UZG6Q+Nc6EbW7FRdBkhKQC55Hg0HGG
 JBRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506168; x=1656592568; bh=eSKXCkF4yBc3n
 cJQcipMYtTvBbGuSTQyVcpyk239L8g=; b=ijHHoAL/bUp8DtNGBsdQFhR4co2z+
 YV+5RYo03gb5tUCDtwm0LSCZ8rDTmF1ByyRUJrsQctTqSRX8fKt2U9eiacpUUm0d
 NbYvw1JVvGdVfI5Xgi+4uAMePwEIoPz7HI76H5mKN8i/hWcCcorY0KDP624p+qUn
 D37dojxhmYZVj1/uh8t6c5oj4tVCP84G/Ha/pqRCcitNttnudXwHYSqqMRCDz6Gk
 nrhU4HH7gE2CQvRF4g/1amvVKLaTcjcWBJ1sptohfcgs2H71j6jSpFPthSVzqcFS
 Efct8PdKA4vQz4x4WTlYQAzosw6qW0jwrIChpWnPCTYDVfOdR0aPZvkAQ==
X-ME-Sender: <xms:OEe8YoWfswIFA1_dWL2eICbtHU8KmhTwBa2J7_cbzOvbu6vbMoF5ig>
 <xme:OEe8YsmFXjTuqRqL2t5sRhDJzveBRck3700obdpf_eSfXhaopYyNHNgK1P4BidzG4
 qU_2EqRnwOnpCA1POQ>
X-ME-Received: <xmr:OEe8YsbkHdPvA-kjfELpZXGDRWOLKcVTb08uEc98oZ2DwLZCZ2q93gq7tCpnixwqIm-7fUYD0jyET9jpdZrrsgb5r3nnwwxau2mE0eA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:OEe8YnW4r56k-8m5MBGDVb0bPJTyr3BPmVG1R8k0Ik4r9bCYjfoXMg>
 <xmx:OEe8Yilsqi4CocuwrVZbz2LImgVfdv6x5WkKJGDG47ociHfq25rAYQ>
 <xmx:OEe8Ysd_b8AFKN9K6m1zgdobT-lrGCJCIGaxXXQk9Ho7xQw8p0-Q5Q>
 <xmx:OEe8YjAZ7OXKTqlPGPNPTr_DzwDGyT7Ic6uWIDDHCNOqr8m3nvng_w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:36:08 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 18/71] drm/vc4: crtc: Remove manual plane removal on error
Date: Wed, 29 Jun 2022 14:34:17 +0200
Message-Id: <20220629123510.1915022-19-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
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

