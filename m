Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 503F0517480
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:37:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08AA510F0C5;
	Mon,  2 May 2022 16:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706B810F0BB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 16:37:43 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id i5so20218765wrc.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 09:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RsppMnZlvpz/PS1/TtGolLScNmUL2porbiCTAL7nvFU=;
 b=a8nOHOjENFk8Xqwt3xRBWqsEDbDkcxAnWu2DgN6ZDlTrGJ1q3k5MN1DjOQ2zViSQg4
 /pvQDUerSXJhjlxEWeERMaolbCrzCoqr56pyfb2TEL7vg+B7hOdMEIVTyYgxNOqqRQiV
 muLLlNRxADbcJZC0Xo7s+vNAzrLICHoUlxYFy64xxzxl8U7CmD+wchoGiqZyArMJGYyf
 m6y8dFfXLwy6xUJ3j6HJ9GsJN24zFxv3tC2YmECdIRGZlHnwRRNeMCFzeycRNMjZc5Rd
 FWhd8+2d5xbZspsYRjuRbwCa1ZanS8BMkagr654IsvWoWehrdkQCdAGIrfrQ0XnLSjlb
 NjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RsppMnZlvpz/PS1/TtGolLScNmUL2porbiCTAL7nvFU=;
 b=SZzP/AZBmMiISwRz1EcvtJPSA1ZUIVkXEGyrbexgVa/UiQUJAfNvT7jA3XRBMebNW/
 lExJLTdLDi5AVry0iHdF2UVCouvW262z2M7zMWE4OAORpBLBVUMkmvStfB55oreL/zJQ
 qi6AcLwJ4ed4gW4BwrRHysMiZtn40LTrM0V2Fex9uxOI7ne8diAvg03Y9Di/Wr6MM58D
 gET1jEN+7w3coLrt6qWTFEMyFqDDYagdRx9L4/7/MCdK8im33GGzE5SOnrlE0BI1WNop
 cMnvnNHYkZjZ8gi7QoDeqwTEDNVgnBMKQDDLHpTXGGv1mry20IgkB7lGcqaUyR1DkbDa
 pxHw==
X-Gm-Message-State: AOAM532QdTURXcl7RqIdYr1znxIrs0TppNGVpWN+ax/bj4h4Zl137RoZ
 ZnOM2lAEW9czh2yRGxci+xw=
X-Google-Smtp-Source: ABdhPJyTPKUM05Y+tnsze0dzaZtqnYwBQZsZfdgYGdtgR2xVTDvcPZhlwnNrXn5ccgWpn6iPCc00wA==
X-Received: by 2002:a5d:5228:0:b0:20a:d7e9:7ed8 with SMTP id
 i8-20020a5d5228000000b0020ad7e97ed8mr9472997wra.687.1651509462037; 
 Mon, 02 May 2022 09:37:42 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 p14-20020adfaa0e000000b0020c5253d8f6sm7294694wrd.66.2022.05.02.09.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 09:37:41 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, jason@jlekstrand.net, daniels@collabora.com,
 skhawaja@google.com, maad.aldabagh@amd.com, sergemetral@google.com,
 sumit.semwal@linaro.org, gustavo@padovan.org, Felix.Kuehling@amd.com,
 alexander.deucher@amd.com, tzimmermann@suse.de,
 tvrtko.ursulin@linux.intel.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 10/15] drm: add user fence support for atomic out fences
Date: Mon,  2 May 2022 18:37:17 +0200
Message-Id: <20220502163722.3957-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502163722.3957-1-christian.koenig@amd.com>
References: <20220502163722.3957-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new driver flag indicating support for user fences.

This flag is then used when creating out fences for atomic mode setting,
indicating that the mode set might depend on an user fence.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 8 ++++++++
 include/drm/drm_drv.h             | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 434f3d4cb8a2..e2112c10569b 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1111,6 +1111,7 @@ static int prepare_signaling(struct drm_device *dev,
 				  struct drm_out_fence_state **fence_state,
 				  unsigned int *num_fences)
 {
+	bool use_user_fence = drm_core_check_feature(dev, DRIVER_USER_FENCE);
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *crtc_state;
 	struct drm_connector *conn;
@@ -1120,6 +1121,7 @@ static int prepare_signaling(struct drm_device *dev,
 	if (arg->flags & DRM_MODE_ATOMIC_TEST_ONLY)
 		return 0;
 
+
 	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
 		s32 __user *fence_ptr;
 
@@ -1168,6 +1170,9 @@ static int prepare_signaling(struct drm_device *dev,
 			if (!fence)
 				return -ENOMEM;
 
+			if (use_user_fence)
+				set_bit(DMA_FENCE_FLAG_USER, &fence->flags);
+
 			ret = setup_out_fence(&f[(*num_fences)++], fence);
 			if (ret) {
 				dma_fence_put(fence);
@@ -1208,6 +1213,9 @@ static int prepare_signaling(struct drm_device *dev,
 		if (!fence)
 			return -ENOMEM;
 
+		if (use_user_fence)
+			set_bit(DMA_FENCE_FLAG_USER, &fence->flags);
+
 		ret = setup_out_fence(&f[(*num_fences)++], fence);
 		if (ret) {
 			dma_fence_put(fence);
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index f6159acb8856..b2b8ea8d4a9e 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -94,6 +94,13 @@ enum drm_driver_feature {
 	 * synchronization of command submission.
 	 */
 	DRIVER_SYNCOBJ_TIMELINE         = BIT(6),
+	/**
+	 * @DRIVER_USER_FENCE:
+	 *
+	 * Drivers supports user fences and waiting for the before command
+	 * submission.
+	 */
+	DRIVER_USER_FENCE		= BIT(7),
 
 	/* IMPORTANT: Below are all the legacy flags, add new ones above. */
 
-- 
2.25.1

