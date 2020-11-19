Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F1C2B90D1
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 12:19:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301D989CAF;
	Thu, 19 Nov 2020 11:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8151789CAF;
 Thu, 19 Nov 2020 11:19:13 +0000 (UTC)
IronPort-SDR: 6QcFFaDz+utY6f+Vy8jV+xZ6pR7dg5+m6TXzJgBDGjRnGpmsdeq3N7CR7am7N3Kmh+ccZ/zj0g
 c9jwm9vLQy0g==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="189358883"
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; d="scan'208";a="189358883"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2020 03:19:13 -0800
IronPort-SDR: gVEP3ZOt1e/71ABITg2nAYCuaxGMIZb/XygCNH6WPKBfo58oPaQseJd7mKlSQ0jrZVKp387Q93
 I34OJAzjiyHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; d="scan'208";a="533139020"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 19 Nov 2020 03:19:13 -0800
Received: from bgsmsx602.gar.corp.intel.com (10.109.78.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 19 Nov 2020 03:19:11 -0800
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX602.gar.corp.intel.com (10.109.78.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 19 Nov 2020 16:49:09 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Thu, 19 Nov 2020 16:49:09 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2 09/13] drm/i915: Check for FRL training before DP Link
 training
Thread-Topic: [PATCH v2 09/13] drm/i915: Check for FRL training before DP Link
 training
Thread-Index: AQHWsDe7iuZ6jTKFmU2VGW8ZdALZB6nPawyQ
Date: Thu, 19 Nov 2020 11:19:09 +0000
Message-ID: <af8acf59a08e4e18956f83bb35bf790e@intel.com>
References: <20201101100657.12087-1-ankit.k.nautiyal@intel.com>
 <20201101100657.12087-10-ankit.k.nautiyal@intel.com>
In-Reply-To: <20201101100657.12087-10-ankit.k.nautiyal@intel.com>
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
Cc: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Sharma, 
 Swati2" <swati2.sharma@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
> Sent: Sunday, November 1, 2020 3:37 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.com>;
> Kulkarni, Vandita <vandita.kulkarni@intel.com>; ville.syrjala@linux.intel.com;
> Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH v2 09/13] drm/i915: Check for FRL training before DP Link
> training
> 
> This patch calls functions to check FRL training requirements for an HDMI2.1 sink,
> when connected through PCON.
> The call is made before the DP link training. In case FRL is not required or failure
> during FRL training, the TMDS mode is selected for the pcon.
> 
> v2: moved check_frl_training() just after FEC READY, before starting DP link
> training.

Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 2 ++
> drivers/gpu/drm/i915/display/intel_dp.c  | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
> b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 09811be08cfe..3e76fb1117df 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -3492,6 +3492,8 @@ static void tgl_ddi_pre_enable_dp(struct
> intel_atomic_state *state,
>  	 */
>  	intel_dp_sink_set_fec_ready(intel_dp, crtc_state);
> 
> +	intel_dp_check_frl_training(intel_dp);
> +
>  	/*
>  	 * 7.i Follow DisplayPort specification training sequence (see notes for
>  	 *     failure handling)
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 7feee2adf9b2..9047b620c0d0 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4183,6 +4183,7 @@ static void intel_enable_dp(struct intel_atomic_state
> *state,
> 
>  	intel_dp_set_power(intel_dp, DP_SET_POWER_D0);
>  	intel_dp_configure_protocol_converter(intel_dp);
> +	intel_dp_check_frl_training(intel_dp);
>  	intel_dp_start_link_train(intel_dp, pipe_config);
>  	intel_dp_stop_link_train(intel_dp, pipe_config);
> 
> @@ -6104,6 +6105,7 @@ int intel_dp_retrain_link(struct intel_encoder
> *encoder,
>  		    !intel_dp_mst_is_master_trans(crtc_state))
>  			continue;
> 
> +		intel_dp_check_frl_training(intel_dp);
>  		intel_dp_start_link_train(intel_dp, crtc_state);
>  		intel_dp_stop_link_train(intel_dp, crtc_state);
>  		break;
> --
> 2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
