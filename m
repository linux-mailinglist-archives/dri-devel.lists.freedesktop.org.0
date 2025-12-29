Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50655CE8446
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 23:05:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF6210E731;
	Mon, 29 Dec 2025 22:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="I6GT8Q21";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com
 [209.85.214.226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68E510E731
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 22:05:08 +0000 (UTC)
Received: by mail-pl1-f226.google.com with SMTP id
 d9443c01a7336-2a0d0788adaso84608905ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 14:05:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767045908; x=1767650708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VopAtg5cwECNDVQxgLsoKH79OtjRDL2VW4PpyQapOpE=;
 b=HdkCvDxJqjM/D311uFHljolZlSgpAMJO7AcZGtX+1BdRUq+pdxhZuUN1TF2xfsIKOp
 CUncVSdojra0mnJd+HLxvKVvSNDQ4/iCE+WYh6T7NzfB6wWl/PPz+EGZoqJnPONgWhTq
 4YRvww+62/5/rESi7GnzgS6k+phX0ucVyrml+RcrTdGnVpNmT/hz+CTP9lx5FUNvfkJo
 I3vWS9RpAyOR2ID+XDDpZtxo2ZUAa8a0B1teZcXREdKF1WWf/ykwF7qu8u4GEWwzN3Ef
 6bSc5JhNGr6Jvrum7RYkKZWT/HONOTCaQf/Pa7CBTRhXXfURXcdU/jdAI92ivGzEzBbU
 SUcg==
X-Gm-Message-State: AOJu0YycF0TbZZNXPQBwlX67OCtHwEHfdzLWQnnti7H1w15MlRMXDukf
 p5si1gcipYzPIYbtDVZkmm8fD1McHvHp2x1JcB+JQAKsTqO2jY5DJVGF5pYaFgRnNR6Kt+j0W/U
 z8CMTIrd1JlRIVVNBD47HGQSREm7UUxu6swQShx0+klJGB6eJFM8X0pqt5MbjVN3sIoSVfp0O6p
 O8z3pZNGgvtWeLT/ISCQAvb864hIQTHeJd5YbkhS/ElP8LT2d9chBfDOv4hp3Tm0s5DPQQVQGQl
 gY2f5oF3aHjj+bCiWGD
X-Gm-Gg: AY/fxX5e6vamh7OWyahCpBPDRl+Iw9evX5NaVW6HfxNDc64GLcBQBx3P8UyM3/jNXAv
 PcPGG67MKZAywzu11/hRSGQ9Hx4HunpLSMR5MU1/lFfAyz6X50KSd3yrMmnqz55t1lyQ0TAv7V2
 uiAtZXj99yXawLj7S+d2kGIwieUzkJulOfmN+NDeAQqlMqpZSGLWMSmVCfvhJj9+zrBjynjHiOd
 6xBNCSlnCZXBLEjduYmbG1FC3+LPvjj+YoQHQyzWd6o+/BqfUxpoqZeO0PA0OIBKduumFLqCWww
 edLL05PrzjWx49RmOByIIhmLROek9bX4PIVcamKX9wF42IiTpKekvwoi8tWJMKxSzK3CrdPaal+
 2gf2DPIS0itXMLnDMYu8bXP9TAXmnL7EpUl0RLkckT8GnWoBfP8eCk42QP4dIvenhSnIbM3StKz
 KKo3FAUC9b8nWQX5G6Rztbm0+CrkMFLoCluY0/nwqBzltH
X-Google-Smtp-Source: AGHT+IHc6aU50O28bnM5kmskuvFqzsxG2N1a1dcAOkJfv+DTmrC1RQNRWTaKGwzCjyaiUv/ALTb5SAKyG+pp
X-Received: by 2002:a17:903:2985:b0:29f:2734:6ffb with SMTP id
 d9443c01a7336-2a2f222bfbbmr334271305ad.22.1767045908310; 
 Mon, 29 Dec 2025 14:05:08 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
 by smtp-relay.gmail.com with ESMTPS id
 d9443c01a7336-2a2f3d5625bsm33768395ad.46.2025.12.29.14.05.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Dec 2025 14:05:08 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88a3356a310so266388166d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 14:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1767045906; x=1767650706;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VopAtg5cwECNDVQxgLsoKH79OtjRDL2VW4PpyQapOpE=;
 b=I6GT8Q215aZ1Q0pg5UQAWsB8tUGxZoreKI1n7DlMRlky26Brc4ZOlbX9i2HzSxl/tl
 J5TnJUWVt0NHdocz+IA9+uiXTJaybhIcmZXl01cvWw1On7iUrz3BmFx/I/u58KC7DWjB
 61RqvTWgmVZUiwRmCNOH2QDmZ6ulDBRHHnbtk=
X-Received: by 2002:a05:6214:252a:b0:87c:2967:fd32 with SMTP id
 6a1803df08f44-88d8281226bmr511303496d6.22.1767045562072; 
 Mon, 29 Dec 2025 13:59:22 -0800 (PST)
X-Received: by 2002:a05:6214:252a:b0:87c:2967:fd32 with SMTP id
 6a1803df08f44-88d8281226bmr511303186d6.22.1767045561579; 
 Mon, 29 Dec 2025 13:59:21 -0800 (PST)
Received: from localhost.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88d9759f164sm231530026d6.24.2025.12.29.13.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 13:59:19 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Ce Sun <cesun102@amd.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 04/12] drm/amdgpu: Use devm aperture helpers for sysfb restore
 on probe failure
Date: Mon, 29 Dec 2025 16:58:10 -0500
Message-ID: <20251229215906.3688205-5-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251229215906.3688205-1-zack.rusin@broadcom.com>
References: <20251229215906.3688205-1-zack.rusin@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The aperture removal only applies to VGA and display class devices,
matching the existing behavior. This ensures users don't lose
display output if the amdgpu driver fails to probe after removing
the firmware framebuffer.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Lijo Lazar <lijo.lazar@amd.com>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Ce Sun <cesun102@amd.com>
Cc: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: "Timur Kristóf" <timur.kristof@gmail.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 9 +++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 7 +++++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 58c3ffe707d1..6c867657225e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4737,8 +4737,13 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	 */
 	if ((pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA ||
 	    (pdev->class >> 8) == PCI_CLASS_DISPLAY_OTHER) {
-		/* Get rid of things like offb */
-		r = aperture_remove_conflicting_pci_devices(adev->pdev, amdgpu_kms_driver.name);
+		/*
+		 * Get rid of things like offb. Use devm variant to
+		 * automatically restore sysfb if probe fails. This ensures
+		 * the user doesn't lose display if our probe fails after
+		 * removing the firmware framebuffer (efifb/simpledrm).
+		 */
+		r = devm_aperture_remove_conflicting_pci_devices(adev->pdev, amdgpu_kms_driver.name);
 		if (r)
 			return r;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 2dfbddcef9ab..fc2d2dbaebe8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -32,6 +32,7 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
+#include <linux/aperture.h>
 #include <linux/cc_platform.h>
 #include <linux/dynamic_debug.h>
 #include <linux/module.h>
@@ -2528,6 +2529,12 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 			amdgpu_get_secondary_funcs(adev);
 	}
 
+	/*
+	 * Probe succeeded - cancel the automatic sysfb restore action.
+	 * We're now responsible for display output.
+	 */
+	devm_aperture_remove_conflicting_pci_devices_done(pdev);
+
 	return 0;
 
 err_pci:
-- 
2.48.1

