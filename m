Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E94CE83DA
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 22:59:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A12210E733;
	Mon, 29 Dec 2025 21:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="EfE5KYvN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f99.google.com (mail-qv1-f99.google.com
 [209.85.219.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA6F10E731
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 21:59:19 +0000 (UTC)
Received: by mail-qv1-f99.google.com with SMTP id
 6a1803df08f44-88a35a00502so97047196d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 13:59:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767045559; x=1767650359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iO5bQdvPC15UP8CHevTImGh62fz7bMVkTIkttiBAsEo=;
 b=gzcaUYBVF5arHB4G89ohwq72NtYPusoq9IjKjOIq9SyIsgCrkslWRO6QrRVDCbNeBr
 bjO7gBrgVWCvE1ybrftoF9i55ek+yrfdTaJVE6W7XXhXnVBjMrvfU/gP4aYYceyx4QBo
 BQL2VPOMutONozUanAw518NFdant9XYYGNKOxKlIzbEMfDDtsQKVZkMWQYtEHKOSgE8F
 c2OQC9rJMukWSmugveErZ5SGB9+dQ83AT3mFLSg4Ykaizu8BY4qWVIRvKvfyfpwj/jms
 pW12uIb5NEd1o68MS5WEzPgEt5SwDzrvf+GU54whcRVeZKgcU0Y4tLHA0CMFw4rUURF2
 LAiw==
X-Gm-Message-State: AOJu0YxHJn1QoQIJ/lEjrUhRJ7PPa0FURvVMESzoGOKD1IDg1vmcxne3
 fbbSVaj44PCr9KuE6covfhaQV5Mu7DMVeQ1RDpLV3q0yiQb+0u64Ep4qrl7xiLsCTMxHkGMTcod
 KVqSKy0jk/Jbs4iR4/ZMDRePIBh3NDDTtcPFSsxjRc+4FdHo0IXOKoidA4NsEm64M/QS7Twc7Xs
 iGk4ngvvBomsKs/GjexLqQhRQPti11MDh7y5VBMwBcFJV6JDZ7chaakG7d762W0hjq32zQW997N
 87LtYxm7JLecC5DQ3fk
X-Gm-Gg: AY/fxX4paqFcZNMDN43Jqb/IgCrOY9ka5FmJhtAuT+g/GhIpMKF1JUhIEBDgCs2Ro7L
 Q/MTCpoCoPkIicI5cJ/7yRtFeKb02eCyEUVblhFjZPEXjBxZHj4z34KvdYNV3mjndcLbpSftkFh
 oc7byervdIH3Xiet3afLjE92P9FOd3Acxom0R2rD2W51fEuoUZ1Mf0SYBtEnhvW/tdkd6g2lzko
 Il55QrCY/DJVOj7RMBmMv6LLDFyCx4qRq65cnlPIM6sazdtiQUVuy0qQYGwi4trLHuY2H+ihQoz
 I/SCsrEcy7lIBkrfBWNRwxPL+tH73oIZMA2OCP1/gZSNIRPQS6hvRb5qcjIbzftY86BLdkUa12P
 GovfO2/X9f3WiZ7bz5V6V6yhTKSLR/uYNU3CYX9pUlerBnSfdPmSUqj8WuZFxK025dXFiR/0Oku
 +JlbndkHsMBsiDzMfBZjAXsq67VtHsRYaCoX7dZRUyQfbq
X-Google-Smtp-Source: AGHT+IHdpn3yJ6Tdxw/GqD5pVPqIC2AxFhn3mG8Jw5JmGjtwYe5r3M1vjFFRjJoe/jJDJVf6S68rWhIbVc1V
X-Received: by 2002:a0c:f78d:0:b0:88a:27b0:9096 with SMTP id
 6a1803df08f44-88d8423f119mr410284226d6.53.1767045558839; 
 Mon, 29 Dec 2025 13:59:18 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-101.dlp.protect.broadcom.com. [144.49.247.101])
 by smtp-relay.gmail.com with ESMTPS id
 6a1803df08f44-88d95889cbasm42508696d6.13.2025.12.29.13.59.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Dec 2025 13:59:18 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88a47331c39so254868476d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 13:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1767045555; x=1767650355;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iO5bQdvPC15UP8CHevTImGh62fz7bMVkTIkttiBAsEo=;
 b=EfE5KYvNi4jbyTAIf8K6tqL8DL0WTb1J6WUmbbEw/N6H1SXJZL0qICYGQm2GqcoNAO
 HdLEjkKEQno/WkMj+zJQz2fjuraUaHyi/jzNwvzR/8wM8AX9iEIFgqcetdRDqmcDGnxV
 gVtP+KnoZeA/84XHdmTZv47mmtW3KnoMYfnKM=
X-Received: by 2002:a05:6214:154f:b0:87c:208b:9556 with SMTP id
 6a1803df08f44-88d82526733mr349336686d6.30.1767045555421; 
 Mon, 29 Dec 2025 13:59:15 -0800 (PST)
X-Received: by 2002:a05:6214:154f:b0:87c:208b:9556 with SMTP id
 6a1803df08f44-88d82526733mr349336506d6.30.1767045554923; 
 Mon, 29 Dec 2025 13:59:14 -0800 (PST)
Received: from localhost.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88d9759f164sm231530026d6.24.2025.12.29.13.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 13:59:14 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH 02/12] drm/vmwgfx: Use devm aperture helpers for sysfb restore
 on probe failure
Date: Mon, 29 Dec 2025 16:58:08 -0500
Message-ID: <20251229215906.3688205-3-zack.rusin@broadcom.com>
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

Use devm_aperture_remove_conflicting_pci_devices() instead of the
non-devm variant to automatically restore the system framebuffer
(efifb/simpledrm) if the driver's probe fails after removing the
firmware framebuffer.

Call devm_aperture_remove_conflicting_pci_devices_done() after
successful probe to cancel the automatic restore, as the driver
is now responsible for display output.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 599052d07ae8..1b0fc4f9d4af 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1622,7 +1622,12 @@ static int vmw_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	struct vmw_private *vmw;
 	int ret;
 
-	ret = aperture_remove_conflicting_pci_devices(pdev, driver.name);
+	/*
+	 * Use devm variant to automatically restore sysfb if probe fails.
+	 * This ensures the user doesn't lose display if our probe fails
+	 * after removing the firmware framebuffer (efifb/simpledrm).
+	 */
+	ret = devm_aperture_remove_conflicting_pci_devices(pdev, driver.name);
 	if (ret)
 		goto out_error;
 
@@ -1647,6 +1652,12 @@ static int vmw_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		goto out_unload;
 
+	/*
+	 * Probe succeeded - cancel the automatic sysfb restore action.
+	 * We're now responsible for display output.
+	 */
+	devm_aperture_remove_conflicting_pci_devices_done(pdev);
+
 	vmw_fifo_resource_inc(vmw);
 	vmw_svga_enable(vmw);
 	drm_client_setup(&vmw->drm, NULL);
-- 
2.48.1

