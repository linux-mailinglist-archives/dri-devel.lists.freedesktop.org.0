Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA1162877A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 18:51:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A0C10E301;
	Mon, 14 Nov 2022 17:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6AE10E301
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 17:51:27 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 54D396600014;
 Mon, 14 Nov 2022 17:51:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1668448286;
 bh=6URtM9bzPAbOdHBsbJJUmvX5f11Q+HAjOs5KygFaFAs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iGuHYyBoXafSIZCe8iAR3PlmSqwGnjTj0thPdaIHFZFWgh1XWR/ujXccFy101mrY+
 FeamM4/oDj/oT5NxSRsGNsr/Hg1Ymaq5pHczZcg8bi/nbsMOqETI8b+wd5dflT9Sb4
 b5jkq7PhpQgj9SGh8NBPdR9q4rNBOWl9ezW8fz6WTge/2F02C+CAuebMZ5aJ9XtYd8
 riWIBldzdl1oQff7xjgP1y3KLRPdJJklPQtnSmVdUdE5qUMAyvXSBzhPiGTM2C7GM0
 JWVjPae0D0pLlqVSUzmlZP8PO+zCIzLU67bEgZzQijUhRVTuK0Li7LXi7CL1pZjhTG
 ZYb90pbGr+OjA==
Date: Mon, 14 Nov 2022 18:51:22 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Robert Swindells <rjs@fdy2.co.uk>
Subject: Re: [PATCH 1/1] drm/shmem: Dual licence the files as GPL-2 and MIT
Message-ID: <20221114185122.1ea32a18@collabora.com>
In-Reply-To: <20221112194210.7657-2-rjs@fdy2.co.uk>
References: <20221112194210.7657-1-rjs@fdy2.co.uk>
 <20221112194210.7657-2-rjs@fdy2.co.uk>
Organization: Collabora
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
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
Cc: sfr@canb.auug.org.au, marcel.ziswiler@toradex.com, daniel.vetter@ffwll.ch,
 liuzixian4@huawei.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org, nroberts@igalia.com, noralf@tronnes.org,
 cai.huoqing@linux.dev, kraxel@redhat.com, tzimmermann@suse.de, kuba@kernel.org,
 airlied@redhat.com, emil.velikov@collabora.com, sam@ravnborg.org,
 dan.carpenter@oracle.com, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 12 Nov 2022 19:42:10 +0000
Robert Swindells <rjs@fdy2.co.uk> wrote:

> Contributors to these files are:
>=20
> Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Liu Zixian <liuzixian4@huawei.com>
> Dave Airlie <airlied@redhat.com>
> Thomas Zimmermann <tzimmermann@suse.de>
> Lucas De Marchi <lucas.demarchi@intel.com>
> Gerd Hoffmann <kraxel@redhat.com>
> Rob Herring <robh@kernel.org>
> Jakub Kicinski <kuba@kernel.org>
> Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Stephen Rothwell <sfr@canb.auug.org.au>
> Daniel Vetter <daniel.vetter@ffwll.ch>
> Cai Huoqing <cai.huoqing@linux.dev>
> Neil Roberts <nroberts@igalia.com>
> Marek Szyprowski <m.szyprowski@samsung.com>
> Emil Velikov <emil.velikov@collabora.com>
> Sam Ravnborg <sam@ravnborg.org>
> Boris Brezillon <boris.brezillon@collabora.com>

Acked-by: Boris Brezillon <boris.brezillon@collabora.com>

> Dan Carpenter <dan.carpenter@oracle.com>
>=20
> Signed-off-by: Robert Swindells <rjs@fdy2.co.uk>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 2 +-
>  include/drm/drm_gem_shmem_helper.h     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm=
_gem_shmem_helper.c
> index 35138f8a375c..f1a68a71f876 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0
> +// SPDX-License-Identifier: GPL-2.0 or MIT
>  /*
>   * Copyright 2018 Noralf Tr=C3=B8nnes
>   */
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shm=
em_helper.h
> index a2201b2488c5..56ac32947d1c 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> =20
>  #ifndef __DRM_GEM_SHMEM_HELPER_H__
>  #define __DRM_GEM_SHMEM_HELPER_H__

