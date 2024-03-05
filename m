Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F4229871DF2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 12:34:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EEBE112A4C;
	Tue,  5 Mar 2024 11:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.b="ZeOa8Sr0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E192112A4C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 11:34:30 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1dc0d11d1b7so45201515ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 03:34:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709638470; x=1710243270;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:dkim-signature:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SGvjvL1l3IEoVUIMcNND+raHtPvpiWRh02eFx2GTgcs=;
 b=cJ9kaD8MDru0Wgv2Pn33g2HXtsx+EOp42jDvnAecNKyIhJ7108LSTQ/wcey63xvcAn
 7rpEKuEoofLQrqG4po/G66qmLgSKZ3JirCm6Anfby+lqH19nIZj/gcAzvo0bV+zrguxv
 Qm3JwGcdOw4XMpBIFdlvZMxlwQqEveBzaQuRo3aNsqLDpVqjbp2gUtrE3oRESIVmvh5I
 sZ8bN9BX4JZDsXSvAzsx+Bt06dxdnzDlCE/9wS2bLBbg4cOK/reeBUEcbcGIJpkR9Iha
 azXen4tSnkb6Dbj0+9wIm8lF1nd8Xdxd+bjuFe5mQ0E5Uy1pHZ0t61kSdO7p0sdyFiHE
 XQ/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNaT4FAP0UOYgo27dQFr8meNI8vcgDog2LT7SqQG/VErtIapQfD/6LmBTrO5/raQ6EYfdmQroKLTAjhp/SEbqfmbmhqq3PmC7qiiQ8PXfd
X-Gm-Message-State: AOJu0YzE0uk+oF8hp1oGGcsNjaRe7JSKU8yJRamNG54zFXaeVxDkhhh1
 AtVm1rkIXl2Vf+VZZS5RQKZjDRghii64Gm2gxQTP09qlregKvoB1
X-Google-Smtp-Source: AGHT+IEvvXqVgNig+0Ajd3GcxrPcqCzSQEPkm0LQdI67Nas42de+ACS1GOh6k+iqXrCZCfKKLop+HQ==
X-Received: by 2002:a17:902:e74b:b0:1da:22d9:e7fd with SMTP id
 p11-20020a170902e74b00b001da22d9e7fdmr1703170plf.20.1709638469624; 
 Tue, 05 Mar 2024 03:34:29 -0800 (PST)
Received: from mail.marliere.net ([24.199.118.162])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a170903230f00b001dc3c4e7a12sm10315600plh.14.2024.03.05.03.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 03:34:29 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
 s=2024; t=1709638468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SGvjvL1l3IEoVUIMcNND+raHtPvpiWRh02eFx2GTgcs=;
 b=ZeOa8Sr0g4u6ioHCa+AEJa2P0N6xyD41cZUQ99KQvEzFdKnmd85LBQCyqKPIR5hy9KPSf7
 2+tam0hUlZYXqIDf0mcMsitkiEf4w2O2Dsug3zulLjOsnzEaXf10zv9c76IibqBwUbkjxn
 MWnSweGc9mb7nk902l1B8nIts3HHOF/UOhYGjUTALy8vy8lGwsa28tCcLbBXgfvcuUjmLn
 d6M6yTQvSWAXtpSrKnFRA/ZhPJRh47SAhJag2AzLaXAhKco444IbXSptaSEjuK0sIydl4h
 h7PH7a3+TI9JSbm/NNmJU4sIXPFk7ie9bTMFZIZv2WLs3VbdxddhAK4zjQxccQ==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Tue, 05 Mar 2024 08:34:13 -0300
Subject: [PATCH RESEND drm-misc 4/4] dma-buf: heaps: make dma_heap_class
 constant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-class_cleanup-drm-v1-4-94f82740525a@marliere.net>
References: <20240305-class_cleanup-drm-v1-0-94f82740525a@marliere.net>
In-Reply-To: <20240305-class_cleanup-drm-v1-0-94f82740525a@marliere.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>, Helge Deller <deller@gmx.de>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, 
 "Ricardo B. Marliere" <ricardo@marliere.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2638; i=ricardo@marliere.net; 
 h=from:subject:message-id;
 bh=TBVpOiYhHL/5knKRvD0InlYh5cmtDcK9l0qZqxgxL78=; 
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBl5wMzXXEwr5JfufBuY7fFwRJL8nmL4A2R2R+Df
 j91UwjdnM+JAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZecDMwAKCRDJC4p8Y4ZY
 pqQCD/9dAq8lWzYs5OjaBNAHM65zzjgz6Bgu/yB5UChhzZHSF5jbEB1KCMPsLUcOAD+H6g5bK69
 pAUxqPv2rzp9CWK1LphHF75Ys/ePMnp2Bcf4OyzIE6f91RhLoj6a4vbkFPo3ZEjSx/18f21XIqK
 7npqmmzF9bMJZ4uEDe+jODA+DBQYN9hVaJbTKxDS8gCZmfU25oI1BHVDQhreY8re7+ix7JSRyBm
 wPUj4mXuV+tzsbL9ZckyDvXuWCbO9ahj9PS3uSjE9nNg5frRpySuqZc8r94FQaSLRmTtmqSMmEa
 SaOKMQjsYWaR7HDt0KtlK2iZTXF+vm7jUvldFW4No5i3FP74h3rBI791dRMszvQXVMxe0YSJp1p
 S65Q9hxfqClvd7imVlKLKicraIepW+0Q+1p/FN5pf9wbZH4HmFKRlFJwDXpizdmwDpzqrPs2Fcz
 TS1Ke2yr1f9azqJrtXe2RyDIazXjn8oFYjH/iQ0NVI5qSTQgSiCN7XIsc0P5FF1QaF1J0OycvAg
 a7Y1NrbrkMUlnY3C/s6vWjrVcIDlj+65mOwFAUPdE9/908I9+Wxr3trDsTEbbyM5D1NEFpIhqvP
 kIBLJ4SWnDQasUHC1nJXCj2BVKfRDUdfhOGMRhz6653ioDf0gAwIeNI58zjAOjDGasGv4o8TfbK
 nsoMJNbrypYMCcQ==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
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

Since commit 43a7206b0963 ("driver core: class: make class_register() take
a const *"), the driver core allows for struct class to be in read-only
memory, so move the dma_heap_class structure to be declared at build time
placing it into read-only memory, instead of having to be dynamically
allocated at boot time.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/dma-buf/dma-heap.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 84ae708fafe7..bcca6a2bbce8 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -43,10 +43,18 @@ struct dma_heap {
 	struct cdev heap_cdev;
 };
 
+static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
+{
+	return kasprintf(GFP_KERNEL, "dma_heap/%s", dev_name(dev));
+}
+
 static LIST_HEAD(heap_list);
 static DEFINE_MUTEX(heap_list_lock);
 static dev_t dma_heap_devt;
-static struct class *dma_heap_class;
+static struct class dma_heap_class = {
+	.name = DEVNAME,
+	.devnode = dma_heap_devnode,
+};
 static DEFINE_XARRAY_ALLOC(dma_heap_minors);
 
 static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
@@ -261,7 +269,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 		goto err1;
 	}
 
-	dev_ret = device_create(dma_heap_class,
+	dev_ret = device_create(&dma_heap_class,
 				NULL,
 				heap->heap_devt,
 				NULL,
@@ -291,7 +299,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 	return heap;
 
 err3:
-	device_destroy(dma_heap_class, heap->heap_devt);
+	device_destroy(&dma_heap_class, heap->heap_devt);
 err2:
 	cdev_del(&heap->heap_cdev);
 err1:
@@ -301,11 +309,6 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 	return err_ret;
 }
 
-static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
-{
-	return kasprintf(GFP_KERNEL, "dma_heap/%s", dev_name(dev));
-}
-
 static int dma_heap_init(void)
 {
 	int ret;
@@ -314,12 +317,11 @@ static int dma_heap_init(void)
 	if (ret)
 		return ret;
 
-	dma_heap_class = class_create(DEVNAME);
-	if (IS_ERR(dma_heap_class)) {
+	ret = class_register(&dma_heap_class);
+	if (ret) {
 		unregister_chrdev_region(dma_heap_devt, NUM_HEAP_MINORS);
-		return PTR_ERR(dma_heap_class);
+		return ret;
 	}
-	dma_heap_class->devnode = dma_heap_devnode;
 
 	return 0;
 }

-- 
2.43.0

