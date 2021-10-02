Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 547DD41FCD9
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 17:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E032B6F4B4;
	Sat,  2 Oct 2021 15:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CC26F4B0
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 15:46:03 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id d1so836684qvl.12
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 08:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cXCmTQVcRlhOzRrqQMTEyk3XlH7A4pvQkLIMcAdJ9A8=;
 b=StEZysN+dadV9HWL4sUcR9hsztIdc+4Dbz2OnIbhHVi/bCbph3w/MKfDWGOyZq2sE3
 mqiXxxaoxotykxzcdyifwwvki9SaFWM+Gj0//o3wEHa8T+nAJ9R96Vf92X1WxQ2VlM7a
 aQ4d6za0GrrCpP5P5yeFchVnUc6LrJZYG89a51B5z+48ReheMfVxu/eMjp7KQsU3x/qL
 btDRCldir7ES3lHvz9F97nF4Sub3gJNPTnLRmxXwYlP0TiRq4vNo13kVBq/uNAC9ZwvU
 ORlGFHd6qpiQrXx11BR6D4ZCCSbrc1/GYL+DEU2EVB4nOIO+//r3iKYKtDvl/keLl9Vk
 l0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cXCmTQVcRlhOzRrqQMTEyk3XlH7A4pvQkLIMcAdJ9A8=;
 b=lqeL7EVLm7cLp9HCRqOVYAcgRAcLY2I/ceZhVVQ0uC1gXQB3Bk4/fvuP9GPWkKR8XX
 hUj6kLSTjQIopdY/SH9VYaebbUY7EkSZSvTDdUB4YHFgG6yjgopTIEmO9/EQC1BoJ/gY
 nQG/gWH6+xt9fshuFFlYWGr35OKN9boKWAUoY3dXxYq3PTA1vuiJtAnaMonemtiLkgBH
 VTGT3Bz1IoO8g31X+xr6oLqU8wtekHdvPdn7MszN6LaGfCMzg11/AURqOUC70/LIA8d/
 /UN6JCek2gV71/5/xijNFoHtf8Szjb4jY1JAvniiC/wfVATh8OjdemAcGkV54qeZb4gp
 Jhxg==
X-Gm-Message-State: AOAM530hMWMIDs/bB5R36xgIPLMt/Xmf2nECqihS3NnJUOgAobTOWszf
 nafey9kH/V4J1onOuPlrrX4xyk+zF0yORQ==
X-Google-Smtp-Source: ABdhPJwOgYCaCyfZAV9Dg9YCSWbfGEN2QypPksS+v2dpgjgdhFcLtLMxzfeehRw3zgWe10WlX+lARA==
X-Received: by 2002:a05:6214:1269:: with SMTP id
 r9mr14511937qvv.35.1633189562258; 
 Sat, 02 Oct 2021 08:46:02 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id r10sm4861730qkk.95.2021.10.02.08.46.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 02 Oct 2021 08:46:02 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Fernando Ramos <greenfoo@u92.eu>
Subject: [PATCH 14/16] Revert "drm/msm: cleanup: drm_modeset_lock_all_ctx()
 --> DRM_MODESET_LOCK_ALL_BEGIN()"
Date: Sat,  2 Oct 2021 11:45:40 -0400
Message-Id: <20211002154542.15800-14-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211002154542.15800-1-sean@poorly.run>
References: <20211002154542.15800-1-sean@poorly.run>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

This reverts commit 4c048437ef7adb2d81fe4ddc5c04179126eefcf2.

This patchset breaks on intel platforms and was previously NACK'd by
Ville.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Fernando Ramos <greenfoo@u92.eu>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index abda52f09b09..cabe15190ec1 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -5,8 +5,6 @@
 
 #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
 
-#include <drm/drm_drv.h>
-
 #include "msm_disp_snapshot.h"
 
 static void msm_disp_state_dump_regs(u32 **reg, u32 aligned_len, void __iomem *base_addr)
@@ -101,18 +99,20 @@ static void msm_disp_capture_atomic_state(struct msm_disp_state *disp_state)
 {
 	struct drm_device *ddev;
 	struct drm_modeset_acquire_ctx ctx;
-	int ret;
 
 	disp_state->timestamp = ktime_get();
 
 	ddev = disp_state->drm_dev;
 
-	DRM_MODESET_LOCK_ALL_BEGIN(ddev, ctx, 0, ret);
+	drm_modeset_acquire_init(&ctx, 0);
+
+	while (drm_modeset_lock_all_ctx(ddev, &ctx) != 0)
+		drm_modeset_backoff(&ctx);
 
 	disp_state->atomic_state = drm_atomic_helper_duplicate_state(ddev,
 			&ctx);
-
-	DRM_MODESET_LOCK_ALL_END(ddev, ctx, ret);
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
 }
 
 void msm_disp_snapshot_capture_state(struct msm_disp_state *disp_state)
-- 
Sean Paul, Software Engineer, Google / Chromium OS

