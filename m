Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D23BDF543
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 17:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA9F10E2AF;
	Wed, 15 Oct 2025 15:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E112010E2AF
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 15:23:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F5091655;
 Wed, 15 Oct 2025 08:23:08 -0700 (PDT)
Received: from [10.1.31.33] (e122027.cambridge.arm.com [10.1.31.33])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62B303F738;
 Wed, 15 Oct 2025 08:23:14 -0700 (PDT)
Message-ID: <eb8a50c1-a0ab-413a-aa64-7e12c22c8f85@arm.com>
Date: Wed, 15 Oct 2025 16:23:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] drm/panthor: Fix panthor_gpu_coherency_set()
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com,
 Akash Goel <akash.goel@arm.com>
References: <20251015130103.3634560-1-boris.brezillon@collabora.com>
 <20251015130103.3634560-2-boris.brezillon@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20251015130103.3634560-2-boris.brezillon@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/10/2025 14:00, Boris Brezillon wrote:
> GPU_COHERENCY_PROTOCOL takes one of GPU_COHERENCY_xx
> not BIT(GPU_COHERENCY_xx).
> 
> v3:
> - New commit
> 
> Cc: Akash Goel <akash.goel@arm.com>
> Fixes: dd7db8d911a1 ("drm/panthor: Explicitly set the coherency mode")
> Reported-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index 9d98720ce03f..7f9a28e90409 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -49,7 +49,7 @@ struct panthor_gpu {
>  static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
>  {
>  	gpu_write(ptdev, GPU_COHERENCY_PROTOCOL,
> -		ptdev->coherent ? GPU_COHERENCY_PROT_BIT(ACE_LITE) : GPU_COHERENCY_NONE);
> +		  ptdev->coherent ? GPU_COHERENCY_ACE_LITE : GPU_COHERENCY_NONE);
>  }
>  
>  static void panthor_gpu_l2_config_set(struct panthor_device *ptdev)

