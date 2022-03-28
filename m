Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 729CB4E96E1
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 14:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC2EB10E449;
	Mon, 28 Mar 2022 12:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED0010E444
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 12:43:13 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 88CFA3201487;
 Mon, 28 Mar 2022 08:43:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 28 Mar 2022 08:43:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=abBOHQmlBW5lNdP4ljHN5qgPuAsONo
 Fyz7VZIyLOwEY=; b=p0O2BYoxgP4FUNxR6RkZ00ygDdfnmoJC3ca+1LAcIpmTr9
 7N56PAdp5ToEZT97+ZaEcAkxFEB1oqtQNT0Oz6D8/ovH+T4+nc8t/0o8+MIJxz4H
 Xv+/dd6lkoVbtTNlGyOpjOq9IYymlv/YBe+fD88huY3hHC3kXz65XfKl4i+n+0L8
 ohjLUuYdzNoDrxw94Ha8otUMf0ZAibqBbLunmJogauGHb4hjcKbXSrFaXqNm4ipI
 KlTSyvekXh4eMEapTOLEzWxhSPtQAzweuZHyhDVb6ro8FG6k6HNIHFfwTntVMapO
 7rvFR2NSwUG7qjgCPghTc5YNgyhV/V86PltDA6CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=abBOHQ
 mlBW5lNdP4ljHN5qgPuAsONoFyz7VZIyLOwEY=; b=ioLZY1ndG8lU4S43El2ocv
 0wkmGBLWx8EH7bI3m+MvJsJi5FD+AQpY06HIG+i5DN2nl50AYUanLaJ9G/41xPfZ
 qqG2FDzZefMTgFWwGkqJhlVg/8zIei0sOkJgM138zWrVipLKxe43fEXEHy/Z2oTE
 le8VfHfZ5jgLcQZHj8sFwweYxb9hoXBiZZC3iug+bTC1GOdUxtE67rEuvSNEyhCo
 ZuJnoOW/HDnwVJaTy1nLIhRONuE0m1kfSRmENj5Z6uMpPvBYmIVhHF1U11ZmFqqg
 mt667aEqB1W/llnVnd1Qzer9NdG2EnVnHm7IG/PHfb/1MyK+pE3lCfa/l4LAqpOQ
 ==
X-ME-Sender: <xms:X61BYoqsG9vyD1-iUzvDrbco-Moeuvw9wpqOj1ZxtFTGw97o1I8j5g>
 <xme:X61BYuqO-irzH71igsJ9jVGGGQh67aDgVvnWh6TRS_sx9wjVLSiovNqRZaGCfv_s1
 WWwmb1sEfzr_hhZ30U>
X-ME-Received: <xmr:X61BYtNtLQyf1uDoRfx76ybshmuOKLAt60mAaSiCjq9_3B_s63ulxas3ygI5u8P-8aLXnAFlWBjME9132QzPofESz4MOw8beJ-eMVC8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehjedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:YK1BYv7Aan3Y7W07aEecWHHIWfpK7PL-4VzWHPnOVV-D1YhLxQI-WQ>
 <xmx:YK1BYn4kRLo2yLPOq6cl4cvdrAP2JZ4pDVzqWy-NDomUWnCEJB_jHg>
 <xmx:YK1BYvhZ2_D3lg6p7GfptgDn-Gic2C6W3ESDY_a_oc06Q0vA8Uh90w>
 <xmx:YK1BYktIVXOjq29Jv2Khp2Yn9THw9Zgh-IpEz7SO7FN4sD4BhfzU_g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Mar 2022 08:43:11 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/4] drm/atomic: Print the state every non-blocking commit
Date: Mon, 28 Mar 2022 14:43:01 +0200
Message-Id: <20220328124304.2309418-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328124304.2309418-1-maxime@cerno.tech>
References: <20220328124304.2309418-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DRM_UT_STATE controls whether we're calling
drm_atomic_print_new_state() whenever a new state is committed. However,
that call is made in the drm_mode_atomic_ioctl(), whereas we have
multiple users of the drm_atomic_commit() function in the kernel
(framebuffer emulation, drm_atomic_helper_dirtyfb, etc.).

This leads to multiple states being committed but never actually
displayed even though we asked to have verbose atomic state debugging.

Let's move the call to drm_atomic_print_new_state() to
drm_atomic_commit() to make sure we don't miss any. Non-blocking commits
were never logged though, and it would create too much churn in the logs
to do so, so leave them out for now.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_atomic.c      | 4 ++++
 drivers/gpu/drm/drm_atomic_uapi.c | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 88cd992df356..637df126c2d9 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1423,8 +1423,12 @@ EXPORT_SYMBOL(drm_atomic_check_only);
 int drm_atomic_commit(struct drm_atomic_state *state)
 {
 	struct drm_mode_config *config = &state->dev->mode_config;
+	struct drm_printer p = drm_info_printer(state->dev->dev);
 	int ret;
 
+	if (drm_debug_enabled(DRM_UT_STATE))
+		drm_atomic_print_new_state(state, &p);
+
 	ret = drm_atomic_check_only(state);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 9781722519c3..45e6d3c62a9a 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1326,7 +1326,6 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	struct drm_out_fence_state *fence_state;
 	int ret = 0;
 	unsigned int i, j, num_fences;
-	struct drm_printer p = drm_info_printer(dev->dev);
 
 	/* disallow for drivers not supporting atomic: */
 	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
@@ -1458,9 +1457,6 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	} else if (arg->flags & DRM_MODE_ATOMIC_NONBLOCK) {
 		ret = drm_atomic_nonblocking_commit(state);
 	} else {
-		if (drm_debug_enabled(DRM_UT_STATE))
-			drm_atomic_print_new_state(state, &p);
-
 		ret = drm_atomic_commit(state);
 	}
 
-- 
2.35.1

