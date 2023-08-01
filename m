Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2233E76C082
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 00:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B4310E43D;
	Tue,  1 Aug 2023 22:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666EB10E43D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 22:44:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6697D51;
 Wed,  2 Aug 2023 00:43:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1690929825;
 bh=IUenEnv4qq+Zo9OB/2ysbXjWoMYrA1qY3Dlj5m/Rxe0=;
 h=Date:From:To:Cc:Subject:From;
 b=TXv1sewZlAuJMOJDmBgeHyd5F0KCX+Fy4dh6hnEViidB10FGObb6tp3XSmwfeSQDe
 1//R3hpB9cJtk0pAD6/IQLCksJEvfzfCTIZU7u/WzLScj1PWhohj24vbe4hncpGSYp
 nJmFKwn7HhT2MByFEE9FSAXN5Yea1VEpU64mVC20=
Date: Wed, 2 Aug 2023 01:44:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [GIT PULL FOR v6.6] drm: xilinx: Miscellaneous fixes
Message-ID: <20230801224454.GB335@pendragon.ideasonboard.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

The following changes since commit 52920704df878050123dfeb469aa6ab8022547c1:

  Merge tag 'drm-misc-next-2023-07-27' of git://anongit.freedesktop.org/drm/drm-misc into drm-next (2023-07-27 15:01:26 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/drm-next-xilinx-20230802

for you to fetch changes up to 9bde3bfe24ca09a43b26e4bfcd569edace434cfa:

  drm: xlnx: zynqmp_dpsub: Use devm_platform_ioremap_resource_byname() (2023-08-02 01:36:54 +0300)

----------------------------------------------------------------
Miscellaneous fixes for the Xilinx zynqmp-dpsub driver

----------------------------------------------------------------
Jiasheng Jiang (1):
      drm: xlnx: zynqmp_dpsub: Add missing check for dma_set_mask

Lee Jones (1):
      drm/xlnx/zynqmp_dp: Fix function name zynqmp_dp_link_train() -> zynqmp_dp_train()

Li Zetao (1):
      drm: xlnx: zynqmp_dpsub: Use devm_platform_ioremap_resource_byname()

Wang Ming (1):
      drm: xlnx: zynqmp_dpsub: Use dev_err_probe instead of dev_err

 drivers/gpu/drm/xlnx/zynqmp_disp.c  | 14 +++++---------
 drivers/gpu/drm/xlnx/zynqmp_dp.c    |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c |  4 +++-
 3 files changed, 9 insertions(+), 11 deletions(-)

-- 
Regards,

Laurent Pinchart
