Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A85E82D8C08
	for <lists+dri-devel@lfdr.de>; Sun, 13 Dec 2020 08:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC3A6E0AF;
	Sun, 13 Dec 2020 07:29:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596296E0AF;
 Sun, 13 Dec 2020 07:29:27 +0000 (UTC)
IronPort-SDR: D92JLDl6DKDmnxiNzchP7YDJqwJDwfuS4bfaRTlHjd625W6/iu08PjYj02QdoDfKmhqQ8r4ozy
 0nHyFpYvwt1A==
X-IronPort-AV: E=McAfee;i="6000,8403,9833"; a="172025194"
X-IronPort-AV: E=Sophos;i="5.78,415,1599548400"; d="scan'208";a="172025194"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2020 23:29:26 -0800
IronPort-SDR: f4KCmZj01QdkQP0lnWwiHzj0MqCWkx8O/Nz1pVYIimOyNPliwqOnUpDYUalXqLBIlb2ANu5NxP
 IKFxQvxY+y2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,415,1599548400"; d="scan'208";a="377356944"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga004.fm.intel.com with ESMTP; 12 Dec 2020 23:29:26 -0800
Received: from bgsmsx605.gar.corp.intel.com (10.67.234.7) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 12 Dec 2020 23:29:25 -0800
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX605.gar.corp.intel.com (10.67.234.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 13 Dec 2020 12:59:23 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Sun, 13 Dec 2020 12:59:23 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v4 16/16] drm/i915: Enable PCON configuration for Color
 Conversion for TGL
Thread-Topic: [PATCH v4 16/16] drm/i915: Enable PCON configuration for Color
 Conversion for TGL
Thread-Index: AQHWzTf9+2zfgg6nuUesSL0grB37D6n0p62Q
Date: Sun, 13 Dec 2020 07:29:23 +0000
Message-ID: <9bda98244dea4f578a372361d52c0a98@intel.com>
References: <20201208075145.17389-1-ankit.k.nautiyal@intel.com>
 <20201208075145.17389-17-ankit.k.nautiyal@intel.com>
In-Reply-To: <20201208075145.17389-17-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.223.10.1]
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Sharma,
 Swati2" <swati2.sharma@intel.com>, "Kulkarni,
 Vandita" <vandita.kulkarni@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
> Sent: Tuesday, December 8, 2020 1:22 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.com>;
> airlied@linux.ie; jani.nikula@linux.intel.com; ville.syrjala@linux.intel.com;
> Kulkarni, Vandita <vandita.kulkarni@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>
> Subject: [PATCH v4 16/16] drm/i915: Enable PCON configuration for Color
> Conversion for TGL

Append display here.
> 
> This patch enables PCON configuration for color space conversion for
> TGL+ platfrom. This will help in supporting 8k@60 YUV420 modes common
> in HDMI 8k panels, through a capable PCON.
> Also allow 8k@60 YUV420 modes, only if PCON claims to support the color space
> conversion.
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 1 +
> drivers/gpu/drm/i915/display/intel_dp.c  | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
> b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 721a47bbc009..ed6b8ea85408 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -3644,6 +3644,7 @@ static void tgl_ddi_pre_enable_dp(struct
> intel_atomic_state *state,
>  	if (!is_mst)
>  		intel_dp_set_power(intel_dp, DP_SET_POWER_D0);
> 
> +	intel_dp_configure_protocol_converter(intel_dp);

Both the changes seems to be unrelated, it would be good to put configuration
of protocol convertor in earlier patches and just pruning logic here.
Also the description of patch needs to change to clearly call this out.

>  	intel_dp_sink_set_decompression_state(intel_dp, crtc_state, true);
>  	/*
>  	 * DDI FEC: "anticipates enabling FEC encoding sets the FEC_READY bit
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index b3f1190d8150..86289c925612 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -720,6 +720,11 @@ intel_dp_mode_valid_downstream(struct
> intel_connector *connector,
>  	const struct drm_display_info *info = &connector->base.display_info;
>  	int tmds_clock;
> 
> +	/* Allow 8k YUV420 modes, only if PCON supports RGB->YUV conversion
> */
> +	if (mode->hdisplay == 7680 && drm_mode_is_420_only(info, mode) &&
> +	    !intel_dp->dfp.rgb_to_ycbcr)

I think this will be a platform limitation, as there may be platforms which can
do that on the SOC side as well. So would be good to limit to those platforms where
pcon conversion is the only option in order to support this configuration, instead of doing
it for all platforms.

> +		return MODE_NO_420;
> +
>  	/*
>  	 * If PCON and HDMI2.1 sink both support FRL MODE, check FRL
>  	 * bandwidth constraints.
> --
> 2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
