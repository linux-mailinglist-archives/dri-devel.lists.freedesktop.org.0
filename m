Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B678D4C63
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 15:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B2610E933;
	Thu, 30 May 2024 13:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ER8F+6rP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C926A10E933;
 Thu, 30 May 2024 13:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717075158; x=1748611158;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vdVujtThkIQoGK4vCR4d6pLF2zvGBW7YcpCVz7Z22xg=;
 b=ER8F+6rPnGZYNECU+WinbWQdxeHOk36RrOOi1yrfTwDnkuulIrBd4oyl
 6ho9JaarC8JVZH3Mv78oLzVVGcwnBDw6hp1P5Hdj6u47GljGoqbUD1zst
 XAfF4Uy9uR4fKdg+5NLksDxg0DnsxHrjLOfC3X/Ant6Ip67kQQmvjJMvx
 tqf83wCn5TG5UNaFMNZnXa7mF4cYN8R79Tgpe+RtGlxT1Ag945Is94Iwf
 yPCAARkvr1akn5tVSWMDBSmzH3p4WcpRXqZmIQVXxYQGiZZS5ok4SAdaP
 SvdowBTEB28+YHhetuVaU1Lt87WdAieoPuRia5fvH7JS10XC3mx7OMFSA A==;
X-CSE-ConnectionGUID: Jqf5uakoSGaAqMId9FqbHQ==
X-CSE-MsgGUID: /VZq0hgqTACgTb4o0uKm1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="11805711"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="11805711"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:19:17 -0700
X-CSE-ConnectionGUID: +AIhZ3f4R/m0C0Uxe53KWQ==
X-CSE-MsgGUID: wvv1MfEWQ2a3XgPIchN2PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="73291214"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:19:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH v2 00/10] drm: move Intel drm headers to a subdirectory
Date: Thu, 30 May 2024 16:19:01 +0300
Message-Id: <cover.1717075103.git.jani.nikula@intel.com>
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

Jani Nikula (10):
  drm: move intel-gtt.h under include/drm/intel
  drm: move i915_gsc_proxy_mei_interface.h under include/drm/intel
  drm: move i915_component.h under include/drm/intel
  drm: move intel_lpe_audio.h under include/drm/intel
  drm: move i915_drm.h under include/drm/intel
  drm: move i915_pxp_tee_interface.h under include/drm/intel
  drm: move i915_pciids.h under include/drm/intel
  drm: move xe_pciids.h under include/drm/intel
  drm: move i915_hdcp_interface.h under include/drm/intel
  MAINTAINERS: update i915 and xe entries for include/drm/intel

 Documentation/gpu/i915.rst                             | 2 +-
 MAINTAINERS                                            | 5 +++--
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
 drivers/gpu/drm/i915/intel_pci_config.h                | 2 +-
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
 include/drm/{ => intel}/i915_component.h               | 0
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
 43 files changed, 44 insertions(+), 43 deletions(-)
 rename include/drm/{ => intel}/i915_component.h (100%)
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

