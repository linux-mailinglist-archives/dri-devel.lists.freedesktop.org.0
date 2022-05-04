Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E4651A27F
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 16:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918F110F095;
	Wed,  4 May 2022 14:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E8810F095
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 14:46:35 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nmGGu-0005HK-C2; Wed, 04 May 2022 16:46:32 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [GIT PULL] drm/imx: various cleanups
Date: Wed,  4 May 2022 16:46:28 +0200
Message-Id: <20220504144628.3954620-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
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

  git://git.pengutronix.de/pza/linux.git tags/imx-drm-next-2022-05-04

for you to fetch changes up to 927d8fd465adbaaad6cce82f840d489d7c378f29:

  drm/imx: ipuv3-plane: Remove redundant color encoding and range initialisation (2022-04-04 09:34:21 +0200)

----------------------------------------------------------------
drm/imx: various cleanups

- Use swap() instead of open-coding in ipu-image-convert.
- Use devm_platform_ioremap_resource() helper in imx-tve.
- Make static channel_offsets array const in ipu-dc.
- Remove redundant zpos, color encoding and range initialization.

----------------------------------------------------------------
Cai Huoqing (1):
      drm/imx: imx-tve: Make use of the helper function devm_platform_ioremap_resource()

Colin Ian King (1):
      drm/imx: make static read-only array channel_offsets const

Maxime Ripard (2):
      drm/imx: ipuv3-plane: Remove redundant zpos initialisation
      drm/imx: ipuv3-plane: Remove redundant color encoding and range initialisation

Salah Triki (1):
      gpu: ipu-v3: image-convert: use swap()

 drivers/gpu/drm/imx/imx-tve.c          | 4 +---
 drivers/gpu/drm/imx/ipuv3-plane.c      | 8 +-------
 drivers/gpu/ipu-v3/ipu-dc.c            | 5 +++--
 drivers/gpu/ipu-v3/ipu-image-convert.c | 9 +++------
 4 files changed, 8 insertions(+), 18 deletions(-)
