Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 565C61717FA
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 13:59:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421F66E8B5;
	Thu, 27 Feb 2020 12:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E056E86D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 12:03:54 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j16so1458595wrt.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 04:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iLpawHdR33Cmeb66Wb9RCeN8N4vHyeCAeNVuUL7fY+w=;
 b=DJ12is7nziFZhaEhNTzxh/MUtVrKyT+uhRK9FCcvg2bnIVoJcKfzbrMCdEn9aHNBcq
 u2KS5dKnWgsxrVfOGWGY5ZvIpbCudLv4oRJwxrEki/4tWiQ+uZg+nThhboU4H6xdAvLd
 CwNJdO5U146vIGQDxcA3tD10qU9jh9ZzLNyLwL/9AulITTuhlJcd3yENVQ3vJ+gVxvLj
 gytvwF0Ts00fnjsyI+eM+GiKJA/WNsZgrjZjwJEoKYSDf35eic7PZ7NMmkO3k/wwdaKI
 FtlbBtVlFApEilsDT66MFNNnDwF1w1xGp97xgSnjqii+3gOXuZpEvC+O2GokIbIlWOTg
 NR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iLpawHdR33Cmeb66Wb9RCeN8N4vHyeCAeNVuUL7fY+w=;
 b=J8ZaWvkDQo8c1OZy81fegtkTDW9gRUDpNH07Y6Mbww5RWHjy8jDPbVkfhv+O5XymM3
 zXyn2GpPUXSotgtGXbnQZU75oNj8T7q3kN0DyXOlj6KjM3cL8EJc9u0C5CxnYKS6rGCU
 nv1c3Xd4I7SR/vcgeu9zPMWPcsrz+Z8WBlQnRLhpt2AztLhNF6FONt9keICIkrb7nE+C
 tDcUeCEBfzpH8xEVUN+JHWOrS4k/xos0Cj8ciNmnp2n3miX5OL4QyGrEu6mzZG3AGiSk
 3y30FcWItAq8X/30k5AyWJqRVuNylPzIQb4oFZCAggKUjj13G44hHAn1v5g3l/+frp4B
 pC6A==
X-Gm-Message-State: APjAAAUhykpZomDYpBRQAkGs1OuRNze4SOYRC+N1PhReEUHLEjG1PmT6
 CSBrooFnc3Y2k+sETCxxyo0=
X-Google-Smtp-Source: APXvYqzZP5GszXytVURkcYCrRKKgmojQxMcrPMh4iNIt7d3+P7L7mWVIFbuGKTnL73Xktkg6h6hCuQ==
X-Received: by 2002:adf:f3d1:: with SMTP id g17mr4402170wrp.378.1582805032699; 
 Thu, 27 Feb 2020 04:03:52 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t10sm7655017wru.59.2020.02.27.04.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 04:03:52 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: daniel@ffwll.ch,
	airlied@linux.ie,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 18/21] drm/virtio: make virtio_gpu_debugfs() return void.
Date: Thu, 27 Feb 2020 15:02:29 +0300
Message-Id: <20200227120232.19413-19-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200227120232.19413-1-wambui.karugax@gmail.com>
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Feb 2020 12:59:10 +0000
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since 987d65d01356 (drm: debugfs: make
drm_debugfs_create_files() never fail), drm_debugfs_create_files()
never fails and should return void. Therefore, remove its use as the
return value of virtio_gpu_debugfs() and have the latter function return
void.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_debugfs.c | 3 +--
 drivers/gpu/drm/virtio/virtgpu_drv.h     | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
index e27120d512b0..3221520f61f0 100644
--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
@@ -72,11 +72,10 @@ static struct drm_info_list virtio_gpu_debugfs_list[] = {
 
 #define VIRTIO_GPU_DEBUGFS_ENTRIES ARRAY_SIZE(virtio_gpu_debugfs_list)
 
-int
+void
 virtio_gpu_debugfs_init(struct drm_minor *minor)
 {
 	drm_debugfs_create_files(virtio_gpu_debugfs_list,
 				 VIRTIO_GPU_DEBUGFS_ENTRIES,
 				 minor->debugfs_root, minor);
-	return 0;
 }
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 95a7443baaba..3b843bb72cd1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -371,6 +371,6 @@ struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
 	struct sg_table *sgt);
 
 /* virgl debugfs */
-int virtio_gpu_debugfs_init(struct drm_minor *minor);
+void virtio_gpu_debugfs_init(struct drm_minor *minor);
 
 #endif
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
