Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1138236EA
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 22:08:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB2310E345;
	Wed,  3 Jan 2024 21:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DE810E345
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 21:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1704316094;
 bh=duGESKBgxXGs3L/CZsA4/2AFzoxTyxROtWlIKBFet9w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=2+nPMrKwoooJ5f2BvPBb0bhW6EMTHLDpBHXF/UdT0hp5uqrd9TILdfXgXpVbeKm6V
 jcnEg7rONfa0xHivyj8GwYeVhfdQmQ66ZnGUH4JvpUhnJWF2nbxy2SmDJaN9c0bTZY
 Vti+ooF0LnT4C+B4rWbe5Dzj80q9XliLM0uj+pGDk2G16covq0wKRvJAxlD1CPzw1+
 OVFa7Zh3LuTiYezYaoVR6134DsPOVbK0cid+QSDmnnvqSIijI3SB89DNeE+UpyXjPs
 vI5zTIHD4HVlGWjeAQbruUgLgnaaryoVLox09YDwXTa0hoWVCyjgy9MUv5p0OcPmYY
 NXp4LOxl7uYsA==
Received: from [100.109.49.129] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 946CD3780629;
 Wed,  3 Jan 2024 21:08:13 +0000 (UTC)
Message-ID: <0617eeeb-c0af-4ab0-8ae1-e87ba0044948@collabora.com>
Date: Thu, 4 Jan 2024 00:08:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] drm/virtio: Spelling fixes
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20231219151955.2477488-1-andriy.shevchenko@linux.intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20231219151955.2477488-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@redhat.com>, Chia-I Wu <olvaffe@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/19/23 18:19, Andy Shevchenko wrote:
> While making a spelling mistake myself for `git grep kvalloc`
> I found that the only file has such a typo. Fix it and update
> to the standard de facto of how we refer to the functions.
> Also spell usr-out as user-out, it seems this driver uses its
> own terminology nobody else can decypher, make it more readable.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_submit.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_submit.c b/drivers/gpu/drm/virtio/virtgpu_submit.c
> index 5c514946bbad..1c7c7f61a222 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_submit.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
> @@ -99,8 +99,8 @@ virtio_gpu_parse_deps(struct virtio_gpu_submit *submit)
>  		return 0;
>  
>  	/*
> -	 * kvalloc at first tries to allocate memory using kmalloc and
> -	 * falls back to vmalloc only on failure. It also uses __GFP_NOWARN
> +	 * kvmalloc() at first tries to allocate memory using kmalloc() and
> +	 * falls back to vmalloc() only on failure. It also uses __GFP_NOWARN
>  	 * internally for allocations larger than a page size, preventing
>  	 * storm of KMSG warnings.
>  	 */
> @@ -529,7 +529,7 @@ int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>  	virtio_gpu_submit(&submit);
>  
>  	/*
> -	 * Set up usr-out data after submitting the job to optimize
> +	 * Set up user-out data after submitting the job to optimize
>  	 * the job submission path.
>  	 */
>  	virtio_gpu_install_out_fence_fd(&submit);

Applied to misc-next, thanks

-- 
Best regards,
Dmitry

