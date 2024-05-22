Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 894428CC1F1
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 15:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A39C10E328;
	Wed, 22 May 2024 13:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BG8iZIx9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A30010E2C8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 13:18:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 37A6B629B9;
 Wed, 22 May 2024 13:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BD6DC2BD11;
 Wed, 22 May 2024 13:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716383884;
 bh=SS8NQ2qI1N6VAQAHONvDSqaVdH40rCdkvanu7fSkmF0=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=BG8iZIx91+Ie+2UsCYkTy/GKOfYELHhEYG9HMdOpesEnWOabp0kTVznDXIVA1HeOk
 4/nStEikie+/W5UV4ZU97/qJ824apR9GTZuFG5RjJ95TP9+jUlMOtsDPv7JCdoIWet
 wZcoX7eDAn21xTdj3etJy7Dwig0uKWDBf1xQGU/rth/iGP4VpmBc+pSTzGVJ1cNVSw
 qsG/16620AK5euzv6NpNupJyY/cgPk+OTOybTXGrwJK+k13/11LELqH5b0ik0xxBF0
 s6hujDttQ9IQX3DVR7syIWfT8gIawnngFdoDvZd5jVBroroW2Q+PZkswDjPU6bBYOj
 bboTJaEGFX4FA==
Date: Wed, 22 May 2024 15:18:02 +0200
From: Maxime Ripard <mripard@kernel.org>
To: John Stultz <jstultz@google.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 0/8] dma-buf: heaps: Support carved-out heaps and ECC
 related-flags
Message-ID: <20240522-coral-fennec-from-uranus-fb7263@houat>
References: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
 <CANDhNCoOKwtpstFE2VDcUvzdXUWkZ-Zx+fz6xrdPWTyciVXMXQ@mail.gmail.com>
 <ZkXmWwmdPsqAo7VU@phenom.ffwll.local>
 <CANDhNCo5hSC-sLwdkBi3e-Ja-MzdqcGGbn-4G3XNYwCzZUwscw@mail.gmail.com>
 <ZkyOOwpM57HIiO3v@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="hjuhspbk6bfp7v2t"
Content-Disposition: inline
In-Reply-To: <ZkyOOwpM57HIiO3v@phenom.ffwll.local>
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


--hjuhspbk6bfp7v2t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 02:06:19PM GMT, Daniel Vetter wrote:
> On Thu, May 16, 2024 at 09:51:35AM -0700, John Stultz wrote:
> > On Thu, May 16, 2024 at 3:56=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch>=
 wrote:
> > > On Wed, May 15, 2024 at 11:42:58AM -0700, John Stultz wrote:
> > > > But it makes me a little nervous to add a new generic allocation fl=
ag
> > > > for a feature most hardware doesn't support (yet, at least). So it's
> > > > hard to weigh how common the actual usage will be across all the
> > > > heaps.
> > > >
> > > > I apologize as my worry is mostly born out of seeing vendors really
> > > > push opaque feature flags in their old ion heaps, so in providing a
> > > > flags argument, it was mostly intended as an escape hatch for
> > > > obviously common attributes. So having the first be something that
> > > > seems reasonable, but isn't actually that common makes me fret some.
> > > >
> > > > So again, not an objection, just something for folks to stew on to
> > > > make sure this is really the right approach.
> > >
> > > Another good reason to go with full heap names instead of opaque flag=
s on
> > > existing heaps is that with the former we can use symlinks in sysfs to
> > > specify heaps, with the latter we need a new idea. We haven't yet got=
ten
> > > around to implement this anywhere, but it's been in the dma-buf/heap =
todo
> > > since forever, and I like it as a design approach. So would be a good=
 idea
> > > to not toss it. With that display would have symlinks to cma-ecc and =
cma,
> > > and rendering maybe cma-ecc, shmem, cma heaps (in priority order) for=
 a
> > > SoC where the display needs contig memory for scanout.
> >=20
> > So indeed that is a good point to keep in mind, but I also think it
> > might re-inforce the choice of having ECC as a flag here.
> >=20
> > Since my understanding of the sysfs symlinks to heaps idea is about
> > being able to figure out a common heap from a collection of devices,
> > it's really about the ability for the driver to access the type of
> > memory. If ECC is just an attribute of the type of memory (as in this
> > patch series), it being on or off won't necessarily affect
> > compatibility of the buffer with the device.  Similarly "uncached"
> > seems more of an attribute of memory type and not a type itself.
> > Hardware that can access non-contiguous "system" buffers can access
> > uncached system buffers.
>=20
> Yeah, but in graphics there's a wide band where "shit performance" is
> defacto "not useable (as intended at least)".

Right, but "not useable" is still kind of usage dependent, which
reinforces the need for flags (and possibly some way to discover what
the heap supports).

Like, if I just want to allocate a buffer for a single writeback frame,
then I probably don't have the same requirements than a compositor that
needs to output a frame at 120Hz.

The former probably doesn't care about the buffer attributes aside that
it's accessible by the device. The latter probably can't make any kind
of compromise over what kind of memory characteristics it uses.

If we look into the current discussions we have, a compositor would
probably need a buffer without ECC, non-secure, and probably wouldn't
care about caching and being physically contiguous.

Libcamera's SoftISP would probably require that the buffer is cacheable,
non-secure, without ECC and might ask for physically contiguous buffers.

As we add more memory types / attributes, I think being able to discover
and enforce a particular set of flags will be more and more important,
even more so if we tie heaps to devices, because it just gives a hint
about the memory being reachable from the device, but as you said, you
can still get a buffer with shit performance that won't be what you
want.

> So if we limit the symlink idea to just making sure zero-copy access is
> possible, then we might not actually solve the real world problem we need
> to solve. And so the symlinks become somewhat useless, and we need to
> somewhere encode which flags you need to use with each symlink.
>=20
> But I also see the argument that there's a bit a combinatorial explosion
> possible. So I guess the question is where we want to handle it ...
>=20
> Also wondering whether we should get the symlink/allocator idea off the
> ground first, but given that that hasn't moved in a decade it might be too
> much. But then the question is, what userspace are we going to use for all
> these new heaps (or heaps with new flags)?

For ECC here, the compositors are the obvious target. Which loops backs
into the discussion with John. Do you consider dma-buf code have the
same uapi requirements as DRM?

Maxime

--hjuhspbk6bfp7v2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZk3whQAKCRAnX84Zoj2+
dqWtAYDEzyt+3FSvODb9lRG7mNxDmuod5zqt8l6YWNV4pyI1NI0RiRJM5n2Ktxtl
NQjg/b0BfRKprpRHNgDfswuVhX6aDRtUvWEDBIzM+/B02WVcs/nEEFFqbgS8OJ3g
2elrGf/LOQ==
=gNHz
-----END PGP SIGNATURE-----

--hjuhspbk6bfp7v2t--
