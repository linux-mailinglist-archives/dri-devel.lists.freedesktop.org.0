Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C41003511DA
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 11:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D4E6E104;
	Thu,  1 Apr 2021 09:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C2F6E104
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 09:22:38 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1lRtXA-00045i-GU; Thu, 01 Apr 2021 11:22:36 +0200
Received: from pza by dude02.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1lRtX9-0003Xz-DJ; Thu, 01 Apr 2021 11:22:35 +0200
Date: Thu, 1 Apr 2021 11:22:35 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [GIT PULL] drm/imx: fixes for v5.12
Message-ID: <20210401092235.GA13586@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:10:50 up 119 days, 21:26, 115 users,  load average: 0.18, 0.61,
 2.47
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

this PR includes a regression fix for the imx-ldb driver, which fails to
register channel 1 if channel 0 is disabled since v5.12-rc2.
Also, there's an imx-ldb build warning fix for W=1 builds and a fix for
a memory leak in the imx-drm-core bind error path.

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.pengutronix.de/git/pza/linux.git tags/imx-drm-fixes-2021-04-01

for you to fetch changes up to 33ce7f2f95cabb5834cf0906308a5cb6103976da:

  drm/imx: imx-ldb: fix out of bounds array access warning (2021-03-25 07:48:34 +0100)

----------------------------------------------------------------
drm/imx: imx-drm-core and imx-ldb fixes

Fix a memory leak in an error path during DRM device initialization,
fix the LDB driver to register channel 1 even if channel 0 is unused,
and fix an out of bounds array access warning in the LDB driver.

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/imx: imx-ldb: fix out of bounds array access warning

Liu Ying (1):
      drm/imx: imx-ldb: Register LDB channel1 when it is the only channel to be used

Pan Bian (1):
      drm/imx: fix memory leak when fails to init

 drivers/gpu/drm/imx/imx-drm-core.c |  2 +-
 drivers/gpu/drm/imx/imx-ldb.c      | 12 +++++++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
