Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FB6B2E0BD
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 17:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409F310E78C;
	Wed, 20 Aug 2025 15:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lAR6BJ08";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE38210E782
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 15:22:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D57D161424;
 Wed, 20 Aug 2025 15:22:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A16DC4CEEB;
 Wed, 20 Aug 2025 15:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755703340;
 bh=WicMk5bXj+8CW5HOYykWjDmuIMEIuDhQq/0pN4w5DuY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lAR6BJ08Zr0VfKheoNHRPcNGFxdMvD43/8ZbF0hdD0tq1psDcjK9qp01/oJBJ2YKM
 MSdcFY7VSFUVIAbkxzuRflPHJusr9vEXwKPUGmWBSY/HO0nW3GdTExdIy7WBWFsBZ1
 UnEmGnfRXbjb88jK+I7AsBPdN4+ekwso7eJq7RTpPVqIsjm7s+j9/NuSKJr5o7UNot
 7SdAA1E3TDElUXqFcf7PYZqBy/ojrK7mm1qPqBxUtqdj6G5rnkm3p3Nvom+GAiv7rn
 09iszIwgdl2g5u7itHrTvol8vNQ29NyeGfWS4/P40Uc7DBZ18ZN3UdTk7Jt/m6qEJ4
 oqRbH/1e5JBDQ==
Date: Wed, 20 Aug 2025 17:22:18 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Charan Teja Kalla <quic_charante@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
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
Subject: Re: [PATCH v5 2/2] dma-buf: heaps: Introduce a new heap for reserved
 memory
Message-ID: <20250820-gainful-cuttlefish-of-pleasure-b3ecc0@houat>
References: <20250617-dma-buf-ecc-heap-v5-0-0abdc5863a4f@kernel.org>
 <20250617-dma-buf-ecc-heap-v5-2-0abdc5863a4f@kernel.org>
 <a5526631-15fc-479f-8ac8-015231357080@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="4hxaerdxh2nrqase"
Content-Disposition: inline
In-Reply-To: <a5526631-15fc-479f-8ac8-015231357080@quicinc.com>
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


--4hxaerdxh2nrqase
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/2] dma-buf: heaps: Introduce a new heap for reserved
 memory
MIME-Version: 1.0

Hi,

On Fri, Aug 08, 2025 at 03:46:21PM +0530, Charan Teja Kalla wrote:
> On 6/17/2025 5:55 PM, Maxime Ripard wrote:
> > +static void carveout_heap_dma_buf_release(struct dma_buf *buf)
> > +{
> > +	struct carveout_heap_buffer_priv *buffer_priv =3D buf->priv;
> > +	struct carveout_heap_priv *heap_priv =3D buffer_priv->heap;
> > +	unsigned long len =3D buffer_priv->num_pages * PAGE_SIZE;
> > +
> > +	gen_pool_free(heap_priv->pool, buffer_priv->paddr, len);
>=20
> Just checking If clearing of the memory is missed before releasing it to
> the free pool. If not, isn't it a leak of data when the heap is being
> used by the multiple apps.
>=20
> BTW, thanks for these patches.

Thanks for the review. Note that we've since moved to another approach
here:
https://lore.kernel.org/r/20250721-dma-buf-ecc-heap-v7-0-031836e1a942@kerne=
l.org

Maxime

--4hxaerdxh2nrqase
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaKXoKQAKCRAnX84Zoj2+
dow2AYC3Ylr7sSSAO15OugjV/WG7eVzYYLltaBeuKPZRasmbb0lVu2m4UhfgAtLW
tSOmswsBfRnsiVEOeHk1VckfBWFThgfDpJg1QkDZWytCn9JugXgGANgTiDRqLdjJ
WGr85+dNFg==
=pEPY
-----END PGP SIGNATURE-----

--4hxaerdxh2nrqase--
