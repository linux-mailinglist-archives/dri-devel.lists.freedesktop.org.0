Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E90911A1E6F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 12:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F506E0A6;
	Wed,  8 Apr 2020 10:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14D66E0A6;
 Wed,  8 Apr 2020 10:01:06 +0000 (UTC)
IronPort-SDR: kGeLy4cCEx12NwoeKxpQe4CR9qH4lIadup5+a3RV7hwRUDjnKHJEYQXxfH3izZ+4j+l4Crj7c8
 fy5thOhpGj1w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2020 03:01:06 -0700
IronPort-SDR: zwKDfBW1VAICxh+o1tjJvU7Fh5RuaFLQUkCDECE1qZ+tgXdxH5TGr2xEYkbvW6MHF1DbzIqDFT
 j5+H/1h56BpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,357,1580803200"; d="scan'208";a="240252790"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga007.jf.intel.com with ESMTP; 08 Apr 2020 03:01:05 -0700
Received: from fmsmsx152.amr.corp.intel.com (10.18.125.5) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 8 Apr 2020 03:01:05 -0700
Received: from BGSMSX107.gar.corp.intel.com (10.223.4.191) by
 FMSMSX152.amr.corp.intel.com (10.18.125.5) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 8 Apr 2020 03:01:05 -0700
Received: from BGSMSX108.gar.corp.intel.com ([169.254.8.65]) by
 BGSMSX107.gar.corp.intel.com ([169.254.9.81]) with mapi id 14.03.0439.000;
 Wed, 8 Apr 2020 15:30:58 +0530
From: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH RESEND 4/7] drm/i915/dsc: configure hardware using
 specified rc_model_size
Thread-Topic: [PATCH RESEND 4/7] drm/i915/dsc: configure hardware using
 specified rc_model_size
Thread-Index: AQHWBDVBFWkODEQ6uk+gUxz/liIO16hvEDHw
Date: Wed, 8 Apr 2020 10:00:58 +0000
Message-ID: <57510F3E2013164E925CD03ED7512A3B80A8841F@BGSMSX108.gar.corp.intel.com>
References: <20200327124229.26461-1-jani.nikula@intel.com>
 <20200327124229.26461-4-jani.nikula@intel.com>
In-Reply-To: <20200327124229.26461-4-jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Navare,
 Manasi D" <manasi.d.navare@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Jani Nikula <jani.nikula@intel.com>
> Sent: Friday, March 27, 2020 6:12 PM
> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Nikula, Jani <jani.nikula@intel.com>; Navare, Manasi D
> <manasi.d.navare@intel.com>; Kulkarni, Vandita <vandita.kulkarni@intel.com>
> Subject: [PATCH RESEND 4/7] drm/i915/dsc: configure hardware using
> specified rc_model_size
> 
> The rc_model_size is specified in the DSC config, and the hardware
> programming should respect that instead of hard coding a value of 8192.
> 
> Regardless, the rc_model_size in DSC config is currently hard coded to the
> same value, so this should have no impact, other than allowing the use of other
> sizes as needed.
> 
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Looks good to me.
Reviewed-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_vdsc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c
> b/drivers/gpu/drm/i915/display/intel_vdsc.c
> index 95ad87d4ccb3..1f74b0174b1a 100644
> --- a/drivers/gpu/drm/i915/display/intel_vdsc.c
> +++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
> @@ -740,7 +740,7 @@ static void intel_dsc_pps_configure(struct
> intel_encoder *encoder,
> 
>  	/* Populate PICTURE_PARAMETER_SET_9 registers */
>  	pps_val = 0;
> -	pps_val |= DSC_RC_MODEL_SIZE(DSC_RC_MODEL_SIZE_CONST) |
> +	pps_val |= DSC_RC_MODEL_SIZE(vdsc_cfg->rc_model_size) |
>  		DSC_RC_EDGE_FACTOR(DSC_RC_EDGE_FACTOR_CONST);
>  	drm_info(&dev_priv->drm, "PPS9 = 0x%08x\n", pps_val);
>  	if (!is_pipe_dsc(crtc_state)) {
> --
> 2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
