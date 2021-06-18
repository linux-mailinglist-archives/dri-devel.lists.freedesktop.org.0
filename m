Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6453AC4BD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 09:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470E46E040;
	Fri, 18 Jun 2021 07:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434BD6E040
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 07:14:57 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id gb32so6072650ejc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 00:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=E0SoMThWmExXzF5EbvKyjPfd/YPiucGrDsQng1mFduk=;
 b=PATDK3CAWfHyAm2itpJvl9i8Z2DKKunEb8Xc4FIYyrGMvm0t+vwrqD2Z4RchiNR+tD
 9oLeENVltFulbQjyEKgq7OKxJE0HF+NUnwcxR+Y6qu+y528s0USIBTF/kFyU2bcs5CHs
 68MQ4zeKM8jE23yaVv9I5qRa//WUw88e0bsQaonvvgu60PfarCvrxQy1gh8YoN3rydgS
 2woDYZSahk57Eya9hRtf13YGVl1r+ZZ0xC++6aSz1hN/D/Gc0HTG2KFqdQSIGHoMdRWs
 iT6FHLgyUnlBXqN29R0OXk+z0VhRkX5L8hDwr05Ju3oil+1VdFIMFuvFnp8O+sGjsUHn
 7lqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=E0SoMThWmExXzF5EbvKyjPfd/YPiucGrDsQng1mFduk=;
 b=FLRx59Fu0cCh8k8eAvgjFIs/3YEqi5g+86JhHcQVu753QVgTFf7we3UKbjtpYl6NBu
 Zd7sk8TLoNo859do0w4QZrtEThJezHQGcWTLKKJm1NAW41wDH9ic0Vga1ma4xKjGpPGb
 5G9IxH/38UXy6lRhxbUYdDSLKx2cViDlVb4Ctb/eoGmxWVp/A6WHMcxt0LEaZmdiphNx
 yDvI7ROHHgg+49m8alyenSy/Hw7xBpTIFJKErbl0tj6G/ERucxvOaNGMz7zIYqT9GU5E
 kJ6gBZeZeB+A5WNVyY4m1Lx90rGpM2TuLUMkFfl2WaU5/sHA0sfFr39lminA8sK709aD
 Pi8g==
X-Gm-Message-State: AOAM5338lTm5mqZOsM0EaQZmCZ2hzrMmNP5oEoYBCiAgqU1AFtsNKciC
 0RBJTNDALATWJ/BXO+xxH+yoJcAlxDLf1cR+2e0=
X-Google-Smtp-Source: ABdhPJwRCq12s1+295PmMXlgcXctiEnAnFhf42DJxoB+LnuEkPGvIX8N4YXYitUsMPTVUZFDEebjwbBL3gV2x6Z2FOk=
X-Received: by 2002:a17:907:3d94:: with SMTP id
 he20mr9781311ejc.9.1624000495889; 
 Fri, 18 Jun 2021 00:14:55 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 18 Jun 2021 17:14:45 +1000
Message-ID: <CAPM=9txDgvo3Gu7bX_C9A4hAQJf+pGk+pMUR1bKg4EapEeqazQ@mail.gmail.com>
Subject: [git pull] drm fixes for 5.13-rc7
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Not much happening in fixes land this week only one PR for two amdgpu
powergating fixes was waiting for me, maybe something will show up
over the weekend, maybe not.

Dave.

drm-fixes-2021-06-18:
drm fixes for 5.13-rc7

amdgpu:
- GFX9 and 10 powergating fixes
The following changes since commit 009c9aa5be652675a06d5211e1640e02bbb1c33d:

  Linux 5.13-rc6 (2021-06-13 14:43:10 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-06-18

for you to fetch changes up to c55338d34cc2434d4ff9de89498f91171bd1f120:

  Merge tag 'amd-drm-fixes-5.13-2021-06-16' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2021-06-18
11:15:04 +1000)

----------------------------------------------------------------
drm fixes for 5.13-rc7

amdgpu:
- GFX9 and 10 powergating fixes

----------------------------------------------------------------
Dave Airlie (1):
      Merge tag 'amd-drm-fixes-5.13-2021-06-16' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Yifan Zhang (2):
      drm/amdgpu/gfx9: fix the doorbell missing when in CGPG issue.
      drm/amdgpu/gfx10: enlarge CP_MEC_DOORBELL_RANGE_UPPER to cover
full doorbell.

 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 6 +++++-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c  | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)
