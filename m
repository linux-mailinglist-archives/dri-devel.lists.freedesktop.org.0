Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 645EE65E991
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 12:12:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9944C10E00E;
	Thu,  5 Jan 2023 11:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF4410E00E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 11:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1672917115; bh=2psywJD0ltCCOMcTQ5gz0vvkjmYSTOoDVOv1QCwRRL4=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=D3AME5c5gVXMq+PRGRvsUC/4aU70O2Pgo1AHYSK1+CquJ47R9GorJU8EEbdBIutEE
 7u1VK66glWAgsvKJO5ryU1KaEG9Jx2b10tUZCcYt2FfmHPXvGVQ5yFcCKhxZ7SnSS+
 PuLZ4297wWm8lyCp7PibaiMVlLI7UrS4MsvAK0cktm5Nw4XiV1Dq8a7zDLVOYBmyqZ
 0q14AZp8Z98/XF+MRilJCg/9P7OqbQdUcCcH7NoC9E0oFHm2pCa4MClE0qgoB8ySju
 sOlRMAheHcxrsbIS6VL6b4U6eY4UtMW0VgRKatoXC73H6DKDajPbgCXUtuY0Ipy8F7
 x7AcZ/Do8P4Jw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ls3530 ([92.116.173.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUXpQ-1pMDpj2ztg-00QP1Y; Thu, 05
 Jan 2023 12:11:55 +0100
Date: Thu, 5 Jan 2023 12:11:54 +0100
From: Helge Deller <deller@gmx.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL - v2] fbdev fixes for v6.2-rc3
Message-ID: <Y7aweqyDS7EmnDj8@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:1b9F7qiDxRkYdivp9Jy0MSBAw5zWiAsLkwD6ftvjXO/Zhg0D/0s
 hO57KSotWfFo5krUQ05YCK251dQhC/5hBqWdRPsNaRHerSCmHdrdXAy4qC31zBhJlc6hMaJ
 ub8fQ8WbIdSCn24V1pOS4g1a0cpjQw+59nBxq5djnBnw5yUmO7EPy/ft82IRejd8y41KY0z
 dM4Ji8oxZimxhi4zKBVmA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8afJu4KjM9w=;V7SliJC8gO4zW/U70BtuakVzi+I
 VY+H/k48646ruuGZB6I0+ZBsWxNiVHlOGT7wcrIukHhiQ41hwbvBlPMlMnMBadmNhlsEZyInw
 WK14+lrM0FFl26UKUn5UkUExFJjDRC4rAiG05ZqsWAbzdBbJnTwEsCd/V+5RdphsWMtVnGgmv
 Cma8ccEYftTgVnKyvpDYFjYBgzQmo8gyGmF1ZQBihjDgZXAStDZGUwpNgw3MWFOQo4R3elRjm
 Ec5MWifPP82s3OSPTtQNlqdrW3JVMOUu+SvfqpeTYXh0Q2GzW5FOIooIPGuW3GFC+nHTPDeff
 WYXM8K63IET1gCShiSRQoKajZl0hCLdXeVvbfl39OWPiztJDtQ8uTgMK8S/jCxT5Sj3qMMU/d
 btYgRsd/IWOkSKotjsEdMcq4NbYh2T5kMuRcMOfDALhvun+6OL7f0urWPlkV4XkRDtVNNB8Yj
 UyYMXZZG6zKpuJKdWupO5BZIkHgrJYhTcLy+DzVZ8SUKmnCY349cFUGzmbix+fBX5UhSh2se6
 dM/HuU1bfOOSd0mp1wX6uPj0bJ0F8nyngSE7yrkM1xTn+mmBMXIUNxu2JkFNkRB+7AHGjzKtn
 YWD2hJ32jeWarBP7gVFumIN/rTfdjm3aBWU1KNpWIUBS/rnkm3AiKfdfX+cy/F1/0dF7tRvp1
 ytsgHQ3utkiwruuLPoSv3KJ44xF76d15qAC40h1LviDBs0d6dPu+Hbta4fJLFe6QrQPJSAJ7Q
 A/jii9iE4WXxxRCYoXrcUAsJQOHRcvx0pl84qajc3pdXrHOVCna/0gur1lUSlmwyjkdxr1LB7
 eLVVtQjTKBXe6N1JHFpvTzt8JSjljAuW2jO5ZpGxj+2bpA9XNeHWKT2g6btcRLSveeID0vM1t
 5I/yTYjzjXL4aKzGYiS8MkwiUVS8Cyfw8uKvSc3dYnrgXgmUWo7aWlr8r0Q23CMEnf+/p/Cf3
 yoVMmIET9FvkYXVsyYrl8EQeGAI=
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

please pull the fbdev driver updates for 6.2-rc3, to receive
small fixes for matroxfb, offb and omapfb.

This is the v2 pull request, in which I dropped one fbmem patch for
which Daniel had some concerns...

Thanks,
Helge

----

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.2-rc3

for you to fetch changes up to 634cf6ead93988b0da9ac054521ab63a3ba189db:

  fbdev: omapfb: avoid stack overflow warning (2023-01-05 11:43:27 +0100)

----------------------------------------------------------------
fbdev updates for kernel 6.2-rc3:

- Fix Matrox G200eW initialization failure
- Fix build failure of offb driver when built as module
- Optimize stack usage in omapfb

----------------------------------------------------------------
Arnd Bergmann (1):
      fbdev: omapfb: avoid stack overflow warning

Paul Menzel (1):
      fbdev: matroxfb: G200eW: Increase max memory from 1 MB to 16 MB

Randy Dunlap (1):
      fbdev: make offb driver tristate

Xu Panda (2):
      fbdev: omapfb: use strscpy() to instead of strncpy()
      fbdev: atyfb: use strscpy() to instead of strncpy()

 drivers/video/fbdev/Kconfig                |  4 ++--
 drivers/video/fbdev/aty/atyfb_base.c       |  3 +--
 drivers/video/fbdev/matrox/matroxfb_base.c |  4 ++--
 drivers/video/fbdev/omap/omapfb_main.c     |  5 ++---
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c | 28 ++++++++++++++++++----------
 5 files changed, 25 insertions(+), 19 deletions(-)
