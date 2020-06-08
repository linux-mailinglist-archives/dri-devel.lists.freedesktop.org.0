Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F01201F1385
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 09:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9329C6E499;
	Mon,  8 Jun 2020 07:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D866E45E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 03:55:27 +0000 (UTC)
Received: from mail-pg1-f199.google.com ([209.85.215.199])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1ji8sf-0001t4-8V
 for dri-devel@lists.freedesktop.org; Mon, 08 Jun 2020 03:55:25 +0000
Received: by mail-pg1-f199.google.com with SMTP id n22so12206956pgd.18
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 20:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=7IsQQDNqNk8jbd69XeCiJYQDmicjZa7G75BfngTEUpU=;
 b=A8rlfWFZW83OGFZzzW05Ivt5qzLfh1FNNtVksMTNEHmHqKkBKggBgQdgFEwGC6NEkO
 qKnTCr07kGKMt8MUNEQRhUaJeS03VmbA394Iuw12rxq+aBrMT3mHT4XNqth6oxEBCTvV
 yRq/huDlzwjLewZ70ciDanikSB2j3EyjpAIdRA7DZ2Qhd+DnB/J8G8JFlWyRVo57C4uH
 Hd1r3rA6GBYZ6HUXb1mvWKXCjUE1eDSR5Ph9AEOJYZzO0SUMrJca94DmQBHyGJZZt+9R
 t3NPw7vasvHqKtBMpyzIyahUSVbMM6gu4wXqYDElcyqyFmcFflFepuMWv4DlL28Bfbov
 m3Uw==
X-Gm-Message-State: AOAM533SFUCgFKbOgaPqv1t7Bm01Lb3OWHC4vWVzQ7w8HxTC01eMPAoe
 WCWgZLjrKfVm1Q+9w5kfxdkmN8n8LU6XOJgPD/akU5DVa7JDW2a+LcScfHls0h+5RYRRhWupr6B
 mZy0HF/qd5zYk2vR0Em/7HBerIfiCGi6Ma3/mXpblQmRaTg==
X-Received: by 2002:a17:902:8c81:: with SMTP id
 t1mr10806273plo.44.1591588523801; 
 Sun, 07 Jun 2020 20:55:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzalpjVrXpBnflK9WLGZd2Chuen1YtH6R7Xt+CXDmcLlwPK29tMSNzBUyHaxeznmV/LN5Y4Tg==
X-Received: by 2002:a17:902:8c81:: with SMTP id
 t1mr10806250plo.44.1591588523372; 
 Sun, 07 Jun 2020 20:55:23 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id q16sm5578574pfg.49.2020.06.07.20.55.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Jun 2020 20:55:22 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v5] drm/i915: Init lspcon chip dynamically
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20200506102844.26596-1-kai.heng.feng@canonical.com>
Date: Mon, 8 Jun 2020 11:55:18 +0800
Message-Id: <D0EE4D52-3859-4D48-8AC4-6AF724EBDC93@canonical.com>
References: <20200506102844.26596-1-kai.heng.feng@canonical.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Mailman-Approved-At: Mon, 08 Jun 2020 07:21:26 +0000
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
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 David Airlie <airlied@linux.ie>, Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 =?utf-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Manasi Navare <manasi.d.navare@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> On May 6, 2020, at 18:28, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
> 
> On HP 800 G4 DM, if HDMI cable isn't plugged before boot, the HDMI port
> becomes useless and never responds to cable hotplugging:
> [    3.031904] [drm:lspcon_init [i915]] *ERROR* Failed to probe lspcon
> [    3.031945] [drm:intel_ddi_init [i915]] *ERROR* LSPCON init failed on port D
> 
> Seems like the lspcon chip on the system only gets powered after the
> cable is plugged.
> 
> Consolidate lspcon_init() into lspcon_resume() to dynamically init
> lspcon chip, and make HDMI port work.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/issues/203
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

A gentle ping...

> ---
> v5:
> - Consolidate lspcon_resume() with lspcon_init().
> - Move more logic into lspcon code.
> 
> v4:
> - Trust VBT in intel_infoframe_init().
> - Init lspcon in intel_dp_detect().
> 
> v3:
> - Make sure it's handled under long HPD case.
> 
> v2: 
> - Move lspcon_init() inside of intel_dp_hpd_pulse().
> 
> drivers/gpu/drm/i915/display/intel_ddi.c    | 19 +------
> drivers/gpu/drm/i915/display/intel_dp.c     | 10 ++--
> drivers/gpu/drm/i915/display/intel_hdmi.c   |  3 +-
> drivers/gpu/drm/i915/display/intel_lspcon.c | 63 ++++++++++++---------
> drivers/gpu/drm/i915/display/intel_lspcon.h |  3 +-
> 5 files changed, 43 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 5601673c3f30..798fd640da54 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -4770,7 +4770,7 @@ void intel_ddi_init(struct drm_i915_private *dev_priv, enum port port)
> {
> 	struct intel_digital_port *intel_dig_port;
> 	struct intel_encoder *encoder;
> -	bool init_hdmi, init_dp, init_lspcon = false;
> +	bool init_hdmi, init_dp;
> 	enum phy phy = intel_port_to_phy(dev_priv, port);
> 
> 	init_hdmi = intel_bios_port_supports_dvi(dev_priv, port) ||
> @@ -4784,7 +4784,6 @@ void intel_ddi_init(struct drm_i915_private *dev_priv, enum port port)
> 		 * is initialized before lspcon.
> 		 */
> 		init_dp = true;
> -		init_lspcon = true;
> 		init_hdmi = false;
> 		drm_dbg_kms(&dev_priv->drm, "VBT says port %c has lspcon\n",
> 			    port_name(port));
> @@ -4869,22 +4868,6 @@ void intel_ddi_init(struct drm_i915_private *dev_priv, enum port port)
> 			goto err;
> 	}
> 
> -	if (init_lspcon) {
> -		if (lspcon_init(intel_dig_port))
> -			/* TODO: handle hdmi info frame part */
> -			drm_dbg_kms(&dev_priv->drm,
> -				    "LSPCON init success on port %c\n",
> -				    port_name(port));
> -		else
> -			/*
> -			 * LSPCON init faied, but DP init was success, so
> -			 * lets try to drive as DP++ port.
> -			 */
> -			drm_err(&dev_priv->drm,
> -				"LSPCON init failed on port %c\n",
> -				port_name(port));
> -	}
> -
> 	intel_infoframe_init(intel_dig_port);
> 
> 	return;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 6952b0295096..e26aa35d6e37 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -5938,15 +5938,14 @@ static enum drm_connector_status
> intel_dp_detect_dpcd(struct intel_dp *intel_dp)
> {
> 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> -	struct intel_lspcon *lspcon = dp_to_lspcon(intel_dp);
> +	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
> 	u8 *dpcd = intel_dp->dpcd;
> 	u8 type;
> 
> 	if (WARN_ON(intel_dp_is_edp(intel_dp)))
> 		return connector_status_connected;
> 
> -	if (lspcon->active)
> -		lspcon_resume(lspcon);
> +	lspcon_resume(dig_port);
> 
> 	if (!intel_dp_get_dpcd(intel_dp))
> 		return connector_status_disconnected;
> @@ -7198,14 +7197,13 @@ void intel_dp_encoder_reset(struct drm_encoder *encoder)
> {
> 	struct drm_i915_private *dev_priv = to_i915(encoder->dev);
> 	struct intel_dp *intel_dp = enc_to_intel_dp(to_intel_encoder(encoder));
> -	struct intel_lspcon *lspcon = dp_to_lspcon(intel_dp);
> +	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
> 	intel_wakeref_t wakeref;
> 
> 	if (!HAS_DDI(dev_priv))
> 		intel_dp->DP = intel_de_read(dev_priv, intel_dp->output_reg);
> 
> -	if (lspcon->active)
> -		lspcon_resume(lspcon);
> +	lspcon_resume(dig_port);
> 
> 	intel_dp->reset_link_params = true;
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 010f37240710..643ad2127931 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -3155,7 +3155,8 @@ void intel_infoframe_init(struct intel_digital_port *intel_dig_port)
> 		intel_dig_port->set_infoframes = g4x_set_infoframes;
> 		intel_dig_port->infoframes_enabled = g4x_infoframes_enabled;
> 	} else if (HAS_DDI(dev_priv)) {
> -		if (intel_dig_port->lspcon.active) {
> +		if (intel_bios_is_lspcon_present(dev_priv,
> +						 intel_dig_port->base.port)) {
> 			intel_dig_port->write_infoframe = lspcon_write_infoframe;
> 			intel_dig_port->read_infoframe = lspcon_read_infoframe;
> 			intel_dig_port->set_infoframes = lspcon_set_infoframes;
> diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
> index d807c5648c87..f5f06d2a839a 100644
> --- a/drivers/gpu/drm/i915/display/intel_lspcon.c
> +++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
> @@ -525,44 +525,17 @@ u32 lspcon_infoframes_enabled(struct intel_encoder *encoder,
> 	return enc_to_intel_lspcon(encoder)->active;
> }
> 
> -void lspcon_resume(struct intel_lspcon *lspcon)
> -{
> -	enum drm_lspcon_mode expected_mode;
> -
> -	if (lspcon_wake_native_aux_ch(lspcon)) {
> -		expected_mode = DRM_LSPCON_MODE_PCON;
> -		lspcon_resume_in_pcon_wa(lspcon);
> -	} else {
> -		expected_mode = DRM_LSPCON_MODE_LS;
> -	}
> -
> -	if (lspcon_wait_mode(lspcon, expected_mode) == DRM_LSPCON_MODE_PCON)
> -		return;
> -
> -	if (lspcon_change_mode(lspcon, DRM_LSPCON_MODE_PCON))
> -		DRM_ERROR("LSPCON resume failed\n");
> -	else
> -		DRM_DEBUG_KMS("LSPCON resume success\n");
> -}
> -
> void lspcon_wait_pcon_mode(struct intel_lspcon *lspcon)
> {
> 	lspcon_wait_mode(lspcon, DRM_LSPCON_MODE_PCON);
> }
> 
> -bool lspcon_init(struct intel_digital_port *intel_dig_port)
> +static bool lspcon_init(struct intel_digital_port *intel_dig_port)
> {
> 	struct intel_dp *dp = &intel_dig_port->dp;
> 	struct intel_lspcon *lspcon = &intel_dig_port->lspcon;
> -	struct drm_device *dev = intel_dig_port->base.base.dev;
> -	struct drm_i915_private *dev_priv = to_i915(dev);
> 	struct drm_connector *connector = &dp->attached_connector->base;
> 
> -	if (!HAS_LSPCON(dev_priv)) {
> -		DRM_ERROR("LSPCON is not supported on this platform\n");
> -		return false;
> -	}
> -
> 	lspcon->active = false;
> 	lspcon->mode = DRM_LSPCON_MODE_INVALID;
> 
> @@ -586,3 +559,37 @@ bool lspcon_init(struct intel_digital_port *intel_dig_port)
> 	DRM_DEBUG_KMS("Success: LSPCON init\n");
> 	return true;
> }
> +
> +void lspcon_resume(struct intel_digital_port *intel_dig_port)
> +{
> +	struct intel_lspcon *lspcon = &intel_dig_port->lspcon;
> +	struct drm_device *dev = intel_dig_port->base.base.dev;
> +	struct drm_i915_private *dev_priv = to_i915(dev);
> +	enum drm_lspcon_mode expected_mode;
> +
> +	if (!intel_bios_is_lspcon_present(dev_priv, intel_dig_port->base.port))
> +		return;
> +
> +	if (!lspcon->active) {
> +		if (!lspcon_init(intel_dig_port)) {
> +			DRM_ERROR("LSPCON init failed on port %c\n",
> +				  port_name(intel_dig_port->base.port));
> +			return;
> +		}
> +	}
> +
> +	if (lspcon_wake_native_aux_ch(lspcon)) {
> +		expected_mode = DRM_LSPCON_MODE_PCON;
> +		lspcon_resume_in_pcon_wa(lspcon);
> +	} else {
> +		expected_mode = DRM_LSPCON_MODE_LS;
> +	}
> +
> +	if (lspcon_wait_mode(lspcon, expected_mode) == DRM_LSPCON_MODE_PCON)
> +		return;
> +
> +	if (lspcon_change_mode(lspcon, DRM_LSPCON_MODE_PCON))
> +		DRM_ERROR("LSPCON resume failed\n");
> +	else
> +		DRM_DEBUG_KMS("LSPCON resume success\n");
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.h b/drivers/gpu/drm/i915/display/intel_lspcon.h
> index 37cfddf8a9c5..169db35db13e 100644
> --- a/drivers/gpu/drm/i915/display/intel_lspcon.h
> +++ b/drivers/gpu/drm/i915/display/intel_lspcon.h
> @@ -15,8 +15,7 @@ struct intel_digital_port;
> struct intel_encoder;
> struct intel_lspcon;
> 
> -bool lspcon_init(struct intel_digital_port *intel_dig_port);
> -void lspcon_resume(struct intel_lspcon *lspcon);
> +void lspcon_resume(struct intel_digital_port *intel_dig_port);
> void lspcon_wait_pcon_mode(struct intel_lspcon *lspcon);
> void lspcon_write_infoframe(struct intel_encoder *encoder,
> 			    const struct intel_crtc_state *crtc_state,
> -- 
> 2.17.1
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
