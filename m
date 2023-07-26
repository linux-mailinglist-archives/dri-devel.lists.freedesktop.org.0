Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 456367631B3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 11:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95CA410E198;
	Wed, 26 Jul 2023 09:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924E910E198
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 09:22:15 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-682a5465e9eso1485689b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 02:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690363335; x=1690968135;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xHFf+qIXuXcHU2hnpeM9isQldhnSqSauyHf1oBu4R8I=;
 b=jAMndxc3vAfZ9MlugwiN2m1td4+ENgo1ZcEkULNu4w0l2e+7SjL15Aj8xsnH/hg6mq
 Yuh7Pj+WIpy+9FKbmqcmIZPowwXwCsZ/HE/uYPa/USpf5RWRvsmKXdX1EOhGqDHtCRhA
 5Tx4ycmmPjyUjagwQ6weN00EPkG2yYEGVkFAeT+5NL38WWOxpIAWxDe7x+TtdzGSmFXw
 AaN6OIhFdWcuFQV9AajQEHTHNR/HQhAWIjBkgsz+1GmBQBDd2nNKfKbDgsLcpETIdF18
 CdbQtqtDxhcETBnzscklNfC8QDSVXvKpexDlKf4G6IIrjU6vkXpbe5y1T2yEBA/OqHN2
 vBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690363335; x=1690968135;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xHFf+qIXuXcHU2hnpeM9isQldhnSqSauyHf1oBu4R8I=;
 b=P5pci5gycU50i2D0q3ifdKz51p7HHTEXeE0aIK9kc8M0m19BfhdczSoa7uDlBYSORU
 Eqs8lqWPNgTuOU9g63PYeBV72OoKM4sco7FxGFpvluIcFThKqpdGdMMwduSLZWddJb6i
 Sna29KCyEohtjyAvTE0YrLxh1m6MT3AMMBqROu8TWZ9p8KV3Z0uncGxRcvFiA8dVkuK8
 0iJVTnNQ8yMIR1WT+uVI5VY1v2i68MR9RgmP6/5DViiHHG5EPDRQbrX9gGxjKXlM14im
 2q40wpcl4b69Kuim4CgX8BsEhdcGLafspF+5sAvKoOH9CbR34uN+SNnXp8pZUMsVb8qG
 74tQ==
X-Gm-Message-State: ABy/qLYGyqWwAc7EPwr2spiBElkQQ7dZ1EDQFSvN4ygDluWA/E5LH1VY
 C/NbIlI6lVjuFVDwX5Pk85WXZA==
X-Google-Smtp-Source: APBJJlGzKLkoeooTK7rnc1fJ6mfD6dUCrzzNETRC7Ci4c1Yh8zXhisYlXfajH5gn3qqQbLizO8XVQA==
X-Received: by 2002:a05:6a20:729a:b0:100:b92b:e8be with SMTP id
 o26-20020a056a20729a00b00100b92be8bemr1779967pzk.2.1690363335131; 
 Wed, 26 Jul 2023 02:22:15 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 k11-20020aa790cb000000b006827c26f147sm10955045pfk.138.2023.07.26.02.22.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 02:22:14 -0700 (PDT)
Message-ID: <d96777ce-be8a-1665-dd00-1e696e5575a8@bytedance.com>
Date: Wed, 26 Jul 2023 17:22:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 11/47] gfs2: dynamically allocate the gfs2-qd shrinker
Content-Language: en-US
To: Muchun Song <muchun.song@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-12-zhengqi.arch@bytedance.com>
 <e7204276-9de5-17eb-90ae-e51657d73ef4@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <e7204276-9de5-17eb-90ae-e51657d73ef4@linux.dev>
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



On 2023/7/26 14:49, Muchun Song wrote:
> 
> 
> On 2023/7/24 17:43, Qi Zheng wrote:
>> Use new APIs to dynamically allocate the gfs2-qd shrinker.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>>   fs/gfs2/main.c  |  6 +++---
>>   fs/gfs2/quota.c | 26 ++++++++++++++++++++------
>>   fs/gfs2/quota.h |  3 ++-
>>   3 files changed, 25 insertions(+), 10 deletions(-)
>>
>> diff --git a/fs/gfs2/main.c b/fs/gfs2/main.c
>> index afcb32854f14..e47b1cc79f59 100644
>> --- a/fs/gfs2/main.c
>> +++ b/fs/gfs2/main.c
>> @@ -147,7 +147,7 @@ static int __init init_gfs2_fs(void)
>>       if (!gfs2_trans_cachep)
>>           goto fail_cachep8;
>> -    error = register_shrinker(&gfs2_qd_shrinker, "gfs2-qd");
>> +    error = gfs2_qd_shrinker_init();
>>       if (error)
>>           goto fail_shrinker;
>> @@ -196,7 +196,7 @@ static int __init init_gfs2_fs(void)
>>   fail_wq2:
>>       destroy_workqueue(gfs_recovery_wq);
>>   fail_wq1:
>> -    unregister_shrinker(&gfs2_qd_shrinker);
>> +    gfs2_qd_shrinker_exit();
>>   fail_shrinker:
>>       kmem_cache_destroy(gfs2_trans_cachep);
>>   fail_cachep8:
>> @@ -229,7 +229,7 @@ static int __init init_gfs2_fs(void)
>>   static void __exit exit_gfs2_fs(void)
>>   {
>> -    unregister_shrinker(&gfs2_qd_shrinker);
>> +    gfs2_qd_shrinker_exit();
>>       gfs2_glock_exit();
>>       gfs2_unregister_debugfs();
>>       unregister_filesystem(&gfs2_fs_type);
>> diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
>> index 704192b73605..bc9883cea847 100644
>> --- a/fs/gfs2/quota.c
>> +++ b/fs/gfs2/quota.c
>> @@ -186,13 +186,27 @@ static unsigned long gfs2_qd_shrink_count(struct 
>> shrinker *shrink,
>>       return vfs_pressure_ratio(list_lru_shrink_count(&gfs2_qd_lru, sc));
>>   }
>> -struct shrinker gfs2_qd_shrinker = {
>> -    .count_objects = gfs2_qd_shrink_count,
>> -    .scan_objects = gfs2_qd_shrink_scan,
>> -    .seeks = DEFAULT_SEEKS,
>> -    .flags = SHRINKER_NUMA_AWARE,
>> -};
>> +static struct shrinker *gfs2_qd_shrinker;
>> +
>> +int gfs2_qd_shrinker_init(void)
> 
> It's better to declare this as __init.

OK, Will do.

> 
>> +{
>> +    gfs2_qd_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE, "gfs2-qd");
>> +    if (!gfs2_qd_shrinker)
>> +        return -ENOMEM;
>> +
>> +    gfs2_qd_shrinker->count_objects = gfs2_qd_shrink_count;
>> +    gfs2_qd_shrinker->scan_objects = gfs2_qd_shrink_scan;
>> +    gfs2_qd_shrinker->seeks = DEFAULT_SEEKS;
>> +
>> +    shrinker_register(gfs2_qd_shrinker);
>> +    return 0;
>> +}
>> +
>> +void gfs2_qd_shrinker_exit(void)
>> +{
>> +    shrinker_unregister(gfs2_qd_shrinker);
>> +}
>>   static u64 qd2index(struct gfs2_quota_data *qd)
>>   {
>> diff --git a/fs/gfs2/quota.h b/fs/gfs2/quota.h
>> index 21ada332d555..f9cb863373f7 100644
>> --- a/fs/gfs2/quota.h
>> +++ b/fs/gfs2/quota.h
>> @@ -59,7 +59,8 @@ static inline int gfs2_quota_lock_check(struct 
>> gfs2_inode *ip,
>>   }
>>   extern const struct quotactl_ops gfs2_quotactl_ops;
>> -extern struct shrinker gfs2_qd_shrinker;
>> +int gfs2_qd_shrinker_init(void);
>> +void gfs2_qd_shrinker_exit(void);
>>   extern struct list_lru gfs2_qd_lru;
>>   extern void __init gfs2_quota_hash_init(void);
> 
