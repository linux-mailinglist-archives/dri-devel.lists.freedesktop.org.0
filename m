Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A8FA1B90C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 16:25:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A15C10E99C;
	Fri, 24 Jan 2025 15:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U7Zc+9GS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A52F10E0FD;
 Fri, 24 Jan 2025 15:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737732349; x=1769268349;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=CAfWjep+J16UMghG37ZOA9R6zyiuVu7tuxsjAaLBIjQ=;
 b=U7Zc+9GSj6qfClYqeSvZYalbE+fFTV6LQNicf7TJm5OTt7Ucp7usStxR
 M8BUzA6LmsUBpRbWVVvLw+IeG+fMIw+hxBbXU3g0WujRYjOn2LkWf4K9E
 vpOpUzf1dzxsWoppiouqu+q2jxl55njtuQ+jmo38x77wzyqwZp1DyvWqJ
 MNjdh18Qe0Ifp2VFvNtbpbQInbigoqrDeBno5unn8+Vs4NQik/eqZ6rg/
 RzNDkhwlJcyMwHsz63fs2smfQWjqXV7nH9XcQ1waKaj9oYbBf3mWtsk3E
 7F2el+3b+zpXEo8rZ+tTL5+JPkZd4d740M5pOKeTyA0rM1uys/4WCO//v Q==;
X-CSE-ConnectionGUID: MINiiEeNSVibMqGwhNJltQ==
X-CSE-MsgGUID: KzraSI07Sr2bznznTc6AIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38147795"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="38147795"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 07:25:49 -0800
X-CSE-ConnectionGUID: viOqjY6ZQd+C3OtDRCJSqQ==
X-CSE-MsgGUID: UwP7Ne4wTiGMkM+ut92fUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112425879"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 [10.245.245.174]) ([10.245.245.174])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 07:25:45 -0800
Message-ID: <0d4a18f4-222c-4767-9169-e6350ce8fea5@linux.intel.com>
Date: Fri, 24 Jan 2025 16:25:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PULL] drm-misc-next-fixes
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Simona,

Oops, I messsed up the pull request, didn't see the other commits in the 
branch.

Additionally:
- Fix bogus Kconfig change in cgroup/rdma
- Kernel doc fixup for xlnx.
- virtio UAF in virtgpu

Cheers,
~Maarten

drm-misc-next-fixes-2025-01-24:
drm-misc-next-fixes for v6.14-rc1:
- Fix a serious regression from commit e4b5ccd392b9 ("drm/v3d: Ensure
   job pointer is set to NULL after job completion")
The following changes since commit 07c5b277208cf9a9e9cf31bf0143977d7f030aa1:

   Merge v6.13 into drm-next (2025-01-23 14:42:21 +0100)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/misc/kernel.git 
tags/drm-misc-next-fixes-2025-01-24

for you to fetch changes up to 6e64d6b3a3c39655de56682ec83e894978d23412:

   drm/v3d: Assign job pointer to NULL before signaling the fence 
(2025-01-23 16:15:01 -0300)

----------------------------------------------------------------
drm-misc-next-fixes for v6.14-rc1:
- Fix a serious regression from commit e4b5ccd392b9 ("drm/v3d: Ensure
   job pointer is set to NULL after job completion")

----------------------------------------------------------------
Geert Uytterhoeven (1):
       cgroup/rdma: Drop bogus PAGE_COUNTER select

Maarten Lankhorst (1):
       Merge remote-tracking branch 'drm/drm-next' into drm-misc-next-fixes

Maíra Canal (1):
       drm/v3d: Assign job pointer to NULL before signaling the fence

Tomi Valkeinen (1):
       drm: xlnx: zynqmp_dpsub: Fix kernel doc

Vivek Kasireddy (1):
       drm/virtio: Fix UAF in virtgpu_dma_buf_free_obj()

  Documentation/gpu/zynqmp.rst           |  2 --
  drivers/gpu/drm/v3d/v3d_irq.c          | 16 ++++++++++++----
  drivers/gpu/drm/virtio/virtgpu_prime.c | 11 ++++++-----
  drivers/gpu/drm/xlnx/zynqmp_dpsub.h    |  1 +
  init/Kconfig                           |  1 -
  5 files changed, 19 insertions(+), 12 deletions(-)
