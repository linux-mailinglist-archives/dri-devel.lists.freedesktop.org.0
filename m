Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6E8233DCB
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 05:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394716E992;
	Fri, 31 Jul 2020 03:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD746E992
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 03:45:06 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id jp10so3495579ejb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 20:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=cds3H26Qt4Xbf0pS+HwjsX5vOPZPhiV8iFrKf+Od2OY=;
 b=QonvG/kmsgdHkQkoy6d5Y1Y9u7ufcN0uWQQXWtKsyiiznQfg5qV5MUERJVPrgbdhHB
 1LumXGZhWuzti5sxoiZ18zM3f95u1A7NEh1ERyt8ScM4jEL6UrM6MP3VHDZx2AssLqap
 bTWReYZWU0oC9uxOiU6jgsRbkyRDEriNJ1JeZld+/08TkPvnbG1081YK5sTYqlUqFQfW
 VY22PpZbts4FHK21VDe3I4mdB2h/U5xT0LriaazkF8+A64Ure+znvkJx8/Y4OuLwnwbL
 ImpQR0KXAEDJ4Mbn2ubokoHQm+yRWbuQTdLYZXf7uFDadW2YmTxq3qDB40lKfgVFtMTl
 4thg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=cds3H26Qt4Xbf0pS+HwjsX5vOPZPhiV8iFrKf+Od2OY=;
 b=QWXFZbvEYLaaP9f4l9ytVprRSbiuGfFlD2otoR+ReiHrO4+A7gMzf1fle7Wp0707Fm
 EHZZdlEtB9umChY3MZPBmN1oQgZF2iRocuRH732B80/3oQMiHWN9+kUZ0/JCvGNen6Gv
 dImaJ1WZn3hk8gXwOjtMQXcwdQeLEdlw4rxg63xXKuKgD7lz4N6nYCI+fHIH+CLbSDdM
 vbPQ+XwIwAMsz2gXXGO4FYgJntbzV2ZpCHJK/9kmAvwjWjX68UjX5lZFl77fgwk6LEaP
 1sVvYZnOB+StYvf4F56oDxeMddfU2lq09/XQRqVnnqozlNZuxlxYKeLBzcenk4I8YPQI
 xkvQ==
X-Gm-Message-State: AOAM531we0Bjjc0XPFLq6UdSWCKuFOb744dAPp7xP7FHSVY5+pe59wSA
 A++9zUZNxO9Wzgznlemx0N+wS5XKP3S80DQkCH4=
X-Google-Smtp-Source: ABdhPJzTNEq4SD3AtnBWlloSxhhMF2bQmcFBfou2WUgUWR9i7Rx29UEBZLM2ZOBesPlynB54igS1I1jC3ZlDSLKMJ4s=
X-Received: by 2002:a17:906:b6c3:: with SMTP id
 ec3mr2078395ejb.101.1596167105043; 
 Thu, 30 Jul 2020 20:45:05 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 31 Jul 2020 13:44:54 +1000
Message-ID: <CAPM=9twq8wVE888GW3cQ12Fw=FEwtD-1tXWgMcrrnjdk3NJZfg@mail.gmail.com>
Subject: [git pull] drm fixes for 5.8-rc8 (part 2)
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

As mentioned previously this contains the nouveau regression fix,
amdgpu had 3 fixes outstanding as well, one revert, an info leak and
use after free. The use after free is a bit trickier than I'd like,
and I've personally gone over it to confirm I'm happy that it is doing
what it says.

Let me know if any issues with any, happy to respin if necessary.
Dave.

drm-fixes-2020-07-31:
drm fixes for 5.8-rc8 (part 2)

nouveau:
- final modifiers regression fix

amdgpu:
- Revert a fix which caused other regressions
- Fix potential kernel info leak
- Fix a use-after-free bug that was uncovered by another change in 5.7
The following changes since commit a4a2739beb8933a19281bca077fdb852598803ed:

  Merge tag 'drm-misc-fixes-2020-07-28' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2020-07-29
12:46:58 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-07-31

for you to fetch changes up to 887c909dd5d557c203a233ebbe238c18438a680a:

  Merge tag 'amd-drm-fixes-5.8-2020-07-30' of
git://people.freedesktop.org/~agd5f/linux into drm-fixes (2020-07-31
13:04:00 +1000)

----------------------------------------------------------------
drm fixes for 5.8-rc8 (part 2)

nouveau:
- final modifiers regression fix

amdgpu:
- Revert a fix which caused other regressions
- Fix potential kernel info leak
- Fix a use-after-free bug that was uncovered by another change in 5.7

----------------------------------------------------------------
Alex Deucher (1):
      Revert "drm/amdgpu: Fix NULL dereference in dpm sysfs handlers"

Dave Airlie (1):
      Merge tag 'amd-drm-fixes-5.8-2020-07-30' of
git://people.freedesktop.org/~agd5f/linux into drm-fixes

James Jones (1):
      drm/nouveau: Accept 'legacy' format modifiers

Mazin Rezk (1):
      drm/amd/display: Clear dm_state for fast updates

Peilin Ye (1):
      drm/amdgpu: Prevent kernel-infoleak in amdgpu_info_ioctl()

 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c           |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c            |  9 ++++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 36 +++++++++++++++++------
 drivers/gpu/drm/nouveau/nouveau_display.c         | 27 +++++++++++++++--
 4 files changed, 60 insertions(+), 15 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
