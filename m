Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C2C3E3D9D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 751CA8993B;
	Mon,  9 Aug 2021 01:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7EE8991C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:09 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D3344A1;
 Mon,  9 Aug 2021 03:35:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472908;
 bh=wpxjxuo/r0u9QqWqxpeZB4IjrCLP2d6VTVJJvsiViGU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B/gUNURi2Ou2Tp/FPnfbE2vMYdYEN/6eYzkaB+5EZJ1NyXKFAW7m+UNNNd2qkRDjn
 pqQI3PQBssbak+gXhY3r12iYqfiPhLy1qno2yuEHFQLlRMwLPLXzPNIaXHwfZd225D
 LODa5uH9b2R9rDYR7ErGvrh6cHnQlmEQHL6m81Bw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Subject: [PATCH 11/36] drm: xlnx: zynqmp_dpsub: Drop unused zynqmp_disp.event
 field
Date: Mon,  9 Aug 2021 04:34:32 +0300
Message-Id: <20210809013457.11266-12-laurent.pinchart@ideasonboard.com>
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

The event field of the zynqmp_disp structure is unused. Drop it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index ff2b308d8651..4180353b484a 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -170,7 +170,6 @@ struct zynqmp_disp_layer {
  * @audio.clk: Audio clock
  * @audio.clk_from_ps: True of the audio clock comes from PS, false from PL
  * @layers: Layers (planes)
- * @event: Pending vblank event request
  * @pclk: Pixel clock
  * @pclk_from_ps: True of the video clock comes from PS, false from PL
  */
@@ -195,8 +194,6 @@ struct zynqmp_disp {
 
 	struct zynqmp_disp_layer layers[ZYNQMP_DISP_NUM_LAYERS];
 
-	struct drm_pending_vblank_event *event;
-
 	struct clk *pclk;
 	bool pclk_from_ps;
 };
-- 
Regards,

Laurent Pinchart

