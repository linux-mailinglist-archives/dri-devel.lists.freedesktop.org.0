Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDB887BF85
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 16:04:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C9E10E738;
	Thu, 14 Mar 2024 15:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CW3gfuAu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71DA10FB9A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 15:04:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 11CC5CE0E49;
 Thu, 14 Mar 2024 15:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE71EC43390;
 Thu, 14 Mar 2024 15:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710428672;
 bh=6P2LfVI5ti9AMF7ok98eGXZ4p8eeBn7+IOGZj+oGtQg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CW3gfuAuCwxjr9HzOCCsYaD4IGJFlf+7m3r5gtdj73datUqZH5K4bZBIlzoHEp4EG
 s7b+oApWzWyv4SHNmiaRZPpLN9IE6ZASCQY8YpSbpCwuuQuJqir+CbpE0/DvaPl+No
 hHoGYga0Cow/amTVofqHKl2rhr8c2yfyjskaRYFZWysBegJCkyBMkZZF4Etdk6q/U8
 ioB3t+kvr34JNxjQPUGBRVpen66UVVAzXCuutuaHTTSKaEY2wsTSiQyc+DjoOYdlND
 19ABvjYS5nYdBnBRbP3g79ZIY12W006rpoU7xqqyQcEournDhY3rIKvfp1YUnGibD8
 PT8IYkHIv4iKg==
Date: Thu, 14 Mar 2024 16:04:29 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Laight <David.Laight@aculab.com>, Arnd Bergmann <arnd@arndb.de>, 
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 open list <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>, 
 Dave Airlie <airlied@redhat.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
 Ard Biesheuvel <ardb@kernel.org>
Subject: Re: arm: ERROR: modpost: "__aeabi_uldivmod"
 [drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko] undefined!
Message-ID: <20240314-thundering-steadfast-goat-a685cc@houat>
References: <CA+G9fYvG9KE15PGNoLu+SBVyShe+u5HBLQ81+kK9Zop6u=ywmw@mail.gmail.com>
 <338c89bb-a70b-4f35-b71b-f974e90e3383@app.fastmail.com>
 <20240304-brawny-goshawk-of-sorcery-860cef@houat>
 <85b807289ff2400ea5887ced63655862@AcuMS.aculab.com>
 <CAMuHMdUuOnXVpocYU02Mx3_KrPow-=+WgLJqy_ku=AN52SvQiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="myyknztutswewlxd"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUuOnXVpocYU02Mx3_KrPow-=+WgLJqy_ku=AN52SvQiA@mail.gmail.com>
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


--myyknztutswewlxd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 14, 2024 at 10:27:23AM +0100, Geert Uytterhoeven wrote:
> On Sat, Mar 9, 2024 at 3:34=E2=80=AFPM David Laight <David.Laight@aculab.=
com> wrote:
> > From: Maxime Ripard
> > > Sent: 04 March 2024 11:46
> > >
> > > On Mon, Mar 04, 2024 at 12:11:36PM +0100, Arnd Bergmann wrote:
> > > > On Mon, Mar 4, 2024, at 09:07, Naresh Kamboju wrote:
> > > > > The arm defconfig builds failed on today's Linux next tag next-20=
240304.
> > > > >
> > > > > Build log:
> > > > > ---------
> > > > > ERROR: modpost: "__aeabi_uldivmod"
> > > > > [drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko] undefined!
> > > > >
> > > >
> > > > Apparently caused by the 64-bit division in 358e76fd613a
> > > > ("drm/sun4i: hdmi: Consolidate atomic_check and mode_valid"):
> > > >
> > > >
> > > > +static enum drm_mode_status
> > > > +sun4i_hdmi_connector_clock_valid(const struct drm_connector *conne=
ctor,
> > > > +                                const struct drm_display_mode *mod=
e,
> > > > +                                unsigned long long clock)
> > > >  {
> > > > -       struct sun4i_hdmi *hdmi =3D drm_encoder_to_sun4i_hdmi(encod=
er);
> > > > -       unsigned long rate =3D mode->clock * 1000;
> > > > -       unsigned long diff =3D rate / 200; /* +-0.5% allowed by HDM=
I spec */
> > > > +       const struct sun4i_hdmi *hdmi =3D drm_connector_to_sun4i_hd=
mi(connector);
> > > > +       unsigned long diff =3D clock / 200; /* +-0.5% allowed by HD=
MI spec */
> > > >         long rounded_rate;
> > > >
> > > > This used to be a 32-bit division. If the rate is never more than
> > > > 4.2GHz, clock could be turned back into 'unsigned long' to avoid
> > > > the expensive div_u64().
> > >
> > > I sent a fix for it this morning:
> > > https://lore.kernel.org/r/20240304091225.366325-1-mripard@kernel.org
> > >
> > > The framework will pass an unsigned long long because HDMI character
> > > rates can go up to 5.9GHz.
> >
> > You could do:
> >         /* The max clock is 5.9GHz, split the divide */
> >         u32 diff =3D (u32)(clock / 8) / (200/8);
>=20
> +1, as the issue is still present in current next, as per the recent
> nagging from the build bots.

A patch to fix it has been merged today and will show up tomorrow in next.

Maxime

--myyknztutswewlxd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZfMR/QAKCRDj7w1vZxhR
xeThAP9hu9uZyhsosg4xaXjQSqrklVzWAccxuvVo+wD/BvBe5AD7BfMoiWAkmZWD
we529wvyNXrp/62iho4i01acFGaHUgA=
=x+QF
-----END PGP SIGNATURE-----

--myyknztutswewlxd--
