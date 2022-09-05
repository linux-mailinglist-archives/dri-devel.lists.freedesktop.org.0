Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACBE5ACA98
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 08:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CC510E177;
	Mon,  5 Sep 2022 06:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-18.163.com (m12-18.163.com [220.181.12.18])
 by gabe.freedesktop.org (Postfix) with ESMTP id B24F710E295;
 Mon,  5 Sep 2022 00:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=z9nvn
 N5LMXDX8a7aP7btkSJDO5Ia4gaMEc/3ABW2E00=; b=FS6u3Ge7xHS2IfIB+2/4z
 8u2tAV9kKJ37xsM2vPouNbmE1kRNxkCR9JzoHBVCUpmQqb8pNDaUxhCaolQqPEPD
 hqeAT8RC2I557koy2doGFXTb9AXtBtnuU4iwZyFK2Ec2Pq3nqgUoYfLpMtlWPwdS
 eUFKJrdpavAb3+HjZQ8XBU=
Received: from f00160-VMware-Virtual-Platform.localdomain (unknown
 [1.203.67.201])
 by smtp14 (Coremail) with SMTP id EsCowAD3c1mQSBVjtUhLDw--.19175S4;
 Mon, 05 Sep 2022 08:54:51 +0800 (CST)
From: Jingyu Wang <jingyuwang_vip@163.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, isabbasso@riseup.net,
 Rodrigo.Siqueira@amd.com
Subject: [PATCH] drm/amdgpu: cleanup coding style in amdgpu_atpx_handler.c
Date: Mon,  5 Sep 2022 08:53:29 +0800
Message-Id: <20220905005329.19501-1-jingyuwang_vip@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EsCowAD3c1mQSBVjtUhLDw--.19175S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxJF13CrWrCF17ArWkJFWrXwb_yoW5tF17pF
 WSgr97tr1rZw18AFykAr4DZF1Ykws7ZFyUG3yDZ34Y9w4UJr1rJ348ta4jyrn5CrW7CFsa
 vFZxXa45Aa9FyF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEVc_7UUUUU=
X-Originating-IP: [1.203.67.201]
X-CM-SenderInfo: 5mlqw5xxzd0whbyl1qqrwthudrp/1tbiyRtzF2I66w2tygAAsv
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

Fix everything checkpatch.pl complained about in amdgpu_atpx_handler.c

Signed-off-by: Jingyu Wang <jingyuwang_vip@163.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c  | 27 +++++++++++--------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c
index d6d986be906a..911d6a130ec5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c
@@ -74,24 +74,29 @@ struct atpx_mux {
 	u16 mux;
 } __packed;
 
-bool amdgpu_has_atpx(void) {
+bool amdgpu_has_atpx(void)
+{
 	return amdgpu_atpx_priv.atpx_detected;
 }
 
-bool amdgpu_has_atpx_dgpu_power_cntl(void) {
+bool amdgpu_has_atpx_dgpu_power_cntl(void)
+{
 	return amdgpu_atpx_priv.atpx.functions.power_cntl;
 }
 
-bool amdgpu_is_atpx_hybrid(void) {
+bool amdgpu_is_atpx_hybrid(void)
+{
 	return amdgpu_atpx_priv.atpx.is_hybrid;
 }
 
-bool amdgpu_atpx_dgpu_req_power_for_displays(void) {
+bool amdgpu_atpx_dgpu_req_power_for_displays(void)
+{
 	return amdgpu_atpx_priv.atpx.dgpu_req_power_for_displays;
 }
 
 #if defined(CONFIG_ACPI)
-void *amdgpu_atpx_get_dhandle(void) {
+void *amdgpu_atpx_get_dhandle(void)
+{
 	return amdgpu_atpx_priv.dhandle;
 }
 #endif
@@ -134,7 +139,7 @@ static union acpi_object *amdgpu_atpx_call(acpi_handle handle, int function,
 
 	/* Fail only if calling the method fails and ATPX is supported */
 	if (ACPI_FAILURE(status) && status != AE_NOT_FOUND) {
-		printk("failed to evaluate ATPX got %s\n",
+		DRM_WARN("failed to evaluate ATPX got %s\n",
 		       acpi_format_exception(status));
 		kfree(buffer.pointer);
 		return NULL;
@@ -190,7 +195,7 @@ static int amdgpu_atpx_validate(struct amdgpu_atpx *atpx)
 
 		size = *(u16 *) info->buffer.pointer;
 		if (size < 10) {
-			printk("ATPX buffer is too small: %zu\n", size);
+			DRM_WARN("ATPX buffer is too small: %zu\n", size);
 			kfree(info);
 			return -EINVAL;
 		}
@@ -223,11 +228,11 @@ static int amdgpu_atpx_validate(struct amdgpu_atpx *atpx)
 	atpx->is_hybrid = false;
 	if (valid_bits & ATPX_MS_HYBRID_GFX_SUPPORTED) {
 		if (amdgpu_atpx_priv.quirks & AMDGPU_PX_QUIRK_FORCE_ATPX) {
-			printk("ATPX Hybrid Graphics, forcing to ATPX\n");
+			DRM_WARN("ATPX Hybrid Graphics, forcing to ATPX\n");
 			atpx->functions.power_cntl = true;
 			atpx->is_hybrid = false;
 		} else {
-			printk("ATPX Hybrid Graphics\n");
+			DRM_WARN("ATPX Hybrid Graphics\n");
 			/*
 			 * Disable legacy PM methods only when pcie port PM is usable,
 			 * otherwise the device might fail to power off or power on.
@@ -269,7 +274,7 @@ static int amdgpu_atpx_verify_interface(struct amdgpu_atpx *atpx)
 
 	size = *(u16 *) info->buffer.pointer;
 	if (size < 8) {
-		printk("ATPX buffer is too small: %zu\n", size);
+		DRM_WARN("ATPX buffer is too small: %zu\n", size);
 		err = -EINVAL;
 		goto out;
 	}
@@ -278,7 +283,7 @@ static int amdgpu_atpx_verify_interface(struct amdgpu_atpx *atpx)
 	memcpy(&output, info->buffer.pointer, size);
 
 	/* TODO: check version? */
-	printk("ATPX version %u, functions 0x%08x\n",
+	DRM_WARN("ATPX version %u, functions 0x%08x\n",
 	       output.version, output.function_bits);
 
 	amdgpu_atpx_parse_functions(&atpx->functions, output.function_bits);

base-commit: e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
-- 
2.34.1

