Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B848C3E21
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 11:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B0810E58F;
	Mon, 13 May 2024 09:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q3aIE0UI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9F010E58F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 09:30:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0272E60C68;
 Mon, 13 May 2024 09:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CBA3C32782;
 Mon, 13 May 2024 09:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715592601;
 bh=SgD0haG+Licdrhd4sV75XBEAf7AIJuM4HFLb1qTh+Yo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q3aIE0UIWqAIA8I+MAyr39jtZfjZM6dAhsRWYX9NlXVgRpSrcLpmKXzu1G+Oqn53N
 E9N9vUfOKytKJ3N4k+DiS5pA34dwHy1V9qzC17G7YA2OFPpxN22ynKvSe8GcFsdoEV
 lzwAWGW3dno95Db/dVZ7eR64cXPbcAOV1tAm6FM0JBGKiqqYtpz3BB1sgb/g74PZbT
 MKyJC+S1DO0/RMUa+ZEt7OfNXsF8DUqBb1DuHDAoLQGqN4zs7OHhPEXEgBUxfC4Rsk
 692uyI9EpObLGvVkfXNQzG6KpWtBO4wSRDNjiJbl5bvP2T+ZLhIOher3YtqFzR5Y4J
 HhjwVyt444hMA==
Date: Mon, 13 May 2024 11:29:58 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, 
 lvzhaoxiong@huaqin.corp-partner.google.com,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Hsin-Yi Wang <hsinyi@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Joel Selvaraj <jo@jsfamily.in>,
 Brian Norris <briannorris@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/9] drm/mipi-dsi: Reduce driver bloat of
 mipi_dsi_*_write_seq()
Message-ID: <20240513-solemn-yak-of-refinement-cb778a@penduick>
References: <20240508205222.2251854-1-dianders@chromium.org>
 <20240508135148.v4.4.Id15fae80582bc74a0d4f1338987fa375738f45b9@changeid>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="fdnrbzflhblyceom"
Content-Disposition: inline
In-Reply-To: <20240508135148.v4.4.Id15fae80582bc74a0d4f1338987fa375738f45b9@changeid>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fdnrbzflhblyceom
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 08, 2024 at 01:51:46PM -0700, Douglas Anderson wrote:
> Through a cooperative effort between Hsin-Yi Wang and Dmitry
> Baryshkov, we have realized the dev_err() in the
> mipi_dsi_*_write_seq() macros was causing quite a bit of bloat to the
> kernel. Let's hoist this call into drm_mipi_dsi.c by adding a "chatty"
> version of the functions that includes the print. While doing this,
> add a bit more comments to these macros making it clear that they
> print errors and also that they return out of _the caller's_ function.
>=20
> Without any changes to clients this gives a nice savings. Specifically
> the macro was inlined and thus the error report call was inlined into
> every call to mipi_dsi_dcs_write_seq() and
> mipi_dsi_generic_write_seq(). By using a call to a "chatty" function,
> the usage is reduced to one call in the chatty function and a function
> call at the invoking site.
>=20
> Building with my build system shows one example:
>=20
> $ scripts/bloat-o-meter \
>   .../before/panel-novatek-nt36672e.ko \
>   .../after/panel-novatek-nt36672e.ko
> add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-4404 (-4404)
> Function                                     old     new   delta
> nt36672e_1080x2408_60hz_init               10640    6236   -4404
> Total: Before=3D15055, After=3D10651, chg -29.25%
>=20
> Note that given the change in location of the print it's harder to
> include the "cmd" in the printout for mipi_dsi_dcs_write_seq() since,
> theoretically, someone could call the new chatty function with a
> zero-size array and it would be illegal to dereference data[0].
> There's a printk format to print the whole buffer and this is probably
> more useful for debugging anyway. Given that we're doing this for
> mipi_dsi_dcs_write_seq(), let's also print the buffer for
> mipi_dsi_generic_write_seq() in the error case.
>=20
> It should be noted that the current consensus of DRM folks is that the
> mipi_dsi_*_write_seq() should be deprecated due to the non-intuitive
> return behavior. A future patch will formally mark them as deprecated
> and provide an alternative.
>=20
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>=20
> Changes in v4:
> - Update wording as per Linus W.
>=20
> Changes in v3:
> - Rebased upon patch to remove ratelimit of prints.
>=20
> Changes in v2:
> - Add some comments to the macros about printing and returning.
> - Change the way err value is handled in prep for next patch.
> - Modify commit message now that this is part of a series.
> - Rebased upon patches to avoid theoretical int overflow.
>=20
>  drivers/gpu/drm/drm_mipi_dsi.c | 56 ++++++++++++++++++++++++++++++++++
>  include/drm/drm_mipi_dsi.h     | 47 +++++++++++++++-------------
>  2 files changed, 82 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_ds=
i.c
> index 795001bb7ff1..8593d9ed5891 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -764,6 +764,34 @@ ssize_t mipi_dsi_generic_write(struct mipi_dsi_devic=
e *dsi, const void *payload,
>  }
>  EXPORT_SYMBOL(mipi_dsi_generic_write);
> =20
> +/**
> + * mipi_dsi_generic_write_chatty() - mipi_dsi_generic_write() w/ an erro=
r log
> + * @dsi: DSI peripheral device
> + * @payload: buffer containing the payload
> + * @size: size of payload buffer
> + *
> + * Like mipi_dsi_generic_write() but includes a dev_err_ratelimited()

You mention in both functions that it's calling dev_err_ratelimited() ...

> + * call for you and returns 0 upon success, not the number of bytes sent.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
> +				  const void *payload, size_t size)
> +{
> +	struct device *dev =3D &dsi->dev;
> +	ssize_t ret;
> +
> +	ret =3D mipi_dsi_generic_write(dsi, payload, size);
> +	if (ret < 0) {
> +		dev_err(dev, "sending generic data %*ph failed: %zd\n",
> +			(int)size, payload, ret);

=2E.. but it doesn't.

Maxime

--fdnrbzflhblyceom
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZkHdlQAKCRAnX84Zoj2+
diZ2AX0ajvUjOrMjYhcEJ0oy4LnmXzL5YVKvIJSrsnbZiFstJ7Iu/29/qZDI+bj4
2hLYzgwBf0LBOJ9ls41o8vJ+Ao1IEB+FzXCnQih+aw0fAA7GW1cexEJXpPuBunqS
QQ2tpJtGdA==
=rJ0G
-----END PGP SIGNATURE-----

--fdnrbzflhblyceom--
