Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A67C514786D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 07:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA04E6FF11;
	Fri, 24 Jan 2020 06:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52106FF11
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 06:03:17 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id y19so382876lfl.9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 22:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=zEdYPtIr5Rj3i3xej5EyjAn95dEVZ50fUuhaeqXUW1I=;
 b=IRFfwyu1B895wr30zPmlPm8PYsbUOvEBdoHQUyQ/AeyYyVDH1aLRD6jEnxElOfNgFS
 ckgnBnCu1jNWtjAZVH3rXv4qT9ryueQ8vtEbDBa+Q8KzFXsHeb7Ozj1LORiSrVhIED9t
 YHzL7v3w3WY+95Pwg3+CTiTb93HzYt3ZQJMPgCLpCp3Iq+oyPSkOu7Nc16UFG10aAz3a
 gAMyU6uj8hORY7spN1Ck9RkzBeV+PNjY+tVL4btqZDvwILGXkGaJoKQOUFEA1a5woJ7p
 YaDlbpIK8wZ8n5lyAhSLqVvZCqcv1zoBOUt4OjAqlnt76l94xwGTFkqMM3rsf3ev8RV2
 hgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=zEdYPtIr5Rj3i3xej5EyjAn95dEVZ50fUuhaeqXUW1I=;
 b=Dc0ecfppmBcczWsHyT7YTtDFbY5M/9TQrhL/wkehruby0PH+MV1ehCk9WgmO200aL1
 VhYc1wtA1dIs/icIISph9dXKtF7qCSBWDSj0boya2+lCdyS3GSTrFW1NIYhINUEMfOw/
 SxhMcVnBD4+zeb4hScevfK+7FHYJdCvP3c9MBLl9MpdkKZwqFkTGsP//UC0yfcRslC0o
 MUnixp14PEm2Hlc388TKqnEG2G0vVPBnhIhXvKQkT+IWbHsQ5g8r0v55foa943to6EPz
 FMKg5lkjNxgs+HQoEXeEgqa/VbUzfAhKSf9lBMZhvrNAn3Y+WzZusFHRXsK2qP3vqLQR
 PdWQ==
X-Gm-Message-State: APjAAAWvNLvFnau1bCwIYUen8ADQdjg4a6SptGAIi7JEZgFSzo12SLwo
 ifjmyCy0bXmNAEc6dzAojK49inacqhceH3WplvU=
X-Google-Smtp-Source: APXvYqzo7XanGadzPh7lXKC+qfgcHEFVXzkKcERZu7mKj6XG4Vns2PGd9FGlG/WtO32iOgfdTpkQCPVkkoEvgk7yrrU=
X-Received: by 2002:a19:9d0:: with SMTP id 199mr649062lfj.110.1579845796081;
 Thu, 23 Jan 2020 22:03:16 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 24 Jan 2020 16:03:04 +1000
Message-ID: <CAPM=9ty8zJzPMuvaO4=AuvviKjqMO-VXbZgs+f93wiPFFhg0kw@mail.gmail.com>
Subject: [git pull] drm fixes for 5.5-rc8/final
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

This one has a core mst fix and two i915 fixes. amdgpu just enables
some hw outside experimental.

The panfrost fix is a little bigger than I'd like at this stage but it
fixes a fairly fundamental problem with global shared buffers in that
driver, and since it's confined to that driver and I've taken a look
at it, I think it's fine to get into the tree now, so it can get
stable propagated as well.

Dave.

drm-fixes-2020-01-24:
drm fixes for 5.5-rc8

core/mst:
- Fix SST branch device handling

amdgpu:
- enable renoir outside experimental

i915:
- Avoid overflow with huge userptr objects
- uAPI fix to correctly handle negative values in
  engine->uabi_class/instance (cc: stable)

panfrost:
- Fix mapping of globally visible BO's (Boris)
The following changes since commit def9d2780727cec3313ed3522d0123158d87224d:

  Linux 5.5-rc7 (2020-01-19 16:02:49 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-01-24

for you to fetch changes up to 49412f6636bab17dbdc25e36d6482013e4188c88:

  Merge tag 'amd-drm-fixes-5.5-2020-01-23' of
git://people.freedesktop.org/~agd5f/linux into drm-fixes (2020-01-24
08:58:12 +1000)

----------------------------------------------------------------
drm fixes for 5.5-rc8

core/mst:
- Fix SST branch device handling

amdgpu:
- enable renoir outside experimental

i915:
- Avoid overflow with huge userptr objects
- uAPI fix to correctly handle negative values in
  engine->uabi_class/instance (cc: stable)

panfrost:
- Fix mapping of globally visible BO's (Boris)

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: remove the experimental flag for renoir

Boris Brezillon (1):
      drm/panfrost: Add the panfrost_gem_mapping concept

Dave Airlie (3):
      Merge tag 'drm-misc-fixes-2020-01-22-1' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2020-01-23' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-5.5-2020-01-23' of
git://people.freedesktop.org/~agd5f/linux into drm-fixes

Matthew Auld (1):
      drm/i915/userptr: fix size calculation

Tvrtko Ursulin (1):
      drm/i915: Align engine->uabi_class/instance with i915_drm.h

Wayne Lin (1):
      drm/dp_mst: Handle SST-only branch device case

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c          |   2 +-
 drivers/gpu/drm/drm_dp_mst_topology.c            | 140 +++++++++++++----------
 drivers/gpu/drm/i915/gem/i915_gem_busy.c         |  12 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c      |   9 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h     |   4 +-
 drivers/gpu/drm/i915/i915_gem_gtt.c              |   2 +
 drivers/gpu/drm/panfrost/panfrost_drv.c          |  91 +++++++++++++--
 drivers/gpu/drm/panfrost/panfrost_gem.c          | 124 +++++++++++++++++---
 drivers/gpu/drm/panfrost/panfrost_gem.h          |  41 ++++++-
 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c |   3 +-
 drivers/gpu/drm/panfrost/panfrost_job.c          |  13 ++-
 drivers/gpu/drm/panfrost/panfrost_job.h          |   1 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c          |  61 +++++-----
 drivers/gpu/drm/panfrost/panfrost_mmu.h          |   6 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c      |  34 ++++--
 15 files changed, 396 insertions(+), 147 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
