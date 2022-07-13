Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE74E57305F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:13:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B85957EB;
	Wed, 13 Jul 2022 08:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC66595199;
 Wed, 13 Jul 2022 08:12:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3A331619E5;
 Wed, 13 Jul 2022 08:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00EEBC341C0;
 Wed, 13 Jul 2022 08:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657699952;
 bh=02cyhIypTLENjeZTnSK5haDu0Z0kMejAbXMcG0yrAJo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sIFpDWSU7KIoeA/smu2GuWRlUs/nghXPDIXRf8RHYJ3T9Hz+Bx0CQZEzOzrrcQyGJ
 VYTDh1I+bZyf6xCFS/7LOq7PILPz1wxanO+3x7PQZrDlZsPU4bro8q59IZQ49M3gU3
 3wPAqzVcLk1cLIAJgntHQ1CWTVwpf0IttB/kI9qS1dvKgkdi5Ab6/hBemrW0idVdzM
 cG10YSYKwOUYBh6gxtKpf/5QYB+W7l71ES494PZFqtkR8tHr793fM6Pf7nVwEKM62C
 V5j3KVl3rJfpfaKF1pGnpNCfpLvp2C6+dBLbHTSL2qThyHA4iFSpw3dhicT/pY65os
 xKHErK7v4WkMA==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBXTx-004zsb-Az;
 Wed, 13 Jul 2022 09:12:29 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 02/39] drm/i915/gvt: Fix kernel-doc for
 intel_vgpu_default_mmio_write
Date: Wed, 13 Jul 2022 09:11:50 +0100
Message-Id: <e36ce9b22d4d9914cf5160ad31812a803e1ce1b6.1657699522.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657699522.git.mchehab@kernel.org>
References: <cover.1657699522.git.mchehab@kernel.org>
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Fix the following W=1 kernel warnings:

drivers/gpu/drm/i915/gvt/handlers.c:3066: warning: expecting prototype
for intel_t_default_mmio_write(). Prototype was for
intel_vgpu_default_mmio_write() instead.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/gvt/handlers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index beea5895e499..9c8dde079cb4 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -3052,7 +3052,7 @@ int intel_vgpu_default_mmio_read(struct intel_vgpu *vgpu, unsigned int offset,
 }
 
 /**
- * intel_t_default_mmio_write - default MMIO write handler
+ * intel_vgpu_default_mmio_write() - default MMIO write handler
  * @vgpu: a vGPU
  * @offset: access offset
  * @p_data: write data buffer
-- 
2.36.1

