Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F065EE990
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 00:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E014D10E198;
	Wed, 28 Sep 2022 22:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC3F10E130
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 22:47:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BEF0E47C;
 Thu, 29 Sep 2022 00:47:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664405248;
 bh=1LQ96ZNRbMDOfxwUljXQRndWdbzmSJjBc5WMndVNBsg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jEDWr+4pYNal8pfNgVXRlmtyI2hSGMSCbfyhdivBaWoPsoLYI3wbgVOSxumCNTNSS
 mrXfMvKU+rb96DSZHfjK4LJEUkVhowzcl1JtEOlF8JpgCfEsujvjhwFfsn36a8nLdZ
 hbsSRHg/QVyP0MqcPMXEy8lj/tgo5VJMyWXKWgGw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 03/37] drm: xlnx: zynqmp_dpsub: Constify mode argument to
 function
Date: Thu, 29 Sep 2022 01:46:45 +0300
Message-Id: <20220928224719.3291-4-laurent.pinchart@ideasonboard.com>
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

The zynqmp_dp_encoder_mode_set_transfer_unit() function takes a mode
pointer argument that it doesn't need to modify. Make it const.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 10e469c92e73..a2d87543d637 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1195,7 +1195,7 @@ static int zynqmp_dp_set_format(struct zynqmp_dp *dp,
  */
 static void
 zynqmp_dp_encoder_mode_set_transfer_unit(struct zynqmp_dp *dp,
-					 struct drm_display_mode *mode)
+					 const struct drm_display_mode *mode)
 {
 	u32 tu = ZYNQMP_DP_MSA_TRANSFER_UNIT_SIZE_TU_SIZE_DEF;
 	u32 bw, vid_kbytes, avg_bytes_per_tu, init_wait;
-- 
Regards,

Laurent Pinchart

