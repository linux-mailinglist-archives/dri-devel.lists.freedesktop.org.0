Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BF0365448
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 10:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D726A6E13C;
	Tue, 20 Apr 2021 08:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09396E13C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 08:39:09 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id v6so55729641ejo.6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 01:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=QIuUvofPDIxQ2Xnl6piPnzkNIqnBx7iSqqUtBV1i2j0=;
 b=Xnd6JnKSx5ncA48VE+FTvvtirGFWCchXMRV4SfEqivGWhjUvPdOZyS7rzr3hRLISKc
 weIsohPM6Wg51S1mW+tn3cfIa2s8u8yB9vUogpu+6KQmBSUbWT+KvqgBI6cu2VXCdsiO
 sotdRA0g5M5McqiCGqhvdJ7x/IDU+n1iO9xsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=QIuUvofPDIxQ2Xnl6piPnzkNIqnBx7iSqqUtBV1i2j0=;
 b=Kd1RseVebvtTMFsKzc9NSNJb8zmbg9yf6V+ggXcBpqLuT7ya7CViH/yF6nHLygHpNY
 yJkURMtay6uHPUaYqSaJDFHeyLXn4vSOazWaYfZiQmzePEcvJ9Hyi3Jjb5GV2prTulcv
 VMuVm6QP2CC+9WlMLy0s8OzoiuBjnc2Sa0Os2MoQKaqQYPrxnOG9i7/g8fJbRHGx4sDp
 PXkczCvrNCIcgic9/BF/TOllMLIfbSFQtr8as9mq1f01BljmmnY8klIdyE00lpP9gDov
 nd/YZ5PSFt0EwesvXmyIm3wLuOpfOfd8w6rKAYL7B5zlGaRfcYteamvIxGwKUAfI4II1
 KKmA==
X-Gm-Message-State: AOAM53147q0Nl3nNJhGKk4WH72DatFQHMHFENtZTfPFZSK7jAN+jfu5J
 8FimAyRl7S0BRE8h5uBx+gWJ5w==
X-Google-Smtp-Source: ABdhPJzKnx+yvsmmawjlL/WEDsrn4hsPU7R8EEIXmiKkO0qNGO+CRRMLxdwpSEpKHtNvyrET6RvyuA==
X-Received: by 2002:a17:906:f949:: with SMTP id
 ld9mr26715530ejb.236.1618907948397; 
 Tue, 20 Apr 2021 01:39:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d5sm10345824edt.49.2021.04.20.01.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 01:39:07 -0700 (PDT)
Date: Tue, 20 Apr 2021 10:39:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v4] dma-buf: Add DmaBufTotal counter in meminfo
Message-ID: <YH6TKQQ9kAEIrJ3y@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Peter.Enderborg@sony.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, sumit.semwal@linaro.org,
 adobriyan@gmail.com, akpm@linux-foundation.org,
 songmuchun@bytedance.com, guro@fb.com, shakeelb@google.com,
 mhocko@suse.com, neilb@suse.de, samitolvanen@google.com,
 rppt@kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 willy@infradead.org
References: <20210417104032.5521-1-peter.enderborg@sony.com>
 <d983aef9-3dde-54cc-59a0-d9d42130b513@amd.com>
 <d822adcc-2a3c-1923-0d1d-4ecabd76a0e5@sony.com>
 <2420ea7a-4746-b11a-3c0e-2f962059d071@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2420ea7a-4746-b11a-3c0e-2f962059d071@amd.com>
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
Cc: mhocko@suse.com, willy@infradead.org, neilb@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Peter.Enderborg@sony.com, linaro-mm-sig@lists.linaro.org, shakeelb@google.com,
 rppt@kernel.org, samitolvanen@google.com, songmuchun@bytedance.com,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, adobriyan@gmail.com,
 guro@fb.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 17, 2021 at 01:54:08PM +0200, Christian K=F6nig wrote:
> Am 17.04.21 um 13:20 schrieb Peter.Enderborg@sony.com:
> > On 4/17/21 12:59 PM, Christian K=F6nig wrote:
> > > Am 17.04.21 um 12:40 schrieb Peter Enderborg:
> > > > This adds a total used dma-buf memory. Details
> > > > can be found in debugfs, however it is not for everyone
> > > > and not always available. dma-buf are indirect allocated by
> > > > userspace. So with this value we can monitor and detect
> > > > userspace applications that have problems.
> > > > =

> > > > Signed-off-by: Peter Enderborg <peter.enderborg@sony.com>
> > > Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>
> > > =

> > > How do you want to upstream this?
> > I don't understand that question. The patch applies on Torvalds 5.12-rc=
7,
> > but I guess 5.13 is what we work on right now.
> =

> Yeah, but how do you want to get it into Linus tree?
> =

> I can push it together with other DMA-buf patches through drm-misc-next a=
nd
> then Dave will send it to Linus for inclusion in 5.13.

Small correction, we've already frozen for the merge window so this will
land in 5.14.
-Daniel

> =

> But could be that you are pushing multiple changes towards Linus through
> some other branch. In this case I'm fine if you pick that way instead if =
you
> want to keep your patches together for some reason.
> =

> Christian.
> =

> > =

> > > > ---
> > > >  =A0 drivers/dma-buf/dma-buf.c | 13 +++++++++++++
> > > >  =A0 fs/proc/meminfo.c=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 5 ++++-
> > > >  =A0 include/linux/dma-buf.h=A0=A0 |=A0 1 +
> > > >  =A0 3 files changed, 18 insertions(+), 1 deletion(-)
> > > > =

> > > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > > > index f264b70c383e..197e5c45dd26 100644
> > > > --- a/drivers/dma-buf/dma-buf.c
> > > > +++ b/drivers/dma-buf/dma-buf.c
> > > > @@ -37,6 +37,7 @@ struct dma_buf_list {
> > > >  =A0 };
> > > >  =A0 =A0 static struct dma_buf_list db_list;
> > > > +static atomic_long_t dma_buf_global_allocated;
> > > >  =A0 =A0 static char *dmabuffs_dname(struct dentry *dentry, char *b=
uffer, int buflen)
> > > >  =A0 {
> > > > @@ -79,6 +80,7 @@ static void dma_buf_release(struct dentry *dentry)
> > > >  =A0=A0=A0=A0=A0 if (dmabuf->resv =3D=3D (struct dma_resv *)&dmabuf=
[1])
> > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 dma_resv_fini(dmabuf->resv);
> > > >  =A0 +=A0=A0=A0 atomic_long_sub(dmabuf->size, &dma_buf_global_alloc=
ated);
> > > >  =A0=A0=A0=A0=A0 module_put(dmabuf->owner);
> > > >  =A0=A0=A0=A0=A0 kfree(dmabuf->name);
> > > >  =A0=A0=A0=A0=A0 kfree(dmabuf);
> > > > @@ -586,6 +588,7 @@ struct dma_buf *dma_buf_export(const struct dma=
_buf_export_info *exp_info)
> > > >  =A0=A0=A0=A0=A0 mutex_lock(&db_list.lock);
> > > >  =A0=A0=A0=A0=A0 list_add(&dmabuf->list_node, &db_list.head);
> > > >  =A0=A0=A0=A0=A0 mutex_unlock(&db_list.lock);
> > > > +=A0=A0=A0 atomic_long_add(dmabuf->size, &dma_buf_global_allocated);
> > > >  =A0 =A0=A0=A0=A0=A0 return dmabuf;
> > > >  =A0 @@ -1346,6 +1349,16 @@ void dma_buf_vunmap(struct dma_buf *dma=
buf, struct dma_buf_map *map)
> > > >  =A0 }
> > > >  =A0 EXPORT_SYMBOL_GPL(dma_buf_vunmap);
> > > >  =A0 +/**
> > > > + * dma_buf_allocated_pages - Return the used nr of pages
> > > > + * allocated for dma-buf
> > > > + */
> > > > +long dma_buf_allocated_pages(void)
> > > > +{
> > > > +=A0=A0=A0 return atomic_long_read(&dma_buf_global_allocated) >> PA=
GE_SHIFT;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(dma_buf_allocated_pages);
> > > > +
> > > >  =A0 #ifdef CONFIG_DEBUG_FS
> > > >  =A0 static int dma_buf_debug_show(struct seq_file *s, void *unused)
> > > >  =A0 {
> > > > diff --git a/fs/proc/meminfo.c b/fs/proc/meminfo.c
> > > > index 6fa761c9cc78..ccc7c40c8db7 100644
> > > > --- a/fs/proc/meminfo.c
> > > > +++ b/fs/proc/meminfo.c
> > > > @@ -16,6 +16,7 @@
> > > >  =A0 #ifdef CONFIG_CMA
> > > >  =A0 #include <linux/cma.h>
> > > >  =A0 #endif
> > > > +#include <linux/dma-buf.h>
> > > >  =A0 #include <asm/page.h>
> > > >  =A0 #include "internal.h"
> > > >  =A0 @@ -145,7 +146,9 @@ static int meminfo_proc_show(struct seq_fi=
le *m, void *v)
> > > >  =A0=A0=A0=A0=A0 show_val_kb(m, "CmaFree:=A0=A0=A0=A0=A0=A0=A0 ",
> > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 global_zone_page_state(NR_=
FREE_CMA_PAGES));
> > > >  =A0 #endif
> > > > -
> > > > +#ifdef CONFIG_DMA_SHARED_BUFFER
> > > > +=A0=A0=A0 show_val_kb(m, "DmaBufTotal:=A0=A0=A0 ", dma_buf_allocat=
ed_pages());
> > > > +#endif
> > > >  =A0=A0=A0=A0=A0 hugetlb_report_meminfo(m);
> > > >  =A0 =A0=A0=A0=A0=A0 arch_report_meminfo(m);
> > > > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > > > index efdc56b9d95f..5b05816bd2cd 100644
> > > > --- a/include/linux/dma-buf.h
> > > > +++ b/include/linux/dma-buf.h
> > > > @@ -507,4 +507,5 @@ int dma_buf_mmap(struct dma_buf *, struct vm_ar=
ea_struct *,
> > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 unsigned long);
> > > >  =A0 int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *m=
ap);
> > > >  =A0 void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map=
 *map);
> > > > +long dma_buf_allocated_pages(void);
> > > >  =A0 #endif /* __DMA_BUF_H__ */
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
