Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F338331D2
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jan 2024 01:28:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE0E10EAAC;
	Sat, 20 Jan 2024 00:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8215110EAAC
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jan 2024 00:27:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AEBB161615;
 Sat, 20 Jan 2024 00:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B87C433F1;
 Sat, 20 Jan 2024 00:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705710430;
 bh=eFZZHeFIEdrm6Tlw6JWcfEH9KGbKVjVZcPqshvBe76A=;
 h=Date:From:To:Cc:Subject:From;
 b=A7IygPPPKF9rB3KcOoqjjMPcFtnUCVKWyR3OIeXuw0hoxtIEudxuBzCPiV47lDLtF
 T0GGYbP/a4F2kZErEhjfxAaSFISSAJnwPwZHe8xDaauNxCVoR37wyrWFSantkCT/Xq
 VjWsVbMW5dwYPlYn8+PGfwUKF2hFH92++cKt5IUWsu1GT8lpZ36jCfaUiWkeyHFTTI
 Y8atV2PF1RFXEbBMvuQMYDyiKcK6G6hrM0NHfD5UcNhYkVKCZKsGXumomPlSeGHJms
 0pAQ0LhjnDywsfXFPAlzRiyetp+yRaliPL82Z9EkOJrAbUSI5HYQ2aqcvp5P51mLs0
 XMpJ76Lueq2SA==
Date: Sat, 20 Jan 2024 01:27:05 +0100
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] One fbdev regression fix for v6.8-rc1
Message-ID: <ZasTWVn1lzY6oVym@carbonx1>
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
Cc: Jens Axboe <axboe@kernel.dk>, Thomas Zimmermann <tzimmermann@suse.de>,
 Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

there were various reports from people without any graphics
output on the screen and it turns out one commit triggers
the problem.
Please pull a single revert for now for -rc1 to fix this regression.
We will work out how to fix it correctly later.

Thanks!
Helge

----------------------------------------------------------------
The following changes since commit 556e2d17cae620d549c5474b1ece053430cd50bc:

  Merge tag 'ceph-for-6.8-rc1' of https://github.com/ceph/ceph-client (2024-01-19 09:58:55 -0800)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.8-rc1-2

for you to fetch changes up to 2bebc3cd48701607e38e8258ab9692de9b1a718b:

  Revert "firmware/sysfb: Clear screen_info state after consuming it" (2024-01-19 22:22:26 +0100)

----------------------------------------------------------------
fbdev fix for 6.8-rc1:

- Revert "firmware/sysfb: Clear screen_info state after consuming it"

----------------------------------------------------------------
Helge Deller (1):
      Revert "firmware/sysfb: Clear screen_info state after consuming it"

 drivers/firmware/sysfb.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)
