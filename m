Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4A98C696C
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 17:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD7E10E0B9;
	Wed, 15 May 2024 15:12:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vFgnIH4x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E8F10E0B9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 15:12:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 782FD614E3;
 Wed, 15 May 2024 15:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5722FC4AF11;
 Wed, 15 May 2024 15:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715785977;
 bh=MohQRmuzij8zaBjvSZ6XgNSJTKoAkymN8xRjFcjX1xw=;
 h=Date:From:To:Subject:From;
 b=vFgnIH4x9Jwg2t+XFj1osZJGM2+MM6XiahjRQBHPWE/OR2xFNrrnIOfiLM45840B2
 NRdRLZ/AvHv4NnSlvQ6zX+cIwBdd2O2XsjNMai2ShUT6uxrIeM/gyzNsgtgu7WOoTF
 SQc69hKVbpc6N9oOtfQF+LxRZ2PfEjGbxOvrgMQnb6sANNcGSE6z9KBE9tGnmvxWbF
 upA/nVAzEEpgU4XQPcUTPc+gXGoCr5uo8NUvoJ+0xcuBjIsciDpxYR3sftnWzCa/U6
 45NUgg3Lu8q8B20u8dML900U1ZDI1N0jFrmLtEKkInBshKK4KnDQHW9WpiUleZD0Q2
 lz0K7Y+dUuNLw==
Date: Wed, 15 May 2024 17:12:52 +0200
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev fixes and cleanups for v6.10-rc1
Message-ID: <ZkTQ9JoGXFwuMzZS@carbonx1>
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

please pull some fixes and cleanups for the fbdev drivers for kernel 6.10-rc1.

Code cleanups for offb, shmobile, sisfb, savage, au1200fb, uvesafb,
omap2 and sh7760fb, as well as the addition of some HAS_IOPORT
dependencies and adjustment of generated logo file to make build
reproducible.

Thanks!
Helge

----------------------------------------------------------------
The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.10-rc1

for you to fetch changes up to ce4a7ae84a58b9f33aae8d6c769b3c94f3d5ce76:

  fbdev: offb: replace of_node_put with __free(device_node) (2024-04-25 12:13:06 +0200)

----------------------------------------------------------------
fbdev fixes and cleanups for 6.10-rc1:

Code cleanups for offb, shmobile, sisfb, savage, au1200fb, uvesafb,
omap2 and sh7760fb, as well as the addition of some HAS_IOPORT
dependencies and adjustment of generated logo file to make build
reproducible.

----------------------------------------------------------------
Abdulrasaq Lawani (1):
      fbdev: offb: replace of_node_put with __free(device_node)

Arnd Bergmann (2):
      fbdev: shmobile: fix snprintf truncation
      fbdev: sisfb: hide unused variables

Cai Xinchen (1):
      fbdev: savage: Handle err return when savagefb_check_var failed

Justin Stitt (4):
      fbdev: fsl-diu-fb: replace deprecated strncpy with strscpy_pad
      fbdev: au1200fb: replace deprecated strncpy with strscpy
      fbdev: uvesafb: replace deprecated strncpy with strscpy_pad
      video: hdmi: prefer length specifier in format over string copying

Kuninori Morimoto (1):
      fbdev: omap2: replace of_graph_get_next_endpoint()

Lucas Stach (1):
      video: logo: Drop full path of the input filename in generated file

Niklas Schnelle (1):
      fbdev: add HAS_IOPORT dependencies

Randy Dunlap (1):
      fbdev: sh7760fb: allow modular build

 drivers/video/fbdev/Kconfig                   | 26 +++++++++++++-------------
 drivers/video/fbdev/au1200fb.c                |  2 +-
 drivers/video/fbdev/fsl-diu-fb.c              |  2 +-
 drivers/video/fbdev/offb.c                    |  3 +--
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c    |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 20 +-------------------
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c  |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c  |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/venc.c   |  3 ++-
 drivers/video/fbdev/pxafb.c                   |  2 +-
 drivers/video/fbdev/savage/savagefb_driver.c  |  5 ++++-
 drivers/video/fbdev/sh_mobile_lcdcfb.c        |  2 +-
 drivers/video/fbdev/sis/init301.c             |  3 +--
 drivers/video/fbdev/uvesafb.c                 |  2 +-
 drivers/video/hdmi.c                          | 10 ++--------
 drivers/video/logo/pnmtologo.c                |  2 --
 include/video/omapfb_dss.h                    |  3 ---
 17 files changed, 35 insertions(+), 59 deletions(-)
