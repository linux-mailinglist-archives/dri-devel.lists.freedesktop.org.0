Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E546F988F0E
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2024 13:28:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040F610E052;
	Sat, 28 Sep 2024 11:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bevd2xj4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFAAB10E052
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2024 11:28:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CD4305C549A;
 Sat, 28 Sep 2024 11:28:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C684AC4CEC3;
 Sat, 28 Sep 2024 11:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727522889;
 bh=HnqwsqxX6e/UhhhJRSVaLb04OKzlAy7bdb+ridZLIgY=;
 h=Date:From:To:Subject:From;
 b=bevd2xj4qrX2BqoZGePTT04a285AgkmV9s1r2vVALj2p6Nm2JzZz96xPcKp3HWGdr
 Kp2VQAOm7Z/a6NAEfnlniTDqXJn31saJ/BhzYO/4QOkEmqlTr5Frl7JE0EkO/vx7uX
 3TatZmcA+hkQkeV3CEgPYC385sdfLNJToOBWLwILXfiLAusRuiOMxP9L1nHCq+5b1j
 xvGMC564zBbsYVokqYSJ1AWyKqj6d6GsORdZOlvjYub45pUMIvsKwfUqMhPb/vmNW4
 lxJp3srU3r3Nu7BgFKsm/fl1+JabD+fRN3hM0Gsfqxxy9XTRkr0ISa8pAG1Lkz5maS
 6NIkmtKWXyLRA==
Date: Sat, 28 Sep 2024 13:28:04 +0200
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] additional fbdev fixes for v6.12-rc1
Message-ID: <ZvfoRGNbTUOzLL9X@carbonx1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi Linus,

please pull the last few fbdev fixes for this merge window.

Thanks!
Helge

----------------------------------------------------------------
The following changes since commit abf2050f51fdca0fd146388f83cddd95a57a008d:

  Merge tag 'media/v6.12-1' of git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media (2024-09-23 15:27:58 -0700)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.12-rc1-2

for you to fetch changes up to 9cf14f5a2746c19455ce9cb44341b5527b5e19c3:

  fbdev: sisfb: Fix strbuf array overflow (2024-09-28 00:42:11 +0200)

----------------------------------------------------------------
additional fbdev fixes for 6.12-rc1:

- crash fix in fbcon_putcs
- avoid a possible string memory overflow in sisfb
- minor code optimizations in omapfb and fbcon

----------------------------------------------------------------
Andrey Shumilin (1):
      fbdev: sisfb: Fix strbuf array overflow

Markus Elfring (1):
      fbdev: omapfb: Call of_node_put(ep) only once in omapdss_of_find_source_for_first_ep()

Qianqiang Liu (2):
      fbcon: Fix a NULL pointer dereference issue in fbcon_putcs
      fbcon: break earlier in search_fb_in_map and search_for_mapped_con

 drivers/video/fbdev/core/fbcon.c              | 10 ++++++++--
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c |  7 ++-----
 drivers/video/fbdev/sis/sis_main.c            |  2 +-
 3 files changed, 11 insertions(+), 8 deletions(-)
