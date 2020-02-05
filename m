Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BAB1535CC
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 18:01:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC6D6F8B8;
	Wed,  5 Feb 2020 17:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BA06F8BB;
 Wed,  5 Feb 2020 17:01:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Feb 2020 09:01:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,406,1574150400"; d="scan'208";a="225013406"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by fmsmga007.fm.intel.com with ESMTP; 05 Feb 2020 09:01:36 -0800
Received: from bgsmsx103.gar.corp.intel.com (10.223.4.130) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 5 Feb 2020 09:01:36 -0800
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.97]) by
 BGSMSX103.gar.corp.intel.com ([169.254.4.133]) with mapi id 14.03.0439.000;
 Wed, 5 Feb 2020 22:30:43 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v3 13/17] drm/i915: Add state readout for DP VSC SDP
Thread-Topic: [PATCH v3 13/17] drm/i915: Add state readout for DP VSC SDP
Thread-Index: AQHV2uibTOIR+APsBU6IMtHUw6VrfagM1aQQ
Date: Wed, 5 Feb 2020 17:00:42 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F823DD0F4@BGSMSX104.gar.corp.intel.com>
References: <20200203232014.906651-1-gwan-gyeong.mun@intel.com>
 <20200203232014.906651-14-gwan-gyeong.mun@intel.com>
In-Reply-To: <20200203232014.906651-14-gwan-gyeong.mun@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYWEyYmM2OTUtYzEyYy00YmE3LTg4ZWEtNzRhNzJhMWZiYjkzIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoicDhnd0ZCRXpmSERNUFBIWEdOeVNuRE8wXC9PMHlDdk96aloyMENjTHJSXC9uYXI3VTJKWVllNWN5SmR0TkIwcEt4In0=
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
> Subject: [PATCH v3 13/17] drm/i915: Add state readout for DP VSC SDP
> 
> Added state readout for DP VSC SDP and enabled state validation for DP VSC SDP.
> 
> v2: Minor style fix
> v3: Replace a structure name to drm_dp_vsc_sdp from intel_dp_vsc_sdp

Looks good.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c     |  1 +
>  drivers/gpu/drm/i915/display/intel_display.c | 42 ++++++++++++++++++++
>  2 files changed, 43 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
> b/drivers/gpu/drm/i915/display/intel_ddi.c
> index a9eaf7a6bc15..64e4edefa998 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -4391,6 +4391,7 @@ void intel_ddi_get_config(struct intel_encoder *encoder,
>  			     &pipe_config->infoframes.drm);
> 
>  	intel_read_dp_sdp(encoder, pipe_config,
> HDMI_PACKET_TYPE_GAMUT_METADATA);
> +	intel_read_dp_sdp(encoder, pipe_config, DP_SDP_VSC);
>  }
> 
>  static enum intel_output_type
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index 4f187fd330e8..02471c7aa6e7 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -13503,6 +13503,13 @@ intel_compare_infoframe(const union
> hdmi_infoframe *a,
>  	return memcmp(a, b, sizeof(*a)) == 0;
>  }
> 
> +static bool
> +intel_compare_dp_vsc_sdp(const struct drm_dp_vsc_sdp *a,
> +			 const struct drm_dp_vsc_sdp *b)
> +{
> +	return memcmp(a, b, sizeof(*a)) == 0;
> +}
> +
>  static void
>  pipe_config_infoframe_mismatch(struct drm_i915_private *dev_priv,
>  			       bool fastset, const char *name, @@ -13528,6
> +13535,30 @@ pipe_config_infoframe_mismatch(struct drm_i915_private
> *dev_priv,
>  	}
>  }
> 
> +static void
> +pipe_config_dp_vsc_sdp_mismatch(struct drm_i915_private *dev_priv,
> +				bool fastset, const char *name,
> +				const struct drm_dp_vsc_sdp *a,
> +				const struct drm_dp_vsc_sdp *b)
> +{
> +	if (fastset) {
> +		if (!drm_debug_enabled(DRM_UT_KMS))
> +			return;
> +
> +		DRM_DEBUG_KMS("fastset mismatch in %s dp sdp\n", name);
> +		DRM_DEBUG_KMS("expected:\n");
> +		drm_dp_vsc_sdp_log(KERN_DEBUG, dev_priv->drm.dev, a);
> +		DRM_DEBUG_KMS("found:\n");
> +		drm_dp_vsc_sdp_log(KERN_DEBUG, dev_priv->drm.dev, b);
> +	} else {
> +		DRM_ERROR("mismatch in %s dp sdp\n", name);
> +		DRM_ERROR("expected:\n");
> +		drm_dp_vsc_sdp_log(KERN_ERR, dev_priv->drm.dev, a);
> +		DRM_ERROR("found:\n");
> +		drm_dp_vsc_sdp_log(KERN_ERR, dev_priv->drm.dev, b);
> +	}
> +}
> +
>  static void __printf(4, 5)
>  pipe_config_mismatch(bool fastset, const struct intel_crtc *crtc,
>  		     const char *name, const char *format, ...) @@ -13729,6
> +13760,16 @@ intel_pipe_config_compare(const struct intel_crtc_state
> *current_config,
>  	} \
>  } while (0)
> 
> +#define PIPE_CONF_CHECK_DP_VSC_SDP(name) do { \
> +	if (!intel_compare_dp_vsc_sdp(&current_config->infoframes.name, \
> +				      &pipe_config->infoframes.name)) { \
> +		pipe_config_dp_vsc_sdp_mismatch(dev_priv, fastset,
> __stringify(name), \
> +						&current_config-
> >infoframes.name, \
> +						&pipe_config->infoframes.name);
> \
> +		ret = false; \
> +	} \
> +} while (0)
> +
>  #define PIPE_CONF_CHECK_COLOR_LUT(name1, name2, bit_precision) do { \
>  	if (current_config->name1 != pipe_config->name1) { \
>  		pipe_config_mismatch(fastset, crtc, __stringify(name1), \ @@ -
> 13902,6 +13943,7 @@ intel_pipe_config_compare(const struct intel_crtc_state
> *current_config,
>  	PIPE_CONF_CHECK_INFOFRAME(spd);
>  	PIPE_CONF_CHECK_INFOFRAME(hdmi);
>  	PIPE_CONF_CHECK_INFOFRAME(drm);
> +	PIPE_CONF_CHECK_DP_VSC_SDP(vsc);
> 
>  	PIPE_CONF_CHECK_X(sync_mode_slaves_mask);
>  	PIPE_CONF_CHECK_I(master_transcoder);
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
