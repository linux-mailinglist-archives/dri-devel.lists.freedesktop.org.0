Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F30365749
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 13:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED208931D;
	Tue, 20 Apr 2021 11:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF5D8931D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 11:14:20 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id n2so57650081ejy.7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 04:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=Typh3MhSkbyPMTThE0U2Q1ZO/12rDfMhvhLaVI/d1e8=;
 b=KQVXC/pMQkblNXMVtLAj7SnpDWgtKhyIP7FvLpcFc3jKrVAILUkLPJk5INg+VNl2RO
 wII2H98OwSqJVSwyaGuiBtgO0UCGsX6cUXbfvzUlK2megqFX5dMhq0eUPJyut/23j34l
 2FpLrHrROB3lrJqNBrYTmdaqRxVXzqB0FdTWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=Typh3MhSkbyPMTThE0U2Q1ZO/12rDfMhvhLaVI/d1e8=;
 b=BHVDNRzO0PULltZ1E57T0qevmi5sOBZ3hwX4Z1v6c2IM4VueiS16gt9sFm5NxS7O28
 KresRXpUPRul7KcOcraojrz0fXmKFhtuNbGO2D+FY1izHpDWOUzbYJP8IzmYCUpBgXlb
 O+Ktlo+JFl42bLBKLhYHk9e6CgJuqDuQwnvzKZgh9NJRV5SHfyJW+nJWZ2Gtt/zmF1TW
 QCHEVPLgYj9DlRovOA9cV++YoVLsf1l3pd2t1ET2V065F58kY+AnCBQtCyuMHQGQ6VYW
 ZR2YHAqrMHLo0r44pSMlyQfi52cL124QPKifkwDM/ACao8ydu9Qlijp5afCBVivnyunt
 nUew==
X-Gm-Message-State: AOAM533GA3JNvAhiCaLmHJILr6yNa/Ah5/w9/rlXZhuEtYu/T0kWkcJt
 Hntb+UPh7NjYjhfArn6GeYpBcA==
X-Google-Smtp-Source: ABdhPJy8I04sLJ6rISKUbY8p7EIy7J+0ccdspYtYAIEZfvYtprT2Z23ngxTun+fd5qbntXzHzXLbDA==
X-Received: by 2002:a17:906:7fd3:: with SMTP id
 r19mr27643200ejs.286.1618917259038; 
 Tue, 20 Apr 2021 04:14:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f1sm10639067edz.60.2021.04.20.04.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 04:14:18 -0700 (PDT)
Date: Tue, 20 Apr 2021 13:14:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Peter.Enderborg@sony.com
Subject: Re: [PATCH v5] dma-buf: Add DmaBufTotal counter in meminfo
Message-ID: <YH63iPzbGWzb676T@phenom.ffwll.local>
Mail-Followup-To: Peter.Enderborg@sony.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, adobriyan@gmail.com,
 akpm@linux-foundation.org, songmuchun@bytedance.com, guro@fb.com,
 shakeelb@google.com, mhocko@suse.com, neilb@suse.de,
 samitolvanen@google.com, rppt@kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, willy@infradead.org
References: <20210417163835.25064-1-peter.enderborg@sony.com>
 <YH6Xv00ddYfMA3Lg@phenom.ffwll.local>
 <176e7e71-59b7-b288-9483-10e0f42a7a3f@sony.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <176e7e71-59b7-b288-9483-10e0f42a7a3f@sony.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 adobriyan@gmail.com, linaro-mm-sig@lists.linaro.org, shakeelb@google.com,
 rppt@kernel.org, samitolvanen@google.com, songmuchun@bytedance.com,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 christian.koenig@amd.com, guro@fb.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 20, 2021 at 09:26:00AM +0000, Peter.Enderborg@sony.com wrote:
> On 4/20/21 10:58 AM, Daniel Vetter wrote:
> > On Sat, Apr 17, 2021 at 06:38:35PM +0200, Peter Enderborg wrote:
> >> This adds a total used dma-buf memory. Details
> >> can be found in debugfs, however it is not for everyone
> >> and not always available. dma-buf are indirect allocated by
> >> userspace. So with this value we can monitor and detect
> >> userspace applications that have problems.
> >>
> >> Signed-off-by: Peter Enderborg <peter.enderborg@sony.com>
> > So there have been tons of discussions around how to track dma-buf and
> > why, and I really need to understand the use-cass here first I think. p=
roc
> > uapi is as much forever as anything else, and depending what you're doi=
ng
> > this doesn't make any sense at all:
> >
> > - on most linux systems dma-buf are only instantiated for shared buffer.
> >   So there this gives you a fairly meaningless number and not anything
> >   reflecting gpu memory usage at all.
> >
> > - on Android all buffers are allocated through dma-buf afaik. But there
> >   we've recently had some discussions about how exactly we should track
> >   all this, and the conclusion was that most of this should be solved by
> >   cgroups long term. So if this is for Android, then I don't think addi=
ng
> >   random quick stop-gaps to upstream is a good idea (because it's a pre=
tty
> >   long list of patches that have come up on this).
> >
> > So what is this for?
> =

> For the overview. dma-buf today only have debugfs for info. Debugfs
> is not allowed by google to use in andoid. So this aggregate the informat=
ion
> so we can get information on what going on on the system.=A0
> =

> And the LKML standard respond to that is "SHOW ME THE CODE".

Yes. Except this extends to how exactly this is supposed to be used in
userspace and acted upon.

> When the top memgc has a aggregated information on dma-buf it is maybe
> a better source to meminfo. But then it also imply that dma-buf requires =
memcg.
> =

> And I dont see any problem to replace this with something better with it =
is ready.

The thing is, this is uapi. Once it's merged we cannot, ever, replace it.
It must be kept around forever, or a very close approximation thereof. So
merging this with the justification that we can fix it later on or replace
isn't going to happen.
-Daniel

> =

> > -Daniel
> >
> >> ---
> >>  drivers/dma-buf/dma-buf.c | 12 ++++++++++++
> >>  fs/proc/meminfo.c         |  5 ++++-
> >>  include/linux/dma-buf.h   |  1 +
> >>  3 files changed, 17 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> >> index f264b70c383e..4dc37cd4293b 100644
> >> --- a/drivers/dma-buf/dma-buf.c
> >> +++ b/drivers/dma-buf/dma-buf.c
> >> @@ -37,6 +37,7 @@ struct dma_buf_list {
> >>  };
> >>  =

> >>  static struct dma_buf_list db_list;
> >> +static atomic_long_t dma_buf_global_allocated;
> >>  =

> >>  static char *dmabuffs_dname(struct dentry *dentry, char *buffer, int =
buflen)
> >>  {
> >> @@ -79,6 +80,7 @@ static void dma_buf_release(struct dentry *dentry)
> >>  	if (dmabuf->resv =3D=3D (struct dma_resv *)&dmabuf[1])
> >>  		dma_resv_fini(dmabuf->resv);
> >>  =

> >> +	atomic_long_sub(dmabuf->size, &dma_buf_global_allocated);
> >>  	module_put(dmabuf->owner);
> >>  	kfree(dmabuf->name);
> >>  	kfree(dmabuf);
> >> @@ -586,6 +588,7 @@ struct dma_buf *dma_buf_export(const struct dma_bu=
f_export_info *exp_info)
> >>  	mutex_lock(&db_list.lock);
> >>  	list_add(&dmabuf->list_node, &db_list.head);
> >>  	mutex_unlock(&db_list.lock);
> >> +	atomic_long_add(dmabuf->size, &dma_buf_global_allocated);
> >>  =

> >>  	return dmabuf;
> >>  =

> >> @@ -1346,6 +1349,15 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, str=
uct dma_buf_map *map)
> >>  }
> >>  EXPORT_SYMBOL_GPL(dma_buf_vunmap);
> >>  =

> >> +/**
> >> + * dma_buf_allocated_pages - Return the used nr of pages
> >> + * allocated for dma-buf
> >> + */
> >> +long dma_buf_allocated_pages(void)
> >> +{
> >> +	return atomic_long_read(&dma_buf_global_allocated) >> PAGE_SHIFT;
> >> +}
> >> +
> >>  #ifdef CONFIG_DEBUG_FS
> >>  static int dma_buf_debug_show(struct seq_file *s, void *unused)
> >>  {
> >> diff --git a/fs/proc/meminfo.c b/fs/proc/meminfo.c
> >> index 6fa761c9cc78..ccc7c40c8db7 100644
> >> --- a/fs/proc/meminfo.c
> >> +++ b/fs/proc/meminfo.c
> >> @@ -16,6 +16,7 @@
> >>  #ifdef CONFIG_CMA
> >>  #include <linux/cma.h>
> >>  #endif
> >> +#include <linux/dma-buf.h>
> >>  #include <asm/page.h>
> >>  #include "internal.h"
> >>  =

> >> @@ -145,7 +146,9 @@ static int meminfo_proc_show(struct seq_file *m, v=
oid *v)
> >>  	show_val_kb(m, "CmaFree:        ",
> >>  		    global_zone_page_state(NR_FREE_CMA_PAGES));
> >>  #endif
> >> -
> >> +#ifdef CONFIG_DMA_SHARED_BUFFER
> >> +	show_val_kb(m, "DmaBufTotal:    ", dma_buf_allocated_pages());
> >> +#endif
> >>  	hugetlb_report_meminfo(m);
> >>  =

> >>  	arch_report_meminfo(m);
> >> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> >> index efdc56b9d95f..5b05816bd2cd 100644
> >> --- a/include/linux/dma-buf.h
> >> +++ b/include/linux/dma-buf.h
> >> @@ -507,4 +507,5 @@ int dma_buf_mmap(struct dma_buf *, struct vm_area_=
struct *,
> >>  		 unsigned long);
> >>  int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
> >>  void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
> >> +long dma_buf_allocated_pages(void);
> >>  #endif /* __DMA_BUF_H__ */
> >> -- =

> >> 2.17.1
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://urldefense.com/v3/__https://lists.freedesktop.org/mailman/list=
info/dri-devel__;!!JmoZiZGBv3RvKRSx!qW8kUOZyY4Dkew6OvqgfoM-5unQNVeF_M1biaIA=
yQQBR0KB7ksRzZjoh382ZdGGQR9k$ =

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
