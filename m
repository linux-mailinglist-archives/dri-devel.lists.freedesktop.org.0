Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 056FD53E40F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 12:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C8110E460;
	Mon,  6 Jun 2022 10:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93BF10E1CE;
 Mon,  6 Jun 2022 10:20:31 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id a15so10683162wrh.2;
 Mon, 06 Jun 2022 03:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EuXDZRhRuhRCmRhs3PpKrJLa+cdvtSiMZjyeJ20l9a4=;
 b=FtR4Qc7xmbd9AR3erDAvaIorvvnPRGnS8BNPLB71cWIPZs6aIE+TtMfN0T0WySyz43
 Zt0CVi1dz5QDAstQyRJzjSBpElW1gW3OI1fqrMQ+bm8S1gD9VulOBbZk1ZkC0aF+/osm
 nBtBv+nSbrmh9RtVt68APlGx9Ju4tKu7XtURM80rMNkA0HM2TjE+lzNGGh59Kmxfi2jG
 8h6iIR6cLRuc0wD8yRBUwtnG0h7Ai/d3sPnooqRKCiV0PODSN8nhUoVSUsCrL6pd3Rbz
 hSP6p0HhMMQo2N23Zsq2rEKn2GYQnCEmVp50o9xPsVGgmm45rTXWG6VUcWMWlTey114G
 e8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EuXDZRhRuhRCmRhs3PpKrJLa+cdvtSiMZjyeJ20l9a4=;
 b=mZtcKcS7Nc0y8tUXHAXKKFXrvrcF+pePCcCKZImKnX6MDM4HzUuAkua7FzfhCCqzSe
 6G1PSMLAtZXT2bXjIeYd58Fzv5Xra0Bd83HcL1xI2ZlyAPLay9Z49Yl2Y8CLkCj5boY3
 BB0v/QNuGuFDe5r+gaBXddU/oskkp6Xhb1tiXzlzosYfHudqskdmTI+3iWXujG2vgJCz
 qJuKWzbNUUu84FNbAPxZ4SFokrTWYQKmYXVmRi6S4WIrG7CxGtG2YxLE/SKVjtiJmTQP
 tySsiEE3blZ7+wXU34fwUbSxDV+1MHSuf0f5Apo3MAQIRSuyusIrxmn4uQY3OqncYzcH
 etag==
X-Gm-Message-State: AOAM5321ni4sRqOX4pFVo6ufnRL5mSiMDU07cWH2zxlteOeLDLeuSN7/
 Lbmi3sY/vhJmBxyELTasnik=
X-Google-Smtp-Source: ABdhPJw+sfOyH2JSm6Nz0dAlbCzNUEypLdOhFTHlGgb2PNjTiTbSt3eHmvhdiQg5qFqkf2M2z1uPDA==
X-Received: by 2002:a05:6000:1111:b0:212:d9ea:8609 with SMTP id
 z17-20020a056000111100b00212d9ea8609mr20148395wrw.522.1654510830385; 
 Mon, 06 Jun 2022 03:20:30 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:2d98:9160:7074:86ca?
 ([2a02:908:1256:79a0:2d98:9160:7074:86ca])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c4ec900b0039c17452732sm22820694wmq.19.2022.06.06.03.20.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 03:20:29 -0700 (PDT)
Message-ID: <dbb8694b-74d2-f205-1736-926faa858868@gmail.com>
Date: Mon, 6 Jun 2022 12:20:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/ttm: fix missing NULL check in ttm_device_swapout
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>, mike@fireburn.co.uk,
 dri-devel@lists.freedesktop.org,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20220603104604.456991-1-christian.koenig@amd.com>
 <c9b23cac-6bf0-e8ad-d6b1-f59c1ee1569f@amd.com>
 <29cb2391-3a91-dbef-da59-65d1ea1e50a7@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <29cb2391-3a91-dbef-da59-65d1ea1e50a7@amd.com>
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.06.22 um 00:44 schrieb Felix Kuehling:
> [+amd-gfx]
>
>
> On 2022-06-03 15:37, Felix Kuehling wrote:
>>
>> On 2022-06-03 06:46, Christian König wrote:
>>> Resources about to be destructed are not tied to BOs any more.
>> I've been seeing a backtrace in that area with a patch series I'm 
>> working on, but didn't have enough time to track it down yet. I'll 
>> try if this patch fixes it.
>
> The patch doesn't apply on amd-staging-drm-next. I made the following 
> change instead, which fixes my problem (and I do see the pr_err being 
> triggered):
>
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -157,6 +157,10 @@ int ttm_device_swapout(struct ttm_device *bdev, 
> struct ttm_operation_ctx *ctx,
>                         list_for_each_entry(bo, &man->lru[j], lru) {
>                                 uint32_t num_pages = 
> PFN_UP(bo->base.size);
>
> +                               if (!bo->resource) {
> +                                       pr_err("### bo->resource is 
> NULL\n");
> +                                       continue;
> +                               }

Yeah, that should be functional identical.

Can I get an rb for that? Going to provide backports to older kernels as 
well then.

Regards,
Christian.

> ret = ttm_bo_swapout(bo, ctx, gfp_flags);
>                                 /* ttm_bo_swapout has dropped the 
> lru_lock */
>                                 if (!ret)
>
>>
>> Regards,
>>   Felix
>>
>>
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/drm/ttm/ttm_device.c | 6 +++++-
>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c 
>>> b/drivers/gpu/drm/ttm/ttm_device.c
>>> index a0562ab386f5..e7147e304637 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>>> @@ -156,8 +156,12 @@ int ttm_device_swapout(struct ttm_device *bdev, 
>>> struct ttm_operation_ctx *ctx,
>>>             ttm_resource_manager_for_each_res(man, &cursor, res) {
>>>               struct ttm_buffer_object *bo = res->bo;
>>> -            uint32_t num_pages = PFN_UP(bo->base.size);
>>> +            uint32_t num_pages;
>>>   +            if (!bo)
>>> +                continue;
>>> +
>>> +            num_pages = PFN_UP(bo->base.size);
>>>               ret = ttm_bo_swapout(bo, ctx, gfp_flags);
>>>               /* ttm_bo_swapout has dropped the lru_lock */
>>>               if (!ret)

