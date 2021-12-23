Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E63247E868
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 20:36:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4CA10E3FC;
	Thu, 23 Dec 2021 19:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0B989CC1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 19:36:32 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1n0Tt8-0007Jw-Ib; Thu, 23 Dec 2021 20:36:30 +0100
Message-ID: <59619f8e9eb1d7ed7ea72cbead1f0aabc49f4e68.camel@pengutronix.de>
Subject: [GIT PULL] etnaviv-next for 5.17
From: Lucas Stach <l.stach@pengutronix.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 23 Dec 2021 20:36:29 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
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

Hi Dave, hi Daniel,

please pull the following etnaviv changes for the next merge window:
- make etnaviv work on IOMMU enabled systems
- fix mapping of command buffers on systems with more than 4GB RAM
- close a DoS vector
- fix spurious GPU resets

Regards,
Lucas

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.pengutronix.de/git/lst/linux etnaviv/next

for you to fetch changes up to cdd156955f946beaa5f3a00d8ccf90e5a197becc:

  drm/etnaviv: consider completed fence seqno in hang check (2021-12-23 20:21:33 +0100)

----------------------------------------------------------------
Lucas Stach (2):
      drm/etnaviv: limit submit sizes
      drm/etnaviv: consider completed fence seqno in hang check

Michael Walle (3):
      drm/etnaviv: use PLATFORM_DEVID_NONE
      drm/etnaviv: fix dma configuration of the virtual device
      drm/etnaviv: use a 32 bit mask as coherent DMA mask

Rikard Falkeborn (1):
      drm/etnaviv: constify static struct cooling_ops

 drivers/gpu/drm/etnaviv/etnaviv_drv.c        | 41 +++++++++++++++++++++++++++++++----------
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  6 ++++++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c        |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h        |  1 +
 drivers/gpu/drm/etnaviv/etnaviv_sched.c      |  4 +++-
 5 files changed, 42 insertions(+), 12 deletions(-)

