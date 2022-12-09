Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9328E647AFB
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 01:51:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E8510E21B;
	Fri,  9 Dec 2022 00:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F145A10E209
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 00:51:12 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id a17so2160130qvt.9
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Dec 2022 16:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3jVJi4dNSNacB4wvYYeR7Sa3OCix5As/EG22nKTSzXM=;
 b=I8zeUx2x3CS4rb+kRXP2PEPYVcUk+O4hFVowgJ2q5ScWVja0pjFhlFm1YHqaLkxp+u
 bKAjNTsFizODkd3ghcx9nOAhD170K/6gBDSioxC9C9IDw/LnpcasHkx6uf5F+ctmgZ+2
 GMjYld4im21q2tqXK53yFnD9dc4td6/qnIUPKv1jRUzoFiW6K0l4vl3oN7zfqnlahNbv
 JltQFr2h+FvFVmqnRw1SP9e0yKov962MMeVMDF1UfcglXgWh6zSnH89BwGA3BQPkrgZL
 8BWk19kC537bV12/akiKJyzmCx4FRj7TrcWcSU65uaoBddXxVEUwJBHeKbIxKqVTAyk4
 b+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3jVJi4dNSNacB4wvYYeR7Sa3OCix5As/EG22nKTSzXM=;
 b=uthNneZEV1JSQKmuibn9Vgow0otz7UtmZ3hBv2vx60R1zd9vP0ENvYwF7Q5rLeS+xS
 6009oaPmrOfiagIljhfOM0gta8np59WS82pCSGfbswYQffjdAlgOFZsT0+4aS7IT1d0U
 xnT0Vx8i/2lk0CrZ3QV5siasZEX6hMYOixX6z/MAhXY2k6qSPXidWAqFKiSZzmyec+nQ
 tOTD/rMyU/3FBxJtqtvMf1x/oYDXOhu+qFogpr7llZ52G8mVwAEc2NcAd7QM6qthIdc9
 FkiF3DrpJCkiYRsDdo68rrutCDXk88e7b5PtE2noCMWPhji+1GulVsCt6q5hSC05IARX
 wGgA==
X-Gm-Message-State: ANoB5pmWg5xGEmbj1aSUUo8uKeGsfRPrESOeQg47lUhrb5gqqIgQMWi4
 bY/VguCjIZG/MSgT+TFL1ZxWgw6uF3U1fRILfJQ=
X-Google-Smtp-Source: AA0mqf6QNS8E2mJa//UOMpt7kUwEHAAbWqJprw1gVfmcRJqsq1eq+8IjnW9x6aSnNi61u4mFoOOeDBMI2quIQL31I9c=
X-Received: by 2002:ad4:50cc:0:b0:4c7:95b6:ed07 with SMTP id
 e12-20020ad450cc000000b004c795b6ed07mr4135332qvq.97.1670547072008; Thu, 08
 Dec 2022 16:51:12 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 9 Dec 2022 10:51:00 +1000
Message-ID: <CAPM=9tztpF=EZ04jLii6DFiLQdm6s0QhXvosFyggDHikfLLteg@mail.gmail.com>
Subject: [git pull] drm fixes for 6.1 final
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

Last set of fixes for final, scattered bunch of fixes, two amdgpu, one
vmwgfx, and some misc others.

Dave.

drm-fixes-2022-12-09:
drm fixes for 6.1-rc9

amdgpu:
- S0ix fix
- DCN 3.2 array out of bounds fix

shmem:
- Fixes to shmem-helper error paths.

bridge:
- Fix polarity bug in bridge/ti-sn65dsi86.

dw-hdmi:
- Prefer 8-bit RGB fallback before any YUV mode in dw-hdmi, since some
  panels lie about YUV support.

vmwgfx:
- Stop using screen objects when SEV is active.
The following changes since commit 76dcd734eca23168cb008912c0f69ff408905235:

  Linux 6.1-rc8 (2022-12-04 14:48:12 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-12-09

for you to fetch changes up to c4252650a8c4770b669398fe7270ed8c94fc0eba:

  Merge tag 'drm-misc-fixes-2022-12-08' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2022-12-09
10:11:06 +1000)

----------------------------------------------------------------
drm fixes for 6.1-rc9

amdgpu:
- S0ix fix
- DCN 3.2 array out of bounds fix

shmem:
- Fixes to shmem-helper error paths.

bridge:
- Fix polarity bug in bridge/ti-sn65dsi86.

dw-hdmi:
- Prefer 8-bit RGB fallback before any YUV mode in dw-hdmi, since some
  panels lie about YUV support.

vmwgfx:
- Stop using screen objects when SEV is active.

----------------------------------------------------------------
Aurabindo Pillai (1):
      drm/amd/display: fix array index out of bound error in DCN32 DML

Dave Airlie (2):
      Merge tag 'amd-drm-fixes-6.1-2022-12-07' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2022-12-08' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Dawei Li (1):
      drm/vmwgfx: Fix race issue calling pin_user_pages

Guillaume BRUN (1):
      drm: bridge: dw_hdmi: fix preference of RGB modes over YUV420

Prike Liang (1):
      drm/amdgpu/sdma_v4_0: turn off SDMA ring buffer in the s2idle suspend

Qiqi Zhang (1):
      drm/bridge: ti-sn65dsi86: Fix output polarity setting bug

Rob Clark (2):
      drm/shmem-helper: Remove errant put in error path
      drm/shmem-helper: Avoid vm_open error paths

Zack Rusin (1):
      drm/vmwgfx: Don't use screen objects when SEV is active

 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             | 24 ++++++++++++++--------
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |  6 +++---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  4 ++--
 drivers/gpu/drm/drm_gem_shmem_helper.c             | 18 ++++++++++------
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c                |  6 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |  4 ++++
 7 files changed, 40 insertions(+), 24 deletions(-)
