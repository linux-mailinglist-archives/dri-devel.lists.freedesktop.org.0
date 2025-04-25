Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 139AFA9C02B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 09:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E8E10E0DD;
	Fri, 25 Apr 2025 07:56:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aFvm+aax";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A66410E8A9
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 07:56:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5F2EAA4CE32;
 Fri, 25 Apr 2025 07:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7165C4CEE4;
 Fri, 25 Apr 2025 07:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745567762;
 bh=j4IKgIHjCn3GRE7rTt3jFdDFcO+dbk1ODkk477utpFw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aFvm+aaxF3u+JoObzzaMkyRFEMOy/bNPo8IN5zvVyHbQ+GmEene12EniXOH3UeGaz
 DpcXl6gcNkmX/dKLs+oW5XbfoiNM65yIbw89ZKhGUIRmAJn0k+veltDjv9FBr3rt1i
 whEvflrRZFnhTioiIY1BZKWhHAOWKbX9IElem+adgtFh8hhGD4GzU6ZgJf7UYnZwRF
 j6XS+ZApH75L9dEStr5bdb7aIAtfolVFfFYBcEuu0DD/7Wfc01rwxHOTcIyewBSJ8S
 X4T/UJ6v16LnfuFVNc4cXrQyeJgTpjv+iThgaYCrELlkxYj/OW8wK1FGT7+5eMpvyn
 SmmKeRQHLBt0A==
Date: Fri, 25 Apr 2025 09:55:59 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3 0/2] dma-buf: heaps: Support carved-out heaps
Message-ID: <20250425-refined-nano-vole-efe21e@houat>
References: <20250407-dma-buf-ecc-heap-v3-0-97cdd36a5f29@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="cnfj2vosil43ztw3"
Content-Disposition: inline
In-Reply-To: <20250407-dma-buf-ecc-heap-v3-0-97cdd36a5f29@kernel.org>
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


--cnfj2vosil43ztw3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 0/2] dma-buf: heaps: Support carved-out heaps
MIME-Version: 1.0

Hi,

On Mon, Apr 07, 2025 at 06:29:06PM +0200, Maxime Ripard wrote:
> Hi,
>=20
> This series is the follow-up of the discussion that John and I had some
> time ago here:
>=20
> https://lore.kernel.org/all/CANDhNCquJn6bH3KxKf65BWiTYLVqSd9892-xtFDHHqqy=
rroCMQ@mail.gmail.com/
>=20
> The initial problem we were discussing was that I'm currently working on
> a platform which has a memory layout with ECC enabled. However, enabling
> the ECC has a number of drawbacks on that platform: lower performance,
> increased memory usage, etc. So for things like framebuffers, the
> trade-off isn't great and thus there's a memory region with ECC disabled
> to allocate from for such use cases.
>=20
> After a suggestion from John, I chose to first start using heap
> allocations flags to allow for userspace to ask for a particular ECC
> setup. This is then backed by a new heap type that runs from reserved
> memory chunks flagged as such, and the existing DT properties to specify
> the ECC properties.
>=20
> After further discussion, it was considered that flags were not the
> right solution, and relying on the names of the heaps would be enough to
> let userspace know the kind of buffer it deals with.
>=20
> Thus, even though the uAPI part of it has been dropped in this second
> version, we still need a driver to create heaps out of carved-out memory
> regions. In addition to the original usecase, a similar driver can be
> found in BSPs from most vendors, so I believe it would be a useful
> addition to the kernel.
>=20
> I submitted a draft PR to the DT schema for the bindings used in this
> PR:
> https://github.com/devicetree-org/dt-schema/pull/138

One thing the discussion about the CMA heap naming[1] with John made me
realize is that if we have both a region that is exported as a
carved-out heap, and with devices pointing to it with reserved-memory,
we wouldn't use the same allocator in both cases.

It looks like we have four cases:

  - We have a shared-dma-pool region with the reusable property: the
    region is registered as a CMA area, the devices will allocate from
    that.

  - We have a shared-dma-pool region without the reusable property: the
    region is registered as a coherent DMA area, and the devices will
    allocate from that pool.

  - We have a restricted-dma-pool region, devices will allocate from
    swiotlb

  - We have any other region, we can do whatever.

So, the driver only supports the fourth case, and should be
significantly more complicated.

I'll work on that.

Maxime

1: https://lore.kernel.org/dri-devel/20250422191939.555963-1-jkangas@redhat=
=2Ecom/

--cnfj2vosil43ztw3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaAtADgAKCRAnX84Zoj2+
dho5AYCdIU9gnjmEXAPpheQ7IEaJF7J7fF6y4U8T44525/CGFCETjJ4+kCtJjPQa
Wg2Hu1sBegMbyRVnTSH6daT0qQjW2SCzMW+UpugQt8xH7KOs05/WnQmns9K2/YP4
lkpGkuBJOg==
=rOoz
-----END PGP SIGNATURE-----

--cnfj2vosil43ztw3--
