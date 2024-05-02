Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FEB8B9C3B
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 16:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113C911211F;
	Thu,  2 May 2024 14:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AtA9NMBT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F3C11211F;
 Thu,  2 May 2024 14:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714659999; x=1746195999;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=sRrnWlDo6EPMIXtN/t+1OOXdyxw9pa5QXZJuXlyOShw=;
 b=AtA9NMBTHNzMGaSLnYVuECkCja1zNBzZg/9RT4wuNW6jH4wTt0EXRRwk
 r8stZeYc9bguRd57NubjJvIwnTzqlEkenAOCRlO9IV0SMqtKSoZBQHO+h
 euoVbIa2PIAHUAu9N9He9O15S7r822hiVsYwhOPuH+gb6ZHcs1Cp9U8jh
 3JmGwq0vZy1oiJPUYaDTwDiOfiPtZx3qNp+OCo8Kvb++hW5c2S7BQ5bAZ
 q294PrwZQiXsOpfPxAo6YVn+mWQLaTgSxQZadoEOPhxXH+qiaJRDJOL/6
 7C8Zi+Ainl2HdpQfS1GHy4q/PRPH6xed2Wjwnwwznfh4y7EMJG2CIWTtY A==;
X-CSE-ConnectionGUID: VwfXEPAzTjKBdpLBJl48wA==
X-CSE-MsgGUID: Ag4MblxSRyGmulwRD3/PNA==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="21117881"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="21117881"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 07:26:36 -0700
X-CSE-ConnectionGUID: GZskzRGTR2Cy7x51pngBPw==
X-CSE-MsgGUID: hF/wpQ3FSpybRTuYjkRSBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="31628318"
Received: from antonvol-mobl1.ccr.corp.intel.com (HELO fedora)
 ([10.251.209.48])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 07:26:32 -0700
Date: Thu, 2 May 2024 16:26:21 +0200
From: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-xe-next-fixes
Message-ID: <ZjOijQA43zhu3SZ4@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

Dave, Sima

This week's small set of fixes for drm-next.

drm-xe-next-fixes-2024-05-02:
Driver Changes:
- Fix for a backmerge going slightly wrong.
- An UAF fix
- Avoid a WA error on LNL.

Thanks,
Thomas

The following changes since commit 4a56c0ed5aa0bcbe1f5f7d755fb1fe1ebf48ae9c:

  Merge tag 'amd-drm-next-6.10-2024-04-26' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2024-04-30 14:43:00 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-fixes-2024-05-02

for you to fetch changes up to 3bc8848bb7f7478e6806e4522b06b63f40a53e1e:

  drm/xe: Merge 16021540221 and 18034896535 WAs (2024-05-02 11:29:42 +0200)

----------------------------------------------------------------
Driver Changes:
- Fix for a backmerge going slightly wrong.
- An UAF fix
- Avoid a WA error on LNL.

----------------------------------------------------------------
Lucas De Marchi (1):
      drm/xe: Merge 16021540221 and 18034896535 WAs

Matthew Auld (1):
      drm/xe/vm: prevent UAF in rebind_work_func()

Thomas Hellström (1):
      drm/xe: Fix unexpected backmerge results

 drivers/gpu/drm/xe/xe_vm.c       | 16 ++++++++++------
 drivers/gpu/drm/xe/xe_vm_types.h |  4 ++++
 drivers/gpu/drm/xe/xe_wa.c       |  7 +------
 3 files changed, 15 insertions(+), 12 deletions(-)
