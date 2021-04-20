Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FCE3654AA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 10:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADF089B0C;
	Tue, 20 Apr 2021 08:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A7289B0C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 08:58:43 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id l4so57061169ejc.10
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 01:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=uoshV4Vtm4B5N1WQ6cX9wQ88a/iAdHUM/Ny6VzNB44I=;
 b=gaJAPt6p0Wzg3J7lTWcfg5lv1ownsckHQgxwhv48Rfkr2Cc2SJmEEX0a6cY68fUyp+
 Zz+pl9TstvCHs3bjHUt+D8hfDiC6z4VZWFN5OVxcdC72sSuh97lpbUKFAYm0+EWtlLh5
 1XO02SjTT1d1meZRMkUdcklBcwtldqm/+MI7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=uoshV4Vtm4B5N1WQ6cX9wQ88a/iAdHUM/Ny6VzNB44I=;
 b=DjorNDhEiwHAdfTTyquKcN2RMRvhfrdgg0J/1zQ29rnsm3y9O4piJE6uBWCTuDfpeo
 Ihtn+fVbtZIsZNqkjg1wXerYw7kcc8uvxytBhrO4QASzGl95b5zRzD5e9rTAZsbQpqM3
 9DT+3U6o1gHhwvc6qpyWJVnNuMbqXFYtveORZt4uomOykRXXcKrKZaxJdFWDtGoo7FnN
 HpEUg5/KfGSHZ6+HRqG6egVsB7xUzER1az8/GFIVCf8jSrteh6Y+nlRk2cN9xFKv38hD
 Oq6aGI7s1g/pD3aiqjeu5hSmXVRoCWdffLm8oiqg3AhieCKrV/iiDFt2tdRhkAnF5G1D
 garQ==
X-Gm-Message-State: AOAM533UfnXCGM03Kykyv88rNhPaECoLCqgqnVmSXAPB8+54BTtPyd0A
 OZzyJgEjg+LoRFC2wLlBPN7qRA==
X-Google-Smtp-Source: ABdhPJzm6dWSIDV4rK2bRNY0RMKV1Op02STXTUz+9aXCx93rVCfa/10482y1ttgQkF645qvSSm+6fA==
X-Received: by 2002:a17:906:b52:: with SMTP id
 v18mr26174703ejg.485.1618909122366; 
 Tue, 20 Apr 2021 01:58:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id dj7sm6374438edb.42.2021.04.20.01.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 01:58:41 -0700 (PDT)
Date: Tue, 20 Apr 2021 10:58:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Peter Enderborg <peter.enderborg@sony.com>
Subject: Re: [PATCH v5] dma-buf: Add DmaBufTotal counter in meminfo
Message-ID: <YH6Xv00ddYfMA3Lg@phenom.ffwll.local>
Mail-Followup-To: Peter Enderborg <peter.enderborg@sony.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alexey Dobriyan <adobriyan@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <songmuchun@bytedance.com>,
 Roman Gushchin <guro@fb.com>, Shakeel Butt <shakeelb@google.com>,
 Michal Hocko <mhocko@suse.com>, NeilBrown <neilb@suse.de>,
 Sami Tolvanen <samitolvanen@google.com>,
 Mike Rapoport <rppt@kernel.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Matthew Wilcox <willy@infradead.org>
References: <20210417163835.25064-1-peter.enderborg@sony.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210417163835.25064-1-peter.enderborg@sony.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Michal Hocko <mhocko@suse.com>, Matthew Wilcox <willy@infradead.org>,
 NeilBrown <neilb@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alexey Dobriyan <adobriyan@gmail.com>,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 Mike Rapoport <rppt@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Muchun Song <songmuchun@bytedance.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Roman Gushchin <guro@fb.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 17, 2021 at 06:38:35PM +0200, Peter Enderborg wrote:
> This adds a total used dma-buf memory. Details
> can be found in debugfs, however it is not for everyone
> and not always available. dma-buf are indirect allocated by
> userspace. So with this value we can monitor and detect
> userspace applications that have problems.
> 
> Signed-off-by: Peter Enderborg <peter.enderborg@sony.com>

So there have been tons of discussions around how to track dma-buf and
why, and I really need to understand the use-cass here first I think. proc
uapi is as much forever as anything else, and depending what you're doing
this doesn't make any sense at all:

- on most linux systems dma-buf are only instantiated for shared buffer.
  So there this gives you a fairly meaningless number and not anything
  reflecting gpu memory usage at all.

- on Android all buffers are allocated through dma-buf afaik. But there
  we've recently had some discussions about how exactly we should track
  all this, and the conclusion was that most of this should be solved by
  cgroups long term. So if this is for Android, then I don't think adding
  random quick stop-gaps to upstream is a good idea (because it's a pretty
  long list of patches that have come up on this).

So what is this for?
-Daniel

> ---
>  drivers/dma-buf/dma-buf.c | 12 ++++++++++++
>  fs/proc/meminfo.c         |  5 ++++-
>  include/linux/dma-buf.h   |  1 +
>  3 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index f264b70c383e..4dc37cd4293b 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -37,6 +37,7 @@ struct dma_buf_list {
>  };
>  
>  static struct dma_buf_list db_list;
> +static atomic_long_t dma_buf_global_allocated;
>  
>  static char *dmabuffs_dname(struct dentry *dentry, char *buffer, int buflen)
>  {
> @@ -79,6 +80,7 @@ static void dma_buf_release(struct dentry *dentry)
>  	if (dmabuf->resv == (struct dma_resv *)&dmabuf[1])
>  		dma_resv_fini(dmabuf->resv);
>  
> +	atomic_long_sub(dmabuf->size, &dma_buf_global_allocated);
>  	module_put(dmabuf->owner);
>  	kfree(dmabuf->name);
>  	kfree(dmabuf);
> @@ -586,6 +588,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>  	mutex_lock(&db_list.lock);
>  	list_add(&dmabuf->list_node, &db_list.head);
>  	mutex_unlock(&db_list.lock);
> +	atomic_long_add(dmabuf->size, &dma_buf_global_allocated);
>  
>  	return dmabuf;
>  
> @@ -1346,6 +1349,15 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
>  }
>  EXPORT_SYMBOL_GPL(dma_buf_vunmap);
>  
> +/**
> + * dma_buf_allocated_pages - Return the used nr of pages
> + * allocated for dma-buf
> + */
> +long dma_buf_allocated_pages(void)
> +{
> +	return atomic_long_read(&dma_buf_global_allocated) >> PAGE_SHIFT;
> +}
> +
>  #ifdef CONFIG_DEBUG_FS
>  static int dma_buf_debug_show(struct seq_file *s, void *unused)
>  {
> diff --git a/fs/proc/meminfo.c b/fs/proc/meminfo.c
> index 6fa761c9cc78..ccc7c40c8db7 100644
> --- a/fs/proc/meminfo.c
> +++ b/fs/proc/meminfo.c
> @@ -16,6 +16,7 @@
>  #ifdef CONFIG_CMA
>  #include <linux/cma.h>
>  #endif
> +#include <linux/dma-buf.h>
>  #include <asm/page.h>
>  #include "internal.h"
>  
> @@ -145,7 +146,9 @@ static int meminfo_proc_show(struct seq_file *m, void *v)
>  	show_val_kb(m, "CmaFree:        ",
>  		    global_zone_page_state(NR_FREE_CMA_PAGES));
>  #endif
> -
> +#ifdef CONFIG_DMA_SHARED_BUFFER
> +	show_val_kb(m, "DmaBufTotal:    ", dma_buf_allocated_pages());
> +#endif
>  	hugetlb_report_meminfo(m);
>  
>  	arch_report_meminfo(m);
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index efdc56b9d95f..5b05816bd2cd 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -507,4 +507,5 @@ int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
>  		 unsigned long);
>  int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
>  void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
> +long dma_buf_allocated_pages(void);
>  #endif /* __DMA_BUF_H__ */
> -- 
> 2.17.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
