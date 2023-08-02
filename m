Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 241ED76CBF1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 13:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313A810E076;
	Wed,  2 Aug 2023 11:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DBD10E076;
 Wed,  2 Aug 2023 11:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690976608; x=1722512608;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nCRkv0ycjOI55itU8dUiTudlSa5cQbh/V5jaIgtFzkE=;
 b=m4WgET9K6QATHCOfV0FE7nxSMw3W2gvPe9VFalaTOBG+XzxbISPs7ba0
 BLaymo+WBSNu+BDRaw/E5lg5f6gsf/t9Kq3SUwbT3GTJxK0KiC+ex8wkH
 A1gX/AFlawjVG0r8Uye183rwYg+NgRQgxJ5vrD4yRg+mdQs7QBFI6yJqM
 Z8Ja8ae2Ou+6fwCzcjmjqm8MZmjSb+ai6xaSU6AtYa9vzLb+2C5FcaPn4
 Vp+ifICoGPwZQvdZVcfYkB5g4kj+HXSLS8R7iMS1vftfDWRDrFKIAvO+z
 NfXZB7X1qn+hPmTWy75t4OhunHDXXw0GUTHNu8Kd+aww7woeYy18+c2ht g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="359598440"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="359598440"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 04:43:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="729077929"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="729077929"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 04:43:24 -0700
Date: Wed, 2 Aug 2023 14:43:17 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 08/20] drm/display/dp: Fix the DP DSC Receiver cap size
Message-ID: <ZMpBVeZuCEhsW8Xw@intel.com>
References: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
 <20230728041150.2524032-9-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728041150.2524032-9-ankit.k.nautiyal@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, anusha.srivatsa@intel.com,
 dri-devel@lists.freedesktop.org, navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 28, 2023 at 09:41:38AM +0530, Ankit Nautiyal wrote:
> DP DSC Receiver Capabilities are exposed via DPCD 60h-6Fh.
> Fix the DSC RECEIVER CAP SIZE accordingly.
> 
> Fixes: ffddc4363c28 ("drm/dp: Add DP DSC DPCD receiver capability size define and missing SHIFT")
> Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Cc: <stable@vger.kernel.org> # v5.0+
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
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

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

> -- 
> 2.40.1
> 
