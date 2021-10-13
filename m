Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D8242CF3E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 01:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501786E88F;
	Wed, 13 Oct 2021 23:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD1E6E88F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 23:37:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="214719586"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="214719586"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 16:37:23 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="659743968"
Received: from thollida-mobl.amr.corp.intel.com (HELO
 achrisan-desk3.intel.com) ([10.212.111.141])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 16:37:22 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org,
	anitha.chrisanthus@intel.com
Cc: sam@ravnborg.org,
	edmund.j.dea@intel.com
Subject: [PATCH v3 5/7] drm/kmb: Corrected typo in handle_lcd_irq
Date: Wed, 13 Oct 2021 16:36:30 -0700
Message-Id: <20211013233632.471892-5-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013233632.471892-1-anitha.chrisanthus@intel.com>
References: <20211013233632.471892-1-anitha.chrisanthus@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Check for Overflow bits for layer3 in the irq handler.

Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 12ce669650cc..961ac6fb5fcf 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -380,7 +380,7 @@ static irqreturn_t handle_lcd_irq(struct drm_device *dev)
 		if (val & LAYER3_DMA_FIFO_UNDERFLOW)
 			drm_dbg(&kmb->drm,
 				"LAYER3:GL1 DMA UNDERFLOW val = 0x%lx", val);
-		if (val & LAYER3_DMA_FIFO_UNDERFLOW)
+		if (val & LAYER3_DMA_FIFO_OVERFLOW)
 			drm_dbg(&kmb->drm,
 				"LAYER3:GL1 DMA OVERFLOW val = 0x%lx", val);
 	}
-- 
2.25.1

