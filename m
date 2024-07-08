Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFB192A53C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 16:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93EB10E18E;
	Mon,  8 Jul 2024 14:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zw6/nwFU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6A010E18E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 14:57:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 253CC60E03;
 Mon,  8 Jul 2024 14:57:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AFBAC116B1;
 Mon,  8 Jul 2024 14:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720450671;
 bh=PAZ4c+iggln5lTuqb7CUlb4LeOCAXrbpkveAXt0AjF8=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=Zw6/nwFUbhxEbDWMtiBFrJMICf7eSqX5nBssURwcgOSSbMPuZWgPe4mh9cc3ldzrz
 +lmzNMmrlJtk05INWKnEpHnHCNOSZoOlmZ68olyrU7hv9C+hzUrpASACdXNA2IxEwQ
 dIBam4nezgIzF9uJIiSjXnisoabXTgWEmjx3hOs1BlzqmQKl0FTIVYKil1bnz1xBMg
 2934JlLdswygBiOGyCcAcGo/ZUXUq6UhEt55ooFPgj4A9R/ETe4zzPOPfMrbjAz7sd
 m6w+r64tIl6IpuzNJ2g8L145vS3QyzS7wiceR8i0IhKix1YUwN7m6kFQU5Xfse9l/X
 cIEkJRl5XPTNg==
Date: Mon, 8 Jul 2024 16:57:49 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philippe CORNU <philippe.cornu@foss.st.com>,
 Yannick FERTRE <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Subject: Re: [PATCH] MAINTAINERS: drm/sti: mark it as Odd Fixes
Message-ID: <20240708-industrious-paper-wombat-ef3ff3@houat>
References: <20240705100356.16760-1-krzysztof.kozlowski@linaro.org>
 <ZofW1v4uEFo9GscF@phenom.ffwll.local>
 <20240705-hysterical-beluga-of-courtesy-38b2e2@houat>
 <ff8b84c9-5bef-4cb9-a10b-b3bb1a017366@linaro.org>
 <Zof4Bp82iu7hZsSZ@phenom.ffwll.local>
 <20240705151436.GA3949471@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="wyvukfah54l5lf4w"
Content-Disposition: inline
In-Reply-To: <20240705151436.GA3949471@gnbcxd0016.gnb.st.com>
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


--wyvukfah54l5lf4w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 05, 2024 at 05:14:36PM GMT, Alain Volmat wrote:
> Hi Krzysztof, Daniel, and Maxime,
>=20
> On Fri, Jul 05, 2024 at 03:41:26PM +0200, Daniel Vetter wrote:
> > On Fri, Jul 05, 2024 at 01:33:38PM +0200, Krzysztof Kozlowski wrote:
> > > On 05/07/2024 13:22, Maxime Ripard wrote:
> > > > On Fri, Jul 05, 2024 at 01:19:50PM GMT, Daniel Vetter wrote:
> > > >> On Fri, Jul 05, 2024 at 12:03:56PM +0200, Krzysztof Kozlowski wrot=
e:
> > > >>> Patches to STI DRM are not being picked up, so even though there =
is
> > > >>> maintainer activity, it seems that these drivers are not being ac=
tively
> > > >>> looked at.  Reflect this in maintainer status.
> > > >>
> > > >> Note that since the driver is in drm-misc, other committers can al=
so pick
> > > >> up patches and push them. Both Neil and Dimtry have commit rights =
and
> > > >> should be able to pick up your patches for you, if they get stuck.
> > > >=20
> > > > I've applied the patches.
> > > >=20
> > > > I don't think we should merge this one though, a one-off mishap can=
 happen.
> > >=20
> > > Sure.
> > >=20
> > > Folks, maybe then pattern in maintainers should be somehow changed or=
 grew?
> > >=20
> > > The recommendation to all submitters is to use get_maintainers.pl. b4
> > > also does it. In this particular case, using get_maintainers.pl or b4
> > > will result in patches not being picked up.
> >=20
> > I think get_maintainers.pl is correct: You get the driver maintainer, p=
lus
> > drm-misc maintainers as official fallback, plus Dave&me as fallback of
> > last resorts. So all correct.
> >=20
> > What's special with the commit rights model is that other committers th=
at
> > work all over the subsystem can also pick up the patches for you, so th=
at
> > the drm-misc mainters don't become a bottleneck. But the ideal person
> > there are drm-misc committers who work in your team or company, or some=
one
> > else where you have some goodwill credits to spend with and ask them fo=
r a
> > favour. And there's just no way to model that and make sure the script
> > gives you the right suggestions.
>=20
> Many thanks for all your emails and your support.
>=20
> In the past, I've never committed patches to drm-misc myself and, to be h=
onest,
> missed the point that as a drm driver maintainer, I should also do so.

Are you saying you don't have a drm-misc account, or that you don't want
to participate?

> Thanks to recent discussions, I now fully understand how it should be don=
e.
>=20
> That said, since the volume of drm/sti patches is rather small, I will
> from now on request help for commit from drm/stm (Philippe, Yannick,
> and Raphael) and drm-misc maintainers in a more "pro-active" way :-)
>=20
> Sorry for the inconvenience, and once again, many thanks for your
> support.

Sorry, but the expectation is very much that you merge at least some of
the patches for the driver you maintain, and not just rely on someone
eventually picking it up.

Maxime

--wyvukfah54l5lf4w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZov+bAAKCRAnX84Zoj2+
diL3AXwIuBAi7xcjkGZQ153Jz1+xejftz98jasWr1jftxayhS/ctpyOUkD0lYym8
8ezxhfQBfR8C0yCfMlfIP6dK18szVG496HFVMBUjfZH+nrRawcV+dF1Jm1KK2znz
7dHJ2jMQyA==
=Njku
-----END PGP SIGNATURE-----

--wyvukfah54l5lf4w--
