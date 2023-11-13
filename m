Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7087E9A91
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 11:54:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC0310E343;
	Mon, 13 Nov 2023 10:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA61810E343
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 10:54:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 65DFB60DCE;
 Mon, 13 Nov 2023 10:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA02CC433C7;
 Mon, 13 Nov 2023 10:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699872842;
 bh=7KmVsixosgcu7Hg1EdfRcTZc0uujdVph/8F4c2Ho2bs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NVpFTRgIsxkszt4yAFmmTD7fsHm3KkDcVQg7fokl2cMHGRAxAHBO5jGQX5/w3yQ3X
 AoxJK76XsuoOB3wrFZ6EUF1k0EO5BbMv1vDU39Y/z0V02RQV2RjC5YA6yQoqZ8sEcW
 TtNg5rVZpHT7qRPPe9kiQdiGE9wpNEVHteK3avYIg7nL1exm8QqmxkyoX40HFg5AYU
 re/EbKa1mgl+4BtgouhVb/QAo1tfZCLig3ZWvhHbcqqCOCHgWoAEawtLBZKxqx1afe
 ZD8hdCBe/xn87H5f4JguFfmIsVZYhje1oUkjXFJ1sVVVHKOcyFeRir6qF9PugLKH0N
 u7+IVWzerR0Kw==
Date: Mon, 13 Nov 2023 11:53:59 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH 2/2] vc4: introduce DMA-BUF heap
Message-ID: <4gbqeu4e5bgahuwttiv5wxn6rmkgeyxkctxb3z5lzxipn35gm6@vuek4lebwx5g>
References: <20231109074545.148149-1-contact@emersion.fr>
 <20231109074545.148149-2-contact@emersion.fr>
 <tmsf75w3iskpvx2dxgzpk4vn7g6jpfdgdq2qv3nl5i4ocawzz4@ihcwmnq5gval>
 <bEg7cd-LFy1CzhAIao2Dt0cNFUFEb6D1ZhZN1Rec3w151EjXWpaXsOAs2MmvEPMxQjVhuE0k3qvuryxN6hJp5tJCU1b7EqSKHdTXte-UvmQ=@emersion.fr>
 <hqeyywu2pnava4hdgmjnsktsdkblia4mllrtffl5skocqm7kkx@eqtiltsn44ts>
 <oTp8iN2ODz4pEo4WpvMQ5HWhBfoPYzA4aGKhe04iKaGNo7dn1G3Uw04Nsw6ZKlflcboqsp_gPb-V6mqGCLwT-V68O6JzBYbua56bLq0H51s=@emersion.fr>
 <l72427ml6ljlbbf732pilstfavqznrtmdvz3pkn7vc5vgqxm6j@2kyg6bgjygce>
 <2pDb5-Ul5-NYArg5AkCgZg5-U26_xReMq03Y4rfPqsLur5DWRKOJQLQss27qxhUJrngcReeuXZbAzSHokMy8e2xjBJTCAeefUojHHptiBdQ=@emersion.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dekaivxwg5wrdnzi"
Content-Disposition: inline
In-Reply-To: <2pDb5-Ul5-NYArg5AkCgZg5-U26_xReMq03Y4rfPqsLur5DWRKOJQLQss27qxhUJrngcReeuXZbAzSHokMy8e2xjBJTCAeefUojHHptiBdQ=@emersion.fr>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, dri-devel@lists.freedesktop.org,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dekaivxwg5wrdnzi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 02:17:45PM +0000, Simon Ser wrote:
> On Friday, November 10th, 2023 at 15:13, Maxime Ripard <mripard@kernel.or=
g> wrote:
>=20
> > > > > We've talked with Sima at XDC about adding a symlink pointing to =
the
> > > > > DMA heap and extra metadata files describing priorities and such.
> > > > > However we don't actually need that part for the purposes of v3d =
--
> > > > > I think I'd rather defer that until more DMA heaps are plumbed
> > > > > across the DRM drivers.
> > > >=20
> > > > Honestly, I don't think we can afford to only consider vc4/v3d here=
=2E The
> > > > issue you described seem to affect any SoC with a split scanout/GPU,
> > > > which is pretty much all of them? And if they are all affected, we
> > > > should design something that fixes it once and for all.
> > >=20
> > > We don't need any sysfs stuff to fix the primary node and DRM dumb bu=
ffer
> > > issues in Mesa's kmsro/renderonly. The sysfs stuff is only required f=
or a fully
> > > generic buffer placement constraint/compatibility uAPI. Which would b=
e super
> > > useful in compositors, but let's do one step at a time.
> >=20
> > I don't think a solution that further fragments the ecosystem is worth
> > taking, sorry. What you're doing is valuable, we should totally fix the
> > issue you have, but not at the expense of making vc4 special on one of
> > the platforms it supports.
>=20
> This does not fragment the ecosystem. It moves the ecosystem bit by bit
> towards the final solution.

You can rephrase that any way you want, it moves one driver towards the
final solution, thus making it deviate from the norm and leaving the
rest behind.

Maxime

--dekaivxwg5wrdnzi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZVIARwAKCRDj7w1vZxhR
xR20AQD80snG1LHh1VpxVp60f2qdutvhMSO0f5knrUrw5VV1lwEAs9kGEWGOuKy9
Ah9PfjHQLI0oej/lmO3OmAJ0qs4PlQU=
=3GuZ
-----END PGP SIGNATURE-----

--dekaivxwg5wrdnzi--
