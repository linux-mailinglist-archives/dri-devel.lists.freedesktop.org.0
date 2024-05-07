Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ABF8BE0A2
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 13:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EA010F4B2;
	Tue,  7 May 2024 11:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iNHtiz8n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF0A10F498;
 Tue,  7 May 2024 11:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715079955; x=1746615955;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qsiykdfT6HGbR0ILtz1HnDdybhnkI6RfpUXlO9B3Wak=;
 b=iNHtiz8noH76lGywmvHPsdKh3vMTMi5KcdaX3ifyjt5FHjjoN6tFgtw7
 2IOEa4pixPWDCfD8oIuOjgLVo92O3mehkxRfd3s2HelZyEIvXdShbCofB
 8384pkY2iLO37l6g4Xk5uoPAMvz6jDvh9hkkH5WgqDLsIltod9NM5UEcW
 nbwzZta+tQ7x9veA4TdYXe4ZEh7aXLrlekaW55hgp6+X+c4yrWhSABdyg
 LEeVfRch1Kxj61ibJYVtqAWV63g4qNP1GfMvP4x48htnleaGyr2fSpwo7
 oTcRgCY83WAFUeNCurYrn4wXMfsZufsPfrXqimNxE2rqYlh4R2LVqfL4U g==;
X-CSE-ConnectionGUID: O0qeuS59RyOHS4nci11XIw==
X-CSE-MsgGUID: cJ/9JGmfQPOHXXe/ohvsEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="11406458"
X-IronPort-AV: E=Sophos;i="6.07,261,1708416000"; d="scan'208";a="11406458"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 04:05:54 -0700
X-CSE-ConnectionGUID: 365tfxiDTwaI0bkDHm+j9A==
X-CSE-MsgGUID: cCnkjgeJSdact9Hn5hHLhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,261,1708416000"; d="scan'208";a="28458630"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 May 2024 04:05:49 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 07 May 2024 14:05:48 +0300
Date: Tue, 7 May 2024 14:05:48 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Karthikeyan Ramasubramanian <kramasub@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2] drivers/i915/intel_bios: Fix parsing backlight BDB data
Message-ID: <ZjoLDJJdfZKKcBFt@intel.com>
References: <20240221180622.v2.1.I0690aa3e96a83a43b3fc33f50395d334b2981826@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240221180622.v2.1.I0690aa3e96a83a43b3fc33f50395d334b2981826@changeid>
X-Patchwork-Hint: comment
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

On Wed, Feb 21, 2024 at 06:06:24PM -0700, Karthikeyan Ramasubramanian wrote:
> Starting BDB version 239, hdr_dpcd_refresh_timeout is introduced to
> backlight BDB data. Commit 700034566d68 ("drm/i915/bios: Define more BDB
> contents") updated the backlight BDB data accordingly. This broke the
> parsing of backlight BDB data in VBT for versions 236 - 238 (both
> inclusive) and hence the backlight controls are not responding on units
> with the concerned BDB version.
> 
> backlight_control information has been present in backlight BDB data
> from at least BDB version 191 onwards, if not before. Hence this patch
> extracts the backlight_control information for BDB version 191 or newer.
> Tested on Chromebooks using Jasperlake SoC (reports bdb->version = 236).
> Tested on Chromebooks using Raptorlake SoC (reports bdb->version = 251).
> 
> Fixes: 700034566d68 ("drm/i915/bios: Define more BDB contents")
> Cc: stable@vger.kernel.org
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@chromium.org>
> ---
> 
> Changes in v2:
> - removed checking the block size of the backlight BDB data

I fixed up the formatting of the commit message a bit,
added a note indicating why it's ok to remove the size
checks, and pushed to drm-intel-next. Thanks.

> 
>  drivers/gpu/drm/i915/display/intel_bios.c     | 19 ++++---------------
>  drivers/gpu/drm/i915/display/intel_vbt_defs.h |  5 -----
>  2 files changed, 4 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
> index aa169b0055e97..8c1eb05fe77d2 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -1042,22 +1042,11 @@ parse_lfp_backlight(struct drm_i915_private *i915,
>  	panel->vbt.backlight.type = INTEL_BACKLIGHT_DISPLAY_DDI;
>  	panel->vbt.backlight.controller = 0;
>  	if (i915->display.vbt.version >= 191) {
> -		size_t exp_size;
> +		const struct lfp_backlight_control_method *method;
>  
> -		if (i915->display.vbt.version >= 236)
> -			exp_size = sizeof(struct bdb_lfp_backlight_data);
> -		else if (i915->display.vbt.version >= 234)
> -			exp_size = EXP_BDB_LFP_BL_DATA_SIZE_REV_234;
> -		else
> -			exp_size = EXP_BDB_LFP_BL_DATA_SIZE_REV_191;
> -
> -		if (get_blocksize(backlight_data) >= exp_size) {
> -			const struct lfp_backlight_control_method *method;
> -
> -			method = &backlight_data->backlight_control[panel_type];
> -			panel->vbt.backlight.type = method->type;
> -			panel->vbt.backlight.controller = method->controller;
> -		}
> +		method = &backlight_data->backlight_control[panel_type];
> +		panel->vbt.backlight.type = method->type;
> +		panel->vbt.backlight.controller = method->controller;
>  	}
>  
>  	panel->vbt.backlight.pwm_freq_hz = entry->pwm_freq_hz;
> diff --git a/drivers/gpu/drm/i915/display/intel_vbt_defs.h b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
> index a9f44abfc9fc2..b50cd0dcabda9 100644
> --- a/drivers/gpu/drm/i915/display/intel_vbt_defs.h
> +++ b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
> @@ -897,11 +897,6 @@ struct lfp_brightness_level {
>  	u16 reserved;
>  } __packed;
>  
> -#define EXP_BDB_LFP_BL_DATA_SIZE_REV_191 \
> -	offsetof(struct bdb_lfp_backlight_data, brightness_level)
> -#define EXP_BDB_LFP_BL_DATA_SIZE_REV_234 \
> -	offsetof(struct bdb_lfp_backlight_data, brightness_precision_bits)
> -
>  struct bdb_lfp_backlight_data {
>  	u8 entry_size;
>  	struct lfp_backlight_data_entry data[16];
> -- 
> 2.44.0.rc0.258.g7320e95886-goog

-- 
Ville Syrjälä
Intel
