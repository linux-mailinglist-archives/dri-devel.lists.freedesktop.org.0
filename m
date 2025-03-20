Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F95CA6ACEC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:13:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6272110E67D;
	Thu, 20 Mar 2025 18:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hdemRSzV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF09410E67C;
 Thu, 20 Mar 2025 18:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742494380; x=1774030380;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=mnq7slaAdZ5/GC5OU3Sg3+Z9jNWu9768OgvO8AvdeKs=;
 b=hdemRSzVAL1vM53/R4O/5+9cuaXJpAgIrsKPVLjGftix8x0EE3x5NuUw
 +1ks+neUpGa/vnOqIh1/t+3ZlBKX5LeBXLgBvMvI7bIMvNf7mKvuTtsU5
 cTzVqicUhT1ax1Ks6ykBA2BM6bjs/A9e/YsvzH9/6mIVPh/hHmV9dxgp5
 m/KBUNZH04a4U6LxIixcn5Fpzc3PnPNg4B1MjGAFAnYELeRYGGORiMr4s
 rKmyLez9+5feJ2xCYi/3v2ftatnyZgIhOuiq30Dmsy7U4tpdAqGQKWPnO
 71PMXTBFSy6sNS/3V5wpf03gnF9u7yPGDZTLmdZdCWiY85TusU7EoCzFK A==;
X-CSE-ConnectionGUID: 2AcMmcmPTli/YqrGkuifxA==
X-CSE-MsgGUID: SV4RwOeuR+WRw8+d9PrXCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="61141408"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="61141408"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 11:13:00 -0700
X-CSE-ConnectionGUID: aBmKhgSbTiiPoSYuHpmn4g==
X-CSE-MsgGUID: YUqkYmkaQKuMNn55HDOiCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="160405340"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fedora) ([10.245.246.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 11:12:56 -0700
Date: Thu, 20 Mar 2025 19:12:36 +0100
From: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
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
Subject: [PULL] drm-xe-fixes
Message-ID: <Z9xalLaCWsNbh0P0@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Simona!

Rodrigo is out this week, but sending a PR for a single fix.

Thanks,
Thomas

drm-xe-fixes-2025-03-20:
Driver Changes:
- Fix for an error if exporting a dma-buf multiple time (Tomasz)
The following changes since commit f5d4e81774c42d9c2ea3980e570f3330ff2ed5d2:

  drm/xe: remove redundant check in xe_vm_create_ioctl() (2025-03-10 14:01:43 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-03-20

for you to fetch changes up to 50af7cab7520e46680cf4633bba6801443b75856:

  drm/xe: Fix exporting xe buffers multiple times (2025-03-20 17:59:49 +0100)

----------------------------------------------------------------
Driver Changes:
- Fix for an error if exporting a dma-buf multiple time (Tomasz)

----------------------------------------------------------------
Tomasz Rusinowicz (1):
      drm/xe: Fix exporting xe buffers multiple times

 drivers/gpu/drm/xe/xe_bo.h      | 2 --
 drivers/gpu/drm/xe/xe_dma_buf.c | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)
