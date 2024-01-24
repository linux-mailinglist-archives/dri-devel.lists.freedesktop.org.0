Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F83083AE13
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 17:12:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D741A10E986;
	Wed, 24 Jan 2024 16:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AE410EA3C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 16:12:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 202D261D9B;
 Wed, 24 Jan 2024 16:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D009C43399;
 Wed, 24 Jan 2024 16:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706112699;
 bh=888Xfe7DxNuyULyYMnQLFv/4qhy732lEuQhhLHccKJM=;
 h=Date:From:To:Subject:From;
 b=d9/2awFmfY5SR40WVEPzND3SxzZVzqC02DQ91vWwRZgxkwZLbaHV2+ktdkypf81ul
 3NXxi2bjLTjQrDDARp3GnRR8Se/coY383I3B9gOkTQu05i25nJ2rtzrm4L7ltzeMvT
 /VXuMKmYRS+nBaUuuuBOOO0SVs/yE5TIhXpu1ukoc1v9AoSiwLg3EfrD+uFnetjN+T
 VLfiKPfhLYguIP96eR36tYaoprW+ywAD9WxLI1s/H4pvmiDhzUC/iptShlS/gGEQl3
 qbyU4BoJshIgUUJunsNW8oJ8ZqLpJcSyFdbQNq1EMOIgHJyPmzhhdpbhoJfBFecULM
 DwnquqBb3d6hw==
Date: Wed, 24 Jan 2024 17:11:35 +0100
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev fix for v6.8-rc2
Message-ID: <ZbE2t9LoFlro7J-H@carbonx1>
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

please pull a small patch set with 3 fixes and 2 small cleanups for
fbdev for kernel 6.8-rc2:

A crash fix in stifb which was missed to be included in the drm-misc tree, two
checks to prevent wrong userspace input in sisfb and savagefb and two trivial
printk cleanups.

Thanks!
Helge

----------------------------------------------------------------
The following changes since commit 7a396820222d6d4c02057f41658b162bdcdadd0e:

  Merge tag 'v6.8-rc-part2-smb-client' of git://git.samba.org/sfrench/cifs-2.6 (2024-01-20 16:48:07 -0800)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.8-rc2

for you to fetch changes up to 4b088005c897a62fe98f70ab69687706cb2fad3b:

  fbdev: stifb: Fix crash in stifb_blank() (2024-01-23 09:13:24 +0100)

----------------------------------------------------------------
fbdev fixes and cleanups for 6.8-rc2:

- stifb: Fix crash in stifb_blank()
- savage/sis: Error out if pixclock equals zero
- minor trivial cleanups

----------------------------------------------------------------
Fullway Wang (2):
      fbdev: savage: Error out if pixclock equals zero
      fbdev: sis: Error out if pixclock equals zero

Geert Uytterhoeven (1):
      fbcon: Fix incorrect printed function name in fbcon_prepare_logo()

Helge Deller (1):
      fbdev: stifb: Fix crash in stifb_blank()

Jiapeng Chong (1):
      fbdev: vt8500lcdfb: Remove unnecessary print function dev_err()

 drivers/video/fbdev/core/fbcon.c             | 3 +--
 drivers/video/fbdev/savage/savagefb_driver.c | 3 +++
 drivers/video/fbdev/sis/sis_main.c           | 2 ++
 drivers/video/fbdev/stifb.c                  | 2 +-
 drivers/video/fbdev/vt8500lcdfb.c            | 1 -
 5 files changed, 7 insertions(+), 4 deletions(-)
