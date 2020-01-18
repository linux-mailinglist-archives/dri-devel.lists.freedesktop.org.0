Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB811419CC
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2020 22:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66AF96E14A;
	Sat, 18 Jan 2020 21:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D56A6E14A
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2020 21:21:47 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id 9so21034417lfq.10
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2020 13:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Yj4XEU5EtFjO2WH0v0wMntHUc/4ZhJ63I+DRrWgRx2k=;
 b=L0CEMd7rNoyM0obhUqEZjLfQ2GjoJAxSCDLdmjvj9PgFZVii77XcfGbLOLH4zo+32N
 ag/9cfUqabNsBW+VqC0Z9fEXtj+WKsHfTgyW7qcZYL8sOWNvmyU01L+wrN8RM61x47fT
 K+8qzVkZCkhArx+8GICw6av5/4AazfYYmeTiOm8KqYUO8/eOStIKMDjbpklga/Nk7UdM
 cQ0/RmufWaYoHgSwYd5M+JlkgQBwO5+bwiAGhgtrKiZkCOCniz3gDQrwAa9wm69fcPwN
 NpYzrJCmODb/BMTON7EbNdmTXp/b4yq2T4zWcCjnJScyYdBAdvjboxJ94myC82Zig6Cq
 AVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Yj4XEU5EtFjO2WH0v0wMntHUc/4ZhJ63I+DRrWgRx2k=;
 b=YFOeOC9xyPaUP60J44QP9GxVXJUaz/3aS0YSC5avNJpWDDNRKaTmx/kGTiHnBhKpK1
 KKSHydfRwUHA6Mo0Fu7RL7qUiBMi+L9rg1J0h0sVYrmw+fznCwS7853G2HVwS31YZgx2
 g4cGNhIhmlSU7Vx515i5Y5VX2CawS5ABGHDrqhzNiDO4mWqFb4fz6dZeaNamXjozyCzR
 8fM9qIbfx8qvjQA0syLVcEhceoZAUJWyDh57Wu+agYVujtN9ORwWWdnWG3qlwVH518br
 ZCo4K6HHEDBLY0dlM+mxZ0e8wYnqBJW7HvtWDW6HhRs6DGZMgP3NQRTs3WOKVDzk5g1B
 OCBw==
X-Gm-Message-State: APjAAAWJk/jHBjyIwg9ZVEPcacR4Gt5DOx1dub2qt2H+v1/3wKpIqQ2W
 UOGMxFJ3/31dASZxI+JOnUI/qHQL1RkhU2CUFnpCGKPd
X-Google-Smtp-Source: APXvYqyEuDOQooArqH3BmeO+9lfGOyrHBpQ1fXlFn2FSuGxgv7BSw3F0XEtYtUXUN/DefRd5nTZPXKOb5rH0swqRkj0=
X-Received: by 2002:a19:e30b:: with SMTP id a11mr9148830lfh.48.1579382506307; 
 Sat, 18 Jan 2020 13:21:46 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sun, 19 Jan 2020 07:21:35 +1000
Message-ID: <CAPM=9tyCmZM2Nzy397APbb9-EcNyC-Bgz4Q_7hTcjaQpX6E1Pw@mail.gmail.com>
Subject: [git pull] drm fixes for 5.5-rc7
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

Hey Linus,

Back from LCA2020, fixes wasn't too busy last week, seems to have
quieten down appropriately, some amdgpu, i915, then a core mst fix and
one fix for virtio-gpu and one for rockchip.

Dave.


drm-fixes-2020-01-19:
drm fixes for 5.5-rc7

core mst:
- serialize down messages and clear timeslots are on unplug

amdgpu:
- Update golden settings for renoir
- eDP fix

i915:
- uAPI fix: Remove dash and colon from PMU names to comply with tools/perf
- Fix for include file that was indirectly included
- Two fixes to make sure VMA are marked active for error capture

virtio:
- maintain obj reservation lock when submitting cmds

rockchip:
- increase link rate var size to accommodate rates
The following changes since commit b3a987b0264d3ddbb24293ebff10eddfc472f653:

  Linux 5.5-rc6 (2020-01-12 16:55:08 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-01-19

for you to fetch changes up to f66d84c8b4db9a4f77f29e2d8fd521196c879582:

  Merge tag 'drm-misc-fixes-2020-01-16' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2020-01-18
12:54:37 +1000)

----------------------------------------------------------------
drm fixes for 5.5-rc7

core mst:
- serialize down messages and clear timeslots are on unplug

amdgpu:
- Update golden settings for renoir
- eDP fix

i915:
- uAPI fix: Remove dash and colon from PMU names to comply with tools/perf
- Fix for include file that was indirectly included
- Two fixes to make sure VMA are marked active for error capture

virtio:
- maintain obj reservation lock when submitting cmds

rockchip:
- increase link rate var size to accommodate rates

----------------------------------------------------------------
Aaron Liu (1):
      drm/amdgpu: update goldensetting for renoir

Chris Wilson (3):
      drm/i915/gt: Skip trying to unbind in restore_ggtt_mappings
      drm/i915/gt: Mark context->state vma as active while pinned
      drm/i915/gt: Mark ring->vma as active while pinned

Dave Airlie (3):
      Merge tag 'amd-drm-fixes-5.5-2020-01-15' of
git://people.freedesktop.org/~agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2020-01-16' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'drm-misc-fixes-2020-01-16' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Gerd Hoffmann (1):
      drm/virtio: add missing virtio_gpu_array_lock_resv call

Mario Kleiner (1):
      drm/amd/display: Reorder detect_edp_sink_caps before link settings read.

Tobias Schramm (1):
      drm/rockchip: fix integer type used for storing dp data rate

Tvrtko Ursulin (1):
      drm/i915/pmu: Do not use colons or dashes in PMU names

Wayne Lin (2):
      drm/dp_mst: clear time slots for ports invalid
      drm/dp_mst: Have DP_Tx send one msg at a time

YueHaibing (1):
      drm/i915: Add missing include file <linux/math64.h>

 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c |  2 +-
 drivers/gpu/drm/drm_dp_mst_topology.c         | 39 ++++++++++++++++++++++++--
 drivers/gpu/drm/i915/gt/intel_context.c       | 40 +++++++++++++++++++++++++--
 drivers/gpu/drm/i915/i915_gem_gtt.c           |  7 ++---
 drivers/gpu/drm/i915/i915_pmu.c               | 11 ++++++--
 drivers/gpu/drm/i915/selftests/i915_random.h  |  1 +
 drivers/gpu/drm/rockchip/cdn-dp-core.h        |  2 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c        |  1 +
 include/drm/drm_dp_mst_helper.h               |  6 ++++
 10 files changed, 94 insertions(+), 17 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
