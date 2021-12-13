Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC50B4732A0
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 18:02:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61EB810E7A2;
	Mon, 13 Dec 2021 17:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D035510E7A2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 17:02:26 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 3294B5C01A6;
 Mon, 13 Dec 2021 12:02:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 13 Dec 2021 12:02:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=CccPXC1lwp4mKHgQAYzhGHZDySN
 KWUomCmAc3m5LP18=; b=Fpnyvc9Wb8NPoOZbIi0ZVlySFmMIkEMZEs1HkAkLhD3
 KE7mCrmlOTWkU+Ubovs8AUSxKpc3X1fJfHeRTN6Zxvotj7nVv5ZF5NTIsRMyRBMl
 rsCA3H5F/ej7m7SFcjj75BBrp9YalXmP4wBY6RlinyQ8UTwDx6wkfaJ0QnAAbxUf
 KN8Qlw56h58NYRO4y0nIZVR87ulx4/togtLSA0gjpBZp9btBggxTk4zweWQ2cOwg
 9maGaOwVV1qM/j5nl46yyp+lh5pKEctuYdPtdSjPAoOzYBMsQzFKaZ2EZ3xYgupa
 RAhH4Day3O7SiS+BIh8C+fyl97gz9W32u4MozBXsTYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=CccPXC
 1lwp4mKHgQAYzhGHZDySNKWUomCmAc3m5LP18=; b=oHm9K3ISLLyehJBeAmcY6O
 +2U9GyoX39MA8LU8pSQ7LgLhky9Cey/HpS05NTvXKbZ8uo3Qh+5WqntsItOpbEuh
 iKucAJDsHjgECGUlnPvlt0Vj4p/6/ojIUXE3ub5VaW32WPlvA4yHcRcDfvOh5sV9
 sW7jxCrahmnHJZHCMQkPfQRZSQGIMiaWkwcx4+VCy90j8S40BmFOYZTAvXbgVz36
 5eRO2B6uuaOSMWXW8N5hksST1ywfB+AIKItlnBdt3Z7LjXZgCtqhfPlFrTos9xTd
 6pOL/jEpPAGSB9MGGB3asj5cQ7JDPqIfOY6Ub9PU4fU8+yJP+d+m9ce+lF7p1Fwg
 ==
X-ME-Sender: <xms:oXy3YRruCJSS9UkXuUXwmAELohMJlb68pbuJtsGzEYsHhkmUQK4ukQ>
 <xme:oXy3YTrZpmHK50_1NvoxTtM67RgFmHphox2WY-H6nQUcXbhjVy_mtjkxKmx-rtkju
 9jrW3QaOV-B7Bw_OPA>
X-ME-Received: <xmr:oXy3YePxDAC5wSqhOZVTTUj3WBcdv1vc4l8Se7wY9QZ3FWAQvkwCQUpxNhLOLRbQq-En0bbAcTHH5V0OD0HSaUZs3ImbIFwO-DT-R4lx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdeliecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:oXy3Yc5b_MII-mdwPZvNIplQygRJiSIs44x2qdHwr-586sx1umczNw>
 <xmx:oXy3YQ7vGUJ61mTNWj1o8YoQE3kU-IAOi2LcQ92wL7o_A3lPSbJoBA>
 <xmx:oXy3YUj5n3faY_gAHFoJ4a8XjckIzMFTKRAdwVpIKYk5VCr2A8wpNw>
 <xmx:ony3YSsZuA_epfW4977n_CHmpdUC63V6iEyBTmW26r2aIZKUKLyu1w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Dec 2021 12:02:24 -0500 (EST)
Date: Mon, 13 Dec 2021 18:02:23 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v6 1/6] drm: sun4i: dsi: Drop DRM bind race with bridge
 attach
Message-ID: <20211213170223.fx5656vjk3fwizbg@houat>
References: <20211210111711.2072660-1-jagan@amarulasolutions.com>
 <20211210111711.2072660-2-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dtklktu6pvfdrrth"
Content-Disposition: inline
In-Reply-To: <20211210111711.2072660-2-jagan@amarulasolutions.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dtklktu6pvfdrrth
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 10, 2021 at 04:47:06PM +0530, Jagan Teki wrote:
> Existing host driver will keep looking for DRM pointer in
> sun6i_dsi_attach and defers even if the particular DSI device
> is found for the first time. Meanwhile it triggers the bind
> callback and gets the DRM pointer and then continues the
> sun6i_dsi_attach.
>=20
> This makes a deadlock situation if sun6i_dsi_attach is trying
> to find the bridge.

I'm not sure what you mean by deadlock here, there's no lock involved?

> If interface bridge is trying to call host attach, then host
> sun6i_dsi_attach is trying to find bridge and defers the
> interface bridge even if it found the bridge as bind callback
> does not complete at the movement. So, this sun6i_dsi_attach
> defers interface bridge and triggers the bind callback and
> tries to attach the bridge with a bridge pointer which is not
> available at the moment.
>
> Eventually these callbacks are triggered recursively, as
> sun6i_dsi_attach defers interface bridge and bind callback
> defers sun6i_dsi_attach due to invalid bridge ponter.

                                                ^ pointer

>=20
> This patch prevents this situation by probing all DSI devices
> on the pipeline first and then triggers the bind callback by
> dropping exing DRM binding logic.

           ^ existing I guess?

>=20
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v6:
> - none
> Changes for v5:
> - new patch
>=20
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 10 +---------
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  1 -
>  2 files changed, 1 insertion(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun=
4i/sun6i_mipi_dsi.c
> index 527c7b2474da..4bdcce8f1d84 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> @@ -967,14 +967,10 @@ static int sun6i_dsi_attach(struct mipi_dsi_host *h=
ost,
> =20
>  	if (IS_ERR(panel))
>  		return PTR_ERR(panel);
> -	if (!dsi->drm || !dsi->drm->registered)
> -		return -EPROBE_DEFER;
> =20
>  	dsi->panel =3D panel;
>  	dsi->device =3D device;
> =20
> -	drm_kms_helper_hotplug_event(dsi->drm);
> -
>  	dev_info(host->dev, "Attached device %s\n", device->name);
> =20
>  	return 0;
> @@ -988,8 +984,6 @@ static int sun6i_dsi_detach(struct mipi_dsi_host *hos=
t,
>  	dsi->panel =3D NULL;
>  	dsi->device =3D NULL;
> =20
> -	drm_kms_helper_hotplug_event(dsi->drm);
> -
>  	return 0;
>  }
> =20
> @@ -1077,8 +1071,6 @@ static int sun6i_dsi_bind(struct device *dev, struc=
t device *master,
> =20
>  	drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
> =20
> -	dsi->drm =3D drm;
> -
>  	return 0;
> =20
>  err_cleanup_connector:
> @@ -1091,7 +1083,7 @@ static void sun6i_dsi_unbind(struct device *dev, st=
ruct device *master,
>  {
>  	struct sun6i_dsi *dsi =3D dev_get_drvdata(dev);
> =20
> -	dsi->drm =3D NULL;
> +	drm_encoder_cleanup(&dsi->encoder);
>  }
> =20
>  static const struct component_ops sun6i_dsi_ops =3D {
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h b/drivers/gpu/drm/sun=
4i/sun6i_mipi_dsi.h
> index c863900ae3b4..61e88ea6044d 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> @@ -29,7 +29,6 @@ struct sun6i_dsi {
> =20
>  	struct device		*dev;
>  	struct mipi_dsi_device	*device;
> -	struct drm_device	*drm;
>  	struct drm_panel	*panel;
>  };
> =20
> --=20
> 2.25.1
>=20

--dtklktu6pvfdrrth
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYbd8nwAKCRDj7w1vZxhR
xa2IAQDKg0/jEUlNH114Yz/+szPnC2WdF8T7lNAqer55RzPvUQD/XZLqpvLMfc6u
GWbUX8S7T+OhhF5suB8Gif6UIHettQA=
=qTVv
-----END PGP SIGNATURE-----

--dtklktu6pvfdrrth--
