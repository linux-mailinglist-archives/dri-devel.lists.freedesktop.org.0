Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 721D3341246
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 02:48:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CF86E2C7;
	Fri, 19 Mar 2021 01:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCBEA6E2C7
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 01:48:37 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA29F4FD;
 Fri, 19 Mar 2021 02:48:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616118516;
 bh=JnuTodDiKeuHVWbpq2KllXI1qK0GquxK1w5pDzIvDa8=;
 h=From:To:Cc:Subject:Date:From;
 b=HGHLHsh/JuJRnC4RO4uqZBnE+Fq0t+QYuEEXbsxmMtoaHnCQCOkGEHYy25KvyoITw
 W5WfyBAY/A6Tn1x/p3/tOoRG+v1Gl0Yw1wy0BLmGVyybzPhxt8X30n+MVVW3rorwgX
 6C3JGnnnREYKqYaz61nJ+0hqvlJrjxq8DifbfyZ8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: xlnx: Update dependencies for ZynqMP DP
Date: Fri, 19 Mar 2021 03:47:53 +0200
Message-Id: <20210319014753.1947-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
MIME-Version: 1.0
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
Cc: Dylan Yip <dylan.yip@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dylan Yip <dylan.yip@xilinx.com>

ZynqMP DP requires the ZynqMP PHY and DPDMA to operate properly. So
depend on both the PHY and DPDMA.

Signed-off-by: Dylan Yip <dylan.yip@xilinx.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/Kconfig b/drivers/gpu/drm/xlnx/Kconfig
index b52c6cdfc0b8..c3d08269faa9 100644
--- a/drivers/gpu/drm/xlnx/Kconfig
+++ b/drivers/gpu/drm/xlnx/Kconfig
@@ -3,6 +3,8 @@ config DRM_ZYNQMP_DPSUB
 	depends on ARCH_ZYNQMP || COMPILE_TEST
 	depends on COMMON_CLK && DRM && OF
 	depends on DMADEVICES
+	depends on PHY_XILINX_ZYNQMP
+	depends on XILINX_ZYNQMP_DPDMA
 	select DMA_ENGINE
 	select DRM_GEM_CMA_HELPER
 	select DRM_KMS_CMA_HELPER
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
