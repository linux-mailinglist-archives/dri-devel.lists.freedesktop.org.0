Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B69A9BF0A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 08:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0312710E002;
	Fri, 25 Apr 2025 06:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BQ0zXSRz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61B310E002
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 06:58:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8029A5C4957;
 Fri, 25 Apr 2025 06:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01378C4CEE4;
 Fri, 25 Apr 2025 06:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745564318;
 bh=ZOCpgYtOjGRmmw6XMk4R1FQCrrG9Hy9EDJQTQ/uzv1Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BQ0zXSRzKxud5QbdoyrqDtmmA+RNeeCnTbdhp3plOJH1bqYru6wepkYH7g3u4FrBu
 QWbjNm2+GGGCVnFapW4QqXrvd8Z0JPPGrBpdFVzgiP8B9YWP3VDsShnLifupD/MwCq
 SU4fTv6M3dYOm5Xpm9GY5dqWTfxuYSmqCxuMxjSstmRW/c+bxBUh31ukcfHQo6pjN4
 ilbmH9kgnsEnaD8HHw3lt03NWi5bFo8stud8771nTlNsgos6gDZWkwDobO1U7PSwZ8
 YW1Ofia52UoRfh03McK2MyGe+xUcu63z4h4QxRYEUmcZAhZJG5GgJ6Tb194ytEZChi
 zL9+0cSFPG7PA==
Date: Fri, 25 Apr 2025 08:58:35 +0200
From: Maxime Ripard <mripard@kernel.org>
To: John Stultz <jstultz@google.com>
Cc: Jared Kangas <jkangas@redhat.com>, sumit.semwal@linaro.org, 
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, tjmercier@google.com, 
 christian.koenig@amd.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Give default CMA heap a fixed name
Message-ID: <20250425-savvy-chubby-alpaca-0196e3@houat>
References: <20250422191939.555963-1-jkangas@redhat.com>
 <20250422191939.555963-3-jkangas@redhat.com>
 <20250424-sassy-cunning-pillbug-ffde51@houat>
 <CANDhNCqfsUbN3aavAH5hi4wdcKuUkjLX4jqhKzy-q+jCEqpoow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="kzhh3umpacms7elx"
Content-Disposition: inline
In-Reply-To: <CANDhNCqfsUbN3aavAH5hi4wdcKuUkjLX4jqhKzy-q+jCEqpoow@mail.gmail.com>
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


--kzhh3umpacms7elx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Give default CMA heap a fixed name
MIME-Version: 1.0

On Thu, Apr 24, 2025 at 05:13:47PM -0700, John Stultz wrote:
> On Thu, Apr 24, 2025 at 1:34=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> > On Tue, Apr 22, 2025 at 12:19:39PM -0700, Jared Kangas wrote:
> > > @@ -22,6 +22,7 @@
> > >  #include <linux/slab.h>
> > >  #include <linux/vmalloc.h>
> > >
> > > +#define DEFAULT_CMA_NAME "default_cma"
> >
> > I appreciate this is kind of bikeshed-color territory, but I think "cma"
> > would be a better option here. There's nothing "default" about it.
>=20
> I disagree.  It very much is "default" as it's returning the
> dma_contiguous_default_area.

My main concern here is that it's "default" as opposed to what, exactly?
We have a single CMA allocator. We could have multiple buffer
attributes, but then "cached_cma" would make more sense to me if we
expect to have uncached CMA allocations at some point.

> There can be multiple CMA areas, and out of tree, vendors do reserve
> separate areas for specific purposes, exposing multiple CMA dmabuf
> heaps.

By "CMA areas", I guess you mean carved-out memory regions? If so, how
is it relevant to userspace if we use CMA or any other implementation to
expose a carved-out region, and thus that we carry that implemenattion
detail in the name?

> There have been patches to expose multiple CMA heaps, but with no
> upstream drivers using those purpose specific regions, we haven't
> taken them yet.
> I do hope as the drivers that utilize these purpose focused heaps go
> upstream, we can add that logic, so I think being specific that this
> is default CMA is a good idea.

If heaps names are supposed to carry the region it exposes, then it
should be default_cma_region/area. If heap names are supposed to expose
the allocator (but I don't think it's a good idea), it should be cma. If
they are meant to carry all that plus some policy,
cached_default_cma_region should be used.

Either way, default_cma seems to me either too specific or not specific
enough. And we should really document what the policy for those heaps
are supposed to be.

Maxime

--kzhh3umpacms7elx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaAsylwAKCRAnX84Zoj2+
dgz1AYDE1OlrQrJ1tqUlxdkEo+pMUFfnZtUXx7wFnBgkSsShPzQ9Spy4piXMG+a0
iIcqHaUBf26WQQpK5w5lp83mz5dNKQ/Xis/4/MLYZk3MUlxMaD37yGN5yf/Nu9aZ
Y9wYQW2MAg==
=vwbA
-----END PGP SIGNATURE-----

--kzhh3umpacms7elx--
