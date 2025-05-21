Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF97CABEBCE
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 08:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A752510E62E;
	Wed, 21 May 2025 06:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="CA0fBv+R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EEFE10E62E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 06:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1747807981;
 bh=W2pNq8bQVNv22mm8YwKbTNI9n8GEVp4YjBe5OD3yI8c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CA0fBv+RiJjadc+F8vayIVJvOLGqbeZVy7dkM0bCI2ZgT77GMksH5cCWB1Felt9jO
 L/p1723SxM501IkIuPjK3EUnRwHXq1C9rfVUq7hZeV5LrYi3NtJDETrc8bl200UiSO
 wXb9hJZHRL7QFqHHsWAUFb4nJli8cAd0uaZM76U983u0QAdQ00GAI/8bKaux2H16yU
 U91vjsooolZQLkIpX03VX8+btLOGq6OsUGqfcEJcCHAW1taapTGVc7k/AXgJu1WzdN
 vpHCV5AcCy4P519k0pahx4TVLbUTqzRaGEA/YDeaXcGknoBIuvJCirrxrtBXdkkS11
 +8YPPy6oUb4Wg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B8F017E0FBA;
 Wed, 21 May 2025 08:13:00 +0200 (CEST)
Date: Wed, 21 May 2025 08:12:54 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Rob Herring <robh@kernel.org>, Steven Price
 <steven.price@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v3 5/5] drm/panfrost: Fix panfrost device variable name
 in devfreq
Message-ID: <20250521081254.05fead9e@collabora.com>
In-Reply-To: <20250520174634.353267-6-adrian.larumbe@collabora.com>
References: <20250520174634.353267-1-adrian.larumbe@collabora.com>
 <20250520174634.353267-6-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

On Tue, 20 May 2025 18:44:02 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Commit 64111a0e22a9 ("drm/panfrost: Fix incorrect updating of current
> device frequency") was a Panfrost port of a similar fix in Panthor.
>=20
> Fix the Panfrost device pointer variable name so that it follows
> Panfrost naming conventions.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> Fixes: 64111a0e22a9 ("drm/panfrost: Fix incorrect updating of current dev=
ice frequency")

I don't we want to backport this patch, so would drop the Fixes tag.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/dr=
m/panfrost/panfrost_devfreq.c
> index 3385fd3ef41a..5d0dce10336b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -29,7 +29,7 @@ static void panfrost_devfreq_update_utilization(struct =
panfrost_devfreq *pfdevfr
>  static int panfrost_devfreq_target(struct device *dev, unsigned long *fr=
eq,
>  				   u32 flags)
>  {
> -	struct panfrost_device *ptdev =3D dev_get_drvdata(dev);
> +	struct panfrost_device *pfdev =3D dev_get_drvdata(dev);
>  	struct dev_pm_opp *opp;
>  	int err;
> =20
> @@ -40,7 +40,7 @@ static int panfrost_devfreq_target(struct device *dev, =
unsigned long *freq,
> =20
>  	err =3D dev_pm_opp_set_rate(dev, *freq);
>  	if (!err)
> -		ptdev->pfdevfreq.current_frequency =3D *freq;
> +		pfdev->pfdevfreq.current_frequency =3D *freq;
> =20
>  	return err;
>  }

