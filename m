Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4241AB241
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 22:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5464C6EA74;
	Wed, 15 Apr 2020 20:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227026E2A8;
 Wed, 15 Apr 2020 20:04:14 +0000 (UTC)
IronPort-SDR: KAaF83pNjd0SxzNtXPuyQoB1iksE3x2iwTW2sD6yMcU+J9awad7VUBejjrSEVO/x30hQwyhV/F
 aiJkf5yvm5tA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 13:04:13 -0700
IronPort-SDR: VYXfIqn4w+hn3z2EeEhsyDT2dH9S8H4Auf2zmpDB5QHWFDLFKs7tRJrSxqvy9Wnj6Wu4X5zsha
 rY3QZbdGUBbA==
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; d="scan'208";a="332603329"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 13:04:13 -0700
Date: Wed, 15 Apr 2020 13:03:49 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <20200415200349.GA2550694@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
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

Hi Dave and Daniel,

Here goes drm-intel-fixes-2020-04-15:

- Fix guest page access by using the brand new VFIO dma r/w interface (Yan)
- Fix for i915 perf read buffers (Ashutosh)

Thanks,
Rodrigo.

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-04-15

for you to fetch changes up to 5809e8f8ee42db54c283c3a6bcfcbbdbfd888f5c:

  Merge tag 'gvt-fixes-2020-04-14' of https://github.com/intel/gvt-linux into drm-intel-fixes (2020-04-14 06:02:53 -0700)

----------------------------------------------------------------
- Fix guest page access by using the brand new VFIO dma r/w interface (Yan)
- Fix for i915 perf read buffers (Ashutosh)

----------------------------------------------------------------
Ashutosh Dixit (1):
      drm/i915/perf: Do not clear pollin for small user read buffers

Rodrigo Vivi (1):
      Merge tag 'gvt-fixes-2020-04-14' of https://github.com/intel/gvt-linux into drm-intel-fixes

Yan Zhao (3):
      drm/i915/gvt: hold reference of VFIO group during opening of vgpu
      drm/i915/gvt: subsitute kvm_read/write_guest with vfio_dma_rw
      drm/i915/gvt: switch to user vfio_group_pin/upin_pages

 drivers/gpu/drm/i915/gvt/kvmgt.c | 46 ++++++++++++++--------------
 drivers/gpu/drm/i915/i915_perf.c | 65 +++++++---------------------------------
 2 files changed, 33 insertions(+), 78 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
