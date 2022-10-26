Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E782560DD17
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 10:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F004110E380;
	Wed, 26 Oct 2022 08:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924B210E2D6;
 Wed, 26 Oct 2022 08:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666773218; x=1698309218;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=BrB3HeiAzVea9M2hrNNH71cozc9StsByLs8RCVbM3yk=;
 b=mfuhvl2yhgSix/ivwTeFiy0qnhqp67qO/XN+qRQC1dLobZTIdrH6o2sh
 viunIbIrUPqYiDuRpkPbExWil02RTChy8TtifKFKQDQ6vNhgj45xNyA69
 iI+ecoGFVQ3a2dPJVt49n9Prw5X55d/ERMf8fdi5VRn0NGJ2puo01rH5X
 vGEqjYvlX2bUlMdSeIFpNIFm37esxUzRfj+T49yO/RxUpbPPKcgZ1n4P6
 O50LZBfuCbZ2Ez/SwnK1sP/mIXKb3fac29oAdxXOmCNrGeO5kz653yod/
 OSTZgu9sf5m9baYU7ClkCgeEQPyn7jtALhACnB3d6W77fP/vfGuN/MGPZ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="369960061"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; d="scan'208";a="369960061"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 01:33:38 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="583079931"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; d="scan'208";a="583079931"
Received: from pszulc-mobl.ger.corp.intel.com (HELO localhost) ([10.252.47.16])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 01:33:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 00/16] drm/edid: EDID override refactoring and fixes
In-Reply-To: <cover.1666614699.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1666614699.git.jani.nikula@intel.com>
Date: Wed, 26 Oct 2022 11:33:34 +0300
Message-ID: <87zgdjc7c1.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 24 Oct 2022, Jani Nikula <jani.nikula@intel.com> wrote:
> v2 of drm/edid: EDID override refactoring and fixes
>
> Address review comments, add patch 15.

Thanks for the reviews, pushed the series to drm-misc-next.

BR,
Jani.


>
> BR,
> Jani.
>
>
> Jani Nikula (16):
>   drm/i915/hdmi: do dual mode detect only if connected
>   drm/i915/hdmi: stop using connector->override_edid
>   drm/amd/display: stop using connector->override_edid
>   drm/edid: debug log EDID override set/reset
>   drm/edid: abstract debugfs override EDID show better
>   drm/edid: rename drm_add_override_edid_modes() to
>     drm_edid_override_connector_update()
>   drm/edid: split drm_edid block count helper
>   drm/edid: add function for checking drm_edid validity
>   drm/edid: detach debugfs EDID override from EDID property update
>   drm/edid/firmware: drop redundant connector_name variable/parameter
>   drm/edid/firmware: rename drm_load_edid_firmware() to
>     drm_edid_load_firmware()
>   drm/edid: use struct drm_edid for override/firmware EDID
>   drm/edid: move edid load declarations to internal header
>   drm/edid/firmware: convert to drm device specific logging
>   drm/edid: add [CONNECTOR:%d:%s] to debug logging
>   drm/edid: convert to device specific logging
>
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   3 -
>  drivers/gpu/drm/drm_connector.c               |   1 +
>  drivers/gpu/drm/drm_crtc_internal.h           |  15 +-
>  drivers/gpu/drm/drm_debugfs.c                 |   8 +-
>  drivers/gpu/drm/drm_edid.c                    | 346 +++++++++++-------
>  drivers/gpu/drm/drm_edid_load.c               | 109 ++----
>  drivers/gpu/drm/drm_probe_helper.c            |   2 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c     |  20 +-
>  include/drm/drm_connector.h                   |  16 +-
>  include/drm/drm_edid.h                        |  10 +-
>  10 files changed, 283 insertions(+), 247 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
