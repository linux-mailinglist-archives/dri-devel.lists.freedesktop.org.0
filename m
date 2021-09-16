Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0E240EC9D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 23:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A626E915;
	Thu, 16 Sep 2021 21:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F506E8FC;
 Thu, 16 Sep 2021 21:25:56 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 199272B011E5;
 Thu, 16 Sep 2021 17:16:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 16 Sep 2021 17:16:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=fnNE3/bpQJX1h
 pzoQSY26cMfUyUc1erwvXKd9/uTahY=; b=iUc/J+KqzYC/SOJ1n5Qm7Exfbz4e8
 rQNcaAdvb37kMX1+R8W+Ry3SuLhIXvRxwqUoMd93OjAkpLFFxrlg/6N0mDnROBVF
 EtlGUMu3JTgyidP1spB854VFSskpiZI+gVBi4AKn7qcn1zVyDHHpGKlzk/3hCpmX
 WHzfRyCxzVX8ywpP5FWXviF8lCbA7vrzl3YI3cZ9ACSQfknxzHugVLIv934ftwcz
 i80XDh9GlU9FqvUiY7Q9KVG0JApM6tXKmg3axJmSwaM1/LrIGZgJIbZIoHYMsbuY
 ptPHU+v1Fk0tF6FklbPWc3JsltaWJ5/gm5gGz3SQyapjLAMV3NK3Td8cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=fnNE3/bpQJX1hpzoQSY26cMfUyUc1erwvXKd9/uTahY=; b=qaZjebld
 CC4bFZrF8IIU/ploQNy+oGHZlHwai55D12mYP4YjZ2tsUMDwyWHTeYVIX4M60raF
 TMKKPs0YY/eFUWhGK7JdXmZXfpR3Rv5k69mjXjmDXpmawcDB24pOhEDsGQEQNwMM
 UaAj+uyH0fSgN7N6dN6cFVPwNpmIqzb7MwloYQyNaHP/R/zp7BL3jYtqVP/jx5HB
 MdChTSiVLpNI0Rhl0fI/9wftxdTdXbn6yxupIJUz1tQdDrNYo54sKW3uG+Rf8S7p
 UhtSFDAT65wh7LX0+DMOemIF8MbqOx6Ty0CkuD4KM9+78dl78q28upOeSXPVVXXG
 hyLEChyurmUjMw==
X-ME-Sender: <xms:HLRDYXZkcU_hbBgclkdE4qElC42xnxyshGsk1AycjBB_UQDTPqdTGw>
 <xme:HLRDYWbmR-zpzKgVvNrEiI0fMObvt2lfewBpnCRjHOXQX3TVF0KDwEIW0mTRpRufE
 xG-A6rvBUwW3_CXzA>
X-ME-Received: <xmr:HLRDYZ8VBQWTmKgMrLKeGVTUEP-C2IiWmJdD78RSpDCH8CIWdOD9MQQ2LptLPkLkon_V>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgedgudehfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:HLRDYdp6Dsq9Fy3JypCrfwH5H0laosX6MZdk3DtYeI_q5cCOzUL8-Q>
 <xmx:HLRDYSrvxZPOjVqunjFjNd7ZO_MLrRYjMdx3pD6LTJWqEiSnyg8nPw>
 <xmx:HLRDYTQtxSeCND0MCZ-CPg3t21bwC5BMfSjUX3LtFuTbGcU8-3gvYg>
 <xmx:HLRDYR0GgPJN1Opw9eYer407-fQWgA7iH_kOVaTtxzrXR3Atj_qXp2dygAo>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Sep 2021 17:16:09 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH 03/15] dmr/msm: cleanup: drm_modeset_lock_all_ctx() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Thu, 16 Sep 2021 23:15:40 +0200
Message-Id: <20210916211552.33490-4-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916211552.33490-1-greenfoo@u92.eu>
References: <20210916211552.33490-1-greenfoo@u92.eu>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As requested in Documentation/gpu/todo.rst, replace the boilerplate code
surrounding drm_modeset_lock_all_ctx() with DRM_MODESET_LOCK_ALL_BEGIN()
and DRM_MODESET_LOCK_ALL_END()

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index cabe15190ec1..c83db90b0e02 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -99,20 +99,18 @@ static void msm_disp_capture_atomic_state(struct msm_disp_state *disp_state)
 {
 	struct drm_device *ddev;
 	struct drm_modeset_acquire_ctx ctx;
+	int ret;
 
 	disp_state->timestamp = ktime_get();
 
 	ddev = disp_state->drm_dev;
 
-	drm_modeset_acquire_init(&ctx, 0);
-
-	while (drm_modeset_lock_all_ctx(ddev, &ctx) != 0)
-		drm_modeset_backoff(&ctx);
+	DRM_MODESET_LOCK_ALL_BEGIN(ddev, ctx, 0, ret);
 
 	disp_state->atomic_state = drm_atomic_helper_duplicate_state(ddev,
 			&ctx);
-	drm_modeset_drop_locks(&ctx);
-	drm_modeset_acquire_fini(&ctx);
+
+	DRM_MODESET_LOCK_ALL_END(ddev, ctx, ret);
 }
 
 void msm_disp_snapshot_capture_state(struct msm_disp_state *disp_state)
-- 
2.33.0

