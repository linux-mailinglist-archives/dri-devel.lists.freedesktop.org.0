Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F24592B35
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 11:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A4E10FE0E;
	Mon, 15 Aug 2022 09:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D5EB5E8E;
 Mon, 15 Aug 2022 09:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660555727; x=1692091727;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/ZB/bqkS16wIpUYRzAIn8dYga5U2Lc9wCDdIGKNXATg=;
 b=fotXBnSgSB2KCcB/FQUMmaEyRNFrcztR511kBmiLazcjsoYbXrlb7I74
 et6rAbMaSUORG3mDnIaFk7vgw96X0l2drug3uQ0dNNHW83lXYRIpagVDV
 Fbq8/KLaa8r863nFnvjBjgEUolZeguk0UyV1t6McFAn72vkHktQBCtoi6
 c/oG7KmZVHN8B6e3982vaxjM4iD43NkK1ftXeY9Hr8kxyQ2cZrosMe8+Y
 nlkPoJGcYFPnsGwSMtwTflxj0Jr0CSaNTaglzXkzoY7nJZ/XCKjR35mrU
 soyyVyJ4slwp03IwrufI5L6MNFTgFep+7FZA9kimnmXEPDhafsfGW2wuo g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10439"; a="293196681"
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="293196681"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 02:28:43 -0700
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="666602713"
Received: from abelova-mobl2.ccr.corp.intel.com (HELO localhost)
 ([10.252.50.172])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 02:28:40 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: min tang <tangmin@cdjrlc.com>, airlied@linux.ie, daniel@ffwll.ch,
 srinivas.pandruvada@linux.intel.com
Subject: Re: [PATCH] drm/i915/gt: Unneeded semicolon
In-Reply-To: <20220813151616.4193-1-tangmin@cdjrlc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220813151616.4193-1-tangmin@cdjrlc.com>
Date: Mon, 15 Aug 2022 12:28:38 +0300
Message-ID: <871qthsvnd.fsf@intel.com>
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
Cc: min tang <tangmin@cdjrlc.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 13 Aug 2022, min tang <tangmin@cdjrlc.com> wrote:
> There is no semicolon after '}' in line 648.
>
> Signed-off-by: min tang <tangmin@cdjrlc.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_migrate.c         | 2 +-

This part is fine.

>  tools/power/x86/intel-speed-select/hfi-events.c | 2 +-
>  tools/testing/selftests/timers/nanosleep.c      | 2 +-

These need to be split out and sent to their respective subsystems.

BR,
Jani.

>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> index 2c35324b5f68..a69b244f14d0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -645,7 +645,7 @@ static int scatter_list_length(struct scatterlist *sg)
>  	while (sg && sg_dma_len(sg)) {
>  		len += sg_dma_len(sg);
>  		sg = sg_next(sg);
> -	};
> +	}
>  
>  	return len;
>  }
> diff --git a/tools/power/x86/intel-speed-select/hfi-events.c b/tools/power/x86/intel-speed-select/hfi-events.c
> index 761375062505..f0ed69721308 100644
> --- a/tools/power/x86/intel-speed-select/hfi-events.c
> +++ b/tools/power/x86/intel-speed-select/hfi-events.c
> @@ -144,7 +144,7 @@ static int family_handler(struct nl_msg *msg, void *arg)
>  			continue;
>  		res->id = nla_get_u32(tb2[CTRL_ATTR_MCAST_GRP_ID]);
>  		break;
> -	};
> +	}
>  
>  	return 0;
>  }
> diff --git a/tools/testing/selftests/timers/nanosleep.c b/tools/testing/selftests/timers/nanosleep.c
> index 71b5441c2fd9..433a09676aeb 100644
> --- a/tools/testing/selftests/timers/nanosleep.c
> +++ b/tools/testing/selftests/timers/nanosleep.c
> @@ -72,7 +72,7 @@ char *clockstring(int clockid)
>  		return "CLOCK_BOOTTIME_ALARM";
>  	case CLOCK_TAI:
>  		return "CLOCK_TAI";
> -	};
> +	}
>  	return "UNKNOWN_CLOCKID";
>  }

-- 
Jani Nikula, Intel Open Source Graphics Center
