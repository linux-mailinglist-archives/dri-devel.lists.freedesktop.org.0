Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A3BD1AB23
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 18:45:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B3B10E52A;
	Tue, 13 Jan 2026 17:45:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC3010E52A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 17:45:00 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b8706ce18c0so467720666b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 09:45:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768326299; x=1768931099;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eavvu1t15qKvDTI2jSsLTlj8ivnyPIJR0TkymEC1eF0=;
 b=lnA0sf/jb6IFF344yYaYbmWsPgsmY4mDTvYsOqYRsp64wVEidtFxS9IbuZAL9orbZx
 nk4mY/klAiMam3263jwPC+8ZqW5dbAXNLCRv1uDXHN+Vj8flmauTW85tBdJ4TnUzVi8m
 Eido1/BlOtpz89zyNowD2EhNt4lE9xOKMCubCzKiddew7pjuzSe+dUH1jUf33NsvVQo5
 gEh51Q5DEMXW/CDwIN8adf7HgeCGGV+KM3CfmyZIURmAKfwFTyw4A2xM4qdhvik7K9A1
 2UZNaAFShVQNJLwQIjSHhmg+9vWJSdSkKUCfyBkB7TJmj3alGGvHqAZWkhNDJEztPfVf
 DhFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3qQhL4BTXpHwjxeC6+ebs7Z4Vjw9rmEAaj/Xs3PSwq4w2KujG9MYTLKklHw3qs1mOYrNUlJHYFHM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywlc0E6k8rpjbAWN5Lmo5RZkVJLZTKaPA0k40eZMNbvI5gB+QX+
 9iGk1EtfoCe9Rvjb6IPoK8ZF5xYqGbScRZooDisM00f9IjSdsdIvCxRb
X-Gm-Gg: AY/fxX7PU9s+AReRIGx2O7vMvPY6vfyaSYpwkwTiMNLjHVExnaiCdqOfbK4BNf6KLEI
 dXIMaGOi7QPYVGeg2F9aIUEp/VRcej77ExE4zJN0fxeACSVbbRdsKrskunk0ZbNO2fesAE3u966
 Tbdc3vBVvrIAtSv8KDuOt1L+ghJ53Z7+HY+oKKQ+1j+A3KyhMcyvFAoeHcpxcKYLNcVYfuhveTF
 euSaQ7DgVywxBm9F/kKgyzqMGjScEangc9KjYO55hX0ALzBDz6xv2DavWfaZH2HDX+Vi+96Feh4
 pcjkJa+GK2004wxhm3R762zBmZ4PCOGKolBvzDzwRsgQ8hErj1CBWgPQP5yCzvRtUz04KQ1cVtb
 FvUNKBSjKS0vdeL6QWvOq1LFxfybpKjAIdsq3YMbY8jrVFAMCY94o3xKlHTUJ5PvjCMxASb/9da
 KVcJ7+A95/R2fIM7jLfYlZvDHqtTx/tEezCyBv50nX0Y+icQ==
X-Google-Smtp-Source: AGHT+IHjwdSSN4mTRKXDjSC9xCBKsqwskTn4GwaR+B+tRXZTp9WDKqbrL/GHsxrwpYwUo4qku7MY+g==
X-Received: by 2002:a17:907:7742:b0:b87:1eaf:377c with SMTP id
 a640c23a62f3a-b871eaf3facmr466107266b.38.1768326298728; 
 Tue, 13 Jan 2026 09:44:58 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-36-231.cust.vodafone.cz. [46.135.36.231])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507be655aesm20873259a12.17.2026.01.13.09.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 09:44:57 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 13 Jan 2026 18:44:39 +0100
Subject: [PATCH 5/5] accel/thames: Add IOCTL for memory synchronization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-thames-v1-5-99390026937c@tomeuvizoso.net>
References: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
In-Reply-To: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
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

The DSP cores have their own access to the memory bus, and it isn't
cache coherent with the CPUs.

Add IOCTLs so userspace can mark when the caches need to be flushed, and
also when a writer job needs to be waited for before the buffer can be
accessed from the CPU.

Initially based on the same IOCTLs from the Etnaviv driver.

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/accel/thames/thames_drv.c |  2 ++
 drivers/accel/thames/thames_gem.c | 52 +++++++++++++++++++++++++++++++++++++++
 drivers/accel/thames/thames_gem.h |  4 +++
 3 files changed, 58 insertions(+)

diff --git a/drivers/accel/thames/thames_drv.c b/drivers/accel/thames/thames_drv.c
index bf7355832241d5a671e196f465d891effaa4a8fb..9b72db433fbb8f9239a16a047a52520f0a01d125 100644
--- a/drivers/accel/thames/thames_drv.c
+++ b/drivers/accel/thames/thames_drv.c
@@ -76,6 +76,8 @@ static const struct drm_ioctl_desc thames_drm_driver_ioctls[] = {
 	THAMES_IOCTL(BO_CREATE, bo_create),
 	THAMES_IOCTL(BO_MMAP_OFFSET, bo_mmap_offset),
 	THAMES_IOCTL(SUBMIT, submit),
+	THAMES_IOCTL(BO_PREP, bo_prep),
+	THAMES_IOCTL(BO_FINI, bo_fini),
 };
 
 DEFINE_DRM_ACCEL_FOPS(thames_accel_driver_fops);
diff --git a/drivers/accel/thames/thames_gem.c b/drivers/accel/thames/thames_gem.c
index a153e73a15253e0f955d74020b4765a1fa833fc4..2ad5a62bea275eb38a96b9d9bea804ed94ffb011 100644
--- a/drivers/accel/thames/thames_gem.c
+++ b/drivers/accel/thames/thames_gem.c
@@ -353,3 +353,55 @@ int thames_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data, struct drm_
 
 	return 0;
 }
+
+int thames_ioctl_bo_prep(struct drm_device *ddev, void *data, struct drm_file *file)
+{
+	struct drm_thames_bo_prep *args = data;
+	struct drm_gem_object *gem_obj;
+	struct drm_gem_shmem_object *shmem_obj;
+	unsigned long timeout = drm_timeout_abs_to_jiffies(args->timeout_ns);
+	long ret = 0;
+
+	if (args->reserved != 0)
+		return -EINVAL;
+
+	gem_obj = drm_gem_object_lookup(file, args->handle);
+	if (!gem_obj)
+		return -ENOENT;
+
+	ret = dma_resv_wait_timeout(gem_obj->resv, DMA_RESV_USAGE_WRITE, true, timeout);
+	if (!ret)
+		ret = timeout ? -ETIMEDOUT : -EBUSY;
+
+	shmem_obj = &to_thames_bo(gem_obj)->base;
+
+	dma_sync_sgtable_for_cpu(ddev->dev, shmem_obj->sgt, DMA_FROM_DEVICE);
+
+	drm_gem_object_put(gem_obj);
+
+	return ret;
+}
+
+int thames_ioctl_bo_fini(struct drm_device *ddev, void *data, struct drm_file *file)
+{
+	struct drm_thames_bo_fini *args = data;
+	struct drm_gem_shmem_object *shmem_obj;
+	struct thames_gem_object *thames_obj;
+	struct drm_gem_object *gem_obj;
+
+	if (args->reserved != 0)
+		return -EINVAL;
+
+	gem_obj = drm_gem_object_lookup(file, args->handle);
+	if (!gem_obj)
+		return -ENOENT;
+
+	thames_obj = to_thames_bo(gem_obj);
+	shmem_obj = &thames_obj->base;
+
+	dma_sync_sgtable_for_device(ddev->dev, shmem_obj->sgt, DMA_TO_DEVICE);
+
+	drm_gem_object_put(gem_obj);
+
+	return 0;
+}
diff --git a/drivers/accel/thames/thames_gem.h b/drivers/accel/thames/thames_gem.h
index 785843c40a89a9e84ab634aad77e9ec46111693e..e5a8278e98c578c2903cf23aea1bf887be0389e8 100644
--- a/drivers/accel/thames/thames_gem.h
+++ b/drivers/accel/thames/thames_gem.h
@@ -29,6 +29,10 @@ int thames_ioctl_bo_create(struct drm_device *ddev, void *data, struct drm_file
 
 int thames_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data, struct drm_file *file);
 
+int thames_ioctl_bo_prep(struct drm_device *ddev, void *data, struct drm_file *file);
+
+int thames_ioctl_bo_fini(struct drm_device *ddev, void *data, struct drm_file *file);
+
 int thames_context_create(struct thames_file_priv *priv);
 
 void thames_context_destroy(struct thames_file_priv *priv);

-- 
2.52.0

