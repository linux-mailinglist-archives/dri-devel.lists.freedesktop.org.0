Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE99D292075
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 00:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877B96E8B9;
	Sun, 18 Oct 2020 22:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5F96E8B5;
 Sun, 18 Oct 2020 22:22:02 +0000 (UTC)
IronPort-SDR: 6QHH4NXxayTDkRpxcquz8wKr+zTEJsfscqgEuLT3SLxIwiOmVomPok6z7Ivqu3FSmndEx09NZi
 dzpufvqCBPEw==
X-IronPort-AV: E=McAfee;i="6000,8403,9778"; a="163455494"
X-IronPort-AV: E=Sophos;i="5.77,392,1596524400"; d="scan'208";a="163455494"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2020 15:21:58 -0700
IronPort-SDR: Q0d0MEtONmlesAdy2HNQ70p29cwTuNxIvpSz5AKY9w7U6Ra+yT92is43ZTxs15S2AWzkiPNirI
 zbxB79ma4/JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,392,1596524400"; d="scan'208";a="521799590"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga006.fm.intel.com with ESMTP; 18 Oct 2020 15:21:58 -0700
Received: from bgsmsx605.gar.corp.intel.com (10.67.234.7) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 18 Oct 2020 15:21:57 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX605.gar.corp.intel.com (10.67.234.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 19 Oct 2020 03:51:54 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Mon, 19 Oct 2020 03:51:54 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [RFC 06/13] drm/i915: Check for FRL training before DP Link
 training
Thread-Topic: [RFC 06/13] drm/i915: Check for FRL training before DP Link
 training
Thread-Index: AQHWouJdBO/KbaqTxkmJ5Prz38/8dKmd893A
Date: Sun, 18 Oct 2020 22:21:54 +0000
Message-ID: <5ca574e0aac34b8e8f39ef17d2610672@intel.com>
References: <20201015105259.27934-1-ankit.k.nautiyal@intel.com>
 <20201015105259.27934-7-ankit.k.nautiyal@intel.com>
In-Reply-To: <20201015105259.27934-7-ankit.k.nautiyal@intel.com>
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
> Sent: Thursday, October 15, 2020 4:23 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.com>;
> Kulkarni, Vandita <vandita.kulkarni@intel.com>; ville.syrjala@linux.intel.com;
> Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [RFC 06/13] drm/i915: Check for FRL training before DP Link training
> 
> This patch calls functions to check FRL training requirements for an HDMI2.1 sink,
> when connected through PCON.
> The call is made before the DP link training. In case FRL is not required or failure
> during FRL training, the TMDS mode is selected for the pcon.
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 2 ++
> drivers/gpu/drm/i915/display/intel_dp.c  | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
> b/drivers/gpu/drm/i915/display/intel_ddi.c
> index bb0b9930958f..1834e5de60a7 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -3484,6 +3484,8 @@ static void tgl_ddi_pre_enable_dp(struct
> intel_atomic_state *state,
>  	if (!is_mst)
>  		intel_dp_sink_dpms(intel_dp, DRM_MODE_DPMS_ON);
> 
> +	intel_dp_check_frl_training(intel_dp);

Good to move it near start_link_training to stay consistent with rest of the calls.

> +
>  	intel_dp_sink_set_decompression_state(intel_dp, crtc_state, true);
>  	/*
>  	 * DDI FEC: "anticipates enabling FEC encoding sets the FEC_READY bit
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index c1342b5e7781..668165dd2b1a 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4206,6 +4206,7 @@ static void intel_enable_dp(struct intel_atomic_state
> *state,
> 
>  	intel_dp_sink_dpms(intel_dp, DRM_MODE_DPMS_ON);
>  	intel_dp_configure_protocol_converter(intel_dp);
> +	intel_dp_check_frl_training(intel_dp);
>  	intel_dp_start_link_train(intel_dp, pipe_config);
>  	intel_dp_stop_link_train(intel_dp, pipe_config);
> 
> @@ -6127,6 +6128,7 @@ int intel_dp_retrain_link(struct intel_encoder
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
