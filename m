Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 347BA416CA3
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 09:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59386EDF6;
	Fri, 24 Sep 2021 07:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE8746EDF6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 07:17:31 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mTfSX-0001C5-1y; Fri, 24 Sep 2021 09:17:25 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mTfSJ-0000Br-JT; Fri, 24 Sep 2021 09:17:11 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mTfSJ-0007OO-I4; Fri, 24 Sep 2021 09:17:11 +0200
Date: Fri, 24 Sep 2021 09:16:52 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, Doug Anderson <dianders@google.com>
Subject: Re: [PATCH v5 1/2] pwm: Introduce single-PWM of_xlate function
Message-ID: <20210924071652.skkx2jgeivg4uiht@pengutronix.de>
References: <20210924021225.846197-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="czfclota4l3jcmxr"
Content-Disposition: inline
In-Reply-To: <20210924021225.846197-1-bjorn.andersson@linaro.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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


--czfclota4l3jcmxr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 23, 2021 at 09:12:24PM -0500, Bjorn Andersson wrote:
> The existing pxa driver and the upcoming addition of PWM support in the
> TI sn565dsi86 DSI/eDP bridge driver both has a single PWM channel and
> thereby a need for a of_xlate function with the period as its single
> argument.
>=20
> Introduce a common helper function in the core that can be used as
> of_xlate by such drivers and migrate the pxa driver to use this.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>=20
> Changes since v4:
> - None
>=20
>  drivers/pwm/core.c    | 26 ++++++++++++++++++++++++++
>  drivers/pwm/pwm-pxa.c | 16 +---------------
>  include/linux/pwm.h   |  2 ++
>  3 files changed, 29 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> index 4527f09a5c50..2c6b155002a2 100644
> --- a/drivers/pwm/core.c
> +++ b/drivers/pwm/core.c
> @@ -152,6 +152,32 @@ of_pwm_xlate_with_flags(struct pwm_chip *pc, const s=
truct of_phandle_args *args)
>  }
>  EXPORT_SYMBOL_GPL(of_pwm_xlate_with_flags);
> =20
> +struct pwm_device *
> +of_pwm_single_xlate(struct pwm_chip *pc, const struct of_phandle_args *a=
rgs)
> +{
> +	struct pwm_device *pwm;
> +
> +	if (pc->of_pwm_n_cells < 1)
> +		return ERR_PTR(-EINVAL);
> +
> +	/* validate that one cell is specified, optionally with flags */
> +	if (args->args_count !=3D 1 && args->args_count !=3D 2)
> +		return ERR_PTR(-EINVAL);
> +
> +	pwm =3D pwm_request_from_chip(pc, 0, NULL);
> +	if (IS_ERR(pwm))
> +		return pwm;
> +
> +	pwm->args.period =3D args->args[0];
> +	pwm->args.polarity =3D PWM_POLARITY_NORMAL;
> +
> +	if (args->args_count =3D=3D 2 && args->args[2] & PWM_POLARITY_INVERTED)
> +		pwm->args.polarity =3D PWM_POLARITY_INVERSED;

of_pwm_xlate_with_flags is a bit more complicated. Translating
accordingly this would yield:

	if (pc->of_pwm_n_cells >=3D 2) {
		if (args->args_count > 1 && args->args[1] & PWM_POLARITY_INVERTED)
			pwm->args.polarity =3D PWM_POLARITY_INVERSED;
	}

Given that pc->of_pwm_n_cells isn't used when a phandle is parsed (in
of_pwm_get()) I think your variant is fine.

So I think technically the patch is good, for me the question is if we
want to make new drivers of_pwm_xlate_with_flags for consistency even
though this would mean that the first argument has to be 0 for all
phandles. Thierry? Lee?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--czfclota4l3jcmxr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFNe2AACgkQwfwUeK3K
7AkJigf/dCcK+ArZLHg6H2J5WGPyvuN0gQ4thd04H9zv04pknzDifSMUFGzifhEw
hScmzm52aAKcyqGxGrNXpbGd277DQxZMJV36LUTuoqfUQQ2iaZipZdt4vkSWXa50
0jSmKPKc7wvmzekUlTv83QTlARSY0oVjRVSgm4bQZR4xLwh9N0hpgEyirHXlxdQm
GQUoeeMn5mcs0hlFsD3Zqyc3YJNuoKryMbg4DGryIAkHtrwGyFFqrzQteFrZPR6D
suQ9hhKNPDoWCmu9NLCU9dEoZQpbWwUIjdDTaOkqTagYGPT+SwwN8ylZv257OOj/
g714raZN4M1l6watMBW3FlXL4VBkPw==
=Df4T
-----END PGP SIGNATURE-----

--czfclota4l3jcmxr--
