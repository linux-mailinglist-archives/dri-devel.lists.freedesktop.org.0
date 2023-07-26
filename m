Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1C1763228
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 11:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC7E10E444;
	Wed, 26 Jul 2023 09:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B870210E444
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 09:31:28 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-55c79b62f3aso258789a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 02:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690363888; x=1690968688;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1c1HMAKYJ9E5B+Yw2yBJ71y5Qnnu7lxJRJAz0VpzdjM=;
 b=EQF1AXz3x2yXYd4qjMocTxTPUv5xmp+rmGdaUf3NNuCw5J/jTQ4A7IZT9vF7epjgJn
 KpwUuVkJ6HJRDUdWsR7NfWHbSXC8PWsHFdh4oIHUbaD9e84jeocWSrQORf7q4ywyRFQs
 1LGzZPZFXEkz9W3LLj6dH3mxCQb9lJbVi2esRgVEZwICTBL25qmDvMRXpJTk+hKerksQ
 5luk2+UVNUyo38NcOvmQg3etwWF0YvvBh8PEUa0Itb7+IS99+a0eXqafnZ8swwiJM5Cj
 hj/kRKpfCuHQwUVrKGY+/fSvHLFGiflLsA9oD4Oo9Kuwpr8gW47+Nnd/Sw58xHubMwbF
 Qyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690363888; x=1690968688;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1c1HMAKYJ9E5B+Yw2yBJ71y5Qnnu7lxJRJAz0VpzdjM=;
 b=jP9Hy1AtUlQmfOJqqUsF9LHHCJgcU3nCBX1oChOXlXitvO9/rapi1gmun0L77fI8/P
 /lLynDQSiCPZjQFx3C8Jw2cxHlntYKGDw8sFFhlQppC74x7r93jgLHwxVzxgw7wIPbaq
 nrcs4vtcwKNF/T0XQwgL49ObxyffUvrY51Sa1bB6Y5VWxhhEpclkZd/0eetfMabG5FIi
 1a+p7vQCTulAT5pQ4Scf88oDRMHTg4mO7gSqJzSEgQ1f5YFmQjqaYfK6VGBCwFvgH218
 PJg0KUf2iOMJAFtwumFL0BbDPRU3yW9EZWTIUZvEv7FrcRwfrbrcqVEG7aFS/VOcJWQw
 IxkQ==
X-Gm-Message-State: ABy/qLao+0pb+31a+sM1GR02HhR0+ccMeFZSui4lwzfILtJEJolXAywF
 h6E76mvnBeeJYUt0A2pdptkn4Q==
X-Google-Smtp-Source: APBJJlEqsGncSKz6JEtDSHUBqLuH7hBKwqIpyMup6VZ4SlPsq4lxhQ8OawAhUiBJ+OlnlseBEBKBeQ==
X-Received: by 2002:a05:6a00:4a10:b0:686:b990:560f with SMTP id
 do16-20020a056a004a1000b00686b990560fmr1620878pfb.2.1690363888304; 
 Wed, 26 Jul 2023 02:31:28 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 z5-20020aa791c5000000b0065446092699sm11395167pfa.141.2023.07.26.02.31.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 02:31:27 -0700 (PDT)
Message-ID: <b941338c-56e7-65e7-da45-bfefc484ad80@bytedance.com>
Date: Wed, 26 Jul 2023 17:31:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 23/47] drm/msm: dynamically allocate the drm-msm_gem
 shrinker
Content-Language: en-US
To: Muchun Song <muchun.song@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-24-zhengqi.arch@bytedance.com>
 <17de3f5b-3bef-be38-9801-0e84cfe8539b@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <17de3f5b-3bef-be38-9801-0e84cfe8539b@linux.dev>
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
Cc: kvm@vger.kernel.org, djwong@kernel.org, roman.gushchin@linux.dev,
 david@fromorbit.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, cel@kernel.org,
 x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org, paulmck@kernel.org,
 linux-arm-msm@vger.kernel.org, brauner@kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, yujie.liu@intel.com, vbabka@suse.cz,
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, tytso@mit.edu,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023/7/26 15:24, Muchun Song wrote:
> 
> 
> On 2023/7/24 17:43, Qi Zheng wrote:
>> In preparation for implementing lockless slab shrink, use new APIs to
>> dynamically allocate the drm-msm_gem shrinker, so that it can be freed
>> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
>> read-side critical section when releasing the struct msm_drm_private.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> 
> A nit bellow.
> 
>> ---
>>   drivers/gpu/drm/msm/msm_drv.c          |  4 ++-
>>   drivers/gpu/drm/msm/msm_drv.h          |  4 +--
>>   drivers/gpu/drm/msm/msm_gem_shrinker.c | 36 ++++++++++++++++----------
>>   3 files changed, 28 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c 
>> b/drivers/gpu/drm/msm/msm_drv.c
>> index 891eff8433a9..7f6933be703f 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -461,7 +461,9 @@ static int msm_drm_init(struct device *dev, const 
>> struct drm_driver *drv)
>>       if (ret)
>>           goto err_msm_uninit;
>> -    msm_gem_shrinker_init(ddev);
>> +    ret = msm_gem_shrinker_init(ddev);
>> +    if (ret)
>> +        goto err_msm_uninit;
>>       if (priv->kms_init) {
>>           ret = priv->kms_init(ddev);
>> diff --git a/drivers/gpu/drm/msm/msm_drv.h 
>> b/drivers/gpu/drm/msm/msm_drv.h
>> index e13a8cbd61c9..84523d4a1e58 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.h
>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>> @@ -217,7 +217,7 @@ struct msm_drm_private {
>>       } vram;
>>       struct notifier_block vmap_notifier;
>> -    struct shrinker shrinker;
>> +    struct shrinker *shrinker;
>>       struct drm_atomic_state *pm_state;
>> @@ -279,7 +279,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, 
>> void *data,
>>   unsigned long msm_gem_shrinker_shrink(struct drm_device *dev, 
>> unsigned long nr_to_scan);
>>   #endif
>> -void msm_gem_shrinker_init(struct drm_device *dev);
>> +int msm_gem_shrinker_init(struct drm_device *dev);
>>   void msm_gem_shrinker_cleanup(struct drm_device *dev);
>>   int msm_gem_prime_mmap(struct drm_gem_object *obj, struct 
>> vm_area_struct *vma);
>> diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c 
>> b/drivers/gpu/drm/msm/msm_gem_shrinker.c
>> index f38296ad8743..7daab1298c11 100644
>> --- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
>> +++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
>> @@ -34,8 +34,7 @@ static bool can_block(struct shrink_control *sc)
>>   static unsigned long
>>   msm_gem_shrinker_count(struct shrinker *shrinker, struct 
>> shrink_control *sc)
>>   {
>> -    struct msm_drm_private *priv =
>> -        container_of(shrinker, struct msm_drm_private, shrinker);
>> +    struct msm_drm_private *priv = shrinker->private_data;
>>       unsigned count = priv->lru.dontneed.count;
>>       if (can_swap())
>> @@ -100,8 +99,7 @@ active_evict(struct drm_gem_object *obj)
>>   static unsigned long
>>   msm_gem_shrinker_scan(struct shrinker *shrinker, struct 
>> shrink_control *sc)
>>   {
>> -    struct msm_drm_private *priv =
>> -        container_of(shrinker, struct msm_drm_private, shrinker);
>> +    struct msm_drm_private *priv = shrinker->private_data;
>>       struct {
>>           struct drm_gem_lru *lru;
>>           bool (*shrink)(struct drm_gem_object *obj);
>> @@ -148,10 +146,11 @@ msm_gem_shrinker_shrink(struct drm_device *dev, 
>> unsigned long nr_to_scan)
>>       struct shrink_control sc = {
>>           .nr_to_scan = nr_to_scan,
>>       };
>> -    int ret;
>> +    unsigned long ret = SHRINK_STOP;
>>       fs_reclaim_acquire(GFP_KERNEL);
>> -    ret = msm_gem_shrinker_scan(&priv->shrinker, &sc);
>> +    if (priv->shrinker)
>> +        ret = msm_gem_shrinker_scan(priv->shrinker, &sc);
>>       fs_reclaim_release(GFP_KERNEL);
>>       return ret;
>> @@ -210,16 +209,27 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, 
>> unsigned long event, void *ptr)
>>    *
>>    * This function registers and sets up the msm shrinker.
>>    */
>> -void msm_gem_shrinker_init(struct drm_device *dev)
>> +int msm_gem_shrinker_init(struct drm_device *dev)
>>   {
>>       struct msm_drm_private *priv = dev->dev_private;
>> -    priv->shrinker.count_objects = msm_gem_shrinker_count;
>> -    priv->shrinker.scan_objects = msm_gem_shrinker_scan;
>> -    priv->shrinker.seeks = DEFAULT_SEEKS;
>> -    WARN_ON(register_shrinker(&priv->shrinker, "drm-msm_gem"));
>> +
>> +    priv->shrinker = shrinker_alloc(0, "drm-msm_gem");
>> +    if (!priv->shrinker) {
> 
> Just "if (WARN_ON(!priv->shrinker))"

As suggested by Steven Pric in patch #24, this warning is
unnecessary, so I will remove it in the next version.

> 
>> +        WARN_ON(1);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    priv->shrinker->count_objects = msm_gem_shrinker_count;
>> +    priv->shrinker->scan_objects = msm_gem_shrinker_scan;
>> +    priv->shrinker->seeks = DEFAULT_SEEKS;
>> +    priv->shrinker->private_data = priv;
>> +
>> +    shrinker_register(priv->shrinker);
>>       priv->vmap_notifier.notifier_call = msm_gem_shrinker_vmap;
>>       WARN_ON(register_vmap_purge_notifier(&priv->vmap_notifier));
>> +
>> +    return 0;
>>   }
>>   /**
>> @@ -232,8 +242,8 @@ void msm_gem_shrinker_cleanup(struct drm_device *dev)
>>   {
>>       struct msm_drm_private *priv = dev->dev_private;
>> -    if (priv->shrinker.nr_deferred) {
>> +    if (priv->shrinker) {
>>           WARN_ON(unregister_vmap_purge_notifier(&priv->vmap_notifier));
>> -        unregister_shrinker(&priv->shrinker);
>> +        shrinker_unregister(priv->shrinker);
>>       }
>>   }
> 
