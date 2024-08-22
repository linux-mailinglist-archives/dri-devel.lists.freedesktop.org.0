Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC1B95C195
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 01:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CA510E0DC;
	Thu, 22 Aug 2024 23:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m02b9dG/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14AF210E0DC
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 23:44:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8A78669;
 Fri, 23 Aug 2024 01:43:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1724370224;
 bh=b9O16HHQYPf+2Efq38kaCqWCqhyHfKHw6l3fT7Jl1bM=;
 h=Date:From:To:Cc:Subject:From;
 b=m02b9dG/bgKa6A8zgfm7hGN6fvaNqp1R8EFPsW4f+/IP6HxE9UR2yNVVWpkSUr+20
 ZCQcHx+GemoF/oMOUNlmX5tbN2bd3klSNATP36n4KJboPjHG4+rj4/lqIAxAXsMTXc
 /YpUSJmDuw2YZydKLDZ+slupB8TN3+hF1dnnDuXs=
Date: Fri, 23 Aug 2024 02:44:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [GIT PULL FOR v6.12] Miscellaneous small fixes for Renesas DRM drivers
Message-ID: <20240822234445.GA23541@pendragon.ideasonboard.com>
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

Hello Dave, Sima,

The following changes since commit 11df68c265460d4dff5d19a1313f0fff69470f98:

  Merge tag 'drm-misc-next-2024-08-16' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next (2024-08-22 09:42:23 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/drm-next-20240823

for you to fetch changes up to caef454889d150d7267992f0d95fbc25dfb621a4:

  drm: renesas: cmm: Remove unused function rcar_cmm_write (2024-08-23 02:30:26 +0300)

----------------------------------------------------------------
Miscellaneous small fixes for Renesas DRM drivers

----------------------------------------------------------------
Biju Das (2):
      drm: renesas: rcar-du: rzg2l_mipi_dsi: Update the comment in rzg2l_mipi_dsi_start_video()
      drm: rcar-du: Fix memory leak in rcar_du_vsps_init()

Jiapeng Chong (1):
      drm: renesas: cmm: Remove unused function rcar_cmm_write

 drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c       |  5 -----
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c    | 10 ++++------
 drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c |  2 +-
 3 files changed, 5 insertions(+), 12 deletions(-)

-- 
Regards,

Laurent Pinchart
