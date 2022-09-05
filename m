Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 101335ACA91
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 08:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C0E10E165;
	Mon,  5 Sep 2022 06:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-16.163.com (m12-16.163.com [220.181.12.16])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4F39010E172;
 Mon,  5 Sep 2022 01:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=0UuRi
 XnqG0+tWCBmLnMTBzneooWmRUaaLB3aIEKok50=; b=B/g2VYj4DClm3qOwnvLq7
 tOxL++OAJdWE7KTFeqsCUVEYo46j2OWmSurWdTy0WBh2+zmzZuakLA1yF0F8poZ8
 kfLoUppQgkPl4walQsJpDc5a8B7kq8SDHmbVTKEjph5kS+88Nb/hC5bplaMdMDkL
 xmLVDdRtEcBdQL2Zk+hnG0=
Received: from f00160-VMware-Virtual-Platform.localdomain (unknown
 [1.203.67.201])
 by smtp12 (Coremail) with SMTP id EMCowAAncaJ8TRVj3hDsJg--.51831S4;
 Mon, 05 Sep 2022 09:14:54 +0800 (CST)
From: Jingyu Wang <jingyuwang_vip@163.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, mario.limonciello@amd.com,
 hdegoede@redhat.com, rafael.j.wysocki@intel.com
Subject: [PATCH] drm/amdgpu: cleanup coding style in amdgpu_acpi.c
Date: Mon,  5 Sep 2022 09:14:31 +0800
Message-Id: <20220905011431.19818-1-jingyuwang_vip@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EMCowAAncaJ8TRVj3hDsJg--.51831S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7trykur48Xw1rZrWUJrWrKrg_yoW8uF4fpF
 ySqr1Fkry5uF12vFyjyFy8ZFn0yw4I934xWFWxZ34ag3W5ZFyrJa48Cw4Uur97JrZxua1x
 JFZrJ3yUuF4jvw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEsXonUUUUU=
X-Originating-IP: [1.203.67.201]
X-CM-SenderInfo: 5mlqw5xxzd0whbyl1qqrwthudrp/xtbCoAdzF1zmWEIQ-gAAsN
X-Mailman-Approved-At: Mon, 05 Sep 2022 06:28:39 +0000
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
Cc: Jingyu Wang <jingyuwang_vip@163.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix everything checkpatch.pl complained about in amdgpu_acpi.c

Signed-off-by: Jingyu Wang <jingyuwang_vip@163.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index 55402d238919..3da27436922c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright 2012 Advanced Micro Devices, Inc.
  *
@@ -849,6 +850,7 @@ int amdgpu_acpi_init(struct amdgpu_device *adev)
 		if (amdgpu_device_has_dc_support(adev)) {
 #if defined(CONFIG_DRM_AMD_DC)
 			struct amdgpu_display_manager *dm = &adev->dm;
+
 			if (dm->backlight_dev[0])
 				atif->bd = dm->backlight_dev[0];
 #endif
@@ -863,6 +865,7 @@ int amdgpu_acpi_init(struct amdgpu_device *adev)
 				if ((enc->devices & (ATOM_DEVICE_LCD_SUPPORT)) &&
 				    enc->enc_priv) {
 					struct amdgpu_encoder_atom_dig *dig = enc->enc_priv;
+
 					if (dig->bl_dev) {
 						atif->bd = dig->bl_dev;
 						break;
@@ -919,9 +922,9 @@ static bool amdgpu_atif_pci_probe_handle(struct pci_dev *pdev)
 		return false;
 
 	status = acpi_get_handle(dhandle, "ATIF", &atif_handle);
-	if (ACPI_FAILURE(status)) {
+	if (ACPI_FAILURE(status))
 		return false;
-	}
+
 	amdgpu_acpi_priv.atif.handle = atif_handle;
 	acpi_get_name(amdgpu_acpi_priv.atif.handle, ACPI_FULL_PATHNAME, &buffer);
 	DRM_DEBUG_DRIVER("Found ATIF handle %s\n", acpi_method_name);
@@ -954,9 +957,9 @@ static bool amdgpu_atcs_pci_probe_handle(struct pci_dev *pdev)
 		return false;
 
 	status = acpi_get_handle(dhandle, "ATCS", &atcs_handle);
-	if (ACPI_FAILURE(status)) {
+	if (ACPI_FAILURE(status))
 		return false;
-	}
+
 	amdgpu_acpi_priv.atcs.handle = atcs_handle;
 	acpi_get_name(amdgpu_acpi_priv.atcs.handle, ACPI_FULL_PATHNAME, &buffer);
 	DRM_DEBUG_DRIVER("Found ATCS handle %s\n", acpi_method_name);

base-commit: e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
-- 
2.34.1

