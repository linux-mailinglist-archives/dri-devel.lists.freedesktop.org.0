Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 428A7152553
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 04:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 913076F454;
	Wed,  5 Feb 2020 03:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E496F454;
 Wed,  5 Feb 2020 03:49:05 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id ay11so300964plb.0;
 Tue, 04 Feb 2020 19:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fS55egdy+8luMv5QIBYCbIZcNyl4rVr/C+KErPFDs/0=;
 b=mli+pDrFFtQ23/4PFrLlnMQN9uLRFtfiuvV8t94qKBD2PFa1dcGY3kjFtC+Akyaef/
 ZgMr7r7Xu4D02Tzj3rlvpLQvBC05nlHwIzXycNDJZXj/d3Tv+AyeMDDNNqEaEqQ7dfql
 oCue0qEWFDy6GgZ0M1vFLeczbWwb/OTOKZEzXi+gc/jezlwYUoncZgoFbA++JfNoTxXt
 5pvbwUONNvuY3sekwTHNaSeYGGOMqQVGL/nCo3VteEKJDlCVxHCtZCw3PRVViZ6ZsOPn
 EuMSC9r1mHs9eCgq9+PJdH9tZQWYXoS5NEaaFROPO/kCMfM9RfzlKCFGTMy9svmQl9rE
 rTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fS55egdy+8luMv5QIBYCbIZcNyl4rVr/C+KErPFDs/0=;
 b=bZzZcLY0jZk6xqPIatiP7Sh71aokh1F9pG0n0kgcODRHkEnmBCYt8+x2qirqwdu0ND
 OqjQvvKDRoc1BsA5fMQimssNgqOY84Y+fDuR3lKeRRfeuj1vDXzNcpYnIuEuX4zqpyq5
 GwZofjTbJkt5hV8AO6Qf3I57OsrvKSU0znXYghZR1Kv0QKrIkILXa4synU2iSA5mTPKW
 3PLqAb2ShP0PcP/BC0GkJYb5Fhhksqv4LaJMEmUY8EVbn956LtWlRWemNIlUipzEE/7Q
 p+67reMpSKFJnBIYTnk4B357GEMeVUVpt5652dlsz/xxcQ8Ep+z9kvL5uFFSoRnG0FAy
 Laeg==
X-Gm-Message-State: APjAAAV0Ht7FjOaMOYa6GC8U7oSOomtAjVCUkha07uqmyTnEbGpIQsua
 0pBeuW0YILIZ9ruaNNn/vVJnUaVS
X-Google-Smtp-Source: APXvYqwhBoWhcQFAip8AJurREBLya0M1asGTneZKGJ7TZVrhQUIh9yu0oMsk22r9UuN1i8h9cQEbvg==
X-Received: by 2002:a17:90a:332e:: with SMTP id
 m43mr3139218pjb.107.1580874544251; 
 Tue, 04 Feb 2020 19:49:04 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id 200sm25320292pfz.121.2020.02.04.19.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 19:49:03 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 01/14] drm/amdgpu: rename amdgpu_debugfs_preempt_cleanup
Date: Tue,  4 Feb 2020 22:48:39 -0500
Message-Id: <20200205034852.4157-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200205034852.4157-1-alexander.deucher@amd.com>
References: <20200205034852.4157-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

to amdgpu_debugfs_fini.  It will be used for other things in
the future.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index f24ed9a1a3e5..58b5e1b4f814 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1229,7 +1229,7 @@ int amdgpu_debugfs_init(struct amdgpu_device *adev)
 					ARRAY_SIZE(amdgpu_debugfs_list));
 }
 
-void amdgpu_debugfs_preempt_cleanup(struct amdgpu_device *adev)
+void amdgpu_debugfs_fini(struct amdgpu_device *adev)
 {
 	debugfs_remove(adev->debugfs_preempt);
 }
@@ -1239,7 +1239,7 @@ int amdgpu_debugfs_init(struct amdgpu_device *adev)
 {
 	return 0;
 }
-void amdgpu_debugfs_preempt_cleanup(struct amdgpu_device *adev) { }
+void amdgpu_debugfs_fini(struct amdgpu_device *adev) { }
 int amdgpu_debugfs_regs_init(struct amdgpu_device *adev)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h
index f289d28ad6b2..b382527e359a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h
@@ -34,7 +34,7 @@ struct amdgpu_debugfs {
 int amdgpu_debugfs_regs_init(struct amdgpu_device *adev);
 void amdgpu_debugfs_regs_cleanup(struct amdgpu_device *adev);
 int amdgpu_debugfs_init(struct amdgpu_device *adev);
-void amdgpu_debugfs_preempt_cleanup(struct amdgpu_device *adev);
+void amdgpu_debugfs_fini(struct amdgpu_device *adev);
 int amdgpu_debugfs_add_files(struct amdgpu_device *adev,
 			     const struct drm_info_list *files,
 			     unsigned nfiles);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 8df7727815cb..3b09897eb1e9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3228,7 +3228,7 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
 		amdgpu_ucode_sysfs_fini(adev);
 	if (IS_ENABLED(CONFIG_PERF_EVENTS))
 		amdgpu_pmu_fini(adev);
-	amdgpu_debugfs_preempt_cleanup(adev);
+	amdgpu_debugfs_fini(adev);
 	if (amdgpu_discovery && adev->asic_type >= CHIP_NAVI10)
 		amdgpu_discovery_fini(adev);
 }
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
