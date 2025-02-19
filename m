Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81123A3C2F8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 16:03:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0249B10E349;
	Wed, 19 Feb 2025 15:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fSidz4Hi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DDDE10E349
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 15:03:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 382F55C5AA9;
 Wed, 19 Feb 2025 15:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70775C4CED1;
 Wed, 19 Feb 2025 15:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739977422;
 bh=Ihey6bM0KEqokvaXGeRGp7RDOvBa+4Xze6lMRnn8bWw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fSidz4HiRaNXDKsQCBR8kxW69/w5fJu/gVN5czdFRmsSHU3zvJ9yo3FfHrm6Ely0X
 qFoLV182c8rBO5MYWrSvGRJl/LDllw6dTfUmHo2UcImgmFKLDPH86G7pUCWSSvcFJa
 GdHDUIz81cw9POgrq14CEojGEQ9EauJVTbjk2CdoRgGylFvnzLW20pW3e/jB5fz29w
 SVWJ5cS2EYmQXiw6iE3Nb+ZlNxb1CyiD+cGymcdMnPtZsUUF1Wg+lYW7TomNImUI4I
 hhIZFsiEycQ2m4FEOSxVFdlK+d+VDYt2OPWrtWmrInjoqUoCqvT5Uo+aWRm2wzEli0
 ZUXjkGQEzsTRA==
Date: Wed, 19 Feb 2025 15:03:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Neal Gompa <neal@gompa.dev>
Cc: Hector Martin <marcan@marcan.st>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@gmail.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, phasta@kernel.org,
 Christoph Hellwig <hch@lst.de>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 robin.murphy@arm.com, rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 David Airlie <airlied@redhat.com>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
Message-ID: <Z7XyykBB1lXJXXaf@finisterre.sirena.org.uk>
References: <2025013148-reversal-pessimism-1515@gregkh>
 <1bbdf8b7-a70b-4994-865e-7fcb8d53ebef@marcan.st>
 <20250207-prehistoric-married-dormouse-3e1aa7@lemur>
 <7742420.9J7NaK4W3v@skuld-framework>
 <d6cae188-28e5-409f-86ed-7ddf374fd354@sirena.org.uk>
 <CAEg-Je9BiTsTmaadVz7S0=Mj3PgKZSu4EnFixf+65bcbuu7+WA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="J95nyL2d79o8vBJ/"
Content-Disposition: inline
In-Reply-To: <CAEg-Je9BiTsTmaadVz7S0=Mj3PgKZSu4EnFixf+65bcbuu7+WA@mail.gmail.com>
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


--J95nyL2d79o8vBJ/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 02:10:57AM -0500, Neal Gompa wrote:
> On Mon, Feb 10, 2025 at 12:28=E2=80=AFPM Mark Brown <broonie@kernel.org> =
wrote:

> > We do actually have some people using forges already, for example the
> > SOF people do a bunch of their review on github and then turn that into
> > patch serieses which they send via the normal email route when they're
> > happy with them.  I think tree wide stuff flows in via back merges or
> > rebases, one of the benefits of delegation is that it's not my problem.
> > This all works perfectly well from my side, as far as I know it's fine
> > for the SOF people too.  It certainly doesn't seem insurmountable.

> It might be working as long as a subsystem continues to allow
> receiving patches via email. As soon as a subsystem decides to stop
> doing that (which is absolutely their right given the model of
> subsystem maintenance that the Linux project has), I think this will
> break down very quickly.

Eh, probably they'll just get bypassed for the affected patches if they
really just drop everything on the floor.  That's effectively what's
happening with SOF in that I take patches for it (which seems to work
for everyone, people do review stuff that comes in on the list).  That
tends to be what happens if people are unresponsive.  More likely
there'f be some bridging effort of some kind with pressure applied to
get substantial work done on the forge.

--J95nyL2d79o8vBJ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAme18skACgkQJNaLcl1U
h9BHtgf/Uk+Ho/XGWD8rCa0jk/SX36P4ngxCJ3LodfwMlQxRBmL1DPfN+WhjMsGI
dydDV273By4Z5rCdU7HCtoXC+bKjjUYe/OlmKmdPU3Mtx7RJBmy8c2YJbZBVmnaP
Yeg7Nsg9mIeQuyGKryPK9/aHK6Fz/4MzLoGZfUej3ykClbOHwuQPdgbdRku3i15J
K4g2toTLAT3BxX/YuU6873WfoLLeGXbYh/N4sOi9b4EMHcwLYrq2kmwPbQz3MctB
v8DKBGUv0equxwY2tPGWKwyAxhOjC81+QDZV9bBD5Qc/1xydcscsQ+qIFoTpL8rP
a+82UH6b3buQf0n/D9g6+FUfoyIJgQ==
=Ciae
-----END PGP SIGNATURE-----

--J95nyL2d79o8vBJ/--
