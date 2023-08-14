Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C9A77B95C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 15:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C50510E1E9;
	Mon, 14 Aug 2023 13:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8816F10E1E9
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 13:05:25 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3100F283;
 Mon, 14 Aug 2023 15:04:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1692018252;
 bh=u+RU0KHs9B6N+xOiIORRIInnR6JKf9mTNhrK7umCPfA=;
 h=Date:From:To:Cc:Subject:From;
 b=cHzzw3hemoVwlCCDhhvDRHjyJM97fB4so5vodOYvcviG+/VE4CWIyMgFRfTqecfG5
 1S+t/COz/jg8cfN9AegHEflxFdlpIgRw/ljnT1y/R7Yzddn4cL5vF4FZKMr3SsdUeK
 OHrLK1qxFBDPDckTNvJ2DCIRmUOPDl6UFrKIzrzM=
Date: Mon, 14 Aug 2023 16:05:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [GIT PULL FOR v6.6] drm: rcar-du: Miscellaneous changes
Message-ID: <20230814130531.GC22929@pendragon.ideasonboard.com>
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

The following changes since commit 2b9d7b6515220c30a596aba5633d675117f96500:

  Merge tag 'drm-intel-next-2023-08-10' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2023-08-11 16:33:16 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/drm-next-20230814

for you to fetch changes up to 97018453946bbca869640d92c19400b17e61b94b:

  drm:rcar-du: Enable ABGR and XBGR formats (2023-08-14 13:47:30 +0300)

----------------------------------------------------------------
Renesas R-Car DU miscellaneous changes

----------------------------------------------------------------
Damian Hobson-Garcia (2):
      drm: rcar-du: Add more formats to DRM_MODE_BLEND_PIXEL_NONE support
      drm:rcar-du: Enable ABGR and XBGR formats

Laurent Pinchart (2):
      drm: rcar-du: Replace DRM_INFO() with drm_info()
      drm: rcar-du: Use dev_err_probe() to record cause of KMS init errors

Yangtao Li (1):
      drm/renesas: Convert to devm_platform_ioremap_resource()

 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c   |  6 ++-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c   |  6 ++-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c   | 57 +++++++++++++++++--------
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c |  4 +-
 4 files changed, 50 insertions(+), 23 deletions(-)

-- 
Regards,

Laurent Pinchart
