Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACD91F8FA3
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79536E258;
	Mon, 15 Jun 2020 07:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p5.oit.umn.edu (mta-p5.oit.umn.edu [134.84.196.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F4E89F2A
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 02:21:25 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p5.oit.umn.edu (Postfix) with ESMTP id 49kyrP1Gpdz9vHdf
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 02:21:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HrKCmX-ciltr for <dri-devel@lists.freedesktop.org>;
 Sat, 13 Jun 2020 21:21:25 -0500 (CDT)
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 49kyrN6cGQz9vHdS
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 21:21:24 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 49kyrN6cGQz9vHdS
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 49kyrN6cGQz9vHdS
Received: by mail-io1-f71.google.com with SMTP id h65so8926924ioa.7
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 19:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1skhAYqgTNSWsq4lvqV5pXURB90mGpd6sDboa81hzn4=;
 b=inDQYcmHcL3Cz+asrBz/w7/AH+tbLoHWzIu2j3/vBKxYRotaYrR5dtjBlReiW10muR
 JgRA7bR5vnj1ZLaL/RZraj1F3mx2KnqSqFmaI0AN1pl7t3wXWBnHQtOwIfAiEqxfhDwV
 HKUtr3/gv03Oz+PzAaaeW8sVCHIlPPzRLIpmlfBvilKpr1GJWbfuWfSLNFDpXlZKwGhc
 AjwoKU9MfTAeNWiZ1q47UyU7QzPSNrEgTkJ73Byh6v5PoKL7iiSeU/4R35njyzj/5+uT
 qCxwAwiiUTmGJIYYBX51YNcIcbOIgx4uvW6caEEPkoLiC+gnepFHBVifLyZ9PhjKnCD8
 ZIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1skhAYqgTNSWsq4lvqV5pXURB90mGpd6sDboa81hzn4=;
 b=A7yvMa419I5sxa74m+ZJebTzhXc7H+RelgeXzDHKSS/OsRYU0EOsZP79jXQhpVATbZ
 nsNkzIGOsGqMiOpiLR3I8l+3u2+gS/9udsY+ngTYDjH903lfpTcvmvuan8zXRVeBjP0Q
 N5f3padEjivm5ZyASjJLYmp0sZe9hwYRQFOKNVWOEUIVL01e6NU6KALaQFDvw30Tj0kL
 VArYOk0BJIIARAZOjOMWSI/czJiwNeuIwKblSsQN4lyhk9MXeKpdF5lPH5USn7gP0u08
 YOkUqumRO5jdupXCT0FONDLdK+1qlIkyw9PdevhvLwOyVkCyLXLXFA6pW+Jy1nwujz6p
 Jg7g==
X-Gm-Message-State: AOAM532nCqNCjgWICh6SEgdlEl3jxEWi73qCguHombWmghysZdsWxZZW
 qrOZxzWlGl3tx7yCCeOiTcdoxk8hdTyEYjT6Ca3T5ZrJyy9kBSqDZw8LIRioL7V/TTy0fnJrqVA
 6qtcoqFkJYnoFHMfkuAVxZkhfkm/kBUgy
X-Received: by 2002:a92:6a06:: with SMTP id f6mr19738341ilc.89.1592101284493; 
 Sat, 13 Jun 2020 19:21:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwE+vPbigALAessccDcAKFOmVWqMDFxxHN2H7lviB9iL6LRnhGo3tuBBjuUyQNOGb53QjP8Ew==
X-Received: by 2002:a92:6a06:: with SMTP id f6mr19738330ilc.89.1592101284325; 
 Sat, 13 Jun 2020 19:21:24 -0700 (PDT)
Received: from syssec1.cs.umn.edu ([2607:ea00:101:3c74:49fa:9c47:e40b:9c40])
 by smtp.gmail.com with ESMTPSA id l26sm5762514ild.59.2020.06.13.19.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 19:21:23 -0700 (PDT)
From: Aditya Pakki <pakki001@umn.edu>
To: pakki001@umn.edu
Subject: [PATCH] drm/radeon: Fix reference count leaks caused by
 pm_runtime_get_sync
Date: Sat, 13 Jun 2020 21:21:22 -0500
Message-Id: <20200614022122.124908-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: wu000273@umn.edu, David Airlie <airlied@linux.ie>, kjlu@umn.edu,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On calling pm_runtime_get_sync() the reference count of the device
is incremented. In case of failure, decrement the
reference count before returning the error.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/gpu/drm/radeon/radeon_display.c | 4 +++-
 drivers/gpu/drm/radeon/radeon_drv.c     | 4 +++-
 drivers/gpu/drm/radeon/radeon_kms.c     | 4 +++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 35db79a168bf..df1a7eb73651 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -635,8 +635,10 @@ radeon_crtc_set_config(struct drm_mode_set *set,
 	dev = set->crtc->dev;
 
 	ret = pm_runtime_get_sync(dev->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_autosuspend(dev->dev);
 		return ret;
+	}
 
 	ret = drm_crtc_helper_set_config(set, ctx);
 
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index bbb0883e8ce6..62b5069122cc 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -549,8 +549,10 @@ long radeon_drm_ioctl(struct file *filp,
 	long ret;
 	dev = file_priv->minor->dev;
 	ret = pm_runtime_get_sync(dev->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_autosuspend(dev->dev);
 		return ret;
+	}
 
 	ret = drm_ioctl(filp, cmd, arg);
 	
diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
index c5d1dc9618a4..99ee60f8b604 100644
--- a/drivers/gpu/drm/radeon/radeon_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_kms.c
@@ -638,8 +638,10 @@ int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 	file_priv->driver_priv = NULL;
 
 	r = pm_runtime_get_sync(dev->dev);
-	if (r < 0)
+	if (r < 0) {
+		pm_runtime_put_autosuspend(dev->dev);
 		return r;
+	}
 
 	/* new gpu have virtual address space support */
 	if (rdev->family >= CHIP_CAYMAN) {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
