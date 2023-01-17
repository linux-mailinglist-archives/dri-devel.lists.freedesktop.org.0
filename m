Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3824966E43C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 17:58:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31CBB10E594;
	Tue, 17 Jan 2023 16:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4CC10E594
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 16:58:25 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id D940C5C0176;
 Tue, 17 Jan 2023 11:58:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 17 Jan 2023 11:58:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1673974702; x=1674061102; bh=mwIGHWCBek
 Q9BMMNPOARhkG/MMqyeZiMnAu5idF4a44=; b=gqW1tXrcYmHRBtgbUr2F1/rAH0
 9ZFp3lBa1B1wsFQPUPfib73+TlNg0RkkshBRDy6NQ1REEsVC12Hn7GA19OdbG+bD
 qGoHEN1LwyQzJbp59dIBL0Ou/TLNRQvPs0BMfeROupwudmCvK5zh6RWvHSxHnUaP
 UM/aRj8JWGHlEbkn+4jJNrgLKf0TomfRHMtBxztpniV9JF6yzEnSJCTbxoeSZaLE
 bkL7m3nZnHuxXHyoELZ1sG2wFl4g52EwvDO6/s/4AvzhDL1ENKbvOjUkoSSHnRY6
 cpcgdLoAkFt3JSIlrBJrZgZXL2AeJkDOsUKUcN81eEcGm1bsL4YccnCnHCqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1673974702; x=1674061102; bh=mwIGHWCBekQ9BMMNPOARhkG/MMqy
 eZiMnAu5idF4a44=; b=aGsip6jLC6+VCcXF7IXcCUdHpOIqeO38sfAVlVmKB8t6
 E2fBX7dOZMEQ+XGaUOKz+ci8bASHYqn7Dm15vMdn1KCpxyfsWZFnHn9GSbLu/QOW
 uGvWTmh4jPgeSM0ONQgPbnm6KtH6staeSqdUZJQ1F42P26hPlrH6er6bmkmB3bm/
 NSLSh1wbTCZAcrrRutzEnC4up6DLUrdOegFOOZMiE1vQu6bhD2hWcezbxrg/utLl
 KGJBW8uliPurLJwbZWD1GROJS5z8cyggXwhZSNMgxSihz1oxQHdtKdl9c1Q3HTF5
 41xpCAq3qcEJy1IjfAo9Chs3or3QdJlaUYBFUG/PhA==
X-ME-Sender: <xms:rtPGYxTNOWM0bbUi7EWZSH-aw3zNjbaC1SRmc29sY_3r2l7yFsNaAA>
 <xme:rtPGY6xlQtzkBUarCNwCF30sAsPulQkmX2eZK7JKKgDHYCI8Lp0O1LeytOr6OunoD
 gS2b6LxfcVsRz13Obg>
X-ME-Received: <xmr:rtPGY20qjknBQzw9wv0Nx-ZiGohsgUAYaBMUb6lReJMmy-mKcRdEQSpnakrKO_PbG5jfOf6yIiX55IBSQt7XMGP4R4QNMIOvHxiHlFL2fUgfxA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtiedgleefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rtPGY5BqBfOXJgPDCvw5zMamlk2nchiW1HUHq4BCdkz9V94rYi6I-Q>
 <xmx:rtPGY6iDD7CdaA5lQMNhwlzMldQx2DkIlMc_g00sHYNaxKfun71ewg>
 <xmx:rtPGY9qaqnZSvTAGeFax90SZ49EIs6VHqumFAv_6--SrSPXrlxhbvA>
 <xmx:rtPGY_tSiDgX1I5qh3XTPDK1KiQbDnHhw18LJYH2c_Jb7owvrrRgyQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 11:58:21 -0500 (EST)
Date: Tue, 17 Jan 2023 17:58:19 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH V10 1/4] drm: of: Add drm_of_get_dsi_bus helper function
Message-ID: <20230117165819.4rx7aucvyp5e2rj6@houat>
References: <20230112175358.421975-1-macroalpha82@gmail.com>
 <20230112175358.421975-2-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7npjgdbxmfp4vihi"
Content-Disposition: inline
In-Reply-To: <20230112175358.421975-2-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, tzimmermann@suse.de,
 maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7npjgdbxmfp4vihi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jan 12, 2023 at 11:53:55AM -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Add helper function to find DSI host for devices where DSI panel is not
> a minor of a DSI bus (such as the Samsung AMS495QA01 panel or the
> official Raspberry Pi touchscreen display).
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> ---
>  drivers/gpu/drm/drm_of.c | 70 ++++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_of.h     | 10 ++++++
>  2 files changed, 80 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index 7bbcb999bb75..6c2c97a716fe 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -10,6 +10,7 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_encoder.h>
> +#include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
> =20
> @@ -493,3 +494,72 @@ int drm_of_get_data_lanes_count_ep(const struct devi=
ce_node *port,
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count_ep);
> +
> +#if IS_ENABLED(CONFIG_DRM_MIPI_DSI)
> +
> +/**
> + * drm_of_get_dsi_bus - find the DSI bus for a given device
> + * @dev: parent device of display (SPI, I2C)
> + * @info: DSI device info to be updated with DSI node. This is optional
> + * and if not needed can be NULL.
> + *
> + * Gets parent DSI bus for a DSI device controlled through a bus other
> + * than MIPI-DCS (SPI, I2C, etc.) using the Device Tree.
> + *
> + * Returns pointer to mipi_dsi_host if successful, -EINVAL if the
> + * request is unsupported, -EPROBE_DEFER if the DSI host is found but
> + * not available, or -ENODEV otherwise.
> + */
> +struct mipi_dsi_host *drm_of_get_dsi_bus(struct device *dev,
> +					 struct mipi_dsi_device_info *info)
> +{
> +	struct mipi_dsi_host *dsi_host;
> +	struct device_node *endpoint, *dsi_host_node;
> +
> +	/*
> +	 * Get first endpoint child from device.
> +	 */
> +	endpoint =3D of_graph_get_next_endpoint(dev->of_node, NULL);
> +	if (!endpoint)
> +		return ERR_PTR(-ENODEV);
> +
> +	/*
> +	 * Follow the first endpoint to get the DSI host node.
> +	 */
> +	dsi_host_node =3D of_graph_get_remote_port_parent(endpoint);
> +	if (!dsi_host_node)
> +		goto error;
> +
> +	/*
> +	 * Get the DSI host from the DSI host node. If we get an error
> +	 * or the return is null assume we're not ready to probe just
> +	 * yet. Release the DSI host node since we're done with it.
> +	 */
> +	dsi_host =3D of_find_mipi_dsi_host_by_node(dsi_host_node);
> +	of_node_put(dsi_host_node);
> +	if (IS_ERR_OR_NULL(dsi_host)) {
> +		of_node_put(endpoint);
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	/*
> +	 * Set the node of the mipi_dsi_device_info to the correct node
> +	 * and then release the endpoint node since we're done with it.
> +	 * since this is optional, check if the info is NULL first.
> +	 */
> +	if (info) {
> +		info->node =3D of_graph_get_remote_port(endpoint);

it looks to me that the info->node is actually the DSI device OF node,
not its host port. Which begs the question, why should we even return it
there, since there's a pretty big chance that dev->of.node =3D=3D
info->node, and you obviously don't care about the channel and type fields.

I've had a look and node of the current users of
mipi_dsi_device_register_full actually register a mipi_dsi_device_info
with a node pointer set to !NULL, including the driver in this series.

So, why do we care about the device info at all?

> +		if (IS_ERR_OR_NULL(info->node))

of_graph_get_remote_port doesn't return an error pointer.

> --- a/include/drm/drm_of.h
> +++ b/include/drm/drm_of.h
> @@ -15,6 +15,8 @@ struct drm_encoder;
>  struct drm_panel;
>  struct drm_bridge;
>  struct device_node;
> +struct mipi_dsi_device_info;
> +struct mipi_dsi_host;
> =20
>  /**
>   * enum drm_lvds_dual_link_pixels - Pixel order of an LVDS dual-link con=
nection
> @@ -56,6 +58,8 @@ int drm_of_get_data_lanes_count_ep(const struct device_=
node *port,
>  				   int port_reg, int reg,
>  				   const unsigned int min,
>  				   const unsigned int max);
> +struct mipi_dsi_host *drm_of_get_dsi_bus(struct device *dev,
> +					 struct mipi_dsi_device_info *info);
>  #else
>  static inline uint32_t drm_of_crtc_port_mask(struct drm_device *dev,
>  					  struct device_node *port)
> @@ -127,6 +131,12 @@ drm_of_get_data_lanes_count_ep(const struct device_n=
ode *port,
>  {
>  	return -EINVAL;
>  }
> +static inline struct
> +mipi_dsi_host *drm_of_get_dsi_bus(struct device *dev,
> +					 struct mipi_dsi_device_info *info)
> +{
> +	return ERR_PTR(-EINVAL);
> +}
>  #endif

So it looks to me that if CONFIG_OF is defined, we'll define an external
symbol declared for drm_of_get_dsi_bus, but that function will only be
compiled if CONFIG_DRM_MIPI_DSI is enabled.

What happens if we have CONFIG_OF but not CONFIG_DRM_MIPI_DSI?

If think you need to have here something like:

#ifdef IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_DRM_MIPI_DSI)
struct mipi_dsi_host *drm_of_get_dsi_bus(struct device *dev,
       					 struct mipi_dsi_device_info *info);
#else
static inline struct
mipi_dsi_host *drm_of_get_dsi_bus(struct device *dev,
				  struct mipi_dsi_device_info *info)
{
	return ERR_PTR(-EINVAL);
}
#endif

Maxime

--7npjgdbxmfp4vihi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY8bToAAKCRDj7w1vZxhR
xeNAAQDHf3gD/m6rIOl3XCKS1NtqNRV0SVpHe1YxIRdLehnAfQD/aa7TDSE3I6aL
TSyB4r5bH6LV9iHI1J9Rs76LuemgTA8=
=TFgQ
-----END PGP SIGNATURE-----

--7npjgdbxmfp4vihi--
