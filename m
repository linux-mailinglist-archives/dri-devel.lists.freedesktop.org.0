Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 546C622476C
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jul 2020 02:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7640D6E32F;
	Sat, 18 Jul 2020 00:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A5A6E32F
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jul 2020 00:18:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 882B771D;
 Sat, 18 Jul 2020 02:18:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595031483;
 bh=Abur69GSoAqvnhS9k9XeN8cne4lcUrc54P29qrNteJc=;
 h=Date:From:To:Cc:Subject:From;
 b=CG9/W+ZlxAyCtEHyzMI9oBzi1SA9fsLmzXWOaRoH5ElMkXZ+J+N+sqenU0YBsuDBF
 s5Xq4XZ6sgrQRkEZt+npodc628tjA3C0RVMgC2vIGJ6NxsrAy6s8PoIKS04AxbNeUX
 mzw7knoTeHuVe8CAsli22Pr1EWyLKY1nsf6oJRis=
Date: Sat, 18 Jul 2020 03:17:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [GIT PULL FOR v5.9] Xilinx ZynqMP DisplayPort Subsystem driver
Message-ID: <20200718001755.GA5962@pendragon.ideasonboard.com>
MIME-Version: 1.0
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
Cc: Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/drm-xilinx-dpsub-20200718

for you to fetch changes up to d76271d22694e874ed70791702db9252ffe96a4c:

  drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem (2020-07-18 02:59:16 +0300)

The tag is based on the topic/xilinx branch from Vinod's dmaengine tree,
which contains required dependencies. That branch is itself based on
v5.8-rc1, and has been merged in the dmaengine -next branch, scheduled
for v5.9. I have verified that it doesn't conflict with drm-next.

----------------------------------------------------------------
Xilinx ZynqMP DisplayPort Subsystem driver

----------------------------------------------------------------
Hyun Kwon (3):
      dmaengine: xilinx: dpdma: Add the Xilinx DisplayPort DMA engine driver
      dt-bindings: display: xlnx: Add ZynqMP DP subsystem bindings
      drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem

Laurent Pinchart (2):
      dt: bindings: dma: xilinx: dpdma: DT bindings for Xilinx DPDMA
      dmaengine: Add support for repeating transactions

 .../display/xlnx/xlnx,zynqmp-dpsub.yaml         |  174 ++
 .../bindings/dma/xilinx/xlnx,zynqmp-dpdma.yaml  |   68 +
 Documentation/driver-api/dmaengine/client.rst   |    4 +-
 Documentation/driver-api/dmaengine/provider.rst |   49 +
 MAINTAINERS                                     |   18 +
 drivers/dma/Kconfig                             |   10 +
 drivers/dma/xilinx/Makefile                     |    1 +
 drivers/dma/xilinx/xilinx_dpdma.c               | 1533 +++++++++++++++
 drivers/gpu/drm/Kconfig                         |    2 +
 drivers/gpu/drm/Makefile                        |    1 +
 drivers/gpu/drm/xlnx/Kconfig                    |   13 +
 drivers/gpu/drm/xlnx/Makefile                   |    2 +
 drivers/gpu/drm/xlnx/zynqmp_disp.c              | 1697 ++++++++++++++++
 drivers/gpu/drm/xlnx/zynqmp_disp.h              |   42 +
 drivers/gpu/drm/xlnx/zynqmp_disp_regs.h         |  201 ++
 drivers/gpu/drm/xlnx/zynqmp_dp.c                | 1734 +++++++++++++++++
 drivers/gpu/drm/xlnx/zynqmp_dp.h                |   27 +
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c             |  322 +++
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h             |   54 +
 include/dt-bindings/dma/xlnx-zynqmp-dpdma.h     |   16 +
 include/linux/dmaengine.h                       |   17 +
 21 files changed, 5984 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
 create mode 100644 Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dpdma.yaml
 create mode 100644 drivers/dma/xilinx/xilinx_dpdma.c
 create mode 100644 drivers/gpu/drm/xlnx/Kconfig
 create mode 100644 drivers/gpu/drm/xlnx/Makefile
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_disp.c
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_disp.h
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_dp.c
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_dp.h
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_dpsub.c
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_dpsub.h
 create mode 100644 include/dt-bindings/dma/xlnx-zynqmp-dpdma.h

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
