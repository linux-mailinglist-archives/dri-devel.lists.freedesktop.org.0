Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA4E3632AF
	for <lists+dri-devel@lfdr.de>; Sun, 18 Apr 2021 01:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADC989D52;
	Sat, 17 Apr 2021 23:49:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188BD89D52
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Apr 2021 23:49:09 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id v6so46125042ejo.6
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Apr 2021 16:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=UwrwiMr5+8D/40Mctvun36r5UE8676az6W/LOijCYUM=;
 b=OAoaPs/8g2B8juzXkGkt6eBfzJvdVhQUUGG05AlgQMh1Fm3I7hUoDK9+TbLGuHtnZU
 r914KfIS07oxLzqeNtnELxfwIUcv4+eIZhw3RqdPGYSV2+j6fPVsH+QM5tg322wXBBJc
 PIe3Q20kG/wjhRsf+SjygjRccodes7VMYrS17c5MSANC4AzVMMm2pjwWSep0rSluiV21
 F0u1+C7TUP/gkXYQ9DX75cOD16LgqU7Wg/2lYQ7Rk0pacCbIPAGn2tTdcj54DX9rd4ek
 NUe1GMFkmbK9f0Vd5w88mjs707Z1DqZmn2Yankexu7oJcF82QzTpASHEljthjlBstahb
 H/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=UwrwiMr5+8D/40Mctvun36r5UE8676az6W/LOijCYUM=;
 b=RCzZhNoDY7QQZ1xuDNgaqOt/QwvZZycz085/zIgzwMXM4GQKhgKe9itfQULg0JJZqD
 6kk9uiekR1HLimIARCR/epr/98Y6tFR8YYCPinp+N9+q+3JE44WGczZC9r6Patx8oknE
 ipDpR3Gjrzc/rewmo2ngnfq7VpYgYEhpIOQwhmAFZozNNoj50CoDqb5cDVNO5Ai0Haq6
 vzylc5farjF2PDgNBeU3ANdRtC3n1U5pxSXVzUiyJK7o2bNJk+OPkn7neIrMLRgkO5Zu
 5k6OFgfShIFXsy1bgfES6RqyaelOCkV1DRpGiOu8uJHVkAF+1+8/Oiul23fHf1KTLJbd
 PhkA==
X-Gm-Message-State: AOAM531EGGmXnF0NbKMG9EWhSd7rpWK9PHadYPSEv4ySd/BGv0gTadWz
 H4PAOA8FGkpIb3TbqqK901ssaq8zj01u4rKSVxk=
X-Google-Smtp-Source: ABdhPJzTCQOGftpcIbepBG1p5eawXb3hy4kNmZO9pwxkvWHyrSXEYZEJ7U2jdt0w4edzyZRmzMv/XwwPE8IjhQ7833o=
X-Received: by 2002:a17:906:7104:: with SMTP id
 x4mr14912323ejj.101.1618703347716; 
 Sat, 17 Apr 2021 16:49:07 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sun, 18 Apr 2021 09:48:56 +1000
Message-ID: <CAPM=9tzVDp7PB0Rv8+Lmi4Ervp8QRio6phvRy_H-oFUHe3phSA@mail.gmail.com>
Subject: [git pull] drm/vmwgfx fixes for 5.12-rc8
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Zack Rusin <zackr@vmware.com>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Back from holidays and this was in the cracks (Zack forgot to cc
Daniel/lists), I've just piled it onto drm fixes.

It contains two regression fixes for vmwgfx, one due to a refactor
which meant locks were being used before initialisation, and the other
in fixing up some warnings from the core when destroying pinned
buffers.

Dave.

drm-fixes-2021-04-18:
drm/vmwgfx fixes for 5.12-rc7

vmwgfx:
- fixed unpinning before destruction
- lockdep init reordering
The following changes since commit 4d2e1288372ccc5ac60290bc10cace49c9bfa6d0:

  Merge tag 'drm-intel-fixes-2021-04-15' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2021-04-15
15:24:17 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-04-18

for you to fetch changes up to 796b556cbfdbe0d65b9793e63653ad24f9fa033c:

  Merge tag 'vmwgfx-fixes-2021-04-14' of
gitlab.freedesktop.org:zack/vmwgfx into drm-fixes (2021-04-18 09:27:00
+1000)

----------------------------------------------------------------
drm/vmwgfx fixes for 5.12-rc7

vmwgfx:
- fixed unpinning before destruction
- lockdep init reordering

----------------------------------------------------------------
Dave Airlie (1):
      Merge tag 'vmwgfx-fixes-2021-04-14' of
gitlab.freedesktop.org:zack/vmwgfx into drm-fixes

Zack Rusin (3):
      drm/vmwgfx: Make sure we unpin no longer needed buffers
      drm/vmwgfx: Fix the lockdep breakage
      drm/vmwgfx: Make sure bo's are unpinned before putting them back

 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c |  4 ++++
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     | 17 ++++++++---------
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     |  5 +----
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c     | 14 ++++++++++++++
 4 files changed, 27 insertions(+), 13 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
