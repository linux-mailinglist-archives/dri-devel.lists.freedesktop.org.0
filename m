Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 649982D9855
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 13:54:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4FA89B9E;
	Mon, 14 Dec 2020 12:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9EF189B9E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 12:54:12 +0000 (UTC)
Date: Mon, 14 Dec 2020 13:54:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607950452;
 bh=3Q0n780tTfMGfm83YEAeDTbfuEa1jbztZJPxtA1IcZM=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=pjr7kCzwNY82Pl0QoPtavpc43RmqJm/HoziHHCw4HtJDmu5zj3Nd4Hs0D8G/rQ9BC
 86cSNL9DjxfxZS3OhT6XG9y/EG9kxN2tRQUxuNwLb8if5i33wG/lewxKJPvQEIfUeB
 UjCUCDpPVl4McqqG7VKaz+JxAz7wzKvFy5oLVLxyXoMc2GeBkaKudnw/uGhypkqWO7
 Pxy2v45uenSB8KdeTNyTKPwWezxWaKYsgDfl3j9hq1eauD7e/mPl5tiAEFulUeUU+F
 Vr8vnWSqcRPVgxvy8lxQrLk4nIGotpXCrtziWBxnpviewukrICvOC2ZazsP/XNfsyp
 hNxeFLhou2tdg==
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 54/80] drm/omap: remove dss_mgr_ops
Message-ID: <20201214125410.igovz6ywmf4wensg@earth.universe>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-55-tomi.valkeinen@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201124124538.660710-55-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: multipart/mixed; boundary="===============2029736340=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2029736340==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zcundcsg4fvln232"
Content-Disposition: inline


--zcundcsg4fvln232
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 24, 2020 at 02:45:12PM +0200, Tomi Valkeinen wrote:
> dss_mgr_ops was needed with the multi-module architecture, but is no
> longer needed. We can thus remove it and use direct calls.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/dss.h     |  1 -
>  drivers/gpu/drm/omapdrm/dss/omapdss.h | 42 +++++++++++----------------
>  drivers/gpu/drm/omapdrm/dss/output.c  | 33 +++++----------------
>  drivers/gpu/drm/omapdrm/omap_crtc.c   | 38 +++++-------------------
>  drivers/gpu/drm/omapdrm/omap_crtc.h   |  2 --
>  drivers/gpu/drm/omapdrm/omap_drv.c    |  4 +--
>  6 files changed, 33 insertions(+), 87 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dss.h b/drivers/gpu/drm/omapdrm/=
dss/dss.h
> index 96f702314c8c..a547527bb2f3 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/dss.h
> @@ -257,7 +257,6 @@ struct dss_device {
>  	struct dss_pll	*video2_pll;
> =20
>  	struct dispc_device *dispc;
> -	const struct dss_mgr_ops *mgr_ops;
>  	struct omap_drm_private *mgr_ops_priv;
>  };
> =20
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omap=
drm/dss/omapdss.h
> index fba5f05e5e48..9df322ca467d 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -338,31 +338,23 @@ enum dss_writeback_channel {
>  	DSS_WB_LCD3_MGR =3D	7,
>  };
> =20
> -struct dss_mgr_ops {
> -	void (*start_update)(struct omap_drm_private *priv,
> -			     enum omap_channel channel);
> -	int (*enable)(struct omap_drm_private *priv,
> -		      enum omap_channel channel);
> -	void (*disable)(struct omap_drm_private *priv,
> -			enum omap_channel channel);
> -	void (*set_timings)(struct omap_drm_private *priv,
> -			    enum omap_channel channel,
> -			    const struct videomode *vm);
> -	void (*set_lcd_config)(struct omap_drm_private *priv,
> -			       enum omap_channel channel,
> -			       const struct dss_lcd_mgr_config *config);
> -	int (*register_framedone_handler)(struct omap_drm_private *priv,
> -			enum omap_channel channel,
> -			void (*handler)(void *), void *data);
> -	void (*unregister_framedone_handler)(struct omap_drm_private *priv,
> -			enum omap_channel channel,
> -			void (*handler)(void *), void *data);
> -};
> -
> -int dss_install_mgr_ops(struct dss_device *dss,
> -			const struct dss_mgr_ops *mgr_ops,
> -			struct omap_drm_private *priv);
> -void dss_uninstall_mgr_ops(struct dss_device *dss);
> +void omap_crtc_dss_start_update(struct omap_drm_private *priv,
> +				       enum omap_channel channel);
> +void omap_crtc_set_enabled(struct drm_crtc *crtc, bool enable);
> +int omap_crtc_dss_enable(struct omap_drm_private *priv, enum omap_channe=
l channel);
> +void omap_crtc_dss_disable(struct omap_drm_private *priv, enum omap_chan=
nel channel);
> +void omap_crtc_dss_set_timings(struct omap_drm_private *priv,
> +		enum omap_channel channel,
> +		const struct videomode *vm);
> +void omap_crtc_dss_set_lcd_config(struct omap_drm_private *priv,
> +		enum omap_channel channel,
> +		const struct dss_lcd_mgr_config *config);
> +int omap_crtc_dss_register_framedone(
> +		struct omap_drm_private *priv, enum omap_channel channel,
> +		void (*handler)(void *), void *data);
> +void omap_crtc_dss_unregister_framedone(
> +		struct omap_drm_private *priv, enum omap_channel channel,
> +		void (*handler)(void *), void *data);
> =20
>  void dss_mgr_set_timings(struct omap_dss_device *dssdev,
>  		const struct videomode *vm);
> diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/omapd=
rm/dss/output.c
> index 7a14d2b5b2f7..2121c947947b 100644
> --- a/drivers/gpu/drm/omapdrm/dss/output.c
> +++ b/drivers/gpu/drm/omapdrm/dss/output.c
> @@ -81,54 +81,35 @@ void omapdss_device_cleanup_output(struct omap_dss_de=
vice *out)
>  					out->next_bridge : out->bridge);
>  }
> =20
> -int dss_install_mgr_ops(struct dss_device *dss,
> -			const struct dss_mgr_ops *mgr_ops,
> -			struct omap_drm_private *priv)
> -{
> -	if (dss->mgr_ops)
> -		return -EBUSY;
> -
> -	dss->mgr_ops =3D mgr_ops;
> -	dss->mgr_ops_priv =3D priv;
> -
> -	return 0;
> -}
> -
> -void dss_uninstall_mgr_ops(struct dss_device *dss)
> -{
> -	dss->mgr_ops =3D NULL;
> -	dss->mgr_ops_priv =3D NULL;
> -}
> -
>  void dss_mgr_set_timings(struct omap_dss_device *dssdev,
>  			 const struct videomode *vm)
>  {
> -	dssdev->dss->mgr_ops->set_timings(dssdev->dss->mgr_ops_priv,
> +	omap_crtc_dss_set_timings(dssdev->dss->mgr_ops_priv,
>  					  dssdev->dispc_channel, vm);
>  }
> =20
>  void dss_mgr_set_lcd_config(struct omap_dss_device *dssdev,
>  		const struct dss_lcd_mgr_config *config)
>  {
> -	dssdev->dss->mgr_ops->set_lcd_config(dssdev->dss->mgr_ops_priv,
> +	omap_crtc_dss_set_lcd_config(dssdev->dss->mgr_ops_priv,
>  					     dssdev->dispc_channel, config);
>  }
> =20
>  int dss_mgr_enable(struct omap_dss_device *dssdev)
>  {
> -	return dssdev->dss->mgr_ops->enable(dssdev->dss->mgr_ops_priv,
> +	return omap_crtc_dss_enable(dssdev->dss->mgr_ops_priv,
>  					    dssdev->dispc_channel);
>  }
> =20
>  void dss_mgr_disable(struct omap_dss_device *dssdev)
>  {
> -	dssdev->dss->mgr_ops->disable(dssdev->dss->mgr_ops_priv,
> +	omap_crtc_dss_disable(dssdev->dss->mgr_ops_priv,
>  				      dssdev->dispc_channel);
>  }
> =20
>  void dss_mgr_start_update(struct omap_dss_device *dssdev)
>  {
> -	dssdev->dss->mgr_ops->start_update(dssdev->dss->mgr_ops_priv,
> +	omap_crtc_dss_start_update(dssdev->dss->mgr_ops_priv,
>  					   dssdev->dispc_channel);
>  }
> =20
> @@ -137,7 +118,7 @@ int dss_mgr_register_framedone_handler(struct omap_ds=
s_device *dssdev,
>  {
>  	struct dss_device *dss =3D dssdev->dss;
> =20
> -	return dss->mgr_ops->register_framedone_handler(dss->mgr_ops_priv,
> +	return omap_crtc_dss_register_framedone(dss->mgr_ops_priv,
>  							dssdev->dispc_channel,
>  							handler, data);
>  }
> @@ -147,7 +128,7 @@ void dss_mgr_unregister_framedone_handler(struct omap=
_dss_device *dssdev,
>  {
>  	struct dss_device *dss =3D dssdev->dss;
> =20
> -	dss->mgr_ops->unregister_framedone_handler(dss->mgr_ops_priv,
> +	omap_crtc_dss_unregister_framedone(dss->mgr_ops_priv,
>  						   dssdev->dispc_channel,
>  						   handler, data);
>  }
> diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdr=
m/omap_crtc.c
> index 0bf5cef579b5..e3259338afb9 100644
> --- a/drivers/gpu/drm/omapdrm/omap_crtc.c
> +++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
> @@ -100,14 +100,14 @@ int omap_crtc_wait_pending(struct drm_crtc *crtc)
>   * the upstream part of the video pipe.
>   */
> =20
> -static void omap_crtc_dss_start_update(struct omap_drm_private *priv,
> +void omap_crtc_dss_start_update(struct omap_drm_private *priv,
>  				       enum omap_channel channel)
>  {
>  	dispc_mgr_enable(priv->dispc, channel, true);
>  }
> =20
>  /* Called only from the encoder enable/disable and suspend/resume handle=
rs. */
> -static void omap_crtc_set_enabled(struct drm_crtc *crtc, bool enable)
> +void omap_crtc_set_enabled(struct drm_crtc *crtc, bool enable)
>  {
>  	struct omap_crtc_state *omap_state =3D to_omap_crtc_state(crtc->state);
>  	struct drm_device *dev =3D crtc->dev;
> @@ -180,8 +180,7 @@ static void omap_crtc_set_enabled(struct drm_crtc *cr=
tc, bool enable)
>  }
> =20
> =20
> -static int omap_crtc_dss_enable(struct omap_drm_private *priv,
> -				enum omap_channel channel)
> +int omap_crtc_dss_enable(struct omap_drm_private *priv, enum omap_channe=
l channel)
>  {
>  	struct drm_crtc *crtc =3D priv->channels[channel]->crtc;
>  	struct omap_crtc *omap_crtc =3D to_omap_crtc(crtc);
> @@ -193,8 +192,7 @@ static int omap_crtc_dss_enable(struct omap_drm_priva=
te *priv,
>  	return 0;
>  }
> =20
> -static void omap_crtc_dss_disable(struct omap_drm_private *priv,
> -				  enum omap_channel channel)
> +void omap_crtc_dss_disable(struct omap_drm_private *priv, enum omap_chan=
nel channel)
>  {
>  	struct drm_crtc *crtc =3D priv->channels[channel]->crtc;
>  	struct omap_crtc *omap_crtc =3D to_omap_crtc(crtc);
> @@ -202,7 +200,7 @@ static void omap_crtc_dss_disable(struct omap_drm_pri=
vate *priv,
>  	omap_crtc_set_enabled(&omap_crtc->base, false);
>  }
> =20
> -static void omap_crtc_dss_set_timings(struct omap_drm_private *priv,
> +void omap_crtc_dss_set_timings(struct omap_drm_private *priv,
>  		enum omap_channel channel,
>  		const struct videomode *vm)
>  {
> @@ -213,7 +211,7 @@ static void omap_crtc_dss_set_timings(struct omap_drm=
_private *priv,
>  	omap_crtc->vm =3D *vm;
>  }
> =20
> -static void omap_crtc_dss_set_lcd_config(struct omap_drm_private *priv,
> +void omap_crtc_dss_set_lcd_config(struct omap_drm_private *priv,
>  		enum omap_channel channel,
>  		const struct dss_lcd_mgr_config *config)
>  {
> @@ -225,7 +223,7 @@ static void omap_crtc_dss_set_lcd_config(struct omap_=
drm_private *priv,
>  					    config);
>  }
> =20
> -static int omap_crtc_dss_register_framedone(
> +int omap_crtc_dss_register_framedone(
>  		struct omap_drm_private *priv, enum omap_channel channel,
>  		void (*handler)(void *), void *data)
>  {
> @@ -244,7 +242,7 @@ static int omap_crtc_dss_register_framedone(
>  	return 0;
>  }
> =20
> -static void omap_crtc_dss_unregister_framedone(
> +void omap_crtc_dss_unregister_framedone(
>  		struct omap_drm_private *priv, enum omap_channel channel,
>  		void (*handler)(void *), void *data)
>  {
> @@ -261,16 +259,6 @@ static void omap_crtc_dss_unregister_framedone(
>  	omap_crtc->framedone_handler_data =3D NULL;
>  }
> =20
> -static const struct dss_mgr_ops mgr_ops =3D {
> -	.start_update =3D omap_crtc_dss_start_update,
> -	.enable =3D omap_crtc_dss_enable,
> -	.disable =3D omap_crtc_dss_disable,
> -	.set_timings =3D omap_crtc_dss_set_timings,
> -	.set_lcd_config =3D omap_crtc_dss_set_lcd_config,
> -	.register_framedone_handler =3D omap_crtc_dss_register_framedone,
> -	.unregister_framedone_handler =3D omap_crtc_dss_unregister_framedone,
> -};
> -
>  /* ---------------------------------------------------------------------=
--------
>   * Setup, Flush and Page Flip
>   */
> @@ -753,16 +741,6 @@ static const char *channel_names[] =3D {
>  	[OMAP_DSS_CHANNEL_LCD3] =3D "lcd3",
>  };
> =20
> -void omap_crtc_pre_init(struct omap_drm_private *priv)
> -{
> -	dss_install_mgr_ops(priv->dss, &mgr_ops, priv);
> -}
> -
> -void omap_crtc_pre_uninit(struct omap_drm_private *priv)
> -{
> -	dss_uninstall_mgr_ops(priv->dss);
> -}
> -
>  /* initialize crtc */
>  struct drm_crtc *omap_crtc_init(struct drm_device *dev,
>  				struct omap_drm_pipeline *pipe,
> diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.h b/drivers/gpu/drm/omapdr=
m/omap_crtc.h
> index 2fd57751ae2b..a8b9cbee86e0 100644
> --- a/drivers/gpu/drm/omapdrm/omap_crtc.h
> +++ b/drivers/gpu/drm/omapdrm/omap_crtc.h
> @@ -22,8 +22,6 @@ struct videomode;
> =20
>  struct videomode *omap_crtc_timings(struct drm_crtc *crtc);
>  enum omap_channel omap_crtc_channel(struct drm_crtc *crtc);
> -void omap_crtc_pre_init(struct omap_drm_private *priv);
> -void omap_crtc_pre_uninit(struct omap_drm_private *priv);
>  struct drm_crtc *omap_crtc_init(struct drm_device *dev,
>  				struct omap_drm_pipeline *pipe,
>  				struct drm_plane *plane);
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm=
/omap_drv.c
> index 46cb088c2977..da7183e98e3f 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -581,7 +581,7 @@ static int omapdrm_init(struct omap_drm_private *priv=
, struct device *dev)
>  	priv->dss =3D pdata->dss;
>  	priv->dispc =3D dispc_get_dispc(priv->dss);
> =20
> -	omap_crtc_pre_init(priv);
> +	priv->dss->mgr_ops_priv =3D priv;
> =20
>  	soc =3D soc_device_match(omapdrm_soc_devices);
>  	priv->omaprev =3D soc ? (unsigned int)soc->data : 0;
> @@ -634,7 +634,6 @@ static int omapdrm_init(struct omap_drm_private *priv=
, struct device *dev)
>  	omap_gem_deinit(ddev);
>  	destroy_workqueue(priv->wq);
>  	omap_disconnect_pipelines(ddev);
> -	omap_crtc_pre_uninit(priv);
>  	drm_dev_put(ddev);
>  	return ret;
>  }
> @@ -660,7 +659,6 @@ static void omapdrm_cleanup(struct omap_drm_private *=
priv)
>  	destroy_workqueue(priv->wq);
> =20
>  	omap_disconnect_pipelines(ddev);
> -	omap_crtc_pre_uninit(priv);
> =20
>  	drm_dev_put(ddev);
>  }
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--zcundcsg4fvln232
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XYHIACgkQ2O7X88g7
+prwdQ//V+h/Pa+QCwDzMbo08kpYwrwPvm571rrnQgH0lyNHfT+OnqESH1BXCtO8
wFJtPnfsI1YqMpG6UqmY/YuicuLl4SnqVKGKzEeTiMVf2TxaumHozi/6CZmHG422
BzM597Ij8rwvABx1anxAllSTMEICJypywikh7txyxN2eFlKaLYb6B6XVBabjcbmZ
Fmm0HgKbr2Cxlj0GaOvTMWzUrrfJ0Dx2L1vKG0BhdJwTCDxHmwOu2TjKbGbLUMSF
3bh3+YnVQ+L+MzxZZmmnEBbHJkTZbr1JOPaihuMrCtAFZLr3xwz/RynvpVXBAY2t
AgSFEZbI5AtP6pjbSxOXjmX1wZPuvKLtqOZs7NwXjxIrqPerNR95/YsLMyatE86U
+bj96yCRkBSt70pKCnLauNNHFI3LaXag4xhgSY9998InWyeH67FOYmVEk7lCXgKh
NxXEjMoySep9nVBD5c4/pnoyjsXv/OwqlP77FKbAXu4rrnkIPw/rpWOUH2q8fNhT
ldrbnxHuAD2N9RbmEH/+QjAV+f7xYwyEJmwJ9Qlz4exYrHVXhnx69W27Ym50ajJO
E8wb4MV8tOmt8fFKa/SImRIYti59BrZ8szVbokbgNc0JzPBYEr5tfUO350w8r/0j
Uw2dXYHvP/OQYE5K4qeKAMP+vxV16QCZ1mzEY0iGSXg6CB9ASK0=
=1XS3
-----END PGP SIGNATURE-----

--zcundcsg4fvln232--

--===============2029736340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2029736340==--
