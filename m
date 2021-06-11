Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 182C43A3F09
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 11:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4FFA6EE61;
	Fri, 11 Jun 2021 09:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08826EE61;
 Fri, 11 Jun 2021 09:27:22 +0000 (UTC)
IronPort-SDR: j8aNUI3lGjYuhWcRemcsPj1U1YHNGo++rqB6UEt0RYsbBxzk/SMAttltQ0o8G+hQpbLsIUdgTn
 og4L3u/Yk9hg==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="192603747"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="192603747"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 02:27:21 -0700
IronPort-SDR: 5/apJ/qU+ZPeSKfQFaXyVZ/yXrh0eQvaS8eP8NNHvM3QdRN110jF1GEYnM2Xv8bSopGIWhOveS
 o34ugdJ11Y/w==
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="449053559"
Received: from jjulianf-mobl.ger.corp.intel.com (HELO [10.249.47.129])
 ([10.249.47.129])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 02:27:18 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] topic/i915-ttm
Message-ID: <eb71ee2d-3413-6ca8-0b7c-a58695f00b77@linux.intel.com>
Date: Fri, 11 Jun 2021 11:27:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, dim-tools@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pull request for drm-misc-next and drm-intel-gt-next.

topic/i915-ttm-2021-06-11:
drm-misc and drm-intel pull request for topic/i915-ttm:
- Convert i915 lmem handling to ttm.
- Add a patch to temporarily add a driver_private member to vma_node.
- Use this to allow mixed object mmap handling for i915.
The following changes since commit 1bd8a7dc28c1c410f1ceefae1f2a97c06d1a67c2:

  Merge tag 'exynos-drm-next-for-v5.14' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into drm-next (2021-06-11 14:19:12 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/topic/i915-ttm-2021-06-11

for you to fetch changes up to cf3e3e86d77970211e0983130e896ae242601003:

  drm/i915: Use ttm mmap handling for ttm bo's. (2021-06-11 10:53:25 +0200)

----------------------------------------------------------------
drm-misc and drm-intel pull request for topic/i915-ttm:
- Convert i915 lmem handling to ttm.
- Add a patch to temporarily add a driver_private member to vma_node.
- Use this to allow mixed object mmap handling for i915.

----------------------------------------------------------------
Maarten Lankhorst (2):
      drm/vma: Add a driver_private member to vma_node.
      drm/i915: Use ttm mmap handling for ttm bo's.

Thomas Hellström (2):
      drm/i915/ttm: Introduce a TTM i915 gem object backend
      drm/i915/lmem: Verify checks for lmem residency

 drivers/gpu/drm/drm_gem.c                          |   9 -
 drivers/gpu/drm/i915/Makefile                      |   1 +
 drivers/gpu/drm/i915/display/intel_display.c       |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_create.c         |   9 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c           | 126 ++--
 drivers/gpu/drm/i915/gem/i915_gem_lmem.h           |   5 -
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |  83 ++-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         | 143 +++--
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |  19 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |  30 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_region.c         |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            | 647 +++++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h            |  48 ++
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |  90 +--
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        |   3 +-
 drivers/gpu/drm/i915/i915_gem.c                    |   5 +-
 drivers/gpu/drm/i915/intel_memory_region.c         |   1 -
 drivers/gpu/drm/i915/intel_memory_region.h         |   1 -
 drivers/gpu/drm/i915/intel_region_ttm.c            |   8 +-
 drivers/gpu/drm/i915/intel_region_ttm.h            |  11 +-
 drivers/gpu/drm/i915/selftests/igt_mmap.c          |  25 +-
 drivers/gpu/drm/i915/selftests/igt_mmap.h          |  12 +-
 include/drm/drm_vma_manager.h                      |   2 +-
 24 files changed, 1039 insertions(+), 250 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm.c
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm.h
