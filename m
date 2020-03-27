Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BBC1951A2
	for <lists+dri-devel@lfdr.de>; Fri, 27 Mar 2020 07:59:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C176E98E;
	Fri, 27 Mar 2020 06:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADA56E98E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 06:58:59 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id j16so8731205otl.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 23:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=0OvgzAUpJOb5U0m6XVla+IjaXNlPer0DBm+gmB2qBB4=;
 b=A4bES7e6LdCzvpj80XAcy0n6U4veuE/qDWGvby2jJcgM+/RPFGWdasYCAOn11/6fOO
 m0g5lZ9pyLRWKb6FiRJY+FtJbcSwShv1bNB1ajmUXjl5Vilvpk5Le1W1ulZ94zqJAJ/3
 Q9jnEw61OgPC/f+JMRJZlL4b+1TTn3ynX/9NRNaan0Fe8At0G8rWH11gMX4l+LdPi7nS
 jLTgOMCm15gT8BGktGUe8PGDG5VqaIbeXe/U0RrhpJc8NpWv/fx/1CI+GLNGNNcSZqqK
 jZ0loHhNJEVD/Iu3VwJiMLn0GaAK/kmU6LpgzaWrSYqsYF1FzFnQj97xedT7HkEBEAZ3
 UhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=0OvgzAUpJOb5U0m6XVla+IjaXNlPer0DBm+gmB2qBB4=;
 b=CPfcdCGT0sgJ8q5X1aoKRlnf1Rh70DbSsWQ4szAq57PFRW19d78EjAGXqqwvM2b0yX
 /4FxSpqJ5cZq/eQDDQ1R054Ni81NHCH08S2o+pxirLv8WA2m2fiVuZaGPSO9MQZy+JXf
 5dd9icTEry+gn96EIzxZ7vceOgQmXVE98HW/oeQmrKcRMgWOI1DjcQ1GmdfGeKIxifKv
 b+pTcdB/9rY8zMTasTTgNgldgpcWIsA1mHcaMGl3oy2vOVeTUrOnsJrH42ASZiswL3du
 5toYMIspgULaDZsUDv92iMNZvgTy9YiPO4djwhmToXCmzPrehJKr80lw7vKxobKkI7SX
 IWVg==
X-Gm-Message-State: ANhLgQ26oBCeu1DXnx8RkZcRLQuW+2YvV2V2yPjuCSGMjr9zpKkYAxaE
 6ux3wgoQQvkWKZjOR9Bqs2A/Ouxt5YR3GvaY4yU=
X-Google-Smtp-Source: ADFU+vsN+CBLq7qZ8M51XGNT/SlTLkXGErxUW4g9/CgvsRZQshcve9+asKn+qyXR7fEP22LHUmSOPJlRZ7jauLjKboE=
X-Received: by 2002:a9d:4802:: with SMTP id c2mr6462122otf.78.1585292338382;
 Thu, 26 Mar 2020 23:58:58 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 27 Mar 2020 16:58:46 +1000
Message-ID: <CAPM=9tx=PisdA7qzEBz+n9Sqc4YfSpaSV-ja3tf7MjBnZ=_NXg@mail.gmail.com>
Subject: [git pull] drm fixes for 5.6-rc8
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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

Pretty quiet some minor sg mapping fixes for 3 drivers, and a single
oops fix for the scheduler.
I'm hoping nobody tries to send me a fixes pull today but I'll keep an
eye out of the weekend.

Dave.

drm-fixes-2020-03-27:
drm fixes for 5.6-rc8/final

radeon/amdgpu/dma-buf:
- sg list fixes

scheduler:
- oops fix
The following changes since commit 16fbf79b0f83bc752cee8589279f1ebfe57b3b6e:

  Linux 5.6-rc7 (2020-03-22 18:31:56 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-03-27

for you to fetch changes up to c4b979ebcafe978338cad1df4c77cdc8f84bd51c:

  Merge tag 'amd-drm-fixes-5.6-2020-03-26' of
git://people.freedesktop.org/~agd5f/linux into drm-fixes (2020-03-27
13:03:17 +1000)

----------------------------------------------------------------
drm fixes for 5.6-rc8/final

radeon/amdgpu/dma-buf:
- sg list fixes

scheduler:
- oops fix

----------------------------------------------------------------
Dave Airlie (2):
      Merge tag 'drm-misc-fixes-2020-03-26' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'amd-drm-fixes-5.6-2020-03-26' of
git://people.freedesktop.org/~agd5f/linux into drm-fixes

Shane Francis (3):
      drm/prime: use dma length macro when mapping sg
      drm/amdgpu: fix scatter-gather mapping with user pages
      drm/radeon: fix scatter-gather mapping with user pages

Yintian Tao (1):
      drm/scheduler: fix rare NULL ptr race

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 +-
 drivers/gpu/drm/drm_prime.c             | 2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c     | 2 +-
 drivers/gpu/drm/scheduler/sched_main.c  | 2 ++
 4 files changed, 5 insertions(+), 3 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
