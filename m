Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F4EA5978A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 15:27:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFCF10E172;
	Mon, 10 Mar 2025 14:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WM+PScBP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8328310E172
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 14:26:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BDAACA45D98;
 Mon, 10 Mar 2025 14:21:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F40AC4CEE5;
 Mon, 10 Mar 2025 14:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741616814;
 bh=POtmH2Pk7YZquZ7ykg+i1ChooTzaYIGRWYlQYgqXhPI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WM+PScBPqE5h/eL2Yaf49hmt3QKMZNb8yvz11tDPXr9ktrDYrvV4GQMZv2EE6PZZq
 trZ3j0IX9sSWUAjmf9ZtuRPDLZ2iFu7dDsXSJ5d+S3gKp+LrhtThNHL5wC0H1gMkEs
 +vvvRcbQ60w2/ecqyK+UIiVoeo+kjxQ0wz7p75Ci+F/zerF53xFn4FeCxyBbI4dWGg
 Tf0H5ghqCqPjxQNJosfZ2XS5qNAQVVFMOkB/GmFpXQnQXMHbHgbIIwunlYxxVYF+xh
 eDke46hNOfMA0wtUpzF1dRdPYVB9WwGpPynz5iKydvkeuRMYQ2XhOa1KBVmPkqy03/
 XA1ZpP5BnfQ+A==
Date: Mon, 10 Mar 2025 15:26:52 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Tomasz Figa <tfiga@chromium.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Ben Woodard <woodard@redhat.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH RFC 00/12] dma: Enable dmem cgroup tracking
Message-ID: <20250310-eccentric-wonderful-puffin-ddbb26@houat>
References: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
 <f5fdc666-dd72-4a4f-9270-b539a3179382@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="v4rwoqplwp332trx"
Content-Disposition: inline
In-Reply-To: <f5fdc666-dd72-4a4f-9270-b539a3179382@amd.com>
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


--v4rwoqplwp332trx
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC 00/12] dma: Enable dmem cgroup tracking
MIME-Version: 1.0

Hi,

On Mon, Mar 10, 2025 at 03:16:53PM +0100, Christian K=F6nig wrote:
> [Adding Ben since we are currently in the middle of a discussion
> regarding exactly that problem]
>
> Just for my understanding before I deep dive into the code: This uses
> a separate dmem cgroup and does not account against memcg, don't it?

Yes. The main rationale being that it doesn't always make sense to
register against memcg: a lot of devices are going to allocate from
dedicated chunks of memory that are either carved out from the main
memory allocator, or not under Linux supervision at all.

And if there's no way to make it consistent across drivers, it's not the
right tool.

Maxime

--v4rwoqplwp332trx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ872qwAKCRDj7w1vZxhR
xfDdAQCFXvj/doesASzkIHFH0zB9NLLN59l3YZOIRTbK66YYRgD+KKLR7EXgcgov
1vvbHZ0EY8qhZsF/1+Mwgg9bFZh+1wk=
=KuAg
-----END PGP SIGNATURE-----

--v4rwoqplwp332trx--
