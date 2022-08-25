Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE475A0F9B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 13:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3AF61139BD;
	Thu, 25 Aug 2022 11:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D57B611390F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 11:51:57 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4MD1XY1k81z9sJY;
 Thu, 25 Aug 2022 11:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1661428317; bh=Sr5pjSHJhISC7JcB1fG9su2V6Kc+hDrY0/E0OvJrHng=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=j8BSmqDzuzbJgEq6xsZfEfwsFvbwcRTTT+oImBVLn22K6jIu5QqZt5bebBq+IR6j7
 vgRULV5AU304B+X8m21h35XrZh90+qSLC0g4PrHDXf+AHSlO2mJH3GfMMLVv7SwMch
 n48a4Kdm+JzU8fJf854BItRIRqQyt8+/h23WwW+0=
X-Riseup-User-ID: 8E48026DEC53D712AFD99E675A4697ED9AA7C588198C27D80EEA1E99DC66198C
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4MD1XW4B9Jz1yTJ;
 Thu, 25 Aug 2022 11:51:55 +0000 (UTC)
Message-ID: <ffd9508c-ba24-e9ea-ced4-4ce189ef60c5@riseup.net>
Date: Thu, 25 Aug 2022 08:51:52 -0300
MIME-Version: 1.0
Subject: Re: [PATCH] drm: Remove the unused param "struct drm_buddy *mm"
Content-Language: en-US
To: Cai Huoqing <cai.huoqing@linux.dev>
References: <20220627085405.221435-1-cai.huoqing@linux.dev>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20220627085405.221435-1-cai.huoqing@linux.dev>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Cai,

On 6/27/22 05:54, Cai Huoqing wrote:
> Remove the param "struct drm_buddy *mm" which is unused in
> the function drm_block_alloc()/drm_block_free().
> 
> Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>

Reviewed-by: Maíra Canal <mairacanal@riseup.net>

Best Regards,
- Maíra Canal

> ---
>  drivers/gpu/drm/drm_buddy.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 11bb59399471..192c8b99fb43 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -11,10 +11,8 @@
>  
>  static struct kmem_cache *slab_blocks;
>  
> -static struct drm_buddy_block *drm_block_alloc(struct drm_buddy *mm,
> -					       struct drm_buddy_block *parent,
> -					       unsigned int order,
> -					       u64 offset)
> +static struct drm_buddy_block *
> +drm_block_alloc(struct drm_buddy_block *parent, unsigned int order, u64 offset)
>  {
>  	struct drm_buddy_block *block;
>  
> @@ -32,8 +30,7 @@ static struct drm_buddy_block *drm_block_alloc(struct drm_buddy *mm,
>  	return block;
>  }
>  
> -static void drm_block_free(struct drm_buddy *mm,
> -			   struct drm_buddy_block *block)
> +static void drm_block_free(struct drm_buddy_block *block)
>  {
>  	kmem_cache_free(slab_blocks, block);
>  }
> @@ -131,7 +128,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>  		root_size = rounddown_pow_of_two(size);
>  		order = ilog2(root_size) - ilog2(chunk_size);
>  
> -		root = drm_block_alloc(mm, NULL, order, offset);
> +		root = drm_block_alloc(NULL, order, offset);
>  		if (!root)
>  			goto out_free_roots;
>  
> @@ -151,7 +148,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>  
>  out_free_roots:
>  	while (i--)
> -		drm_block_free(mm, mm->roots[i]);
> +		drm_block_free(mm->roots[i]);
>  	kfree(mm->roots);
>  out_free_list:
>  	kfree(mm->free_list);
> @@ -172,7 +169,7 @@ void drm_buddy_fini(struct drm_buddy *mm)
>  
>  	for (i = 0; i < mm->n_roots; ++i) {
>  		WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
> -		drm_block_free(mm, mm->roots[i]);
> +		drm_block_free(mm->roots[i]);
>  	}
>  
>  	WARN_ON(mm->avail != mm->size);
> @@ -191,14 +188,14 @@ static int split_block(struct drm_buddy *mm,
>  	BUG_ON(!drm_buddy_block_is_free(block));
>  	BUG_ON(!drm_buddy_block_order(block));
>  
> -	block->left = drm_block_alloc(mm, block, block_order, offset);
> +	block->left = drm_block_alloc(block, block_order, offset);
>  	if (!block->left)
>  		return -ENOMEM;
>  
> -	block->right = drm_block_alloc(mm, block, block_order,
> +	block->right = drm_block_alloc(block, block_order,
>  				       offset + (mm->chunk_size << block_order));
>  	if (!block->right) {
> -		drm_block_free(mm, block->left);
> +		drm_block_free(block->left);
>  		return -ENOMEM;
>  	}
>  
> @@ -257,8 +254,8 @@ static void __drm_buddy_free(struct drm_buddy *mm,
>  
>  		list_del(&buddy->link);
>  
> -		drm_block_free(mm, block);
> -		drm_block_free(mm, buddy);
> +		drm_block_free(block);
> +		drm_block_free(buddy);
>  
>  		block = parent;
>  	}
