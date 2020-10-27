Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D0029C060
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 18:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAED06E201;
	Tue, 27 Oct 2020 17:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025226E201
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 17:15:03 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id h24so3309298ejg.9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 10:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+YG7zkgnx5qOXdRyIr/ZsTmXWebdIbRLlVsPyhxnzh0=;
 b=N7kyHxPUIgEJKuYr+k8G/TPQD9rHDstF4MWUPj/nxa5BZzXCIJdQlaO/rdU21fUeuO
 5y+sRG/nGgIXI+6WkDkh++EBNxEe+RsPw5WfbvxmZ8sodYGcl4fq3akQ730BAmyKg6Yz
 Qkt/UO8l8gTpgqNpzv3lfi9lYDQgApie0zF7q4RmTet8rFOaVZvjbUa88f/STICIuEEw
 vjjvSCdqEYgvFkaiiL0YcWtDyI3FlwaW0P8emkBmiwhhsk7YNtH8FlrJQWGcw7jGe3u4
 VHBzBqjsK4XiHN2euxvsCImajTt3mbIbvZ34vFH0BOYYIcrv3N3ESpwTBLbSez8kAC5p
 o/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+YG7zkgnx5qOXdRyIr/ZsTmXWebdIbRLlVsPyhxnzh0=;
 b=oItOuHSYT3Jq9KN14MUOd4qEdGu0M5kla6VRBytopTx0EJWbYGFDqfmpfbFUJIB5/7
 wOGMvX5auecP/3eh+KPKOcQfI27zMA9GrTGPQdB6x3U8l8ivq320LyKeaVMe5wHKiyKV
 PbTnA5fDkT3QxSG3lnLmyPF1MKNsoNb5JldgCq6Bp/5FeMovyKJ5A24MbeMO3qqpbKBV
 g2jr26IkMLkJ5ZMXGu3y85Y6d+QtVbbX2g9/49HiwTbW4eGZQZJzbhynKKWZHsjfXijx
 3c9phnO5955jcm1GZ6HZpIzXBFpbewZNioUGHyYQrI66LpZtZBvBSUUX16V7Pc4kbd8K
 qHSQ==
X-Gm-Message-State: AOAM533fBFfGpzVATZQHdkUksL9tQiqwnbK85VGYRtbQSj7qY++skTYG
 VegcVjd+ymQWMtGX/Ry7nfyfCsZyFno=
X-Google-Smtp-Source: ABdhPJxjC/dwhdLE7H2UIyg3mMDyMEcNrGgVg+UqAr6VcxjSSbFR4iMj+A/c1mMMOdNYFOzZGh5Rdg==
X-Received: by 2002:a17:906:bc50:: with SMTP id
 s16mr3306138ejv.275.1603818902420; 
 Tue, 27 Oct 2020 10:15:02 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id o3sm1311815edv.63.2020.10.27.10.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 10:15:00 -0700 (PDT)
Date: Tue, 27 Oct 2020 18:14:59 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/3] drm: panel: simple: Allow timing constraints, not
 fixed delays
Message-ID: <20201027171459.GA2097755@ulmo>
References: <20201027094553.1.I31c4f8b111dbef1ab658f206764655ae983bc560@changeid>
MIME-Version: 1.0
In-Reply-To: <20201027094553.1.I31c4f8b111dbef1ab658f206764655ae983bc560@changeid>
User-Agent: Mutt/1.14.7 (2020-08-29)
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
Cc: robdclark@chromium.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============0920559446=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0920559446==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Content-Disposition: inline


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2020 at 09:45:54AM -0700, Douglas Anderson wrote:
> The simple panel code currently allows panels to define fixed delays
> at certain stages of initialization.  These work OK, but they don't
> really map all that clearly to the requirements presented in many
> panel datasheets.  Instead of defining a fixed delay, those datasheets
> provide a timing diagram and specify a minimum amount of time that
> needs to pass from event A to event B.
>=20
> Because of the way things are currently defined, most panels end up
> over-delaying.  One prime example here is that a number of panels I've
> looked at define the amount of time that must pass between turning a
> panel off and turning it back on again.  Since there is no way to
> specify this, many developers have listed this as the "unprepare"
> delay.  However, if nobody ever tried to turn the panel on again in
> the next 500 ms (or whatever the delay was) then this delay was
> pointless.  It's better to do the delay only in the case that someone
> tried to turn the panel on too quickly.
>=20
> Let's support specifying delays as constraints.  We'll start with the
> one above and also a second one: the minimum time between prepare
> being done and doing the enable.  On the panel I'm looking at, there's
> an 80 ms minimum time between HPD being asserted by the panel and
> setting the backlight enable GPIO.  By specifying as a constraint we
> can enforce this without over-delaying.  Specifically the link
> training is allowed to happen in parallel with this delay so adding a
> fixed 80 ms delay isn't ideal.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>=20
>  drivers/gpu/drm/panel/panel-simple.c | 51 ++++++++++++++++++++++++----
>  1 file changed, 44 insertions(+), 7 deletions(-)

This has always been bugging me a bit about the current setup, so I very
much like this idea.

>=20
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel=
/panel-simple.c
> index 2be358fb46f7..cbbe71a2a940 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -92,6 +92,19 @@ struct panel_desc {
>  		unsigned int unprepare;
>  	} delay;
> =20
> +	/**
> +	 * @prepare_to_enable_ms: If this many milliseconds hasn't passed after
> +	 *                        prepare finished, add a delay to the start
> +	 *                        of enable.
> +	 * @unprepare_to_prepare_ms: If this many milliseconds hasn't passed
> +	 *                           unprepare finished, add a delay to the
> +	 *                           start of prepare.

I find this very difficult to understand and it's also not clear from
this what exactly the delay is. Perhaps this can be somewhat clarified
Something like the below perhaps?

	@prepare_to_enable_ms: The minimum time, in milliseconds, that
	    needs to have passed between when prepare finished and enable
	    may begin. If at enable time less time has passed since
	    prepare finished, the driver waits for the remaining time.

> +	 */
> +	struct {
> +		unsigned int prepare_to_enable_ms;
> +		unsigned int unprepare_to_prepare_ms;
> +	} timing_constraints;
> +
>  	u32 bus_format;
>  	u32 bus_flags;
>  	int connector_type;
> @@ -99,10 +112,12 @@ struct panel_desc {
> =20
>  struct panel_simple {
>  	struct drm_panel base;
> -	bool prepared;

I understand how you're trying to reuse the value of prepared_time to
replace this flag, but I find the logic very hard to understand now.

>  	bool enabled;
>  	bool no_hpd;
> =20
> +	ktime_t prepared_time;
> +	ktime_t unprepared_time;
> +
>  	const struct panel_desc *desc;
> =20
>  	struct regulator *supply;
> @@ -230,6 +245,21 @@ static int panel_simple_get_non_edid_modes(struct pa=
nel_simple *panel,
>  	return num;
>  }
> =20
> +static void panel_simple_enforce_constraint(ktime_t start_ktime,
> +					    unsigned int min_ms)
> +{
> +	ktime_t now_ktime, min_ktime;
> +
> +	if (!min_ms)
> +		return;
> +
> +	min_ktime =3D ktime_add(start_ktime, ms_to_ktime(min_ms));
> +	now_ktime =3D ktime_get();
> +
> +	if (ktime_before(now_ktime, min_ktime))
> +		msleep(ktime_to_ms(ktime_sub(min_ktime, now_ktime)) + 1);
> +}
> +
>  static int panel_simple_disable(struct drm_panel *panel)
>  {
>  	struct panel_simple *p =3D to_panel_simple(panel);
> @@ -249,18 +279,19 @@ static int panel_simple_unprepare(struct drm_panel =
*panel)
>  {
>  	struct panel_simple *p =3D to_panel_simple(panel);
> =20
> -	if (!p->prepared)
> +	if (!p->prepared_time)
>  		return 0;

Here for example I now need to actively think about what exactly
!prepared_time actually means, when all it really means is that we're
checking if the panel has already been enabled.

Perhaps we could provide a tiny helper to make this clearer?

	static inline bool panel_simple_prepared(struct drm_panel *panel)
	{
		return p->prepared_time !=3D 0;
	}

I think that clarifies what's meant here. We could even add a comment
explaining what's going on here if that's still not clear.

Actually, looking at that, I think the explicit comparison alone makes
this clearer, so this already seems better to me as well:

	if (p->prepared_time !=3D 0)
		return 0

Then again, this may just be me. If everyone else thinks this is clear
enough, feel free to leave it as-is.

Another alternative would be to leave the current flag and logic in
place and not rely on a special value for prepared_time to control the
flow. That's slightly redundant, but it's really just one flag.

>  	gpiod_set_value_cansleep(p->enable_gpio, 0);
> =20
>  	regulator_disable(p->supply);
> =20
> +	p->prepared_time =3D 0;
> +	p->unprepared_time =3D ktime_get();
> +
>  	if (p->desc->delay.unprepare)
>  		msleep(p->desc->delay.unprepare);
> =20
> -	p->prepared =3D false;
> -
>  	return 0;
>  }
> =20
> @@ -296,9 +327,12 @@ static int panel_simple_prepare(struct drm_panel *pa=
nel)
>  	int err;
>  	int hpd_asserted;
> =20
> -	if (p->prepared)
> +	if (p->prepared_time)
>  		return 0;
> =20
> +	panel_simple_enforce_constraint(p->unprepared_time,
> +					p->desc->timing_constraints.unprepare_to_prepare_ms);

Looking at this, perhaps we can come up with shorter names for these?

Thierry

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+YVY8ACgkQ3SOs138+
s6H+sw/8DDA6Ecc/I6tAbFaAHcLujardUGK42UdBGG7ZBmYY+4BYDXpLPpm6gqTe
xUKjeTmecc+029J1/XWuqLde/PsBGMDbIxPZfp0VjMbE6pkqC3KzGDMVuJVZPetP
2zuSaUOj+t3+TQJMrOhQ1IlGUWx0Sv2aoxt6IIeDWBvMtCcG0GEC9JT/qCt6K2u2
FFD98fDtvJIyx9SOKWWKMH3cIHBBFrzEuLyucjbFSrTZNxMiouGkMEDC9Mo3MYvj
hhpiedT8sIrvkgrBOXme6GptHdNAhozswNuWIKRCYWuDF3I3cMQoJ4WzG78yrwSk
aMuz6w9nIB0LmKcHP6rS8Bk2fyyx5pX3wHEQzvRwn75Zm2KB6XgU1mvWF/8mjD3f
LbBUdvXOeLeq6pcAvT6uFs0XDKjDuVd4hozl6TQ4L+c+cEa5etN1MkQWTtq45qRm
saglM9zBoTqIY++huNSRc4Sgom2X/1/3OKMojFMsnahKL39c5U6m+lW1GkgxRiMy
gQU+tA1xxvKTytJuWhc4gLPqE8uXyvUenmRsvC4aJ+NAXo40BUY9hTE+Be90iXkb
xMVcb2xBWdqoORdmByIVrETSPR/e5VGGCpLhTtHydlrZPAlOBOqOLqJA8MFx5p5G
pvriym2e5OWq/jrOskHfi/BXpXNqCvohhXZOZcb+ah4Ep9p7EbE=
=UH1U
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--

--===============0920559446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0920559446==--
