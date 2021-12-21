Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3632A47B859
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 03:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6E710F324;
	Tue, 21 Dec 2021 02:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839A810F324
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 02:25:29 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=14; SR=0; TI=SMTPD_---0V.IKijQ_1640053524; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0V.IKijQ_1640053524) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 21 Dec 2021 10:25:25 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: airlied@linux.ie
Subject: [PATCH -next] drm/i915/gvt: Fix intel_vgpu_default_mmio_write()
 kernel-doc comment
Date: Tue, 21 Dec 2021 10:25:23 +0800
Message-Id: <20211221022523.86071-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: tvrtko.ursulin@linux.intel.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
 rodrigo.vivi@intel.com, intel-gvt-dev@lists.freedesktop.org,
 zhi.a.wang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix function name in handlers.c kernel-doc comment
to remove some warnings found by running scripts/kernel-doc,
which is caused by using 'make W=1'.
drivers/gpu/drm/i915/gvt/handlers.c:3812: warning: expecting prototype
for intel_t_default_mmio_write(). Prototype was for
intel_vgpu_default_mmio_write() instead.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Fixes: e39c5add3221 ("drm/i915/gvt: vGPU MMIO virtualization")
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 3938df0db188..32027a7e08af 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -3798,7 +3798,7 @@ int intel_vgpu_default_mmio_read(struct intel_vgpu *vgpu, unsigned int offset,
 }
 
 /**
- * intel_t_default_mmio_write - default MMIO write handler
+ * intel_vgpu_default_mmio_write - default MMIO write handler
  * @vgpu: a vGPU
  * @offset: access offset
  * @p_data: write data buffer
-- 
2.20.1.7.g153144c

