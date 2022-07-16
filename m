Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E551576F4B
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:43:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF3B1123A9;
	Sat, 16 Jul 2022 14:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EB410E0D8
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 00:21:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 68C276E0;
 Sat, 16 Jul 2022 02:21:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1657930874;
 bh=T+Iy4GrlEHRbshWr5Cac9CRP4ueUTclZpnWiOesG6h0=;
 h=Date:From:To:Cc:Subject:From;
 b=iOV90wlcWlqZMs4tqojXNgTWFBrgnoxLH6uVl4hc9FCKv5evV1XUZ+yMDRTyrKmGp
 vTtY2TLElyw5iGK4XIGsm+iCi+ZTnxQBn1f3uumvrfNt+MnhsDMr0B5x1H4Yur9ArQ
 ZB8XeUW1VQkzI0flVpvUbtW7uQGs4E5M4rJYa8E8=
Date: Sat, 16 Jul 2022 03:20:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [GIT PULL FOR v5.20] Miscellaneous R-Car DU fixes and enhancements
Message-ID: <YtIEWkE0nk/8nhUc@pendragon.ideasonboard.com>
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

Hi Dave, Daniel,

I would have sworn I had sent this pull request a week ago, but I can't
find any trace of it in the mailing list archive, so I'm not sure what I
messed up. If there's still time for v5.20 it would be nice to get those
5 patches in, otherwise I'll resend for v5.21.

The following changes since commit f929217499cf54a30be995aae65e9951ba079c90:

  Merge tag 'drm-misc-next-2022-06-30' of git://anongit.freedesktop.org/drm/drm-misc into drm-next (2022-07-01 09:52:37 +1000)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/du-next-20220707

for you to fetch changes up to 676ad8e997036e2f815c293b76c356fb7cc97a08:

  drm: rcar-du: Lift z-pos restriction on primary plane for Gen3 (2022-07-07 05:24:36 +0300)

----------------------------------------------------------------
Miscellaneous R-Car DU fixes and enhancements

----------------------------------------------------------------
Biju Das (1):
      drm: rcar-du: Add num_rpf to struct rcar_du_device_info

Kieran Bingham (1):
      drm: rcar-du: Extend CMM HDSE documentation

LUU HOAI (1):
      drm: rcar-du: Fix Alpha blending issue on Gen3

Laurent Pinchart (2):
      drm: rcar-du: Drop file name from comment header blocks
      drm: rcar-du: Lift z-pos restriction on primary plane for Gen3

 drivers/gpu/drm/rcar-du/rcar_cmm.c           |  2 +-
 drivers/gpu/drm/rcar-du/rcar_cmm.h           |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c       |  7 ++++++-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h       |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c        | 19 ++++++++++++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h        |  4 +++-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c    |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h    |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_group.c      |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_group.h      |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c        |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.h        |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_plane.c      | 14 +++++++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_plane.h      |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_regs.h       |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c        | 19 +++++--------------
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h        |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_writeback.c  |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_writeback.h  |  2 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.c          |  2 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.h          |  2 +-
 drivers/gpu/drm/rcar-du/rcar_lvds_regs.h     |  2 +-
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c      |  2 +-
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h |  2 +-
 24 files changed, 64 insertions(+), 37 deletions(-)


-- 
Regards,

Laurent Pinchart
