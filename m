Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 448E69D76CB
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 18:38:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA5310E5A2;
	Sun, 24 Nov 2024 17:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iuLcgPE6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3ECE10E5A2
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 17:38:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 76C54A40F7B;
 Sun, 24 Nov 2024 17:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D09E2C4CED8;
 Sun, 24 Nov 2024 17:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732469911;
 bh=HxTYlh3ZiQ6RZupeK62kAyRgWiWDGmzBXEGGc5CWI4k=;
 h=Date:From:To:Subject:From;
 b=iuLcgPE6ckXSU0xRVeNsTB6l2H0Gv2iF1wq7juLYDbQEW3sy7bx5LG+izQkra0srH
 CI7K9HNj6TiRYUY7h+y7V3nBEZAMdroJhR8oqEzE+fpTI8QdTsvN43Wc9Z8L+JJUfm
 sR5HtDb0a5Mlh/QUww5BwAs4dXY4ZMVI10tXMa45lEoisHrOa+pWhyxDcsIQ6CNmpx
 cqUrMKeeQvDWUp8TFoVLZd+Cxkc9DsQhgMH5U/qrsDIlObFkpwFU417I3Wrn7Sc4VH
 UMqFTtZoSDnjah7E4bwMRs4dX1qqA5a1PRCbklbKDcnQp45wykrBi+ilTGMnLytiEv
 qceZq+Qcg4F4w==
Date: Sun, 24 Nov 2024 18:38:26 +0100
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev fixes and cleanups for v6.13-rc1
Message-ID: <Z0NkkihDqEwi3k9Y@carbonx1>
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

please pull two patches for fbdev for this merge window:
One removes a memory leak in an error path, the other drops unused code.

Thanks,
Helge

----------------------------------------------------------------
The following changes since commit 2d5404caa8c7bb5c4e0435f94b28834ae5456623:

  Linux 6.12-rc7 (2024-11-10 14:19:35 -0800)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.13-rc1

for you to fetch changes up to 8d7493133bfd89322349be3daaf39a256e4354ac:

  fbdev: omapfb: Remove some deadcode (2024-11-14 15:30:36 +0100)

----------------------------------------------------------------
fbdev fixes and updates for 6.13-rc1:

- omapfb: Remove unused code (Dr. David Alan Gilbert)
- sh7760fb: Fix memory leak in error path of sh7760fb_alloc_mem()
  (Zhen Lei)

----------------------------------------------------------------
Dr. David Alan Gilbert (1):
      fbdev: omapfb: Remove some deadcode

Zhen Lei (1):
      fbdev: sh7760fb: Fix a possible memory leak in sh7760fb_alloc_mem()

 drivers/video/fbdev/omap2/omapfb/dss/dispc.c | 27 ---------------------------
 drivers/video/fbdev/omap2/omapfb/dss/dss.h   |  3 ---
 drivers/video/fbdev/sh7760fb.c               |  3 +--
 3 files changed, 1 insertion(+), 32 deletions(-)
