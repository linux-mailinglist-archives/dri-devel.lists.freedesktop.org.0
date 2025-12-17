Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A9ACC9346
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 19:09:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7668810E33B;
	Wed, 17 Dec 2025 18:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="2j96BQod";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5811110E33B;
 Wed, 17 Dec 2025 18:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=pJ995Z+yFdhxVC5mXYbnSOTU8w1AXddwEeOENWW3ugU=; b=2j96BQod15lY0JqikEVSiVJkwU
 m5U3EB+jmBed2XTIMLRsNlNzS871TZ4w2JV/lXFTn/k+/MxU4FrPLYWmOkIqmbNBUpDSBl059HKgP
 KaEtHQwcbQQ9PjuuNSt5FRjG1FULz/f2TwYucqhOxNUvG03NGYZHRN+KFUjZ8TjAukuhdlzHIkVBb
 yH0LcgVsZm2ALF41I18PcQ3wQOIsldLg+38nTycNRW271RXWuHRfg+8d0ldBfn6AiRTClQNa2pe+U
 cZrxpbyrQRyjNs/eJ0o5XWEiWf0mxKfnwLgNWk81Uc0VqJZZNTy9PdTWcm4w/ahyMeAx6YA710oF4
 NNOs0+dw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vVvxe-00000007FIq-0zPb; Wed, 17 Dec 2025 18:09:18 +0000
Message-ID: <5773feac-a80e-4a59-a0f2-dc787faa9f61@infradead.org>
Date: Wed, 17 Dec 2025 10:09:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gem: Fix kerneldoc warnings
To: =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Devel Mailing List <dri-devel@lists.freedesktop.org>,
 Intel Graphics Mailing List <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Collabora Kernel Mailing List <kernel@collabora.com>
References: <20251217172404.31216-1-loic.molinari@collabora.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251217172404.31216-1-loic.molinari@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 12/17/25 9:24 AM, Loïc Molinari wrote:
> Fix incorrect parameters in drm_gem_shmem_init() and missing " *" on
> empty lines in drm_gem_get_huge_mnt().
> 
> Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 7 +++++--
>  include/drm/drm_gem.h                  | 4 ++--
>  2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 29174ab58ff3..fbd1164174b0 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -94,9 +94,12 @@ static int __drm_gem_shmem_init(struct drm_device *dev, struct drm_gem_shmem_obj
>  }
>  
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
> @@ -508,11 +508,11 @@ static inline int drm_gem_huge_mnt_create(struct drm_device *dev,
>  /**
>   * drm_gem_get_huge_mnt - Get the huge tmpfs mountpoint used by a DRM device
>   * @dev: DRM device
> -
> + *
>   * This function gets the huge tmpfs mountpoint used by DRM device @dev. A huge
>   * tmpfs mountpoint is used instead of `shm_mnt` after a successful call to
>   * drm_gem_huge_mnt_create() when CONFIG_TRANSPARENT_HUGEPAGE is enabled.
> -
> + *
>   * Returns:
>   * The huge tmpfs mountpoint in use, NULL otherwise.
>   */

-- 
~Randy
