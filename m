Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A96F5363062
	for <lists+dri-devel@lfdr.de>; Sat, 17 Apr 2021 15:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD5D6E0B6;
	Sat, 17 Apr 2021 13:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FF76E0B6
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Apr 2021 13:08:29 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id u11so11791531pjr.0
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Apr 2021 06:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ycx1hdJpKp75Jqh1zODIx7B8QWF+7Q+i8IS+TiHaRno=;
 b=gU9m+YXrGMu9goxT7Cn1aTspyvZfC9PsROZJ53n9eByTMU43+WMHzchlCIa75FACI9
 Xl4MEdj1JqzCHq+e6tW7gZ+gzdWYOkTFRx6c5oisSWrQDsufkNHPfOoeyo/TVCnQnXiU
 v96ISYixeTGBgIF/2nJSY7IKG38oBFD3pKGpDyvHwilo5/rU7bYRI6vJOBHJwjAk8W3n
 jEWc9OeLwSOJmjiKn667JCq3Ere0TA26p9OQZye2Xztd/HuYgmNILGukxr3i9+7q5xsl
 9Va/4YgpvYNLFF/szz5LlbnjgzOTf5PV0N3cZlZJvhTcTgQy59nESk1lJe7rpTKEMr5W
 YKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ycx1hdJpKp75Jqh1zODIx7B8QWF+7Q+i8IS+TiHaRno=;
 b=pLiJqtuElzoAMapwO6HMRhPCT80nSBmt8vs0qtuYECCEDfjIFoYXy+rDKbgRl1jXeW
 5GU8fkRAW8OmMoCvBq0/qhvG+CpSJGa4h/Y748dfMd0WqPGjjA7lyeV1ADv0aWEc8/fx
 ygKuoQ+GkI0RU2TbNfK3nDnd9pPFPp30mI+M8EJyRo7jPRexrI53TA1qLXymn/53KIfh
 gozjIJSKgASYcP04SZVz4cbeD1F8IpznD7+lOOUtprHnJCeV67osf3y+lE7R/JP0023T
 ICNLXL4xBJSqsFUYyKTZR16ragsZQOB9G8hJEXaV2bpv5UbXhv/UBl/IVooeCl/GKXd8
 7OsA==
X-Gm-Message-State: AOAM532zQ2JZoruTXfrMbAMuaiYmZrfjmmuO4dloipDMoRyInGV23+Wv
 IJaaiMHIk6W+0FzYRZ1SQ+3j8w2mGDFXzVdzpiVhkw==
X-Google-Smtp-Source: ABdhPJwzbhZfJuUQqx9lyTf7c3oWGtxEow4Szero3dyusNLccQFzd4Kkx/KIrD6BXzqq2jQP6WQqJb4QiRWm6Y8NSSw=
X-Received: by 2002:a17:902:d482:b029:ec:9091:d099 with SMTP id
 c2-20020a170902d482b02900ec9091d099mr1847117plg.34.1618664908762; Sat, 17 Apr
 2021 06:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210417104032.5521-1-peter.enderborg@sony.com>
In-Reply-To: <20210417104032.5521-1-peter.enderborg@sony.com>
From: Muchun Song <songmuchun@bytedance.com>
Date: Sat, 17 Apr 2021 21:07:52 +0800
Message-ID: <CAMZfGtWZwXemox5peP738v2awsHxABcpYeqccPunLCZzRXynBQ@mail.gmail.com>
Subject: Re: [External] [PATCH v4] dma-buf: Add DmaBufTotal counter in meminfo
To: Peter Enderborg <peter.enderborg@sony.com>
X-Mailman-Approved-At: Sat, 17 Apr 2021 13:32:36 +0000
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
Cc: Michal Hocko <mhocko@suse.com>, NeilBrown <neilb@suse.de>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Alexey Dobriyan <adobriyan@gmail.com>, linaro-mm-sig@lists.linaro.org,
 Shakeel Butt <shakeelb@google.com>, Matthew Wilcox <willy@infradead.org>,
 Sami Tolvanen <samitolvanen@google.com>, Roman Gushchin <guro@fb.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 17, 2021 at 6:41 PM Peter Enderborg
<peter.enderborg@sony.com> wrote:
>
> This adds a total used dma-buf memory. Details
> can be found in debugfs, however it is not for everyone
> and not always available. dma-buf are indirect allocated by
> userspace. So with this value we can monitor and detect
> userspace applications that have problems.
>
> Signed-off-by: Peter Enderborg <peter.enderborg@sony.com>
> ---
>  drivers/dma-buf/dma-buf.c | 13 +++++++++++++
>  fs/proc/meminfo.c         |  5 ++++-
>  include/linux/dma-buf.h   |  1 +
>  3 files changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index f264b70c383e..197e5c45dd26 100644
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
>         if (dmabuf->resv == (struct dma_resv *)&dmabuf[1])
>                 dma_resv_fini(dmabuf->resv);
>
> +       atomic_long_sub(dmabuf->size, &dma_buf_global_allocated);
>         module_put(dmabuf->owner);
>         kfree(dmabuf->name);
>         kfree(dmabuf);
> @@ -586,6 +588,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>         mutex_lock(&db_list.lock);
>         list_add(&dmabuf->list_node, &db_list.head);
>         mutex_unlock(&db_list.lock);
> +       atomic_long_add(dmabuf->size, &dma_buf_global_allocated);
>
>         return dmabuf;
>
> @@ -1346,6 +1349,16 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
>  }
>  EXPORT_SYMBOL_GPL(dma_buf_vunmap);
>
> +/**
> + * dma_buf_allocated_pages - Return the used nr of pages
> + * allocated for dma-buf
> + */
> +long dma_buf_allocated_pages(void)
> +{
> +       return atomic_long_read(&dma_buf_global_allocated) >> PAGE_SHIFT;
> +}
> +EXPORT_SYMBOL_GPL(dma_buf_allocated_pages);

dma_buf_allocated_pages is only called from fs/proc/meminfo.c.
I am confused why it should be exported. If it won't be called
from the driver module, we should not export it.

Thanks.

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
>         show_val_kb(m, "CmaFree:        ",
>                     global_zone_page_state(NR_FREE_CMA_PAGES));
>  #endif
> -
> +#ifdef CONFIG_DMA_SHARED_BUFFER
> +       show_val_kb(m, "DmaBufTotal:    ", dma_buf_allocated_pages());
> +#endif
>         hugetlb_report_meminfo(m);
>
>         arch_report_meminfo(m);
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index efdc56b9d95f..5b05816bd2cd 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -507,4 +507,5 @@ int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
>                  unsigned long);
>  int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
>  void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
> +long dma_buf_allocated_pages(void);
>  #endif /* __DMA_BUF_H__ */
> --
> 2.17.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
