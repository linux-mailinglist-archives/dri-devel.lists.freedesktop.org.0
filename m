Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B996C90C4
	for <lists+dri-devel@lfdr.de>; Sat, 25 Mar 2023 21:49:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEECB10E22C;
	Sat, 25 Mar 2023 20:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC4F10E22C
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Mar 2023 20:49:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E6DEA8BE;
 Sat, 25 Mar 2023 21:49:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1679777357;
 bh=/Af1T4aUKZFKa6behgQ9at0rAojLuo8Lml+HKi/UWmo=;
 h=Date:From:To:Cc:Subject:From;
 b=EObOsmpydxR8eHh0dFNi/Ss4KQ2W4CRvzg4bsAp0WFAmUm/3tCKqa22zaFtTWOm3/
 OjWt5HLe+V73U6RlbGPFGL/OdU1zI31/RECDuX6Ws/3AocVYX5t/Pz5VI34JqEST4q
 VTbHtOAtXxQeFo3bGM9p6blvMBbiOEBswXfirsI8=
Date: Sat, 25 Mar 2023 22:49:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [GIT PULL FOR v6.4] drm: rcar-du: Miscellaneous fixes and improvements
Message-ID: <20230325204922.GD19335@pendragon.ideasonboard.com>
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

The following changes since commit 7ed34927254ae9eac0f6b0ad7e7c2bceb96fcdfc:

  Merge tag 'drm-intel-next-2023-03-23' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2023-03-24 20:22:03 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/drm-rcar-next-20230325

for you to fetch changes up to 40f43730f43699ce8557e4fe59622d4f4b69f44a:

  drm: rcar-du: Fix a NULL vs IS_ERR() bug (2023-03-25 22:38:10 +0200)

----------------------------------------------------------------
drm: rcar-du: Miscellaneous fixes and improvements

----------------------------------------------------------------
Dan Carpenter (1):
      drm: rcar-du: Fix a NULL vs IS_ERR() bug

Laurent Pinchart (7):
      drm: rcar-du: lvds: Call function directly instead of through pointer
      drm: rcar-du: lvds: Move LVDS enable code to separate code section
      drm: rcar-du: lvds: Fix LVDS PLL disable on D3/E3
      drm: rcar-du: Don't write unimplemented ESCR and OTAR registers on Gen3
      drm: rcar-du: Disable alpha blending for DU planes used with VSP
      drm: rcar-du: Rename DORCR fields to make them 0-based
      drm: rcar-du: Write correct values in DORCR reserved fields

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c    |  38 +++++--
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c |   4 +-
 drivers/gpu/drm/rcar-du/rcar_du_group.c   |  16 ++-
 drivers/gpu/drm/rcar-du/rcar_du_regs.h    |  26 ++---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c     |   2 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.c       | 176 +++++++++++++++++-------------
 drivers/gpu/drm/rcar-du/rcar_lvds.h       |  12 +-
 7 files changed, 163 insertions(+), 111 deletions(-)

-- 
Regards,

Laurent Pinchart
