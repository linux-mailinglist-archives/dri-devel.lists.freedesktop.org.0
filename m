Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 189E0788BA9
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 16:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B37010E173;
	Fri, 25 Aug 2023 14:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B1510E6AB
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 14:27:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CCB4E61B0D;
 Fri, 25 Aug 2023 14:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD22AC433C7;
 Fri, 25 Aug 2023 14:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692973666;
 bh=UksBdrJBzm/E55qDKqtkZMez6Zo0v+Z97iw2xCA3TEk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LyZP72FBnStze+r9BnWyPApB1h7vLsXBKgwj5SOM62pRh892THuUfVJmFjcSERomT
 UN2YBoMdNNbvaJGrPgGwj/Vw3PYx3amtGKZGeFHeU4Vpem/NFeFF7cH+YEazBTsx0T
 +CSPYYEMxo9j9g0eEvFJRMcu4EaFjRP5fkAGCD1a8Cy7q1dKyN1cPrpWYagRTOHfjk
 vBtgySlby3pkTX1E1zhiynTYIyxthE2T6nIwUZ6LElorgVPCr/89BkTNynwJ5IlzMx
 SAi2tjLW9N7ZtthyI733S0lREiTHCTRbSfxxXaax4/HWXYgaSie6M6emrXmt2VjGxI
 N7Zmo0VEOHb0A==
Date: Fri, 25 Aug 2023 16:27:43 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Helen Mae Koike Fornazier <helen.koike@collabora.com>
Subject: Re: [PATCH 2/6] drm: ci: Force db410c to host mode
Message-ID: <5xlfrdnutrncqdyal36222ka7qkgbtrixm3cpjk6reb7xu6zwu@nyiowsjng5k6>
References: <87pm3b2pkz.fsf@intel.com>
 <29c7-64e8b600-1-6afffd8@162524228>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uahdtp2khpso5z52"
Content-Disposition: inline
In-Reply-To: <29c7-64e8b600-1-6afffd8@162524228>
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
Cc: emma@anholt.net, linux-doc@vger.kernel.org,
 Vignesh Raman <vignesh.raman@collabora.com>, dri-devel@lists.freedesktop.org,
 jbrunet@baylibre.com, robdclark@google.com, corbet@lwn.net,
 khilman@baylibre.com, sergi.blanch.torne@collabora.com,
 david.heidelberg@collabora.com, linux-rockchip@lists.infradead.org,
 daniels@collabora.com, martin.blumenstingl@googlemail.com,
 robclark@freedesktop.org, anholt@google.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-amlogic@lists.infradead.org, gustavo.padovan@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 neil.armstrong@linaro.org, guilherme.gallo@collabora.com,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--uahdtp2khpso5z52
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Helen,

On Fri, Aug 25, 2023 at 03:09:04PM +0100, Helen Mae Koike Fornazier wrote:
> Hi Jani, thanks for your comments
>=20
> On Friday, August 25, 2023 10:56 -03, Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>=20
> > On Fri, 25 Aug 2023, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> > > Force db410c to host mode to fix network issue which results in failu=
re
> > > to mount root fs via NFS.
> > > See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8c1=
5c80a54dda510743cefd1c4b65b8
> > >
> > > Since this fix is not sent upstream, add it to build.sh script
> > > before building the kernel and dts. Better approach would be
> > > to use devicetree overlays.
> > >
> > > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > > ---
> > >  drivers/gpu/drm/ci/build.sh | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> > > index 7b014287a041..c39834bd6bd7 100644
> > > --- a/drivers/gpu/drm/ci/build.sh
> > > +++ b/drivers/gpu/drm/ci/build.sh
> > > @@ -70,6 +70,10 @@ if [ -z "$CI_MERGE_REQUEST_PROJECT_PATH" ]; then
> > >      fi
> > >  fi
> > > =20
> > > +# Force db410c to host mode to fix network issue which results in fa=
ilure to mount root fs via NFS.
> > > +# See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b=
8c15c80a54dda510743cefd1c4b65b8
> > > +sed -i '/&usb {/,/status =3D "okay";/s/status =3D "okay";/&\n\tdr_mo=
de =3D "host";/' arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> > > +
> >=20
> > It seems like a really bad idea to me to have the CI build modify the
> > source tree before building.
> >=20
> > The kernel being built will have a dirty git repo, and the localversion
> > will have -dirty in it.
>=20
> Is it bad?
>=20
> The other option was to work with device tree overlays (but we still
> need to spend some time to see how to fit it all together)

That would be much better. libfdt provides an fdtoverlay command to
merge a base device tree with an overlay.

Do that while setting up the DUT and you're done :)

Maxime

--uahdtp2khpso5z52
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZOi6XwAKCRDj7w1vZxhR
xSBKAQDfFOVdXMCZ/9a7sggeX0OzQ2xZtgSgfdTEVanD/QmKiAEAo93ffgaueCJa
HBQKGvHTkvdsjLQGuuPJdVW683tzXAU=
=kd8L
-----END PGP SIGNATURE-----

--uahdtp2khpso5z52--
