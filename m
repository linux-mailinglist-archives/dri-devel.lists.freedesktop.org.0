Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8C776324F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 11:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDCEF10E44F;
	Wed, 26 Jul 2023 09:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AAA10E44F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 09:33:50 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-66d6a9851f3so1489405b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 02:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690364030; x=1690968830;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0oULOTnWb1HIc+jcDQkyDbPD+ewEuK6cRZsxNFZBJHs=;
 b=QJhhRpaTfMAfucHkCz2d9TS31hpYk30s2kQKv681O+Sl1mLTZQhZq5VKb4l9mXe+gX
 5Eax6ixoNcCSNY9H6aAkwgnBd/g9cM9X43ylT+UhHbYekfmlgjo/JXqlix6WaCFQ7jVV
 2D4QfnYhGItzA17GFTgozRmivkdC7H5IwsXEWhmkOBzQK5UpXhnT6Ls+I4I3tsoeozxU
 24KbqK2Cq3sIWZ8RaqWYBiX9Q9627K0AND5qR2t9+dtM8IjHsDiCPK6lh5ggLgTON/bP
 sMZVbirBGOz1XlXtXsxmGmw+9U7+KmVQpZdmOnau0hPanAHKCfZx0jR+DbnWSE4a/7ep
 yq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690364030; x=1690968830;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0oULOTnWb1HIc+jcDQkyDbPD+ewEuK6cRZsxNFZBJHs=;
 b=KObSWNNGxagcPuabS5r27D76zaZNeLNNW8qJ/o6P1GNdxyRlX0tGYtiqJIvdaFEekO
 IJL/pGQsNgy3a96WVBvK9LxL3drAQa2dAi5EABJ3qmXjO/JJFQfG9EAQJ/52ZiTuOljq
 8nZKb8J6a0mQq6NhvkjbuJp38v+L5hVnykOVTG1314e3UJwkdgpudsqsh2g1fBrsoDF7
 zyzC4wXeWHtzxz+BbuMRYomJ2fvMhbJ65giIzDUiZ/MMkMwpDxI4H2Dvg+SFA9c6UmDn
 RNVRtUWzN/d30EjE6ogv0404uqeKkk3Jf/pATY5SI8AcQByqlJxPtOVYi/iB3p1lH3h0
 vn/Q==
X-Gm-Message-State: ABy/qLZ/OTnBaW/bIhSV6Sc6y8GMXQV9dhPx87WSVuVWOSJsdGTpIfn9
 5DgD4r5fzpINQ7/S/ctLqIVJ2A==
X-Google-Smtp-Source: APBJJlG8LKe8O0SB++JE7Hsj6dMankp6b2TdGG8KZmgQCX7ZvwrXNm6kysx08G1J6PXDjDRRJyafNA==
X-Received: by 2002:a17:903:32c9:b0:1b8:5827:8763 with SMTP id
 i9-20020a17090332c900b001b858278763mr2037984plr.4.1690364030014; 
 Wed, 26 Jul 2023 02:33:50 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a170902d2c500b001b89466a5f4sm12582766plc.105.2023.07.26.02.33.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 02:33:49 -0700 (PDT)
Message-ID: <0f12022e-5dd2-fb1c-f018-05f8ff0303ae@bytedance.com>
Date: Wed, 26 Jul 2023 17:33:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 28/47] bcache: dynamically allocate the md-bcache
 shrinker
Content-Language: en-US
To: Muchun Song <muchun.song@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-29-zhengqi.arch@bytedance.com>
 <4ee26da4-314e-0517-5d9a-31fb107368ef@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <4ee26da4-314e-0517-5d9a-31fb107368ef@linux.dev>
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



On 2023/7/26 15:32, Muchun Song wrote:
> 
> 
> On 2023/7/24 17:43, Qi Zheng wrote:
>> In preparation for implementing lockless slab shrink, use new APIs to
>> dynamically allocate the md-bcache shrinker, so that it can be freed
>> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
>> read-side critical section when releasing the struct cache_set.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>>   drivers/md/bcache/bcache.h |  2 +-
>>   drivers/md/bcache/btree.c  | 27 ++++++++++++++++-----------
>>   drivers/md/bcache/sysfs.c  |  3 ++-
>>   3 files changed, 19 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/md/bcache/bcache.h b/drivers/md/bcache/bcache.h
>> index 5a79bb3c272f..c622bc50f81b 100644
>> --- a/drivers/md/bcache/bcache.h
>> +++ b/drivers/md/bcache/bcache.h
>> @@ -541,7 +541,7 @@ struct cache_set {
>>       struct bio_set        bio_split;
>>       /* For the btree cache */
>> -    struct shrinker        shrink;
>> +    struct shrinker        *shrink;
>>       /* For the btree cache and anything allocation related */
>>       struct mutex        bucket_lock;
>> diff --git a/drivers/md/bcache/btree.c b/drivers/md/bcache/btree.c
>> index fd121a61f17c..c176c7fc77d9 100644
>> --- a/drivers/md/bcache/btree.c
>> +++ b/drivers/md/bcache/btree.c
>> @@ -667,7 +667,7 @@ static int mca_reap(struct btree *b, unsigned int 
>> min_order, bool flush)
>>   static unsigned long bch_mca_scan(struct shrinker *shrink,
>>                     struct shrink_control *sc)
>>   {
>> -    struct cache_set *c = container_of(shrink, struct cache_set, 
>> shrink);
>> +    struct cache_set *c = shrink->private_data;
>>       struct btree *b, *t;
>>       unsigned long i, nr = sc->nr_to_scan;
>>       unsigned long freed = 0;
>> @@ -734,7 +734,7 @@ static unsigned long bch_mca_scan(struct shrinker 
>> *shrink,
>>   static unsigned long bch_mca_count(struct shrinker *shrink,
>>                      struct shrink_control *sc)
>>   {
>> -    struct cache_set *c = container_of(shrink, struct cache_set, 
>> shrink);
>> +    struct cache_set *c = shrink->private_data;
>>       if (c->shrinker_disabled)
>>           return 0;
>> @@ -752,8 +752,8 @@ void bch_btree_cache_free(struct cache_set *c)
>>       closure_init_stack(&cl);
>> -    if (c->shrink.list.next)
>> -        unregister_shrinker(&c->shrink);
>> +    if (c->shrink)
>> +        shrinker_unregister(c->shrink);
>>       mutex_lock(&c->bucket_lock);
>> @@ -828,14 +828,19 @@ int bch_btree_cache_alloc(struct cache_set *c)
>>           c->verify_data = NULL;
>>   #endif
>> -    c->shrink.count_objects = bch_mca_count;
>> -    c->shrink.scan_objects = bch_mca_scan;
>> -    c->shrink.seeks = 4;
>> -    c->shrink.batch = c->btree_pages * 2;
>> +    c->shrink = shrinker_alloc(0, "md-bcache:%pU", c->set_uuid);
>> +    if (!c->shrink) {
>> +        pr_warn("bcache: %s: could not allocate shrinker\n", __func__);
>> +        return -ENOMEM;
> 
> Seems you have cheanged the semantic of this. In the past,
> it is better to have a shrinker, but now it becomes a mandatory.
> Right? I don't know if it is acceptable. From my point of view,
> just do the cleanup, don't change any behaviour.

Oh, should return 0 here, will do.

> 
>> +    }
>> +
>> +    c->shrink->count_objects = bch_mca_count;
>> +    c->shrink->scan_objects = bch_mca_scan;
>> +    c->shrink->seeks = 4;
>> +    c->shrink->batch = c->btree_pages * 2;
>> +    c->shrink->private_data = c;
>> -    if (register_shrinker(&c->shrink, "md-bcache:%pU", c->set_uuid))
>> -        pr_warn("bcache: %s: could not register shrinker\n",
>> -                __func__);
>> +    shrinker_register(c->shrink);
>>       return 0;
>>   }
>> diff --git a/drivers/md/bcache/sysfs.c b/drivers/md/bcache/sysfs.c
>> index 0e2c1880f60b..45d8af755de6 100644
>> --- a/drivers/md/bcache/sysfs.c
>> +++ b/drivers/md/bcache/sysfs.c
>> @@ -866,7 +866,8 @@ STORE(__bch_cache_set)
>>           sc.gfp_mask = GFP_KERNEL;
>>           sc.nr_to_scan = strtoul_or_return(buf);
>> -        c->shrink.scan_objects(&c->shrink, &sc);
>> +        if (c->shrink)
>> +            c->shrink->scan_objects(c->shrink, &sc);
>>       }
>>       sysfs_strtoul_clamp(congested_read_threshold_us,
> 
