Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F334153622
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 18:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D766F8BB;
	Wed,  5 Feb 2020 17:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E492C6F8BB;
 Wed,  5 Feb 2020 17:15:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Feb 2020 09:15:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,406,1574150400"; d="scan'208";a="264293099"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga002.fm.intel.com with ESMTP; 05 Feb 2020 09:15:57 -0800
Received: from fmsmsx123.amr.corp.intel.com (10.18.125.38) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 5 Feb 2020 09:15:57 -0800
Received: from bgsmsx152.gar.corp.intel.com (10.224.48.50) by
 fmsmsx123.amr.corp.intel.com (10.18.125.38) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 5 Feb 2020 09:15:56 -0800
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.97]) by
 BGSMSX152.gar.corp.intel.com ([169.254.6.38]) with mapi id 14.03.0439.000;
 Wed, 5 Feb 2020 22:45:10 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v3 17/17] drm/i915/psr: Use new DP VSC SDP
 compute routine on PSR
Thread-Topic: [Intel-gfx] [PATCH v3 17/17] drm/i915/psr: Use new DP VSC SDP
 compute routine on PSR
Thread-Index: AQHV2uigqCrIMs0v5EavxKZv/ekMVagM2XLw
Date: Wed, 5 Feb 2020 17:15:09 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F823DD190@BGSMSX104.gar.corp.intel.com>
References: <20200203232014.906651-1-gwan-gyeong.mun@intel.com>
 <20200203232014.906651-18-gwan-gyeong.mun@intel.com>
In-Reply-To: <20200203232014.906651-18-gwan-gyeong.mun@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMjliY2NlYTctYzI0MC00M2E4LThhYTgtNjNkNWI2MmRmNTUwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiRXp0TDN6MmprNEZUZllyRmJvV2hPblNFMkJtY1VKazF3TEZrSTBia1wvdEo1WThEbXNISUp3c3lnRXFCN2s2UG0ifQ==
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
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Gwan-
> gyeong Mun
> Sent: Tuesday, February 4, 2020 4:50 AM
> To: intel-gfx@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org; dri-devel@lists.freedesktop.org
> Subject: [Intel-gfx] [PATCH v3 17/17] drm/i915/psr: Use new DP VSC SDP compute
> routine on PSR
> 
> In order to use a common VSC SDP Colorimetry calculating code on PSR, it uses a
> new psr vsc sdp compute routine.
> Because PSR routine has its own scenario and timings of writing a VSC SDP, the
> current PSR routine needs to have its own drm_dp_vsc_sdp structure member
> variable on struct i915_psr.
> 
> In order to calculate colorimetry information, intel_psr_update() function and
> intel_psr_enable() function extend a drm_connector_state argument.
> 
> There are no changes to PSR mechanism.
> 
> v3: Replace a structure name to drm_dp_vsc_sdp from intel_dp_vsc_sdp

Looks good.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

Note: Please rebase, fix the comments and resend to trigger a full CI run.

> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c |  4 +-
> drivers/gpu/drm/i915/display/intel_psr.c | 54 +++++++-----------------
> drivers/gpu/drm/i915/display/intel_psr.h |  6 ++-
>  drivers/gpu/drm/i915/i915_drv.h          |  1 +
>  4 files changed, 22 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
> b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 8509cd33569e..00b46c45f6a8 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -3901,7 +3901,7 @@ static void intel_enable_ddi_dp(struct intel_encoder
> *encoder,
>  		intel_dp_stop_link_train(intel_dp);
> 
>  	intel_edp_backlight_on(crtc_state, conn_state);
> -	intel_psr_enable(intel_dp, crtc_state);
> +	intel_psr_enable(intel_dp, crtc_state, conn_state);
>  	intel_dp_set_infoframes(encoder, true, crtc_state, conn_state);
>  	intel_edp_drrs_enable(intel_dp, crtc_state);
> 
> @@ -4063,7 +4063,7 @@ static void intel_ddi_update_pipe_dp(struct intel_encoder
> *encoder,
> 
>  	intel_ddi_set_dp_msa(crtc_state, conn_state);
> 
> -	intel_psr_update(intel_dp, crtc_state);
> +	intel_psr_update(intel_dp, crtc_state, conn_state);
>  	intel_dp_set_infoframes(encoder, true, crtc_state, conn_state);
>  	intel_edp_drrs_enable(intel_dp, crtc_state);
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c
> b/drivers/gpu/drm/i915/display/intel_psr.c
> index e41ed962aa80..a4564607b6c5 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -330,39 +330,6 @@ void intel_psr_init_dpcd(struct intel_dp *intel_dp)
>  	}
>  }
> 
> -static void intel_psr_setup_vsc(struct intel_dp *intel_dp,
> -				const struct intel_crtc_state *crtc_state)
> -{
> -	struct intel_digital_port *intel_dig_port = dp_to_dig_port(intel_dp);
> -	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
> -	struct dp_sdp psr_vsc;
> -
> -	if (dev_priv->psr.psr2_enabled) {
> -		/* Prepare VSC Header for SU as per EDP 1.4 spec, Table 6.11 */
> -		memset(&psr_vsc, 0, sizeof(psr_vsc));
> -		psr_vsc.sdp_header.HB0 = 0;
> -		psr_vsc.sdp_header.HB1 = 0x7;
> -		if (dev_priv->psr.colorimetry_support) {
> -			psr_vsc.sdp_header.HB2 = 0x5;
> -			psr_vsc.sdp_header.HB3 = 0x13;
> -		} else {
> -			psr_vsc.sdp_header.HB2 = 0x4;
> -			psr_vsc.sdp_header.HB3 = 0xe;
> -		}
> -	} else {
> -		/* Prepare VSC packet as per EDP 1.3 spec, Table 3.10 */
> -		memset(&psr_vsc, 0, sizeof(psr_vsc));
> -		psr_vsc.sdp_header.HB0 = 0;
> -		psr_vsc.sdp_header.HB1 = 0x7;
> -		psr_vsc.sdp_header.HB2 = 0x2;
> -		psr_vsc.sdp_header.HB3 = 0x8;
> -	}
> -
> -	intel_dig_port->write_infoframe(&intel_dig_port->base,
> -					crtc_state,
> -					DP_SDP_VSC, &psr_vsc, sizeof(psr_vsc));
> -}
> -
>  static void hsw_psr_setup_aux(struct intel_dp *intel_dp)  {
>  	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp); @@ -841,9
> +808,12 @@ static void intel_psr_enable_source(struct intel_dp *intel_dp,  }
> 
>  static void intel_psr_enable_locked(struct drm_i915_private *dev_priv,
> -				    const struct intel_crtc_state *crtc_state)
> +				    const struct intel_crtc_state *crtc_state,
> +				    const struct drm_connector_state *conn_state)
>  {
>  	struct intel_dp *intel_dp = dev_priv->psr.dp;
> +	struct intel_digital_port *intel_dig_port = dp_to_dig_port(intel_dp);
> +	struct intel_encoder *encoder = &intel_dig_port->base;
>  	u32 val;
> 
>  	WARN_ON(dev_priv->psr.enabled);
> @@ -881,7 +851,9 @@ static void intel_psr_enable_locked(struct drm_i915_private
> *dev_priv,
> 
>  	DRM_DEBUG_KMS("Enabling PSR%s\n",
>  		      dev_priv->psr.psr2_enabled ? "2" : "1");
> -	intel_psr_setup_vsc(intel_dp, crtc_state);
> +	intel_dp_compute_psr_vsc_sdp(intel_dp, crtc_state, conn_state,
> +				     &dev_priv->psr.vsc);
> +	intel_write_dp_vsc_sdp(encoder, crtc_state, &dev_priv->psr.vsc);
>  	intel_psr_enable_sink(intel_dp);
>  	intel_psr_enable_source(intel_dp, crtc_state);
>  	dev_priv->psr.enabled = true;
> @@ -893,11 +865,13 @@ static void intel_psr_enable_locked(struct
> drm_i915_private *dev_priv,
>   * intel_psr_enable - Enable PSR
>   * @intel_dp: Intel DP
>   * @crtc_state: new CRTC state
> + * @conn_state: new CONNECTOR state
>   *
>   * This function can only be called after the pipe is fully trained and enabled.
>   */
>  void intel_psr_enable(struct intel_dp *intel_dp,
> -		      const struct intel_crtc_state *crtc_state)
> +		      const struct intel_crtc_state *crtc_state,
> +		      const struct drm_connector_state *conn_state)
>  {
>  	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
> 
> @@ -916,7 +890,7 @@ void intel_psr_enable(struct intel_dp *intel_dp,
>  		goto unlock;
>  	}
> 
> -	intel_psr_enable_locked(dev_priv, crtc_state);
> +	intel_psr_enable_locked(dev_priv, crtc_state, conn_state);
> 
>  unlock:
>  	mutex_unlock(&dev_priv->psr.lock);
> @@ -1049,13 +1023,15 @@ static void psr_force_hw_tracking_exit(struct
> drm_i915_private *dev_priv)
>   * intel_psr_update - Update PSR state
>   * @intel_dp: Intel DP
>   * @crtc_state: new CRTC state
> + * @conn_state: new CONNECTOR state
>   *
>   * This functions will update PSR states, disabling, enabling or switching PSR
>   * version when executing fastsets. For full modeset, intel_psr_disable() and
>   * intel_psr_enable() should be called instead.
>   */
>  void intel_psr_update(struct intel_dp *intel_dp,
> -		      const struct intel_crtc_state *crtc_state)
> +		      const struct intel_crtc_state *crtc_state,
> +		      const struct drm_connector_state *conn_state)
>  {
>  	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
>  	struct i915_psr *psr = &dev_priv->psr; @@ -1090,7 +1066,7 @@ void
> intel_psr_update(struct intel_dp *intel_dp,
>  		intel_psr_disable_locked(intel_dp);
> 
>  	if (enable)
> -		intel_psr_enable_locked(dev_priv, crtc_state);
> +		intel_psr_enable_locked(dev_priv, crtc_state, conn_state);
> 
>  unlock:
>  	mutex_unlock(&dev_priv->psr.lock);
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.h
> b/drivers/gpu/drm/i915/display/intel_psr.h
> index c58a1d438808..a003fb18105a 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.h
> +++ b/drivers/gpu/drm/i915/display/intel_psr.h
> @@ -17,11 +17,13 @@ struct intel_dp;
>  #define CAN_PSR(dev_priv) (HAS_PSR(dev_priv) && dev_priv->psr.sink_support)
> void intel_psr_init_dpcd(struct intel_dp *intel_dp);  void intel_psr_enable(struct
> intel_dp *intel_dp,
> -		      const struct intel_crtc_state *crtc_state);
> +		      const struct intel_crtc_state *crtc_state,
> +		      const struct drm_connector_state *conn_state);
>  void intel_psr_disable(struct intel_dp *intel_dp,
>  		       const struct intel_crtc_state *old_crtc_state);  void
> intel_psr_update(struct intel_dp *intel_dp,
> -		      const struct intel_crtc_state *crtc_state);
> +		      const struct intel_crtc_state *crtc_state,
> +		      const struct drm_connector_state *conn_state);
>  int intel_psr_debug_set(struct drm_i915_private *dev_priv, u64 value);  void
> intel_psr_invalidate(struct drm_i915_private *dev_priv,
>  			  unsigned frontbuffer_bits,
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index a8a08c63278e..fa2f1a18ffe0 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -504,6 +504,7 @@ struct i915_psr {
>  	u32 dc3co_exit_delay;
>  	struct delayed_work idle_work;
>  	bool initially_probed;
> +	struct drm_dp_vsc_sdp vsc;
>  };
> 
>  #define QUIRK_LVDS_SSC_DISABLE (1<<1)
> --
> 2.24.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
