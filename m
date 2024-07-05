Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8708292879B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 13:14:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B522010E17A;
	Fri,  5 Jul 2024 11:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GJf2MbDa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A57910EACE
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 11:14:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A5E06CE3D74;
 Fri,  5 Jul 2024 11:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D727C116B1;
 Fri,  5 Jul 2024 11:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720178073;
 bh=eAZkOw/qCZxZNxeFa0yFFeH9CTuaDIsE82L/fWGMopk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GJf2MbDaxffscQSXaRGY7ughlmQh4Yv16eKs3TOJWFV1GD2QCVtSEneJuQ3swsBtR
 MKuB5VnI26alTPTx2QfgqJi6ytvgWi6Wu33iRMFaV1jI2x84EWIjCJaZ1u1m1dNFMn
 jCwWwhNZhaHBFvtAHkr60D+5d/Irermczagu7i8/fWlCIng6F5P+DxIp8erDghUJkI
 C8ftiwafsbTJfD9j6SjWLI9BDNy9eDWrmRTlsefQgYnmkhXv35WForeVES9g0vA8S8
 aIvWt7Ppddgro31+WhkGHo4b9uShkFUmjwSwe/9VFBx4UGGFM6Hs5mu1I/McBLmy1p
 FzJxlUCuLDyBw==
Date: Fri, 5 Jul 2024 13:14:30 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH 5/6] drm/sti: hdmi: drop driver owner assignment
Message-ID: <20240705-bustard-of-unreal-sorcery-bfc9ba@houat>
References: <20240330203831.87003-1-krzysztof.kozlowski@linaro.org>
 <20240330205722.93801-1-krzysztof.kozlowski@linaro.org>
 <20240527144700.GC713992@gnbcxd0016.gnb.st.com>
 <77b4e4ad-2b1e-4b6d-bc3b-0c7b339bc295@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eik5wfctbw4stpcc"
Content-Disposition: inline
In-Reply-To: <77b4e4ad-2b1e-4b6d-bc3b-0c7b339bc295@linaro.org>
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


--eik5wfctbw4stpcc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+Alain

On Tue, Jun 04, 2024 at 03:18:55PM GMT, Krzysztof Kozlowski wrote:
> On 27/05/2024 16:47, Alain Volmat wrote:
> > Hi Krzysztof,
> >=20
> > thanks for your patch, sorry for the delay.
> >=20
> > On Sat, Mar 30, 2024 at 09:57:21PM +0100, Krzysztof Kozlowski wrote:
> >> Core in platform_driver_register() already sets the .owner, so driver
> >> does not need to.  Whatever is set here will be anyway overwritten by
> >> main driver calling platform_driver_register().
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>
> >> I forgot two drivers.
> >>  drivers/gpu/drm/sti/sti_hdmi.c | 1 -
> >>  1 file changed, 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_=
hdmi.c
> >> index 500936d5743c..b0d84440a87b 100644
> >> --- a/drivers/gpu/drm/sti/sti_hdmi.c
> >> +++ b/drivers/gpu/drm/sti/sti_hdmi.c
> >> @@ -1485,7 +1485,6 @@ static void sti_hdmi_remove(struct platform_devi=
ce *pdev)
> >>  struct platform_driver sti_hdmi_driver =3D {
> >>  	.driver =3D {
> >>  		.name =3D "sti-hdmi",
> >> -		.owner =3D THIS_MODULE,
> >>  		.of_match_table =3D hdmi_of_match,
> >>  	},
> >>  	.probe =3D sti_hdmi_probe,
> >> --=20
> >> 2.34.1
> >>
> >=20
> > Acked-by: Alain Volmat <alain.volmat@foss.st.com>
>=20
> What does this ack mean? You are the maintainer, so what is supposed to
> happen now? If maintainer does not take patches, then the DRM STI looks
> orphaned.

The expectation would have been that Alain would have applied these
patches. That being said, your reply here dropped him from the
recipients list, so it's not surprising you didn't get any answer.

Maxime

--eik5wfctbw4stpcc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZofVlQAKCRDj7w1vZxhR
xcBvAQD+r87gp4IQXY0xaRutXeQ8CqwfsGrouFQMyDdyz/774AD9H4oxSqomDAxO
BxQKgbpctQoasdUmI3y8FQqOcpAdZgQ=
=yqMd
-----END PGP SIGNATURE-----

--eik5wfctbw4stpcc--
