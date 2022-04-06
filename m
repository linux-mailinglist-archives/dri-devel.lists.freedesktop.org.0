Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 799494F63F6
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 17:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F02110E3B0;
	Wed,  6 Apr 2022 15:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D3CC10E3B0
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 15:51:10 +0000 (UTC)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nc7w4-0000Pm-1I; Wed, 06 Apr 2022 17:51:08 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [GIT PULL] drm/imx: error handling and debug output fixes
Date: Wed,  6 Apr 2022 17:51:01 +0200
Message-Id: <20220406155101.1271845-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/imx-drm-fixes-2022-04-06

for you to fetch changes up to 070a88fd4a03f921b73a2059e97d55faaa447dab:

  gpu: ipu-v3: Fix dev_dbg frequency output (2022-04-04 09:37:42 +0200)

----------------------------------------------------------------
drm/imx: error handling and debug output fixes

Catch an EDID allocation failure in imx-ldb, fix a leaked drm display
mode on DT parsing error in parallel-display, properly remove the
dw_hdmi bridge in case the component_add fails in dw_hdmi-imx, and
fix the IPU clock frequency debug printout in ipu-di.

----------------------------------------------------------------
Jiasheng Jiang (1):
      drm/imx: imx-ldb: Check for null pointer after calling kmemdup

José Expósito (1):
      drm/imx: Fix memory leak in imx_pd_connector_get_modes

Leo Ruan (1):
      gpu: ipu-v3: Fix dev_dbg frequency output

Liu Ying (1):
      drm/imx: dw_hdmi-imx: Fix bailout in error cases of probe

 drivers/gpu/drm/imx/dw_hdmi-imx.c      | 8 +++++++-
 drivers/gpu/drm/imx/imx-ldb.c          | 2 ++
 drivers/gpu/drm/imx/parallel-display.c | 4 +++-
 drivers/gpu/ipu-v3/ipu-di.c            | 5 +++--
 4 files changed, 15 insertions(+), 4 deletions(-)
