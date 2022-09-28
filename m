Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A71CA5EE999
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 00:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75F010E5C4;
	Wed, 28 Sep 2022 22:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB3710E768
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 22:47:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE3B66BE;
 Thu, 29 Sep 2022 00:47:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664405261;
 bh=BW38xSA/D8NP5x89m04bdFxh60/NCse0T+kCKOwtupE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nsdizKnKICiCzyze+vQa2gSOt/S67BGbA9JvvZRFmk55MEmYb+ZgQfIyQ4Unk8enA
 J4OuzhU9D+eMMGEF98YGcHYVkB/d5hqxALRLnXnj5qbAtIiF4C9Qdh0TJfV+GkZ2wd
 oFEq90/J7yeOuBXH7+jhZz9FotHDTVbOO4C3170A=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 11/37] drm: xlnx: zynqmp_dpsub: Drop unused
 zynqmp_disp.event field
Date: Thu, 29 Sep 2022 01:46:53 +0300
Message-Id: <20220928224719.3291-12-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928224719.3291-1-laurent.pinchart@ideasonboard.com>
References: <20220928224719.3291-1-laurent.pinchart@ideasonboard.com>
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
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The event field of the zynqmp_disp structure is unused. Drop it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index cc32aa89cf8f..31b52f01c32d 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -172,7 +172,6 @@ struct zynqmp_disp_layer {
  * @audio.clk: Audio clock
  * @audio.clk_from_ps: True of the audio clock comes from PS, false from PL
  * @layers: Layers (planes)
- * @event: Pending vblank event request
  * @pclk: Pixel clock
  * @pclk_from_ps: True of the video clock comes from PS, false from PL
  */
@@ -197,8 +196,6 @@ struct zynqmp_disp {
 
 	struct zynqmp_disp_layer layers[ZYNQMP_DISP_NUM_LAYERS];
 
-	struct drm_pending_vblank_event *event;
-
 	struct clk *pclk;
 	bool pclk_from_ps;
 };
-- 
Regards,

Laurent Pinchart

