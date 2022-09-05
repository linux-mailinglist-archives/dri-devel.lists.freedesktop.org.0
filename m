Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80845ACD2A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 09:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AD410E1F5;
	Mon,  5 Sep 2022 07:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-14.163.com (m12-14.163.com [220.181.12.14])
 by gabe.freedesktop.org (Postfix) with ESMTP id B08F310E1F5;
 Mon,  5 Sep 2022 07:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=PthuW
 4+2T/916gJ0mcWz5BIVJ432LvylOCFS/+qPKNg=; b=bmYeIG18Mz1MxsUfvGV5m
 3y5R8/IKJqPkpoLTuNVO7++3sj6sJXPWjmF4xm51lZQYEbyDzCM3TldFIcKvDG/8
 UKruVWb8VFyoNYSeN4WjXwmJU8z/tdG1vjce0VnP1HUDDy5bC3Eixk89ArNyfBWA
 +8BRDfnwOMwJP0kGtf0txI=
Received: from f00160-VMware-Virtual-Platform.localdomain (unknown
 [1.203.67.201])
 by smtp10 (Coremail) with SMTP id DsCowACXQKmrqxVjsjDjGA--.54890S4;
 Mon, 05 Sep 2022 15:56:45 +0800 (CST)
From: Jingyu Wang <jingyuwang_vip@163.com>
To: Felix.Kuehling@amd.com, lexander.deucher@amd.com, hristian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/amdgpu: cleanup coding style in amdgpu_amdkfd.c
Date: Mon,  5 Sep 2022 15:56:24 +0800
Message-Id: <20220905075624.22979-1-jingyuwang_vip@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsCowACXQKmrqxVjsjDjGA--.54890S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw4UCr48uw4xJw4UXF45trb_yoWfuFc_CF
 W5XF4xury3AFnFvr1ayrW3Zry0yFZ8Zrn5Jr1rtFZaq34Du3yUA3srXrnrXF15Gr1xuF9r
 uw409F45A3ZxCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRt2Nt7UUUUU==
X-Originating-IP: [1.203.67.201]
X-CM-SenderInfo: 5mlqw5xxzd0whbyl1qqrwthudrp/xtbCoBVzF1zmWEfaqAAAsG
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

Fix everything checkpatch.pl complained about in amdgpu_amdkfd.c

Signed-off-by: Jingyu Wang <jingyuwang_vip@163.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index 091415a4abf0..4f5bd96000ec 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright 2014 Advanced Micro Devices, Inc.
  *
@@ -130,6 +131,7 @@ static void amdgpu_amdkfd_reset_work(struct work_struct *work)
 						  kfd.reset_work);
 
 	struct amdgpu_reset_context reset_context;
+
 	memset(&reset_context, 0, sizeof(reset_context));
 
 	reset_context.method = AMD_RESET_METHOD_NONE;

base-commit: e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
-- 
2.34.1

