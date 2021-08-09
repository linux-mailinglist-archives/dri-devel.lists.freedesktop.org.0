Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7963E3DAB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E57899DB;
	Mon,  9 Aug 2021 01:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1144A8993B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:10 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7B919D84;
 Mon,  9 Aug 2021 03:35:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472908;
 bh=zWa7mJ03Oi8PeLk+Qbb1N8BXkK9tUjWplCtqIC9vjkY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f0smjVRJhmvnsUk12dFItpxW/Y5C0/71HhB8mqzdrb+LB/sd2CcxcOyxHoiRg8U8H
 gsvglMMIGlN371gn9GGPpD59O+xNLmY2gBr0xibfEhFtkpTzY2mZ8RO7yHb6eiL8Ox
 ZW3wFLwLgfJLey2gGbE9QKxbdRXlfdkoQKSebyQI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Subject: [PATCH 12/36] drm: xlnx: zynqmp_dpsub: Drop unused
 zynqmp_disp_format.bus_fmt field
Date: Mon,  9 Aug 2021 04:34:33 +0300
Message-Id: <20210809013457.11266-13-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809013457.11266-1-laurent.pinchart@ideasonboard.com>
References: <20210809013457.11266-1-laurent.pinchart@ideasonboard.com>
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

The bus_fmt field of the zynqmp_disp_format structure is unused. Drop
it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 4180353b484a..a6800cdb99e7 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -78,14 +78,12 @@
  * struct zynqmp_disp_format - Display subsystem format information
  * @drm_fmt: DRM format (4CC)
  * @buf_fmt: AV buffer format
- * @bus_fmt: Media bus formats (live formats)
  * @swap: Flag to swap R & B for RGB formats, and U & V for YUV formats
  * @sf: Scaling factors for color components
  */
 struct zynqmp_disp_format {
 	u32 drm_fmt;
 	u32 buf_fmt;
-	u32 bus_fmt;
 	bool swap;
 	const u32 *sf;
 };
-- 
Regards,

Laurent Pinchart

