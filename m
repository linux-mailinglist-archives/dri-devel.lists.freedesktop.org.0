Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A28764E3E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 10:55:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 196E510E1C0;
	Thu, 27 Jul 2023 08:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A75910E1C0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 08:55:42 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6862d4a1376so198469b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 01:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690448142; x=1691052942;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WiPjRg1/kjwO6K5zl232SDHPqYtmZOtFvHbsJXMq+7g=;
 b=Umb+YV+a9lWFhAL8II9iFkMStUOOBYcco6VfVBA99lXKZrqzVwUjfYjnKm4Dm0LFjT
 qdoJauj14z5/Q/ALZNZe4hty9eUQzFUzAPUNYhh89WT1GQpVMRyZmNBBpLKeWi1ZbclH
 LZhMvQeV3S/E/ICy+9O5ITOO1Phn4D+1/k/6DGPG+fLuYZVwP+5BQnq4IpnQhN9xTXZe
 rfTcvD1n0zxeVBrWB1YcR+3kK3++SSPnDRJs7hwNhsakSHiwU6PBsTieOJN2pDWuMDWg
 xnIMDcCLv5tsUy7qwBc5TOF+eIq3rIHBy6gcXooMjKSZ0a9wuV4u6V1UPp0vjKeCWB6q
 aakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690448142; x=1691052942;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WiPjRg1/kjwO6K5zl232SDHPqYtmZOtFvHbsJXMq+7g=;
 b=VXKsrzfSKvpWxODGJoOKxEREdhYUfsGyRZGWqsjDcmK3Gxgcbg2LPQfQ4EwUOX4GYf
 QogCNoY6kVDlOKEVdxParwoIXbFlmDcSICY3y7QnA4qZX6XDz23XB3oVRJYj0EYl60LY
 /ALPB1VKUd4cFith8W4v3sBb7aOXj4R1ZrwILIGViU6LJIAiozGMx+ln2z572ItJByIy
 nx0PIFavn0k47s5aD7SWGV9/oMGy6BL16fl4jgQhkb+yU+RU+3WkcswHUWr6XaB+Of2d
 0UcMzhjLLketq6LMDnP0fVqO3M+2JxtuEs249QD/HArDq/jyRniEB5ZUcezxzSaKxX+6
 Lqcg==
X-Gm-Message-State: ABy/qLbD6RQcNN2oP0sv4HaFjaZ7dtPk6dlfj8wFQf6SnblxTwqb+02B
 5cMzuQue9jikzIZv1qLSIxMnLA==
X-Google-Smtp-Source: APBJJlGwmdjot/rbtwF9nTotnOmqaOAtVmCVUqRrFxhkDx7eGx5gFUYRsJSjv9frk6zdjI0egP1lkA==
X-Received: by 2002:a17:902:e891:b0:1b3:d4bb:3515 with SMTP id
 w17-20020a170902e89100b001b3d4bb3515mr5854967plg.0.1690448141745; 
 Thu, 27 Jul 2023 01:55:41 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 iy15-20020a170903130f00b001bbb1eec92esm1023927plb.281.2023.07.27.01.55.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 01:55:41 -0700 (PDT)
Message-ID: <56ee1d92-28ee-81cb-9c41-6ca7ea6556b0@bytedance.com>
Date: Thu, 27 Jul 2023 16:55:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 28/49] dm zoned: dynamically allocate the dm-zoned-meta
 shrinker
Content-Language: en-US
To: Damien Le Moal <dlemoal@kernel.org>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-29-zhengqi.arch@bytedance.com>
 <baaf7de4-9a0e-b953-2b6a-46e60c415614@kernel.org>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <baaf7de4-9a0e-b953-2b6a-46e60c415614@kernel.org>
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
Cc: kvm@vger.kernel.org, djwong@kernel.org, roman.gushchin@linux.dev,
 david@fromorbit.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, cel@kernel.org,
 x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org, paulmck@kernel.org,
 linux-arm-msm@vger.kernel.org, brauner@kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, Muchun Song <songmuchun@bytedance.com>,
 yujie.liu@intel.com, vbabka@suse.cz, linux-raid@vger.kernel.org,
 linux-nfs@vger.kernel.org, tytso@mit.edu, netdev@vger.kernel.org,
 muchun.song@linux.dev, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/7/27 16:30, Damien Le Moal wrote:
> On 7/27/23 17:04, Qi Zheng wrote:
>> In preparation for implementing lockless slab shrink, use new APIs to
>> dynamically allocate the dm-zoned-meta shrinker, so that it can be freed
>> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
>> read-side critical section when releasing the struct dmz_metadata.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>>   drivers/md/dm-zoned-metadata.c | 28 ++++++++++++++++------------
>>   1 file changed, 16 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
>> index 9d3cca8e3dc9..0bcb26a43578 100644
>> --- a/drivers/md/dm-zoned-metadata.c
>> +++ b/drivers/md/dm-zoned-metadata.c
>> @@ -187,7 +187,7 @@ struct dmz_metadata {
>>   	struct rb_root		mblk_rbtree;
>>   	struct list_head	mblk_lru_list;
>>   	struct list_head	mblk_dirty_list;
>> -	struct shrinker		mblk_shrinker;
>> +	struct shrinker		*mblk_shrinker;
>>   
>>   	/* Zone allocation management */
>>   	struct mutex		map_lock;
>> @@ -615,7 +615,7 @@ static unsigned long dmz_shrink_mblock_cache(struct dmz_metadata *zmd,
>>   static unsigned long dmz_mblock_shrinker_count(struct shrinker *shrink,
>>   					       struct shrink_control *sc)
>>   {
>> -	struct dmz_metadata *zmd = container_of(shrink, struct dmz_metadata, mblk_shrinker);
>> +	struct dmz_metadata *zmd = shrink->private_data;
>>   
>>   	return atomic_read(&zmd->nr_mblks);
>>   }
>> @@ -626,7 +626,7 @@ static unsigned long dmz_mblock_shrinker_count(struct shrinker *shrink,
>>   static unsigned long dmz_mblock_shrinker_scan(struct shrinker *shrink,
>>   					      struct shrink_control *sc)
>>   {
>> -	struct dmz_metadata *zmd = container_of(shrink, struct dmz_metadata, mblk_shrinker);
>> +	struct dmz_metadata *zmd = shrink->private_data;
>>   	unsigned long count;
>>   
>>   	spin_lock(&zmd->mblk_lock);
>> @@ -2936,19 +2936,23 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
>>   	 */
>>   	zmd->min_nr_mblks = 2 + zmd->nr_map_blocks + zmd->zone_nr_bitmap_blocks * 16;
>>   	zmd->max_nr_mblks = zmd->min_nr_mblks + 512;
>> -	zmd->mblk_shrinker.count_objects = dmz_mblock_shrinker_count;
>> -	zmd->mblk_shrinker.scan_objects = dmz_mblock_shrinker_scan;
>> -	zmd->mblk_shrinker.seeks = DEFAULT_SEEKS;
>>   
>>   	/* Metadata cache shrinker */
>> -	ret = register_shrinker(&zmd->mblk_shrinker, "dm-zoned-meta:(%u:%u)",
>> -				MAJOR(dev->bdev->bd_dev),
>> -				MINOR(dev->bdev->bd_dev));
>> -	if (ret) {
>> -		dmz_zmd_err(zmd, "Register metadata cache shrinker failed");
>> +	zmd->mblk_shrinker = shrinker_alloc(0,  "dm-zoned-meta:(%u:%u)",
>> +					    MAJOR(dev->bdev->bd_dev),
>> +					    MINOR(dev->bdev->bd_dev));
>> +	if (!zmd->mblk_shrinker) {
>> +		dmz_zmd_err(zmd, "Allocate metadata cache shrinker failed");
> 
> ret is not set here, so dmz_ctr_metadata() will return success. You need to add:
> 		ret = -ENOMEM;
> or something.

Indeed, will fix.

>>   		goto err;
>>   	}
>>   
>> +	zmd->mblk_shrinker->count_objects = dmz_mblock_shrinker_count;
>> +	zmd->mblk_shrinker->scan_objects = dmz_mblock_shrinker_scan;
>> +	zmd->mblk_shrinker->seeks = DEFAULT_SEEKS;
>> +	zmd->mblk_shrinker->private_data = zmd;
>> +
>> +	shrinker_register(zmd->mblk_shrinker);
> 
> I fail to see how this new shrinker API is better... Why isn't there a
> shrinker_alloc_and_register() function ? That would avoid adding all this code
> all over the place as the new API call would be very similar to the current
> shrinker_register() call with static allocation.

In some registration scenarios, memory needs to be allocated in advance.
So we continue to use the previous prealloc/register_prepared()
algorithm. The shrinker_alloc_and_register() is just a helper function
that combines the two, and this increases the number of APIs that
shrinker exposes to the outside, so I choose not to add this helper.

Thanks,
Qi

> 
>> +
>>   	dmz_zmd_info(zmd, "DM-Zoned metadata version %d", zmd->sb_version);
>>   	for (i = 0; i < zmd->nr_devs; i++)
>>   		dmz_print_dev(zmd, i);
>> @@ -2995,7 +2999,7 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
>>    */
>>   void dmz_dtr_metadata(struct dmz_metadata *zmd)
>>   {
>> -	unregister_shrinker(&zmd->mblk_shrinker);
>> +	shrinker_free(zmd->mblk_shrinker);
>>   	dmz_cleanup_metadata(zmd);
>>   	kfree(zmd);
>>   }
> 
