Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E754317A2FF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 11:19:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561E46EBB6;
	Thu,  5 Mar 2020 10:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA236EBB5;
 Thu,  5 Mar 2020 10:19:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Mar 2020 02:19:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,517,1574150400"; d="scan'208";a="229650627"
Received: from pedrero-mobl.ger.corp.intel.com (HELO [10.252.52.192])
 ([10.252.52.192])
 by orsmga007.jf.intel.com with ESMTP; 05 Mar 2020 02:19:22 -0800
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <56de63c7-0cdf-5805-e268-44944af7fef2@linux.intel.com>
Date: Thu, 5 Mar 2020 11:19:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm-misc-fixes-2020-03-05:
Fixes for v5.6.rc5:
- Fix memory leak
- Fix resource id creation race in virtio.
- Various mmap fixes.
- Fix fence leak in ttm_buffer_object_transfer().
- Fixes for sun4i VI layer format support.
- kirin: Revert "Fix for hikey620 display offset problem"
The following changes since commit dde2bb2da01e96c17f0a44b4a3cf72a30e66e3ef:

  drm/panfrost: perfcnt: Reserve/use the AS attached to the perfcnt MMU context (2020-02-12 14:27:29 -0600)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-03-05

for you to fetch changes up to 1b79cfd99ff5127e6a143767b51694a527b3ea38:

  drm: kirin: Revert "Fix for hikey620 display offset problem" (2020-03-04 13:29:05 +0000)

----------------------------------------------------------------
Fixes for v5.6.rc5:
- Fix memory leak
- Fix resource id creation race in virtio.
- Various mmap fixes.
- Fix fence leak in ttm_buffer_object_transfer().
- Fixes for sun4i VI layer format support.
- kirin: Revert "Fix for hikey620 display offset problem"

----------------------------------------------------------------
Ahzo (1):
      drm/ttm: fix leaking fences via ttm_buffer_object_transfer

Cong Wang (1):
      dma-buf: free dmabuf->name in dma_buf_release()

Gerd Hoffmann (3):
      drm/shmem: add support for per object caching flags.
      drm/virtio: fix mmap page attributes
      drm/shmem: drop pgprot_decrypted()

Icenowy Zheng (1):
      drm/bridge: analogix-anx6345: fix set of link bandwidth

Jernej Skrabec (3):
      drm/sun4i: de2/de3: Remove unsupported VI layer formats
      drm/sun4i: Add separate DE3 VI layer formats
      drm/sun4i: Fix DE2 VI layer format support

John Bates (1):
      drm/virtio: fix resource id creation race

John Stultz (1):
      drm: kirin: Revert "Fix for hikey620 display offset problem"

Tomeu Vizoso (1):
      drm/panfrost: Don't try to map on error faults

 drivers/dma-buf/dma-buf.c                          |   1 +
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |   3 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |  16 +++-
 drivers/gpu/drm/hisilicon/kirin/kirin_ade_reg.h    |   1 -
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c    |  20 ----
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |  44 ++++-----
 drivers/gpu/drm/sun4i/sun8i_mixer.c                | 104 ++++++++++++++++++---
 drivers/gpu/drm/sun4i/sun8i_mixer.h                |  11 +++
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c             |  66 +++++++++++--
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |   1 +
 drivers/gpu/drm/virtio/virtgpu_object.c            |   5 +-
 include/drm/drm_gem_shmem_helper.h                 |   5 +
 12 files changed, 202 insertions(+), 75 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
