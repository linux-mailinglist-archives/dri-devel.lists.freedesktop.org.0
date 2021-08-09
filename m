Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C10103E3DE9
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 04:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A59898EA;
	Mon,  9 Aug 2021 02:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0608898EA
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 02:26:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2705466;
 Mon,  9 Aug 2021 04:26:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628475974;
 bh=0j3xIcBMMx2xvG/0J+Nes3vW+Ahm9KWHVtJsisg00qk=;
 h=Date:From:To:Cc:Subject:From;
 b=f73eqkjwIJMx33Zbf+qTrB91/UYJRg+LY9MFVQZyKSzull+izug/nGCUP3C2dIXvT
 Q/N/MACnRy4VwO/g1d8suf8+sMTOD7WdRCStKf1UjwjLRM2op29ovhwCdHApSwZoLh
 GX+z4dNsEd6W3sPa+0Y1CQLuX6VWESefctIRI7aY=
Date: Mon, 9 Aug 2021 05:26:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Jianqiang Chen <jianqian@xilinx.com>,
 Michal Simek <michal.simek@xilinx.com>
Subject: [GIT PULL FOR v5.15] Xilinx ZynqMP DPSUB miscellaneous fixes
Message-ID: <YRCSRZZV1HZYPvaG@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

Hi Dave and Daniel,

The following changes since commit 49f7844b08844ac7029f997702099c552566262b:

  Merge tag 'drm-misc-next-2021-08-05' of git://anongit.freedesktop.org/drm/drm-misc into drm-next (2021-08-06 06:59:30 +1000)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/drm-xilinx-dpsub-20210809

for you to fetch changes up to 6ebfd22c969044bda7b5c3f0a20a958c7ff656b9:

  drm/xlnx/zynqmp_disp: Fix incorrectly named enum 'zynqmp_disp_layer_id' (2021-08-09 02:28:05 +0300)

----------------------------------------------------------------
- Miscellaneous fixes in ZynqMP DPSUB driver

----------------------------------------------------------------
Dylan Yip (1):
      drm: xlnx: zynqmp_dpsub: Update dependencies for ZynqMP DP

Laurent Pinchart (4):
      drm: xlnx: zynqmp_dpsub: Pass disp structure to all internal functions
      drm: xlnx: zynqmp_dpsub: Fix graphics layer blending
      drm: xlnx: zynqmp_dpsub: Add global alpha support
      drm: xlnx: zynqmp_dpsub: Expose plane ordering to userspace

Lee Jones (1):
      drm/xlnx/zynqmp_disp: Fix incorrectly named enum 'zynqmp_disp_layer_id'

Quanyang Wang (3):
      drm: xlnx: zynqmp_dpsub: Call pm_runtime_get_sync before setting pixel clock
      drm: xlnx: zynqmp: release reset to DP controller before accessing DP registers
      drm: xlnx: zynqmp: Add zynqmp_disp_layer_is_video() to simplify the code

 drivers/gpu/drm/xlnx/Kconfig       |   2 +
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 322 ++++++++++++++++++-------------------
 drivers/gpu/drm/xlnx/zynqmp_dp.c   |  22 +--
 3 files changed, 174 insertions(+), 172 deletions(-)

-- 
Regards,

Laurent Pinchart
