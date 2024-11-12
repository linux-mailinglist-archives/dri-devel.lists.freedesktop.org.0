Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E369C5AB2
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 15:43:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93DA10E5F8;
	Tue, 12 Nov 2024 14:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DC7CQaQg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA0110E5F8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 14:43:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 05BB0A41C73;
 Tue, 12 Nov 2024 14:41:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B8E8C4CECD;
 Tue, 12 Nov 2024 14:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731422632;
 bh=kw9PSI7QedEulYVI11SbsxMgAcTXzcxHyTmZr0prhlw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DC7CQaQgDa/xmq6/Dp004RKRisUHFKn+DWD0nrQoaF2vMnNE92V4Kuc6JNbgC3ikw
 7QaXm+DX/lMjZ80+rCopcbcH63J9vlOaWPHcWUUwfNaVmM/Cr1VYSrVT1XaaqPl7N9
 RIhzN6nRgs6jGiTfzJEnTUES/Ig9UE19L5Tb/JrYX7p6B1pG8O4eEOd4IhTj8qluyk
 2UBmQcMLDSnnslUYriREzN8Xdv0E/iAnYFx+LhM7jhcSQfKy9Y+74ByqczV+OaW973
 3xRGXKiJ32ViTI/yknpFnME5wgEETVzXieOwc+HyA0Rk2Mto1V6YDVpcBGNmMZe3Q4
 3IXrBkyhwva+w==
Date: Tue, 12 Nov 2024 14:43:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: gregkh@linuxfoundation.org, corbet@lwn.net, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Dan Williams <dan.j.williams@intel.com>, Dave Airlie <airlied@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] Documentation/CoC: spell out enforcement for
 unacceptable behaviors
Message-ID: <ZzNppQIQm6O6lnfW@finisterre.sirena.org.uk>
References: <20241108161853.12325-1-skhan@linuxfoundation.org>
 <ZzJkAJEjKidV8Fiz@phenom.ffwll.local>
 <ba3d5492-e774-452f-9fe0-e68b743c6b0d@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oEgx+arnr/c9/sI3"
Content-Disposition: inline
In-Reply-To: <ba3d5492-e774-452f-9fe0-e68b743c6b0d@linuxfoundation.org>
X-Cookie: Editing is a rewording activity.
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


--oEgx+arnr/c9/sI3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 02:50:45PM -0700, Shuah Khan wrote:
> On 11/11/24 13:07, Simona Vetter wrote:

> > Personal take, but I think a forced public apology as the primary or at
> > least initial coc enforcement approach is one of the worst.

=2E..

> This document isn't intended to be a complete summary of all actions the
> CoC takes in response to reports. There is a lot of back and forth with
> the individuals to bring about change before the CoC asks for an apology.

I guess it would be good to explicitly call out (possibly in an
incremental change on top of this one) that the specific enforcement
steps here are examples, and are mainly for cases where a more
mediation/education based approach fails or extreme cases where they're
inappropriate?  Neither the existing document nor the current change
make that explicit (at least to my reading), it's clear from for example
the reports that are sent that the existing practice is to try to use
those approaches first but I'm not sure that people would realise that
=66rom this document alone.

--oEgx+arnr/c9/sI3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmczaaUACgkQJNaLcl1U
h9BMOQf/TKO41Kx6ClF6btlwqUwS6HBy07xNmbEeSwkwwc9CzqCOcpVMRQQUYnWC
gFfzcPDfom0WWMuaL9nQ7A6+XXtCY/+1XRdaZSsYL81Hfz8d4KSSwHG61QogC0zO
SNr4eLv9QcwiZO/9qOGAxe5dZvyYKLo20uC6FBP124WDYfTrBEzp9A2sdLR9VWxn
cUxhiYhU9u6maX5UPiZFGlMN1Bco5LGg1ozWyuq+/LCYIFqhMKrsCq9JEoXcgDz2
NiYuNU/z6m3uGBY3DnKGILQ4SOEwVcEP0LIBEo7+FBWAlmGMLr0DoztAehQ81ANk
WljNMC8ltIc08UlAayo1m6SsafUM5w==
=CSNu
-----END PGP SIGNATURE-----

--oEgx+arnr/c9/sI3--
