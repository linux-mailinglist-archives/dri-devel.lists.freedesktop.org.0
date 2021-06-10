Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 594103A2C9E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 15:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EEF6ED0F;
	Thu, 10 Jun 2021 13:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC5A6ED11
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 13:14:03 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1lrKVV-0006h8-CK; Thu, 10 Jun 2021 15:14:01 +0200
Message-ID: <f27e1ec2c2fea310bfb6fe6c99174a54e9dfba83.camel@pengutronix.de>
Subject: [GIT PULL] etnaviv-next
From: Lucas Stach <l.stach@pengutronix.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 10 Jun 2021 15:14:00 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
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
Cc: kernel@pengutronix.de, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

please pull the following updates for the next merge window:

- remove redundant NULL checks by various people
- fix sparse checker warnings from Marc
- expose more GPU ID values to userspace from Christian
- add HWDB entry for GPU found on i.MX8MP from Sascha
- rework of the linear window calculation to better deal with
  systems with large regions of reserved RAM
 
Regards,
Lucas

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.pengutronix.de/git/lst/linux etnaviv/next

for you to fetch changes up to 989c9dad613155a60f15747e3f1db210a6304ecf:

  drm/etnaviv: add HWDB entry for GC7000 rev 6204 (2021-06-10 15:09:40 +0200)

----------------------------------------------------------------
Christian Gmeiner (1):
      drm/etnaviv: provide more ID values via GET_PARAM ioctl.

Jiapeng Chong (1):
      drm/etnaviv: Remove redundant NULL check

Lucas Stach (1):
      drm/etnaviv: rework linear window offset calculation

Marc Kleine-Budde (1):
      drm/etnaviv: dump: fix sparse warnings

Sascha Hauer (1):
      drm/etnaviv: add HWDB entry for GC7000 rev 6204

Tian Tao (2):
      drm/etnaviv: fix NULL check before some freeing functions is not needed
      drm/etnaviv: Remove useless error message

 drivers/gpu/drm/etnaviv/etnaviv_dump.c       |  8 +++---
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c  |  3 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 12 +++-----
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c        | 68 ++++++++++++++++++++++++++--------------------
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c       | 31 +++++++++++++++++++++
 include/uapi/drm/etnaviv_drm.h               |  3 ++
 6 files changed, 82 insertions(+), 43 deletions(-)

