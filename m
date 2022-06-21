Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC467554279
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 07:53:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B101138A0;
	Wed, 22 Jun 2022 05:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg.qq.com (smtpbg136.qq.com [106.55.201.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E59710F037;
 Tue, 21 Jun 2022 13:12:18 +0000 (UTC)
X-QQ-mid: bizesmtp73t1655817049tyyeozl4
Received: from ubuntu.localdomain ( [106.117.99.68])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 21 Jun 2022 21:10:43 +0800 (CST)
X-QQ-SSF: 0100000000700050B000B00A0000000
X-QQ-FEAT: EHEARuS8QZiTHpJYUDEzFwrWd9czPiu7c3XFvsY7+sI3PyOSjbTnrJJit0iwL
 iTugaNOWJGRNor8dmChnlRslGSL6oFaCySOeb2ozrzRNAff+yP8+C29VTPH8vgVfsmZEEwI
 hrtz/EVarHA3uMuNfcJBYLnTDQLkr0eT0rh2veDifPe5aagLAtT9ETvh7aLzxgme+iDkX4N
 QjhjAN9O56j6V0De+JAStAfMQvlLpMfgcIjBJyzRnUAVqWhldroo+XMXpo8tO+yXQlmMNPn
 X4HPhMw2N+sJDBadDEtipjswL/bT9BbaHrcuZZ4/HJv+tRgelT2sVnNUyUDjYty5Nm7QwcL
 gv82qiwnyE4tSN21YOU+CRjtXUAWA==
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/amdgpu: vm - drop unexpected word "the" in the comments
Date: Tue, 21 Jun 2022 21:10:41 +0800
Message-Id: <20220621131041.129513-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam7
X-Mailman-Approved-At: Wed, 22 Jun 2022 05:52:39 +0000
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
Cc: Philip.Yang@amd.com, qiang.yu@amd.com, Felix.Kuehling@amd.com,
 Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, JinhuiEric.Huang@amd.com,
 Jiang Jian <jiangjian@cdjrlc.com>, nirmoy.das@amd.com,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

there is an unexpected word "the" in the comments that need to be dropped

file: drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
line: 57
  * the kernel tells the the ring what VMID to use for that command
changed to
  * the kernel tells the ring what VMID to use for that command

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index dc76d2b3ce52..8530befb2051 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -54,7 +54,7 @@
  * (uncached system pages).
  * Each VM has an ID associated with it and there is a page table
  * associated with each VMID.  When executing a command buffer,
- * the kernel tells the the ring what VMID to use for that command
+ * the kernel tells the ring what VMID to use for that command
  * buffer.  VMIDs are allocated dynamically as commands are submitted.
  * The userspace drivers maintain their own address space and the kernel
  * sets up their pages tables accordingly when they submit their
-- 
2.17.1

