Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EFA7538CB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 12:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0826910E878;
	Fri, 14 Jul 2023 10:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC25A10E874
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 10:51:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22F6CC0007;
 Fri, 14 Jul 2023 10:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1689331907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t+gYrFz8ZBRa8UH8sN5FRl40DmOOU+WKHIfefBRnUlY=;
 b=i8r4oSpGJ5hGUrSb7f+ZTeTVcCwFWcAU5nWZSyDv0oR2FJqhkmMxdKaXAgIsiOfooBzZ3Q
 xW9OUA1XQOiruUfCuyXJglJD0YU2tP6clnlmPXhi3mj4uoAjuMUZlBtWbF9pcVBYEX8vEr
 ayurvnod9/WCzB7swR0z4BQ55Qexurs8O5DmIbuyFpax6sQsPtE4fzM3tcuzwrvWUJ34KJ
 TWdJ/hPSgY4Rs0BBPdUO2oP30jk4t++xJtvHCQQl57OeiLBtwRWwK0aSvpVrCc6H2rNrpz
 6FYUNEJsjZqCtOvGMhQcREXToed8ZVrmyxDpANb7zrb+fkBmVHLZORL31qmPGQ==
Date: Fri, 14 Jul 2023 12:51:44 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 00/17] drm: rename various struct members "dev" -> "drm"
Message-ID: <ZLEowHzSAbtI1q6t@aptenodytes>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
 <874jm8go61.fsf@intel.com>
 <20230713103940.aeqgcbmcoqepvbax@pengutronix.de>
 <2ypl3btshoovedyyq7jaohjgmwr7egnhazuxuffbxudlljktml@syv5u27skpqr>
 <20230713141023.52dkz5ezicwev74w@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AyKvZOKeJvC7Ts0O"
Content-Disposition: inline
In-Reply-To: <20230713141023.52dkz5ezicwev74w@pengutronix.de>
X-GND-Sasl: paul.kocialkowski@bootlin.com
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>, kernel@pengutronix.de,
 Jani Nikula <jani.nikula@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Julia Lawall <julia.lawall@inria.fr>, Luben Tuikov <luben.tuikov@amd.com>,
 Sean Paul <seanpaul@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--AyKvZOKeJvC7Ts0O
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 13 Jul 23, 16:10, Uwe Kleine-K=C3=B6nig wrote:
> Hello Maxime,=20
>=20
> On Thu, Jul 13, 2023 at 01:17:43PM +0200, Maxime Ripard wrote:
> > On Thu, Jul 13, 2023 at 12:39:40PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > On Thu, Jul 13, 2023 at 12:23:50PM +0300, Jani Nikula wrote:
> > > > On Thu, 13 Jul 2023, Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutr=
onix.de> wrote:
> > > > > after most feedback for my series "drm/crtc: Rename struct drm_cr=
tc::dev
> > > > > to drm_dev"[1] was positive in principle, here comes a new series.
> > > >=20
> > > > I find it obnoxious to send a new series within 24 hours of the fir=
st,
> > > > while the discussion is still in progress, and it's a misrepresenta=
tion
> > > > of the in-progress dicussion to say most of the feedback was positi=
ve.
> > > >=20
> > > > This is not the way to reach consensus.
> > >=20
> > > Let me tell you I didn't had any obnoxious intentions when sending th=
is
> > > new series. I honestly still think that the feedback was mostly posit=
ive
> > > to the idea to get rid of struct drm_device *dev. Most discussion was
> > > about splitting the series and the right name to use instead of "dev".
> >=20
> > And then you have a former and current maintainers that tell you that
> > they'd prefer not to merge it at all.
>=20
> I went back to the previous thread rereading the replies I got yesterday
> (i.e. the ones I was aware when I started to respin the series). By then
> following people stated their opinion:
>=20
>  - Paul Kocialkowski
>    Is happy with the status quo
>    naming: drm_dev > { drmdev, drm }

Just to clarify, I am against the change (not sure this is what you meant by
happy with the status quo) but if the majority is in favor then I prefer to
have the member named drm_dev.

>  - Thomas Zimmermann
>    All data structures should be converted
>    naming: drm > *
>  - Javier Martinez Canillas
>    Generally in favour (also via irc)
>    Wants a single patch
>    naming: drm > drm_dev > dev
>  - Russell King
>    Sent a "Reviewed-by, Thanks"
>  - Christan K=C3=B6nig
>    Wants a single patch
>    naming: don't care
>  - Maxime Ripard
>    Wants a single patch
>  - Sui Jingfeng
>    no union
>    naming: { drm, ddev } > drm_dev > dev
>  - Luben Tuikov
>    Wants a single patch
>    naming: drm_dev > { drm, dev }
>  - Jani Nikula
>    unnecessary change.(is this a "no" or a "don't care"?)
>    naming: drm > *
>  - Sean Paul
>    doesn't like this change
>=20
> I admit I'm not aware about the roles here, but up to then only Sean
> Paul wrote a clear no and maybe Jani Nikula a small one. I interpreted
> Paul Kocialkowski's replay as indifferent to the renaming.

To reiterate: I am against the change, not indifferent.

Cheers,

Paul

> All others
> were in favour or only criticised details and naming.
>=20
> What did I miss (apart from today's replies which indeed are more
> negative:
>=20
>  - Thierry Reding=20
>    Agreed to Jani Nikula that this change is
>    unnecessary, also understood that for non-DRM people it might be
>    confusing.
>    naming: dev > drm > *
>  - Thomas Zimmermann
>    Agreed to Sean Paul about the too high downsides
>  - Geert Uytterhoeven
>    In favour (also before via irc)
> )?
>=20
> > Ignoring those concerns
>=20
> I'm really surprised by this suggestion. Either I really missed
> something, or I'd like to ask these maintainers to communicate in a more
> obvious way. If I send a series and I get feedback like "If you rename
> drm_crtc.dev, you should also address *all* other data structures." (by
> Thomas Zimmermann) or "When you automatically generate the patch (with
> cocci for example) I usually prefer a single patch instead." (by
> Christan K=C3=B6nig) then I would expect that if they oppose the underlyi=
ng
> idea of the series they would say so, too. I'm sorry, I cannot read a
> concern (to the underlying idea) from these replies. And so I addressed
> the feedback about the details with a new series to have an updated base
> for the discussion.
>=20
> > and then sending a new version right away is, if not obnoxious,
> > definitely aggressive.
>=20
> If this is how you experience my submission even after I tried to
> explain my real intentions, I'm sorry. And I'm sure there is a deep
> misunderstanding somewhere.
>=20
> Best regards
> Uwe
>=20
> --=20
> Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig       =
     |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |



--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--AyKvZOKeJvC7Ts0O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmSxKMAACgkQ3cLmz3+f
v9Fw3Qf/f1xSd5KeVa1Ovg4gSKEXKc0jKhVrhmqswWMqE5qiepybvEOlGMvI88Xn
Ybtcagx01qgbdnmIYziZZ3ddymk2ftdjLVnJVVHwBwU4x1KXVvtitnb7gpT7Zimi
ovHVzS9ga9bH1oZJSiRp0SgY+ZqgC3ZEW7ZxRClnSxHtPjD4vGWOfxW9RIuz2VrQ
DU2JAuTUDoqqSIUyhccGRFTd5YtnguspKiz9rnelZxDMydrTPnLt0DpqTXeyAndh
jhMCAcP6ILh83pxP4b/JJKmoC7cR1jvVcmbgHKCX3CxXNClwg0x2EAQpI3CfSkI+
8hGmgOq5MtivNDEavmPo2a8OqC4AUA==
=XBaB
-----END PGP SIGNATURE-----

--AyKvZOKeJvC7Ts0O--
