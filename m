Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF777D4CC4
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 11:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3326110E315;
	Tue, 24 Oct 2023 09:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DC310E311
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 09:42:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C18B6B82470;
 Tue, 24 Oct 2023 09:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C320FC433C8;
 Tue, 24 Oct 2023 09:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698140566;
 bh=l68jQgxyQ7WnC0tVEWykhSFNOfmDyFyuoO2fwwvBOaw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d4QeoB1ygC6PZVPIHc77DsapmNJ4r0L2VjcSkcSb2MCpXSb7nNMHy4zhni4ZLxJuO
 WdZq0TKRiXX8Zcq4qgLR6YoEUagcIZMMFWllYLPoUGev8lbnVMacf3GBGjzyjqspz7
 gPwe4ZTnTuqav4Asxws4dwAy7oMlu2wMfbU/2OFAghGdsY65qokiCOxWEiqkfNlKDL
 Zn5I6d0sBc+59x+NgYltiuIgIh5ORALS8pWtvjGUwuAYfObcUEAOTY0ubxVJEC6bEI
 L2XBYvIf5eYjv7dchsnLxA/o1DxYmSR21EnugcaQZXpLavfkQ9Cnk964AtZ0aViKgq
 CabM2Gh8HfDdQ==
Date: Mon, 23 Oct 2023 17:09:13 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH] drm/doc: ci: Require more context for flaky tests
Message-ID: <w723qfygjvfhyu2udaquqad6haea3m5adoclzxz47b2xzbuiir@mxel33ctr3bs>
References: <20231019094609.251787-1-mripard@kernel.org>
 <ba2cd566-328d-4a47-9ab8-05817c14f0bd@collabora.com>
 <b8b5def4-a178-4bfc-a7e8-1a2ebc80d7aa@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nzfaifwheyxurwjf"
Content-Disposition: inline
In-Reply-To: <b8b5def4-a178-4bfc-a7e8-1a2ebc80d7aa@collabora.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Vignesh Raman <vignesh.raman@collabora.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--nzfaifwheyxurwjf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2023 at 01:33:59AM -0300, Helen Koike wrote:
> On 19/10/2023 13:51, Helen Koike wrote:
> > On 19/10/2023 06:46, Maxime Ripard wrote:
> > > Flaky tests can be very difficult to reproduce after the facts, which
> > > will make it even harder to ever fix.
> > >=20
> > > Let's document the metadata we agreed on to provide more context to
> > > anyone trying to address these fixes.
> > >=20
> > > Link: https://lore.kernel.org/dri-devel/CAPj87rPbJ1V1-R7WMTHkDat2A4nw=
Sd61Df9mdGH2PR=3DZzxaU=3DQ@mail.gmail.com/
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > > =A0 Documentation/gpu/automated_testing.rst | 13 +++++++++++++
> > > =A0 1 file changed, 13 insertions(+)
> > >=20
> > > diff --git a/Documentation/gpu/automated_testing.rst
> > > b/Documentation/gpu/automated_testing.rst
> > > index 469b6fb65c30..2dd0e221c2c3 100644
> > > --- a/Documentation/gpu/automated_testing.rst
> > > +++ b/Documentation/gpu/automated_testing.rst
> > > @@ -67,6 +67,19 @@ Lists the tests that for a given driver on a
> > > specific hardware revision are
> > > =A0 known to behave unreliably. These tests won't cause a job to fail
> > > regardless of
> > > =A0 the result. They will still be run.
> > > +Each new flake entry must be associated with a link to a bug report =
to
> >=20
> > What do you mean by but report? Just a link to an email to the mailing
> > list is enough?
> >=20
> > Also, I had made a mistake to the first flakes lists, which I corrected
> > with https://www.spinics.net/lists/kernel/msg4959629.html (there was a
> > bug in my script which ended up erroneous adding a bunch of tests in the
> > flake list, so I cleaned them up), I would like to kind request to let
> > me add those documentation in a future patch to not block that patch
> > series.
> >=20
> > Thanks
> > Helen
> >=20
> >=20
> > > +the author of the affected driver, the board name or Device Tree nam=
e of
> > > +the board, the first kernel version affected, and an approximation of
> > > +the failure rate.
> > > +
> > > +They should be provided under the following format::
> > > +
> > > +=A0 # Bug Report: $LORE_OR_PATCHWORK_URL
>=20
> I wonder if the commit adding the test into the flakes.txt file with and
> Acked-by from the device maintainer shouldn't be already considered the B=
ug
> Report.

I guess it could, yes. I think I'd still prefer the link since it would
allow to also evaluate if the issue is fixed or not now.

> > > +=A0 # Board Name: broken-board.dtb
>=20
> Maybe Board Name isn't required, since it is already in the name of the
> file.

I have no idea how the i915 naming works, but on ARM at least the name
of the file contains the name of the SoC, not the board where it was
observed.

> > > +=A0 # Version: 6.6-rc1
> > > +=A0 # Failure Rate: 100
>=20
> Maybe also:
>=20
>   # Pipeline url:
> https://gitlab.freedesktop.org/helen.fornazier/linux/-/pipelines/1014435

Sounds like a good idea yeah :) Are those artifacts archived/deleted at
some point or do they stick around forever?

> All this info will complicated a bit the update-xfails.py script, but wel=
l,
> we can handle...
> (see https://patchwork.kernel.org/project/dri-devel/patch/20231020034124.=
136295-4-helen.koike@collabora.com/
> )
> We need to update that script to make life easier.

I guess we could just add a template for now? It would keep the script
easy and yet still hint its user that we want more data

> Vignesh sent a patch adding at least the pipeline url to the file
> https://patchwork.kernel.org/project/linux-arm-msm/patch/20231019070650.6=
1159-9-vignesh.raman@collabora.com/
> but to meet this doc that needs to be updated too.

Sure, I'll update it

Maxime

--nzfaifwheyxurwjf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZTaMmQAKCRDj7w1vZxhR
xdz1APwI42s1NvHE7/zJDrTtFBjgUgv9I+HF2vY1gSaW3tyxngEAi2jA5vAmUoGU
1NcXPZDP+43GtN7Ft3Dbz4JWmOjqjAQ=
=0Acq
-----END PGP SIGNATURE-----

--nzfaifwheyxurwjf--
