Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81334727A45
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 10:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799E810E5A1;
	Thu,  8 Jun 2023 08:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90EB10E5AF;
 Thu,  8 Jun 2023 08:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686213910; x=1717749910;
 h=message-id:date:mime-version:from:subject:to:cc:
 content-transfer-encoding;
 bh=kYZmOiDcRdy9MFfb2Xft/YdrFp5jjY+xGAUZ52CfsiY=;
 b=c2tFFT5upnjQBDjSrk6ZYrQyVxKBpbJObeH2BFbw/zoCHGIIKlbLDQYy
 Hg1dJteYS7zdoTShGr8RvAOklr9XijlTss4s0oJFPp5oq2b7Jhsl+TcSD
 g54RXaTiZwXZ1QbpQFG5knd3Nn9MhGSs104qLIcbf0Thj7z3xx6TV1BgX
 y6qHYNaUqRS90WDwjOufAQVdxA26vWSrwUETiVapYJpTJXAm4qCQIUY2L
 XtPT0mbRkQcojFcaQ4dRlYywbVO1ckCfsKq1qI+zfrqYg1n/LQhgLWGU5
 96NujChKy7C+lZCEHFbdHx4hZmsy17KkQnq2FPPc3ZI7Hu9JNmp6FEup/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="423103977"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="423103977"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 01:44:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="774970338"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="774970338"
Received: from bapostu-mobl.ger.corp.intel.com (HELO [10.251.211.75])
 ([10.251.211.75])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 01:44:08 -0700
Message-ID: <ea6b88ec-b653-3781-0b68-cd0275c27923@linux.intel.com>
Date: Thu, 8 Jun 2023 10:44:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PULL] drm-intel-fixes
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

drm-misc-fixes for v6.4-rc6.

Seems to be mostly small fixes, just a few more for ivpu.

Cheers,

~Maarten

drm-misc-fixes-2023-06-08:

drm-misc-fixes for v6.4-rc6:
- resume and modeset fixes for ast.
- Fill in fb-helper vars more correctly.
- Assorted ivpu fixes.
- lima context destroy fix.
The following changes since commit e997c218ad736fd6f524d73a987bad9d94128d3d:

  accel/qaic: Fix NNC message corruption (2023-05-23 09:51:38 -0600)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-06-08

for you to fetch changes up to a3efabee5878b8d7b1863debb78cb7129d07a346:

  accel/ivpu: Fix sporadic VPU boot failure (2023-06-08 08:17:27 +0200)

----------------------------------------------------------------
drm-misc-fixes for v6.4-rc6:
- resume and modeset fixes for ast.
- Fill in fb-helper vars more correctly.
- Assorted ivpu fixes.
- lima context destroy fix.

----------------------------------------------------------------
Andrzej Kacprowski (2):
      accel/ivpu: Do not trigger extra VPU reset if the VPU is idle
      accel/ivpu: Fix sporadic VPU boot failure

Erico Nunes (1):
      drm/lima: fix sched context destroy

Geert Uytterhoeven (1):
      drm/fb-helper: Fix height, width, and accel_flags in fb_var

Jammy Huang (2):
      drm/ast: Fix long time waiting on s3/s4 resume
      drm/ast: Fix modeset failed on DisplayPort

Randy Dunlap (1):
      accel/ivpu: ivpu_ipc needs GENERIC_ALLOCATOR

Stanislaw Gruszka (2):
      accel/ivpu: Reserve all non-command bo's using DMA_RESV_USAGE_BOOKKEEP
      accel/ivpu: Do not use mutex_lock_interruptible

 drivers/accel/ivpu/Kconfig           |  1 +
 drivers/accel/ivpu/ivpu_hw_mtl.c     | 22 +++++++++++----
 drivers/accel/ivpu/ivpu_hw_mtl_reg.h |  1 +
 drivers/accel/ivpu/ivpu_ipc.c        |  4 +--
 drivers/accel/ivpu/ivpu_job.c        | 21 +++++++++-----
 drivers/accel/ivpu/ivpu_mmu.c        | 22 ++++-----------
 drivers/gpu/drm/ast/ast_dp.c         | 55 +++++++++++-------------------------
 drivers/gpu/drm/ast/ast_drv.h        |  5 +---
 drivers/gpu/drm/ast/ast_main.c       | 11 ++++++--
 drivers/gpu/drm/ast/ast_mode.c       | 15 ++++++++--
 drivers/gpu/drm/ast/ast_post.c       |  3 +-
 drivers/gpu/drm/drm_fb_helper.c      | 12 ++++----
 drivers/gpu/drm/lima/lima_sched.c    |  2 +-
 13 files changed, 90 insertions(+), 84 deletions(-)

