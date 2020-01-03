Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F9712FF4F
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 00:53:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237396E37F;
	Fri,  3 Jan 2020 23:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FB86E375;
 Fri,  3 Jan 2020 23:53:41 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jan 2020 15:53:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,392,1571727600"; d="scan'208";a="245037051"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO intel.com)
 ([10.165.21.211])
 by fmsmga004.fm.intel.com with ESMTP; 03 Jan 2020 15:53:41 -0800
Date: Fri, 3 Jan 2020 15:54:45 -0800
From: Manasi Navare <manasi.d.navare@intel.com>
To: Animesh Manna <animesh.manna@intel.com>
Subject: Re: [PATCH v3 1/9] drm/amd/display: Align macro name as per DP spec
Message-ID: <20200103235444.GD2608@intel.com>
References: <20191230161523.32222-1-animesh.manna@intel.com>
 <20191230161523.32222-2-animesh.manna@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191230161523.32222-2-animesh.manna@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: jani.nikula@intel.com, nidhi1.gupta@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 uma.shankar@intel.com, anshuman.gupta@intel.com,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Harry, Jani - Since this also updates the AMD driver file, should this be merged through
AMD tree and then backmerged to drm-misc ?

Manasi

On Mon, Dec 30, 2019 at 09:45:15PM +0530, Animesh Manna wrote:
> [Why]:
> Aligh with DP spec wanted to follow same naming convention.
> 
> [How]:
> Changed the macro name of the dpcd address used for getting requested
> test-pattern.
> 
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 2 +-
>  include/drm/drm_dp_helper.h                      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> index 42aa889fd0f5..1a6109be2fce 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> @@ -2491,7 +2491,7 @@ static void dp_test_send_phy_test_pattern(struct dc_link *link)
>  	/* get phy test pattern and pattern parameters from DP receiver */
>  	core_link_read_dpcd(
>  			link,
> -			DP_TEST_PHY_PATTERN,
> +			DP_PHY_TEST_PATTERN,
>  			&dpcd_test_pattern.raw,
>  			sizeof(dpcd_test_pattern));
>  	core_link_read_dpcd(
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 8f8f3632e697..d6e560870fb1 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -699,7 +699,7 @@
>  # define DP_TEST_CRC_SUPPORTED		    (1 << 5)
>  # define DP_TEST_COUNT_MASK		    0xf
>  
> -#define DP_TEST_PHY_PATTERN                 0x248
> +#define DP_PHY_TEST_PATTERN                 0x248
>  #define DP_TEST_80BIT_CUSTOM_PATTERN_7_0    0x250
>  #define	DP_TEST_80BIT_CUSTOM_PATTERN_15_8   0x251
>  #define	DP_TEST_80BIT_CUSTOM_PATTERN_23_16  0x252
> -- 
> 2.24.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
