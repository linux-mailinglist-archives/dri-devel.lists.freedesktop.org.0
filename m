Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A2E41FCD5
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 17:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F106F4AD;
	Sat,  2 Oct 2021 15:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81946E850
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 15:45:57 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id 138so12178881qko.10
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 08:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ft6d6TMpNghlCJqgeb5VMMaDDzmyvnIfsVFHrJe8ieI=;
 b=VE3LB29Jv917YOIrir+uSFIoUQYweZbx+g6iuzFqzIc6HJU54ZhSsMK+6hQXodB24H
 HSVgbE3dTKtF62Mw3p4h8uqAWuzsOyyz84o1CIzDVnn1tC5OILku/oiB7b04JTB8Mxf/
 eWgp2u88nFOWcfJf9UfiIHbb3S48TzkT4gwXuFdmoLSylg/qadpPbLR/bspWNJ4TC+9x
 Ujy/6NVD/RyMXj/xmu8OfyGcy/Mgoif9lRwKFzDgx1Lf2dGbdQFHinqKqAvAKP5wEHjh
 +fcIIKhOxe+axUuW+YNIU8qs/p2C8IpfZJaOmlUOjvEGEuvPIrqjAPB8wozwCkyw5ZzT
 3qJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ft6d6TMpNghlCJqgeb5VMMaDDzmyvnIfsVFHrJe8ieI=;
 b=GP+3b3q8ytCxBMru+k18xeDUqkHR1Qrk2vzD8K7eBkcsGNead88ADpy77j688XhuUG
 ldQ14LVH4y/pWKR7xm74Bqe1KF7WTE/8q96e6x7Rb1AV1geC3Fz5i7mujrXWuWDXl5qY
 6nvOgzbTIJzRGMEY8rwMrR8JrSZq1faNMuMGPmXw8F7V0bLDf0VQ01qeDf+AOO5MDzVe
 da9HCOcp72hZVYRQ7psWvfOSNznZUIkALn1FBXqEQUxcpFh768n9QPL/CiktMf2mDfK8
 LsYCjY6gHXxJb+JxwUFIm70HgI5bOd5aaAphgPVfQQxNAhqMRbjX0oqsm//1inlVaEOI
 SWBQ==
X-Gm-Message-State: AOAM533SdB2YqrJr6zQE5og6PIfWcEPgjgvMidbfYLGXvoT6TnyQaKdH
 mIf0t4uIW0GawX245yikhFnxNP4ftUDL3Q==
X-Google-Smtp-Source: ABdhPJx5qn0blFTLrM3hcIwWgN6llR7cc8WaLkq61gRr8i/kieYWvcSI+mx3Txa761R0JiHcUJ3roQ==
X-Received: by 2002:a05:620a:22e:: with SMTP id
 u14mr2970233qkm.101.1633189556898; 
 Sat, 02 Oct 2021 08:45:56 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id d17sm6401870qte.0.2021.10.02.08.45.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 02 Oct 2021 08:45:56 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Fernando Ramos <greenfoo@u92.eu>
Subject: [PATCH 10/16] Revert "drm/shmobile: cleanup: drm_modeset_lock_all()
 --> DRM_MODESET_LOCK_ALL_BEGIN()"
Date: Sat,  2 Oct 2021 11:45:36 -0400
Message-Id: <20211002154542.15800-10-sean@poorly.run>
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

This reverts commit 9b8c437ef1a5f34686fc96b391c201a80f1a2ea0.

This patchset breaks on intel platforms and was previously NACK'd by
Ville.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Fernando Ramos <greenfoo@u92.eu>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/shmobile/shmob_drm_drv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
index 8ee215ab614e..7db01904d18d 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
@@ -156,12 +156,10 @@ static int shmob_drm_pm_suspend(struct device *dev)
 static int shmob_drm_pm_resume(struct device *dev)
 {
 	struct shmob_drm_device *sdev = dev_get_drvdata(dev);
-	struct drm_modeset_acquire_ctx ctx;
-	int ret;
 
-	DRM_MODESET_LOCK_ALL_BEGIN(sdev->ddev, ctx, 0, ret);
+	drm_modeset_lock_all(sdev->ddev);
 	shmob_drm_crtc_resume(&sdev->crtc);
-	DRM_MODESET_LOCK_ALL_END(sdev->ddev, ctx, ret);
+	drm_modeset_unlock_all(sdev->ddev);
 
 	drm_kms_helper_poll_enable(sdev->ddev);
 	return 0;
-- 
Sean Paul, Software Engineer, Google / Chromium OS

