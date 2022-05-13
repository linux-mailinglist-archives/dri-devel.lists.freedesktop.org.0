Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CFB526739
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 18:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECAA110E2B1;
	Fri, 13 May 2022 16:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711ED10E21B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 16:39:45 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1npYKN-0007K3-8Y; Fri, 13 May 2022 18:39:43 +0200
Message-ID: <ffae9f7d03ca7a9e00da16d5910ae810befd3c5a.camel@pengutronix.de>
Subject: [GIT PULL] etnaviv-next for 5.19
From: Lucas Stach <l.stach@pengutronix.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 13 May 2022 18:39:42 +0200
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
Cc: dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, hi Daniel,

please pull the following etnaviv changes for the next merge window,
which fix address space collisions in some edge cases when userspace is
using softpin and cleans up the MMU reference handling a bit.

Regards,
Lucas

The following changes since commit f443e374ae131c168a065ea1748feac6b2e76613:

  Linux 5.17 (2022-03-20 13:14:17 -0700)

are available in the Git repository at:

  https://git.pengutronix.de/git/lst/linux etnaviv/next

for you to fetch changes up to 2829a9fcb738f742baad9d15de4c6eac84bcfd08:

  drm/etnaviv: reap idle softpin mappings when necessary (2022-04-06 10:01:51 +0200)

----------------------------------------------------------------
Lucas Stach (4):
      drm/etnaviv: check for reaped mapping in etnaviv_iommu_unmap_gem
      drm/etnaviv: move MMU context ref/unref into map/unmap_gem
      drm/etnaviv: move flush_seq increment into etnaviv_iommu_map/unmap
      drm/etnaviv: reap idle softpin mappings when necessary

 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 11 ++----
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 54 ++++++++++++++++++++++++++-
 2 files changed, 55 insertions(+), 10 deletions(-)



