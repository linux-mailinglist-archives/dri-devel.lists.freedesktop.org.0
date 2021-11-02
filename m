Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A2C443135
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 16:03:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C56746E964;
	Tue,  2 Nov 2021 15:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174046E964
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 15:03:35 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4D4095C011D;
 Tue,  2 Nov 2021 11:03:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 02 Nov 2021 11:03:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=GAofqbfPUokCWaAMbYDnlRK3LBS
 NmSEwo1+DLnUZQPA=; b=icIDIil8mCAEUKdAFEM7bbBKJM4c3tow+C1rVnwW+ad
 MUznoFGp9DBv7dGPibZgqbCm0Q0tey6/FvtxvGMTRKDKo83rf9G2yKhxNdlMfmt3
 ok2BETvZfc6A/FXWa6HLmILlHq/2W0Ck38KgBOdvnRtyQqqCBsCdjlPMMDrLUlN7
 TPUzShVSc2FtOhQABLAW/nG6CDrBSWD+zUDV7qS7QsKhJaLjtTsOky7z599t4nBN
 tzOxG1hwiy8jQtszA5drBNszSvA9817qpmRN5zGc/F9WFvj7hPNm1Mja00T9Qmdx
 PwF2Xw5SxETNMj8EsV57HNLhF+qICNKMGAt7pjXOjkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=GAofqb
 fPUokCWaAMbYDnlRK3LBSNmSEwo1+DLnUZQPA=; b=lS0scAA9GuTPiuitbEC3dS
 qv4c6dADfSp8kKPWNRIHuE8oZuUWdIo6GylFAh7GPQ0zXHM35MDtWC8cyw6xfjOM
 D5+yvuEOr4r+xowlLSaL23J92PnfZKpdj1TkHj7FM0wJXjlbpqCsykl0M3ii8rnP
 OwIi08sSnJid0I0s4RAGF2pueZ517h5EQD+sMcxGjVxAZQwA3pdpPya5nXluxxNo
 4xxkCQ5fLaREA7RfKJkCC8eK13Qhxi5/nImYPMxSxUHyxlvmBjlf+0eBfQwX97rY
 jZK0kMOquZ5OVO1hIGPffYkGO1dkiRR6VSHgUkwtySG+ZoFPtemUHHwf/xBowLeQ
 ==
X-ME-Sender: <xms:RVOBYRmSxDE-ppFBnVAdJDRlNJxZyhIzpbc0PtTGoSN66esEdoVQUA>
 <xme:RVOBYc3G9nDsOLqxYI3OEf8TBTFfV-5GAbcP8eUPDMW1GAA09G4qlXrquj6wUM9-s
 deqlsHjP9miNUFw5QU>
X-ME-Received: <xmr:RVOBYXorC9Kx3w30qm1BHzP-3yQTScjn4t6Om5e2Gh6bJnGcGaLMSEquQLz9-BZ5vmw8zzrJQMsNRmkYyGiyJsyw7DpU5_J0MNGckOkS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddtgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RVOBYRmLLJ0UnKsbu83sE6q-5mhZky_ifNG2WbNF6Tq_B2yC3uYQjQ>
 <xmx:RVOBYf1zPxZ3-zxOvMDu9Kjba0RedM1WqL0QsHzFcevYYzJipDGWXQ>
 <xmx:RVOBYQtNXE-2qsndLGoDB2gpXNWoMXPlKESxHpIKSaph6-DAHdk8bw>
 <xmx:RlOBYUmeg4OiGeoV707zYscTun_wlHoz_frvERZjKemn3WECBXZduw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Nov 2021 11:03:32 -0400 (EDT)
Date: Tue, 2 Nov 2021 16:03:31 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: He Ying <heying24@huawei.com>
Subject: Re: [PATCH -V2] drm/sun4i: Grab reference of connector before return
 connector from sun4i_tcon_get_connector
Message-ID: <20211102150331.526nn2e6oqjbf6ur@gilmour>
References: <33e01d45-c9f9-0e8c-6871-868ecd198368@huawei.com>
 <20211102084628.149070-1-heying24@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vw4qxeyln6gwbonp"
Content-Disposition: inline
In-Reply-To: <20211102084628.149070-1-heying24@huawei.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org, jernej.skrabec@gmail.com,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vw4qxeyln6gwbonp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 02, 2021 at 04:46:28AM -0400, He Ying wrote:
> From the comments of drm_for_each_connector_iter(), we know
> that "connector is only valid within the list body, if you
> want to use connector after calling drm_connector_list_iter_end()
> then you need to grab your own reference first using
> drm_connector_get()". So fix the wrong use of connector
> according to the comments and then call drm_connector_put()
> after using connector finishes.
>=20
> Signed-off-by: He Ying <heying24@huawei.com>
> ---
>=20
> V2:
>  Use proper subject prefix
>=20
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/s=
un4i_tcon.c
> index 9f06dec0fc61..24fa6784ee5f 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -47,12 +47,12 @@ static struct drm_connector *sun4i_tcon_get_connector=
(const struct drm_encoder *
>  	drm_connector_list_iter_begin(encoder->dev, &iter);
>  	drm_for_each_connector_iter(connector, &iter)
>  		if (connector->encoder =3D=3D encoder) {
> -			drm_connector_list_iter_end(&iter);
> -			return connector;
> +			drm_connector_get(connector);
> +			break;
>  		}
>  	drm_connector_list_iter_end(&iter);
> =20
> -	return NULL;
> +	return connector;

Connector might be uninitialized if we don't find one here

>  }
> =20
>  static int sun4i_tcon_get_pixel_depth(const struct drm_encoder *encoder)
> @@ -65,6 +65,7 @@ static int sun4i_tcon_get_pixel_depth(const struct drm_=
encoder *encoder)
>  		return -EINVAL;
> =20
>  	info =3D &connector->display_info;
> +	drm_connector_put(connector);
>  	if (info->num_bus_formats !=3D 1)

We're still accessing connector->display_info here, but it might have been
freed already.

Maxime

--vw4qxeyln6gwbonp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYYFTQwAKCRDj7w1vZxhR
xW5tAP4vLeRUB7hovZ/pzeMNYb3F27REbqDmaJ5hMt09+f8PEwD/cTbVT8+nLcMU
bJyX2cCnGrXIgeAL3mxTmb8Efmeypg0=
=d0nY
-----END PGP SIGNATURE-----

--vw4qxeyln6gwbonp--
