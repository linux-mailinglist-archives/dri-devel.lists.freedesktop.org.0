Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A31D73F7306
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 12:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1619E8994D;
	Wed, 25 Aug 2021 10:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660B489913;
 Wed, 25 Aug 2021 10:26:29 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id j2so9635398pll.1;
 Wed, 25 Aug 2021 03:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P/HLeCdm1ln+WDWlHx3gbH2c2TGPxEmJ7R7sNcfLOXw=;
 b=mcrlqXx2veIFAPIuR1zZjjMGBGC3pLIA2IFrCCQwW8jK9wRON0L+mvneUtG9EWMRx+
 7d7b5AXWPfLm1KEB+5LTnOhEipuf9Di9/CY1lUxuUiDbu4v9A0doKF0Qm6poKea5VseM
 ko4jRSDZrGQ2WXvHQx7y+9kGiXJtIFws3WUyprbvinMgQ4n6Qa9xbgJM1o7xdsImwYt+
 jNyeTWPF5243/7Qr5xB2lsXL4BXLNs/euuJ3AId/5+8W+fGHy+mP8eAJf8vH4fD8GXIa
 7zXINxn+uv8DZbkky03Hg1aWUm/9c9gILHsj+0dX8m4Jw3w8F3dvcfvnnKkpIajiXCE7
 0Z8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P/HLeCdm1ln+WDWlHx3gbH2c2TGPxEmJ7R7sNcfLOXw=;
 b=a5bCJLQsO+rcp5k4Utv449hoSt2b68sr9IpXdW96YjeXrjhjUrSGVdBuMPCZhlnIt8
 UkTXH7ZjWv2BUdL631TwPvGIdeQUbTM4FgqpszgrcX32C8rM6SGHdDt1mnPRkbGBVBfb
 l8GLmVZJBYVKAS64Kd3oMet19/pBmOOA59ICIMxn9NUGyNlo29AgBIQnOphBiDzeCS9k
 kfn50sXwzDLK6cNJGRaG2a6RgdRvM3/E2Z4alEV3mcXMpqUVZ/zOipY85Z07o2fcpbs6
 ZvVm56BHeIBYjKy3NJhQO0raXLtp4iBAdNvG2RU0iAmn4nLIRJ5nqKkeeHEg0wJC5UZE
 pVVQ==
X-Gm-Message-State: AOAM533SLNmedWIlqK4aUf+yTkhULf8nKKsD2X+TvZ7+jOomcB74dR4I
 dRCJFQ/yJIdHyJd52WhA2ew=
X-Google-Smtp-Source: ABdhPJzePDrz0gmAXJF/b1c+ZQtAypG8eji/dWUqtQ+OfAnYEoiu9NXIpjQUuVh17nWzvMUuZRXSnQ==
X-Received: by 2002:a17:902:bcc5:b0:133:1943:b48b with SMTP id
 o5-20020a170902bcc500b001331943b48bmr17088082pls.52.1629887188912; 
 Wed, 25 Aug 2021 03:26:28 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id t42sm10228377pfg.30.2021.08.25.03.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:26:28 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 chris@chris-wilson.co.uk, ville.syrjala@linux.intel.com,
 matthew.auld@intel.com, dan.carpenter@oracle.com, tvrtko.ursulin@intel.com,
 matthew.d.roper@intel.com, lucas.demarchi@intel.com, karthik.b.s@intel.com,
 jose.souza@intel.com, manasi.d.navare@intel.com, airlied@redhat.com,
 aditya.swarup@intel.com, andrescj@chromium.org,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v6 3/7] drm: lock drm_global_mutex earlier in the ioctl handler
Date: Wed, 25 Aug 2021 18:24:07 +0800
Message-Id: <20210825102411.1084220-4-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825102411.1084220-1-desmondcheongzx@gmail.com>
References: <20210825102411.1084220-1-desmondcheongzx@gmail.com>
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

In a future patch, a read lock on drm_device.master_rwsem is
held in the ioctl handler before the check for ioctl
permissions. However, this inverts the lock hierarchy of
drm_global_mutex --> master_rwsem.

To avoid this, we do some prep work to grab the drm_global_mutex
before checking for ioctl permissions.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_ioctl.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index d25713b09b80..158629d88319 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -772,19 +772,19 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
 	if (drm_dev_is_unplugged(dev))
 		return -ENODEV;
 
+	/* Enforce sane locking for modern driver ioctls. */
+	if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)) && !(flags & DRM_UNLOCKED))
+		mutex_lock(&drm_global_mutex);
+
 	retcode = drm_ioctl_permit(flags, file_priv);
 	if (unlikely(retcode))
-		return retcode;
+		goto out;
 
-	/* Enforce sane locking for modern driver ioctls. */
-	if (likely(!drm_core_check_feature(dev, DRIVER_LEGACY)) ||
-	    (flags & DRM_UNLOCKED))
-		retcode = func(dev, kdata, file_priv);
-	else {
-		mutex_lock(&drm_global_mutex);
-		retcode = func(dev, kdata, file_priv);
+	retcode = func(dev, kdata, file_priv);
+
+out:
+	if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)) && !(flags & DRM_UNLOCKED))
 		mutex_unlock(&drm_global_mutex);
-	}
 	return retcode;
 }
 EXPORT_SYMBOL(drm_ioctl_kernel);
-- 
2.25.1

