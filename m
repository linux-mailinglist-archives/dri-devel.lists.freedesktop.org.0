Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 709219079D5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A24310E22C;
	Thu, 13 Jun 2024 17:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="N6HZE6tS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2ED410E22C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 17:28:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 80B5ECE1CB1;
 Thu, 13 Jun 2024 17:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40B83C2BBFC;
 Thu, 13 Jun 2024 17:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718299709;
 bh=QDAVq3HvuBQigwxCCl2Vy0xixFerZ7QHysFs+R596bg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N6HZE6tSlcqrQhJyQ6962jv0w9Xk9FjcjJ3a1bmD4Dhd9yWyGYqA05vWrRvPiqLVg
 ekMVlrK6jcrEVbJE3gb4Oc3ldV30Y7l5uyMyMTDqSQahnGnfcEWV7DFy/INJrt3c77
 5R0ivi0EWojkyyUxxX2TADmKH5CQRWohRrC9BMOLA2P0L7QW7xEad1rym4bIFdTi+2
 AeDvYGyYL8gBuJS81ETZWaW82zrsWzuMBbs8iAqVaowFhnAVe9+nEgW4hYUK3nLQxY
 vMGtQHqT28s6J+sioji184j92x602uNqV7iEujdowMi7vszTliw+T29M3j0WHR5b5i
 zRKWQNiAbgufA==
Date: Thu, 13 Jun 2024 19:28:26 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, airlied@gmail.com, daniel@ffwll.ch, 
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, mairacanal@riseup.net, 
 hamohammed.sa@gmail.com, robdclark@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, daniels@collabora.com, helen.koike@collabora.com, 
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] drm/ci: add tests on vkms
Message-ID: <20240613-swine-of-abstract-flowers-c8d171@houat>
References: <20240611091037.558969-1-vignesh.raman@collabora.com>
 <20240613-bipedal-eccentric-locust-91632b@houat>
 <bd430442-6074-44b1-ba62-d3fa9e7bf28e@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wrwuwca5fybozgrz"
Content-Disposition: inline
In-Reply-To: <bd430442-6074-44b1-ba62-d3fa9e7bf28e@collabora.com>
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


--wrwuwca5fybozgrz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 13, 2024 at 01:56:10PM GMT, Vignesh Raman wrote:
> On 13/06/24 13:07, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Tue, Jun 11, 2024 at 02:40:37PM GMT, Vignesh Raman wrote:
> > > diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt b/drivers=
/gpu/drm/ci/xfails/vkms-none-flakes.txt
> > > new file mode 100644
> > > index 000000000000..56484a30aff5
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
> > > @@ -0,0 +1,15 @@
> > > +# Board Name: vkms
> > > +# Bug Report: https://lore.kernel.org/dri-devel/61ed26af-062c-443c-9=
df2-d1ee319f3fb0@collabora.com/T/#u
> > > +# Failure Rate: 50
> > > +# IGT Version: 1.28-g0df7b9b97
> > > +# Linux Version: 6.9.0-rc7
> > > +kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic
> > > +kms_flip@basic-flip-vs-wf_vblank
> > > +kms_flip@flip-vs-expired-vblank-interruptible
> > > +kms_flip@flip-vs-wf_vblank-interruptible
> > > +kms_flip@plain-flip-fb-recreate-interruptible
> > > +kms_flip@plain-flip-ts-check
> > > +kms_flip@plain-flip-ts-check-interruptible
> > > +kms_flip@flip-vs-absolute-wf_vblank
> > > +kms_flip@flip-vs-absolute-wf_vblank-interruptible
> > > +kms_flip@flip-vs-blocking-wf-vblank
> >=20
> > We should have the header for every line here
>=20
> All the flakes in these tests were observed with version
> 6.9.0-rc7/1.28-g0df7b9b97. So can we group them together?
>=20
> If we update this file for different IGT/kernel version, we can add a
> separate header for each test.

If we don't however, we have no way to tell in a couple months whether
those flakes were there before we were adding those metadata, or if the
metadata applies to everything, or only a subset.

Maxime

--wrwuwca5fybozgrz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZmssOgAKCRDj7w1vZxhR
xZXFAQDs7TmILk6jOoCj9+p6Lqv0MVTBsGyty3bGr7SjLRmmrwEAkvxi7aXVgAQh
mqM/wt5a7+S1t3VY6hhZBtVAz/AgOw4=
=UG46
-----END PGP SIGNATURE-----

--wrwuwca5fybozgrz--
