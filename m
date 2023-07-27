Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0003D764F1B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 11:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E4610E54A;
	Thu, 27 Jul 2023 09:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76EA710E54A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 09:15:59 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-5576ad1b7e7so73453a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 02:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690449359; x=1691054159;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pSf6nVkdhsvxhtXxVh7cgsa4dxLg7VE+dk8AIIS4uIA=;
 b=gs/PU4tG46kQg+lGivKEpQm67BWRBr/3B5K5J0ZjcDJiH4VmN/xAYLr567/KvCeKyO
 Sxv9KoDe1Fgjt2T5xGL5ntjIo2URj6N4iyAFFdnIg9R3abku7q3pHpjtx5uyfVGaAvYO
 XtiYYOqXBfNiFu1rjUbVMMYVt5QxVT4/F43UKIFaCuAs9bCstLLngxCL3ODWliEci9Sz
 ElL4V2hOOxLgo9+060cMLFPSS0lDlqR1ZhVgYCnGDkIpUHSxXftLLIhthhd9SgFzYboG
 fvp5YOTqEFeGRzV75GGLb7yIHnFGlXJ5ArnypIHw3PlhSwR6sQo5O1DaMDPfX3YeBn9C
 fAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690449359; x=1691054159;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pSf6nVkdhsvxhtXxVh7cgsa4dxLg7VE+dk8AIIS4uIA=;
 b=O5Xo+nMMiJBZWubDpAaHWBxKsywcX3aiXZxgYhB8N5iT0WKnYvwVLIEicngrAjSEVk
 +ex6ktDzuL9zDegdWUyAYkcS/ZJ2xngdzLNX4oGamoG2mR3cDbLY1KcdScaic+pFHGf/
 WCI+NaOJH+GDaK3HxM6YQauDr9EnOl/AtyZPWWhv5AqeG/FHBfdJdwsPmZgbwq8GFAFA
 8PBgHSFR9HhNFQ/uCR6LMvNuz74D9MRdZlCAKi4JvwZftAJMZ3Z0IZQr/4R9FlDYNhYm
 Hx8IyQI00wKSG4/Ix8w7jktQ8TIPNkeIZYwdNN8JGGgYyjHX3Py5m74Ycxz5OlHh4jfH
 WX0Q==
X-Gm-Message-State: ABy/qLZQYiSvztHGDnxScv2aBUYaZbzybCKAFE8PpQSrSWvm2M6zKqme
 CZprX6r6wL1oOSz+D3v689gPTQ==
X-Google-Smtp-Source: APBJJlFWNasuQyGNPy0hcIGkgu46yCpujoddgwDeBo2nmYNJTDqcdO/STO03uju2nKSJGm9+FY3b7g==
X-Received: by 2002:a17:90a:7c48:b0:268:38a7:842e with SMTP id
 e8-20020a17090a7c4800b0026838a7842emr4155117pjl.2.1690449358970; 
 Thu, 27 Jul 2023 02:15:58 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 bv21-20020a17090af19500b0026596b8f33asm2403500pjb.40.2023.07.27.02.15.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 02:15:58 -0700 (PDT)
Message-ID: <8f8aa0d6-8f5c-958d-096d-d4c6d3e71e7a@bytedance.com>
Date: Thu, 27 Jul 2023 17:15:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 29/49] md/raid5: dynamically allocate the md-raid5
 shrinker
Content-Language: en-US
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com,
 cel@kernel.org, senozhatsky@chromium.org, yujie.liu@intel.com,
 gregkh@linuxfoundation.org, muchun.song@linux.dev
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-30-zhengqi.arch@bytedance.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20230727080502.77895-30-zhengqi.arch@bytedance.com>
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
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, x86@kernel.org,
 cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, linux-arm-msm@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, Muchun Song <songmuchun@bytedance.com>,
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023/7/27 16:04, Qi Zheng wrote:
> In preparation for implementing lockless slab shrink, use new APIs to
> dynamically allocate the md-raid5 shrinker, so that it can be freed
> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
> read-side critical section when releasing the struct r5conf.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   drivers/md/raid5.c | 25 ++++++++++++++-----------
>   drivers/md/raid5.h |  2 +-
>   2 files changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
> index 85b3004594e0..fbb4e6f5ff43 100644
> --- a/drivers/md/raid5.c
> +++ b/drivers/md/raid5.c
> @@ -7414,7 +7414,7 @@ static void free_conf(struct r5conf *conf)
>   
>   	log_exit(conf);
>   
> -	unregister_shrinker(&conf->shrinker);
> +	shrinker_free(conf->shrinker);
>   	free_thread_groups(conf);
>   	shrink_stripes(conf);
>   	raid5_free_percpu(conf);
> @@ -7462,7 +7462,7 @@ static int raid5_alloc_percpu(struct r5conf *conf)
>   static unsigned long raid5_cache_scan(struct shrinker *shrink,
>   				      struct shrink_control *sc)
>   {
> -	struct r5conf *conf = container_of(shrink, struct r5conf, shrinker);
> +	struct r5conf *conf = shrink->private_data;
>   	unsigned long ret = SHRINK_STOP;
>   
>   	if (mutex_trylock(&conf->cache_size_mutex)) {
> @@ -7483,7 +7483,7 @@ static unsigned long raid5_cache_scan(struct shrinker *shrink,
>   static unsigned long raid5_cache_count(struct shrinker *shrink,
>   				       struct shrink_control *sc)
>   {
> -	struct r5conf *conf = container_of(shrink, struct r5conf, shrinker);
> +	struct r5conf *conf = shrink->private_data;
>   
>   	if (conf->max_nr_stripes < conf->min_nr_stripes)
>   		/* unlikely, but not impossible */
> @@ -7718,18 +7718,21 @@ static struct r5conf *setup_conf(struct mddev *mddev)
>   	 * it reduces the queue depth and so can hurt throughput.
>   	 * So set it rather large, scaled by number of devices.
>   	 */
> -	conf->shrinker.seeks = DEFAULT_SEEKS * conf->raid_disks * 4;
> -	conf->shrinker.scan_objects = raid5_cache_scan;
> -	conf->shrinker.count_objects = raid5_cache_count;
> -	conf->shrinker.batch = 128;
> -	conf->shrinker.flags = 0;
> -	ret = register_shrinker(&conf->shrinker, "md-raid5:%s", mdname(mddev));
> -	if (ret) {
> -		pr_warn("md/raid:%s: couldn't register shrinker.\n",
> +	conf->shrinker = shrinker_alloc(0, "md-raid5:%s", mdname(mddev));
> +	if (!conf->shrinker) {

Here should set ret to -ENOMEM, will fix.

> +		pr_warn("md/raid:%s: couldn't allocate shrinker.\n",
>   			mdname(mddev));
>   		goto abort;
>   	}
>   
> +	conf->shrinker->seeks = DEFAULT_SEEKS * conf->raid_disks * 4;
> +	conf->shrinker->scan_objects = raid5_cache_scan;
> +	conf->shrinker->count_objects = raid5_cache_count;
> +	conf->shrinker->batch = 128;
> +	conf->shrinker->private_data = conf;
> +
> +	shrinker_register(conf->shrinker);
> +
>   	sprintf(pers_name, "raid%d", mddev->new_level);
>   	rcu_assign_pointer(conf->thread,
>   			   md_register_thread(raid5d, mddev, pers_name));
> diff --git a/drivers/md/raid5.h b/drivers/md/raid5.h
> index 97a795979a35..22bea20eccbd 100644
> --- a/drivers/md/raid5.h
> +++ b/drivers/md/raid5.h
> @@ -670,7 +670,7 @@ struct r5conf {
>   	wait_queue_head_t	wait_for_stripe;
>   	wait_queue_head_t	wait_for_overlap;
>   	unsigned long		cache_state;
> -	struct shrinker		shrinker;
> +	struct shrinker		*shrinker;
>   	int			pool_size; /* number of disks in stripeheads in pool */
>   	spinlock_t		device_lock;
>   	struct disk_info	*disks;
