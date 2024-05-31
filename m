Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B90BD8D62E6
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 15:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886D910E0E1;
	Fri, 31 May 2024 13:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Subd0BGW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6821810E64F;
 Fri, 31 May 2024 13:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717161825; x=1748697825;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=cKpmaMgUBV5osMGHaJW8G9okCKFrxydTNP8gEHBmaCQ=;
 b=Subd0BGWIDF/4DtkhMUMDUHTudb3aGTwbtqSrEGVTD/xL1R1CUg1D0Ue
 GkelBIeKZNI2/N8cylJhXqVaOlw71gQGo1i3vJhPHsdgi4ctk0NJoU8j+
 LYGqVJdBQvQLPy7VVGoWZIIkbWG0kaQr6c3VQAZnGicsliKiGQxYQp3Do
 Mg6kb8a2XXspIH/Cw4leaRIUi60TmEZiXft3BUO5zhEoAo8HPXPIbhSEK
 eGZZZLnumrC/JHrxEhKArKIWUb0VnRfXZ7s0JNo2HNlKwvEMaA9MASTYJ
 9N2dZ1i+McHgJaTWs0/3+nLVafqzYJHzojo61rLtZf/hbtYbM5kBpSPwa A==;
X-CSE-ConnectionGUID: LJFEPHK3RMi9ZY2+amed2A==
X-CSE-MsgGUID: SR04nsQpTDiELl9zNAxNkQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13463808"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="13463808"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 06:23:44 -0700
X-CSE-ConnectionGUID: 8QNgndQxT4W+zsQ4ECmO5w==
X-CSE-MsgGUID: LlCqDoHcQVC5hFC/5uN2Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="41082611"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.190])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 06:23:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 00/10] drm: move Intel drm headers to a subdirectory
In-Reply-To: <cover.1717075103.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1717075103.git.jani.nikula@intel.com>
Date: Fri, 31 May 2024 16:23:38 +0300
Message-ID: <87plt2dsit.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 30 May 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> We've accumulated enough Intel specific header files under include/drm
> that they warrant a subdirectory of their own. Clean up the top drm
> header directory by moving the Intel files under include/drm/intel.
>
> Since i915 is most impacted, I suggest merging the lot via
> drm-intel-next. Please ack if this is fine for you.

Pushed to drm-intel-next.

BR,
Jani.

>
> BR,
> Jani.
>
> Jani Nikula (10):
>   drm: move intel-gtt.h under include/drm/intel
>   drm: move i915_gsc_proxy_mei_interface.h under include/drm/intel
>   drm: move i915_component.h under include/drm/intel
>   drm: move intel_lpe_audio.h under include/drm/intel
>   drm: move i915_drm.h under include/drm/intel
>   drm: move i915_pxp_tee_interface.h under include/drm/intel
>   drm: move i915_pciids.h under include/drm/intel
>   drm: move xe_pciids.h under include/drm/intel
>   drm: move i915_hdcp_interface.h under include/drm/intel
>   MAINTAINERS: update i915 and xe entries for include/drm/intel
>
>  Documentation/gpu/i915.rst                             | 2 +-
>  MAINTAINERS                                            | 5 +++--
>  arch/x86/kernel/early-quirks.c                         | 4 ++--
>  drivers/char/agp/intel-agp.c                           | 2 +-
>  drivers/char/agp/intel-gtt.c                           | 2 +-
>  drivers/gpu/drm/i915/display/intel_audio.c             | 2 +-
>  drivers/gpu/drm/i915/display/intel_display_device.c    | 2 +-
>  drivers/gpu/drm/i915/display/intel_display_types.h     | 2 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.c              | 2 +-
>  drivers/gpu/drm/i915/display/intel_hdcp_gsc.c          | 2 +-
>  drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.c  | 2 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c              | 2 +-
>  drivers/gpu/drm/i915/display/intel_lpe_audio.c         | 2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c             | 2 +-
>  drivers/gpu/drm/i915/gt/intel_ggtt.c                   | 4 ++--
>  drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c              | 2 +-
>  drivers/gpu/drm/i915/gt/intel_gt.c                     | 2 +-
>  drivers/gpu/drm/i915/gt/intel_rps.c                    | 2 +-
>  drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c           | 4 ++--
>  drivers/gpu/drm/i915/i915_pci.c                        | 2 +-
>  drivers/gpu/drm/i915/intel_device_info.c               | 2 +-
>  drivers/gpu/drm/i915/intel_pci_config.h                | 2 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp_tee.c               | 4 ++--
>  drivers/gpu/drm/i915/soc/intel_gmch.c                  | 2 +-
>  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c               | 2 +-
>  drivers/gpu/drm/xe/xe_ggtt.c                           | 2 +-
>  drivers/gpu/drm/xe/xe_gsc_proxy.c                      | 4 ++--
>  drivers/gpu/drm/xe/xe_pci.c                            | 2 +-
>  drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c             | 4 ++--
>  drivers/misc/mei/hdcp/mei_hdcp.c                       | 4 ++--
>  drivers/misc/mei/pxp/mei_pxp.c                         | 4 ++--
>  drivers/platform/x86/intel_ips.c                       | 2 +-
>  include/drm/{ => intel}/i915_component.h               | 0
>  include/drm/{ => intel}/i915_drm.h                     | 0
>  include/drm/{ => intel}/i915_gsc_proxy_mei_interface.h | 0
>  include/drm/{ => intel}/i915_hdcp_interface.h          | 0
>  include/drm/{ => intel}/i915_pciids.h                  | 0
>  include/drm/{ => intel}/i915_pxp_tee_interface.h       | 0
>  include/drm/{ => intel}/intel-gtt.h                    | 0
>  include/drm/{ => intel}/intel_lpe_audio.h              | 0
>  include/drm/{ => intel}/xe_pciids.h                    | 0
>  include/sound/hdaudio.h                                | 2 +-
>  sound/x86/intel_hdmi_audio.c                           | 2 +-
>  43 files changed, 44 insertions(+), 43 deletions(-)
>  rename include/drm/{ => intel}/i915_component.h (100%)
>  rename include/drm/{ => intel}/i915_drm.h (100%)
>  rename include/drm/{ => intel}/i915_gsc_proxy_mei_interface.h (100%)
>  rename include/drm/{ => intel}/i915_hdcp_interface.h (100%)
>  rename include/drm/{ => intel}/i915_pciids.h (100%)
>  rename include/drm/{ => intel}/i915_pxp_tee_interface.h (100%)
>  rename include/drm/{ => intel}/intel-gtt.h (100%)
>  rename include/drm/{ => intel}/intel_lpe_audio.h (100%)
>  rename include/drm/{ => intel}/xe_pciids.h (100%)

-- 
Jani Nikula, Intel
