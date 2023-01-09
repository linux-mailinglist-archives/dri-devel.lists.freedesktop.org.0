Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A567C6622B0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 11:13:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20CC10E3B7;
	Mon,  9 Jan 2023 10:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B4C10E3AF;
 Mon,  9 Jan 2023 10:13:31 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id qk9so18800789ejc.3;
 Mon, 09 Jan 2023 02:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OWDI1MgxL/tmvA0NEV7h+e9N1yw/Y8AfDqibTRwZNtg=;
 b=ZcS/Ya23uW74wDrALUJvNKPSDwCX6GINryeKm3hGJcGGFmo8gmExeHNEqtl42FZPE6
 1QNennyQ1cz0gSvZznvKySBLdgswiArkH9yTi8ixiCtN313K68bvzM+iB0nG+mUKq1Bj
 ArZ+w6ERAaCljQjwYsJ4c9EM6gcHFy8m6BtUbdHYFyoPTPmqzvAEOPj53CVvojrUwx1N
 ifijV6QPuRZYZ6BUZi4cOwW9iV3jE5y3B6rASMzU/ZDlzddxsyj5tQZhoFr6t+uWwaN3
 mRxHuuzewvyGl46EeZry//dpI7NuPcY7PvLUYlySgxw/xdTA0NnNj8/ziyUDm9jz+rG7
 Xi7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OWDI1MgxL/tmvA0NEV7h+e9N1yw/Y8AfDqibTRwZNtg=;
 b=STsBFufSx6uaYNeNJdfVcIT9woKk1YU4CfXZb8EQgNlAzoegIMs/gmXD1FG7olMsqf
 97mRt/Vruaqd0HRPgrgBrNQzc9hP7k3o2oNWr+gEoWqLDd/j+JHo+D0biXoUSYVIJD2P
 gZcPCRaw7CIUTBub1LMTxmL9uD97ktO/f9mTubiXOQiJfLN8VVUe7Gt+Ry66g38BHMuZ
 HcrRg0+TEJmjuUzBt32Xr4E1y/z5TF3vf+Vt5BqJnuSlHn8vsjs5Q9CGKSPb0AbrZ3nS
 wOFqV7hE3Mdo5tSt2lJs+PdAK2tUdf3M5axxXGjiI9RVkL5QUBF1rsQPQHyhj6U27sOg
 T+WQ==
X-Gm-Message-State: AFqh2krRCvW9/tjEuWMwcvfTA3l7Oy/p6ODyT0l5ZtMRYnachYhYXT3j
 QyYiOUo9Z3v3TtP+x84Sc9k=
X-Google-Smtp-Source: AMrXdXuBdecK0uZ3Vpq4DRwbUHm3eVqMbgwMHCVqashcx9KLmAW3Drm8d6H1VNkmu61nW2HHTkH9Hg==
X-Received: by 2002:a17:906:c0c2:b0:836:3d22:5d73 with SMTP id
 bn2-20020a170906c0c200b008363d225d73mr54555509ejb.39.1673259210337; 
 Mon, 09 Jan 2023 02:13:30 -0800 (PST)
Received: from [192.168.178.21] (p5b0ea2e7.dip0.t-ipconnect.de.
 [91.14.162.231]) by smtp.gmail.com with ESMTPSA id
 r2-20020a17090609c200b007bd28b50305sm3544634eje.200.2023.01.09.02.13.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 02:13:29 -0800 (PST)
Message-ID: <8354c408-623a-1fc0-d5e0-201a0bce0309@gmail.com>
Date: Mon, 9 Jan 2023 11:13:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm: Alloc high address for drm buddy topdown flag
Content-Language: en-US
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, matthew.auld@intel.com,
 christian.koenig@amd.com, alexander.deucher@amd.com
References: <20230107151523.29864-1-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230107151523.29864-1-Arunpravin.PaneerSelvam@amd.com>
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

Am 07.01.23 um 16:15 schrieb Arunpravin Paneer Selvam:
> As we are observing low numbers in viewperf graphics benchmark, we
> are strictly not allowing the top down flag enabled allocations
> to steal the memory space from cpu visible region.
>
> The approach is, we are sorting each order list entries in
> ascending order and compare the last entry of each order
> list in the freelist and return the max block.
>
> This patch improves the viewperf 3D benchmark scores.
>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>

Acked-by: Christian König <christian.koenig@amd.com>, but somebody with more insight of the drm buddy allocator should take a closer look at this.


> ---
>   drivers/gpu/drm/drm_buddy.c | 81 ++++++++++++++++++++++++-------------
>   1 file changed, 54 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 11bb59399471..50916b2f2fc5 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -38,6 +38,25 @@ static void drm_block_free(struct drm_buddy *mm,
>   	kmem_cache_free(slab_blocks, block);
>   }
>   
> +static void list_insert_sorted(struct drm_buddy *mm,
> +			       struct drm_buddy_block *block)
> +{
> +	struct drm_buddy_block *node;
> +	struct list_head *head;
> +
> +	head = &mm->free_list[drm_buddy_block_order(block)];
> +	if (list_empty(head)) {
> +		list_add(&block->link, head);
> +		return;
> +	}
> +
> +	list_for_each_entry(node, head, link)
> +		if (drm_buddy_block_offset(block) < drm_buddy_block_offset(node))
> +			break;
> +
> +	__list_add(&block->link, node->link.prev, &node->link);
> +}
> +
>   static void mark_allocated(struct drm_buddy_block *block)
>   {
>   	block->header &= ~DRM_BUDDY_HEADER_STATE;
> @@ -52,8 +71,7 @@ static void mark_free(struct drm_buddy *mm,
>   	block->header &= ~DRM_BUDDY_HEADER_STATE;
>   	block->header |= DRM_BUDDY_FREE;
>   
> -	list_add(&block->link,
> -		 &mm->free_list[drm_buddy_block_order(block)]);
> +	list_insert_sorted(mm, block);
>   }
>   
>   static void mark_split(struct drm_buddy_block *block)
> @@ -387,20 +405,26 @@ alloc_range_bias(struct drm_buddy *mm,
>   }
>   
>   static struct drm_buddy_block *
> -get_maxblock(struct list_head *head)
> +get_maxblock(struct drm_buddy *mm, unsigned int order)
>   {
>   	struct drm_buddy_block *max_block = NULL, *node;
> +	unsigned int i;
>   
> -	max_block = list_first_entry_or_null(head,
> -					     struct drm_buddy_block,
> -					     link);
> -	if (!max_block)
> -		return NULL;
> +	for (i = order; i <= mm->max_order; ++i) {
> +		if (!list_empty(&mm->free_list[i])) {
> +			node = list_last_entry(&mm->free_list[i],
> +					       struct drm_buddy_block,
> +					       link);
> +			if (!max_block) {
> +				max_block = node;
> +				continue;
> +			}
>   
> -	list_for_each_entry(node, head, link) {
> -		if (drm_buddy_block_offset(node) >
> -		    drm_buddy_block_offset(max_block))
> -			max_block = node;
> +			if (drm_buddy_block_offset(node) >
> +				drm_buddy_block_offset(max_block)) {
> +				max_block = node;
> +			}
> +		}
>   	}
>   
>   	return max_block;
> @@ -412,20 +436,23 @@ alloc_from_freelist(struct drm_buddy *mm,
>   		    unsigned long flags)
>   {
>   	struct drm_buddy_block *block = NULL;
> -	unsigned int i;
> +	unsigned int tmp;
>   	int err;
>   
> -	for (i = order; i <= mm->max_order; ++i) {
> -		if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
> -			block = get_maxblock(&mm->free_list[i]);
> -			if (block)
> -				break;
> -		} else {
> -			block = list_first_entry_or_null(&mm->free_list[i],
> -							 struct drm_buddy_block,
> -							 link);
> -			if (block)
> -				break;
> +	if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
> +		block = get_maxblock(mm, order);
> +		if (block)
> +			/* Store the obtained block order */
> +			tmp = drm_buddy_block_order(block);
> +	} else {
> +		for (tmp = order; tmp <= mm->max_order; ++tmp) {
> +			if (!list_empty(&mm->free_list[tmp])) {
> +				block = list_last_entry(&mm->free_list[tmp],
> +							struct drm_buddy_block,
> +							link);
> +				if (block)
> +					break;
> +			}
>   		}
>   	}
>   
> @@ -434,18 +461,18 @@ alloc_from_freelist(struct drm_buddy *mm,
>   
>   	BUG_ON(!drm_buddy_block_is_free(block));
>   
> -	while (i != order) {
> +	while (tmp != order) {
>   		err = split_block(mm, block);
>   		if (unlikely(err))
>   			goto err_undo;
>   
>   		block = block->right;
> -		i--;
> +		tmp--;
>   	}
>   	return block;
>   
>   err_undo:
> -	if (i != order)
> +	if (tmp != order)
>   		__drm_buddy_free(mm, block);
>   	return ERR_PTR(err);
>   }

