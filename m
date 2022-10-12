Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AE65FC5F5
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 15:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D72210E4AA;
	Wed, 12 Oct 2022 13:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F1710E4AA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 13:09:39 +0000 (UTC)
Received: from kwepemi500024.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MnXx43c99z1CF0V;
 Wed, 12 Oct 2022 21:07:04 +0800 (CST)
Received: from [10.174.179.163] (10.174.179.163) by
 kwepemi500024.china.huawei.com (7.221.188.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 12 Oct 2022 21:09:35 +0800
Message-ID: <f9b1a183-9819-fb8d-48ee-85b68f40deb9@huawei.com>
Date: Wed, 12 Oct 2022 21:09:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] drm/ttm: Remove unnecessary drm_mm_clean
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <ray.huang@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
References: <20221012124735.1702700-1-zengheng4@huawei.com>
 <83c2fb62-dd6d-612a-e9e2-b45a3ef7d19a@amd.com>
Content-Language: en-US
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <83c2fb62-dd6d-612a-e9e2-b45a3ef7d19a@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.163]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500024.china.huawei.com (7.221.188.100)
X-CFilter-Loop: Reflected
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
Cc: liwei391@huawei.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022/10/12 20:56, Christian König wrote:
> Am 12.10.22 um 14:47 schrieb Zeng Heng:
>> Remove unnecessary `drm_mm_clean` calling in
>> `ttm_range_man_fini_nocheck`, due to effective
>> check is already included in the following
>> `drm_mm_takedown`.
>>
>> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
>
> Reviewed-by: Christian König <christian.koenig@amd.com>
>
> Can you push it to drm-misc-next or should I do that?

This patch applied to drm next is OK for me, if it is at your convenience.

B.R.,

Zeng Heng

>
> Thanks,
> Christian.
>
>> ---
>>   drivers/gpu/drm/ttm/ttm_range_manager.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c 
>> b/drivers/gpu/drm/ttm/ttm_range_manager.c
>> index 4cfef2b3514d..f7c16c46cfbc 100644
>> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
>> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
>> @@ -229,7 +229,6 @@ int ttm_range_man_fini_nocheck(struct ttm_device 
>> *bdev,
>>           return ret;
>>         spin_lock(&rman->lock);
>> -    drm_mm_clean(mm);
>>       drm_mm_takedown(mm);
>>       spin_unlock(&rman->lock);
>
