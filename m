Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C5E4A8750
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 16:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F0A10F009;
	Thu,  3 Feb 2022 15:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BCE10F009
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 15:11:56 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 1BE325C0193;
 Thu,  3 Feb 2022 10:11:56 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 03 Feb 2022 10:11:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; bh=zcKJOXBg0tVDZgeznAWrzxSSQhK2sobqGlJjS6yhY8Y=; b=Voc40
 zwGzP8Xa5l9engM280jeL1VNNG5lFOJ7pUZCpj+Gu8tVaTkPqY6e+DIWb6+Z6b/I
 XrblF2c7+aXclb8MVLL7V3Z4x80N7kE4wy7X0jJBQYFu5KkqXmI/AwQbx13vubgp
 kAouIbh37I4gv25CRPY21+i6zju5Tb7h2lCashRpZ6cfZs0w4rpqVFL3C4fyIC8S
 lSFIBdsAsF4L1jop+NKaD6eB7VCSFJKaak3se4cmcICegbxq2NlMc4Kz2XMbL+7P
 IfUtACVAl/+HibDWDymqKy7VRGGot+tzBNaXMzHv6r65HJ979nrUYJsB9o49cJiL
 Wgl77+Fu723cD32Dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=zcKJOXBg0tVDZgeznAWrzxSSQhK2s
 obqGlJjS6yhY8Y=; b=ZPojijDoRPMi64AsLvSTYKoyjY7deTuVdMdnFEbiSo5A+
 dRioyen383cVfKxjVRSRJDsuB0x7KhI5dIgcNpC8VbQr3tpEtaQV+iHsvGTXYloC
 WpgbVtCQA/oN6j8LyWpGS0UoR20PjPeqz4qDDOLGO834CZeCR45soA3OUS2m0Ynx
 JHbujl36ZGZv0WixUYP8nkKFRbkC1E4KbmSaSUdtgxDxiutaCMhvLkUgoavI58EO
 vxqptC6vz5G++MWwzR2E19YQc5Vei4BuoV5CxPd1FErghcNJsfVXkkvgpNVA/8B2
 82njXQerDiiJj80pJ31OdEDb6cBgd4wm/WqiDNZQw==
X-ME-Sender: <xms:uvD7YUSsUgJ1ZE9UQV3ttHqZCZ7lAaeAjJiEwYomJkAbW4qggPk2WQ>
 <xme:uvD7YRyNnlLGbPTsPs2E2rN7gbv1xVlmV9sGHJZXC9qwgZNJkmBFIulV1qGW7khuZ
 joQazs-sFZMLNCihJ4>
X-ME-Received: <xmr:uvD7YR2VefV4a_-ljvw7aNlJUM1GEcDp-34ox_prA8iUdcoNXrgKAoZnJHMUaCd3n-P4magcYG5z6s1i3CHhSaOR7yNDMyVEDyRd_so>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeejgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigih
 hmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:uvD7YYD3W6JehKbM3JMj7C7eZPOCH4C2FXhYBLRykdswwqk_7hgMAw>
 <xmx:uvD7YdglyScljqxDZBu1R8O9XW_4vKKRUtipJsVxkDGSc7ZoqD1d-g>
 <xmx:uvD7YUrJq1wrdj7cyVhBlJjkU8ZMCUdcSprx_nNO2t3eeFaQ3gL7Kg>
 <xmx:vPD7YbbQSeqJVQCb46hZHSdB_ToIZGJDdJOxji9P5Pmc8_vvum0GmA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Feb 2022 10:11:54 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vc4: crtc: Fix redundant variable assignment
Date: Thu,  3 Feb 2022 16:11:51 +0100
Message-Id: <20220203151151.1270461-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
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
Cc: kernel test robot <yujie.liu@intel.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The variable is assigned twice to the same value. Let's drop one.

Reported-by: kernel test robot <yujie.liu@intel.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 287dbc89ad64..e6cc47470e03 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -671,7 +671,6 @@ static int vc4_crtc_atomic_check(struct drm_crtc *crtc,
 		const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 		struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
 
-		mode = &crtc_state->adjusted_mode;
 		if (vc4_encoder->type == VC4_ENCODER_TYPE_HDMI0) {
 			vc4_state->hvs_load = max(mode->clock * mode->hdisplay / mode->htotal + 1000,
 						  mode->clock * 9 / 10) * 1000;
-- 
2.34.1

