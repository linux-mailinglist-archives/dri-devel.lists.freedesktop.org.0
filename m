Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CCB6D0AE2
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 18:19:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F4D10E00C;
	Thu, 30 Mar 2023 16:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D923E10E00C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 16:19:40 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1phuzy-0001Q9-2Q; Thu, 30 Mar 2023 18:19:38 +0200
Message-ID: <de8e08c2599ec0e22456ae36e9757b9ff14c2124.camel@pengutronix.de>
Subject: [GIT PULL] etnaviv-fixes for 6.3
From: Lucas Stach <l.stach@pengutronix.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 30 Mar 2023 18:19:36 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
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
Cc: kernel@pengutronix.de, Danilo Krummrich <dakr@redhat.com>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

please pull the following fixes for the next rc. One fix to get rid of
a memory leak showing up in the wild and two reverts to get rid of the
scheduler use-after-free reported by Danilo.

Regards,
Lucas

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6=
:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  https://git.pengutronix.de/git/lst/linux etnaviv/fixes

for you to fetch changes up to baad10973fdb442912af676de3348e80bd8fe602:

  Revert "drm/scheduler: track GPU active time per entity" (2023-03-30 17:4=
7:05 +0200)

----------------------------------------------------------------
Lucas Stach (3):
      drm/etnaviv: fix reference leak when mmaping imported buffer
      Revert "drm/etnaviv: export client GPU usage statistics via fdinfo"
      Revert "drm/scheduler: track GPU active time per entity"

 drivers/gpu/drm/etnaviv/etnaviv_drv.c       | 43 +------------------------=
------------------
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 10 +++++++++-
 drivers/gpu/drm/scheduler/sched_main.c      |  6 ------
 include/drm/gpu_scheduler.h                 |  7 -------
 4 files changed, 10 insertions(+), 56 deletions(-)

