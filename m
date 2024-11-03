Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7B69BA32E
	for <lists+dri-devel@lfdr.de>; Sun,  3 Nov 2024 01:07:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3454110E324;
	Sun,  3 Nov 2024 00:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ys3YfiUQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F32810E324
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Nov 2024 00:07:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0FC78A416A8;
 Sun,  3 Nov 2024 00:05:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D47FCC4CEC3;
 Sun,  3 Nov 2024 00:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730592463;
 bh=ChWo4T7+68nQAYOyS2NBX1Z2qU0bzCHFgkn2hZZ7zEA=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=Ys3YfiUQxbF4QBTfzkP/CbBOv+ftdM4/Tv6FNxG33w5ivOjj4nEHKT7wvQ8r211qP
 wldVC+4fADm0DGu4rMjfi8MteGyDo5CIVtoCk7MucIpt6hF6YRHMkUg447GF5H4mbe
 Iz7UPNxsO7/mRMstR1KTj+YbeF00N18P5iWi3NMYFRVX2oL1oGb3DREoSPplZwzO8N
 kYGl61vgKhtegb8XlCzyql7qp3bt/AtOys0+t2xj6C/gRzwSn9CSY20UsD2WwzOJ9l
 OjAUazqyrVw9BjwNHX3UJTXun+7OhuGb60ea430frk2c520Y8GHl2a3Yz8uyd+Dlfg
 ugKfZLHg6+V8g==
Date: Sun, 3 Nov 2024 01:07:35 +0100
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>,
 Ian Rogers <irogers@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-man@vger.kernel.org, groff@gnu.org
Subject: Re: [PATCH v2 1/3] proc_pid_fdinfo.5: Reduce indent for most of the
 page
Message-ID: <20241103000735.4k6baxhjdgws6xc4@devuan>
References: <20241015211719.1152862-1-irogers@google.com>
 <20241101132437.ahn7xdgvmqamatce@devuan>
 <CAP-5=fXo5XjxUXshm9eRX-hCcC5VWOv0C5LBZ3Z0_wQb+rdnsw@mail.gmail.com>
 <20241101200729.6wgyksuwdtsms3eu@devuan>
 <20241102100837.anfonowxfx4ekn3d@illithid>
 <20241102103937.ose4y72a7yl3dcmz@devuan>
 <20241102213620.kfccilxvhihwmnld@devuan>
 <Zya6ApewCZQNEfJb@riva.ucam.org>
 <20241103000534.th3jq7umwojlxnma@devuan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="id3iypczwanvo7q7"
Content-Disposition: inline
In-Reply-To: <20241103000534.th3jq7umwojlxnma@devuan>
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


--id3iypczwanvo7q7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] proc_pid_fdinfo.5: Reduce indent for most of the
 page
MIME-Version: 1.0

On Sun, Nov 03, 2024 at 01:05:42AM +0100, Alejandro Colomar wrote:
> Hi Colin,
>=20
> On Sat, Nov 02, 2024 at 11:47:14PM +0000, Colin Watson wrote:
> > On Sat, Nov 02, 2024 at 10:36:20PM +0100, Alejandro Colomar wrote:
> > > This is quite naive, and will not work with pages that define their o=
wn
> > > stuff, since this script is not groff(1).  But it should be as fast as
> > > is possible, which is what Colin wants, is as simple as it can be (and
> > > thus relatively safe), and should work with most pages (as far as
> > > indexing is concerned, probably all?).
> >=20
> > I seem to be being invoked here for something I actually don't think I
> > want at all, which suggests that wires have been crossed somewhere.  Can
> > you explain why I'd want to replace some part of a fairly well-optimized
> > and established C program with a shell pipeline?  I'm pretty certain it
> > would not be faster, at least.
>=20
> Are you sure?  With a small tweak, I get the following comparison:
>=20
> 	alx@devuan:~/src/linux/man-pages/man-pages/main$ time lexgrog man/*/* | =
wc
> 	lexgrog: can't resolve man7/groff_man.7
> 	  12475   99295  919842
>=20
> 	real	0m6.166s
> 	user	0m5.132s
> 	sys	0m1.336s
> 	alx@devuan:~/src/linux/man-pages/man-pages/main$ time mansect NAME man/ \
> 		| groff -man -Tutf8 | wc
> 	   9830   27109  689478
>=20
> 	real	0m0.156s
> 	user	0m0.219s
> 	sys	0m0.019s
>=20
> Yes, I'm working with uncompressed pages.  We'd need to add support for
> handling compressed pages.  Also, we'd need to compare the performance
> of lexgrog(1) with compressed pages.  But for a starter, this suggests
> some good performance.
>=20
> (I say with a small tweak, because the version I've posted uses
>  xargs -L1, but I've tested for performance without the -L1, which is
>  the main bottleneck.  It has no consequences for the NAME.  I need to
>  work out some nasty details with sed -n1 for the generic version,

s/n1/n/

>  though.)
>=20
>=20
> Have a lovely night!
> Alex
>=20
> --=20
> <https://www.alejandro-colomar.es/>



--=20
<https://www.alejandro-colomar.es/>

--id3iypczwanvo7q7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmcmvscACgkQnowa+77/
2zJbGQ/9FgcaIoevJ5ZXHlvK4TZiKwtdV5o44Vw8yMsBugIcSNFTlMJ+SGMiKa3+
ljNVC/32Y123DP0W2qZnC5JDNVu4AeQDPZHV5uPy1ZHzFDBwY3i3VjgT3tkedT7G
1h3P+Xj7cYZ0YxTkoYOEY1Cx4LaD6zIHv21po4oczC+pMpufsqiGWU4DoG/+NVJy
Ak2CSczL4anbN25r80205auWWKv5vBkTLsragT4Ktf3NVYH3lXOgZkd/T5wiV70R
3UvXMeO9/91GtoRWEa//Nt7SXnrOCqJ85aSWrEBSoP2nYH+6k83cV749gsnzzfMF
BGrOMGa1q/40HWv4f5lIQay5UsvB/pCpllQhsQ37KKqCkde3wxfYN+vZ5/IgYScu
lgCRafZNQfHKEjX+smRe5PP8UCCf/zzNiW0i0C9v/MK6laYLjfo7dUGjsMTSgtb5
wF8r9s2SMnZCin3S8v5Q2TdfCoVstPYolPudpRNegt3i9T/105XbUcnE1UMRfIiu
2IqPt+nF4YO3W33wxv5CDlX576hDtd8SYv12jEq97rieYYcRxpwXBlfbWyZASYDu
Fian6kP4Wh1DZcr5dq3XNZaRo+Zv2nUYpobBhifoTVwciY3etV/CipzUIKenODhs
2ZIwHB7r7KqDJhnwL/W0YRYjVg0vVGY+Au9kGxOb2kFJiUuGNvE=
=zDHC
-----END PGP SIGNATURE-----

--id3iypczwanvo7q7--
