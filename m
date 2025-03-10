Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB36A59AFA
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 17:28:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A17C10E47F;
	Mon, 10 Mar 2025 16:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HjCRfgvh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2B210E47F
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 16:28:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 80D8BA45A5A;
 Mon, 10 Mar 2025 16:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E28C4CEE5;
 Mon, 10 Mar 2025 16:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741624109;
 bh=sfvhajnKh+JsG0G6ZCvurp8nXoOWJhhwIboB81/bSrw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HjCRfgvhI4AlUc9WjlFhsPXUiJyzrUc7p1qSry8OFL6MdHrIU9dymbeJiT9YIoP0D
 VpC7Nku3EXjciL5/o5SgIqVML56l8wAsBs9D0MV02GYwaxyVQleOU1pZm20IaC9MqS
 6WL2AQtsDOrq/PSSrVIqLEmgiG7O2qg68NrFKbo0o/GbNDo1vAl8GfYDxMYrV6IemA
 TA2xBT4nqJ+pqLZuSkQGtcP74qh8qiWlsFnT1nJd8PimtWtBMONmIe6Y1t9kfiJZfa
 zgaHp90KP/TRdKxL6fw5PTlDtElMmsEjwJkxJo+mqgxXI69OPILcXnnV23cR/5WNFt
 Lra5gXAYY48XQ==
Date: Mon, 10 Mar 2025 17:28:26 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Tomasz Figa <tfiga@chromium.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH RFC 06/12] dma: direct: Provide accessor to dmem region
Message-ID: <20250310-expert-piculet-of-fascination-3813cd@houat>
References: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
 <20250310-dmem-cgroups-v1-6-2984c1bc9312@kernel.org>
 <2af9ea85-b31d-49c9-b574-38c33cc89cef@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="u3dzblkp3nldqa3e"
Content-Disposition: inline
In-Reply-To: <2af9ea85-b31d-49c9-b574-38c33cc89cef@arm.com>
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


--u3dzblkp3nldqa3e
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC 06/12] dma: direct: Provide accessor to dmem region
MIME-Version: 1.0

On Mon, Mar 10, 2025 at 02:56:37PM +0000, Robin Murphy wrote:
> On 2025-03-10 12:06 pm, Maxime Ripard wrote:
> > Consumers of the direct DMA API will have to know which region their
> > device allocate from in order for them to charge the memory allocation
> > in the right one.
>=20
> This doesn't seem to make much sense - dma-direct is not an allocator
> itself, it just provides the high-level dma_alloc_attrs/dma_alloc_pages/e=
tc.
> interfaces wherein the underlying allocations _could_ come from CMA, but
> also a per-device coherent/restricted pool, or a global coherent/atomic
> pool, or the regular page allocator, or in one weird corner case the SWIO=
TLB
> buffer, or...

I guess it wasn't super clear, but what I meant is that it's an
allocator to the consumer: it gets called, and returns a buffer. How it
does so is transparent to the device, and on the other side of the
abstraction.

I do agree that the logic is complicated to follow, and that's what I
was getting at in the cover letter.

Maxime

--u3dzblkp3nldqa3e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ88TKQAKCRDj7w1vZxhR
xeXsAP4+bkSf79vghGDX51PPSs2osfbQ4iJhpf10VBrMEcmucQD/fkdqnL4MMQHy
pTxcWVuD9g8C9rHEtoXUgWXksoghYQ4=
=f/EX
-----END PGP SIGNATURE-----

--u3dzblkp3nldqa3e--
