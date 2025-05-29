Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B66AC7A6E
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 10:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E6A10E1D9;
	Thu, 29 May 2025 08:53:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D25410E1C6;
 Thu, 29 May 2025 02:25:56 +0000 (UTC)
Received: from mxde.zte.com.cn (unknown [10.35.20.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4b79G52bNlz57dg;
 Thu, 29 May 2025 10:25:49 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxde.zte.com.cn (FangMail) with ESMTPS id 4b79Fw720Hz4xBTM;
 Thu, 29 May 2025 10:25:40 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4b79FZ4yF6z5B1KQ;
 Thu, 29 May 2025 10:25:22 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
 by mse-fl2.zte.com.cn with SMTP id 54T2PAO6025233;
 Thu, 29 May 2025 10:25:10 +0800 (+08)
 (envelope-from liu.xuemei1@zte.com.cn)
Received: from mapi (xaxapp05[null]) by mapi (Zmail) with MAPI id mid32;
 Thu, 29 May 2025 10:25:11 +0800 (CST)
Date: Thu, 29 May 2025 10:25:11 +0800 (CST)
X-Zmail-TransId: 2afc6837c5873b4-58a73
X-Mailer: Zmail v1.0
Message-ID: <20250529102511926m1vYHloavTKK17e5_ZdsX@zte.com.cn>
Mime-Version: 1.0
From: <liu.xuemei1@zte.com.cn>
To: <felix.kuehling@amd.com>
Cc: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIHYyIFJFU0VORF0gZHJtL2FtZGtmZDogZW5hYmxlIGtmZCBvbiBSSVNDViBzeXN0ZW1z?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 54T2PAO6025233
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6837C5AB.002/4b79G52bNlz57dg
X-Mailman-Approved-At: Thu, 29 May 2025 08:52:55 +0000
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
index d3c3d3ab7225..62e88e5362e9 100644
--- a/drivers/gpu/drm/amd/amdkfd/Kconfig
+++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
@@ -5,7 +5,7 @@

config HSA_AMD
bool "HSA kernel driver for AMD GPU devices"
- depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64)
+ depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64 || (RISCV && 64BIT))
select HMM_MIRROR
select MMU_NOTIFIER
select DRM_AMDGPU_USERPTR
--
2.25.1
