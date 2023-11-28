Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EC67FBA11
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 13:27:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8AD610E4F9;
	Tue, 28 Nov 2023 12:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06AA710E4F9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 12:27:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5E784CE1A90;
 Tue, 28 Nov 2023 12:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20155C433C7;
 Tue, 28 Nov 2023 12:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701174464;
 bh=sHN5DUzA9WDMlesWzeiZfM5tcjVwnkARW3rvZFj4VB0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dwid6/ANmSyWzankZlLq0FaeLraVTfRHxGQgU0aOg2hLP3VYUCooi5WYwXJPW6DrR
 76ZsdlCGMscQrRutkD5WvhpVd7xZ+9JI3WdPQstHCp1Rszqw+ND9pPM32I+VOOoHMG
 zMokN//59HNiKvzFUCYEw36r4DPef9SN1bCvx9pHD7mEeOQqiGwTJjn6lMdlhHsz4J
 vp9uwpiHdp10Iez0dZVdvZ9G8W2E3MT9tWGl7HZ49pUgRK+RaQjU9XmYIZYqD+wUlu
 paMVbg0oh7CHxIKk7/IQArep1kTnRl2JXEyFDblnDZUVtCqSn8LAc2tMazILkYsNvl
 UzH8hzCp7k1oA==
Date: Tue, 28 Nov 2023 13:27:42 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: (subset) [PATCH 0/3] Revert panel fixes and original buggy patch
Message-ID: <hkdisfcld7ogf2fjxyfewztirgs3vrshoaq2psbdo7qttlxjhu@nbhhij4elyp7>
References: <20231128-revert-panel-fix-v1-0-69bb05048dae@linaro.org>
 <170116632194.2250210.1478661000647719120.b4-ty@linaro.org>
 <b6d79cad-a545-48cb-a0e4-e9fdc457bec3@linaro.org>
 <CACRpkdaAFoMnjha0+yWPDhj=RGyP3tzFOq5+bp7Uv8H2bkFW1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3a7ne4j6smq2zo5r"
Content-Disposition: inline
In-Reply-To: <CACRpkdaAFoMnjha0+yWPDhj=RGyP3tzFOq5+bp7Uv8H2bkFW1w@mail.gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3a7ne4j6smq2zo5r
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 11:16:23AM +0100, Linus Walleij wrote:
> On Tue, Nov 28, 2023 at 11:13=E2=80=AFAM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
> > On 28/11/2023 11:12, Neil Armstrong wrote:
> > > Hi,
> > >
> > > On Tue, 28 Nov 2023 00:10:18 +0100, Linus Walleij wrote:
> > >> This series reverts the attempts to fix the bug that went
> > >> into v6.7-rc1 in commit 199cf07ebd2b
> > >> "drm/bridge: panel: Add a device link between drm device and panel d=
evice"
> > >> and then it reverts that patch as well.
> > >>
> > >>
> > >
> > > Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.g=
it (drm-misc-fixes)
> > >
> > > [3/3] Revert "drm/bridge: panel: Add a device link between drm device=
 and panel device"
> > >        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D9b6a59e=
5db87c2c6b3ca0391176ed4358623d5e4
> > >
> >
> > b4 got really confused that I picked the patches in the wrong order, bu=
t I applied
> > the 3 patched in the 2, 1, 3 order.
>=20
> Special mistakes requires special fixes, sorry for the mess :(
>
> Thanks a lot Neil!

Thanks to both of you for the quick handling :)

Maxime

--3a7ne4j6smq2zo5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWXcvgAKCRDj7w1vZxhR
xXf0AQDKb6cFSIUIWhbnqDwuRMw4+ApwwvI4BezyrWMCccrjggD/c3YL6vy/nhBJ
qyqVXHKmmOpoL7dVOd8icq9z7iNpkQc=
=LICq
-----END PGP SIGNATURE-----

--3a7ne4j6smq2zo5r--
