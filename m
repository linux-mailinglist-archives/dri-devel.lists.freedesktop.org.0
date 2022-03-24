Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB97B4E65A2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 15:47:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D708810E8C1;
	Thu, 24 Mar 2022 14:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7065210E8C1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 14:47:31 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7ED953201DE8;
 Thu, 24 Mar 2022 10:47:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 24 Mar 2022 10:47:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=HaLFbXBn7/ZQlyz3ejKx8AfD+xhVsz
 ETx1XsExSysQY=; b=uOTXplgMSvdAxE3gfjkXyALQcWVIBAnkVnnS6PpO9zVFFs
 Q/wMA2YEuJQYlWe4HiS01fZGGkfPdp1U48veKsiBY8OdfqjGYLcBIldBaR7TqXeK
 0J7NQluHYgjaSfynPdfLGWGTIh5YPi8Je8CmDLG26H0krpZGDMKNaE6Nh1WdgMXX
 y5NoLgw+MTIZKMeAvXG3QfHPoYFLj4kH4LAhTJYCVrrhs3t8KWqOdGBdoRI28YD1
 iQn86NlorxPd9Yw389zZ26OET/8bB7epP7mrWCQBeHo4eBfOfOFGNEwHSFe6giRo
 q4lHoVO8evAIE3t2c9s0UfYWwAHPXfGUTDY//Zrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=HaLFbX
 Bn7/ZQlyz3ejKx8AfD+xhVszETx1XsExSysQY=; b=RfVOhOZ0MD8ZCDLrVbfh+R
 NUmSMyCYiKf4i/b95hADqTc9+jSnZxSpTlIqB5YlAVCuHBo5U0pftWXToIClLy1G
 N/8uW36e6H94Gjy5bmZWoav/kuS+lNvyef/cVXh8FNDAf3IYCDzSeaEIFVgWs40T
 JilOVu5UBOtMg5HkqYas3NJesDzXuRmDcRiaYyS2VSPqEmRecDvubCnNDFSrRkNd
 dpA1JuO8NQP3o+60Q179byl8Ywvo3KMJUu/YiM8LBvVOXWD9oQRgvXJpsNqht0rx
 lsZz+0wzQfcbIunhl86hRHg5cSQTw1V41bL2weyc7Qugg0oLCV9LWNCibjGyfVNg
 ==
X-ME-Sender: <xms:gYQ8YgTAxEVf4iRoNOJZExZQ87Xi7hLU9wAwui2eixlyRL28NENIWA>
 <xme:gYQ8Ytx17zxobwSVrev5navHjhZYAD_qCfCp847GMMVNhMQi9xuKzAnnnutFOS2pK
 OxttWxbJkGzM8sG3_c>
X-ME-Received: <xmr:gYQ8Yt0uCXw6Ebz1BFWwEtbsnB_PGTNSm26paunJx179XqExJQKfZWuqM7vyv_pfgEJImnCH25DXwidVcywxGJ1otwFw2LLDlpCwO2c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegledgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:gYQ8YkDuoi7bQw3bpHDkr88zc08BRgEW2rjcwpD5dM-SXt9-rAoDnA>
 <xmx:gYQ8Ypi1sJw_9BAB9MYOfjCc68SKP2HrDjtloGesy_IbnJaovLVSMw>
 <xmx:gYQ8Ygp-ajOsLoFNFEeaK1BBCgkWwR-HEM2gWYg6rUNE33D2ENP4gw>
 <xmx:goQ8Ypf3L6TM0O8byMWfzDwMoiYjgyTiE-KtfzKfHZpWbnA9vpnnnw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Mar 2022 10:47:29 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/atomic: Print the state every commit
Date: Thu, 24 Mar 2022 15:47:21 +0100
Message-Id: <20220324144724.1306133-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220324144724.1306133-1-maxime@cerno.tech>
References: <20220324144724.1306133-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DRM_UT_STATE controls whether we're calling
drm_atomic_print_new_state() whenever a new state is committed. However,
that call is made in the drm_mode_atomic_ioctl(), whereas we have
multiple users of the drm_atomic_commit() function in the kernel
(framebuffer emulation, drm_atomic_helper_dirtyfb, etc.). Similarly,
it's only called for a blocking atomic commit.

This leads to multiple states being committed but never actually
displayed even though we asked to have verbose atomic state debugging.

Let's move the call to drm_atomic_print_new_state() to
drm_atomic_commit() and drm_atomic_nonblocking_commit() to make sure we
don't miss any.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_atomic.c      | 8 ++++++++
 drivers/gpu/drm/drm_atomic_uapi.c | 3 ---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 88cd992df356..ee2496ff3dcc 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1423,6 +1423,7 @@ EXPORT_SYMBOL(drm_atomic_check_only);
 int drm_atomic_commit(struct drm_atomic_state *state)
 {
 	struct drm_mode_config *config = &state->dev->mode_config;
+	struct drm_printer p = drm_info_printer(state->dev->dev);
 	int ret;
 
 	ret = drm_atomic_check_only(state);
@@ -1431,6 +1432,9 @@ int drm_atomic_commit(struct drm_atomic_state *state)
 
 	drm_dbg_atomic(state->dev, "committing %p\n", state);
 
+	if (drm_debug_enabled(DRM_UT_STATE))
+		drm_atomic_print_new_state(state, &p);
+
 	return config->funcs->atomic_commit(state->dev, state, false);
 }
 EXPORT_SYMBOL(drm_atomic_commit);
@@ -1452,6 +1456,7 @@ EXPORT_SYMBOL(drm_atomic_commit);
 int drm_atomic_nonblocking_commit(struct drm_atomic_state *state)
 {
 	struct drm_mode_config *config = &state->dev->mode_config;
+	struct drm_printer p = drm_info_printer(state->dev->dev);
 	int ret;
 
 	ret = drm_atomic_check_only(state);
@@ -1460,6 +1465,9 @@ int drm_atomic_nonblocking_commit(struct drm_atomic_state *state)
 
 	drm_dbg_atomic(state->dev, "committing %p nonblocking\n", state);
 
+	if (drm_debug_enabled(DRM_UT_STATE))
+		drm_atomic_print_new_state(state, &p);
+
 	return config->funcs->atomic_commit(state->dev, state, true);
 }
 EXPORT_SYMBOL(drm_atomic_nonblocking_commit);
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 9781722519c3..e9bb136c7a7c 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1458,9 +1458,6 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
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

