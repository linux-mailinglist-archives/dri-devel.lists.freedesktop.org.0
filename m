Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 754C09D9ACD
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 16:56:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2EFA10E8DD;
	Tue, 26 Nov 2024 15:56:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ojaPfyD4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1713810E8DD
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 15:56:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5BE21A40485;
 Tue, 26 Nov 2024 15:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72D06C4CECF;
 Tue, 26 Nov 2024 15:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732636571;
 bh=kTB/KTl4ktdYWAb+/ER8PbnGndEUnt+9rOdPb1VDVB8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ojaPfyD45mZzw7bRYYzS6z6V/qc/8FnHwxUF9UXNjdDCUWh6p5DY7xzT8DQ8y3Mt5
 4zoH9L+y4jZ3K8nJWKrpk7WLdlEOt4yhoh3FZUfpms2dxpASnHqM1x1vQ0XNYlO0QI
 kqfhb1l1lL9znFyAnsUuq6FiKLqD7wiI2pYr6a4cPeB7U6Vw8nLe7HzR2qpWYD7UIT
 yLX2MpoUMK97DA6zyJUXzTMnSwcg6rScabOzg3oRq4ZRY3dAJp2+Shtfywaqzj+F2H
 QyRYW2e99ODCHrlZyVaEQeY9ITf6FGdWV34wcUcoR0Gqph1/6VTaT3VQCKCiPGbT1n
 GcW9j3LwKzggw==
Date: Tue, 26 Nov 2024 16:56:08 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 2/2] drm/bridge: tc358767: Improve DPI output pixel
 clock accuracy
Message-ID: <20241126-splendid-amber-bobcat-164efa@houat>
References: <20241112020737.335297-1-marex@denx.de>
 <20241112020737.335297-2-marex@denx.de>
 <bqmcs6dtcidr6lr6r74t5vm72kjantanaq26dfipkqtsiqhacd@ngdoaqim42ck>
 <a17f2bf7-1ea3-4ba3-80a8-338623d9d888@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="cxk356jgylmlzcy7"
Content-Disposition: inline
In-Reply-To: <a17f2bf7-1ea3-4ba3-80a8-338623d9d888@denx.de>
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


--cxk356jgylmlzcy7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] drm/bridge: tc358767: Improve DPI output pixel
 clock accuracy
MIME-Version: 1.0

On Tue, Nov 26, 2024 at 12:48:20AM +0100, Marek Vasut wrote:
> On 11/22/24 2:32 PM, Dmitry Baryshkov wrote:
> > On Tue, Nov 12, 2024 at 03:05:37AM +0100, Marek Vasut wrote:
> > > The Pixel PLL is not very capable and may come up with wildly inaccur=
ate
> > > clock. Since DPI panels are often tolerant to slightly higher pixel c=
lock
> > > without being operated outside of specification, calculate two Pixel =
PLL
> > > from either mode clock or display_timing .pixelclock.max , whichever =
is
> > > higher. Since the Pixel PLL output clock frequency calculation always
> > > returns lower frequency than the requested clock frequency, passing in
> > > the higher clock frequency should result in output clock frequency wh=
ich
> > > is closer to the expected pixel clock.
> > >=20
> > > For the Chefree CH101 panel with 13 MHz Xtal input clock, the frequen=
cy
> > > without this patch is 65 MHz which is out of the panel specification =
of
> > > 68.9..73.4 MHz, while with this patch it is 71.5 MHz which is well wi=
thin
> > > the specification and far more accurate.
> >=20
> > Granted that most of the panel drivers do not implement get_timings()
> > and granted that there are no current users of that interface, I think
> > we should move away from it (and maybe even drop it completely from
> > drm_panel).
>=20
> It does fit DPI and LVDS panels and their descriptions in datasheets the
> best.
>=20
> > What about achieving the same via slightly different approach: register
> > a non-preferred mode with the clock equal to the max clock allowed. The
> > bridge driver can then use the default and the "max" mode to select PLL
> > clock.
> >=20
> > I understand that this suggestion doesn't follow the DPI panel
> > specifics, which are closer to the continuous timings rather than fixed
> > set of modes, however I really don't think that it's worth keeping the
> > interface for the sake of a single driver. Original commit 2938931f3732
> > ("drm/panel: Add display timing support") from 2014 mentions using those
> > timings for .mode_fixup(), but I couldn't find a trace of the
> > corresponding implementation.
> >=20
> > Another possible option might be to impletent adjusting modes in
> > .atomic_check() / .mode_fixup().
> Something like this ?
>=20
> static const struct display_timing chefree_ch101olhlwh_002_timing =3D {
>   .pixelclock =3D { 68900000, 71100000, 73400000 },
>   ...
> };
>=20
> static const struct panel_desc chefree_ch101olhlwh_002 =3D {
>   .timings =3D &chefree_ch101olhlwh_002_timing,
>   .num_timings =3D 1,
>   ...
> };
>=20
> ... would turn into ...
>=20
> static const struct drm_display_mode chefree_ch101olhlwh_002_mode[3] =3D {
>   {
>     .clock =3D 68900000,
>     ...
>   }, {
>     .clock =3D 71100000,
>     ...
>   }, {
>     .clock =3D 73400000,
>     ...
>   }
> };
>=20
> static const struct panel_desc chefree_ch101olhlwh_002 =3D {
>   .modes =3D &chefree_ch101olhlwh_002_mode,
>   .num_timings =3D 3,
>   ...
> };
>=20
> ?

Except that doesn't work if you want to keep your driver at the expected
framerate. To reduce the pixel clock, you also need to reduce the
blanking period within the acceptable boundaries if you want to keep the
same framerate.

Maxime

--cxk356jgylmlzcy7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0XvlwAKCRAnX84Zoj2+
dnHWAX9hMTk38EU/OZvc6nysqKt3PDwLQO9lJIqCLQPgS3JSEvLN7lW7g6Q53Ret
g/6aQ5wBfijqzfKtMtbGds8kCpcMIXLYORAOWzd3Qu9AnNMJxoxP8M3fwhSh6Sh6
5IK14qFOwQ==
=z3dZ
-----END PGP SIGNATURE-----

--cxk356jgylmlzcy7--
