Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E032546608
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 13:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8073210EB2C;
	Fri, 10 Jun 2022 11:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF02B10EC11
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 11:52:06 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 54B9F5C010A;
 Fri, 10 Jun 2022 07:52:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 10 Jun 2022 07:52:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654861926; x=1654948326; bh=dS
 +3Drwn6OfK9gmTDNZW9jVEw55oEkPMgtOSp3BUIL4=; b=hyvAmF7LsiDUOVQRVs
 eK8Meb/+g8+xsRHPR39soOfaTT9LhLVN/k8kU/1I9hQZuPOY5DD4vVH1DPtW1KSk
 WsqphJ4d8yhwY4CaFkz3BlXoCKsezFOZlD2ZjMbs4cJNx8it7FPhk75fSOahu0cs
 IF6l5boE+7xWOobPeW8ZQxF4FLXlsiH7RFzz9AyJT6ZgiFt9nQucQWxMy8kuMIiN
 U46YjwmKuZ6cN674V9Rsc/wm2jWy0ecR7fynHyQ8wWKUrIt0RfuITSdGQ7u7eshA
 RclkFAvgQpbK+ArdPSsgdG6drNHbqz/v0O2aCwCBbJ5jimMALMfbIPh3Sjkd5ic7
 ukGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654861926; x=1654948326; bh=dS+3Drwn6OfK9
 gmTDNZW9jVEw55oEkPMgtOSp3BUIL4=; b=QBcyT2QeA1mSnI0dqWBE1LQ7W6Cwh
 Xthkos8o1jyv7/+K2W6iCqv5j3ihFV0Uii5CnMDI/uax8Gl8E0d5+kCEXE4wgmGu
 Gicb0LvSad9Ljy55m3Nz3Z8cs6Q8vRg3hW/O9IyX9n0uiWakm8BDAo72y3fMw5vx
 E2BODOtsl8iomCSq/oD2qVsrx4VDzE3P+SvHi/pkIAOHqVGmCFoS64dcAsE6uNzs
 9NqCiG47Bb0fNQa5coiPYqx80ndBFGUt6cY8eQHy0tmvCr6vBp8/YXIkYpb5gWFc
 ptUJDu4aKnCdFN7zs6F+RWD0f6ICH7EGea+W1tIRafmvGWWJX1N6eDD9w==
X-ME-Sender: <xms:ZjCjYvkM_rLc1YfiZe5Dw9IRGGWjiF02OS-MUimnqH6lmDyoxgmPsw>
 <xme:ZjCjYi1YVaGye14En6XXhuMqlUWdVU2BgZA0ijcyZquGDmUOYLArPbsfESYNhiy23
 eg42PmN-SUEbph-gxU>
X-ME-Received: <xmr:ZjCjYlpRa6Xs3WaFYe0iz3p1NxlNdoU7TuXiWbIrHQmbnWhcHr3Iisykbc4tuOqmDkn1DzFZk6FPH1hwNbBN0XAT7Y7TczjwB3hFySA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ZjCjYnnroylS4nFHaWjq1lqfjVrQPZpbjf6SvnERTGKQJYW2_G5a5A>
 <xmx:ZjCjYt28KT65DElyiiozn8ZuanTVIsgWyR_Wbz9l9VxkHFTTIdCERQ>
 <xmx:ZjCjYmuUFjpZNV1yo0vcF1V61VwGC4wbxFCjCSix9ktpvXmtyWqASw>
 <xmx:ZjCjYl_TwRuaw1Z7U9IHSwwNnqUO2qTHjTH4NERmPxPCPy2JRYfI_w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 07:52:05 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 07/14] drm/vc4: plane: Register a different
 drm_plane_helper_funcs on BCM2711
Date: Fri, 10 Jun 2022 13:51:42 +0200
Message-Id: <20220610115149.964394-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610115149.964394-1-maxime@cerno.tech>
References: <20220610115149.964394-1-maxime@cerno.tech>
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
Cc: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On the BCM2711, our current definition of drm_plane_helper_funcs uses
the custom vc4_prepare_fb() and vc4_cleanup_fb().

Those functions rely on the buffer allocation path that was relying on
the GPU, and is no longer relevant.

Let's create another drm_plane_helper_funcs structure that we will
register on the BCM2711.

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index ba7359516d75..1e866dc00ac3 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1389,6 +1389,13 @@ static const struct drm_plane_helper_funcs vc4_plane_helper_funcs = {
 	.atomic_async_update = vc4_plane_atomic_async_update,
 };
 
+static const struct drm_plane_helper_funcs vc5_plane_helper_funcs = {
+	.atomic_check = vc4_plane_atomic_check,
+	.atomic_update = vc4_plane_atomic_update,
+	.atomic_async_check = vc4_plane_atomic_async_check,
+	.atomic_async_update = vc4_plane_atomic_async_update,
+};
+
 static bool vc4_format_mod_supported(struct drm_plane *plane,
 				     uint32_t format,
 				     uint64_t modifier)
@@ -1493,7 +1500,10 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 	if (ret)
 		return ERR_PTR(ret);
 
-	drm_plane_helper_add(plane, &vc4_plane_helper_funcs);
+	if (vc4->is_vc5)
+		drm_plane_helper_add(plane, &vc5_plane_helper_funcs);
+	else
+		drm_plane_helper_add(plane, &vc4_plane_helper_funcs);
 
 	drm_plane_create_alpha_property(plane);
 	drm_plane_create_rotation_property(plane, DRM_MODE_ROTATE_0,
-- 
2.36.1

