Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7702027F2
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jun 2020 04:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E296E400;
	Sun, 21 Jun 2020 02:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191AB6E400
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 02:17:46 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 75398734;
 Sun, 21 Jun 2020 04:17:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1592705864;
 bh=TlAR1DnkEg+nby5TORRqctjcunWsyMVE4xGJwxPUb1w=;
 h=Date:From:To:Cc:Subject:From;
 b=mMqgKxvdPB4qiC4ePuM4pKF7GigtzT0wOQZBXCXdew3uqosQSKTK0+6bf+2yLFXZ/
 XgdqAnnNDOCbvFd4IhDdrn2cCSCGl/rYrImzgVjjwkdsBM0qIJsBg33Y3+mhqDYpA1
 /su7yhmpJKLkMG+yxClMzTksyDZ3j1WV5jxpAzfs=
Date: Sun, 21 Jun 2020 05:17:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [GIT PULL FOR v5.8] R-Car DU fixes
Message-ID: <20200621021720.GA1569@pendragon.ideasonboard.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Just one small fix for the R-Car DU driver.

The following changes since commit 8a7a3d1d0dcf2bb63dafe7275020420005e13e54:

  Merge tag 'amd-drm-fixes-5.8-2020-06-17' of git://people.freedesktop.org/~agd5f/linux into drm-fixes (2020-06-19 10:02:30 +1000)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/du-fixes-20200621

for you to fetch changes up to 5f9af404eec82981c4345c9943be48422234e7ab:

  drm: rcar-du: Fix build error (2020-06-21 05:12:57 +0300)

----------------------------------------------------------------
Build fix for the R-Car DU DRM driver

----------------------------------------------------------------
Daniel Gomez (1):
      drm: rcar-du: Fix build error

 drivers/gpu/drm/rcar-du/Kconfig | 1 +
 1 file changed, 1 insertion(+)

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
