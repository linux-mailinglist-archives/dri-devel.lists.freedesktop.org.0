Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B0A41FCDB
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 17:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875BC6F4B9;
	Sat,  2 Oct 2021 15:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142716F4B5
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 15:46:06 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id x8so7474913qvp.1
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 08:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w1vz8fSO77bQeX6N4IZds+BsV7GNUQEtmOFqElpsOpQ=;
 b=YW7EpHqLqB7sWdf9Bt2OVhybWZ3OlpQQ2d692kdivtauWqCJZTOL26SgNMbpc5aiB6
 aorOS1qfPAYeiq/vdRJ+i3AE8CEwoywSLZgvbJ4n/d/wtsWsCO4xbqTnqLaVaWB8oqcv
 cKJm1d9ZvHeCcEySyZHMn6oO7xWtc+JqCGMnt3IfUYeJFULzlSmfZeNvpEljCALYfKXE
 rk65eS1dpgisCcRvUFMVwoOuBZ2+pFgHt4+NmDYfjFuHRJVapUWiEZV3B96ck2R3DpgQ
 PC1B/h/FUbZkD1SozVuTBxxYu7mdLxShRv2J0iZvmJaY7ukuTuk9t/vd/SPWuHyk0N58
 Lgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w1vz8fSO77bQeX6N4IZds+BsV7GNUQEtmOFqElpsOpQ=;
 b=yPqk3fibEgesNho6/WWk+xuOHIjqlmbqCNx9Ul17A9LTJpOb7JpOpLbqJEEYSYULip
 PjTvvHEfSU+dpR0CV5vrkv3DDIXsJL7e+5RV4M+nxNwtCOYdFSPluW1UmIRoDuC0bG5h
 eoLyBXSfhPb6nbVmyncMUrkJYI2zs55UCFhuN06Eu8k7E/5mzpDlRhA2sK9C8Y1pYauP
 XcwQooybu8TgUJ0jdC7afjwv/B+fZ7wRhXpQu5/qTqZLiBlgx/C5khgvRZt3HJNHDfFp
 yNYTPmetC+14XwBTCwSqvIE4900lcA1qAD8YvTkhwch5R3V984LkDBuLDVWaxCeM/kI0
 cT/g==
X-Gm-Message-State: AOAM531SdHzb0Qou+PzXhIgWPyrfgG7NRWm/Ch7zda7JHFY4u6qc/SSA
 tyqljI8IVn9NMm8YJw9KfNBCZaIIHeOiPw==
X-Google-Smtp-Source: ABdhPJyx7YAkLllNGmz+gWG1sZDNUG4A0kbtSqk7aTBUV53mX9rwqhV/g4pZ9r/RzIQIBk4Ju10tmg==
X-Received: by 2002:a0c:912b:: with SMTP id q40mr8009221qvq.9.1633189565158;
 Sat, 02 Oct 2021 08:46:05 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id x6sm5181145qts.79.2021.10.02.08.46.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 02 Oct 2021 08:46:04 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Fernando Ramos <greenfoo@u92.eu>
Subject: [PATCH 16/16] Revert "drm: cleanup: drm_modeset_lock_all_ctx() -->
 DRM_MODESET_LOCK_ALL_BEGIN()"
Date: Sat,  2 Oct 2021 11:45:42 -0400
Message-Id: <20211002154542.15800-16-sean@poorly.run>
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

This reverts commit 21dde40902d2636f70766b3154931de57e1215e9.

This patchset breaks on intel platforms and was previously NACK'd by
Ville.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Fernando Ramos <greenfoo@u92.eu>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/drm_client_modeset.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 5f5184f071ed..ced09c7c06f9 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -574,7 +574,6 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 	int num_connectors_detected = 0;
 	int num_tiled_conns = 0;
 	struct drm_modeset_acquire_ctx ctx;
-	int err;
 
 	if (!drm_drv_uses_atomic_modeset(dev))
 		return false;
@@ -586,7 +585,10 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 	if (!save_enabled)
 		return false;
 
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, err);
+	drm_modeset_acquire_init(&ctx, 0);
+
+	while (drm_modeset_lock_all_ctx(dev, &ctx) != 0)
+		drm_modeset_backoff(&ctx);
 
 	memcpy(save_enabled, enabled, count);
 	mask = GENMASK(count - 1, 0);
@@ -741,7 +743,8 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 		ret = false;
 	}
 
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, err);
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
 
 	kfree(save_enabled);
 	return ret;
-- 
Sean Paul, Software Engineer, Google / Chromium OS

