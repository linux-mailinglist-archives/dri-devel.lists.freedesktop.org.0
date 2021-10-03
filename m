Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4390D4201CA
	for <lists+dri-devel@lfdr.de>; Sun,  3 Oct 2021 15:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B346E077;
	Sun,  3 Oct 2021 13:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 004AF89913
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Oct 2021 13:51:34 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61AE2A2A;
 Sun,  3 Oct 2021 15:51:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1633269093;
 bh=1jeUCuk/NFz13MYLRaGrQEfYQg+qu2eKQQnuiLHy8og=;
 h=Date:From:To:Cc:Subject:From;
 b=sbmWTw5se/jZ9SxIiqMWHmnAyDYt+fHby72UrhMlW/VsQB955jhxN+1f34OaEClYo
 38WlZouXTGve6mxEt6GiwoTvQJQZbFIAmNilaIDZicl5IcCzJzNCfCP/FAYW/qM/C9
 v3X6TssDG34mSCiRUuNS87kMO41SOLtnfyvs59DU=
Date: Sun, 3 Oct 2021 16:51:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [GIT FIXES FOR v5.15] R-Car DU fix
Message-ID: <YVm1YYr4MtTBZxJQ@pendragon.ideasonboard.com>
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

The following changes since commit 78ea81417944fe03f48648eddeb8e8a8e513c4ad:

  Merge tag 'exynos-drm-fixes-for-v5.15-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into drm-fixes (2021-10-01 18:14:39 +0200)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/du-fixes-20211003

for you to fetch changes up to 734d0b3b6afd44510b4752ea730685f89e107767:

  drm: rcar-du: Don't create encoder for unconnected LVDS outputs (2021-10-03 16:05:36 +0300)

----------------------------------------------------------------
- R-Car DU fix for LVDS outputs on D3 and E3 SoCs

----------------------------------------------------------------
Laurent Pinchart (1):
      drm: rcar-du: Don't create encoder for unconnected LVDS outputs

 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 16 ++++++++++++----
 drivers/gpu/drm/rcar-du/rcar_lvds.c       | 11 +++++++++++
 drivers/gpu/drm/rcar-du/rcar_lvds.h       |  5 +++++
 3 files changed, 28 insertions(+), 4 deletions(-)

-- 
Regards,

Laurent Pinchart
