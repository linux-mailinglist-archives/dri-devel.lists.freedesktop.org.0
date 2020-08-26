Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 689D62532E8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 17:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BDB86E158;
	Wed, 26 Aug 2020 15:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45DD6E14C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 15:07:56 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1kAx1k-0007zl-Jm; Wed, 26 Aug 2020 17:07:52 +0200
Message-ID: <aceebfe3af636346f5252bdf727cdd988bdcbdf2.camel@pengutronix.de>
Subject: [GIT PULL] etnaviv fixes for 5.9-rc3
From: Lucas Stach <l.stach@pengutronix.de>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 26 Aug 2020 17:08:08 +0200
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, hi Daniel,

please pull the following two fixes for the current release cycle. One
fixes a bad interaction with the DRM scheduler, leading to some dma
fences not getting signalled after hitting the job timeout. The other
one fixes a GPU init regression, as apparently one old core doesn't
likes us reading some of the identification registers.

Regards,
Lucas

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  https://git.pengutronix.de/git/lst/linux etnaviv/fixes

for you to fetch changes up to 50248a3ec0f5e5debd18033eb2a29f0b793a7000:

  drm/etnaviv: always start/stop scheduler in timeout processing (2020-08-24 17:21:21 +0200)

----------------------------------------------------------------
Christian Gmeiner (1):
      drm/etnaviv: fix external abort seen on GC600 rev 0x19

Lucas Stach (1):
      drm/etnaviv: always start/stop scheduler in timeout processing

 drivers/gpu/drm/etnaviv/etnaviv_gpu.c   | 11 +++++++++--
 drivers/gpu/drm/etnaviv/etnaviv_sched.c | 11 ++++++-----
 2 files changed, 15 insertions(+), 7 deletions(-)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
