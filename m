Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D1293D03F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 11:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 462AC10E955;
	Fri, 26 Jul 2024 09:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fN2lxhqZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C203410E955
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 09:15:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0EAE9614DC;
 Fri, 26 Jul 2024 09:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 656DEC32782;
 Fri, 26 Jul 2024 09:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721985319;
 bh=+3KipAdMkz7ouFwoVTO6+S2BvdR0gdeKjK0jxXgcjbo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fN2lxhqZMltcJSpjkLy8AERAvzZJgDp0ep4xz254tTsfSMyjfu7ENe9LwQHyt1W/p
 8EL2Q0+You1AWHiueEniRGZhfcY9UYLYOSavjINOgPsWq5/204CxiqqyMtF8OIwbOw
 F52zp7CY9SwKONNwAAa/HqolPUevOu02vsbyYzSXzB5nU6U6Q01ejsr+qwIKW7UXnX
 QDnBExtTi2/0WuBQs+OBTe//7SNU5CLv2alPzgW+WbCWVqKUsqdTaLkmFjupJYZC9i
 VTm3I5okaeD0hhuIeqQg6O/UHCa9irDtt4i8l8xX5Vjq2c/acPzRwXUb7OrCNoALkg
 o0lErYRwnOLyg==
Date: Fri, 26 Jul 2024 11:15:17 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Tejas Vipin <tejasvipin76@gmail.com>, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/mipi-dsi: Change multi functions to use quiet
 member of mipi_dsi_multi_context
Message-ID: <20240726-cerise-civet-of-reverence-ebeb9d@houat>
References: <20240724122447.284165-1-tejasvipin76@gmail.com>
 <20240724122447.284165-3-tejasvipin76@gmail.com>
 <877cdakdq9.fsf@intel.com>
 <20240725-psychedelic-benevolent-muskrat-c7fd57@houat>
 <CAD=FV=WbXdnM4or3Ae+nYoQW1Sce0jP6FWtCHShsALuEFNhiww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="brdy5362wmxxqwhw"
Content-Disposition: inline
In-Reply-To: <CAD=FV=WbXdnM4or3Ae+nYoQW1Sce0jP6FWtCHShsALuEFNhiww@mail.gmail.com>
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


--brdy5362wmxxqwhw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 25, 2024 at 10:12:46AM GMT, Doug Anderson wrote:
> On Thu, Jul 25, 2024 at 1:28=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> >
> > On Wed, Jul 24, 2024 at 06:32:14PM GMT, Jani Nikula wrote:
> > > On Wed, 24 Jul 2024, Tejas Vipin <tejasvipin76@gmail.com> wrote:
> > > > Changes all the multi functions to check if the current context req=
uires
> > > > errors to be printed or not using the quiet member.
> > > >
> > > > Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_mipi_dsi.c | 20 ++++++++++++++++++++
> > > >  1 file changed, 20 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_m=
ipi_dsi.c
> > > > index a471c46f5ca6..cbb77342d201 100644
> > > > --- a/drivers/gpu/drm/drm_mipi_dsi.c
> > > > +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> > > > @@ -814,6 +814,8 @@ void mipi_dsi_generic_write_multi(struct mipi_d=
si_multi_context *ctx,
> > > >     ret =3D mipi_dsi_generic_write(dsi, payload, size);
> > > >     if (ret < 0) {
> > > >             ctx->accum_err =3D ret;
> > > > +           if (ctx->quiet)
> > > > +                   return;
> > > >             dev_err(dev, "sending generic data %*ph failed: %d\n",
> > > >                     (int)size, payload, ctx->accum_err);
> > >
> > > A maintainability nitpick. Imagine someone wishing to add some more
> > > error handling here. Or something else after the block.
> > >
> > > IMO the dev_err() should be wrapped in if (!ctx->quiet) instead of
> > > adding an early return.
> > >
> > > Ditto everywhere.
> >
> > I'm not even sure why we need that parameter in the first place.
> >
> > Like, what's the expected use of that parameter? Is it supposed to be
> > set in users of that function?
> >
> > If so, wouldn't it prevent any sort of meaningful debugging if some
> > drivers set it and some don't?
> >
> > It looks to me like you're reimplementing drm.debug.
>=20
> I can explain how we got here and maybe you can explain how it should
> be designed differently.
>=20
> 1. The majority of MIPI panels drivers just have a pile of commands
> that need to be sent during panel init time. Each time you send a
> command it technically can fail but it's very unlikely. In order to
> make things debuggable in the unlikely case of failure, you want a
> printout about which command failed. In order to avoid massive numbers
> of printouts in each driver you want the printout in the core. This is
> the impetus behind the "_multi" functions that were introduced
> recently and I think most people who have looked at converted drivers
> are pretty pleased. The functions are readable/non-bloated but still
> check for errors and print messages in the right place.
>
> 2. As Tejas was adding more "_multi" variants things were starting to
> feel a bit awkward. Dmitry proposed [1] that maybe the answer was that
> we should work to get rid of the non-multi variants and then we don't
> need these awkward wrappers.

Makes sense to me so far

> 3. The issue with telling everyone to use the "_multi" variants is
> that they print the error message for you. While this is the correct
> default behavior and the correct behavior for the vast majority of
> users, I can imagine there being a legitimate case where a driver
> might not want error messages printed.

That's the part I disagree with actually. I don't think that message
printing is a driver's decision, but a context one. Users might want to
increase / decrease the log levels, but drivers shouldn't and just
provide a consistent behaviour there.

> I don't personally know of a case, but in my experience there's always
> some case where you're dealing with weird hardware and the driver
> knows that a command has a high chance of failure. Maybe the driver
> will retry or maybe it'll detect /handle the error, but the idea is
> that the driver wouldn't want a printout.

Then we'll address it when the time comes and we're sure what we're
actually trying to fix. And even that theoretical scenario might just
disappear when the printk threaded printing work is done.

> Said another way: I think of the errors of these MIPI initialization
> functions a lot like errors allocating memory. By default kmalloc()
> reports an error so all drivers calling kmalloc() don't need to print,
> but if your driver specifically knows that an allocation failure is
> likely and it knows how to handle it then it can pass a flag to tell
> the core kernel not to print.
>=20
>=20
> So I guess options are:
>=20
> a) Accept what Tejas is doing here as reasonable.

I don't think it's unreasonable, however I do think it's an API that has
no current users and will just lead to inconsistencies in the drivers,
without any benefit at the moment.

> b) Don't accept what Tejas is doing here and always keep the "_multi"
> functions as wrappers.
>=20
> c) Declare that, since there are no known cases where we want to
> suppress the error printouts, that suppressing the error printouts is
> a "tomorrow" problem. We transition everyone to _multi but don't
> provide a way to suppress the printouts.

That's my preferred solution.

Maxime

--brdy5362wmxxqwhw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZqNpHAAKCRAnX84Zoj2+
dlvFAX44yEW+u4GoCcKUC7TqYWqzzB3Aax+bdjws1zuvZVj8u4gTbQUAzshPV6z5
oimFS/gBgMY5MhscZDqIk+IguVW40pD1pI4nnug0O54UOzjmNvezWyWsuxx9moZy
zwYBFtCqIw==
=YWm7
-----END PGP SIGNATURE-----

--brdy5362wmxxqwhw--
