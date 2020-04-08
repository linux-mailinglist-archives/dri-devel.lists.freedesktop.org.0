Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1781A1E82
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 12:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186816EA0B;
	Wed,  8 Apr 2020 10:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719C56EA0A;
 Wed,  8 Apr 2020 10:04:30 +0000 (UTC)
IronPort-SDR: HhteyjB0pX+1PdhWJJzNCr9YzyDaLuOmnLupWg4PtwOqkFqfSwY132ZbeIGuO3ul+Oid1zBE5l
 G5ooPse4bVTw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2020 03:04:29 -0700
IronPort-SDR: 96LWhhPqlDay1nBs6ew+05kQYOzCAgmLnAWgRzldDu+pV7TDt5Qaqfp8PddPZtFL3TjEJxm+VM
 ucgTjPhOALnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,357,1580803200"; d="scan'208";a="269709006"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga002.jf.intel.com with ESMTP; 08 Apr 2020 03:04:29 -0700
Received: from fmsmsx117.amr.corp.intel.com (10.18.116.17) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 8 Apr 2020 03:04:29 -0700
Received: from bgsmsx155.gar.corp.intel.com (10.224.48.102) by
 fmsmsx117.amr.corp.intel.com (10.18.116.17) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 8 Apr 2020 03:04:29 -0700
Received: from BGSMSX108.gar.corp.intel.com ([169.254.8.65]) by
 BGSMSX155.gar.corp.intel.com ([169.254.12.231]) with mapi id 14.03.0439.000;
 Wed, 8 Apr 2020 15:34:19 +0530
From: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH RESEND 6/7] drm/i915/bios: fill in DSC rc_model_size
 from VBT
Thread-Topic: [PATCH RESEND 6/7] drm/i915/bios: fill in DSC rc_model_size
 from VBT
Thread-Index: AQHWBDVFrB/wiUVEKEayh4J8Dzt8SahvD3pQ
Date: Wed, 8 Apr 2020 10:04:19 +0000
Message-ID: <57510F3E2013164E925CD03ED7512A3B80A88437@BGSMSX108.gar.corp.intel.com>
References: <20200327124229.26461-1-jani.nikula@intel.com>
 <20200327124229.26461-6-jani.nikula@intel.com>
In-Reply-To: <20200327124229.26461-6-jani.nikula@intel.com>
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
> Subject: [PATCH RESEND 6/7] drm/i915/bios: fill in DSC rc_model_size from
> VBT
> 
> The VBT fields match the DPCD data, so use the same helper.
> 
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_bios.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c
> b/drivers/gpu/drm/i915/display/intel_bios.c
> index 839124647202..a4ea0e6c3286 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -2494,16 +2494,11 @@ static void fill_dsc(struct intel_crtc_state
> *crtc_state,
>  			      crtc_state->dsc.slice_count);
> 
>  	/*
> -	 * FIXME: Use VBT rc_buffer_block_size and rc_buffer_size for the
> -	 * implementation specific physical rate buffer size. Currently we use
> -	 * the required rate buffer model size calculated in
> -	 * drm_dsc_compute_rc_parameters() according to VESA DSC Annex E.
> -	 *
>  	 * The VBT rc_buffer_block_size and rc_buffer_size definitions
> -	 * correspond to DP 1.4 DPCD offsets 0x62 and 0x63. The DP DSC
> -	 * implementation should also use the DPCD (or perhaps VBT for eDP)
> -	 * provided value for the buffer size.
> +	 * correspond to DP 1.4 DPCD offsets 0x62 and 0x63.
>  	 */
> +	vdsc_cfg->rc_model_size = drm_dsc_dp_rc_buffer_size(dsc-
> >rc_buffer_block_size,
> +							    dsc-
> >rc_buffer_size);
Do we need to handle the invalid case here?

Regards
Vandita

> 
>  	/* FIXME: DSI spec says bpc + 1 for this one */
>  	vdsc_cfg->line_buf_depth = VBT_DSC_LINE_BUFFER_DEPTH(dsc-
> >line_buffer_depth);
> --
> 2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
