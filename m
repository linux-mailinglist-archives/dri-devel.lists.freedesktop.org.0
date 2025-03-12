Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 210B1A5E7A6
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 23:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9119C10E1EA;
	Wed, 12 Mar 2025 22:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.b="X1P1GM19";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EE510E1EA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 22:49:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B793541063
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1741819758; bh=ofpb6WFWZpSwe4hGDS3zTfl8z/+FILydqU6HiuMXkXY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=X1P1GM19z5pRqGfYxNPtxoYTDCSnhdwb0HdmiOV6j8zBmhjk/imyzxwjBnc+nw/LK
 mqZXdYNGgLaW4s2hfh1wPKcn/wOeIX7W9JXJ/BjQjUBvQZVaLHWGhdxguzlL3gTIRU
 6yHeQLWWvF4mZXCMd3wdT7QwEH/jEFcx8shkkpj0q4cjdyUwQYknU8Vh33FxtwDbhj
 zTmREBeEakhvWoZz/ji1bxps8Kb+Y1nIqU4xmiQve5f9R5WJ6QF2G2IvEDimDnNx4k
 t+wu4MucBdNIVLPyvYa2gGDpw6CZ3naTxq77qBX7TjqfhGGbrh2OIFLsV9RsaWn144
 dixlLUNZs08vw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id B793541063;
 Wed, 12 Mar 2025 22:49:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J .
 Mercier" <tjmercier@google.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 linux-doc@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v4] Documentation: dma-buf: heaps: Add heap name
 definitions
In-Reply-To: <20250306135114.1943738-1-mripard@kernel.org>
References: <20250306135114.1943738-1-mripard@kernel.org>
Date: Wed, 12 Mar 2025 16:49:17 -0600
Message-ID: <877c4tlv9u.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
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

Maxime Ripard <mripard@kernel.org> writes:

> Following a recent discussion at last Plumbers, John Stultz, Sumit
> Sewal, TJ Mercier and I came to an agreement that we should document
> what the dma-buf heaps names are expected to be, and what the buffers
> attributes you'll get should be documented.
>
> Let's create that doc to make sure those attributes and names are
> guaranteed going forward.
>
> Reviewed-by: T.J. Mercier <tjmercier@google.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>
> ---
> Changes from v3:
>   - Add TJ RB
>   - Fix a few typos.
>
> Changes from v2:
>   - Remove exhaustive list of names for platforms, and just mention the
>     alternatives.
>   - Add MAINTAINERS entry
>
> Changes from v1:
>   - Add the mention that the cma / reserved heap is optional.
> ---
>  Documentation/userspace-api/dma-buf-heaps.rst | 25 +++++++++++++++++++
>  Documentation/userspace-api/index.rst         |  1 +
>  MAINTAINERS                                   |  1 +
>  3 files changed, 27 insertions(+)
>  create mode 100644 Documentation/userspace-api/dma-buf-heaps.rst

I've applied this, thanks.

jon
