Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1618E41BDD1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 05:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DEA36E160;
	Wed, 29 Sep 2021 03:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D36CC6E160;
 Wed, 29 Sep 2021 03:58:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="212109307"
X-IronPort-AV: E=Sophos;i="5.85,331,1624345200"; d="scan'208";a="212109307"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 20:58:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,331,1624345200"; d="scan'208";a="707030719"
Received: from irsmsx603.ger.corp.intel.com ([163.33.146.9])
 by fmsmga006.fm.intel.com with ESMTP; 28 Sep 2021 20:58:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 irsmsx603.ger.corp.intel.com (163.33.146.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 29 Sep 2021 04:58:11 +0100
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.2242.012;
 Tue, 28 Sep 2021 20:58:10 -0700
From: "Navare, Manasi D" <manasi.d.navare@intel.com>
To: "Zuo, Jerry" <Jerry.Zuo@amd.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Li, Sun peng (Leo)"
 <Sunpeng.Li@amd.com>, "nathan@kernel.org" <nathan@kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org"
 <linux-next@vger.kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>, "Wentland, Harry"
 <Harry.Wentland@amd.com>
Subject: RE: [PATCH v2] drm/amd/display: Only define DP 2.0 symbols if not
 already defined
Thread-Topic: [PATCH v2] drm/amd/display: Only define DP 2.0 symbols if not
 already defined
Thread-Index: AQHXtIuAL0vs/jg+d0q0VwbXvyqk8Ku6LEQAgAA2mbA=
Date: Wed, 29 Sep 2021 03:58:10 +0000
Message-ID: <2c69ff90750f40ecad3cd4053bc46497@intel.com>
References: <20210928170828.26452-1-harry.wentland@amd.com>
 <DM6PR12MB49125AD4817D693AA3987B08E5A89@DM6PR12MB4912.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB49125AD4817D693AA3987B08E5A89@DM6PR12MB4912.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=6d37b753-7317-49e9-b10f-7dd42dee753a;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-09-28T17:35:51Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

We have merged such DRM definition dependencies previously through a topic =
branch in order to avoid redefining inside the driver.
But yes guarding this with ifdef is good.

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>

Manasi

-----Original Message-----
From: Zuo, Jerry <Jerry.Zuo@amd.com>=20
Sent: Tuesday, September 28, 2021 11:11 PM
To: Wentland, Harry <Harry.Wentland@amd.com>; Deucher, Alexander <Alexander=
.Deucher@amd.com>; amd-gfx@lists.freedesktop.org
Cc: Nikula, Jani <jani.nikula@intel.com>; Li, Sun peng (Leo) <Sunpeng.Li@am=
d.com>; nathan@kernel.org; intel-gfx@lists.freedesktop.org; dri-devel@lists=
.freedesktop.org; ville.syrjala@linux.intel.com; Navare, Manasi D <manasi.d=
.navare@intel.com>; Koenig, Christian <Christian.Koenig@amd.com>; Pan, Xinh=
ui <Xinhui.Pan@amd.com>; sfr@canb.auug.org.au; linux-next@vger.kernel.org; =
airlied@gmail.com; daniel.vetter@ffwll.ch; Wentland, Harry <Harry.Wentland@=
amd.com>
Subject: RE: [PATCH v2] drm/amd/display: Only define DP 2.0 symbols if not =
already defined

[AMD Official Use Only]

> -----Original Message-----
> From: Harry Wentland <harry.wentland@amd.com>
> Sent: September 28, 2021 1:08 PM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>; amd-=20
> gfx@lists.freedesktop.org; Zuo, Jerry <Jerry.Zuo@amd.com>
> Cc: jani.nikula@intel.com; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>;=20
> nathan@kernel.org; intel-gfx@lists.freedesktop.org; dri-=20
> devel@lists.freedesktop.org; ville.syrjala@linux.intel.com;=20
> manasi.d.navare@intel.com; Koenig, Christian=20
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;=20
> sfr@canb.auug.org.au; linux- next@vger.kernel.org; airlied@gmail.com;=20
> daniel.vetter@ffwll.ch; Wentland, Harry <Harry.Wentland@amd.com>
> Subject: [PATCH v2] drm/amd/display: Only define DP 2.0 symbols if not=20
> already defined
>
> [Why]
> For some reason we're defining DP 2.0 definitions inside our driver.=20
> Now that patches to introduce relevant definitions are slated to be=20
> merged into drm- next this is causing conflicts.
>
> In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c:33:
> In file included
> from ./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:70:
> In file included
> from ./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_mode.h:36:
> ./include/drm/drm_dp_helper.h:1322:9: error:
> 'DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER' macro redefined [-=20
> Werror,-Wmacro-redefined]
>         ^
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dp_types.h:881:9: note:
> previous definition is here
>         ^
> 1 error generated.
>
> v2: Add one missing endif
>
> [How]
> Guard all display driver defines with #ifndef for now. Once we pull in=20
> the new definitions into amd-staging-drm-next we will follow up and=20
> drop definitions from our driver and provide follow-up header updates=20
> for any addition DP
> 2.0 definitions required by our driver.
>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>

Reviewed-by: Fangzhi Zuo <Jerry.Zuo@amd.com>

> ---
>  drivers/gpu/drm/amd/display/dc/dc_dp_types.h | 54
> ++++++++++++++++++--
>  1 file changed, 49 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
> b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
> index a5e798b5da79..9de86ff5ef1b 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
> @@ -860,28 +860,72 @@ struct psr_caps {  };
>
>  #if defined(CONFIG_DRM_AMD_DC_DCN)
> +#ifndef DP_MAIN_LINK_CHANNEL_CODING_CAP
>  #define DP_MAIN_LINK_CHANNEL_CODING_CAP                      0x006
> +#endif
> +#ifndef DP_SINK_VIDEO_FALLBACK_FORMATS
>  #define DP_SINK_VIDEO_FALLBACK_FORMATS                       0x020
> +#endif
> +#ifndef DP_FEC_CAPABILITY_1
>  #define DP_FEC_CAPABILITY_1                          0x091
> +#endif
> +#ifndef DP_DFP_CAPABILITY_EXTENSION_SUPPORT
>  #define DP_DFP_CAPABILITY_EXTENSION_SUPPORT          0x0A3
> +#endif
> +#ifndef DP_DSC_CONFIGURATION
>  #define DP_DSC_CONFIGURATION                         0x161
> +#endif
> +#ifndef DP_PHY_SQUARE_PATTERN
>  #define DP_PHY_SQUARE_PATTERN                                0x249
> +#endif
> +#ifndef DP_128b_132b_SUPPORTED_LINK_RATES
>  #define DP_128b_132b_SUPPORTED_LINK_RATES            0x2215
> +#endif
> +#ifndef DP_128b_132b_TRAINING_AUX_RD_INTERVAL
>  #define DP_128b_132b_TRAINING_AUX_RD_INTERVAL
>       0x2216
> +#endif
> +#ifndef DP_TEST_264BIT_CUSTOM_PATTERN_7_0
>  #define DP_TEST_264BIT_CUSTOM_PATTERN_7_0            0X2230
> +#endif
> +#ifndef DP_TEST_264BIT_CUSTOM_PATTERN_263_256
>  #define DP_TEST_264BIT_CUSTOM_PATTERN_263_256
>       0X2250
> +#endif
> +#ifndef DP_DSC_SUPPORT_AND_DECODER_COUNT
>  #define DP_DSC_SUPPORT_AND_DECODER_COUNT             0x2260
> +#endif
> +#ifndef DP_DSC_MAX_SLICE_COUNT_AND_AGGREGATION_0
>  #define DP_DSC_MAX_SLICE_COUNT_AND_AGGREGATION_0
>       0x2270
> -# define DP_DSC_DECODER_0_MAXIMUM_SLICE_COUNT_MASK   (1 <<
> 0)
> -# define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_MASK
>       (0b111 << 1)
> -# define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_SHIFT  1
> -# define DP_DSC_DECODER_COUNT_MASK                   (0b111 << 5)
> -# define DP_DSC_DECODER_COUNT_SHIFT                  5
> +#endif
> +#ifndef DP_DSC_DECODER_0_MAXIMUM_SLICE_COUNT_MASK
> +#define DP_DSC_DECODER_0_MAXIMUM_SLICE_COUNT_MASK    (1 <<
> 0)
> +#endif
> +#ifndef DP_DSC_DECODER_0_AGGREGATION_SUPPORT_MASK
> +#define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_MASK
>       (0b111 << 1)
> +#endif
> +#ifndef DP_DSC_DECODER_0_AGGREGATION_SUPPORT_SHIFT
> +#define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_SHIFT   1
> +#endif
> +#ifndef DP_DSC_DECODER_COUNT_MASK
> +#define DP_DSC_DECODER_COUNT_MASK                    (0b111 << 5)
> +#endif
> +#ifndef DP_DSC_DECODER_COUNT_SHIFT
> +#define DP_DSC_DECODER_COUNT_SHIFT                   5
> +#endif
> +#ifndef DP_MAIN_LINK_CHANNEL_CODING_SET
>  #define DP_MAIN_LINK_CHANNEL_CODING_SET                      0x108
> +#endif
> +#ifndef DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER
>  #define DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER     0xF0006
> +#endif
> +#ifndef DP_PHY_REPEATER_128b_132b_RATES
>  #define DP_PHY_REPEATER_128b_132b_RATES
>       0xF0007
> +#endif
> +#ifndef DP_128b_132b_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1
>  #define DP_128b_132b_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1
>       0xF0022
> +#endif
> +#ifndef DP_INTRA_HOP_AUX_REPLY_INDICATION
>  #define DP_INTRA_HOP_AUX_REPLY_INDICATION            (1 << 3)
> +#endif
>  /* TODO - Use DRM header to replace above once available */
>
>  union dp_main_line_channel_coding_cap {
> --
> 2.33.0

