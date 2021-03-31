Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE14F350557
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 19:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B77A6EB26;
	Wed, 31 Mar 2021 17:22:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m121143.qiye.163.com (mail-m121143.qiye.163.com
 [115.236.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A4E6EA9B
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 13:21:12 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [36.152.145.181])
 by mail-m121143.qiye.163.com (Hmail) with ESMTPA id 251AD5402E5;
 Wed, 31 Mar 2021 21:11:52 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Luben Tuikov <luben.tuikov@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Deepak R Varma <mh12gx2825@gmail.com>, Evan Quan <evan.quan@amd.com>,
 Likun Gao <Likun.Gao@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] amd/amdgpu: code refactoring to clean code style a bit
Date: Wed, 31 Mar 2021 06:11:36 -0700
Message-Id: <20210331131143.60652-1-bernard@vivo.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZT05MHxgaGEgYTE8ZVkpNSkxKQk1ISklOTU1VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OjY6Nxw6SD8IPDUyTigMNBcK
 M1ZPCR1VSlVKTUpMSkJNSEpJQ05NVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlITVVK
 TklVSk9OVUpDSllXWQgBWUFNSUxONwY+
X-HM-Tid: 0a78886967bfb038kuuu251ad5402e5
X-Mailman-Approved-At: Wed, 31 Mar 2021 17:21:40 +0000
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix checkpatch.pl warning:
Too many leading tabs - consider code refactoring
WARNING: Too many leading tabs - consider code refactoring
+                                               for (j = 0; j < profile->ucLeakageBinNum; j++) {

WARNING: Too many leading tabs - consider code refactoring
+                                                       if (vbios_voltage_id <= leakage_bin[j]) {

WARNING: Too many leading tabs - consider code refactoring
+                                               for (j = 0; j < profile->ucLeakageBinNum; j++) {

WARNING: Too many leading tabs - consider code refactoring
+                                                       if (vbios_voltage_id <= leakage_bin[j]) {

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c | 84 ++++++++------------
 1 file changed, 35 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
index 86add0f4ea4d..9968ff8ddc9c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
@@ -1283,65 +1283,51 @@ int amdgpu_atombios_get_leakage_vddc_based_on_leakage_params(struct amdgpu_devic
 	profile = (ATOM_ASIC_PROFILING_INFO_V2_1 *)
 		(adev->mode_info.atom_context->bios + data_offset);
 
-	switch (frev) {
-	case 1:
+	if ((frev != 2) || (crev != 1)) {
+		DRM_ERROR("Unknown table version %d, %d\n", frev, crev);
 		return -EINVAL;
-	case 2:
-		switch (crev) {
-		case 1:
-			if (size < sizeof(ATOM_ASIC_PROFILING_INFO_V2_1))
-				return -EINVAL;
-			leakage_bin = (u16 *)
-				(adev->mode_info.atom_context->bios + data_offset +
-				 le16_to_cpu(profile->usLeakageBinArrayOffset));
-			vddc_id_buf = (u16 *)
-				(adev->mode_info.atom_context->bios + data_offset +
-				 le16_to_cpu(profile->usElbVDDC_IdArrayOffset));
-			vddc_buf = (u16 *)
-				(adev->mode_info.atom_context->bios + data_offset +
-				 le16_to_cpu(profile->usElbVDDC_LevelArrayOffset));
-			vddci_id_buf = (u16 *)
-				(adev->mode_info.atom_context->bios + data_offset +
-				 le16_to_cpu(profile->usElbVDDCI_IdArrayOffset));
-			vddci_buf = (u16 *)
-				(adev->mode_info.atom_context->bios + data_offset +
-				 le16_to_cpu(profile->usElbVDDCI_LevelArrayOffset));
-
-			if (profile->ucElbVDDC_Num > 0) {
-				for (i = 0; i < profile->ucElbVDDC_Num; i++) {
-					if (vddc_id_buf[i] == virtual_voltage_id) {
-						for (j = 0; j < profile->ucLeakageBinNum; j++) {
-							if (vbios_voltage_id <= leakage_bin[j]) {
-								*vddc = vddc_buf[j * profile->ucElbVDDC_Num + i];
-								break;
-							}
-						}
+	}
+
+	if (size < sizeof(ATOM_ASIC_PROFILING_INFO_V2_1))
+		return -EINVAL;
+
+	leakage_bin = (u16 *)(adev->mode_info.atom_context->bios + data_offset +
+		 le16_to_cpu(profile->usLeakageBinArrayOffset));
+	vddc_id_buf = (u16 *)(adev->mode_info.atom_context->bios + data_offset +
+		 le16_to_cpu(profile->usElbVDDC_IdArrayOffset));
+	vddc_buf = (u16 *)(adev->mode_info.atom_context->bios + data_offset +
+		 le16_to_cpu(profile->usElbVDDC_LevelArrayOffset));
+	vddci_id_buf = (u16 *)(adev->mode_info.atom_context->bios + data_offset +
+		 le16_to_cpu(profile->usElbVDDCI_IdArrayOffset));
+	vddci_buf = (u16 *)(adev->mode_info.atom_context->bios + data_offset +
+		 le16_to_cpu(profile->usElbVDDCI_LevelArrayOffset));
+
+	if (profile->ucElbVDDC_Num > 0) {
+		for (i = 0; i < profile->ucElbVDDC_Num; i++) {
+			if (vddc_id_buf[i] == virtual_voltage_id) {
+				for (j = 0; j < profile->ucLeakageBinNum; j++) {
+					if (vbios_voltage_id <= leakage_bin[j]) {
+						*vddc = vddc_buf[j * profile->ucElbVDDC_Num + i];
 						break;
 					}
 				}
+				break;
 			}
-			if (profile->ucElbVDDCI_Num > 0) {
-				for (i = 0; i < profile->ucElbVDDCI_Num; i++) {
-					if (vddci_id_buf[i] == virtual_voltage_id) {
-						for (j = 0; j < profile->ucLeakageBinNum; j++) {
-							if (vbios_voltage_id <= leakage_bin[j]) {
-								*vddci = vddci_buf[j * profile->ucElbVDDCI_Num + i];
-								break;
-							}
-						}
+		}
+	}
+
+	if (profile->ucElbVDDCI_Num > 0) {
+		for (i = 0; i < profile->ucElbVDDCI_Num; i++) {
+			if (vddci_id_buf[i] == virtual_voltage_id) {
+				for (j = 0; j < profile->ucLeakageBinNum; j++) {
+					if (vbios_voltage_id <= leakage_bin[j]) {
+						*vddci = vddci_buf[j * profile->ucElbVDDCI_Num + i];
 						break;
 					}
 				}
+				break;
 			}
-			break;
-		default:
-			DRM_ERROR("Unknown table version %d, %d\n", frev, crev);
-			return -EINVAL;
 		}
-		break;
-	default:
-		DRM_ERROR("Unknown table version %d, %d\n", frev, crev);
-		return -EINVAL;
 	}
 
 	return 0;
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
