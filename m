Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CD3952DD2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 14:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B90A10E31C;
	Thu, 15 Aug 2024 12:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KrWYFW4w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0D610E31C;
 Thu, 15 Aug 2024 12:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723723457; x=1755259457;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7nMDbWuL5d4Ld2FOrp4EEJYNhkUzu9OCM8essQa4VWY=;
 b=KrWYFW4wDpstuJ3QCwTUWsx6kdV4Ba9LA4Ae1Ccq7X1zKt8xHUIjawPd
 34ofFO7ADhAdBfa+OSz4FP1qGRV8uElAiaoYHJuSIpPqeMkKkZvm1gM4R
 7oonHxkHfYvTh21M64Tx46ccFfAhdMvpRFkr1s+ANAZVTpV8fZUMYdSB5
 yapm+8GfDZDzNwZ7u9TUe8o6TC9368NMiKlwXRMgA/SpBWLb+ENvgHoCh
 1mqHq7tWcY7mG/cZdCxsIAU/rGQgEt39WlGWXKPc71DsF24FhtA5C3S/d
 D5598lZB03Ej3mofH3ZVXUzs2AL/v6zMm09o/BpgTloXLOYzXk9RmmvRk w==;
X-CSE-ConnectionGUID: 6/oh7g64R5SwVGGoAyjhog==
X-CSE-MsgGUID: 8I+Ku72iTLmW0rsNJqVPrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="24878577"
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; d="scan'208";a="24878577"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 05:04:16 -0700
X-CSE-ConnectionGUID: WoesS/dzQnav97dq4Z+oKQ==
X-CSE-MsgGUID: W6UE0PfRREaSACHR+XK7ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; d="scan'208";a="59612461"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.160])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 05:04:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Zhi Wang <zhiwang@kernel.rog>, Zhenyu
 Wang <zhenyuw@linux.intel.com>, Zhi
 Wang <zhi.wang.linux@gmail.com>, intel-gvt-dev@lists.freedesktop.org
Subject: Re: [RESEND 2/2] drm/edid: make drm_edid_block_valid() static
In-Reply-To: <20240812142849.1588006-2-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240812142849.1588006-1-jani.nikula@intel.com>
 <20240812142849.1588006-2-jani.nikula@intel.com>
Date: Thu, 15 Aug 2024 15:04:11 +0300
Message-ID: <87mslexa9w.fsf@intel.com>
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

On Mon, 12 Aug 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> drm_edid_block_valid() is no longer used outside of drm_edid.c. Make it
> static.
>
> Acked-by: Zhi Wang <zhiwang@kernel.rog>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Both pushed to drm-misc-next with Sima's R-b on patch 2.

BR,
Jani.


>
> ---
>
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Zhi Wang <zhi.wang.linux@gmail.com>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/drm_edid.c | 17 ++++-------------
>  include/drm/drm_edid.h     |  2 --
>  2 files changed, 4 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index f68a41eeb1fa..13b3fd351b16 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1966,22 +1966,14 @@ static void edid_block_dump(const char *level, const void *block, int block_num)
>  		       block, EDID_LENGTH, false);
>  }
>  
> -/**
> - * drm_edid_block_valid - Sanity check the EDID block (base or extension)
> - * @_block: pointer to raw EDID block
> - * @block_num: type of block to validate (0 for base, extension otherwise)
> - * @print_bad_edid: if true, dump bad EDID blocks to the console
> - * @edid_corrupt: if true, the header or checksum is invalid
> - *
> +/*
>   * Validate a base or extension EDID block and optionally dump bad blocks to
>   * the console.
> - *
> - * Return: True if the block is valid, false otherwise.
>   */
> -bool drm_edid_block_valid(u8 *_block, int block_num, bool print_bad_edid,
> -			  bool *edid_corrupt)
> +static bool drm_edid_block_valid(void *_block, int block_num, bool print_bad_edid,
> +				 bool *edid_corrupt)
>  {
> -	struct edid *block = (struct edid *)_block;
> +	struct edid *block = _block;
>  	enum edid_block_status status;
>  	bool is_base_block = block_num == 0;
>  	bool valid;
> @@ -2024,7 +2016,6 @@ bool drm_edid_block_valid(u8 *_block, int block_num, bool print_bad_edid,
>  
>  	return valid;
>  }
> -EXPORT_SYMBOL(drm_edid_block_valid);
>  
>  /**
>   * drm_edid_is_valid - sanity check EDID data
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 6bdfa254a1c1..eaac5e665892 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -440,8 +440,6 @@ int drm_add_modes_noedid(struct drm_connector *connector,
>  			 int hdisplay, int vdisplay);
>  
>  int drm_edid_header_is_valid(const void *edid);
> -bool drm_edid_block_valid(u8 *raw_edid, int block, bool print_bad_edid,
> -			  bool *edid_corrupt);
>  bool drm_edid_is_valid(struct edid *edid);
>  void drm_edid_get_monitor_name(const struct edid *edid, char *name,
>  			       int buflen);

-- 
Jani Nikula, Intel
