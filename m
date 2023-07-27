Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D70764F56
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 11:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E102A10E549;
	Thu, 27 Jul 2023 09:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD5310E54E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 09:20:03 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-55c79b62f3aso52627a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 02:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690449603; x=1691054403;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cb79b5va6gFfSJneJi5lY4rGeRwgOukMupryAUVW6kI=;
 b=YCWSTu9U7oWMIxlz666y2QG523oA3QX5qQv7ZytrRVu6fJw8dRHyUfgDIT1gU69FG8
 THUguZfsi1KeJApNPmw0jxmv7f8KFlV4UTxlH9XbeulHxoa/ldWA269gxLsqPd7fsDUL
 3wrs7fjkTjLEvVIuFKVgIWoEr+OE7ZGV4f2QptD03saCT0x1g+4lQFRHQ9ruqft2Rhft
 lQsKff8YPeqYMpcr6auHVhvyZ4A0b6O2v3t87pxn8FkR9lCy8v/ntqGuUNKm9Zf3rtD1
 Pt/WGCyBPHzJX+fw7G8Ac9jWyGkR4LQhg8QoLvoZwbFMr8CqGaDCh/cUGTEJkXif0gLU
 NqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690449603; x=1691054403;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cb79b5va6gFfSJneJi5lY4rGeRwgOukMupryAUVW6kI=;
 b=WGHbB9TIYt+fWF66NnGY/0U5gDNmCk0/ds4nL4j5ZuWy7DN9AnLTyzhjVuKMQLrlhc
 0KJCnFp+wELmQvK7p1uOT2WLHJ33TlnBUO5gRSdHDjyETuBBuS6b2ETYXKK4IiQ47yl9
 OZjEqPJ4CiTBc4Dm6C5juxzFfEutAkMGw7iOhu1HZl0rIW25Jx2YXNlPyUh05yCS8mid
 dZBacpanaHKjSiQarOl4LIZlBrQcPEeumgdD1zOzvnntMWDVNNrITK/AkqE47XWb9qMR
 mJ64qMCPzLNqiK8rIC50/SH/8m5QNH0YuSmwzvwtvHqYa8j9O7TPZpZ/UXQDifbPEbmg
 XDbA==
X-Gm-Message-State: ABy/qLb2kptBZrk89BISZFTCGoTqsWhGOB4D1wrLCs26DYgrxZic8vQn
 9X8Tkwif7QMraVc88/8FjFbN3A==
X-Google-Smtp-Source: APBJJlH+dm0mCsob/js+yZXnXAfwEH4KDToex0aS0MQ56gbjyJxo+xxDZzOa2lZ9gy3mjvwdmWQa2g==
X-Received: by 2002:a17:902:da82:b0:1b8:811:b079 with SMTP id
 j2-20020a170902da8200b001b80811b079mr5785873plx.0.1690449602958; 
 Thu, 27 Jul 2023 02:20:02 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 5-20020a170902c24500b001bbb7d8fff2sm1109046plg.116.2023.07.27.02.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 02:20:02 -0700 (PDT)
Message-ID: <5f1b85b8-3655-1700-4d16-fa056b31ceeb@bytedance.com>
Date: Thu, 27 Jul 2023 17:19:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 40/49] xfs: dynamically allocate the xfs-qm shrinker
Content-Language: en-US
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com,
 cel@kernel.org, senozhatsky@chromium.org, yujie.liu@intel.com,
 gregkh@linuxfoundation.org, muchun.song@linux.dev
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-41-zhengqi.arch@bytedance.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20230727080502.77895-41-zhengqi.arch@bytedance.com>
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
> dynamically allocate the xfs-qm shrinker, so that it can be freed
> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
> read-side critical section when releasing the struct xfs_quotainfo.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   fs/xfs/xfs_qm.c | 26 +++++++++++++-------------
>   fs/xfs/xfs_qm.h |  2 +-
>   2 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/fs/xfs/xfs_qm.c b/fs/xfs/xfs_qm.c
> index 6abcc34fafd8..032f0a208bd2 100644
> --- a/fs/xfs/xfs_qm.c
> +++ b/fs/xfs/xfs_qm.c
> @@ -504,8 +504,7 @@ xfs_qm_shrink_scan(
>   	struct shrinker		*shrink,
>   	struct shrink_control	*sc)
>   {
> -	struct xfs_quotainfo	*qi = container_of(shrink,
> -					struct xfs_quotainfo, qi_shrinker);
> +	struct xfs_quotainfo	*qi = shrink->private_data;
>   	struct xfs_qm_isolate	isol;
>   	unsigned long		freed;
>   	int			error;
> @@ -539,8 +538,7 @@ xfs_qm_shrink_count(
>   	struct shrinker		*shrink,
>   	struct shrink_control	*sc)
>   {
> -	struct xfs_quotainfo	*qi = container_of(shrink,
> -					struct xfs_quotainfo, qi_shrinker);
> +	struct xfs_quotainfo	*qi = shrink->private_data;
>   
>   	return list_lru_shrink_count(&qi->qi_lru, sc);
>   }
> @@ -680,16 +678,18 @@ xfs_qm_init_quotainfo(
>   	if (XFS_IS_PQUOTA_ON(mp))
>   		xfs_qm_set_defquota(mp, XFS_DQTYPE_PROJ, qinf);
>   
> -	qinf->qi_shrinker.count_objects = xfs_qm_shrink_count;
> -	qinf->qi_shrinker.scan_objects = xfs_qm_shrink_scan;
> -	qinf->qi_shrinker.seeks = DEFAULT_SEEKS;
> -	qinf->qi_shrinker.flags = SHRINKER_NUMA_AWARE;
> -
> -	error = register_shrinker(&qinf->qi_shrinker, "xfs-qm:%s",
> -				  mp->m_super->s_id);
> -	if (error)
> +	qinf->qi_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE, "xfs-qm:%s",
> +					   mp->m_super->s_id);
> +	if (!qinf->qi_shrinker)

Here should set error to -ENOMEM, will fix.

>   		goto out_free_inos;
>   
> +	qinf->qi_shrinker->count_objects = xfs_qm_shrink_count;
> +	qinf->qi_shrinker->scan_objects = xfs_qm_shrink_scan;
> +	qinf->qi_shrinker->seeks = DEFAULT_SEEKS;
> +	qinf->qi_shrinker->private_data = qinf;
> +
> +	shrinker_register(qinf->qi_shrinker);
> +
>   	return 0;
>   
>   out_free_inos:
> @@ -718,7 +718,7 @@ xfs_qm_destroy_quotainfo(
>   	qi = mp->m_quotainfo;
>   	ASSERT(qi != NULL);
>   
> -	unregister_shrinker(&qi->qi_shrinker);
> +	shrinker_free(qi->qi_shrinker);
>   	list_lru_destroy(&qi->qi_lru);
>   	xfs_qm_destroy_quotainos(qi);
>   	mutex_destroy(&qi->qi_tree_lock);
> diff --git a/fs/xfs/xfs_qm.h b/fs/xfs/xfs_qm.h
> index 9683f0457d19..d5c9fc4ba591 100644
> --- a/fs/xfs/xfs_qm.h
> +++ b/fs/xfs/xfs_qm.h
> @@ -63,7 +63,7 @@ struct xfs_quotainfo {
>   	struct xfs_def_quota	qi_usr_default;
>   	struct xfs_def_quota	qi_grp_default;
>   	struct xfs_def_quota	qi_prj_default;
> -	struct shrinker		qi_shrinker;
> +	struct shrinker		*qi_shrinker;
>   
>   	/* Minimum and maximum quota expiration timestamp values. */
>   	time64_t		qi_expiry_min;
