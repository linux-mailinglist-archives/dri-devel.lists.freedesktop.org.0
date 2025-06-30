Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4E8AEE4CC
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 18:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55BB810E4B0;
	Mon, 30 Jun 2025 16:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XWA673Ws";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BEC610E11D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 16:41:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E79B9A5353E;
 Mon, 30 Jun 2025 16:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E12C4CEE3;
 Mon, 30 Jun 2025 16:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751301700;
 bh=+fzJq5ixdgdDsnkL9zpCdV4dSmtyoicJ975neBoN5dc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XWA673WsZi/9juIWGGOo2N0P7u/VnXFY70GIwq4ILqSo0txSgrnfrhwvMbi5EuxIg
 HjEW2c/DnrBbLWdxkAOamPc82T8aeofo/G7Ne4oVWi4yLOFWVb2WkxwXmwVfrqGk8K
 6i5rj1Vi8eNFPPn5u3ilSoIxOdZUluLG4AU/WmrLd63syv+OsN4nQifQuav+99BfZ1
 3+66aCbMtVWr2QiS8fpTGd/FujkAd01dgEg8gZ8vbMP5hkYcBwFDzfd4h7U5CO2KFF
 yKI925sbdHiKwYMV+VnQVcDc/CvZuPufZ9qilMn2d+7oGQCpA9tgFJ15Jt5oW4LvUv
 InjlAXiwpavfA==
Date: Mon, 30 Jun 2025 18:41:38 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5 1/2] dt-bindings: reserved-memory: Introduce
 carved-out memory region binding
Message-ID: <20250630-attentive-fortunate-turaco-2e36d2@houat>
References: <20250617-dma-buf-ecc-heap-v5-0-0abdc5863a4f@kernel.org>
 <20250617-dma-buf-ecc-heap-v5-1-0abdc5863a4f@kernel.org>
 <20250627193132.GB4032621-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="jeexq3trpqyreenu"
Content-Disposition: inline
In-Reply-To: <20250627193132.GB4032621-robh@kernel.org>
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


--jeexq3trpqyreenu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 1/2] dt-bindings: reserved-memory: Introduce
 carved-out memory region binding
MIME-Version: 1.0

Hi Rob,

On Fri, Jun 27, 2025 at 02:31:32PM -0500, Rob Herring wrote:
> On Tue, Jun 17, 2025 at 02:25:40PM +0200, Maxime Ripard wrote:
> > Some parts of the memory can be dedicated to specific purposes and
> > exposed as a dedicated memory allocator.
> >=20
> > This is especially useful if that particular region has a particular
> > properties the rest of the memory doesn't have. For example, some
> > platforms have their entire RAM covered by ECC but for a small area
> > meant to be used by applications that don't need ECC, and its associated
> > overhead.
> >=20
> > Let's introduce a binding to describe such a region and allow the OS to
> > create a dedicated memory allocator for it.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  .../bindings/reserved-memory/carved-out.yaml       | 49 ++++++++++++++=
++++++++
> >  1 file changed, 49 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/reserved-memory/carved-o=
ut.yaml b/Documentation/devicetree/bindings/reserved-memory/carved-out.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..9ab5d1ebd9ebd9111b7c064=
fabe1c45e752da83b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/reserved-memory/carved-out.yaml
> > @@ -0,0 +1,49 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/reserved-memory/carved-out.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Carved-out Memory Region
> > +
> > +description: |
>=20
> Don't need '|'.
>=20
> > +  Specifies that the reserved memory region has been carved out of the
> > +  main memory allocator, and is intended to be used by the OS as a
> > +  dedicated memory allocator.
>=20
> Other than the commit msg, it is completely lost that this is for=20
> ECC-less memory.

Because it's not. One of the first feedback I got was that the way to
identify what a heap provides was the heap name.

So, as far as the binding go, a heap just exposes a chunk of memory the
memory allocator wouldn't use. The actual semantics of that chunk of
memory don't matter.

> This description applies to CMA area as well. So what's the difference?

Yeah, I kind of agree, which is why I initially started with a property,
and you then asked for a compatible.

CMA (assuming you mean the allocator, not the CMA heap) is still more
though: it only covers some shared-dma-pool memory regions.

> > +
> > +maintainers:
> > +  - Maxime Ripard <mripard@kernel.org>
> > +
> > +properties:
> > +  compatible:
> > +    const: carved-out
>=20
> Isn't everything in reserved-memory a carve out for some purpose. I'm=20
> not sure if I'd add 'no ECC' or more along the lines of how this is=20
> used. The latter might be useful on platforms which can't disable ECC or=
=20
> don't have ECC at all.

I don't think we need any discriminant for ECC vs non-ECC. It's just a
carved-out memory region at some offset, and the system won't use it.

Maxime

--jeexq3trpqyreenu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaGK+PQAKCRAnX84Zoj2+
dq2AAYC/J24SOTg9EyGxv1tRVE/FGgngduiiWSIJWT4SdOTb4teAfc/lr4p6puTF
EHX68lcBgJBy43wXgAeh2TO5BWA3Jm3akW90xbdFedZD8i8vgdHvFYsiZ1npib1E
ysoB3LOWSA==
=JcqH
-----END PGP SIGNATURE-----

--jeexq3trpqyreenu--
