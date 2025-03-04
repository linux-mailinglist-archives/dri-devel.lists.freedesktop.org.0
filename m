Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73152A4E044
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 15:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB85C10E5DD;
	Tue,  4 Mar 2025 14:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P0op3gg+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C668F10E5DD
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 14:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741097392; x=1772633392;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=pzDdAjfIYZzOdK4dw8r3huxzvxorzalfIll9yJWmUiQ=;
 b=P0op3gg+hBWVmRK0Gj8HnLzyL8qEKMcuDKHEd12nRvhbwnY9JcjtF1ZN
 N/3wnhJPg3jOTOhw6Uubm7yDJOaElZMtwQIKn+3FXGjrYcPfhMl392a9M
 YfrkEmMPXagjB76pwYcCdzqEbjHWzhliFtBpx4M3WzUFymgSKvXk5BmKh
 zzOyAmlXO+ThUXOSndBmcdS2RSdwFvBQOf9sBFnAYprzrdPfq3j6Oie9c
 TfVimuztK1OzuFtn5w9kRhAtC+knufwrPFpT5ujri+RT4pqlBGi3At5S0
 R6lfuNC+d05D/rx+29GqM9pzgcP+2eVlZW23TlI/nYk7hpzYN5VWGMxou w==;
X-CSE-ConnectionGUID: ksq+cz00TfuQYfo23wyDZg==
X-CSE-MsgGUID: 96J9aROrT++ddO3Xe5i57A==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42263277"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="42263277"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 06:09:52 -0800
X-CSE-ConnectionGUID: lUtOcMvlTsGUZX96/AjNfg==
X-CSE-MsgGUID: UChttDzwSpKePN1KQX3C/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="149169477"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.192])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 06:09:48 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>, Aun-Ali Zaidi <admin@kodeit.net>,
 Aditya Garg <gargaditya08@live.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Atharva Tiwari <evepolonium@gmail.com>, Kerem Karabay
 <kekrby@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev, Nathan Chancellor
 <nathan@kernel.org>
Subject: Re: [PATCH] drm/appletbdrm: Fix format specifier for size_t variables
In-Reply-To: <20250304-appletbdrm-fix-size_t-specifier-v1-1-94fe1d2c91f8@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250304-appletbdrm-fix-size_t-specifier-v1-1-94fe1d2c91f8@kernel.org>
Date: Tue, 04 Mar 2025 16:09:44 +0200
Message-ID: <87h648zy3b.fsf@intel.com>
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

On Tue, 04 Mar 2025, Nathan Chancellor <nathan@kernel.org> wrote:
> When building for a 32-bit platform, there are some warnings (or errors
> with CONFIG_WERROR=y) due to an incorrect specifier for 'size_t'
> variables, which is typedef'd as 'unsigned int' for these architectures:
>
>   drivers/gpu/drm/tiny/appletbdrm.c:171:17: error: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Werror,-Wformat]
>     170 |                 drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
>         |                                                                             ~~~
>         |                                                                             %zu
>     171 |                         actual_size, size);
>         |                                      ^~~~
>   ...
>   drivers/gpu/drm/tiny/appletbdrm.c:212:17: error: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Werror,-Wformat]
>     211 |                 drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
>         |                                                                             ~~~
>         |                                                                             %zu
>     212 |                         actual_size, size);
>         |                                      ^~~~
>
> Use '%zu' as suggested, clearing up the warnings.
>
> Fixes: 0670c2f56e45 ("drm/tiny: add driver for Apple Touch Bars in x86 Macs")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Just sent an identical patch [1]. :)

You have a better commit message, let's go with this. With Aditya's ack
from the other thread,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Acked-by: Aditya Garg <gargaditya08@live.com>

[1] https://lore.kernel.org/r/20250304135456.429407-1-jani.nikula@intel.com

> ---
>  drivers/gpu/drm/tiny/appletbdrm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/tiny/appletbdrm.c b/drivers/gpu/drm/tiny/appletbdrm.c
> index f5d177e234e4..394c8f9bd41a 100644
> --- a/drivers/gpu/drm/tiny/appletbdrm.c
> +++ b/drivers/gpu/drm/tiny/appletbdrm.c
> @@ -167,7 +167,7 @@ static int appletbdrm_send_request(struct appletbdrm_device *adev,
>  	}
>  
>  	if (actual_size != size) {
> -		drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
> +		drm_err(drm, "Actual size (%d) doesn't match expected size (%zu)\n",
>  			actual_size, size);
>  		return -EIO;
>  	}
> @@ -208,7 +208,7 @@ static int appletbdrm_read_response(struct appletbdrm_device *adev,
>  	}
>  
>  	if (actual_size != size) {
> -		drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
> +		drm_err(drm, "Actual size (%d) doesn't match expected size (%zu)\n",
>  			actual_size, size);
>  		return -EBADMSG;
>  	}
>
> ---
> base-commit: 95a5c9d197bb22a506913acb330a926d4e51aa95
> change-id: 20250304-appletbdrm-fix-size_t-specifier-d3c547522379
>
> Best regards,

-- 
Jani Nikula, Intel
