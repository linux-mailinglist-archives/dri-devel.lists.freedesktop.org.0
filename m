Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEEEA22DDD
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 14:34:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0430910E971;
	Thu, 30 Jan 2025 13:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="paj8Ojc2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A9110E971
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 13:34:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8B178A411A3;
 Thu, 30 Jan 2025 13:32:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46798C4CED2;
 Thu, 30 Jan 2025 13:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738244073;
 bh=J0b+obWMjwAaXulYmF/USRpijIdeFA5Q4buPxAHpfEY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=paj8Ojc2487u0LjD1LvjOz88O1023RfHLGy5RmT3rBujmTTDmWlKY9vHjdrVr9rWl
 SunBQKrHpL6RsyKaEXqU6rtx47XgEpdc4yMLc1eVKKd2SOkeBqFb8OvS3332+janft
 cVZ+UHaBuJnnaPEclpK6uegtAvC+fji9P9Ab+czIV4O/LDady49Die3UbM7vPIv1oU
 Df8aN8hfG/V/bgtF45VguGhzoSGpblA6d5B/1BAFITSq5XiYn2w+Qk3sITk7g/4/w7
 UrtqvkTqnQNxxaGAE9tRACSLqtdyEv86Pklg0hAq91KZ3weKygnCZRqQqRZ3XNZJH1
 gMKBYmwwZTsLg==
Date: Thu, 30 Jan 2025 14:34:30 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Florent Tomasin <florent.tomasin@arm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 nd@arm.com, Akash Goel <akash.goel@arm.com>
Subject: Re: [RFC PATCH 2/5] cma-heap: Allow registration of custom cma heaps
Message-ID: <kyesso3gaajbdze3ie4imrmrk2lzqf6s7eoonlljeitfs3utwh@dycnl7cnzep5>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <2255866ee9e81136a7099376b34b8305758ec9f0.1738228114.git.florent.tomasin@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="x43ujhulkmklcecy"
Content-Disposition: inline
In-Reply-To: <2255866ee9e81136a7099376b34b8305758ec9f0.1738228114.git.florent.tomasin@arm.com>
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


--x43ujhulkmklcecy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 2/5] cma-heap: Allow registration of custom cma heaps
MIME-Version: 1.0

Hi,

On Thu, Jan 30, 2025 at 01:08:58PM +0000, Florent Tomasin wrote:
> This patch introduces a cma-heap probe function, allowing
> users to register custom cma heaps in the device tree.
>=20
> A "memory-region" is bound to the cma heap at probe time
> allowing allocation of DMA buffers from that heap.
>=20
> Use cases:
> - registration of carved out secure heaps. Some devices
>   are implementing secure memory by reserving a specific
>   memory regions for that purpose. For example, this is the
>   case of platforms making use of early version of
>   ARM TrustZone.

In such a case, the CMA heap would de-facto become un-mappable for
userspace, right?

> - registration of multiple memory regions at different
>   locations for efficiency or HW integration reasons.
>   For example, a peripheral may expect to share data at a
>   specific location in RAM. This information could have been
>   programmed by a FW prior to the kernel boot.

How would you differentiate between them?

Maxime

--x43ujhulkmklcecy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5t/5gAKCRAnX84Zoj2+
dqCmAYDoWSZStP9SqqDBsMXAXM2LcdlKGIxA9z3zUEk7mfa1Tr8e2yuFJiIaj32i
idm/BgQBfjHysDgl5TQpuMaxC4xCpEeBM/24GEO2Z7T2jFQ/knGH6TS9zQ95+16V
MmgikebI5g==
=QJcw
-----END PGP SIGNATURE-----

--x43ujhulkmklcecy--
