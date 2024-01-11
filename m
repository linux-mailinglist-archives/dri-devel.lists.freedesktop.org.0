Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 117E082A969
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321D710E81C;
	Thu, 11 Jan 2024 08:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.8])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7064510E070;
 Thu, 11 Jan 2024 02:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=KdUUDYvSzX2aLBBWbi
 3BCMON0RRUsN174eNH7Lp4JK0=; b=cn7doCYFRxr534/ey/5uDuSuNBHqLewubb
 bid7TNG+MZW0pQxURW6BG20IiJAO3QgHHWqqsp1j3OVM1egv+3Rx3fuSxAoBULm4
 rvZOyT4oSmL4s3OpHw8mXlc3JCgJl228SeVHOiKICQyEm3dWBzL/fXFPLObOMniU
 7YsX8oXaE=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-1 (Coremail) with SMTP id _____wD3_+lmTp9lDlacAA--.16717S2;
 Thu, 11 Jan 2024 10:11:51 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: alexander.deucher@amd.com, airlied@gmail.com, Xinhui.Pan@amd.com,
 christian.koenig@amd.com, daniel@ffwll.ch
Subject: [PATCH] drm/amd: Clean up errors in amdgpu_vkms.c
Date: Thu, 11 Jan 2024 02:11:48 +0000
Message-Id: <20240111021148.5883-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3_+lmTp9lDlacAA--.16717S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFWDZrWxuFW8uFW5Jw4DCFg_yoWfWFX_C3
 yUXr4kWr43JF1qvr1UZr4rZ3yvy3W5CF4kWrySqanavry7ZayYqayDuryUXa1ruF4xW3Zx
 Xr1vgF13AasxCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUnXo7UUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiGAdixWVLZWKsDgAAsz
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, chenxuebing <chenxb_99091@126.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: that open brace { should be on the previous line

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index 453a4b786cfc..8baa2e0935cc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -660,8 +660,7 @@ static const struct amd_ip_funcs amdgpu_vkms_ip_funcs = {
 	.set_powergating_state = amdgpu_vkms_set_powergating_state,
 };
 
-const struct amdgpu_ip_block_version amdgpu_vkms_ip_block =
-{
+const struct amdgpu_ip_block_version amdgpu_vkms_ip_block = {
 	.type = AMD_IP_BLOCK_TYPE_DCE,
 	.major = 1,
 	.minor = 0,
-- 
2.17.1

