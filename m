Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36941292046
	for <lists+dri-devel@lfdr.de>; Sun, 18 Oct 2020 23:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999826E8AD;
	Sun, 18 Oct 2020 21:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CFD6E8AD;
 Sun, 18 Oct 2020 21:41:26 +0000 (UTC)
IronPort-SDR: tzQsfKuTWeTil5omp8Ie9y9d4OICoxp/p3yPN/kYzRah0FgO53fHM9ePbJAX1GBTJ5PcrBZCn8
 27Z/vnTNyhag==
X-IronPort-AV: E=McAfee;i="6000,8403,9778"; a="251629890"
X-IronPort-AV: E=Sophos;i="5.77,392,1596524400"; d="scan'208";a="251629890"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2020 14:41:24 -0700
IronPort-SDR: pzIDHYWmRZxJWisyVv6PSCl/oGT7cp+3/j9yeU97slnkzhj/dOuL2rRs92YX40l/IqHwKRMeHf
 5a+avafTcONg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,392,1596524400"; d="scan'208";a="331719723"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 18 Oct 2020 14:41:24 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 18 Oct 2020 14:41:23 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX604.gar.corp.intel.com (10.67.234.6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 19 Oct 2020 03:11:21 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Mon, 19 Oct 2020 03:11:21 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [RFC 04/13] drm/i915: Capture max frl rate for PCON in dfp cap
 structure
Thread-Topic: [RFC 04/13] drm/i915: Capture max frl rate for PCON in dfp cap
 structure
Thread-Index: AQHWouJcgIX68uRI1UWxHSdq32y3YKmd56mg
Date: Sun, 18 Oct 2020 21:41:21 +0000
Message-ID: <0bc6df6f31934c4e99777e78a994808c@intel.com>
References: <20201015105259.27934-1-ankit.k.nautiyal@intel.com>
 <20201015105259.27934-5-ankit.k.nautiyal@intel.com>
In-Reply-To: <20201015105259.27934-5-ankit.k.nautiyal@intel.com>
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
> Subject: [RFC 04/13] drm/i915: Capture max frl rate for PCON in dfp cap structure
> 
> HDMI2.1 PCON advertises Max FRL bandwidth supported by the PCON and by the
> sink.
> 
> This patch captures these in dfp cap structure in intel_dp and uses these to
> prune connector modes that cannot be supported by the PCON and sink FRL
> bandwidth.
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  .../drm/i915/display/intel_display_types.h    |  1 +
>  drivers/gpu/drm/i915/display/intel_dp.c       | 33 +++++++++++++++++--
>  2 files changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 0b5df8e44966..e2f58d0575a2 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1398,6 +1398,7 @@ struct intel_dp {
>  	struct {
>  		int min_tmds_clock, max_tmds_clock;
>  		int max_dotclock;
> +		int pcon_max_frl, sink_max_frl;

Append it with bw or rate.

>  		u8 max_bpc;
>  		bool ycbcr_444_to_420;
>  	} dfp;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 0902a9aeeda1..cd6934f28f32 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -683,6 +683,24 @@ intel_dp_mode_valid_downstream(struct
> intel_connector *connector,
>  	const struct drm_display_info *info = &connector->base.display_info;
>  	int tmds_clock;
> 
> +	/* If PCON and HDMI2.1 sink both support FRL MODE, check FRL

Use multi line comment style.

> +	 * bandwidth constraints.
> +	 */
> +	if (intel_dp->dfp.pcon_max_frl) {
> +		int target_bw;
> +		int max_frl_bw;
> +		int bpp = intel_dp_mode_min_output_bpp(&connector->base,
> mode);
> +
> +		target_bw = bpp * DIV_ROUND_UP(target_clock, 1000000);

To avoid any roundup errors, it would be good to multiple max_frl_bw by 1000000 than dividing target_clock

> +
> +		max_frl_bw = min(intel_dp->dfp.pcon_max_frl,
> +				 intel_dp->dfp.sink_max_frl);
> +		if (target_bw > max_frl_bw)
> +			return MODE_CLOCK_HIGH;
> +
> +		return MODE_OK;
> +	}
> +
>  	if (intel_dp->dfp.max_dotclock &&
>  	    target_clock > intel_dp->dfp.max_dotclock)
>  		return MODE_CLOCK_HIGH;
> @@ -6383,13 +6401,21 @@ intel_dp_update_dfp(struct intel_dp *intel_dp,
>  						 intel_dp->downstream_ports,
>  						 edid);
> 
> +	intel_dp->dfp.pcon_max_frl =
> +		drm_dp_get_pcon_max_frl_bw(intel_dp->dpcd,
> +					   intel_dp->downstream_ports);
> +
> +	intel_dp->dfp.sink_max_frl =
> +drm_dp_get_hdmi_max_frl_bw(&intel_dp->aux);
> +
>  	drm_dbg_kms(&i915->drm,
> -		    "[CONNECTOR:%d:%s] DFP max bpc %d, max dotclock %d,
> TMDS clock %d-%d\n",
> +		    "[CONNECTOR:%d:%s] DFP max bpc %d, max dotclock %d,
> TMDS clock
> +%d-%d, PCON Max FRL BW %dGbps, Sink Max FRL BW %dGbps\n",
>  		    connector->base.base.id, connector->base.name,
>  		    intel_dp->dfp.max_bpc,
>  		    intel_dp->dfp.max_dotclock,
>  		    intel_dp->dfp.min_tmds_clock,
> -		    intel_dp->dfp.max_tmds_clock);
> +		    intel_dp->dfp.max_tmds_clock,
> +		    intel_dp->dfp.pcon_max_frl,
> +		    intel_dp->dfp.sink_max_frl);
>  }
> 
>  static void
> @@ -6479,6 +6505,9 @@ intel_dp_unset_edid(struct intel_dp *intel_dp)
>  	intel_dp->dfp.min_tmds_clock = 0;
>  	intel_dp->dfp.max_tmds_clock = 0;
> 
> +	intel_dp->dfp.pcon_max_frl = 0;
> +	intel_dp->dfp.sink_max_frl = 0;
> +
>  	intel_dp->dfp.ycbcr_444_to_420 = false;
>  	connector->base.ycbcr_420_allowed = false;  }
> --
> 2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
