Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09407454419
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 10:45:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 937EE6E9C0;
	Wed, 17 Nov 2021 09:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D32A6EA01
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 09:45:37 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id B997F58082D;
 Wed, 17 Nov 2021 04:45:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 17 Nov 2021 04:45:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=4KqHumH46V3y9
 Ldx/fQJNDCqznvX4/6f7a4KOTZ/dzQ=; b=nFITl2YMM3pezMjuXpVNxW+EZHTVq
 UMLUnncaCp00qk74maX9PfOhzCKvRwC96RiBm3VlIZ+dCyzbbsEYPpbIa9s4svNP
 YeIxTShcrPWiZd8Y9zTz7dQTp5zSz+CK9IGhaLDvy1H9qglRmDmXzuyFbCQr4U1o
 qFUR8er3NBnsflAUdRPqmvxGQuIhPrIq8UUPxFC5yr1b/0EjDktg6qCIsnso0xnE
 pZFM+3zHD+1aHdoyBbXljjpJQFyVSxYInYCJ1b+FSlGXg2YWA5UEku7F3fXLRUNk
 0wsUrJvryIEaS3uoc5ypiDUv8XAcBtkqEFJXc8MVFqbrul+yiF4BN2Dkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=4KqHumH46V3y9Ldx/fQJNDCqznvX4/6f7a4KOTZ/dzQ=; b=mMSDRtcj
 pCFQUZKeUi+jvMIEGVQwZWMeLs2V4a94vxXMejCvmwOGZJ/qyKKioRtN4XjPVRNN
 kvCoqbuXmrcZAsdcAjqXzA0gpWCXz5VrB+7PNPf18Cet3Lf6voz8kZtTdAiOA6qv
 kXyfQPYQ4shPFOMiLkOdNzlreZ6BC28u1oRis3tPBeKExfXsRSyhJhqSH85UWnLk
 dBYieDT5yPp27/tUZq3ZKUGiDbiDTIEcraT+O8AztuLDEIKQdNS8/ibRj58aWHxK
 +IyqxBJ4VNPa4HrM1yql96caRTit2u3z4eeyPbPZ9EZJhQCkdysFTevsOpNjw7+U
 zJ1+u1DrIBnlqw==
X-ME-Sender: <xms:QM-UYa-y9nE-9eCfz1qpGPOoOoVvha702GIUx4H4RPJBaSya-iaR7w>
 <xme:QM-UYatq3e2hxoaEF2avgfAkmW8rsmil5u52EVZyy-cSDO_e461C76auRX2gPS2CF
 tJ6LoigJatfr0mxZjs>
X-ME-Received: <xmr:QM-UYQBlIMxK3fDoYnbk8aA1y05aBZovvVi68mtWOvKGzPvogXD6p2FhtJB--1XI00OKC9VK8PEt1xp28sOlpmGheWSD6uyF11gOQzjmNO4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeggddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:QM-UYSdtbGWe4VMHVwS80izHNGaLpOaNzRltoEJu9FGIJG3SidmHkA>
 <xmx:QM-UYfNHc0euZvDUKyecz4B9zy0V7pFG6fmjDpYYD8J7dlGgif4BdA>
 <xmx:QM-UYcmQpI36D2Sy8R8Q_xc90rjRHqDc2vbEZe9IWfBJwIaKamJaJA>
 <xmx:QM-UYaolI8z2L0my-DMmo8QyxNWoq341Eh_PyLgDgqU2lQHg61jCFQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Nov 2021 04:45:36 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 2/6] drm/vc4: kms: Fix return code check
Date: Wed, 17 Nov 2021 10:45:23 +0100
Message-Id: <20211117094527.146275-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211117094527.146275-1-maxime@cerno.tech>
References: <20211117094527.146275-1-maxime@cerno.tech>
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
 Jian-Hong Pan <jhp@endlessos.org>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HVS global state functions return an error pointer, but in most
cases we check if it's NULL, possibly resulting in an invalid pointer
dereference.

Fixes: 9ec03d7f1ed3 ("drm/vc4: kms: Wait on previous FIFO users before a commit")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 764ddb41a4ce..3f780c195749 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -354,7 +354,7 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 	}
 
 	old_hvs_state = vc4_hvs_get_old_global_state(state);
-	if (!old_hvs_state)
+	if (IS_ERR(old_hvs_state))
 		return;
 
 	for_each_old_crtc_in_state(state, crtc, old_crtc_state, i) {
@@ -410,8 +410,8 @@ static int vc4_atomic_commit_setup(struct drm_atomic_state *state)
 	unsigned int i;
 
 	hvs_state = vc4_hvs_get_new_global_state(state);
-	if (!hvs_state)
-		return -EINVAL;
+	if (WARN_ON(IS_ERR(hvs_state)))
+		return PTR_ERR(hvs_state);
 
 	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
 		struct vc4_crtc_state *vc4_crtc_state =
@@ -762,8 +762,8 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
 	unsigned int i;
 
 	hvs_new_state = vc4_hvs_get_global_state(state);
-	if (!hvs_new_state)
-		return -EINVAL;
+	if (IS_ERR(hvs_new_state))
+		return PTR_ERR(hvs_new_state);
 
 	for (i = 0; i < ARRAY_SIZE(hvs_new_state->fifo_state); i++)
 		if (!hvs_new_state->fifo_state[i].in_use)
-- 
2.33.1

