Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F189B87067E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 17:05:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292361122DA;
	Mon,  4 Mar 2024 16:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hPZUFFoI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B1F1122DD
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 16:05:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B908DCE13CD;
 Mon,  4 Mar 2024 16:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10655C43390;
 Mon,  4 Mar 2024 16:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709568308;
 bh=IqKjf/V5VV8UE4R3lEGBliAPiP3FkHrOso1nqZ3aCuQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hPZUFFoISF7hoNFdL4xnmd1M1+T9744bsa0ut//cI3GKpuvePacbzacYODEpQ1W5Y
 u8uGDRH9+VYz7Yjuz7BwP6ilvpq7SZZCEFpnrmpMuGisdmSPKQb7rHGkFb+Gk5KPAe
 TK6E2wMKN59TlYacTHf/3lGf/YRz4bOjxt8K9wPuFGLde3itcwuXOd7EVvbGuR6RHL
 f3DuH1pJ8n5cJtyk1kIRZJwMspexJsb9YlZ7gqCOIWWK/hAIzysux3q+Dtm+h36w9u
 zSr2MHI5200MBnykWbm823kjJdKxWD9muE7sg3HmLwFmVpBr/v0r89Sa9SW/vZ/elK
 shgUZUIvnzILg==
Date: Mon, 4 Mar 2024 17:05:05 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Guenter Roeck <groeck@google.com>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, 
 Nikolai Kondrashov <spbnick@gmail.com>, Helen Koike <helen.koike@collabora.com>,
 linuxtv-ci@linuxtv.org, 
 dave.pigott@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com,
 pawiecz@collabora.com, 
 tales.aparecida@gmail.com, workflows@vger.kernel.org, kernelci@lists.linux.dev,
 skhan@linuxfoundation.org, kunit-dev@googlegroups.com, nfraprado@collabora.com,
 davidgow@google.com, cocci@inria.fr, Julia.Lawall@inria.fr,
 laura.nao@collabora.com, 
 ricardo.canuelo@collabora.com, kernel@collabora.com, gregkh@linuxfoundation.org
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
Message-ID: <20240304-ludicrous-grinning-goldfish-090aac@houat>
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com>
 <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
 <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
 <CABXOdTeT2ip1uS2EG2w8pW7254Tnd=ZDNz-KC61-G-yqDTVgJA@mail.gmail.com>
 <20240304-rigorous-silkworm-of-awe-4eee8f@houat>
 <CABXOdTc4MXcjwgGuJb4_69-4OFELD37x0B6oMr=4z=nxZ2HPXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="thflmdlthwp7swbs"
Content-Disposition: inline
In-Reply-To: <CABXOdTc4MXcjwgGuJb4_69-4OFELD37x0B6oMr=4z=nxZ2HPXQ@mail.gmail.com>
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


--thflmdlthwp7swbs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2024 at 07:46:34AM -0800, Guenter Roeck wrote:
> On Mon, Mar 4, 2024 at 1:24=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
> [ ... ]
> >
> > If anything, it's more of a side-effect to the push for COMPILE_TEST
> > than anything.
> >
>=20
> If the drm subsystem maintainers don't want people to build it with
> COMPILE_TEST while at the same time not limiting it to platforms where
> it doesn't even build, I'd suggest making it dependent on
> !COMPILE_TEST.

I don't think we want anything. My point was that you can't have an
option that is meant to explore for bad practices and expose drivers
that don't go through the proper abstraction, and at the same time
complain that things gets broken. It's the whole point of it.

> The same applies to all other subsystems where maintainers don't want
> build tests to run but also don't want to add restrictions such as
> "64-bit only". After all, this was just one example.

We have drivers for some 32 bits platforms.

Maxime

--thflmdlthwp7swbs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZeXxMAAKCRDj7w1vZxhR
xYlQAPwIi05mGTIAHwJKG4sBeZKb2fVtGkVhOtt6zHMKVCL4UgEA4a2ngKZUqIko
YkvJr1Lsw7kRsL8JpjsPGMT6i86ACwY=
=NUWE
-----END PGP SIGNATURE-----

--thflmdlthwp7swbs--
