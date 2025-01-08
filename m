Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1162A062B8
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 17:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3DA10E8FB;
	Wed,  8 Jan 2025 16:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C013510E8FB
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 16:55:32 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1tVZJ1-00089f-Im; Wed, 08 Jan 2025 17:53:19 +0100
Message-ID: <41c1e476c6014010247d164ac8d21bd6f922cce1.camel@pengutronix.de>
Subject: [GIT PULL] etnaviv-next for 6.14
From: Lucas Stach <l.stach@pengutronix.de>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: kernel@pengutronix.de, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Wed, 08 Jan 2025 17:53:19 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, hi Sima,

please pull the following changes for the next merge window. This time
mostly cleanups from Jingfeng, but also explicit reset handling for
SoCs where this isn't done as part of a powerdomain from Philippe and
fdinfo memory stats support from Christian.

Regards,
Lucas

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37=
:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.pengutronix.de/git/lst/linux tags/drm-etnaviv-next-2025-01-08

for you to fetch changes up to 6bde14ba5f7ef59e103ac317df6cc5ac4291ff4a:

  drm/etnaviv: add optional reset support (2024-12-20 19:25:51 +0100)

----------------------------------------------------------------
- cleanups
- add fdinfo memory support
- add explicit reset handling

----------------------------------------------------------------
Christian Gmeiner (1):
      drm/etnaviv: Add fdinfo support for memory stats

Easwar Hariharan (1):
      drm/etnaviv: Convert timeouts to secs_to_jiffies()

LECOINTRE Philippe (1):
      drm/etnaviv: add optional reset support

Sui Jingfeng (6):
      drm/etnaviv: Drop unused data member from the etnaviv_gem_object stru=
cture
      drm/etnaviv: etnaviv_cmdbuf.c: Drop the unneeded 'etnaviv_perfmon.h' =
header
      drm/etnaviv: Fix page property being used for non writecombine buffer=
s
      drm/etnaviv: Drop the offset in page manipulation
      drm/etnaviv: Fix the debug log of the etnaviv_iommu_map()
      drm/etnaviv: Improve VA, PA, SIZE alignment checking

 drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c |  3 +--
 drivers/gpu/drm/etnaviv/etnaviv_drv.c    | 12 +++++++++++-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c    | 28 ++++++++++++++++++++++++++--
 drivers/gpu/drm/etnaviv/etnaviv_gem.h    |  2 --
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c    | 41 ++++++++++++++++++++++++++++=
+++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h    |  2 ++
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c    | 26 +++++++++++---------------
 7 files changed, 92 insertions(+), 22 deletions(-)
