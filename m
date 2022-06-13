Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F246D54831F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 11:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B7510E0E6;
	Mon, 13 Jun 2022 09:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3A410E0E4;
 Mon, 13 Jun 2022 09:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655113050; x=1686649050;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=2STTy/DxjvLvViuYvhUK4rs3NShVuiWc5dMF1SOJUu0=;
 b=W23klLO4C9b/64sWcl1E6rwLfeba70x8mo4sOG+lvRGaJixPcz+NteQd
 +Na9vLRuDm43yKaVAI24+kWKH9GAWnljnG26Y4D8k0VJGrw8BxZjZ6436
 J/iXeHXxYWAW6sEk9oIR92kYCgmcg6n+q7OWDkx/sJUz6aOZDIDi0NKAm
 TVbq999irkfA3TTlpfNfdqYvocr3pRZr5zn98Vh9ZxRbEyAktmvww9Tc0
 15phAlcTKcEoPQGvJN+AyMHOXyumBYdqm2qd7qVAhtjotQg7O0MgDC9JO
 eOwykfe4Q7x2kQFMbW9KJ+GVXpJ966UsuzmSzzI7uFZTow/QByK83ah6m w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="279276808"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="279276808"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 02:37:30 -0700
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="639640468"
Received: from njascanu-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.47.149])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 02:37:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 00/15] drm/edid: expand on struct drm_edid usage
In-Reply-To: <cover.1654674560.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1654674560.git.jani.nikula@intel.com>
Date: Mon, 13 Jun 2022 12:37:26 +0300
Message-ID: <87h74ozyy1.fsf@intel.com>
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

On Wed, 08 Jun 2022, Jani Nikula <jani.nikula@intel.com> wrote:
> v2 of [1], addressing review comments.
>
> BR,
> Jani.
>
>
> [1] https://patchwork.freedesktop.org/series/104309/
>
> Jani Nikula (15):
>   drm/edid: fix CTA data block collection size for CTA version 3
>   drm/edid: abstract cea data block collection size
>   drm/edid: add block count and data helper functions for drm_edid
>   drm/edid: keep track of alloc size in drm_do_get_edid()
>   drm/edid: add new interfaces around struct drm_edid
>   drm/probe-helper: abstract .get_modes() connector helper call

Thanks for the reviews, pushed the above patches to drm-misc-next.

BR,
Jani.


>   drm/edid: add drm_edid_connector_update()
>   drm/probe-helper: add drm_connector_helper_get_modes()
>   drm/edid: add drm_edid_raw() to access the raw EDID data
>   drm/i915/edid: convert DP, HDMI and LVDS to drm_edid
>   drm/i915/bios: convert intel_bios_init_panel() to drm_edid
>   drm/edid: do invalid block filtering in-place
>   drm/edid: add HF-EEODB support to EDID read and allocation
>   drm/edid: take HF-EEODB extension count into account
>   drm/todo: add entry for converting the subsystem to struct drm_edid
>
>  Documentation/gpu/todo.rst                    |  25 +
>  drivers/gpu/drm/drm_connector.c               |   2 +
>  drivers/gpu/drm/drm_edid.c                    | 572 ++++++++++++++++--
>  drivers/gpu/drm/drm_probe_helper.c            |  63 +-
>  drivers/gpu/drm/i915/display/intel_bios.c     |  23 +-
>  drivers/gpu/drm/i915/display/intel_bios.h     |   4 +-
>  .../gpu/drm/i915/display/intel_connector.c    |   4 +-
>  .../drm/i915/display/intel_display_types.h    |   4 +-
>  drivers/gpu/drm/i915/display/intel_dp.c       |  74 ++-
>  drivers/gpu/drm/i915/display/intel_hdmi.c     |  26 +-
>  drivers/gpu/drm/i915/display/intel_lvds.c     |  37 +-
>  include/drm/drm_edid.h                        |  12 +
>  include/drm/drm_probe_helper.h                |   1 +
>  13 files changed, 692 insertions(+), 155 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
