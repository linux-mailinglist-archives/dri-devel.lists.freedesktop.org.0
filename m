Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1539E0037
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 12:23:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFABC10E22D;
	Mon,  2 Dec 2024 11:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="QJY4JO46";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49FD10E22D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 11:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733138609;
 bh=3CwUiYzQSS9zQX15Z8WynaPmt4FF3csoPX1C+MgznUY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QJY4JO46MD8RaA3KdmhUPZ9xQ7YVc6mQkbjYEfAhYkhi2SGFwHcGVpbNZ26OKO9VN
 ycW3Kc52HxivZNn0QoFo144355/t7+3FLJie14iQsyArF+GT8RMCAZ0nejyRuKvOg8
 FNm68HWcUd7wjcbaEKMWFExOeRzJlcOcKSun21hm1GceDWKPC8jPUWqH3LwdG1DQ0w
 CpIbH0PogSJ7DPZRmP8lB4rzh9n8mDeZdf1MrRK/CP2fl5gDDpGfR1we9Ahm6bdo0y
 w9Om0UC/tOOQHl/P+epf+64HIdfkzrOTnfHuunwJQ+4So4uBdb1vuDdua51i1zYGmM
 w6u75MoQnLjmQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DD4B717E3624;
 Mon,  2 Dec 2024 12:23:28 +0100 (CET)
Date: Mon, 2 Dec 2024 12:23:09 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Philipp Zabel
 <p.zabel@pengutronix.de>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/8] drm/panfrost: Remove unused device property
Message-ID: <20241202122309.12cf8e25@collabora.com>
In-Reply-To: <20241128211223.1805830-9-adrian.larumbe@collabora.com>
References: <20241128211223.1805830-1-adrian.larumbe@collabora.com>
 <20241128211223.1805830-9-adrian.larumbe@collabora.com>
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

On Thu, 28 Nov 2024 21:06:23 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> The as_in_use_mask device state variable is no longer in use.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_device.h | 1 -
>  drivers/gpu/drm/panfrost/panfrost_mmu.c    | 1 -
>  2 files changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm=
/panfrost/panfrost_device.h
> index fc83d5e104a3..b91957f886ea 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -117,7 +117,6 @@ struct panfrost_device {
>  	DECLARE_BITMAP(is_suspended, PANFROST_COMP_BIT_MAX);
> =20
>  	spinlock_t as_lock;
> -	unsigned long as_in_use_mask;
>  	unsigned long as_alloc_mask;
>  	unsigned long as_faulty_mask;
>  	struct list_head as_lru_list;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/pa=
nfrost/panfrost_mmu.c
> index 5e30888bea0e..95df39b463d8 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -604,7 +604,6 @@ static void panfrost_mmu_release_ctx(struct kref *kre=
f)
>  		pm_runtime_put_autosuspend(pfdev->base.dev);
> =20
>  		clear_bit(mmu->as, &pfdev->as_alloc_mask);
> -		clear_bit(mmu->as, &pfdev->as_in_use_mask);
>  		list_del(&mmu->list);
>  	}
>  	spin_unlock(&pfdev->as_lock);

