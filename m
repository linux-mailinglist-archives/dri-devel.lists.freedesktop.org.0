Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D126457D3C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0251E6E80E;
	Thu, 27 Jun 2019 07:37:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD686E80E;
 Thu, 27 Jun 2019 07:37:19 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v24so1242076ljg.13;
 Thu, 27 Jun 2019 00:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=ta9lx4j2CHwC8blzfzRXSAFeYrAOMeqcSfzgQ4Mt+oM=;
 b=EdfvCYlHGNNVEcez74+4LV3gNbzwyrzXMxkHcgsc8+ogkp2o5F7w399lMdSaSLyonc
 kqBjNpwGNWr6lUDqSxTAYfMlp3tygtPEUcmqewSZmteWXI2rkGrpt2RFHEyvLtxzZ1ei
 opaLmzuy3tROy/2n0Lck4i+Wzb8e67kgIa7FkXivwdMOydHr2d6wxq3f1ws9OiEdfwcB
 hR8sZtwC2u3rcU61kaDOT0xUF7m3N9ODDrfXgU+LP2+7yfRMD5BtbbzL2WUhkVtSZMIb
 r629PcQlTSQPsxrdKtHQeLZCoMhqqH42Gji6CAdKk4C3xk5pZENDMcFqHZVhmNRDnSi4
 e7iw==
X-Gm-Message-State: APjAAAWQ77vliwHxb8iqAmXOvSYqCD3EZFTpqhF4ta9G7LhBcM22QxXU
 cSA3GTfG9hreCkjA2DWZ4So=
X-Google-Smtp-Source: APXvYqwwdSfyBqAiLkG3kfwC3/CaLo94kSilZSf/u8OC9nPYOCpRCTgcxXK5HPsNBsfRS22xLLd0ow==
X-Received: by 2002:a2e:8155:: with SMTP id t21mr1661795ljg.80.1561621038011; 
 Thu, 27 Jun 2019 00:37:18 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id y25sm249185lja.45.2019.06.27.00.37.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 00:37:17 -0700 (PDT)
Date: Thu, 27 Jun 2019 10:37:14 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [RFC][PATCH 2/2] drm/i915: Populate PATH prop for every connector
Message-ID: <20190627103714.3d74f49b@eldfell.localdomain>
In-Reply-To: <20190613184335.7970-3-ville.syrjala@linux.intel.com>
References: <20190613184335.7970-1-ville.syrjala@linux.intel.com>
 <20190613184335.7970-3-ville.syrjala@linux.intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=ta9lx4j2CHwC8blzfzRXSAFeYrAOMeqcSfzgQ4Mt+oM=;
 b=Ik2CYsDhLpizLtHDqLK6PETswjwbinMwhzqrKPbMKOyYYOlx493yIv2UekbsS681rm
 PFybIRkPB9Q2RsuG+QUA2xWcmUlt3byqhHc3QbgMAJh0H8pzX+qGS1LDxozpZOsrwLrp
 uSGAcBT7weMQjhAr7XkmBvWjIylLsWNuoYIyG0HGJ662PK8SvmlGP8OPfcQaW+bTpekz
 w00BImiaF6Ter68cQ8YEVYRDyFLNtp8pITAHhn26ChBOgNfKvlhUdBZs8qd7RExHcGAH
 nhoYsd8CaXvfKFd14agy3rWgVvRGOOCBemf9VHsBC92N5Y+G30XDvgu4HFRBAlN1q7nt
 x1Dg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1516628457=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1516628457==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/CjyTL70MVQNhdehZa0.yeWo"; protocol="application/pgp-signature"

--Sig_/CjyTL70MVQNhdehZa0.yeWo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Jun 2019 21:43:35 +0300
Ville Syrjala <ville.syrjala@linux.intel.com> wrote:

> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> Userspace may want stable identifiers for connectors. Let's try to
> provide that via the PATH prop. I tried to make these somewhat abstract
> by using just "port_type:index" type of approach, where we derive the
> index from the physical instance of that hw block, so it should remain
> stable even if we reorder things in the driver.
>=20
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Ilia Mirkin <imirkin@alum.mit.edu>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Hi,

I don't know intel driver nor hardware, but the described idea and the
names in the code look good to me.

The only open question is if it should be the existing PATH property or
a new property in case PATH for MST is not persistent.


Thanks,
pq

> ---
>  drivers/gpu/drm/i915/icl_dsi.c         |  3 +++
>  drivers/gpu/drm/i915/intel_connector.c | 20 +++++++++++++++
>  drivers/gpu/drm/i915/intel_connector.h |  3 +++
>  drivers/gpu/drm/i915/intel_crt.c       |  2 ++
>  drivers/gpu/drm/i915/intel_dp.c        |  6 ++++-
>  drivers/gpu/drm/i915/intel_dp_mst.c    |  3 +--
>  drivers/gpu/drm/i915/intel_dvo.c       |  3 +++
>  drivers/gpu/drm/i915/intel_hdmi.c      |  4 +++
>  drivers/gpu/drm/i915/intel_lvds.c      |  2 ++
>  drivers/gpu/drm/i915/intel_sdvo.c      | 35 ++++++++++++++++++--------
>  drivers/gpu/drm/i915/intel_tv.c        |  2 ++
>  drivers/gpu/drm/i915/vlv_dsi.c         |  3 +++
>  12 files changed, 72 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/icl_dsi.c b/drivers/gpu/drm/i915/icl_ds=
i.c
> index 74448e6bf749..54ccc69aa60a 100644
> --- a/drivers/gpu/drm/i915/icl_dsi.c
> +++ b/drivers/gpu/drm/i915/icl_dsi.c
> @@ -1544,6 +1544,9 @@ void icl_dsi_init(struct drm_i915_private *dev_priv)
>  	/* attach connector to encoder */
>  	intel_connector_attach_encoder(intel_connector, encoder);
> =20
> +	intel_connector_set_path_property(connector, "dsi:%d",
> +					  port - PORT_A);
> +
>  	mutex_lock(&dev->mode_config.mutex);
>  	fixed_mode =3D intel_panel_vbt_fixed_mode(intel_connector);
>  	mutex_unlock(&dev->mode_config.mutex);
> diff --git a/drivers/gpu/drm/i915/intel_connector.c b/drivers/gpu/drm/i91=
5/intel_connector.c
> index 073b6c3ab7cc..6c1b027fdb11 100644
> --- a/drivers/gpu/drm/i915/intel_connector.c
> +++ b/drivers/gpu/drm/i915/intel_connector.c
> @@ -280,3 +280,23 @@ intel_attach_colorspace_property(struct drm_connecto=
r *connector)
>  		drm_object_attach_property(&connector->base,
>  					   connector->colorspace_property, 0);
>  }
> +
> +int intel_connector_set_path_property(struct drm_connector *connector,
> +				      const char *fmt, ...)
> +{
> +	char path[64];
> +	va_list ap;
> +	int ret;
> +
> +	va_start(ap, fmt);
> +	ret =3D vsnprintf(path, sizeof(path), fmt, ap);
> +	va_end(ap);
> +
> +	if (WARN_ON(ret >=3D sizeof(path)))
> +		return -EINVAL;
> +
> +	drm_object_attach_property(&connector->base,
> +				   connector->dev->mode_config.path_property, 0);
> +
> +	return drm_connector_set_path_property(connector, path);
> +}
> diff --git a/drivers/gpu/drm/i915/intel_connector.h b/drivers/gpu/drm/i91=
5/intel_connector.h
> index 93a7375c8196..108777bc9545 100644
> --- a/drivers/gpu/drm/i915/intel_connector.h
> +++ b/drivers/gpu/drm/i915/intel_connector.h
> @@ -31,5 +31,8 @@ void intel_attach_force_audio_property(struct drm_conne=
ctor *connector);
>  void intel_attach_broadcast_rgb_property(struct drm_connector *connector=
);
>  void intel_attach_aspect_ratio_property(struct drm_connector *connector);
>  void intel_attach_colorspace_property(struct drm_connector *connector);
> +__printf(2, 3)
> +int intel_connector_set_path_property(struct drm_connector *connector,
> +				      const char *fmt, ...);
> =20
>  #endif /* __INTEL_CONNECTOR_H__ */
> diff --git a/drivers/gpu/drm/i915/intel_crt.c b/drivers/gpu/drm/i915/inte=
l_crt.c
> index 3fcf2f84bcce..1383db646986 100644
> --- a/drivers/gpu/drm/i915/intel_crt.c
> +++ b/drivers/gpu/drm/i915/intel_crt.c
> @@ -1048,6 +1048,8 @@ void intel_crt_init(struct drm_i915_private *dev_pr=
iv)
>  	if (!I915_HAS_HOTPLUG(dev_priv))
>  		intel_connector->polled =3D DRM_CONNECTOR_POLL_CONNECT;
> =20
> +	intel_connector_set_path_property(connector, "crt:0");
> +
>  	/*
>  	 * Configure the automatic hotplug detection stuff
>  	 */
> diff --git a/drivers/gpu/drm/i915/intel_dp.c b/drivers/gpu/drm/i915/intel=
_dp.c
> index 4336df46fe78..c9071d25bd37 100644
> --- a/drivers/gpu/drm/i915/intel_dp.c
> +++ b/drivers/gpu/drm/i915/intel_dp.c
> @@ -6527,7 +6527,11 @@ static void
>  intel_dp_add_properties(struct intel_dp *intel_dp, struct drm_connector =
*connector)
>  {
>  	struct drm_i915_private *dev_priv =3D to_i915(connector->dev);
> -	enum port port =3D dp_to_dig_port(intel_dp)->base.port;
> +	struct intel_encoder *encoder =3D &dp_to_dig_port(intel_dp)->base;
> +	enum port port =3D encoder->port;
> +
> +	intel_connector_set_path_property(connector, "ddi:%d\n",
> +					  port - PORT_A);
> =20
>  	if (!IS_G4X(dev_priv) && port !=3D PORT_A)
>  		intel_attach_force_audio_property(connector);
> diff --git a/drivers/gpu/drm/i915/intel_dp_mst.c b/drivers/gpu/drm/i915/i=
ntel_dp_mst.c
> index 0caf645fbbb8..3bc0de2ff5af 100644
> --- a/drivers/gpu/drm/i915/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/intel_dp_mst.c
> @@ -529,10 +529,9 @@ static struct drm_connector *intel_dp_add_mst_connec=
tor(struct drm_dp_mst_topolo
>  			goto err;
>  	}
> =20
> -	drm_object_attach_property(&connector->base, dev->mode_config.path_prop=
erty, 0);
>  	drm_object_attach_property(&connector->base, dev->mode_config.tile_prop=
erty, 0);
> =20
> -	ret =3D drm_connector_set_path_property(connector, pathprop);
> +	ret =3D intel_connector_set_path_property(connector, "%s", pathprop);
>  	if (ret)
>  		goto err;
> =20
> diff --git a/drivers/gpu/drm/i915/intel_dvo.c b/drivers/gpu/drm/i915/inte=
l_dvo.c
> index 22666d28f4aa..4e7ea0f4c5d5 100644
> --- a/drivers/gpu/drm/i915/intel_dvo.c
> +++ b/drivers/gpu/drm/i915/intel_dvo.c
> @@ -531,6 +531,9 @@ void intel_dvo_init(struct drm_i915_private *dev_priv)
>  		connector->interlace_allowed =3D false;
>  		connector->doublescan_allowed =3D false;
> =20
> +		intel_connector_set_path_property(connector, "dvo:%d",
> +						  port - PORT_A);
> +
>  		intel_connector_attach_encoder(intel_connector, intel_encoder);
>  		if (dvo->type =3D=3D INTEL_DVO_CHIP_LVDS) {
>  			/*
> diff --git a/drivers/gpu/drm/i915/intel_hdmi.c b/drivers/gpu/drm/i915/int=
el_hdmi.c
> index 187a2b828b97..38a0e423420a 100644
> --- a/drivers/gpu/drm/i915/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/intel_hdmi.c
> @@ -2794,6 +2794,10 @@ intel_hdmi_add_properties(struct intel_hdmi *intel=
_hdmi, struct drm_connector *c
>  	struct drm_i915_private *dev_priv =3D to_i915(connector->dev);
>  	struct intel_digital_port *intel_dig_port =3D
>  				hdmi_to_dig_port(intel_hdmi);
> +	enum port port =3D intel_dig_port->base.port;
> +
> +	intel_connector_set_path_property(connector, "ddi:%d",
> +					  port - PORT_A);
> =20
>  	intel_attach_force_audio_property(connector);
>  	intel_attach_broadcast_rgb_property(connector);
> diff --git a/drivers/gpu/drm/i915/intel_lvds.c b/drivers/gpu/drm/i915/int=
el_lvds.c
> index efefed62a7f8..463665f0ecbd 100644
> --- a/drivers/gpu/drm/i915/intel_lvds.c
> +++ b/drivers/gpu/drm/i915/intel_lvds.c
> @@ -915,6 +915,8 @@ void intel_lvds_init(struct drm_i915_private *dev_pri=
v)
> =20
>  	lvds_encoder->reg =3D lvds_reg;
> =20
> +	intel_connector_set_path_property(connector, "lvds:0");
> +
>  	/* create the scaling mode property */
>  	allowed_scalers =3D BIT(DRM_MODE_SCALE_ASPECT);
>  	allowed_scalers |=3D BIT(DRM_MODE_SCALE_FULLSCREEN);
> diff --git a/drivers/gpu/drm/i915/intel_sdvo.c b/drivers/gpu/drm/i915/int=
el_sdvo.c
> index 0860ae36bb87..c16cdde849cc 100644
> --- a/drivers/gpu/drm/i915/intel_sdvo.c
> +++ b/drivers/gpu/drm/i915/intel_sdvo.c
> @@ -2650,9 +2650,8 @@ static struct intel_sdvo_connector *intel_sdvo_conn=
ector_alloc(void)
>  static bool
>  intel_sdvo_dvi_init(struct intel_sdvo *intel_sdvo, int device)
>  {
> -	struct drm_encoder *encoder =3D &intel_sdvo->base.base;
> +	struct intel_encoder *encoder =3D &intel_sdvo->base;
>  	struct drm_connector *connector;
> -	struct intel_encoder *intel_encoder =3D to_intel_encoder(encoder);
>  	struct intel_connector *intel_connector;
>  	struct intel_sdvo_connector *intel_sdvo_connector;
> =20
> @@ -2679,12 +2678,12 @@ intel_sdvo_dvi_init(struct intel_sdvo *intel_sdvo=
, int device)
>  		 * Some SDVO devices have one-shot hotplug interrupts.
>  		 * Ensure that they get re-enabled when an interrupt happens.
>  		 */
> -		intel_encoder->hotplug =3D intel_sdvo_hotplug;
> -		intel_sdvo_enable_hotplug(intel_encoder);
> +		encoder->hotplug =3D intel_sdvo_hotplug;
> +		intel_sdvo_enable_hotplug(encoder);
>  	} else {
>  		intel_connector->polled =3D DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR=
_POLL_DISCONNECT;
>  	}
> -	encoder->encoder_type =3D DRM_MODE_ENCODER_TMDS;
> +	encoder->base.encoder_type =3D DRM_MODE_ENCODER_TMDS;
>  	connector->connector_type =3D DRM_MODE_CONNECTOR_DVID;
> =20
>  	if (intel_sdvo_is_hdmi_connector(intel_sdvo, device)) {
> @@ -2700,13 +2699,18 @@ intel_sdvo_dvi_init(struct intel_sdvo *intel_sdvo=
, int device)
>  	if (intel_sdvo_connector->is_hdmi)
>  		intel_sdvo_add_hdmi_properties(intel_sdvo, intel_sdvo_connector);
> =20
> +	intel_connector_set_path_property(connector, "sdvo:%d:%s:%d",
> +					  encoder->port - PORT_A,
> +					  intel_sdvo_connector->is_hdmi ?
> +					  "hdmi" : "dvi", device);
> +
>  	return true;
>  }
> =20
>  static bool
>  intel_sdvo_tv_init(struct intel_sdvo *intel_sdvo, int type)
>  {
> -	struct drm_encoder *encoder =3D &intel_sdvo->base.base;
> +	struct intel_encoder *encoder =3D &intel_sdvo->base;
>  	struct drm_connector *connector;
>  	struct intel_connector *intel_connector;
>  	struct intel_sdvo_connector *intel_sdvo_connector;
> @@ -2719,7 +2723,7 @@ intel_sdvo_tv_init(struct intel_sdvo *intel_sdvo, i=
nt type)
> =20
>  	intel_connector =3D &intel_sdvo_connector->base;
>  	connector =3D &intel_connector->base;
> -	encoder->encoder_type =3D DRM_MODE_ENCODER_TVDAC;
> +	encoder->base.encoder_type =3D DRM_MODE_ENCODER_TVDAC;
>  	connector->connector_type =3D DRM_MODE_CONNECTOR_SVIDEO;
> =20
>  	intel_sdvo->controlled_output |=3D type;
> @@ -2736,6 +2740,9 @@ intel_sdvo_tv_init(struct intel_sdvo *intel_sdvo, i=
nt type)
>  	if (!intel_sdvo_create_enhance_property(intel_sdvo, intel_sdvo_connecto=
r))
>  		goto err;
> =20
> +	intel_connector_set_path_property(connector, "sdvo:%d:tv:%d",
> +					  encoder->port - PORT_A, type);
> +
>  	return true;
> =20
>  err:
> @@ -2746,7 +2753,7 @@ intel_sdvo_tv_init(struct intel_sdvo *intel_sdvo, i=
nt type)
>  static bool
>  intel_sdvo_analog_init(struct intel_sdvo *intel_sdvo, int device)
>  {
> -	struct drm_encoder *encoder =3D &intel_sdvo->base.base;
> +	struct intel_encoder *encoder =3D &intel_sdvo->base;
>  	struct drm_connector *connector;
>  	struct intel_connector *intel_connector;
>  	struct intel_sdvo_connector *intel_sdvo_connector;
> @@ -2760,7 +2767,7 @@ intel_sdvo_analog_init(struct intel_sdvo *intel_sdv=
o, int device)
>  	intel_connector =3D &intel_sdvo_connector->base;
>  	connector =3D &intel_connector->base;
>  	intel_connector->polled =3D DRM_CONNECTOR_POLL_CONNECT;
> -	encoder->encoder_type =3D DRM_MODE_ENCODER_DAC;
> +	encoder->base.encoder_type =3D DRM_MODE_ENCODER_DAC;
>  	connector->connector_type =3D DRM_MODE_CONNECTOR_VGA;
> =20
>  	if (device =3D=3D 0) {
> @@ -2776,13 +2783,16 @@ intel_sdvo_analog_init(struct intel_sdvo *intel_s=
dvo, int device)
>  		return false;
>  	}
> =20
> +	intel_connector_set_path_property(connector, "sdvo:%d:crt:%d",
> +					  encoder->port - PORT_A, device);
> +
>  	return true;
>  }
> =20
>  static bool
>  intel_sdvo_lvds_init(struct intel_sdvo *intel_sdvo, int device)
>  {
> -	struct drm_encoder *encoder =3D &intel_sdvo->base.base;
> +	struct intel_encoder *encoder =3D &intel_sdvo->base;
>  	struct drm_connector *connector;
>  	struct intel_connector *intel_connector;
>  	struct intel_sdvo_connector *intel_sdvo_connector;
> @@ -2796,7 +2806,7 @@ intel_sdvo_lvds_init(struct intel_sdvo *intel_sdvo,=
 int device)
> =20
>  	intel_connector =3D &intel_sdvo_connector->base;
>  	connector =3D &intel_connector->base;
> -	encoder->encoder_type =3D DRM_MODE_ENCODER_LVDS;
> +	encoder->base.encoder_type =3D DRM_MODE_ENCODER_LVDS;
>  	connector->connector_type =3D DRM_MODE_CONNECTOR_LVDS;
> =20
>  	if (device =3D=3D 0) {
> @@ -2831,6 +2841,9 @@ intel_sdvo_lvds_init(struct intel_sdvo *intel_sdvo,=
 int device)
>  	if (!intel_connector->panel.fixed_mode)
>  		goto err;
> =20
> +	intel_connector_set_path_property(connector, "sdvo:%d:lvds:%d",
> +					  encoder->port - PORT_A, device);
> +
>  	return true;
> =20
>  err:
> diff --git a/drivers/gpu/drm/i915/intel_tv.c b/drivers/gpu/drm/i915/intel=
_tv.c
> index 5dc594eafaf2..f9481404f642 100644
> --- a/drivers/gpu/drm/i915/intel_tv.c
> +++ b/drivers/gpu/drm/i915/intel_tv.c
> @@ -1988,4 +1988,6 @@ intel_tv_init(struct drm_i915_private *dev_priv)
>  	drm_object_attach_property(&connector->base,
>  				   dev->mode_config.tv_bottom_margin_property,
>  				   state->tv.margins.bottom);
> +
> +	intel_connector_set_path_property(connector, "tv:0");
>  }
> diff --git a/drivers/gpu/drm/i915/vlv_dsi.c b/drivers/gpu/drm/i915/vlv_ds=
i.c
> index e272d826210a..e97e689c6021 100644
> --- a/drivers/gpu/drm/i915/vlv_dsi.c
> +++ b/drivers/gpu/drm/i915/vlv_dsi.c
> @@ -1985,6 +1985,9 @@ void vlv_dsi_init(struct drm_i915_private *dev_priv)
> =20
>  	intel_dsi_add_properties(intel_connector);
> =20
> +	intel_connector_set_path_property(connector, "dsi:%d",
> +					  port - PORT_A);
> +
>  	return;
> =20
>  err_cleanup_connector:


--Sig_/CjyTL70MVQNhdehZa0.yeWo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl0UcioACgkQI1/ltBGq
qqfpJhAAheOxU+7M0e231Z2ZgDJYNxkaCmJYTqx2giYRvoNbfPzS2B5v/6YfV/MA
2LXHiMvB1dpeT5c6yRucNkRiZUN8Bwg71yftNN3TXYFRYGOtzVSJNTFFH1pYelY+
IeA8fU2wjYDn677C0jFzv2WLL5OWEqp0lVpQKWa/KzGIDeJEJohd54wCst8JZP5q
M/zKX1zLIKhoA6wLs0rE3wSY/U/gy87tLPSaUGbEWzr2QHJWp2nfCEINYfz2Rw3k
tJi4gFIlfGK3Dj4EFOGjXB4sObQT6DsHswya7cweXis9mE0VmhLKV8uaxWBHpmDr
AXLiZUXPXIiphW5lNA90b0APWSdLpGwzD5hRpnoIalNVd/rB98MVgf5lFgTiFjnQ
+xO9s4aR6qA51a6i7S50B/ry0YbNse+vtF1C6ipQ4SU/D3nXf/Em6uLlTHUNknGH
tp5NDVadKZI1va2BjfRGCno6tIsqIvCbz3CSH9MG7xtfbL2tSKRErCuqVKJtxGLx
+0p7NGJoSuDHJ35IF1jEmPnfv2dq1oQ/GUWeUrSztEWPaJv5M8PC7P9Sfp325bG1
/rU/CznSVp6j5raAo8XGmyaVaLpEKFVjklZbJf0JtUKG/ek5um5agEDL6JoZx6nO
rFxGnO0IWVFG7KZehHmeuxja7F2iY3VMs4lFT67yEjG99VWvIk8=
=xtPo
-----END PGP SIGNATURE-----

--Sig_/CjyTL70MVQNhdehZa0.yeWo--

--===============1516628457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1516628457==--
