Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCE5380209
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 04:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34016E039;
	Fri, 14 May 2021 02:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF7226E039
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 02:34:50 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id b17so33112765ede.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 19:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=qLkpZ5mHZqNRCJyPF42saSN+H4CFvyq10lBWfFLuvPE=;
 b=qfApGizmMCBFfNj3S/x3lA2EtPQ+rEMMvnuAdcGibe3UkP7oTdy+NbQNHpPdxlK64b
 P8kCeHYcfuP9ameQeQl5GQniCmny2Y/pBI1s4NPNzcZ1gQVwo8o9IKNhYbnUfu4z5NBL
 5DMONjHhUW5kEUyxKCK/bnyGnJkR9D2yGbRhgrJQHV8tVVCgg/VA9CXqwq9hzC+HdJwK
 d+t6OJywE4YqotjbPN16k/QN5E4FtmrZC7wbqW8ZIZGDRqVj6O41CszpIeHW5+LJ9nMC
 muB7Xy0xcERPjjpLhX653Fm+fs4s9kHtVMvWdEMWagRNrhkhrns6sLhV+2lGQhcOA0g3
 TrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=qLkpZ5mHZqNRCJyPF42saSN+H4CFvyq10lBWfFLuvPE=;
 b=PO+PZYODXHGgb+91KDx4/z1a8T4EfRh5iomhy9tUQGyLUvl7UkGhS8+5EDztYz64ct
 xi0srZy92+Mui54te5gz0I1eK3ZeWVgvblwrEdfklHdjasFAIt9bTllQvlm+6zC8mz8S
 9SrwYHnkK2WQPkHrNFzjaNcRdwmR9FA6bmw8RWn/Pd7ju7l7vv+N+8GT0lQMh0EJckCJ
 TBncYETZVO/LBrpXrP8ItvdVJGgfDzGhSjTaglaaD2qc53lzFLblkAISI8GrTHFJxn/I
 /bPy5PswKEg3Dgss4Hh/Q8S+fYQCzoKLNJ4n1WByz2g98xwMsF4c0ev1daaPj0nmJDtz
 5nVQ==
X-Gm-Message-State: AOAM531EstdjZkdgYpsdEt3Mod8zuBrghZ5ghu3KRWfkVRASOaTDxY13
 5qEUe80Is8HS+tyZCGi0v6PXqmRPGn5draFXzhM=
X-Google-Smtp-Source: ABdhPJxHNSbSqdxxl04VURLOlxdorRW3HueXOAdt+EbpmiGJeb3lbzhgwYmWlozr+DZTRmbCBotoHoTMB32iXxROzmM=
X-Received: by 2002:a05:6402:1115:: with SMTP id
 u21mr53290701edv.383.1620959689370; 
 Thu, 13 May 2021 19:34:49 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 14 May 2021 12:34:38 +1000
Message-ID: <CAPM=9tyXjogjugi55XdAQd-ucMCk=ohDXS+vqdiaMk_aCL6aHQ@mail.gmail.com>
Subject: [git pull] drm fixes for 5.13-rc2
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

Just realised I got the tag header wrong, these are the rc2 fixes. Not
much here, mostly amdgpu fixes, with a couple of radeon, and a
cosmetic vc4. Two MAINTAINER file updates also.

Dave.

drm-fixes-2021-05-14:
drm fixes for 5.13-rc1

two MAINTAINERS updates.

amdgpu:
- Fixes for flexible array conversions
- Fix sysfs attribute init
- Harvesting fixes
- VCN CG/PG fixes for Picasso

radeon:
- Fixes for flexible array conversions
- Fix for flickering on Oland with multiple 4K displays

vc4:
- drop unused function
The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-05-14

for you to fetch changes up to 08f0cfbf739a5086995f0779bbcb607163128a9a:

  Merge tag 'amd-drm-fixes-5.13-2021-05-13' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2021-05-14
09:20:04 +1000)

----------------------------------------------------------------
drm fixes for 5.13-rc1

two MAINTAINERS updates.

amdgpu:
- Fixes for flexible array conversions
- Fix sysfs attribute init
- Harvesting fixes
- VCN CG/PG fixes for Picasso

radeon:
- Fixes for flexible array conversions
- Fix for flickering on Oland with multiple 4K displays

vc4:
- drop an used function

----------------------------------------------------------------
Daniel Vetter (1):
      MAINTAINERS: Update address for Emma Anholt

Dave Airlie (2):
      Merge tag 'drm-misc-fixes-2021-05-13' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'amd-drm-fixes-5.13-2021-05-13' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

David Ward (1):
      drm/amd/display: Initialize attribute for hdcp_srm sysfs file

Gustavo A. R. Silva (3):
      drm/radeon/ni_dpm: Fix booting bug
      drm/radeon/si_dpm: Fix SMU power state load
      drm/amd/pm: Fix out-of-bounds bug

Jernej Skrabec (1):
      MAINTAINERS: Update my e-mail

Jiapeng Chong (1):
      drm/vc4: remove unused function

Kai-Heng Feng (1):
      drm/radeon/dpm: Disable sclk switching on Oland when two 4K 60Hz
monitors are connected

Likun GAO (1):
      drm/amdgpu: add judgement when add ip blocks (v2)

Likun Gao (1):
      drm/amdgpu: update the method for harvest IP for specific SKU

Maxime Ripard (1):
      Merge drm/drm-fixes into drm-misc-fixes

Sathishkumar S (2):
      drm/amdgpu: set vcn mgcg flag for picasso
      drm/amdgpu: update vcn1.0 Non-DPG suspend sequence

xinhui pan (1):
      drm/ttm: Do not add non-system domain BO into swap list

 .mailmap                                           |   1 +
 MAINTAINERS                                        |  18 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  28 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h      |   1 +
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  38 +++--
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   3 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |  13 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |   1 +
 drivers/gpu/drm/amd/include/amd_shared.h           |   6 +
 drivers/gpu/drm/amd/pm/powerplay/si_dpm.c          | 174 ++++++++++----------
 drivers/gpu/drm/amd/pm/powerplay/sislands_smc.h    |  34 ++--
 drivers/gpu/drm/radeon/ni_dpm.c                    | 144 ++++++++---------
 drivers/gpu/drm/radeon/nislands_smc.h              |  34 ++--
 drivers/gpu/drm/radeon/radeon.h                    |   1 +
 drivers/gpu/drm/radeon/radeon_pm.c                 |   8 +
 drivers/gpu/drm/radeon/si_dpm.c                    | 177 +++++++++++----------
 drivers/gpu/drm/radeon/sislands_smc.h              |  34 ++--
 drivers/gpu/drm/vc4/vc4_vec.c                      |   6 -
 20 files changed, 419 insertions(+), 318 deletions(-)
