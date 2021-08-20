Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9D63F3273
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 19:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07946EAD8;
	Fri, 20 Aug 2021 17:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B366EAD8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 17:49:05 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1mH8db-0003cd-NP; Fri, 20 Aug 2021 19:49:03 +0200
Message-ID: <4d16197fa5e4147117fea842f1ed9f0fdadb1d57.camel@pengutronix.de>
Subject: [GIT PULL] etnaviv-next for 5.15
From: Lucas Stach <l.stach@pengutronix.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: kernel@pengutronix.de, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Fri, 20 Aug 2021 19:49:02 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34) 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

things are still slow in etnaviv land. Just one hardware support
addition for the GPU found on the NXP Layerscape LS1028A SoC from
Michael and the GEM mmap cleanup from Thomas.

Regards,
Lucas

The following changes since commit 8a02ea42bc1d4c448caf1bab0e05899dad503f74:

  Merge tag 'drm-intel-next-fixes-2021-06-29' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2021-06-30 15:42:05 +1000)

are available in the Git repository at:

  https://git.pengutronix.de/git/lst/linux 81fd23e2b3ccf71c807e671444e8accaba98ca53

for you to fetch changes up to 81fd23e2b3ccf71c807e671444e8accaba98ca53:

  drm/etnaviv: Implement mmap as GEM object function (2021-07-06 18:32:23 +0200)

----------------------------------------------------------------
Michael Walle (2):
      drm/etnaviv: add HWDB entry for GC7000 r6202
      drm/etnaviv: add clock gating workaround for GC7000 r6202

Thomas Zimmermann (1):
      drm/etnaviv: Implement mmap as GEM object function

 drivers/gpu/drm/etnaviv/etnaviv_drv.c       | 14 ++------------
 drivers/gpu/drm/etnaviv/etnaviv_drv.h       |  3 ---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c       | 18 +++++-------------
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 13 -------------
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c       |  6 ++++++
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c      | 31 +++++++++++++++++++++++++++++++
 6 files changed, 44 insertions(+), 41 deletions(-)

