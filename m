Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFBF87800E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 13:35:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941E610F388;
	Mon, 11 Mar 2024 12:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IYoWLyd/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF0C10F388;
 Mon, 11 Mar 2024 12:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710160516; x=1741696516;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/hahMAUfTYqpxsxFN7/wRHv3r4RRg8BRyVk5iJfuiHs=;
 b=IYoWLyd/ER50o1QFK84IfYQ4X4BZaoL0+SD7cHrhuVdNyXVXIdiGlCCL
 O1aPlfyirwQgi8nMf1wPs9Ms5gW3dCOte7xb6TF0uvLE+dhdHRmZ/5pDg
 EI5FO5teCZhKBlPKFFX6X+e/mLt7KJPY4F3JL8ydb26Lzb8nzictpPwrc
 dIOnBpemY+7ECfX3GvfSALk8s8rZh3jE7H5iGU9oeTTmkJuvrM1qaUi0o
 GVxzmbpjULYi4r2nIOnDjZgXfVrGqtq3Ph0iRo2D07hdAdjuzB1hZrAkB
 A5GtD+fpfUUaVFjmy9ncXSyfss/isbmRRmounef4hg0lizKdzj169q3pt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4931483"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="4931483"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 05:35:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="42134344"
Received: from tbeaumon-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.34.24])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 05:35:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Masahiro
 Yamada <masahiroy@kernel.org>, lucas.demarchi@intel.com
Subject: Re: [PATCH v2 00/16] drm: fix headers, add header test facility
In-Reply-To: <cover.1709898638.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1709898638.git.jani.nikula@intel.com>
Date: Mon, 11 Mar 2024 14:35:08 +0200
Message-ID: <874jddt08z.fsf@intel.com>
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

On Fri, 08 Mar 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> Follow-up to [1], with the already merged patches dropped, review
> comments addressed, some new patches added, etc.
>
> I did still leave in the FIXME comments in "drm/i2c: silence ch7006.h
> and sil164.h kernel-doc warnings", and just silenced the
> warnings. Fairly rarely used stuff, and mostly self-explanatory. I hope
> that's fine.

Pushed everything except the last patch to drm-misc-next. Thanks for all
the acks and reviews!

BR,
Jani.



>
> BR,
> Jani.
>
>
> [1] https://lore.kernel.org/all/cover.1709749576.git.jani.nikula@intel.com/
>
> Geert Uytterhoeven (1):
>   m68k: pgtable: Add missing #include <asm/page.h>
>
> Jani Nikula (15):
>   drm: add missing header guards to drm_crtc_internal.h
>   drm: add missing header guards to drm_crtc_helper_internal.h
>   drm/encoder: improve drm_encoder_slave.h kernel-doc
>   drm/i2c: silence ch7006.h and sil164.h kernel-doc warnings
>   drm/i915: fix i915_gsc_proxy_mei_interface.h kernel-doc
>   drm/i915/hdcp: fix i915_hdcp_interface.h kernel-doc warnings
>   drm/i915/pxp: fix i915_pxp_tee_interface.h kernel-doc warnings
>   drm/ttm: fix ttm_bo.h kernel-doc warnings
>   drm/ttm: make ttm_caching.h self-contained
>   drm/ttm: fix ttm_execbuf_util.h kernel-doc warnings
>   drm/ttm: fix ttm_kmap_iter.h kernel-doc warnings
>   drm/ttm: make ttm_pool.h self-contained
>   drm/dp_mst: avoid includes in drm_dp_mst_topology_internal.h
>   drm: avoid includes in drm_crtc_helper_internal.h
>   drm: ensure drm headers are self-contained and pass kernel-doc
>
>  Kbuild                                        |  1 +
>  arch/m68k/include/asm/pgtable.h               |  2 +
>  drivers/gpu/drm/Kconfig                       | 11 +++
>  drivers/gpu/drm/Makefile                      | 18 ++++
>  .../display/drm_dp_mst_topology_internal.h    |  4 +-
>  drivers/gpu/drm/drm_crtc_helper_internal.h    | 15 ++-
>  drivers/gpu/drm/drm_crtc_internal.h           |  5 +
>  include/Kbuild                                |  1 +
>  include/drm/Makefile                          | 18 ++++
>  include/drm/drm_encoder_slave.h               | 91 +++++++++++++++----
>  include/drm/i2c/ch7006.h                      |  1 +
>  include/drm/i2c/sil164.h                      |  1 +
>  include/drm/i915_gsc_proxy_mei_interface.h    |  4 +-
>  include/drm/i915_hdcp_interface.h             | 18 +++-
>  include/drm/i915_pxp_tee_interface.h          | 27 ++++--
>  include/drm/ttm/ttm_bo.h                      | 18 ++--
>  include/drm/ttm/ttm_caching.h                 |  2 +
>  include/drm/ttm/ttm_execbuf_util.h            |  7 +-
>  include/drm/ttm/ttm_kmap_iter.h               |  4 +-
>  include/drm/ttm/ttm_pool.h                    |  5 +-
>  20 files changed, 203 insertions(+), 50 deletions(-)
>  create mode 100644 include/Kbuild
>  create mode 100644 include/drm/Makefile

-- 
Jani Nikula, Intel
