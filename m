Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0804E4D89
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 08:46:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289FD10E603;
	Wed, 23 Mar 2022 07:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2BE10E5DA;
 Wed, 23 Mar 2022 07:46:01 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so438842wmp.5; 
 Wed, 23 Mar 2022 00:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/tI7zGGt+x41R8KiHPdUoyOyIHkSUkQkSEGje6l4sPc=;
 b=gvXuyor1r5VScZ8n5Zh4o6Y9gQh6rZJFY1kEFcMtzVxKGQTY/7qwiDdQXNE0aWIwc+
 jAz5swm1D9WW2q0c8up7KKaqIfSLBwSg+lbXcx3jKfO5zTO6R/OJs/QH/2e0AfDlYrC1
 Gtc0KY7LKyBwuk8fynX25OKMTXX7EUxVzLM5dhRe8cgjbgEFrpMhNujdBQOZz5Zw42W9
 nXxDEF/+UZ1IyH4B+/GuRno5S3KKiDlWFGRqdKwsBNVqW/vZoTm1GufSHHwJbpHM+z+R
 VkS5pPBvNpQCYp8BKUhaCZxBEELX69MQGoG0pBGJoYNmOVHs3QnDhYRm7Ijkd7cw7hD+
 nxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/tI7zGGt+x41R8KiHPdUoyOyIHkSUkQkSEGje6l4sPc=;
 b=zZoQB0ywTipgbsTfJTQeciu11+cgNg8hakVYSblYSHS8pGMHJGgPLKHD8zIb5cdrzm
 B0lQocI2a1ts9X0rBx1g7uwi42IgBANqWcUFC0ZwI36SVFa1gbOxNM7eHWulNuitQLDw
 CcLG5b8i7H0Q5jgLF1l0j3VjyQWlALfs6mPTUggbT74wtPWUCZszfHVId79URLc0XZjw
 kbRI5fatvmAl4hE2LIyJ9bNc5ZiNxcJTGGcWLEOe495o8MxhK4zjL1V7WOrNuv8tmn6y
 551G+wYK9Y8DurdXtBDDR5d8TgspiMCaZZHokmi7C8qPiSmXpbW2JrTCsfEBvEbJvIMA
 sJAQ==
X-Gm-Message-State: AOAM531Fk3aYOleQ9NmA5zVYDjl+apKtWDrNzeZqs1ddH+524Z2q3V3k
 ntzrQwmlM2f42wWmf5D4/sI=
X-Google-Smtp-Source: ABdhPJxFjKMowJE1R5p36CQo58LE9rKLtPs3b7wfECKQIDeNHCjHfeZUw592zFRi0CWBjFNtLQwuew==
X-Received: by 2002:a05:600c:3b08:b0:38c:c8f1:16ca with SMTP id
 m8-20020a05600c3b0800b0038cc8f116camr1108644wms.192.1648021559991; 
 Wed, 23 Mar 2022 00:45:59 -0700 (PDT)
Received: from [192.168.178.21] (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a05600c4e8d00b0038c949ef0d5sm3704767wmq.8.2022.03.23.00.45.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 00:45:59 -0700 (PDT)
Message-ID: <72e9b499-f31f-41d3-aee2-130f83115fc1@gmail.com>
Date: Wed, 23 Mar 2022 08:45:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] drm: add a check to verify the size alignment
Content-Language: en-US
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220323073426.228866-1-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220323073426.228866-1-Arunpravin.PaneerSelvam@amd.com>
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
Cc: alexander.deucher@amd.com, pmenzel@molgen.mpg.de, matthew.auld@intel.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.03.22 um 08:34 schrieb Arunpravin Paneer Selvam:
> Add a simple check to reject any size not aligned to the
> min_page_size.
>
> handle instances when size is not aligned with the min_page_size.
> Unigine Heaven has allocation requests for example required pages
> are 257 and alignment request is 256. To allocate the left over 1
> page, continues the iteration to find the order value which is 0
> and when it compares with min_order = 8, triggers the BUG_ON(order
> < min_order). To avoid this problem, we added a simple check to
> return -EINVAL if size is not aligned to the min_page_size.
>
> v2: Added more details to the commit description
>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/drm_buddy.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 72f52f293249..b503c88786b0 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -661,6 +661,9 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   	if (range_overflows(start, size, mm->size))
>   		return -EINVAL;
>   
> +	if (WARN_ON(!IS_ALIGNED(size, min_page_size)))
> +		return -EINVAL;
> +

I'm not that happy with the handling here.

See a minimum page size larger than the requested size is perfectly 
valid, it just means that the remaining pages needs to be trimmed.

In other words when the request is to allocate 1 page with an alignment 
of 256 we just need to give the remaining 255 pages back to the allocator.

Regards,
Christian.

>   	/* Actual range allocation */
>   	if (start + size == end)
>   		return __drm_buddy_alloc_range(mm, start, size, blocks);
>
> base-commit: 056d47eaf6ea753fa2e21da31f9cbd8b721bbb7b

