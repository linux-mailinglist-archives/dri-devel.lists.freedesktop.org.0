Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C31A41F8FB1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725B96E2B8;
	Mon, 15 Jun 2020 07:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p6.oit.umn.edu (mta-p6.oit.umn.edu [134.84.196.206])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FDC36E077
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 02:45:03 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p6.oit.umn.edu (Postfix) with ESMTP id 49kzMf65swz9vC8G
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 02:45:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id donrDWqy__8f for <dri-devel@lists.freedesktop.org>;
 Sat, 13 Jun 2020 21:45:02 -0500 (CDT)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 49kzMf4MT1z9vBv9
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 21:45:02 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 49kzMf4MT1z9vBv9
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 49kzMf4MT1z9vBv9
Received: by mail-il1-f199.google.com with SMTP id c8so9525249ilm.5
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 19:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rd2VjpzQgkEClsEYtAWgC+2Wg7FwSwBjiaqDtTh+S08=;
 b=HxATxqIHtlr+96w9P6AFy9iierCYkjOYBhGVkz3bOHlbza7ltvrOv7V9YBSd2Cdc4F
 Mp74lvOSNbVRm8H9OBgbaNPH5K0Z1kX+gIZV+EU0B5qZUtoFIFOxmp0szGFD0LVl54Ib
 dSHPMvXjTXyREpnowAy2W3xH2T8Qxc8sJVZgGYaCacFTB+g73KBNIbm1irNW48m4kIGC
 tWYpBr0VIBPuo6QQRprd4Mos/hh1FDaZwntWslyOw0uLdMETUFEXh90klLlvahGT6gLN
 FnAlQOhrA+RkXDXbfCYueGuXJttoY2MzilHCnxgO7oCt1VXu1hJFFH8ludppnpMYIJ0H
 sv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rd2VjpzQgkEClsEYtAWgC+2Wg7FwSwBjiaqDtTh+S08=;
 b=uGTe+aHe719K4/zMZ+aVJ1s/Mzadnj1uWbg3frhZeV5iOp4w2tMyVSFgdfY2TGeaBI
 Lmc8IZ762AIfZENuwanjawA/t287zLWKpyKNH3YVVeiBdDza9IZa4B83bURraeCGyz3q
 sjI+Ak5i6zTgeoGtK/Yzy9DhTz2P6L5yR2F0lpGBQb5ZY1CouXcL5zJZmQg1QWIb+XKf
 VAn0O2CEJKj6/CFYioTtLkW22ig1rAJfZRMSO8Bn/wg8rgkS3TD6TrPCWCa3pAHbF6OH
 4qCBdua7aXRL+QLT2PmMe4tirXirYCP3+m/q8dggnGExAPotAjtVxacN3UVpHe64RmwM
 3LfA==
X-Gm-Message-State: AOAM533wgbOt05q6rC6zIKMyea/GjGNFOa/Yygo7hhnIo+OizrkJI1zH
 X0kKexaca8yvjtfccOvN846lbVOvIVSoFANao5xeMrDyriRqXRXUIksm284KyilWMaINcz1zyVz
 Saxez01mMhlzcWO/XISpmiUHgzdl1nwYc
X-Received: by 2002:a02:2444:: with SMTP id q4mr15015781jae.29.1592102701783; 
 Sat, 13 Jun 2020 19:45:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGSBps24otpQFtoYYQPeA7t7P0ZZ1AIxnDyr0Ew5+8uROSBa8DH3IN9OjwWqBGbKM1cjqh5g==
X-Received: by 2002:a02:2444:: with SMTP id q4mr15015776jae.29.1592102701608; 
 Sat, 13 Jun 2020 19:45:01 -0700 (PDT)
Received: from syssec1.cs.umn.edu ([2607:ea00:101:3c74:49fa:9c47:e40b:9c40])
 by smtp.gmail.com with ESMTPSA id 13sm5689192ilg.24.2020.06.13.19.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 19:45:01 -0700 (PDT)
From: Aditya Pakki <pakki001@umn.edu>
To: pakki001@umn.edu
Subject: [PATCH] drm/v3d: fix reference count leaks due to pm_runtime_get_sync
Date: Sat, 13 Jun 2020 21:44:59 -0500
Message-Id: <20200614024459.126372-1-pakki001@umn.edu>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On calling pm_runtime_get_sync() the reference count of the device
is incremented. In case of failure, decrement the
reference count before returning the error.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/gpu/drm/v3d/v3d_debugfs.c | 8 ++++++--
 drivers/gpu/drm/v3d/v3d_drv.c     | 4 +++-
 drivers/gpu/drm/v3d/v3d_gem.c     | 4 +++-
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_debugfs.c
index e76b24bb8828..7ceb945e3a31 100644
--- a/drivers/gpu/drm/v3d/v3d_debugfs.c
+++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
@@ -133,8 +133,10 @@ static int v3d_v3d_debugfs_ident(struct seq_file *m, void *unused)
 	int ret, core;
 
 	ret = pm_runtime_get_sync(v3d->drm.dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_autosuspend(v3d->drm.dev);
 		return ret;
+	}
 
 	ident0 = V3D_READ(V3D_HUB_IDENT0);
 	ident1 = V3D_READ(V3D_HUB_IDENT1);
@@ -220,8 +222,10 @@ static int v3d_measure_clock(struct seq_file *m, void *unused)
 	int ret;
 
 	ret = pm_runtime_get_sync(v3d->drm.dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_autosuspend(v3d->drm.dev);
 		return ret;
+	}
 
 	if (v3d->ver >= 40) {
 		V3D_CORE_WRITE(core, V3D_V4_PCTR_0_SRC_0_3,
diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 82a7dfdd14c2..9b0a60b0bc11 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -106,8 +106,10 @@ static int v3d_get_param_ioctl(struct drm_device *dev, void *data,
 			return -EINVAL;
 
 		ret = pm_runtime_get_sync(v3d->drm.dev);
-		if (ret < 0)
+		if (ret < 0) {
+			pm_runtime_put_autosuspend(v3d->drm.dev);
 			return ret;
+		}
 		if (args->param >= DRM_V3D_PARAM_V3D_CORE0_IDENT0 &&
 		    args->param <= DRM_V3D_PARAM_V3D_CORE0_IDENT2) {
 			args->value = V3D_CORE_READ(0, offset);
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 09a7639cf161..f2980632896a 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -440,8 +440,10 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	job->free = free;
 
 	ret = pm_runtime_get_sync(v3d->drm.dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_autosuspend(v3d->drm.dev);
 		return ret;
+	}
 
 	xa_init_flags(&job->deps, XA_FLAGS_ALLOC);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
