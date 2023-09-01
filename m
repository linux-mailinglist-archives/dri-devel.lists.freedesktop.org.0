Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D38A578F9C0
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 10:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B09010E741;
	Fri,  1 Sep 2023 08:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B15B10E741
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 08:15:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0AB63B8250E;
 Fri,  1 Sep 2023 08:15:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ACBAC433C8;
 Fri,  1 Sep 2023 08:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693556134;
 bh=2wB7L2T/6gucMGBa8qwYTbhct0FtefKhC6NitCO5nSU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NeaTE4bwRfJq2L/Udjecu/an4nn0RHJ/41pv7GjnoPHueOWcGZ8Ai8srAevHqwCPC
 pYwNzAiCPL37qwBoxFyb0TV5ee50TMe/8nkaDfHhjQtrlsad+a4EAgn/92eegbLIAc
 aFhUgjtftnM7Lm4sn+5y4LlfoRdoFBOQO9RRN7vtNkM45D7dg056iCbVXKCPmagKdF
 QvPnxr5tNfvjKEdv1kS768E2jsGZccLNuir9Uv5XIvZzj9lma2v1biVG0nuqANG/f8
 XQe6l/2utAmUgGV6eChzWYHeWhXzuMox6EaLIjJQ8JyMtPpL5RwGlPLu8Az5DhZKif
 bY5x7lRhTjfmQ==
Date: Fri, 1 Sep 2023 10:15:31 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [RFC PATCH 04/10] drm/panel_helper: Introduce drm_panel_helper
Message-ID: <p7okuysh442hulqls3ekbaar2bguqv67fum3gsb2cj75kjvdpx@uebwlgvf46sy>
References: <20230804210644.1862287-1-dianders@chromium.org>
 <20230804140605.RFC.4.I930069a32baab6faf46d6b234f89613b5cec0f14@changeid>
 <bphkopaq76imqzut7xrx7aprqybhx3veajdympqhig2wqlix6c@64ck23rc5cv7>
 <CAD=FV=XiVkoCsjin4R74nkcd8vzOq9uPq+o5cRjd=YOoPXuQkg@mail.gmail.com>
 <lhd6ai7d6swlxhisjhikytguor7pptrymo3bmfwej4k7zqrnv4@hp2gvhw7mh3m>
 <CAD=FV=XUhzguFCC=aKzHFMV0bBnZzkHXP_tx+P=PNkVr=8SnTA@mail.gmail.com>
 <mumiep5q7x7qj7k64h3cyodxrgk737iy5rum5keguquwymf2gy@3qruwfrqjgy7>
 <CAD=FV=VEene+nr1us87iA+bomxzQ039r-E+wqvizvFGbxXjDvA@mail.gmail.com>
 <wwzbd7dt5qyimshnd7sbgkf5gxk7tq5dxtrerz76uw5p6s7tzt@cbiezkfeuqqn>
 <CAD=FV=XcUVvg5Om__dD=i9zu7ZtQmvWicms9yN7w0c2nWGhqYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yow5sxzddb743r2y"
Content-Disposition: inline
In-Reply-To: <CAD=FV=XcUVvg5Om__dD=i9zu7ZtQmvWicms9yN7w0c2nWGhqYg@mail.gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--yow5sxzddb743r2y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 11:18:49AM -0700, Doug Anderson wrote:
> Hi,
>=20
> On Thu, Aug 31, 2023 at 12:38=E2=80=AFAM Maxime Ripard <mripard@kernel.or=
g> wrote:
> >
> > If so, then I think we can implement everything by doing something like:
> >
> >   - Implement enable and disable refcounting in panels.
> >     drm_panel_prepare and drm_panel_enable would increase it,
> >     drm_panel_unprepare and drm_panel_disable would decrease it.
> >
> >   - Only actually call the disable and unprepare functions when that
> >     refcount goes to 0 in the normal case.
>=20
> Just to be clear: by refcounting do you mean switching this to actual
> refcount?

Yes

> Today this is explicitly _not_ refcounting, right? It is simply
> treating double-enables as no-ops and double-disables as no-ops. With
> our current understanding, the only thing we actually need to guard
> against is double-disable but at the moment we do guard against both.
> Specifically we believe the cases that are issues:
>=20
> a) At shutdown/remove time we want to disable the panel, but only if
> it was enabled (we wouldn't want to call disable if the panel was
> already off because userspace turned it off).

Yeah, and that's doable with refcounting too.

> b) At shutdown time we want to disable the panel but then we don't
> want to double-disable if the main DRM driver also causes us to get
> disabled.

That's what I want to prevent though. Eventually, I don't want to see
panels call drm_panel_unprepare/disable themselves. There's no need to
if all drivers implement the shutdown sequence properly.

> I'd rather keep it the way it is (prevent double-disable) and not
> switch it to a refcount.
>
> I'll also note that drm_panel currently already keeps track of the
> enabled/prepared state, so there's no "implement" step here, right?
> That's what landed in commit d2aacaf07395 ("drm/panel: Check for
> already prepared/enabled in drm_panel"). Just to remind ourselves of
> the history:
>=20
> 1. I needed to keep track of the "prepared" state anyway to make the
> "panel follower" API work properly. See drm_panel_add_follower() where
> we immediately power on a follower if the panel they're following was
> already prepared.
>=20
> 2. Since I was keeping track of the "prepared" state in the core
> anyway, it seemed like a good idea to prevent
> double-prepare/unprepare/enable/disable in the drm_panel core so that
> we could remove it from individual panels since that was always a
> point of contention in individual panels. It was asserted that, even
> in the core, we shouldn't need code to prevent
> double-prepare/unprepare/enable/disable but that as a first step
> moving this to the core and out of drivers made sense. Anyone relying
> on the core would get a warning printed out indicating that they were
> doing something wrong and this would eventually move to a WARN_ON.
>=20
> 3. While trying to remove this from the drivers we ended up realizing
> some of the issues with panels wanting to power them off at shutdown /
> remove time.

Yes, I'm aware. It's not clear to me what you're confused about though.
Is there anything I said that would conflict with that?

> >   - In drm_panel_remove, if we still have a refcount > 0, then we WARN
> >     and force unprepare/disable the panel.
>=20
> I think the net-net of this is that you're saying I should fold the
> code from this patch straight into drm_panel_remove() and add a WARN
> if it ever triggers, right?

Aside from the refcounting-or-not discussion, yes.

> In this patch series I'd remove the calls to
> drm_panel_helper_shutdown() and rely on drm_panel_remove() to do the
> power off at remove time.

Yep

> This might give a warning but, as discussed, removing a panel like
> this isn't likely to work well and at least we'd power sequence it
> properly. In some cases, I might have to move the call to
> drm_panel_remove() around a little bit but I think it'll work.

Yep

> The above solves the problem with panels wanting to power sequence
> themselves at remove() time, but not at shutdown() time. Thus we'd
> still have a dependency on having all drivers use
> drm_atomic_helper_shutdown() so that work becomes a dependency.

Does it? I think it can be done in parallel?

Maxime

--yow5sxzddb743r2y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZPGdowAKCRDj7w1vZxhR
xemMAQCjvWUe0LrT48END3QeEh8MVtJxWru6mnbP2BMN7WfgJwEA2BWDtuKGI3wD
fMqBPs+WoAgCGBEDFeSAav5VDruM8QE=
=3BUN
-----END PGP SIGNATURE-----

--yow5sxzddb743r2y--
