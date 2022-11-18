Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5F962F854
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 15:54:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C990B10E758;
	Fri, 18 Nov 2022 14:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525EC10E754
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 14:54:15 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ow2ku-0005ve-Tv; Fri, 18 Nov 2022 15:54:12 +0100
Message-ID: <adcb1b3dec89a18d6c3c4ee6e179b9b2c9f25046.camel@pengutronix.de>
Subject: [GIT PULL] etnaviv-next for 6.2
From: Lucas Stach <l.stach@pengutronix.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 18 Nov 2022 15:54:11 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: kernel@pengutronix.de, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, hi Daniel,

please pull the following etnaviv changes for the next merge window.
Mostly some small workarounds to get new hardware support going. But
also more fixes to the softpin MMU handling and a nice addition from
Christian to make the kernel logs on hang detection more useful.

Regards,
Lucas

The following changes since commit 3d7cb6b04c3f3115719235cc6866b10326de34cd:

  Linux 5.19 (2022-07-31 14:03:01 -0700)

are available in the Git repository at:

  https://git.pengutronix.de/git/lst/linux etnaviv/next

for you to fetch changes up to a3b4c2f9b03917d5d640bc6e3f42c24695967552:

  drm/etnaviv: switch to PFN mappings (2022-11-16 21:36:38 +0100)

----------------------------------------------------------------
Christian Gmeiner (1):
      drm/etnaviv: print offender task information on hangcheck recovery

Doug Brown (2):
      drm/etnaviv: add missing quirks for GC300
      drm/etnaviv: fix power register offset on GC300

Lucas Stach (4):
      drm/etnaviv: move idle mapping reaping into separate function
      drm/etnaviv: reap idle mapping if it doesn't match the softpin address
      drm/etnaviv: don't truncate physical page address
      drm/etnaviv: switch to PFN mappings

Marco Felsch (2):
      drm/etnaviv: disable tx clock gating for GC7000 rev6203
      drm/etnaviv: add HWDB entry for GC7000 r6203

T.J. Mercier (1):
      drm/etnaviv: Remove duplicate call to drm_gem_free_mmap_offset

 drivers/gpu/drm/etnaviv/etnaviv_dump.c       |  7 +++++-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c        | 19 +++++++++------
 drivers/gpu/drm/etnaviv/etnaviv_gem.h        |  1 +
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  6 +++++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c        | 58 ++++++++++++++++++++++++++++++++--------------
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h        | 23 +++++++++++++++++-
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c       | 31 +++++++++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c        | 27 +++++++++++++--------
 drivers/gpu/drm/etnaviv/etnaviv_mmu.h        |  1 +
 drivers/gpu/drm/etnaviv/etnaviv_sched.c      |  2 +-
 10 files changed, 138 insertions(+), 37 deletions(-)

