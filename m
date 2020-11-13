Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 453632B15E4
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 07:41:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321126E3C6;
	Fri, 13 Nov 2020 06:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6F06E3C6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 06:41:17 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id v22so9386609edt.9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 22:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=uUcn5XFlvNkAjTSpkJz/s0lX/G6tQphALps3Cv2iGtk=;
 b=uwRJkMUQYoe6XY3hGmrs02O5Jp3p5Q0AKTRhZwq9zT3nCiBzaCh/qJwQalSMV2vHiL
 qPt8FbMqVjVeXECVOEKrpe1z+URqPuyNf36unS/SCohtjwPmt4iWhiw4UxkFidLL1I+O
 IUge1RlM21z6V8LfJIb71z7eMQdtcHbGGOzkni96/ohh9Pq+Lf0MVc4O3EKdHEjMT7eD
 sZ/8mgug89hSgBXM/h9RFbK58sizNmfz1Rf64z1gFuQfGd3rB0IMGO/uKuy7U4PRTUOQ
 TXTnqo/6EG4jp9tLvpTmkalSdpNKsRp8wi83NgipNnjfilOS5Hb2b6Ex3m6WYlEg99b1
 4jgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=uUcn5XFlvNkAjTSpkJz/s0lX/G6tQphALps3Cv2iGtk=;
 b=eVOAFnMmYYxsYEThU/ZxDhD7IncvhUEKrGy6E4BrTPxw/GoY+vPnVwqvZD48CmsqRi
 xMCghT70DDdGs+++5HCm3yaxSEMsUxAifhMY4P1WiP/5BM6pmck6PV9djKMAsuGP3bKd
 qrABX223/pzA0UNAgfsa7NZ2/fs6mHxCxacYefa93nZX9fCdfiBMZb0gzWVnUk23Lk5/
 1daEYGf+DS/ZO80aj2X257isWOqtQ3vMDDTdbC8unItKSvP7YZ4iWjCVSPEkzhP6pvVy
 F9+MGeE5m/9Ue1g5PtNa2c3bt2jG1IUHOSn637+CRnEbxG+anae3rxzIFP7iH0i5YsZl
 ODqw==
X-Gm-Message-State: AOAM531ro4OabwOVRS/I5wtnDdrjHGvuvQYkQ0GcVqyIrwCc6N8idwMY
 3Ri4d3Olvkf9i67gx7l9nQSRJr1NqOcNBgoH01w=
X-Google-Smtp-Source: ABdhPJyeyA0ZcobWLrGNDaKdL20+g200WcTZaE8tsxLmnXENE14OExFJAIOODLKbba+NXdjeM+n+AjH2cftQ9IlyD0U=
X-Received: by 2002:a50:cc86:: with SMTP id q6mr1111642edi.78.1605249675863;
 Thu, 12 Nov 2020 22:41:15 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 13 Nov 2020 16:41:04 +1000
Message-ID: <CAPM=9txkA3-XwKMbxzZT6ZWq5jneJXYWneABHi02AxGnpvrPtA@mail.gmail.com>
Subject: [git pull] drm fixes for 5.10-rc4
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

Nearly didn't send you a PR this week at all, but a few things
trickled in over the day, not a huge amount here, some i915, amdgpu
and a bunch of misc fixes. I have a couple of nouveau fixes
outstanding due to the PR having the wrong base, I'll figure it out
next week.

Dave.

drm-fixes-2020-11-13:
drm fixes for 5.10-rc4

amdgpu:
- Pageflip fix for DCN3
- Declare TA firmware for green sardine
- Headless navi fix

i915:
- Pull phys pread/pwrite implementations to the backend
- Correctly set SFC capability for video engines

bridge:
- cdns Kconfig fix

hyperv_fb:
- fix missing include

gma500:
- oob access fix

mcde:
- unbalanced regulator fix
The following changes since commit f8394f232b1eab649ce2df5c5f15b0e528c92091:

  Linux 5.10-rc3 (2020-11-08 16:10:16 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-11-13

for you to fetch changes up to 41f3ed2cac86ba533ce6a334a2e7fae5c7082946:

  Merge tag 'amd-drm-fixes-5.10-2020-11-12' of
git://people.freedesktop.org/~agd5f/linux into drm-fixes (2020-11-13
16:05:31 +1000)

----------------------------------------------------------------
drm fixes for 5.10-rc4

amdgpu:
- Pageflip fix for DCN3
- Declare TA firmware for green sardine
- Headless navi fix

i915:
- Pull phys pread/pwrite implementations to the backend
- Correctly set SFC capability for video engines

bridge:
- cdns Kconfig fix

hyperv_fb:
- fix missing include

gma500:
- oob access fix

mcde:
- unbalanced regulator fix

----------------------------------------------------------------
Bhawanpreet Lakha (1):
      drm/amd/display: Add missing pflip irq

Chris Wilson (1):
      drm/i915/gem: Pull phys pread/pwrite implementations to the backend

Dave Airlie (3):
      Merge tag 'drm-misc-fixes-2020-11-12' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2020-11-13' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-5.10-2020-11-12' of
git://people.freedesktop.org/~agd5f/linux into drm-fixes

Linus Walleij (1):
      drm/mcde: Fix unbalanced regulator

Matthew Auld (1):
      drm/i915/gem: Allow backends to override pread implementation

Nishanth Menon (1):
      drm: bridge: cdns: Kconfig: Switch over dependency to ARCH_K3

Olaf Hering (1):
      video: hyperv_fb: include vmalloc.h

Roman Li (1):
      drm/amdgpu: add ta firmware load for green-sardine

Thomas Zimmermann (1):
      drm/gma500: Fix out-of-bounds access to struct drm_device.vblank[]

Tianci.Yin (1):
      drm/amdgpu: enable DCN for navi10 headless SKU

Venkata Sandeep Dhanalakota (1):
      drm/i915: Correctly set SFC capability for video engines

 drivers/gpu/drm/amd/amdgpu/nv.c                    |  3 +-
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c             |  1 +
 .../amd/display/dc/irq/dcn30/irq_service_dcn30.c   |  4 +-
 drivers/gpu/drm/bridge/cadence/Kconfig             |  2 +-
 drivers/gpu/drm/gma500/psb_irq.c                   | 34 +++++--------
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |  2 +
 drivers/gpu/drm/i915/gem/i915_gem_phys.c           | 55 ++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  3 +-
 drivers/gpu/drm/i915/i915_gem.c                    | 32 +++----------
 drivers/gpu/drm/mcde/mcde_drv.c                    |  8 +++-
 drivers/video/fbdev/hyperv_fb.c                    |  1 +
 11 files changed, 90 insertions(+), 55 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
