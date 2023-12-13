Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B747811716
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 16:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130A810E7A8;
	Wed, 13 Dec 2023 15:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83DF310E7A8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 15:34:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D6F6661DCE;
 Wed, 13 Dec 2023 15:34:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC55C433C8;
 Wed, 13 Dec 2023 15:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702481646;
 bh=PckYT1aDPXQPn2mW/WVFpuTgZ9ZzOx8rbTcZ5JEa3jE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hlAH3U92XvypnNJiLV+kSMGm+MXp9U0rQSRwkM3tSpPkTLUmjWCyGFI7/9b233xbG
 1k65bzNsm9q6aEB5+4A5jNNdOyHUbzuHGYkXC6tnn4IZLw70QEIOLvcHiQ7ree63AA
 4kdc+Xif40Vc7SCGRlhadzhUlcrinWiAwT09uPEx742kbDII+D4uo2sczNTJyCVk8F
 uMwiXrHlzLe9PGuPBpt1Vf/rDKa/YTgyT0kVRxp9BfSCw2Z0GnwjHCLOkFG4FmQMAF
 ifKE4PGZ4dPJSqdbgcQow1xILj9pZXDsnJiYAM8S+3Qjlo8qChPYxrX2uEjKySrx2m
 U28o55nIf4IuQ==
Date: Wed, 13 Dec 2023 16:34:03 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 4/4] drm/panel-edp: Add some panels with conservative
 timings
Message-ID: <cplpgkl5b3nrtdhxauleep6zo2rwic7h7fiwr4wnvrwk6uzxgw@dcgknug2gsaa>
References: <20231207081801.4049075-1-treapking@chromium.org>
 <20231207081801.4049075-5-treapking@chromium.org>
 <CAD=FV=U6M5rpQXmjC+iGf0BGtiyjRAAcMfo4Fr3pDyYVp3m4aQ@mail.gmail.com>
 <fctpvshu5ychxketsf35jfg2qzi6i3nfup5hy7r7hzmmbpd2j4@xmsik3cycjlj>
 <CAD=FV=V=K9L=bJiNvFJ+K_DHUTPxA4WtukXA+E_VW6uihE8kdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ow6beonslt3jr7qg"
Content-Disposition: inline
In-Reply-To: <CAD=FV=V=K9L=bJiNvFJ+K_DHUTPxA4WtukXA+E_VW6uihE8kdQ@mail.gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Pin-yen Lin <treapking@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Guenter Roeck <groeck@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ow6beonslt3jr7qg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2023 at 11:14:34AM -0800, Doug Anderson wrote:
> Hi,
>=20
> On Thu, Dec 7, 2023 at 10:58=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> >
> > On Thu, Dec 07, 2023 at 10:23:53AM -0800, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Thu, Dec 7, 2023 at 12:18=E2=80=AFAM Pin-yen Lin <treapking@chromi=
um.org> wrote:
> > > >
> > > > These panels are used by Mediatek MT8173 Chromebooks but we can't f=
ind
> > > > the corresponding data sheets, and these panels used to work on v4.=
19
> > > > kernel without any specified delays.
> > > >
> > > > Therefore, instead of having them use the default conservative timi=
ngs,
> > > > update them with less-conservative timings from other panels of the=
 same
> > > > vendor. The panels should still work under those timings, and we can
> > > > save some delays and suppress the warnings.
> > > >
> > > > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > > >
> > > > ---
> > > >
> > > > (no changes since v1)
> > > >
> > > >  drivers/gpu/drm/panel/panel-edp.c | 31 +++++++++++++++++++++++++++=
++++
> > > >  1 file changed, 31 insertions(+)
> > >
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > >
> > > Repeating my comments from v1 here too, since I expect this patch to
> > > sit on the lists for a little while:
> > >
> > >
> > > This is OK w/ me, but it will need time on the mailing lists before
> > > landing in case anyone else has opinions.
> >
> > Generally speaking, I'm not really a fan of big patches that dump
> > whatever ChromeOS is doing ...
> >
> > > Specifical thoughts:
> > >
> > > * I at least feel fairly confident that this is OK since these panels
> > > essentially booted without _any_ delays back on the old downstream
> > > v4.19 kernel. Presumably the panels just had fairly robust timing
> > > controllers and so worked OK, but it's better to get the timing more
> > > correct.
> >
> > ... especially since you have to rely on the recollection of engineers
> > involved at the time and you have no real way to test and make things
> > clearer anymore, and we have to take patches in that are handwavy "trust
> > us, it's doing the right thing".
> >
> > I'd really prefer to have these patches sent as they are found out.
>=20
> It's probably not clear enough from the commit message, but this isn't
> just a dump from downstream 4.19. What happened was:
>=20
> 1. Downstream chromeos-4.19 used the "little white lie" approach. They
> all claimed a specific panel's compatible string even though there
> were a whole pile of panels out there actually being used. Personally,
> this was not something I was ever a fan of (and I wasn't personally
> involved in this project), but it was the "state of the art" before
> the generic panel-edp. Getting out of the "little white lie" situation
> was why I spent so much time on the generic edp-panel solution
> upstream.
>=20
> 2. These devices have now been uprevved to a newer kernel and I
> believe that there were issues seen that necessitated a move to the
> proper generic panel-edp code.
>=20
> 3. We are now getting field reports from our warning collector about a
> whole pile of panels that are falling back to the "conservative"
> timings, which means that they turn on/off much more slowly than they
> should.
>=20
> Pin-yen made an attempt to search for panels data sheets that matched
> up with the IDs that came in from the field reports but there were
> some panels that he just couldn't find.
>=20
> So basically we're stuck. Options:
>=20
> 1. Leave customers who have these panels stuck with the hardware
> behaving worse than it used to. This is not acceptable to me.
>=20
> 2. Land Pin-yen's patch as a downstream-only patch in ChromeOS. This
> would solve the problem, but it would make me sad. If anyone ever
> wants to take these old laptops and run some other Linux distribution
> on them (and there are several that target old Chromebooks) then
> they'd be again stuck with old timings.
>=20
> 3. Land a patch like this one that at least gets us into not such a bad s=
hape.
>=20
> While I don't love this patch (and that's why I made it clear that it
> needs to spend time on the list), it seems better than the
> alternatives. Do you have a proposal for something else? If not, can
> you confirm you're OK with #3 given this explanation? ...and perhaps
> more details in the commit message?

I don't have a specific comment, it was more of a comment about the
process itself, if you write down what's above in the commit message ...

> I would also note that, hopefully, patches like this shouldn't be a
> recurring pattern. Any new Chromebooks using panel-edp will get
> flagged much earlier and we should be able to get real/proper timings
> added. I believe that we've also added a factory test so that
> (assuming it doesn't get ignored by someone) devices that aren't
> supported don't even make it out of the factory.

=2E.. and if we can expect it to be a one-off, then it's fine for me.

Thanks!
Maxime

--ow6beonslt3jr7qg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXnO6wAKCRDj7w1vZxhR
xTb3AP9WTeKpgbIAWXvk/Z+th8DCA619E9MtyXwGpCMRxsTlJAEAjMx5mNrYGiw2
AwHAnC8/wWcs2lDIpsIEK2XhQ6VJQgA=
=9Edu
-----END PGP SIGNATURE-----

--ow6beonslt3jr7qg--
