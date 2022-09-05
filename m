Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 855E75AD932
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 20:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FD510E4A3;
	Mon,  5 Sep 2022 18:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
 by gabe.freedesktop.org (Postfix) with ESMTP id 490B410E4A3;
 Mon,  5 Sep 2022 18:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=K2vPE
 f0lSyt7G87uoDDdgoK3rIluZSXcUDLwneP6uPA=; b=go/iMUZklHjaQMjHOPAgp
 mbFhn0eKAa9BZ/pWomhbYgbq4O/rkQy87CEq4B8TV9V+TmrwIc05CjIo3CBMUi+2
 vb/hJ+QMFuBswNMUvZ6kLOHREX92SOVbyxP3vfQmq4lQ2Mu3WmRm66Zi/M47eZ1o
 6DMdDrm+KzpfZvaWBPmITc=
Received: from f00160-VMware-Virtual-Platform.localdomain (unknown
 [1.203.67.201])
 by smtp9 (Coremail) with SMTP id DcCowACnqqqmQxZjE5AZeg--.29409S4;
 Tue, 06 Sep 2022 02:45:15 +0800 (CST)
From: Jingyu Wang <jingyuwang_vip@163.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, van.quan@amd.com, guchun.chen@amd.com,
 lijo.lazar@amd.com, candice.li@amd.com, mdaenzer@redhat.com,
 Bokun.Zhang@amd.com
Subject: [PATCH] drm/amdgpu: cleanup coding style in amdgpu_kms.c
Date: Tue,  6 Sep 2022 02:44:51 +0800
Message-Id: <20220905184451.27815-1-jingyuwang_vip@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowACnqqqmQxZjE5AZeg--.29409S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxGrW5CFyxZr4DKr1xJrykGrg_yoW5XryDpF
 1fXrW2grWUZr4I9347AFWkZr95Kr17ua47Gr1xu34SqF1qyw1YvFyrCrWUZrWkGFZ7ua1x
 J39rW345Ja4qvr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEnYwUUUUUU=
X-Originating-IP: [1.203.67.201]
X-CM-SenderInfo: 5mlqw5xxzd0whbyl1qqrwthudrp/1tbiyRtzF2I66xpomAAAsv
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

Fix some checkpatch.pl complained about in amdgpu_kms.c

Signed-off-by: Jingyu Wang <jingyuwang_vip@163.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 77668c3dae5b..1f90a096232d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -532,6 +532,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 			crtc = (struct drm_crtc *)minfo->crtcs[i];
 			if (crtc && crtc->base.id == info->mode_crtc.id) {
 				struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
+
 				ui32 = amdgpu_crtc->crtc_id;
 				found = 1;
 				break;
@@ -550,7 +551,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		if (ret)
 			return ret;
 
-		ret = copy_to_user(out, &ip, min((size_t)size, sizeof(ip)));
+		ret = copy_to_user(out, &ip, min_t((size_t)size, sizeof(ip)));
 		return ret ? -EFAULT : 0;
 	}
 	case AMDGPU_INFO_HW_IP_COUNT: {
@@ -696,17 +697,18 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 				    ? -EFAULT : 0;
 	}
 	case AMDGPU_INFO_READ_MMR_REG: {
-		unsigned n, alloc_size;
+		unsigned int n, alloc_size;
 		uint32_t *regs;
-		unsigned se_num = (info->read_mmr_reg.instance >>
+		unsigned int se_num = (info->read_mmr_reg.instance >>
 				   AMDGPU_INFO_MMR_SE_INDEX_SHIFT) &
 				  AMDGPU_INFO_MMR_SE_INDEX_MASK;
-		unsigned sh_num = (info->read_mmr_reg.instance >>
+		unsigned int sh_num = (info->read_mmr_reg.instance >>
 				   AMDGPU_INFO_MMR_SH_INDEX_SHIFT) &
 				  AMDGPU_INFO_MMR_SH_INDEX_MASK;
 
 		/* set full masks if the userspace set all bits
-		 * in the bitfields */
+		 * in the bitfields
+		 */
 		if (se_num == AMDGPU_INFO_MMR_SE_INDEX_MASK)
 			se_num = 0xffffffff;
 		else if (se_num >= AMDGPU_GFX_MAX_SE)
@@ -830,7 +832,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		return ret;
 	}
 	case AMDGPU_INFO_VCE_CLOCK_TABLE: {
-		unsigned i;
+		unsigned int i;
 		struct drm_amdgpu_info_vce_clock_table vce_clk_table = {};
 		struct amd_vce_state *vce_state;
 
@@ -1379,7 +1381,7 @@ static int amdgpu_debugfs_firmware_info_show(struct seq_file *m, void *unused)
 	int ret, i;
 
 	static const char *ta_fw_name[TA_FW_TYPE_MAX_INDEX] = {
-#define TA_FW_NAME(type) [TA_FW_TYPE_PSP_##type] = #type
+#define TA_FW_NAME(type) ([TA_FW_TYPE_PSP_##type] = #type)
 		TA_FW_NAME(XGMI),
 		TA_FW_NAME(RAS),
 		TA_FW_NAME(HDCP),

base-commit: e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
-- 
2.34.1

