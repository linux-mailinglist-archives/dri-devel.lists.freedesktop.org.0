Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE334CBD62
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 13:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01E810EC9D;
	Thu,  3 Mar 2022 12:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC3710EC9D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 12:13:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 40D36885;
 Thu,  3 Mar 2022 13:13:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646309592;
 bh=pQ90ib4nAuhIhCllprOQcATTaJ8vUJbyLFHgmRpx5TM=;
 h=Date:From:To:Cc:Subject:From;
 b=L45WZfKCYx9xZauHM+T016ywL0vt+Dd6jl06e+8w2XW59bpTSk221VRJOU8cfUPbZ
 hwDcymypd3s1Sj8nuXLXHLqgJuIEZOn9Dr0s+kBLbwLZRpGNTuqSNrYlHPyV2sk7Qk
 BATO3NpYc9oo51w7jrEvJn0FA8XXdxF8fYXl9m3M=
Date: Thu, 3 Mar 2022 14:12:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [GIT PULL FOR v5.18] R-Car DU misc improvements
Message-ID: <YiCwy3FR3gPng4dN@pendragon.ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The following changes since commit 38a15ad9488e21cad8f42d3befca20f91e5b2874:

  Merge tag 'amd-drm-next-5.18-2022-02-25' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-03-01 16:19:02 +1000)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/du-next-20220303

for you to fetch changes up to 8ba3c7bd4dca7ac358e834eabf840012d9564356:

  drm: rcar-du: Don't restart group when enabling plane on Gen3 (2022-03-03 14:06:04 +0200)

----------------------------------------------------------------
- R-Car LVDS support for M3-W+ (R8A77961) SoC
- R-Car DU misc fixes and cleanups

----------------------------------------------------------------
Laurent Pinchart (3):
      drm: rcar-du: Drop LVDS device tree backward compatibility
      drm: rcar-du: Don't select VSP1 sink on Gen3
      drm: rcar-du: Don't restart group when enabling plane on Gen3

Nikita Yushchenko (2):
      dt-bindings: display: bridge: renesas,lvds: Document r8a77961 bindings
      drm: rcar-du: lvds: Add r8a77961 support

 .../bindings/display/bridge/renesas,lvds.yaml      |   1 +
 drivers/gpu/drm/rcar-du/Makefile                   |   6 -
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |  21 +-
 drivers/gpu/drm/rcar-du/rcar_du_of.c               | 323 ---------------------
 drivers/gpu/drm/rcar-du/rcar_du_of.h               |  20 --
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts    |  69 -----
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts    |  43 ---
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts    |  43 ---
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts    |  43 ---
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts    |  43 ---
 drivers/gpu/drm/rcar-du/rcar_du_plane.c            |  12 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c              |   9 -
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |   1 +
 13 files changed, 16 insertions(+), 618 deletions(-)
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.h
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts

-- 
Regards,

Laurent Pinchart
