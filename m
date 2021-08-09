Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCB43E3D97
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE7A89916;
	Mon,  9 Aug 2021 01:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06897898EE
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:06 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6784CD84;
 Mon,  9 Aug 2021 03:35:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472904;
 bh=ih1eZHuTAO4w+QUJyYn99/s1qjH1q9f/r3/nWvX7IZI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wnrt/tQAg+P8x/SnAppxYmktutYrq8DrUXFvC8IMZdPGzYWwi5CMABBcue+MPuXGA
 7FzosFr1iqDkGPTqNRId1YoX1mQlnBKMukOTZztU5bJX7JnQaD/wnoLl2Yt3U1tjYD
 ipltp34dFhqUJ+IKvfRZXsMx5Q7ocl1QzidGuB1M=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Subject: [PATCH 03/36] drm: xlnx: zynqmp_dpsub: Constify mode argument to
 function
Date: Mon,  9 Aug 2021 04:34:24 +0300
Message-Id: <20210809013457.11266-4-laurent.pinchart@ideasonboard.com>
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

The zynqmp_dp_encoder_mode_set_transfer_unit() function takes a mode
pointer argument that it doesn't need to modify. Make it const.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index ace9fc731bfe..7768b45a0d73 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1194,7 +1194,7 @@ static int zynqmp_dp_set_format(struct zynqmp_dp *dp,
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

