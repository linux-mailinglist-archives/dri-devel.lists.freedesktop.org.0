Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 804B96A9672
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 12:36:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912CC10E10F;
	Fri,  3 Mar 2023 11:35:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DBEF10E10F;
 Fri,  3 Mar 2023 11:35:49 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 y15-20020a17090aa40f00b00237ad8ee3a0so1972589pjp.2; 
 Fri, 03 Mar 2023 03:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677843348;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=29OzWpxyOz2YKbe7gk+wlUnvCGzWDi9lW+7/pophrnY=;
 b=UXsv+zvJpY9npxxDaimqGLy6Jst1fhPTP8qDTyYqL5k8VsJK6RCu/FDuoLjqaptlTW
 vDQ56LfI4SzRu6KWj0WwhuIzvIbcKRYeNV5ySrzG77VGflvocShjGwEdarhNyUfEY0IY
 1WCjtxBYwmHAqHTua6ekv1ho1Kp1OYTgvIoFqT3ZL8XbvQkMbJ4GH5x7SAvtVl40nXnT
 vHp19aimeOozvuCJWppH6cyyPsiBdUK2GXCNE0UcSjKAvz1AMPxVyvHJ5+GGH/q+3Z3/
 sWF/lvIXxsdXSFukVTCVzW6i3xuUqlGrXDas780jw30i675/Vl6yrknmAZmKhJPgUuCR
 Ib5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677843348;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=29OzWpxyOz2YKbe7gk+wlUnvCGzWDi9lW+7/pophrnY=;
 b=77PWHyLu48bihbeCRhRqBI1aFN1+jgRRMUDY0trFlHSPQFPIWZx2VQqHYcFGKY73Xe
 q1IIKFdXRD5ePhzIB6SVl4OUOvcbBsRaCMAs6Ew5QMPojTxoQWMlXoqKNHb+d8+uGJRZ
 MoambjSm7/sCbGUrCba74RjMExvz5R9a6XW6k1V3iOQncYuJQciVBkj5mcKPyZJKBHT4
 9+73QWpNCy/IVBARes8zet5scYVChS4fHBNNIHhQBT2nLe6l0Eezm07lK9DTSHWwTXVZ
 nEGoobibwNQyRuTJtvGc6/24Qcm580fCNOVxs9GYuyf8tFc7jTrN2aaqkXsdXDkc798u
 epJw==
X-Gm-Message-State: AO0yUKUoEQstTRS4nhglqXVSVLGkQNOtzaVGaXRYjfNceqdyS09Oxqkm
 xahVM7sLuwNx5sbaBW0ebJLAU5TBqIQ=
X-Google-Smtp-Source: AK7set++BCkVpQ27OESBIxlcacoRVz6Aj+XkJCD7OJ1vEPatpzdcaaEL/yM+9LCNECISm5A4drmRzw==
X-Received: by 2002:a17:903:32cf:b0:19a:8e52:ce0 with SMTP id
 i15-20020a17090332cf00b0019a8e520ce0mr2187517plr.58.1677843348598; 
 Fri, 03 Mar 2023 03:35:48 -0800 (PST)
Received: from localhost.localdomain (124-148-239-17.tpgi.com.au.
 [124.148.239.17]) by smtp.gmail.com with ESMTPSA id
 jz6-20020a170903430600b0019ab3308554sm1316798plb.85.2023.03.03.03.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 03:35:48 -0800 (PST)
From: Orlando Chamberlain <orlandoch.dev@gmail.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 RESEND] drm/amdgpu: register a vga_switcheroo client for
 MacBooks with apple-gmux
Date: Fri,  3 Mar 2023 22:34:25 +1100
Message-Id: <20230303113423.3819-1-orlandoch.dev@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Aun-Ali Zaidi <admin@kodeit.net>, Kerem Karabay <kekrby@gmail.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Aditya Garg <gargaditya08@live.com>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Orlando Chamberlain <orlandoch.dev@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 3840c5bcc245 ("drm/amdgpu: disentangle runtime pm and
vga_switcheroo") made amdgpu only register a vga_switcheroo client for
GPU's with PX, however AMD GPUs in dual gpu Apple Macbooks do need to
register, but don't have PX. Instead of AMD's PX, they use apple-gmux.

Use apple_gmux_detect() to identify these gpus, and
pci_is_thunderbolt_attached() to ensure eGPUs connected to Dual GPU
Macbooks don't register with vga_switcheroo.

Fixes: 3840c5bcc245 ("drm/amdgpu: disentangle runtime pm and vga_switcheroo")
Link: https://lore.kernel.org/amd-gfx/20230210044826.9834-10-orlandoch.dev@gmail.com/
Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
---
v1->v2: Use apple_gmux_detect()
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 2f28a8c02f64..ef8b996f0622 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -35,6 +35,7 @@
 #include <linux/devcoredump.h>
 #include <generated/utsrelease.h>
 #include <linux/pci-p2pdma.h>
+#include <linux/apple-gmux.h>
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
@@ -3919,12 +3920,15 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
 		vga_client_register(adev->pdev, amdgpu_device_vga_set_decode);
 
-	if (amdgpu_device_supports_px(ddev)) {
-		px = true;
+	px = amdgpu_device_supports_px(ddev);
+
+	if (px || (!pci_is_thunderbolt_attached(adev->pdev) &&
+				apple_gmux_detect(NULL, NULL)))
 		vga_switcheroo_register_client(adev->pdev,
 					       &amdgpu_switcheroo_ops, px);
+
+	if (px)
 		vga_switcheroo_init_domain_pm_ops(adev->dev, &adev->vga_pm_domain);
-	}
 
 	if (adev->gmc.xgmi.pending_reset)
 		queue_delayed_work(system_wq, &mgpu_info.delayed_reset_work,
@@ -4029,6 +4033,7 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 void amdgpu_device_fini_sw(struct amdgpu_device *adev)
 {
 	int idx;
+	bool px;
 
 	amdgpu_fence_driver_sw_fini(adev);
 	amdgpu_device_ip_fini(adev);
@@ -4048,10 +4053,16 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
 
 	kfree(adev->bios);
 	adev->bios = NULL;
-	if (amdgpu_device_supports_px(adev_to_drm(adev))) {
+
+	px = amdgpu_device_supports_px(adev_to_drm(adev));
+
+	if (px || (!pci_is_thunderbolt_attached(adev->pdev) &&
+				apple_gmux_detect(NULL, NULL)))
 		vga_switcheroo_unregister_client(adev->pdev);
+
+	if (px)
 		vga_switcheroo_fini_domain_pm_ops(adev->dev);
-	}
+
 	if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
 		vga_client_unregister(adev->pdev);
 
-- 
2.39.1

