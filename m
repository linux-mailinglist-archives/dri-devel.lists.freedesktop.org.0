Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1FD9B67CA
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 16:28:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0BB10E14E;
	Wed, 30 Oct 2024 15:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="RRHed0TK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF2010E14E
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 15:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730302098;
 bh=QDS4abYzVocsLQ2xjdBWlvvUnWTPAtKlT4xBgG2UpMA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RRHed0TKwfMV3pcWVbro68R5lFmx9LFgK81VZ4FqUyuhjSPXkt3NMJKn/R1HP4khn
 dEC5ZCVYR6qbFMBUw9/5XiwcQ9gaf7s5HYiN3PueEnUNYUii71erjCtUrT0a3s3Z3R
 onX+GSDptcswLVK4MDE0d7VbaTmMstTC108f4A48V+ONsu6IXi4b/4RvLGDNmNb1TL
 nxiYcuZ/NL1/o/vROnRogH3R2nfZwIXZ9aJipRHxhIURcbcaxLmcD8fvFMun2+q94C
 b/3uC5k70v9tIX6+5Gj4O9kD3TrkkZgYEhpPjYOSej4Kq06dWcf1St5YTsV0oQ2y6E
 xV5GiHN4RKcaw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DE41417E363B;
 Wed, 30 Oct 2024 16:28:17 +0100 (CET)
Date: Wed, 30 Oct 2024 16:28:12 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonathan
 Corbet <corbet@lwn.net>, Steven Price <steven.price@arm.com>,
 kernel@collabora.com, Stephen Rothwell <sfr@canb.auug.org.au>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/gpu: Fix Panthor documentation build
 warnings
Message-ID: <20241030162812.267750b6@collabora.com>
In-Reply-To: <20241009214346.2308917-1-adrian.larumbe@collabora.com>
References: <20241009214346.2308917-1-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Wed,  9 Oct 2024 22:43:30 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Fix Panthor documentation build errors uncovered by the makedocs target
> when building with extra warnings enabled.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> Fixes: f25044688b04 ("drm/panthor: add sysfs knob for enabling job profil=
ing")

Queued to drm-misc-next.

BTW, the commit hash was incorrect, please make sure you pick the hash
from the drm-misc tree not from your local branch next time.

> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  Documentation/gpu/drivers.rst         | 1 +
>  Documentation/gpu/drm-usage-stats.rst | 1 +
>  Documentation/gpu/panthor.rst         | 2 +-
>  3 files changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
> index b899cbc5c2b4..7b1282e2d807 100644
> --- a/Documentation/gpu/drivers.rst
> +++ b/Documentation/gpu/drivers.rst
> @@ -22,6 +22,7 @@ GPU Driver Documentation
>     afbc
>     komeda-kms
>     panfrost
> +   panthor
> =20
>  .. only::  subproject and html
> =20
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/dr=
m-usage-stats.rst
> index a80f95ca1b2f..12ca3193bf15 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -186,4 +186,5 @@ Driver specific implementations
> =20
>  * :ref:`i915-usage-stats`
>  * :ref:`panfrost-usage-stats`
> +* :ref:`panthor-usage-stats`
>  * :ref:`xe-usage-stats`
> diff --git a/Documentation/gpu/panthor.rst b/Documentation/gpu/panthor.rst
> index cbf5c4429a2d..3f8979fa2b86 100644
> --- a/Documentation/gpu/panthor.rst
> +++ b/Documentation/gpu/panthor.rst
> @@ -4,7 +4,7 @@
>   drm/Panthor CSF driver
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> =20
> -.. _panfrost-usage-stats:
> +.. _panthor-usage-stats:
> =20
>  Panthor DRM client usage stats implementation
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

