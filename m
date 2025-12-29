Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B07CE845B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 23:06:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38BDB10E744;
	Mon, 29 Dec 2025 22:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="DPx89bsh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com
 [209.85.215.225])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CA710E744
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 22:06:00 +0000 (UTC)
Received: by mail-pg1-f225.google.com with SMTP id
 41be03b00d2f7-bf1b402fa3cso9208758a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 14:06:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767045960; x=1767650760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=twseZy54c+QB1Kjp/hds53EAQKHotDuR3NVPADpEAm0=;
 b=ottglt92slTQ8b1Bs433LWHg1LVnu5icz0EfJB5C7EqGqm/z9doovDe+npjMp1Sxtj
 5VU1LZc8KLFxhp6mEXlxn7dMxQK4nb6PMSe8Nw7A9MZ/ua1y4w/sZGYWc8nD0DBvQm/l
 /XSv5aOcOxXkMb8b0gYZEGfW96gt81JqsmRPCd89sRRnQTPi8/CO0FRNKVZpNyRWwXoU
 SYhTQEzqp/NUMymh3h+p14H6K/d1yOhbBz7eJgBAvY1ONa5Fc0u10B4tGaLKIHOEV8fd
 Pj1nWSriTmUWf/laR0nr6eSH/MnEQGHD7e7NjgiNq3dZ7F6eVduJ1zT2qMiWoUfOyG25
 c3Jw==
X-Gm-Message-State: AOJu0YwI4g4vs5VCWtSwckDXELSEtaBZL4ge6U46VpUByLcFKBBLV35F
 xMTtLVs1wkxmerxmOiy96CI3mR+uqZfa9EiCzz9ZJyIe75g1YYrbhk36SOD6X8ImdrPZXGkr5WZ
 HTIdEGGV892cofnjse/gGGTtgtZCcz/3DsGncIQqVIfaMhB/Mb6ZnCSBFN9VNkblOekYAWmA/Eq
 j+RdnYtyzn2U5LxRcDGoftcRb4i1RprEDmC/KZzOmKjXtSP4biQda9AIrkKektRiLib2mlqnG0/
 OStaa8TH3Nhsl3eTVli
X-Gm-Gg: AY/fxX6wGHbrt5oWbD2NB/MEhTDM4SuR4TUxyzKFp9LgOHNk9AQ/7OvESfltq4qQrRL
 Ka3mGVcaUFE0J0XR8n9I4HMCnysZwMaKesy9yjbw+tlQbLKgBWQQKApuWHChkqNbwn2D4T95XLj
 Cp1jgS9Xjq9D5TcgJbV5I0sMz9BCPrtNDajcLdXLy6ydGudyhFHJ/cRiToEXmibeZbpHqCFWhwu
 Tj/0Fm7WzQSsSlZd4mVGri7hf7Y6uMxwSTIMSNg8AyQn3KqGIKqclartlpE03Xso61xGCwPY29J
 UoWpFWDMLHN/O/w/k2Mpb69qMu5iwHvj2q9pxmgSJzUG3cHts8sXbKWS7zXkWW3VDZH06SSDEwS
 QwYzXjwVUoZ6CL7Nyv/OHrrlr718TAOmRNsp++3X/gL8BdzC/5fVE7TDKvnIecd+19Y4IMDykHS
 m9Q31GMIbngxI2h7oU+uNVWNlum3SKSIK9WgyVL0hMptmA
X-Google-Smtp-Source: AGHT+IGtkS5p6uGvjWn2mW6tbbVMsN8DgiRJzk0VMWJu8UEEOjnOfBCL9W3WjxRf8URpjAT4cOo4VyGHuruE
X-Received: by 2002:a05:701b:2419:b0:119:e56c:1899 with SMTP id
 a92af1059eb24-121722aa633mr20926183c88.1.1767045959580; 
 Mon, 29 Dec 2025 14:05:59 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
 by smtp-relay.gmail.com with ESMTPS id
 a92af1059eb24-1217252ca1esm6696542c88.3.2025.12.29.14.05.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Dec 2025 14:05:59 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-34c704d5d15so18668015a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 14:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1767045957; x=1767650757;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=twseZy54c+QB1Kjp/hds53EAQKHotDuR3NVPADpEAm0=;
 b=DPx89bshO7Gj0nJ1EMSECePTxldkgfPbcLyWW3div6iNmxL4PHCRVXFm5c1b9xa2cD
 pPoIW1emnLLnef0SgliGmG2Mwej530194os8sbIQTHfmBjEg3VBbQSs+vgPT1QVC7H6t
 hN2AuM+UC4y4H2iszOPrN1HxRmxf9XlXexMwo=
X-Received: by 2002:a05:6214:1d26:b0:890:2480:f027 with SMTP id
 6a1803df08f44-8902480f3d0mr64568986d6.27.1767045565219; 
 Mon, 29 Dec 2025 13:59:25 -0800 (PST)
X-Received: by 2002:a05:6214:1d26:b0:890:2480:f027 with SMTP id
 6a1803df08f44-8902480f3d0mr64568576d6.27.1767045564676; 
 Mon, 29 Dec 2025 13:59:24 -0800 (PST)
Received: from localhost.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88d9759f164sm231530026d6.24.2025.12.29.13.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 13:59:22 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 05/12] drm/virtio: Add sysfb restore on probe failure
Date: Mon, 29 Dec 2025 16:58:11 -0500
Message-ID: <20251229215906.3688205-6-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251229215906.3688205-1-zack.rusin@broadcom.com>
References: <20251229215906.3688205-1-zack.rusin@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
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

Register a devm action on the virtio device to restore the system
framebuffer (efifb/simpledrm) if the driver's probe fails after
removing the firmware framebuffer.

Unlike PCI drivers, virtio-gpu cannot use the
devm_aperture_remove_conflicting_pci_devices() helper because the
PCI device is managed by the virtio-pci driver, not by virtio-gpu.
When virtio-gpu probe fails, the PCI device remains bound to
virtio-pci, so devm actions registered on the PCI device won't fire.

Instead, register the sysfb restore action on the virtio device
(&vdev->dev) which will be released if virtio-gpu probe fails.
Cancel the action after successful probe since the driver is now
responsible for display output.

This only applies to VGA devices where aperture_remove_conflicting_pci_devices()
is called to remove the firmware framebuffer.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Cc: David Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Chia-I Wu <olvaffe@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: virtualization@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index a5ce96fb8a1d..13cc8396fc78 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -30,6 +30,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/poll.h>
+#include <linux/sysfb.h>
 #include <linux/vgaarb.h>
 #include <linux/wait.h>
 
@@ -52,6 +53,11 @@ static int virtio_gpu_modeset = -1;
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, virtio_gpu_modeset, int, 0400);
 
+static void virtio_gpu_restore_sysfb(void *unused)
+{
+	sysfb_restore();
+}
+
 static int virtio_gpu_pci_quirk(struct drm_device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
@@ -75,6 +81,7 @@ static int virtio_gpu_probe(struct virtio_device *vdev)
 {
 	struct drm_device *dev;
 	int ret;
+	bool sysfb_restore_registered = false;
 
 	if (drm_firmware_drivers_only() && virtio_gpu_modeset == -1)
 		return -EINVAL;
@@ -97,6 +104,21 @@ static int virtio_gpu_probe(struct virtio_device *vdev)
 		ret = virtio_gpu_pci_quirk(dev);
 		if (ret)
 			goto err_free;
+
+		/*
+		 * For VGA devices, register sysfb restore on the virtio device.
+		 * We can't use devm_aperture_remove_conflicting_pci_devices()
+		 * because the PCI device is managed by virtio-pci, not us.
+		 * Register on &vdev->dev so it fires if our probe fails.
+		 */
+		if (pci_is_vga(to_pci_dev(vdev->dev.parent))) {
+			ret = devm_add_action_or_reset(&vdev->dev,
+						       virtio_gpu_restore_sysfb,
+						       NULL);
+			if (ret)
+				goto err_free;
+			sysfb_restore_registered = true;
+		}
 	}
 
 	dma_set_max_seg_size(dev->dev, dma_max_mapping_size(dev->dev) ?: UINT_MAX);
@@ -110,6 +132,13 @@ static int virtio_gpu_probe(struct virtio_device *vdev)
 
 	drm_client_setup(vdev->priv, NULL);
 
+	/*
+	 * Probe succeeded - cancel sysfb restore. We're now responsible
+	 * for display output.
+	 */
+	if (sysfb_restore_registered)
+		devm_remove_action(&vdev->dev, virtio_gpu_restore_sysfb, NULL);
+
 	return 0;
 
 err_deinit:
-- 
2.48.1

