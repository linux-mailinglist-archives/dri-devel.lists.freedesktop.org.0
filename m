Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 344229D9AF0
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 17:00:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB05610E910;
	Tue, 26 Nov 2024 16:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pFrOy8cq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384D810E910
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 16:00:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3A7CA5C5696;
 Tue, 26 Nov 2024 15:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D39D3C4CECF;
 Tue, 26 Nov 2024 15:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732636800;
 bh=imHB95DEC/50M1cagmMODhIGzwCfQJa7R4uexoiTv98=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pFrOy8cqrw/b7/xYAOUywZb16AbXP6M2UZvTdkCy1SCfGbY5E7SNBMOYZ3d0azttD
 nySNqazPRfgi7ObW8xw9jVX6/jiidfQ4mt1dsef45+bBo9kgaA3sZ3bXsjZCf9c4Lb
 xbqzBlc/CY89eRz1g/sKU5C9VE+1TcUyJjcyI4tuSgFYp89DZg5i5epH6tvWS6bKSc
 kBqe9/wyVey0OltGdkWgBd0X6hWiIrVGrClJYoc/Dkw2oHFcUUEX+OLFCFpxksG6jW
 +TbMSh8VtSS08l2FQXTZQA0orKE1M/jwi8eR2Uir530acU7HHqNxh+hz2amsSnhWgb
 MUxsZWyIrPblA==
Date: Tue, 26 Nov 2024 16:59:57 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 2/2] drm/bridge: tc358767: Improve DPI output pixel
 clock accuracy
Message-ID: <20241126-malachite-sunfish-of-whirlwind-c1a9cd@houat>
References: <20241112020737.335297-1-marex@denx.de>
 <20241112020737.335297-2-marex@denx.de>
 <bqmcs6dtcidr6lr6r74t5vm72kjantanaq26dfipkqtsiqhacd@ngdoaqim42ck>
 <20241125-nondescript-grouse-of-joy-c22dbf@houat>
 <CAA8EJpqGV-Me8_wwj7nd6g3vRMxwmObNT94nMBvktYV5sxgr-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="rq2nf5z6ohqaevgq"
Content-Disposition: inline
In-Reply-To: <CAA8EJpqGV-Me8_wwj7nd6g3vRMxwmObNT94nMBvktYV5sxgr-Q@mail.gmail.com>
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


--rq2nf5z6ohqaevgq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] drm/bridge: tc358767: Improve DPI output pixel
 clock accuracy
MIME-Version: 1.0

On Tue, Nov 26, 2024 at 12:07:10AM +0200, Dmitry Baryshkov wrote:
> On Mon, 25 Nov 2024 at 15:17, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > On Fri, Nov 22, 2024 at 03:32:57PM +0200, Dmitry Baryshkov wrote:
> > > On Tue, Nov 12, 2024 at 03:05:37AM +0100, Marek Vasut wrote:
> > > > The Pixel PLL is not very capable and may come up with wildly inacc=
urate
> > > > clock. Since DPI panels are often tolerant to slightly higher pixel=
 clock
> > > > without being operated outside of specification, calculate two Pixe=
l PLL
> > > > from either mode clock or display_timing .pixelclock.max , whicheve=
r is
> > > > higher. Since the Pixel PLL output clock frequency calculation alwa=
ys
> > > > returns lower frequency than the requested clock frequency, passing=
 in
> > > > the higher clock frequency should result in output clock frequency =
which
> > > > is closer to the expected pixel clock.
> > > >
> > > > For the Chefree CH101 panel with 13 MHz Xtal input clock, the frequ=
ency
> > > > without this patch is 65 MHz which is out of the panel specificatio=
n of
> > > > 68.9..73.4 MHz, while with this patch it is 71.5 MHz which is well =
within
> > > > the specification and far more accurate.
> > >
> > > Granted that most of the panel drivers do not implement get_timings()
> > > and granted that there are no current users of that interface, I think
> > > we should move away from it (and maybe even drop it completely from
> > > drm_panel).
> >
> > I think we should do the opposite :)
> >
> > Panels usually have a pretty large operating window, and the current
> > construct only works because nobody really uses the same panels (or
> > we're hiding that behind different compatibles) across SoCs or
> > generation. Or we're working around it.
> >
> > It's kind of a mess, and it gets messy in encoders too: some will filter
> > out panel modes, some won't. Some will adjust timings to fit their
> > clocks, some won't. etc.
>=20
> Well... I think it's messy because we have so many different
> interfaces. Some encoders can poke directly into the panel, some
> drivers use bridge chains and panel bridge. Some do even a messier
> thing and try both at the same time.
> I think that in the long-term nobody should be using the drm_panel
> interface directly.

There's a few corner cases that are doable with the panel API that
aren't possible with the bridge API still. Being able to get the pixel
clock you're going to get from the encoder and adjust the timings to
match the panel tolerance is one for example, and we have a couple of
drivers doing that.

> > Going forward, switching everyone to a timing-like interface and
> > providing a set of helpers to adjust timings within possible boundaries
> > to fit a clock rate is doable and should be done imo.
>=20
> ... and then it might help with the command-mode DSI panels with DSC...

How so?

> >
> > > What about achieving the same via slightly different approach: regist=
er
> > > a non-preferred mode with the clock equal to the max clock allowed. T=
he
> > > bridge driver can then use the default and the "max" mode to select P=
LL
> > > clock.
> > >
> > > I understand that this suggestion doesn't follow the DPI panel
> > > specifics, which are closer to the continuous timings rather than fix=
ed
> > > set of modes, however I really don't think that it's worth keeping the
> > > interface for the sake of a single driver. Original commit 2938931f37=
32
> > > ("drm/panel: Add display timing support") from 2014 mentions using th=
ose
> > > timings for .mode_fixup(), but I couldn't find a trace of the
> > > corresponding implementation.
> > >
> > > Another possible option might be to impletent adjusting modes in
> > > .atomic_check() / .mode_fixup().
> >
> > It's unused because we don't have an easy API for encoders to use it. We
> > should fix *that*.
>=20
> Sounds good to me too.
> I'm not sure what it should look like though. We barely scratched our
> heads when looking at the DSC / CMD stuff, but nothing came out of it.
>=20
> Ideally... there should be some kind of get_timings being available
> through the full bridge chain, so that the encoders can use it. But
> I'm not sure how that should work, because some bridges would like to
> manipulate those timings. And some bridges will completely drop
> get_timings() and produce raw modes even after consuming the timings
> set.

the drm_display_mode -> timings conversion is fairly easy to do: just
use the same values for min, typ and max.

Maxime

--rq2nf5z6ohqaevgq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0XwfAAKCRAnX84Zoj2+
dn/vAX9/v4fdMh5F7VxnKlh6aGyP772WEI0J+t/Cs4fCJkydVR6WuCOTopVotTE+
5II5zz4BgIRby023ao3WjIjpnwu6bctakp2JYZ/V08UbI8DAViCT2EJvSXzLNPu6
jWSFKfGXuw==
=OcHu
-----END PGP SIGNATURE-----

--rq2nf5z6ohqaevgq--
