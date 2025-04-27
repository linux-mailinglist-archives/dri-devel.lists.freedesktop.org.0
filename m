Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DAEA9E245
	for <lists+dri-devel@lfdr.de>; Sun, 27 Apr 2025 11:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B4310E188;
	Sun, 27 Apr 2025 09:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 402 seconds by postgrey-1.36 at gabe;
 Sun, 27 Apr 2025 04:20:40 UTC
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0421310E044;
 Sun, 27 Apr 2025 04:20:40 +0000 (UTC)
Received: from mxde.zte.com.cn (unknown [10.35.20.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZlY9X639czKhp;
 Sun, 27 Apr 2025 12:13:52 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxde.zte.com.cn (FangMail) with ESMTPS id 4ZlY9S24RwzBRHKJ;
 Sun, 27 Apr 2025 12:13:48 +0800 (CST)
Received: from mse-db.zte.com.cn (unknown [10.5.228.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZlY981t3Vz5B1KR;
 Sun, 27 Apr 2025 12:13:32 +0800 (CST)
Received: (from root@localhost) by mse-db.zte.com.cn id 53R4DUco001600;
 Sun, 27 Apr 2025 12:13:30 +0800 (+08)
 (envelope-from liu.song13@zte.com.cn)
Message-Id: <202504270413.53R4DUco001600@mse-db.zte.com.cn>
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
 by mse-fl2.zte.com.cn with SMTP id 53R1P9Pd083371;
 Sun, 27 Apr 2025 09:25:09 +0800 (+08)
 (envelope-from liu.song13@zte.com.cn)
Received: from mapi (xaxapp01[null]) by mapi (Zmail) with MAPI id mid31;
 Sun, 27 Apr 2025 09:25:10 +0800 (CST)
Date: Sun, 27 Apr 2025 09:25:10 +0800 (CST)
X-Zmail-TransId: 2af9680d8776ffffffff9e6-9acdf
X-Mailer: Zmail v1.0
Mime-Version: 1.0
From: <liu.song13@zte.com.cn>
To: <felix.kuehling@amd.com>
Cc: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <liu.xuemei1@zte.com.cn>,
 <jiang.xuexin@zte.com.cn>, <xue.zhihong@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vYW1ka2ZkOiBlbmFibGUga2ZkIG9uIFJJU0NWIHN5c3RlbXM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-db.zte.com.cn 53R4DUco001600
X-MSS: AUDITRELEASE@mse-db.zte.com.cn
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 680DAEFF.000/4ZlY9X639czKhp
X-Mailman-Approved-At: Sun, 27 Apr 2025 09:51:56 +0000
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

From: Xuemei Liu <liu.xuemei1@zte.com.cn>

KFD has been confirmed that can run on RISCV systems. It's necessary to
support CONFIG_HSA_AMD on RISCV.

Signed-off-by: Xuemei Liu <liu.xuemei1@zte.com.cn>
---
 drivers/gpu/drm/amd/amdkfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/amdkfd/Kconfig
index d3c3d3ab7225..9d4a5f8ef43f 100644
--- a/drivers/gpu/drm/amd/amdkfd/Kconfig
+++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
@@ -5,7 +5,7 @@

 config HSA_AMD
  bool "HSA kernel driver for AMD GPU devices"
- depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64)
+ depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64 || RISCV)
  select HMM_MIRROR
  select MMU_NOTIFIER
  select DRM_AMDGPU_USERPTR
-- 
2.25.1
