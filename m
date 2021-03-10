Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66062334A0F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 22:48:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9085D6E16D;
	Wed, 10 Mar 2021 21:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8CE06E16D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 21:48:51 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id 18so14317216qty.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 13:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4M0snmyFx3hntMnqGoLjjCIdkC5MkJRcZ5aksVvCkcs=;
 b=A058PlQjS8f+i8KgiZvSCdvzp+QM7sPi1eemy7DArrEpjqqW1X/jOjfqIDfdbN8DTk
 YQ5+yx/C2ecIGPeAdNZntmf4uAaJTz9TbMlIBE/3ymyS5AMZMXRPKqqt0O8cDoDIV6NG
 T2xsBwgIYc3t9PIrJiZ5f9McK+bYNl0zs3Hhx8JkdU/xpsUdHqAfvGZdStUh+GOLTehp
 K4wi4VwavZxAJKsGpyeP0xrnGr/jpU5iZxreJDmLoYanGhWoAXG0YoiGUlSa5eeqbTqc
 QYxLajJs7U0c8ahKJ+yTRPoaVoDe7+MMpsMC1jMdHpBJNJeBWD22jfp48KmCBDR/B/rX
 rG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4M0snmyFx3hntMnqGoLjjCIdkC5MkJRcZ5aksVvCkcs=;
 b=e/npR6k9XaZd3xjJGDHVpOcEv+fffbBOIwWE5htF2HOu0SSliZ6E31eEp3KLVUZfEd
 Fb7E1HSBs1aiBpOcCOl/5zzRjGfRIHwk9eJYy7LsaRfbg9rnRUf2ixtPUYM2mpFplG6z
 1srPydGTdek5LQoUeevqZzKMoEGJCAKK2EK4BckjmGy67P7kpK/NXnyV3eP0Uj0a1ttW
 50nHRxEhB++s2wXml5RgDViDVIjguni73Ia9FHo6LTVU9NRJf09QO0RgS0yYeh/4euqv
 QEjdVdeOQQ0+Mth5sDStbb9g1wXMj/qpzZLlCWYSGufiJ+oEvvUyjH9n5gl56xMb8mit
 ssUA==
X-Gm-Message-State: AOAM5328hRnsPs2dLTmsZWYa/pX68VIvIah33fUtmZjbzzcl3f6YPBQT
 i/WLfZlqkzbL8FIkpx/ZcR6NSA==
X-Google-Smtp-Source: ABdhPJyHY89MsBP5lyi4K4qxKFlHW+zevtUyAzkwMzPyPaWqSKFasX65M7E8uIZXZyDYY7CWqrUKBA==
X-Received: by 2002:ac8:1413:: with SMTP id k19mr4627017qtj.379.1615412930888; 
 Wed, 10 Mar 2021 13:48:50 -0800 (PST)
Received: from localhost ([172.58.155.143])
 by smtp.gmail.com with ESMTPSA id s19sm456801qks.130.2021.03.10.13.48.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Mar 2021 13:48:50 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/dp_link_training: Add newlines to debug messages
Date: Wed, 10 Mar 2021 16:47:56 -0500
Message-Id: <20210310214845.29021-1-sean@poorly.run>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
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
Cc: Sean Paul <seanpaul@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

This patch adds some newlines which are missing from debug messages.
This will prevent logs from being stacked up in dmesg.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/i915/display/intel_dp_link_training.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 892d7db7d94f..ad02d493ec16 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -29,7 +29,7 @@ static void
 intel_dp_dump_link_status(const u8 link_status[DP_LINK_STATUS_SIZE])
 {
 
-	DRM_DEBUG_KMS("ln0_1:0x%x ln2_3:0x%x align:0x%x sink:0x%x adj_req0_1:0x%x adj_req2_3:0x%x",
+	DRM_DEBUG_KMS("ln0_1:0x%x ln2_3:0x%x align:0x%x sink:0x%x adj_req0_1:0x%x adj_req2_3:0x%x\n",
 		      link_status[0], link_status[1], link_status[2],
 		      link_status[3], link_status[4], link_status[5]);
 }
@@ -731,7 +731,7 @@ intel_dp_link_train_phy(struct intel_dp *intel_dp,
 
 out:
 	drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
-		    "[CONNECTOR:%d:%s] Link Training %s at link rate = %d, lane count = %d, at %s",
+		    "[CONNECTOR:%d:%s] Link Training %s at link rate = %d, lane count = %d, at %s\n",
 		    intel_connector->base.base.id,
 		    intel_connector->base.name,
 		    ret ? "passed" : "failed",
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
