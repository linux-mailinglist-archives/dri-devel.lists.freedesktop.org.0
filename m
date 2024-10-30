Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EAD9B6400
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 14:26:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C09710E7A1;
	Wed, 30 Oct 2024 13:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="KyAF95dK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19D810E7A1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 13:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Us9rkUfj+iE/u81ryKmhTooVo1HWmg71Ma4F5AMwC6Q=; b=KyAF95dK1Nks5OhjcOsFn2SV4I
 vhtp4D4K1TQjQavDtp5Akcb51zdOeyGXlCRb3RsZgGjDFIZr/EphZ5z9Pi8o+Q76rO00oSifV/+7P
 ct+pS9pMtYXneLOPfzlhbMU56PazAq5oWReh9nE/LxFEU6rpf066k6JANziPaUpyys9lt9pX2kJBH
 ZKXCd71qwryyoBi/gumwjpmnghcNyC9LWnrumDZrIGLLzPBYW5CXQLb8KpEKrzAzZreJ8RLv4bVPk
 aScWVUr8EiP99kV6nXFs+3i2jYvjnfZgBc9Hfz7DmxeXbnQMXHoZMCD298NaAe1Q5nRqV/EMcKKDe
 pl+vhmmg==;
Received: from [187.36.213.55] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1t68hg-00H6BY-7O; Wed, 30 Oct 2024 14:25:40 +0100
Message-ID: <8f432835-1e45-4e2e-b053-10d25a23d5fb@igalia.com>
Date: Wed, 30 Oct 2024 10:25:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/v3d: Drop allocation of object without mountpoint
To: matthias.bgg@kernel.org, Melissa Wen <mwen@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20241029-v3d-v2-1-c0d3dd328d1b@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20241029-v3d-v2-1-c0d3dd328d1b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Matthias,

On 29/10/24 08:24, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Function drm_gem_shmem_create_with_mnt() creates an object
> without using the mountpoint if gemfs is NULL.
> 
> Drop the else branch calling drm_gem_shmem_create().
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Applied to misc/kernel.git (drm-misc-next).

Best Regards,
- Maíra

> ---
> Changes in v2:
> - Fix indentation
> - Link to v1: https://lore.kernel.org/r/20241028-v3d-v1-1-907bee355edf@gmail.com
> ---
>   drivers/gpu/drm/v3d/v3d_bo.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
> index 7055f7c7bcfe5700aee10b09ecc0005197323b01..73ab7dd31b17b249b7688dcc9833fd161211b6d9 100644
> --- a/drivers/gpu/drm/v3d/v3d_bo.c
> +++ b/drivers/gpu/drm/v3d/v3d_bo.c
> @@ -157,13 +157,8 @@ struct v3d_bo *v3d_bo_create(struct drm_device *dev, struct drm_file *file_priv,
>   	struct v3d_bo *bo;
>   	int ret;
>   
> -	/* Let the user opt out of allocating the BOs with THP */
> -	if (v3d->gemfs)
> -		shmem_obj = drm_gem_shmem_create_with_mnt(dev, unaligned_size,
> -							  v3d->gemfs);
> -	else
> -		shmem_obj = drm_gem_shmem_create(dev, unaligned_size);
> -
> +	shmem_obj = drm_gem_shmem_create_with_mnt(dev, unaligned_size,
> +						  v3d->gemfs);
>   	if (IS_ERR(shmem_obj))
>   		return ERR_CAST(shmem_obj);
>   	bo = to_v3d_bo(&shmem_obj->base);
> 
> ---
> base-commit: dec9255a128e19c5fcc3bdb18175d78094cc624d
> change-id: 20241028-v3d-1d2546ed92d7
> 
> Best regards,

