Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E84226D2D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 19:34:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC09089D73;
	Mon, 20 Jul 2020 17:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB2789D73
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 17:34:23 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1jxZgD-0002zv-3r; Mon, 20 Jul 2020 19:34:21 +0200
Message-ID: <d9e2660d71051bf3cab8aa7afc9f62102ac910d9.camel@pengutronix.de>
Subject: [GIT PULL] etnaviv-next for 5.9
From: Lucas Stach <l.stach@pengutronix.de>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 20 Jul 2020 19:34:19 +0200
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

please pull the following etnaviv updates for 5.9.

Nothing too exciting:
- a cleanup of our clock handling and improved error handling in this
area from Lubomir
- conversion to pin_user_pages for long page references from John
- fixed PM runtime API error handling from Navid

Regards,
Lucas

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  https://git.pengutronix.de/git/lst/linux etnaviv/next

for you to fetch changes up to c5d5a32ead1e3a61a07a1e59eb52a53e4a6b2a7f:

  drm/etnaviv: fix ref count leak via pm_runtime_get_sync (2020-07-17 17:10:34 +0200)

----------------------------------------------------------------
John Hubbard (1):
      drm/etnaviv: convert get_user_pages() --> pin_user_pages()

Lubomir Rintel (4):
      drm/etnaviv: Fix error path on failure to enable bus clk
      drm/etnaviv: Don't ignore errors on getting clocks
      drm/etnaviv: Make the "core" clock mandatory
      drm/etnaviv: Simplify clock enable/disable

Navid Emamdoost (1):
      drm/etnaviv: fix ref count leak via pm_runtime_get_sync

 drivers/gpu/drm/etnaviv/etnaviv_gem.c |  6 ++--
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 80 +++++++++++++++++++++++++----------------------------
 2 files changed, 40 insertions(+), 46 deletions(-)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
