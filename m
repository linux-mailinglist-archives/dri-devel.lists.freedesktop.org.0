Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40309CCB4F1
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 11:09:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009DA10E9C2;
	Thu, 18 Dec 2025 10:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="nXG7GxuP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CDC10E964;
 Thu, 18 Dec 2025 10:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1766052581;
 bh=o1fdrSWwO0xShmzqL2G5QlgwbWYvhXX+R7M9VNjTXJ4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nXG7GxuPC93tvgwak+SlwW3fsT70fORelI0ocCJLMZLZkDLgsIegaaElfdGba++31
 HHSfySgD+qcrRBlfWsTz0agUC7Ve8BdtD49OphYgbcoiojIPNlO4MvKVVoa2k94NVA
 05kLTaQ2jB2ucldlsndgs8t40DdjmHsGw8ULTCRsAhpP9AUPVyBu6D4gD/EnDSMILr
 H9x9vTwKo0kKEMtxcE+nnzToGJf+8K8DnW/Pi9+uq/9ZplVjH791BStOvMdHpjBV1w
 s6WoLYFVpGUrZFCjtcNY/kWnmAiLUOnSpxFkxcYxK1JoF0Hl3sT+3wNYRMaR3qWlR2
 qlqiT3u7dG1EQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6835D17E1146;
 Thu, 18 Dec 2025 11:09:41 +0100 (CET)
Date: Thu, 18 Dec 2025 11:09:37 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?TG/Dr2M=?= Molinari <loic.molinari@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, DRI Devel Mailing List
 <dri-devel@lists.freedesktop.org>, Intel Graphics Mailing List
 <intel-gfx@lists.freedesktop.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Collabora Kernel Mailing List
 <kernel@collabora.com>
Subject: Re: [PATCH] drm/gem: Fix kerneldoc warnings
Message-ID: <20251218110937.2d1a0c7d@fedora>
In-Reply-To: <20251217172404.31216-1-loic.molinari@collabora.com>
References: <20251217172404.31216-1-loic.molinari@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

On Wed, 17 Dec 2025 18:24:04 +0100
Lo=C3=AFc Molinari <loic.molinari@collabora.com> wrote:

> Fix incorrect parameters in drm_gem_shmem_init() and missing " *" on
> empty lines in drm_gem_get_huge_mnt().
>=20
> Signed-off-by: Lo=C3=AFc Molinari <loic.molinari@collabora.com>

Queued to drm-misc-next.

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 7 +++++--
>  include/drm/drm_gem.h                  | 4 ++--
>  2 files changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm=
_gem_shmem_helper.c
> index 29174ab58ff3..fbd1164174b0 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -94,9 +94,12 @@ static int __drm_gem_shmem_init(struct drm_device *dev=
, struct drm_gem_shmem_obj
>  }
> =20
>  /**
> - * drm_gem_shmem_init - Initialize an allocated object.
> + * drm_gem_shmem_init - Initialize an allocated object of the given size
>   * @dev: DRM device
> - * @obj: The allocated shmem GEM object.
> + * @shmem: shmem GEM object to initialize
> + * @size: Size of the object to initialize
> + *
> + * This function initializes an allocated shmem GEM object.
>   *
>   * Returns:
>   * 0 on success, or a negative error code on failure.
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index f4da8ed0d630..86f5846154f7 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -508,11 +508,11 @@ static inline int drm_gem_huge_mnt_create(struct dr=
m_device *dev,
>  /**
>   * drm_gem_get_huge_mnt - Get the huge tmpfs mountpoint used by a DRM de=
vice
>   * @dev: DRM device
> -
> + *
>   * This function gets the huge tmpfs mountpoint used by DRM device @dev.=
 A huge
>   * tmpfs mountpoint is used instead of `shm_mnt` after a successful call=
 to
>   * drm_gem_huge_mnt_create() when CONFIG_TRANSPARENT_HUGEPAGE is enabled.
> -
> + *
>   * Returns:
>   * The huge tmpfs mountpoint in use, NULL otherwise.
>   */

