Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4086B91BD60
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 13:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76D810E04C;
	Fri, 28 Jun 2024 11:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WXT45DLn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A75910E04C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 11:29:21 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3636c572257so423047f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 04:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719574160; x=1720178960; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VwHyv+/nheDOEQqvCDypmg/zh1UxDN8rLzkHFy0r5dk=;
 b=WXT45DLnUCR5Vbdlpq5DrP+uW/zN9pGbV9j4Ytig7WC5taAoolrDS47G29HFaNkRdC
 y8EIeT+5s0weYTmClxFfHhKyJ1ZGZaUP3B1dlxxc4NXbn7hJLbT+aPe/l56RHOtxKwDA
 WlYDYf9Nv6lFeDtNni03VNVknwwZ6VwjOa4c8MKoSqQtr2T5XQ+wYcaNNf1Pnf5/vRju
 wQrjTHzQjOT+6WRlkPtZmt78HCbQAYIU6kgBgRXCn/tVkdczszxIJjbAMZ1rLGOnTRQT
 lypArN0oTBMlKP/OlJY786auW/TDD6ZJWekkT39D5WDgDPzs/HK7WwMrC0tsXVT8x7Vy
 SV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719574160; x=1720178960;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VwHyv+/nheDOEQqvCDypmg/zh1UxDN8rLzkHFy0r5dk=;
 b=tRA/dtbJVsJo3F+hSVKzLabkO2rK1FJwTAExwXGjY/+urR/tLHQjCxUjMAYOKMp8fQ
 Z2TSjJ8XL2bqho1z2Du3s566HKJmQmkp4ua6LRjA7/fCGma3VRhr53DNrlpX/XbGUoWj
 BVLhKudijXFLWW0it62CKmzLupDPuLdXgqrwqVXOV0nCF2iUX10Q6q+cXCB2Gs9quluf
 KbTVOOD1O/8QH3tT2JL/C+ZHrKlOA5ZpKcHB2N9eV99cvdRDDzlHuVCo/JJ+jKbvLUlM
 q+61LKeIOWBtpxLDBCoYX3nQWbIkZRxRt6fw8R6flhWAmGtd1PqaxM2YijUaaoj0A+FU
 A7OQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkuzE/AF++yYzsjpZ0EljYIv8eyxbAcEDahKBu+I7HBI4ONwLCzgf3FCCm4Ut1HfirkxmFJdKiHiYbJEfqzsJLGyYvJh8Nu7uqJosiKH8h
X-Gm-Message-State: AOJu0Yzt+D/P9akVXX4cKp9XRxDJNfIeXejWEuyu+ETHnMdp+40Mq/kw
 4+0kBQtOG4Jp8rfsGwDgIesivxWhPO/ziewbEfl3yTrZ37lNKQ7+
X-Google-Smtp-Source: AGHT+IHSIPxiCQZHyj0KQ1gk5pY4ojyWZH16385yV/UYI3N9XukgmcAnac3lAWtu5FDl9Cb+4IKZ9g==
X-Received: by 2002:adf:f450:0:b0:360:9a40:3dd8 with SMTP id
 ffacd0b85a97d-366e96567cemr12944422f8f.65.1719574159201; 
 Fri, 28 Jun 2024 04:29:19 -0700 (PDT)
Received: from orome (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b09a828sm31184325e9.37.2024.06.28.04.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 04:29:18 -0700 (PDT)
Date: Fri, 28 Jun 2024 13:29:17 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: John Stultz <jstultz@google.com>, Maxime Ripard <mripard@kernel.org>, 
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 0/8] dma-buf: heaps: Support carved-out heaps and ECC
 related-flags
Message-ID: <qy7aczeu6kumv5utemoevi7omp5ryq55zmgzxh5hrz5orf2osp@wypg66awof4n>
References: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
 <CANDhNCoOKwtpstFE2VDcUvzdXUWkZ-Zx+fz6xrdPWTyciVXMXQ@mail.gmail.com>
 <ZkXmWwmdPsqAo7VU@phenom.ffwll.local>
 <CANDhNCo5hSC-sLwdkBi3e-Ja-MzdqcGGbn-4G3XNYwCzZUwscw@mail.gmail.com>
 <ZkyOOwpM57HIiO3v@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kapzi2mpfibvyjib"
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


--kapzi2mpfibvyjib
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
>=20
> So if we limit the symlink idea to just making sure zero-copy access is
> possible, then we might not actually solve the real world problem we need
> to solve. And so the symlinks become somewhat useless, and we need to
> somewhere encode which flags you need to use with each symlink.
>=20
> But I also see the argument that there's a bit a combinatorial explosion
> possible. So I guess the question is where we want to handle it ...

Sorry for jumping into this discussion so late. But are we really
concerned about this combinatorial explosion in practice? It may be
theoretically possible to create any combination of these, but do we
expect more than a couple of heaps to exist in any given system?

Would it perhaps make more sense to let a platform override the heap
name to make it more easily identifiable? Maybe this is a naive
assumption, but aren't userspace applications and drivers not primarily
interested in the "type" of heap rather than whatever specific flags
have been set for it?

For example, if an applications wants to use a protected buffer, the
application doesn't (and shouldn't need to) care about whether the heap
for that buffer supports ECC or is backed by CMA. All it really needs to
know is that it's the system's "protected" heap.

This rather than try to represent every possible combination we
basically make this a "configuration" issue. System designers need to
settle on whatever combination of flags work for all the desired use-
cases and then we expose that combination as a named heap.

One problem that this doesn't solve is that we still don't have a way of
retrieving these flags in drivers which may need them. Perhaps one way
to address this would be to add in-kernel APIs to allocate from a heap.
That way a DRM/KMS driver (for example) could find a named heap,
allocate from it and implicitly store flags about the heap/buffer. Or
maybe we could add in-kernel API to retrieve flags, which would be a bit
better than having to expose them to userspace.

Thierry

--kapzi2mpfibvyjib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZ+nooACgkQ3SOs138+
s6E98RAAv7+i/7uJg+tq6+f8CJRlZOqAtn8prnuvk6eIf4H6fKxsN81OpDd288mJ
Xq9XkIUEjLpb/ZGcXZXqQn8lO9d5/Q8aSuFOPNmDJwNdV/XXs+gNkf9lEvs61oPa
lO3xPqP2BN7AZKwF6iVCUQ2pLcIFGbhVtJNcLkNNh0GtdH76bpHubTMGL+RoPtm6
e1ktKqwr4Z0ur56l00LBy+OQ3A38tTIMq/5XLfESeAOQbqx7gszLJOYzvh58tAS5
EYH/1c09cLk82EGjb0xb8IWvDhWn8RzCNeyX2F+gpfJsYHIWO9R/ygk+lBiMXgHx
8Ynhlb7gL7fmO0M+vx63IkvPD6YSxlqAkLU+IDs7GMzRBrwh8NPcgkfWTXRu4vYf
3r5Ere84xSZpat+ijjGDnckkMN4QeMXLn8wj0ZuaP26kjSX6R7gTKBINxm3LsivH
gGI4Ab2FlVU5dGrHmewZt79+dAiWBd6y6ks6MVVBdzSNp9DCALKMDU2yZqh+fieA
+FCuIknJvPSZFr57m89YBZ2VqgoW+SHiaUabiscvldcW8DE/1QLNa54NN/1oLaJ3
GCH34Xrl9BzuuD9Ph7Og7AoU7Y4nrB0NxgHWeMtpGTZqGvafMMZ9doVxBkHfT3z3
rfQFVdZn2sWNqJFdLwzfR9O8UmF0w/rOxi9mwriAeGVXmUjUB/I=
=6/gO
-----END PGP SIGNATURE-----

--kapzi2mpfibvyjib--
