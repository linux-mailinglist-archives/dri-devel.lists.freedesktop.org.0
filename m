Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC3A153585
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 17:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D786F8AE;
	Wed,  5 Feb 2020 16:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A4C6F8AB;
 Wed,  5 Feb 2020 16:46:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Feb 2020 08:46:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,406,1574150400"; d="scan'208";a="343750866"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga001.fm.intel.com with ESMTP; 05 Feb 2020 08:46:26 -0800
Received: from fmsmsx114.amr.corp.intel.com (10.18.116.8) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 5 Feb 2020 08:46:26 -0800
Received: from bgsmsx153.gar.corp.intel.com (10.224.23.4) by
 FMSMSX114.amr.corp.intel.com (10.18.116.8) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 5 Feb 2020 08:46:26 -0800
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.97]) by
 BGSMSX153.gar.corp.intel.com ([169.254.2.95]) with mapi id 14.03.0439.000;
 Wed, 5 Feb 2020 22:16:23 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v3 10/17] drm/i915: Include DP VSC SDP in the crtc state
 dump
Thread-Topic: [PATCH v3 10/17] drm/i915: Include DP VSC SDP in the crtc
 state dump
Thread-Index: AQHV2uiZ87r8iWDPwEGIMLbQoyFa1KgM0aNw
Date: Wed, 5 Feb 2020 16:46:22 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F823DD092@BGSMSX104.gar.corp.intel.com>
References: <20200203232014.906651-1-gwan-gyeong.mun@intel.com>
 <20200203232014.906651-11-gwan-gyeong.mun@intel.com>
In-Reply-To: <20200203232014.906651-11-gwan-gyeong.mun@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMTYwM2NlZmUtNzliZC00MmQxLWI3NzMtNWJmYmFmNWRjNzE1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiSEYzT1ZFdVRkS0tYT1ZHVnFKbEVjaFRnaGNrczJacTNPYk9RTWNCNFh3NGc1RFZZSWZYNmNSZE5SVWUzMlpHcCJ9
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Gwan-
> gyeong Mun
> Sent: Tuesday, February 4, 2020 4:50 AM
> To: intel-gfx@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org; dri-devel@lists.freedesktop.org
> Subject: [PATCH v3 10/17] drm/i915: Include DP VSC SDP in the crtc state dump
> 
> Dump out the DP VSC SDP in the normal crtc state dump
> 
> v3: Replace a structure name to drm_dp_vsc_sdp from intel_dp_vsc_sdp
>     Use drm core's DP VSC SDP logging function

Looks good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index 593c63f51210..4f187fd330e8 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -12878,6 +12878,16 @@ intel_dump_infoframe(struct drm_i915_private
> *dev_priv,
>  	hdmi_infoframe_log(KERN_DEBUG, dev_priv->drm.dev, frame);  }
> 
> +static void
> +intel_dump_dp_vsc_sdp(struct drm_i915_private *dev_priv,
> +		      const struct drm_dp_vsc_sdp *vsc) {
> +	if (!drm_debug_enabled(DRM_UT_KMS))
> +		return;
> +
> +	drm_dp_vsc_sdp_log(KERN_DEBUG, dev_priv->drm.dev, vsc); }
> +
>  #define OUTPUT_TYPE(x) [INTEL_OUTPUT_ ## x] = #x
> 
>  static const char * const output_type_str[] = { @@ -13036,6 +13046,9 @@ static
> void intel_dump_pipe_config(const struct intel_crtc_state *pipe_config,
>  	if (pipe_config->infoframes.enable &
>  	    intel_hdmi_infoframe_enable(HDMI_PACKET_TYPE_GAMUT_METADATA))
>  		intel_dump_infoframe(dev_priv, &pipe_config->infoframes.drm);
> +	if (pipe_config->infoframes.enable &
> +	    intel_hdmi_infoframe_enable(DP_SDP_VSC))
> +		intel_dump_dp_vsc_sdp(dev_priv, &pipe_config->infoframes.vsc);
> 
>  	drm_dbg_kms(&dev_priv->drm, "requested mode:\n");
>  	drm_mode_debug_printmodeline(&pipe_config->hw.mode);
> --
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
