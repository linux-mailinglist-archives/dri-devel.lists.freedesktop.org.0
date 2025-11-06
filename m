Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 425A8C3994E
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 09:28:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF90810E82E;
	Thu,  6 Nov 2025 08:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="oaACdWU1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B356B10E82E;
 Thu,  6 Nov 2025 08:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WwUoGTNmbk4GL2R/z8jgKT7x4qoL8qPfVciTM25oRN4=; b=oaACdWU11vzx7y9yl+WQ7YyetM
 aoDWzy+EKCf1wJQvAgAUOGwGawC75YrhbT7KaMu0Vc49ukacvQeSVxo3+h8EnpRfMSQ3VA1r2D3iM
 fLuSkbX8cni9zYAHuflPh1YTWVsY1bF1kYQVQri4E1+KMOPb49SQ/C/524oD0vr1dPAYfYokC4iIw
 MBIwiyRpuE5ZFALUA05JXrv2gm2I739cxXzA0nv4gjwOsimS/73pe87c42sFK0/wNTjoS9pQSt6l1
 g1L1YWEuVAd2B0qPzBMw2dLJYGqVddYrCaaJhz3xm+B67gPY1eAjmasMdyi3qKuDQ9vA+JNhMdiwU
 ydoU65GA==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vGvLt-002sf6-3a; Thu, 06 Nov 2025 09:28:17 +0100
Message-ID: <f935574c-67d1-4a7c-bd8e-e9dff7aa97ea@igalia.com>
Date: Thu, 6 Nov 2025 08:28:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Fix @alloc_flags description
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Intel Graphics <intel-gfx@lists.freedesktop.org>
Cc: Christian Koenig <christian.koenig@amd.com>, Huang Rui
 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Zack Rusin <zack.rusin@broadcom.com>, Stephen Rothwell <sfr@canb.auug.org.au>
References: <20251106005217.14026-1-bagasdotme@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20251106005217.14026-1-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 06/11/2025 00:52, Bagas Sanjaya wrote:
> Stephen Rothwell reports htmldocs warnings when merging drm-misc tree:
> 
> Documentation/gpu/drm-mm:40: include/drm/ttm/ttm_device.h:225: ERROR: Unknown target name: "ttm_allocation". [docutils]
> Documentation/gpu/drm-mm:43: drivers/gpu/drm/ttm/ttm_device.c:202: ERROR: Unknown target name: "ttm_allocation". [docutils]
> Documentation/gpu/drm-mm:73: include/drm/ttm/ttm_pool.h:68: ERROR: Unknown target name: "ttm_allocation_pool". [docutils]
> Documentation/gpu/drm-mm:76: drivers/gpu/drm/ttm/ttm_pool.c:1070: ERROR: Unknown target name: "ttm_allocation_pool". [docutils]
> 
> Fix these by adding missing wildcard on TTM_ALLOCATION_* and
> TTM_ALLOCATION_POOL_* in @alloc_flags description.

Interesting, I did not realize it would see special meaning in text 
followed by underscore. Thanks for fixing it up!

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

I assume no one merged it yet to any branch so I can push it to 
drm-misc-next?

Regards,

Tvrtko

> Fixes: 0af5b6a8f8dd ("drm/ttm: Replace multiple booleans with flags in pool init")
> Fixes: 77e19f8d3297 ("drm/ttm: Replace multiple booleans with flags in device init")
> Fixes: 402b3a865090 ("drm/ttm: Add an allocation flag to propagate -ENOSPC on OOM")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20251105161838.55b962a3@canb.auug.org.au/
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>   drivers/gpu/drm/ttm/ttm_device.c | 2 +-
>   drivers/gpu/drm/ttm/ttm_pool.c   | 2 +-
>   include/drm/ttm/ttm_device.h     | 2 +-
>   include/drm/ttm/ttm_pool.h       | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 5c10e5fbf43b7f..9a51afaf0749e2 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -199,7 +199,7 @@ EXPORT_SYMBOL(ttm_device_swapout);
>    * @dev: The core kernel device pointer for DMA mappings and allocations.
>    * @mapping: The address space to use for this bo.
>    * @vma_manager: A pointer to a vma manager.
> - * @alloc_flags: TTM_ALLOCATION_ flags.
> + * @alloc_flags: TTM_ALLOCATION_* flags.
>    *
>    * Initializes a struct ttm_device:
>    * Returns:
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 97e9ce505cf68d..18b6db015619c0 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -1067,7 +1067,7 @@ long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *tt,
>    * @pool: the pool to initialize
>    * @dev: device for DMA allocations and mappings
>    * @nid: NUMA node to use for allocations
> - * @alloc_flags: TTM_ALLOCATION_POOL_ flags
> + * @alloc_flags: TTM_ALLOCATION_POOL_* flags
>    *
>    * Initialize the pool and its pool types.
>    */
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index d016360e5cebbc..5618aef462f21b 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -221,7 +221,7 @@ struct ttm_device {
>   	struct list_head device_list;
>   
>   	/**
> -	 * @alloc_flags: TTM_ALLOCATION_ flags.
> +	 * @alloc_flags: TTM_ALLOCATION_* flags.
>   	 */
>   	unsigned int alloc_flags;
>   
> diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
> index 67c72de913bb9d..233581670e7825 100644
> --- a/include/drm/ttm/ttm_pool.h
> +++ b/include/drm/ttm/ttm_pool.h
> @@ -64,7 +64,7 @@ struct ttm_pool_type {
>    *
>    * @dev: the device we allocate pages for
>    * @nid: which numa node to use
> - * @alloc_flags: TTM_ALLOCATION_POOL_ flags
> + * @alloc_flags: TTM_ALLOCATION_POOL_* flags
>    * @caching: pools for each caching/order
>    */
>   struct ttm_pool {
> 
> base-commit: c553832116b8d0039b13ae84d1ed06e7ee4f1fdf

