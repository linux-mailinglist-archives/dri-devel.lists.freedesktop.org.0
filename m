Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C582F5D5F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:29:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B64B6E133;
	Thu, 14 Jan 2021 09:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B34646E2C0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 09:13:25 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 381185C0194;
 Wed, 13 Jan 2021 04:13:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 13 Jan 2021 04:13:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Tn9fTmFYI/uQtrgkhZOhaGqWOAS
 vTLv8TiF5nATR2Ss=; b=CZrPKwH3QSiZepq1UFfaxHTCzECBKR83BxdgoftWeWc
 +Im6Aw26YlAHS3ZitHwoTtUvwp4DRxrfeho1ALkzj7IvjEuZxPqnky6afNQuwLId
 ZYiIlgRX6eZBL6HECRgrkGINUFni2AsfyeZsMxTSII0iXPtjk/u81rHqJtTch9bf
 Txt8YRSuZEiO+qeMMJdgpo1XNHJzHO8cI8/y4If4ynrSvM12R0qFpu0vHNk4p339
 MVx+ce1ztx5DEDCUPqXuPNsSxtBfrhm84EYszK18rB0mR86ONBJ335XNnGIIPgK3
 04l1JFwQ/fS9jrEne3Raor8yuGLz6rBhDVoENkDFOXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Tn9fTm
 FYI/uQtrgkhZOhaGqWOASvTLv8TiF5nATR2Ss=; b=D3wCxVaZilRDnnL0DUx7SF
 +gcNeHwEZKywNfjdkFbDugXJ6JoiF36P88cRHvyy+Ukbm/aIrSS9VkaxrWWrWBcP
 HA1NK+OFbU4lrGzf5q5H+pAe0phm+Te/xreoKr0TpJJ1ldO2JiY9TzWwx0R9JDVo
 900UR/WBGrScTbIG1BU9bdPxXuTQwGFP56lrzu9tULX01RqeYj7Vsvg6h6mZO+WP
 f6v1S7oToFwUNGn4DRSeQ0Qt+zqv8PNCcfuV5aOW7GRZKVQvto+88gimuo9jjg00
 f91ZV7dIxiWiOg9ta0b6gO2mBlZ9n8Ihwb4Kso61Of8avCqy2sZ3E35k1iRroJjg
 ==
X-ME-Sender: <xms:srn-X-cSuLYV6T-2jdlMK279HM-ZGdpcBT7p8ymH210aioT37gKQgA>
 <xme:srn-X4OyRTSdUu1yz6NGo99DpQaXHUGvkCPAk51_5fAbunwuSuQkEKG0U4fOsqAB7
 EBrll6GxIWgxokUPFE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtdefgddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:srn-X_gLMwLg3dwBZDCWA00Bwl4pSCfy90CohARGAxS8CAdlZHqlXQ>
 <xmx:srn-X79UACq1QDsmzPmFlwiugvym96rMg5lWKYHZ84GskRjS6E1SAw>
 <xmx:srn-X6tznywr7dtF-paLBWwSVgZ6js9YtMAf-E_aAtFaRKsTWgxhXA>
 <xmx:s7n-X3_j3Mb9eDws0t9b6hJgOCxa4GynymAkvvf8_YqeH5kRpI5lQA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C04A71080059;
 Wed, 13 Jan 2021 04:13:21 -0500 (EST)
Date: Wed, 13 Jan 2021 10:13:19 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [PATCH v3] drm/sun4i: de2: Reimplement plane z position setting
 logic
Message-ID: <20210113091319.vcemlo5ldn27472h@gilmour>
References: <20210106204630.1800284-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
In-Reply-To: <20210106204630.1800284-1-jernej.skrabec@siol.net>
X-Mailman-Approved-At: Thu, 14 Jan 2021 09:28:31 +0000
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
Cc: Roman Stratiienko <roman.stratiienko@globallogic.com>, airlied@linux.ie,
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, paul.kocialkowski@bootlin.com, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0712982258=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0712982258==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7lkz52fdez73ediq"
Content-Disposition: inline


--7lkz52fdez73ediq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jan 06, 2021 at 09:46:30PM +0100, Jernej Skrabec wrote:
> From: Roman Stratiienko <roman.stratiienko@globallogic.com>
>=20
> To set blending channel order register software needs to know state and
> position of each channel, which impossible at plane commit stage.
>=20
> Move this procedure to atomic_flush stage, where all necessary information
> is available.

Expanding a bit on what the blending order register is supposed to be
doing, why it's impossible at the plane commit, and why atomic_flush is
a better option would be nice

> Fixes: f88c5ee77496 ("drm/sun4i: Implement zpos for DE2")
> Fixes: d8b3f454dab4 ("drm/sun4i: sun8i: Avoid clearing blending order at =
each atomic commit")
> Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
> [rebased, addressed comments]
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c    | 57 +++++++++++++++++++++-----
>  drivers/gpu/drm/sun4i/sun8i_mixer.h    |  5 +++
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 42 +++----------------
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 42 +++----------------
>  4 files changed, 64 insertions(+), 82 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/=
sun8i_mixer.c
> index 5b42cf25cc86..d2153b10b08d 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -250,6 +250,50 @@ int sun8i_mixer_drm_format_to_hw(u32 format, u32 *hw=
_format)
> =20
>  static void sun8i_mixer_commit(struct sunxi_engine *engine)
>  {
> +	struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(engine);
> +	int channel_by_zpos[SUN8I_MIXER_MAX_CHANNELS];
> +	u32 base =3D sun8i_blender_base(mixer);
> +	u32 route =3D 0, pipe_ctl =3D 0;
> +	unsigned int channel_count;
> +	int i, j;
> +
> +	channel_count =3D mixer->cfg->vi_num + mixer->cfg->ui_num;
> +
> +	DRM_DEBUG_DRIVER("Update blender routing\n");
> +
> +	for (i =3D 0; i < SUN8I_MIXER_MAX_CHANNELS; i++)
> +		channel_by_zpos[i] =3D -1;
> +
> +	for (i =3D 0; i < channel_count; i++)	{
> +		int zpos =3D mixer->channel_zpos[i];

Why do we need the channel_zpos in the mixer structure, this looks
related to the state itself, so we should store it into a custom state
structure

> +		if (zpos >=3D 0 && zpos < channel_count)
> +			channel_by_zpos[zpos] =3D i;
> +	}
> +
> +	j =3D 0;
> +	for (i =3D 0; i < channel_count; i++) {
> +		int ch =3D channel_by_zpos[i];
> +
> +		if (ch >=3D 0) {
> +			pipe_ctl |=3D SUN8I_MIXER_BLEND_PIPE_CTL_EN(j);
> +			route |=3D ch << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(j);
> +			j++;
> +		}
> +	}

Similarly, having a comment somewhere to explain that algorithm would be
nice.

> +	/*
> +	 * Set fill color of bottom plane to black. Generally not needed
> +	 * except when VI plane is at bottom (zpos =3D 0) and enabled.
> +	 */
> +	pipe_ctl |=3D SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0);
> +
> +	regmap_write(mixer->engine.regs,
> +		     SUN8I_MIXER_BLEND_PIPE_CTL(base), pipe_ctl);
> +
> +	regmap_write(mixer->engine.regs,
> +		     SUN8I_MIXER_BLEND_ROUTE(base), route);
> +
>  	DRM_DEBUG_DRIVER("Committing changes\n");
> =20
>  	regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_DBUFF,
> @@ -479,23 +523,16 @@ static int sun8i_mixer_bind(struct device *dev, str=
uct device *master,
>  	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
>  		     SUN8I_MIXER_BLEND_COLOR_BLACK);
> =20
> -	/*
> -	 * Set fill color of bottom plane to black. Generally not needed
> -	 * except when VI plane is at bottom (zpos =3D 0) and enabled.
> -	 */
> -	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
> -		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
>  	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
>  		     SUN8I_MIXER_BLEND_COLOR_BLACK);
> =20
>  	plane_cnt =3D mixer->cfg->vi_num + mixer->cfg->ui_num;
> -	for (i =3D 0; i < plane_cnt; i++)
> +	for (i =3D 0; i < plane_cnt; i++) {
> +		mixer->channel_zpos[i] =3D -1;
>  		regmap_write(mixer->engine.regs,
>  			     SUN8I_MIXER_BLEND_MODE(base, i),
>  			     SUN8I_MIXER_BLEND_MODE_DEF);
> -
> -	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
> -			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
> +	}
> =20
>  	return 0;
> =20
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/=
sun8i_mixer.h
> index 7576b523fdbb..7b378d6e4dd9 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -12,6 +12,8 @@
> =20
>  #include "sunxi_engine.h"
> =20
> +#define SUN8I_MIXER_MAX_CHANNELS		5
> +
>  #define SUN8I_MIXER_SIZE(w, h)			(((h) - 1) << 16 | ((w) - 1))
>  #define SUN8I_MIXER_COORD(x, y)			((y) << 16 | (x))
> =20
> @@ -179,6 +181,9 @@ struct sun8i_mixer {
> =20
>  	struct clk			*bus_clk;
>  	struct clk			*mod_clk;
> +
> +	/* -1 means that layer is disabled */
> +	int channel_zpos[SUN8I_MIXER_MAX_CHANNELS];
>  };
> =20
>  static inline struct sun8i_mixer *
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_ui_layer.c
> index 816ad4ce8996..9f82e7c33e90 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -24,12 +24,10 @@
>  #include "sun8i_ui_scaler.h"
> =20
>  static void sun8i_ui_layer_enable(struct sun8i_mixer *mixer, int channel,
> -				  int overlay, bool enable, unsigned int zpos,
> -				  unsigned int old_zpos)
> +				  int overlay, bool enable, unsigned int zpos)
>  {
> -	u32 val, bld_base, ch_base;
> +	u32 val, ch_base;
> =20
> -	bld_base =3D sun8i_blender_base(mixer);
>  	ch_base =3D sun8i_channel_base(mixer, channel);
> =20
>  	DRM_DEBUG_DRIVER("%sabling channel %d overlay %d\n",
> @@ -44,32 +42,7 @@ static void sun8i_ui_layer_enable(struct sun8i_mixer *=
mixer, int channel,
>  			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay),
>  			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN, val);
> =20
> -	if (!enable || zpos !=3D old_zpos) {
> -		regmap_update_bits(mixer->engine.regs,
> -				   SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> -				   SUN8I_MIXER_BLEND_PIPE_CTL_EN(old_zpos),
> -				   0);
> -
> -		regmap_update_bits(mixer->engine.regs,
> -				   SUN8I_MIXER_BLEND_ROUTE(bld_base),
> -				   SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(old_zpos),
> -				   0);
> -	}
> -
> -	if (enable) {
> -		val =3D SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
> -
> -		regmap_update_bits(mixer->engine.regs,
> -				   SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> -				   val, val);
> -
> -		val =3D channel << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(zpos);
> -
> -		regmap_update_bits(mixer->engine.regs,
> -				   SUN8I_MIXER_BLEND_ROUTE(bld_base),
> -				   SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(zpos),
> -				   val);
> -	}
> +	mixer->channel_zpos[channel] =3D enable ? zpos : -1;
>  }
> =20
>  static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int ch=
annel,
> @@ -267,11 +240,9 @@ static void sun8i_ui_layer_atomic_disable(struct drm=
_plane *plane,
>  					  struct drm_plane_state *old_state)
>  {
>  	struct sun8i_ui_layer *layer =3D plane_to_sun8i_ui_layer(plane);
> -	unsigned int old_zpos =3D old_state->normalized_zpos;
>  	struct sun8i_mixer *mixer =3D layer->mixer;
> =20
> -	sun8i_ui_layer_enable(mixer, layer->channel, layer->overlay, false, 0,
> -			      old_zpos);
> +	sun8i_ui_layer_enable(mixer, layer->channel, layer->overlay, false, 0);
>  }
> =20
>  static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
> @@ -279,12 +250,11 @@ static void sun8i_ui_layer_atomic_update(struct drm=
_plane *plane,
>  {
>  	struct sun8i_ui_layer *layer =3D plane_to_sun8i_ui_layer(plane);
>  	unsigned int zpos =3D plane->state->normalized_zpos;
> -	unsigned int old_zpos =3D old_state->normalized_zpos;
>  	struct sun8i_mixer *mixer =3D layer->mixer;
> =20
>  	if (!plane->state->visible) {
>  		sun8i_ui_layer_enable(mixer, layer->channel,
> -				      layer->overlay, false, 0, old_zpos);
> +				      layer->overlay, false, 0);
>  		return;
>  	}
> =20
> @@ -295,7 +265,7 @@ static void sun8i_ui_layer_atomic_update(struct drm_p=
lane *plane,
>  	sun8i_ui_layer_update_buffer(mixer, layer->channel,
>  				     layer->overlay, plane);
>  	sun8i_ui_layer_enable(mixer, layer->channel, layer->overlay,
> -			      true, zpos, old_zpos);
> +			      true, zpos);
>  }

The prototype change could be in a separate patch, it would make things
easier to review.

Maxime

--7lkz52fdez73ediq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX/65rwAKCRDj7w1vZxhR
xdV4APsFPA4cMgAoq4Sb2HMWf7gmKjULe5gHGRG121MpvmEH5wEA2ceHxq3EltdV
mDfAi7tQAjzWj/4nN0MjCfR2kBt1rAY=
=0eaD
-----END PGP SIGNATURE-----

--7lkz52fdez73ediq--

--===============0712982258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0712982258==--
