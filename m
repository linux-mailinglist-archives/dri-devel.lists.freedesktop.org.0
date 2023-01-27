Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E84567EA13
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 16:57:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6629110E9A9;
	Fri, 27 Jan 2023 15:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A8C10E9A9
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 15:57:17 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 14B9932003F4;
 Fri, 27 Jan 2023 10:57:13 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 27 Jan 2023 10:57:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1674835033; x=1674921433; bh=Vru4j38/9r9bgK5RCBuagZtke
 7V2rI9gDpUr33w498Y=; b=slmBIcBoBKvOZUSClIvdQX16iWPSdKwUv1VvAZWIK
 uVoYvmubvpjutn2qQdeNFDwaVjZNyKT/Xz0WEYJqMpuH+PY75G0F04QK7fI31xiU
 9uYbC+4cdV9fL+XUgYHDICmblq/ddjTHmsg/HBrtN5puAIdwk9U74P9Aitzb4MNa
 Al77zVw4Cp2KwD2Q6a/bjXICwKjSARgEkpqDMG9OJaOiNsZxNvRqMBWUfzXshmip
 Je40S6MaR/3w2+NJQixHbJH2XLeO2N9XO2L8MFRSp/Ba52moYLLbRf5K5WH8iX5l
 SG7cd2wbcE6XOdV7oWh5embQsj8Vyza9IWLVBWnZlDqpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1674835033; x=1674921433; bh=Vru4j38/9r9bgK5RCBuagZtke7V2rI9gDpU
 r33w498Y=; b=g5Q+fABAjVs1u7cL4r6eDYRX6u76fQ0u1EFWj2vIpIJZf+Hp5+f
 w8EdJMWD133XBgjiRROGafgmU171bpC09+Xye/wLMgIXrFM2SbDH2p8ysdqI1yVD
 HRsViE1rnysm5SZ9OMHXdGJpfEd0vsG98bqsxmyO4SECyAhB32oHowziB4n3Db1n
 UlnyXS6hPNfDOjfGgdk4d9vLIsk/zFhl5cmfJJDEpGFbacC+nyTyX9vQgrx67nGF
 53mFmOfgOgg3ARFLj7zKikzAeE06NmgJ2y3hu8qonhK27623Z4nbhjCUEtV2lOco
 O6gAMwcOkIhy09zqJCUtg9xsWWZiM+BInRQ==
X-ME-Sender: <xms:WfTTY__8EuL4FPm8D5hc628ZSmCcZculhdLDKKx_EVU3adzMJhUyiA>
 <xme:WfTTY7vubPYy-smJw3LNWq5gs9GJChCF2rxgyCVh7-8ykTMDBzZNpIwoBiFVz5X0g
 1b0jk6NvtK4DNokR24>
X-ME-Received: <xmr:WfTTY9D_oQDTcf-E7uvq80ILTB8ni4qu3i154D30AhwjQsEkd3phfsDxTa7hsvi1aKfCHc9RuqqnpcwFgZZu4be-61YqxKCamoIGBTXo5zH2OA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddviedgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeektedujeeijeefhfejuedtudegtdejffffvdettdeigeekffeileelgeevgfdv
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:WfTTY7c3ckl3pymrwZ72sjSpWgyXvzyhPPBbEY7kZkEB1yA_ExC6sg>
 <xmx:WfTTY0Pnpy67BUOfMjts1BlVvo_iofKyxEO5msoxizK8kI8tEhS03g>
 <xmx:WfTTY9lF7oNCPx7dlHbfwlaU6_ivlCwoHQxjYkyfcwmUEZ4pnr9hAA>
 <xmx:WfTTYwlWIfn4tgY4G82XXQwcgeA6BwTeHDFOhoOEdDRQUKTTXoVsMg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Jan 2023 10:57:12 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm/vc4: Fix YUV plane handling when planes are in different
 buffers
Date: Fri, 27 Jan 2023 16:57:08 +0100
Message-Id: <20230127155708.454704-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.39.1
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

YUV images can either be presented as one allocation with offsets
for the different planes, or multiple allocations with 0 offsets.

The driver only ever calls drm_fb_[dma|cma]_get_gem_obj with plane
index 0, therefore any application using the second approach was
incorrectly rendered.

Correctly determine the address for each plane, removing the
assumption that the base address is the same for each.

Fixes: fc04023fafec ("drm/vc4: Add support for YUV planes.")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index dee525bacd4b..97c84a3f5a46 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -438,7 +438,7 @@ static int vc4_plane_setup_clipping_and_scaling(struct drm_plane_state *state)
 {
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
 	struct drm_framebuffer *fb = state->fb;
-	struct drm_gem_dma_object *bo = drm_fb_dma_get_gem_obj(fb, 0);
+	struct drm_gem_dma_object *bo;
 	int num_planes = fb->format->num_planes;
 	struct drm_crtc_state *crtc_state;
 	u32 h_subsample = fb->format->hsub;
@@ -457,8 +457,10 @@ static int vc4_plane_setup_clipping_and_scaling(struct drm_plane_state *state)
 	if (ret)
 		return ret;
 
-	for (i = 0; i < num_planes; i++)
+	for (i = 0; i < num_planes; i++) {
+		bo = drm_fb_dma_get_gem_obj(fb, i);
 		vc4_state->offsets[i] = bo->dma_addr + fb->offsets[i];
+	}
 
 	/*
 	 * We don't support subpixel source positioning for scaling,
-- 
2.39.1

