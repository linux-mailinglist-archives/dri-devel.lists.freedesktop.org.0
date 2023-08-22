Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1044784237
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 15:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5A110E1D5;
	Tue, 22 Aug 2023 13:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD69C10E1D5;
 Tue, 22 Aug 2023 13:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692711542; x=1724247542;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=CU1zHVSnu4ilx1GrsW1Za+0v5qYL7vM+kz50WBnV8yw=;
 b=U8Vf9j0tCkXgQDPmoeTE+MtevDl+K5CrxB083a32/IXgRYEo6OJjgONw
 0IC/v4PVjr9lATa01xmr75/xQJ/q6u1uoE3nKbjdheNVsiHTMopVcPsZN
 We2gnMqRB2uyb7QhBXtVDWfkJKTpmt8mQMWOIV2BJaQqer+KgAqS7iKcf
 P6uX3d6DLokffQnG222bj98EGiteR30wYEMssCHp1uSIZRcuGlajfuO7O
 VT6Lzbl3qkrBgEDa5zGF1wkQ5KPmmz3wsBdK9O1tQALS0vhvO6Gq6Amuq
 Eq/pBFRrgfZlkYENjNtEOQOmvfDyGZwlBQsfZTWEp+ccITFA7dqwuTi5A A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="371303892"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="371303892"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 06:39:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="765743523"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="765743523"
Received: from kainaats-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.230])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 06:38:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/display/dp: Fix the DP DSC Receiver cap
 size
In-Reply-To: <20230818044436.177806-1-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230818044436.177806-1-ankit.k.nautiyal@intel.com>
Date: Tue, 22 Aug 2023 16:38:56 +0300
Message-ID: <87y1i35h8v.fsf@intel.com>
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

On Fri, 18 Aug 2023, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
> DP DSC Receiver Capabilities are exposed via DPCD 60h-6Fh.
> Fix the DSC RECEIVER CAP SIZE accordingly.
>
> Fixes: ffddc4363c28 ("drm/dp: Add DP DSC DPCD receiver capability size define and missing SHIFT")
> Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Cc: <stable@vger.kernel.org> # v5.0+
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

Thanks for the patch and review, pushed to drm-misc-fixes.

BR,
Jani.

> ---
>  include/drm/display/drm_dp.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index 02f2ac4dd2df..e69cece404b3 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -1537,7 +1537,7 @@ enum drm_dp_phy {
>  
>  #define DP_BRANCH_OUI_HEADER_SIZE	0xc
>  #define DP_RECEIVER_CAP_SIZE		0xf
> -#define DP_DSC_RECEIVER_CAP_SIZE        0xf
> +#define DP_DSC_RECEIVER_CAP_SIZE        0x10 /* DSC Capabilities 0x60 through 0x6F */
>  #define EDP_PSR_RECEIVER_CAP_SIZE	2
>  #define EDP_DISPLAY_CTL_CAP_SIZE	3
>  #define DP_LTTPR_COMMON_CAP_SIZE	8

-- 
Jani Nikula, Intel Open Source Graphics Center
