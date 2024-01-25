Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DD483BC04
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 09:30:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3760B10F851;
	Thu, 25 Jan 2024 08:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 023B510F84E;
 Thu, 25 Jan 2024 08:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706171397; x=1737707397;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=GzveJxVuEPjFXwl59pwJZefeLSd5dX2SH7AFes3/VeI=;
 b=PsYILyEPgUF8jWHGY9s6JYyC/uPbpkjeWBwY6aOhwyIPZPHRk2lpt/sw
 Ip8J1K4RqnhPQVbFFEoZRw7F49FVDJg4uU5VlOWQKkCwYmV/8wFLDw3r+
 iMdLzand8qkLmuhSncOdSPe8f53/uaBcTVkgDWQgNVyRg6yHTE3FCLfl5
 KvvNtn416X4PEBw7T6OHxdP9ejVrYCWZCOJEuw4brjjuY8tA/MPEGYVYz
 nAwDCsIjq7qHEGzLzwZThZ/1H20Fr2zyFmZwTdt6fhy0dS4O5KI/xrGtF
 8q4Z5pNUTwlPGSD0VQkNvHtmZ3qKhHUu1ZrWpzin7I1vzy8Ga1CACGsPE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="15449874"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="15449874"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 00:29:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="820719768"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="820719768"
Received: from skofoed-mobl.ger.corp.intel.com (HELO fedora) ([10.249.254.114])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 00:29:50 -0800
Date: Thu, 25 Jan 2024 09:29:34 +0100
From: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-xe-fixes
Message-ID: <ZbIb7l0EhpVp5cXE@fedora>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave, Sima

The Xe fixes PR for 6.8-rc2.

Thanks, Thomas.

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-01-25

for you to fetch changes up to 9e3a13f3eef6b14a26cc2660ca2f43f0e46b4318:

  drm/xe: Remove PVC from xe_wa kunit tests (2024-01-24 11:13:55 +0100)

----------------------------------------------------------------
Driver Changes:
- Make an ops struct static
- Fix an implicit 0 to NULL conversion
- A couple of 32-bit fixes
- A migration coherency fix for Lunar Lake.
- An error path vm id leak fix
- Remove PVC references in kunit tests

----------------------------------------------------------------
Himal Prasad Ghimiray (1):
      drm/xe/xe2: Use XE_CACHE_WB pat index

Lucas De Marchi (4):
      drm/xe: Use _ULL for u64 division
      drm/xe/mmio: Cast to u64 when printing
      drm/xe/display: Avoid calling readq()
      drm/xe: Remove PVC from xe_wa kunit tests

Moti Haimovski (1):
      drm/xe/vm: bugfix in xe_vm_create_ioctl

Thomas Hellström (2):
      drm/xe/dmabuf: Make xe_dmabuf_ops static
      drm/xe: Use a NULL pointer instead of 0.

 .../xe/compat-i915-headers/gem/i915_gem_object.h   | 11 +++++------
 drivers/gpu/drm/xe/tests/xe_wa_test.c              |  3 ---
 drivers/gpu/drm/xe/xe_device.c                     |  2 +-
 drivers/gpu/drm/xe/xe_dma_buf.c                    |  2 +-
 drivers/gpu/drm/xe/xe_hwmon.c                      |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c                    | 14 ++++++-------
 drivers/gpu/drm/xe/xe_mmio.c                       |  4 ++--
 drivers/gpu/drm/xe/xe_vm.c                         | 23 +++++++++++++---------
 8 files changed, 31 insertions(+), 30 deletions(-)
