Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4084682A96D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA08F10E82E;
	Thu, 11 Jan 2024 08:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6376510E036;
 Thu, 11 Jan 2024 02:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=y6vDa0DRaabKBySXAU
 ICJ5fEtOO8azvWflhkmAQ8vOg=; b=kCVHS4ptLgNfAVw7b48qFG1QK0YIuxdl3i
 d2YVZZBHOSY84bx32kZzP2kA+wkEXplg4slEypmtkpw5P3+PEftf5VM87zYa4Ajf
 cF1knzLybYQHrPoQzIWYWoopLq0vTaZ2TiegmfK3TqfHSfwklnoGQ8oI4BYy2TEA
 4hAM9qvDA=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g1-2 (Coremail) with SMTP id _____wDnr615TJ9l1gYtAA--.11544S2;
 Thu, 11 Jan 2024 10:03:37 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: alexander.deucher@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 Xinhui.Pan@amd.com, christian.koenig@amd.com
Subject: [PATCH] drm/amd/amdgpu: Clean up errors in amdgpu_umr.h
Date: Thu, 11 Jan 2024 02:03:33 +0000
Message-Id: <20240111020333.5611-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDnr615TJ9l1gYtAA--.11544S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr47ZF1rJw1rAw4ruF45Wrg_yoWfZFc_C3
 yUCa47Xry3XFnIv3W29rWrXr1Dt3WrCFs7Wr1ftasayryxu34UXa4DCry7Xa1I9FnxCF1q
 q3WFgF15Z3ZrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUU5CztUUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiHABixWV2zz4NxQABsQ
X-Mailman-Approved-At: Thu, 11 Jan 2024 08:50:44 +0000
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
Cc: chenxuebing <chenxb_99091@126.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

spaces required around that '=' (ctx:VxV)

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_umr.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_umr.h
index 107f9bb0e24f..5b27fc41ffbf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umr.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umr.h
@@ -69,12 +69,12 @@ struct amdgpu_debugfs_gprwave_data {
 };
 
 enum AMDGPU_DEBUGFS_REGS2_CMDS {
-	AMDGPU_DEBUGFS_REGS2_CMD_SET_STATE=0,
+	AMDGPU_DEBUGFS_REGS2_CMD_SET_STATE = 0,
 	AMDGPU_DEBUGFS_REGS2_CMD_SET_STATE_V2,
 };
 
 enum AMDGPU_DEBUGFS_GPRWAVE_CMDS {
-	AMDGPU_DEBUGFS_GPRWAVE_CMD_SET_STATE=0,
+	AMDGPU_DEBUGFS_GPRWAVE_CMD_SET_STATE = 0,
 };
 
 //reg2 interface
-- 
2.17.1

