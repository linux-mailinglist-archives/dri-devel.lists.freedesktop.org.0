Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9892EF7A5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 19:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA3D89FD7;
	Fri,  8 Jan 2021 18:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF8E989FD7
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 18:48:44 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kxwoU-0007Xj-Jj; Fri, 08 Jan 2021 19:48:42 +0100
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kxwoT-0007p1-JR; Fri, 08 Jan 2021 19:48:41 +0100
Message-ID: <8c048f3677f706de306c19ecf6868c4109c1c40d.camel@pengutronix.de>
Subject: [GIT PULL] drm/imx: compile test fixes
From: Philipp Zabel <p.zabel@pengutronix.de>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 08 Jan 2021 19:48:41 +0100
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,
this PR includes two fixes for x86_64 COMPILE_TEST builds with CONFIG_OF
disabled.

The following changes since commit 16da8e9a7767ac77720f49bfa870def61a250cda:

  drm/imx: ipuv3-crtc: use drm managed resources (2021-01-04 12:59:34 +0100)

are available in the Git repository at:

  git://git.pengutronix.de/git/pza/linux.git tags/imx-drm-next-2021-01-08

for you to fetch changes up to 82581fcf070b68a91fb3a3ade08d9a76380a4789:

  drm/modes: add non-OF stub for of_get_drm_display_mode (2021-01-08 19:42:14 +0100)

----------------------------------------------------------------
drm/imx: compile test fixes

- Fix COMPILE_TEST builds with CONFIG_OF disabled.

----------------------------------------------------------------
Philipp Zabel (2):
      drm/imx: dw_hdmi-imx: depend on OF to fix randconfig compile tests on x86_64
      drm/modes: add non-OF stub for of_get_drm_display_mode

 drivers/gpu/drm/imx/Kconfig |  2 +-
 include/drm/drm_modes.h     | 10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
