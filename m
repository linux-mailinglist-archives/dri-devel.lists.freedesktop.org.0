Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A3E3667C4
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 11:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12CEB6E42F;
	Wed, 21 Apr 2021 09:15:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831606E42F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 09:15:12 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id x12so41693092ejc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 02:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=hwlHsqdBtqff4Ac+PSU6y6DzhP/Gd51HpqaVQ47dWhA=;
 b=X+wyk/E+glX7OiptDiWUoYh6gN4W2CMa4bNwqRdyvwdrp03QiFeO15PJ+xIo3TLxyH
 Hh3x67rDQpuEsNX4dEbVy3I1JureHk23YBS9TF5PDchHy0TADXjxkfbLxSA9PmKbEAe0
 g4BvSzWNEVX6i9cgeIn7jW6uT3Ne4yVDHdVi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=hwlHsqdBtqff4Ac+PSU6y6DzhP/Gd51HpqaVQ47dWhA=;
 b=Uz3XH+sqyq98GbaoqL2woRYd4rCEIMbMYTmV2DCuTu4LcgQfU9n/9ydiXytxSDPWaV
 WDYeSSNjU2242gAIngxjf2g5E9+kwuPxh9fAEenJhwlPvbjgk+Fc8ZaOA47U069maUr8
 tegOTm3WkGYMKX+1YNFJy2zaxjpVGJTYld72BSVaXL/pYgvqITt0l/RY2SixMW3zloWJ
 +YnGpGiPVkmfA6ZVyM4nq5+qmGpWIujhn4/RO+x153yK/12agog0kr/3B+kUhaMOzdmq
 1J2ILpaYu+o3e5jR6PloCzIt5nWx7Hlf8vjIcZ6fFhtVscJFPz/Txz4ObSwcwJbEWoMR
 Gv4g==
X-Gm-Message-State: AOAM532oy3jpmfL03+kurP50fbFXJn0qJcaqt4DVLGTRj5NQ1sn3NPzJ
 HIbKgkywG+p3MWoF2FKn+V/w8w==
X-Google-Smtp-Source: ABdhPJxejGTS+rPS00uJABwlPeR2ief1mkxKW4nvNgs+ubzvmcezF1meNePRgUklgRIwmxrqfsD3uA==
X-Received: by 2002:a17:906:a103:: with SMTP id
 t3mr32306896ejy.334.1618996511164; 
 Wed, 21 Apr 2021 02:15:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s13sm1684562ejz.110.2021.04.21.02.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 02:15:10 -0700 (PDT)
Date: Wed, 21 Apr 2021 11:15:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Peter.Enderborg@sony.com
Subject: Re: [PATCH v5] dma-buf: Add DmaBufTotal counter in meminfo
Message-ID: <YH/tHFBtIawBfGBl@phenom.ffwll.local>
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
 <YH63iPzbGWzb676T@phenom.ffwll.local>
 <a60d1eaf-f9f8-e0f3-d214-15ce2c0635c2@sony.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a60d1eaf-f9f8-e0f3-d214-15ce2c0635c2@sony.com>
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

On Tue, Apr 20, 2021 at 11:37:41AM +0000, Peter.Enderborg@sony.com wrote:
> On 4/20/21 1:14 PM, Daniel Vetter wrote:
> > On Tue, Apr 20, 2021 at 09:26:00AM +0000, Peter.Enderborg@sony.com wrot=
e:
> >> On 4/20/21 10:58 AM, Daniel Vetter wrote:
> >>> On Sat, Apr 17, 2021 at 06:38:35PM +0200, Peter Enderborg wrote:
> >>>> This adds a total used dma-buf memory. Details
> >>>> can be found in debugfs, however it is not for everyone
> >>>> and not always available. dma-buf are indirect allocated by
> >>>> userspace. So with this value we can monitor and detect
> >>>> userspace applications that have problems.
> >>>>
> >>>> Signed-off-by: Peter Enderborg <peter.enderborg@sony.com>
> >>> So there have been tons of discussions around how to track dma-buf and
> >>> why, and I really need to understand the use-cass here first I think.=
 proc
> >>> uapi is as much forever as anything else, and depending what you're d=
oing
> >>> this doesn't make any sense at all:
> >>>
> >>> - on most linux systems dma-buf are only instantiated for shared buff=
er.
> >>>   So there this gives you a fairly meaningless number and not anything
> >>>   reflecting gpu memory usage at all.
> >>>
> >>> - on Android all buffers are allocated through dma-buf afaik. But the=
re
> >>>   we've recently had some discussions about how exactly we should tra=
ck
> >>>   all this, and the conclusion was that most of this should be solved=
 by
> >>>   cgroups long term. So if this is for Android, then I don't think ad=
ding
> >>>   random quick stop-gaps to upstream is a good idea (because it's a p=
retty
> >>>   long list of patches that have come up on this).
> >>>
> >>> So what is this for?
> >> For the overview. dma-buf today only have debugfs for info. Debugfs
> >> is not allowed by google to use in andoid. So this aggregate the infor=
mation
> >> so we can get information on what going on on the system.=A0
> >>
> >> And the LKML standard respond to that is "SHOW ME THE CODE".
> > Yes. Except this extends to how exactly this is supposed to be used in
> > userspace and acted upon.
> >
> >> When the top memgc has a aggregated information on dma-buf it is maybe
> >> a better source to meminfo. But then it also imply that dma-buf requir=
es memcg.
> >>
> >> And I dont see any problem to replace this with something better with =
it is ready.
> > The thing is, this is uapi. Once it's merged we cannot, ever, replace i=
t.
> > It must be kept around forever, or a very close approximation thereof. =
So
> > merging this with the justification that we can fix it later on or repl=
ace
> > isn't going to happen.
> =

> It is intended to be relevant as long there is a dma-buf. This is a proper
> metric. If the newer implementations is not get the same result it is
> not doing it right and is not better. If a memcg counter or a global_zone
> counter do the same thing they it can replace the suggested method.

We're not talking about a memcg controller, but about a dma-buf tracker.

Also my point was that you might not have a dma-buf on most linux systems
(outside of android really) for most gpu allocations. So we kinda need to
understand what you actually want to measure, not "I want to count all the
dma-buf in the system". Because that's a known-problematic metric in
general.

> But I dont think they will. dma-buf does not have to be mapped to a proce=
ss,
> and the case of vram, it is not covered in current global_zone. All of th=
em
> would be very nice to have in some form. But it wont change what the
> correct value of what "Total" is.

We need to understand what the "correct" value is. Not in terms of kernel
code, but in terms of semantics. Like if userspace allocates a GL texture,
is this supposed to show up in your metric or not. Stuff like that.
-Daniel

> =

> =

> > -Daniel
> >
> >>> -Daniel
> >>>
> >>>> ---
> >>>>  drivers/dma-buf/dma-buf.c | 12 ++++++++++++
> >>>>  fs/proc/meminfo.c         |  5 ++++-
> >>>>  include/linux/dma-buf.h   |  1 +
> >>>>  3 files changed, 17 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> >>>> index f264b70c383e..4dc37cd4293b 100644
> >>>> --- a/drivers/dma-buf/dma-buf.c
> >>>> +++ b/drivers/dma-buf/dma-buf.c
> >>>> @@ -37,6 +37,7 @@ struct dma_buf_list {
> >>>>  };
> >>>>  =

> >>>>  static struct dma_buf_list db_list;
> >>>> +static atomic_long_t dma_buf_global_allocated;
> >>>>  =

> >>>>  static char *dmabuffs_dname(struct dentry *dentry, char *buffer, in=
t buflen)
> >>>>  {
> >>>> @@ -79,6 +80,7 @@ static void dma_buf_release(struct dentry *dentry)
> >>>>  	if (dmabuf->resv =3D=3D (struct dma_resv *)&dmabuf[1])
> >>>>  		dma_resv_fini(dmabuf->resv);
> >>>>  =

> >>>> +	atomic_long_sub(dmabuf->size, &dma_buf_global_allocated);
> >>>>  	module_put(dmabuf->owner);
> >>>>  	kfree(dmabuf->name);
> >>>>  	kfree(dmabuf);
> >>>> @@ -586,6 +588,7 @@ struct dma_buf *dma_buf_export(const struct dma_=
buf_export_info *exp_info)
> >>>>  	mutex_lock(&db_list.lock);
> >>>>  	list_add(&dmabuf->list_node, &db_list.head);
> >>>>  	mutex_unlock(&db_list.lock);
> >>>> +	atomic_long_add(dmabuf->size, &dma_buf_global_allocated);
> >>>>  =

> >>>>  	return dmabuf;
> >>>>  =

> >>>> @@ -1346,6 +1349,15 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, s=
truct dma_buf_map *map)
> >>>>  }
> >>>>  EXPORT_SYMBOL_GPL(dma_buf_vunmap);
> >>>>  =

> >>>> +/**
> >>>> + * dma_buf_allocated_pages - Return the used nr of pages
> >>>> + * allocated for dma-buf
> >>>> + */
> >>>> +long dma_buf_allocated_pages(void)
> >>>> +{
> >>>> +	return atomic_long_read(&dma_buf_global_allocated) >> PAGE_SHIFT;
> >>>> +}
> >>>> +
> >>>>  #ifdef CONFIG_DEBUG_FS
> >>>>  static int dma_buf_debug_show(struct seq_file *s, void *unused)
> >>>>  {
> >>>> diff --git a/fs/proc/meminfo.c b/fs/proc/meminfo.c
> >>>> index 6fa761c9cc78..ccc7c40c8db7 100644
> >>>> --- a/fs/proc/meminfo.c
> >>>> +++ b/fs/proc/meminfo.c
> >>>> @@ -16,6 +16,7 @@
> >>>>  #ifdef CONFIG_CMA
> >>>>  #include <linux/cma.h>
> >>>>  #endif
> >>>> +#include <linux/dma-buf.h>
> >>>>  #include <asm/page.h>
> >>>>  #include "internal.h"
> >>>>  =

> >>>> @@ -145,7 +146,9 @@ static int meminfo_proc_show(struct seq_file *m,=
 void *v)
> >>>>  	show_val_kb(m, "CmaFree:        ",
> >>>>  		    global_zone_page_state(NR_FREE_CMA_PAGES));
> >>>>  #endif
> >>>> -
> >>>> +#ifdef CONFIG_DMA_SHARED_BUFFER
> >>>> +	show_val_kb(m, "DmaBufTotal:    ", dma_buf_allocated_pages());
> >>>> +#endif
> >>>>  	hugetlb_report_meminfo(m);
> >>>>  =

> >>>>  	arch_report_meminfo(m);
> >>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> >>>> index efdc56b9d95f..5b05816bd2cd 100644
> >>>> --- a/include/linux/dma-buf.h
> >>>> +++ b/include/linux/dma-buf.h
> >>>> @@ -507,4 +507,5 @@ int dma_buf_mmap(struct dma_buf *, struct vm_are=
a_struct *,
> >>>>  		 unsigned long);
> >>>>  int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
> >>>>  void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map=
);
> >>>> +long dma_buf_allocated_pages(void);
> >>>>  #endif /* __DMA_BUF_H__ */
> >>>> -- =

> >>>> 2.17.1
> >>>>
> >>>> _______________________________________________
> >>>> dri-devel mailing list
> >>>> dri-devel@lists.freedesktop.org
> >>>> https://urldefense.com/v3/__https://lists.freedesktop.org/mailman/li=
stinfo/dri-devel__;!!JmoZiZGBv3RvKRSx!qW8kUOZyY4Dkew6OvqgfoM-5unQNVeF_M1bia=
IAyQQBR0KB7ksRzZjoh382ZdGGQR9k$ =

> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://urldefense.com/v3/__https://lists.freedesktop.org/mailman/list=
info/dri-devel__;!!JmoZiZGBv3RvKRSx!vXvDg6I4V__QdL2fA08Rc5v6rjDzxOIQz6kwyMM=
LUK3_g4z7qZTg1H98BDDTxZeZjI4$ =

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
