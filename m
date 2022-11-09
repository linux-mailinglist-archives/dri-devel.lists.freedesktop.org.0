Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A9D622E3C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 15:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B8110E0ED;
	Wed,  9 Nov 2022 14:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C801310E0ED
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 14:45:34 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60FD9896;
 Wed,  9 Nov 2022 15:45:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668005133;
 bh=Gqervy1KICAeshuyFashaJq3RzhDtwqdo80Kj6zaw2E=;
 h=Date:From:To:Cc:Subject:From;
 b=M9hpkgWcAWWvqalROqkVGvbwvwzAsQfhGoYRwqnYZjZPWeSEiok1hMKbXHpSv3sFT
 fotuHFdxlyp93ypZbWgTzJhUWIz9AaxzjpTBHRBqd/pnboW8m8AqyEpCaYkm3QBXZo
 0xVQzWfH2bPdWPadQTVD98wo7VadDfq4KrF89Bjg=
Date: Wed, 9 Nov 2022 16:45:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Subject: [GIT PULL FOR v6.1] R-Car DU fixes
Message-ID: <Y2u8+uM4A006XRPh@pendragon.ideasonboard.com>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel, Dave,

The following changes since commit 6295f1d8b4503ad8a18519b781dd2d1fe5e88c52:

  Merge tag 'drm-intel-fixes-2022-11-03' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2022-11-04 09:30:18 +1000)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/drm-fixes-20221109

for you to fetch changes up to a830a15678593948f3271a5a398c9b67d8beedb9:

  drm: rcar-du: Fix Kconfig dependency between RCAR_DU and RCAR_MIPI_DSI (2022-11-09 16:32:46 +0200)

----------------------------------------------------------------
R-Car DSI Kconfig dependency fix

----------------------------------------------------------------
Laurent Pinchart (1):
      drm: rcar-du: Fix Kconfig dependency between RCAR_DU and RCAR_MIPI_DSI

 drivers/gpu/drm/rcar-du/Kconfig | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)


-- 
Regards,

Laurent Pinchart
