Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1939C1089
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 22:06:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBBB10E8E4;
	Thu,  7 Nov 2024 21:06:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CBBC10E8E5
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2024 21:06:53 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1t99iN-0005xz-1j; Thu, 07 Nov 2024 22:06:51 +0100
Message-ID: <c84075a0257e7bee222d008fa3118117422d664e.camel@pengutronix.de>
Subject: [GIT PULL] etnaviv-next for 6.13
From: Lucas Stach <l.stach@pengutronix.de>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: kernel@pengutronix.de, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Thu, 07 Nov 2024 22:06:50 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
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

please pull the following changes for the next merge window. They were
all in linux-next for at least a week.

Regards,
Lucas

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc=
:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.pengutronix.de/git/lst/linux drm-etnaviv-next-2024-11-07

for you to fetch changes up to 2c7ac7dd1b6c295636849c242685b0dd15beb093:

  drm/etnaviv: etnaviv_cmdbuf.c: Drop the unneeded include of drm_mm.h (202=
4-10-28 16:51:27 +0100)

----------------------------------------------------------------
Lucas Stach (7):
      drm/etnaviv: hold GPU lock across perfmon sampling
      drm/etnaviv: assert GPU lock held in perfmon pipe_*_read functions
      drm/etnaviv: unconditionally enable debug registers
      drm/etnaviv: update hardware headers from rnndb
      drm/etnaviv: take current primitive into account when checking for hu=
ng GPU
      drm/etnaviv: always allocate 4K for kernel ringbuffers
      drm/etnaviv: flush shader L1 cache after user commandstream

Sui Jingfeng (9):
      drm/etnaviv: Use unsigned type to count the number of pages
      drm/etnaviv: Use 'unsigned' type to count the number of pages
      drm/etnaviv: Drop the <linux/pm_runtime.h> header
      drm/etnaviv: Fix missing mutex_destroy()
      drm/etnaviv: Replace the '&pdev->dev' with 'dev'
      drm/etnaviv: Record GPU visible size of GEM BO separately
      drm/etnaviv: Map and unmap GPUVA range with respect to the GPUVA size
      drm/etnaviv: Drop the 'struct etnaviv_iommu_global::pta_lock' data me=
mber
      drm/etnaviv: etnaviv_cmdbuf.c: Drop the unneeded include of drm_mm.h

Xiaolei Wang (1):
      drm/etnaviv: Request pages from DMA32 zone on addressing_limited

 drivers/gpu/drm/etnaviv/etnaviv_buffer.c     |  3 ++-
 drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c     |  4 +--
 drivers/gpu/drm/etnaviv/etnaviv_drv.c        | 21 +++++++++++----
 drivers/gpu/drm/etnaviv/etnaviv_gem.c        | 14 +++++-----
 drivers/gpu/drm/etnaviv/etnaviv_gem.h        |  5 ++++
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c  |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  1 -
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c        | 64 +++++++++++++++++++++---=
----------------------
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h        |  1 +
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c        | 40 ++++++++++--------------=
-----
 drivers/gpu/drm/etnaviv/etnaviv_mmu.h        |  1 -
 drivers/gpu/drm/etnaviv/etnaviv_perfmon.c    |  4 +++
 drivers/gpu/drm/etnaviv/etnaviv_sched.c      | 17 ++++++++++--
 drivers/gpu/drm/etnaviv/state_hi.xml.h       | 23 +++++++++--------
 14 files changed, 108 insertions(+), 92 deletions(-)

