Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B5EA32303
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 11:01:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FADD10E839;
	Wed, 12 Feb 2025 10:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JFknMvAY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5F610E839
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 10:01:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 764BE5C5DAE;
 Wed, 12 Feb 2025 10:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 373AEC4CEDF;
 Wed, 12 Feb 2025 10:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739354473;
 bh=woz7pk/+ngx1fAXXik33xpEwcwvHhgnlnzWIambURC4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JFknMvAYCwTyrVf3OxL2gYhdX1gCloKqAmyPXLmtzPDsbcRVkduTdz/DV5ooCn6B8
 4+t2DpEMJiVVr1HQy/UiPXnSvdRjYZe/W+HkI0ERWJH1/abm0dKszP95sM9O6UTc7F
 cLOzYQhgS2NJc9exC2em9aL/Mx1QYAwOIbY8AESaYkLTGqh4r4i4tds7+BKUhmiddw
 rV8PgQzg43sxTHsHorGuUbkQHjEZkYtDbHRc+gM3WRI8ALQ9y2UmKa7xUpmV7xI6eF
 3dF5FTcTfKWbuXXv91blHqqWPM6YquxAfS0ysnR7v22PRyei45Pal7UpfLtSsX8Q6B
 eI9d4Ema9btyQ==
Date: Wed, 12 Feb 2025 11:01:11 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Florent Tomasin <florent.tomasin@arm.com>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, Vinod Koul <vkoul@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 nd@arm.com, Akash Goel <akash.goel@arm.com>
Subject: Re: [RFC PATCH 1/5] dt-bindings: dma: Add CMA Heap bindings
Message-ID: <20250212-naughty-chipmunk-of-potency-7e0ced@houat>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <771534be8dfa2a3bdc3876502752f518224b9298.1738228114.git.florent.tomasin@arm.com>
 <ats2unrml5a7vbpdrqrzowodrsfj44bnubpbujg2igk3imeklx@nrpmg5oeq3gz>
 <be8e6b9f-c3c6-41d1-af9c-3dcd102f0fe3@arm.com>
 <b02711c901e8acf2bc47926919de7673a0cb0b98.camel@ndufresne.ca>
 <fae8df2a-3e47-4266-aace-392c5f37581f@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="uxrfo3idfywaw7zh"
Content-Disposition: inline
In-Reply-To: <fae8df2a-3e47-4266-aace-392c5f37581f@arm.com>
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


--uxrfo3idfywaw7zh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 1/5] dt-bindings: dma: Add CMA Heap bindings
MIME-Version: 1.0

On Wed, Feb 12, 2025 at 09:49:56AM +0000, Florent Tomasin wrote:
> Note that the CMA patches were initially shared to help reproduce my
> environment of development, I can isolate them in a separate patch
> series and include a reference or "base-commit:" tag to it in the
> Panthor protected mode RFC, to help progress this review in another
> thread. It will avoid overlapping these two topics:
>=20
> - Multiple standalone CMA heaps support
> - Panthor protected mode handling

You keep insisting on using CMA here, but it's really not clear to me
why you would need CMA in the first place.

By CMA, do you mean the CMA allocator, and thus would provide buffers
through the usual dma_alloc_* API, or would any allocator providing
physically contiguous memory work?

In the latter case, would something like this work:
https://lore.kernel.org/all/20240515-dma-buf-ecc-heap-v1-1-54cbbd049511@ker=
nel.org/

Maxime

--uxrfo3idfywaw7zh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6xxYgAKCRAnX84Zoj2+
doOXAYCmJnHBgdesgUZVquuWr6GPMIwXNegsF2kF9WE8cUf8QZREQljZMta1yPl+
Y3KyEfEBf2GAaLjFhJfdk0/CAvLXAP/kO5oVGERfJbRdGvpysS+9JiElAhrVFTWR
1Zzqx2VRSg==
=Jh+j
-----END PGP SIGNATURE-----

--uxrfo3idfywaw7zh--
