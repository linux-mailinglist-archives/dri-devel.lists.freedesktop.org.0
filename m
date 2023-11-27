Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7D77FA664
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 17:29:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A0B10E1A0;
	Mon, 27 Nov 2023 16:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A28E10E1A0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 16:29:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id ED76BB8369A;
 Mon, 27 Nov 2023 16:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD38BC433C8;
 Mon, 27 Nov 2023 16:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701102562;
 bh=P7uKPy4Si6jMYdiV0VL4sw0N58VgoAw1ff3tv2+3244=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LXdwtQOF7BnXpOlbUFB89Bi1/Kb2wgfZDgIP/NF5Niu9ydpnkXFWQWKDxIYNc5nz3
 GU8X1Uy03kciMgch481+XBWKf67cuWngkaLOseWgtMlwOCphm68okTEpom47c7n5N4
 8w1JYt2EURLmxXAW35oQiFWqb1SP39fErzz2PbLXJyq9q1sGaIpCIF9+wdNCR0/MVt
 q04N1k+tCXrR6whXPcf4100JBh1nWr7FA0EMBvKW8j286EBDhfOdGVsUJjvfeBR2YY
 B8aD9GJqYiOd+r+ctcB+YTLkqdiO9In5fl38oezRAYxdj7AERlMS4ZuB0ifX3kAgOj
 GPbONkeWZU/bQ==
Date: Mon, 27 Nov 2023 17:29:19 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/2] drm/bridge: panel: Check device dependency before
 managing device link
Message-ID: <k65hxlckssjd46nsrlly6vjrr5nnkrakouzw5pmxgbf6ui3mdl@5ny7j7blkwyj>
References: <20231127051414.3783108-1-victor.liu@nxp.com>
 <CACRpkdZAtxh5muhbPKvmUQGtQogs3UhGxNZqnSGWoWQNUL7=9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ww6pvplr3hkztgem"
Content-Disposition: inline
In-Reply-To: <CACRpkdZAtxh5muhbPKvmUQGtQogs3UhGxNZqnSGWoWQNUL7=9g@mail.gmail.com>
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
Cc: sfr@canb.auug.org.au, ulf.hansson@linaro.org, jernej.skrabec@gmail.com,
 rfoss@kernel.org, tzimmermann@suse.de, rafael@kernel.org,
 Liu Ying <victor.liu@nxp.com>, gregkh@linuxfoundation.org,
 neil.armstrong@linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jonas@kwiboo.se, linux-next@vger.kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ww6pvplr3hkztgem
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 05:03:53PM +0100, Linus Walleij wrote:
> On Mon, Nov 27, 2023 at 6:10=E2=80=AFAM Liu Ying <victor.liu@nxp.com> wro=
te:
>=20
> > This series aims to check panel device dependency upon DRM device before
> > managing device link between them.  It fixes eariler patches in v6.7-rc1
> > which tried to manage the link.  Without this series, the link fails to
> > be added for dependent panel devices and hence relevant panel bridges
> > fail to be attached.  A real broken panel is "novatek,nt35510" defined
> > in arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts as reported by
> > Linus Walleij.
> >
> > Patch 1 exports device_is_dependent() to modules as needed by patch 2.
> > Patch 2 checks device dependency before managing the device link.
> >
> > Note that patch 2 is already in drm-misc/drm-misc-fixes and
> > drm-misc/for-linux-next-fixes.  Patch 1 needs to be reviewed and picked=
 up.
> >
> > v2:
> > * Introduce patch 1 to export device_is_dependent() to modules as neede=
d by
> >   patch 2.
> >
> > Liu Ying (2):
> >   driver core: Export device_is_dependent() to modules
> >   drm/bridge: panel: Check device dependency before managing device link
>=20
> I just applied patch 1 directly to the drm-misc-fixes so we don't have to
> revert and then re-apply patches, because that is a bigger evil. (We can't
> rebase these branches...)

Erm, you did wait for GKH or Rafael's ACK to do that, right?

Maxime

--ww6pvplr3hkztgem
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWTD3wAKCRDj7w1vZxhR
xevGAP4/iVJ2RG/YQlUAysxXeBnGz+ZVYH2/pWpD304wlxPcAQEA5qk/iH4bHDC5
ZVb/u/aTM589OM9H4d1Kr0Tv3Ib7TAM=
=pSsr
-----END PGP SIGNATURE-----

--ww6pvplr3hkztgem--
