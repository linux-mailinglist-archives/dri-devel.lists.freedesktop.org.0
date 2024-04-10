Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 369F189EF72
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 12:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CE310E9FF;
	Wed, 10 Apr 2024 10:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EFuJ4mNG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DA110E9FF;
 Wed, 10 Apr 2024 10:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712743527; x=1744279527;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ecIb2swGV+W8QEFvlFl+A6Xbn8y5HNeGU9z5OY4s7N4=;
 b=EFuJ4mNGBUgbu/6+ii6DS2u37FLsIabx1CUPSX1QVh3K/Ogmti8i7OAZ
 sigd+tsEL6MUwjzqKZTgrmhLzqQLBsxfSJlWpFGxI5UIA9e7OLKqynb/p
 wsf6mVInefi9J54vODQOCW/EsJyYJr6IeM3c0hwvQEwZHuCQZCF+8GvSh
 At0vazdsjOcCing/ic+i22r6RT63eEuI3kmCH9kpW8FxeSv79qIA0FUw3
 v3gCkA8mm0mFjBWF+FfkHEeFwsjfiW8oIDBHZCfDsb7REvu8Yrr96bXid
 +cCS6LaQnzt5NgKC+aWqCW32W8siwMTSuAg4MB6+vmavD+g6a/Y6eVWJD w==;
X-CSE-ConnectionGUID: Ao96PiJrQda92WKKlQJzbw==
X-CSE-MsgGUID: PGLQOPcFST2KB5CovR0FOw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18661801"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="18661801"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:05:26 -0700
X-CSE-ConnectionGUID: Suya8s2eTWycpFnHxnH8iw==
X-CSE-MsgGUID: 3Z1l4/xTTiONOkHiU4HUdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25133376"
Received: from oakasatk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.60.54])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:05:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Tomas Winkler <tomas.winkler@intel.com>
Subject: [PATCH 00/10] drm: move Intel drm headers to a subdirectory
Date: Wed, 10 Apr 2024 13:05:07 +0300
Message-Id: <cover.1712743191.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

We've accumulated enough Intel specific header files under include/drm
that they warrant a subdirectory of their own. Clean up the top drm
header directory by moving the Intel files under include/drm/intel.

Since i915 is most impacted, I suggest merging the lot via
drm-intel-next. Please ack if this is fine for you.

BR,
Jani.


Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Tomas Winkler <tomas.winkler@intel.com>

Jani Nikula (10):
  drm/i915: use system include for drm headers
  drm: move intel-gtt.h under include/drm/intel
  drm: move i915_gsc_proxy_mei_interface.h under include/drm/intel
  drm: move i915_component.h under include/drm/intel
  drm: move intel_lpe_audio.h under include/drm/intel
  drm: move i915_drm.h under include/drm/intel
  drm: move i915_pxp_tee_interface.h under include/drm/intel
  drm: move i915_pciids.h under include/drm/intel
  drm: move xe_pciids.h under include/drm/intel
  drm: move i915_hdcp_interface.h under include/drm/intel

 arch/x86/kernel/early-quirks.c                         | 4 ++--
 drivers/char/agp/intel-agp.c                           | 2 +-
 drivers/char/agp/intel-gtt.c                           | 2 +-
 drivers/gpu/drm/i915/display/intel_audio.c             | 2 +-
 drivers/gpu/drm/i915/display/intel_display_device.c    | 2 +-
 drivers/gpu/drm/i915/display/intel_display_types.h     | 2 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c              | 2 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c          | 2 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.c  | 2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c              | 2 +-
 drivers/gpu/drm/i915/display/intel_lpe_audio.c         | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c             | 2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c                   | 4 ++--
 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c              | 2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                     | 2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                    | 2 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c           | 4 ++--
 drivers/gpu/drm/i915/i915_pci.c                        | 2 +-
 drivers/gpu/drm/i915/intel_device_info.c               | 2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c               | 4 ++--
 drivers/gpu/drm/i915/soc/intel_gmch.c                  | 2 +-
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c               | 2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                           | 2 +-
 drivers/gpu/drm/xe/xe_gsc_proxy.c                      | 4 ++--
 drivers/gpu/drm/xe/xe_pci.c                            | 2 +-
 drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c             | 4 ++--
 drivers/misc/mei/hdcp/mei_hdcp.c                       | 4 ++--
 drivers/misc/mei/pxp/mei_pxp.c                         | 4 ++--
 drivers/platform/x86/intel_ips.c                       | 2 +-
 include/drm/{ => intel}/i915_component.h               | 2 +-
 include/drm/{ => intel}/i915_drm.h                     | 0
 include/drm/{ => intel}/i915_gsc_proxy_mei_interface.h | 0
 include/drm/{ => intel}/i915_hdcp_interface.h          | 0
 include/drm/{ => intel}/i915_pciids.h                  | 0
 include/drm/{ => intel}/i915_pxp_tee_interface.h       | 0
 include/drm/{ => intel}/intel-gtt.h                    | 0
 include/drm/{ => intel}/intel_lpe_audio.h              | 0
 include/drm/{ => intel}/xe_pciids.h                    | 0
 include/sound/hdaudio.h                                | 2 +-
 sound/x86/intel_hdmi_audio.c                           | 2 +-
 40 files changed, 40 insertions(+), 40 deletions(-)
 rename include/drm/{ => intel}/i915_component.h (98%)
 rename include/drm/{ => intel}/i915_drm.h (100%)
 rename include/drm/{ => intel}/i915_gsc_proxy_mei_interface.h (100%)
 rename include/drm/{ => intel}/i915_hdcp_interface.h (100%)
 rename include/drm/{ => intel}/i915_pciids.h (100%)
 rename include/drm/{ => intel}/i915_pxp_tee_interface.h (100%)
 rename include/drm/{ => intel}/intel-gtt.h (100%)
 rename include/drm/{ => intel}/intel_lpe_audio.h (100%)
 rename include/drm/{ => intel}/xe_pciids.h (100%)

-- 
2.39.2

