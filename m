Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE981E9028
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 11:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAED6E9CD;
	Sat, 30 May 2020 09:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CA56E864;
 Fri, 29 May 2020 06:49:45 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id h188so631897lfd.7;
 Thu, 28 May 2020 23:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=duvqSauRz0FpWQFF0Eq5g7XEMfQ1c+DCTu7LukoHlpY=;
 b=dJkgyWD0ciBIQfF3woOJbQsYsbg0j2sy53gHMGBk66/DLQVlD2Li/OnKmZ1HHOVylg
 OycFqaMIkKyafxY/aMbGwwkeXJiMVJUXvFG099Qsm7Y7okuRyQ5BQWOhVZuIXkhnD4dC
 l13AE1muQIzF6gGJAoO8XCvDadFCwzfNCIi9IoIDSTQqwb1cLeUP0v98PMzsnuuj8+M8
 YHrEkMNXcCByn5nkIKZovzH55tyS+dWSVpFQMULT8K2MK79Qy1g09WIyKItusQdo2dZZ
 fS4J/QFUB/tnatg7f9CibGRQ8hnWVhTsMFIXxj3kQfuY8srH8ee6dw+7jqLX7lfiOQql
 +ejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=duvqSauRz0FpWQFF0Eq5g7XEMfQ1c+DCTu7LukoHlpY=;
 b=OitSgkD8b9WhvqC8q9+jzd882Kzxq0su5FmGidoze6vKFkmzS2RFjIlbWLV6VS3BAR
 Wip+cx6bzsWbvY9OJI2H2ai9x6R6ynDAMo6+uJVDQmZMLcUcvouQQe27knGdkHgxvuZL
 BUmmE8Nq2DtYqFPVJPY5+56rmKu4c0pN1Yv3yqtUnYiSgBY4UB4aT/Wt+2XlhnEEmsJN
 voDIyD+KdMgBzqgJSaVmHAzbS5F3fZz2i4r/MqLu49uKwa9/+bQHuSMxJ2vMPrn0/TLC
 NrlDQ5Jod8r/v6cMc3W6DPnuLRxN+1/rpgmJqYw/007iyQMMdlIMhfup4nKHrWnPCeq+
 0SHw==
X-Gm-Message-State: AOAM532OORE6ryfq6FC8XSocgeOFKG+9aURoyW+/tO6xr43s//OvOF0y
 DbuzzPdjw/ogmeSB9u2mpSx1w5zi7kR1i5l/Wrc=
X-Google-Smtp-Source: ABdhPJw2x0Tix5Tq5shT8N9Y2U5/m2pu3yTz3m3OmwzFD46UBDyZDMSbl4hATVzRPu6/m60TcMaci0i2xANR2AYiOTc=
X-Received: by 2002:a19:500e:: with SMTP id e14mr3595899lfb.88.1590734982916; 
 Thu, 28 May 2020 23:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <1590526802-3008-1-git-send-email-jrdr.linux@gmail.com>
 <69a033cf-63b2-7da6-6a5e-a5bbc94b8afb@nvidia.com>
 <20200527084852.GN206103@phenom.ffwll.local>
 <20200527085117.GO206103@phenom.ffwll.local>
 <aaf62285-981e-3753-5501-07bbba98fc36@nvidia.com>
In-Reply-To: <aaf62285-981e-3753-5501-07bbba98fc36@nvidia.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Fri, 29 May 2020 12:19:30 +0530
Message-ID: <CAFqt6zZVAQ3LKwud85LgHe9300xVjyGYXjvdWKTdezZA1uRewg@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Convert get_user_pages() --> pin_user_pages()
To: John Hubbard <jhubbard@nvidia.com>
X-Mailman-Approved-At: Sat, 30 May 2020 09:42:14 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 28, 2020 at 12:37 AM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 2020-05-27 01:51, Daniel Vetter wrote:
> > On Wed, May 27, 2020 at 10:48:52AM +0200, Daniel Vetter wrote:
> >> On Tue, May 26, 2020 at 03:57:45PM -0700, John Hubbard wrote:
> >>> On 2020-05-26 14:00, Souptick Joarder wrote:
> >>>> This code was using get_user_pages(), in a "Case 2" scenario
> >>>> (DMA/RDMA), using the categorization from [1]. That means that it's
> >>>> time to convert the get_user_pages() + release_pages() calls to
> >>>> pin_user_pages() + unpin_user_pages() calls.
> >>>>
> >>>> There is some helpful background in [2]: basically, this is a small
> >>>> part of fixing a long-standing disconnect between pinning pages, and
> >>>> file systems' use of those pages.
> >>>>
> >>>> [1] Documentation/core-api/pin_user_pages.rst
> >>>>
> >>>> [2] "Explicit pinning of user-space pages":
> >>>>       https://lwn.net/Articles/807108/
> >>
> >> I don't think this is a case 2 here, nor is it any of the others. Feels
> >> like not covered at all by the doc.
> >>
> >> radeon has a mmu notifier (might be a bit broken, but hey whatever there's
> >> other drivers which have the same concept, but less broken). So when you
> >> do an munmap, radeon will release the page refcount.
> >
>
> Aha, thanks Daniel. I withdraw my misinformed ACK, then.
>
> > I forgot to add: It's also not case 3, since there's no hw page fault
> > support. It's all faked in software, and explicitly synchronizes against
> > pending io (or preempts it, that depends a bit upon the jobs running).
> >
>
> This is what case 3 was *intended* to cover, but it looks like case 3 needs to
> be written a little better. I'll attempt that, and Cc you on the actual patch
> to -mm. (I think we also need a case 5 for an unrelated scenario, too, so
> it's time.)

There were no *case 5* in the other patch posted in -mm. Do we need to add it ?

>
>
> thanks,
> --
> John Hubbard
> NVIDIA
>
>
> >> Which case it that?
> >>
> >> Note that currently only amdgpu doesn't work like that for gpu dma
> >> directly to userspace ranges, it uses hmm and afaiui doens't hold a full
> >> page pin refcount.
> >>
> >> Cheers, Daniel
> >>
> >>
> >>>>
> >>>> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> >>>> Cc: John Hubbard <jhubbard@nvidia.com>
> >>>>
> >>>> Hi,
> >>>>
> >>>> I'm compile tested this, but unable to run-time test, so any testing
> >>>> help is much appriciated.
> >>>> ---
> >>>>    drivers/gpu/drm/radeon/radeon_ttm.c | 6 +++---
> >>>>    1 file changed, 3 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> >>>> index 5d50c9e..e927de2 100644
> >>>> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> >>>> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> >>>> @@ -506,7 +506,7 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_tt *ttm)
> >>>>                    uint64_t userptr = gtt->userptr + pinned * PAGE_SIZE;
> >>>>                    struct page **pages = ttm->pages + pinned;
> >>>> -          r = get_user_pages(userptr, num_pages, write ? FOLL_WRITE : 0,
> >>>> +          r = pin_user_pages(userptr, num_pages, write ? FOLL_WRITE : 0,
> >>>>                                       pages, NULL);
> >>>>                    if (r < 0)
> >>>>                            goto release_pages;
> >>>> @@ -535,7 +535,7 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_tt *ttm)
> >>>>            kfree(ttm->sg);
> >>>>    release_pages:
> >>>> -  release_pages(ttm->pages, pinned);
> >>>> +  unpin_user_pages(ttm->pages, pinned);
> >>>>            return r;
> >>>>    }
> >>>> @@ -562,7 +562,7 @@ static void radeon_ttm_tt_unpin_userptr(struct ttm_tt *ttm)
> >>>>                            set_page_dirty(page);
> >>>
> >>>
> >>> Maybe we also need a preceding patch, to fix the above? It should be
> >>> set_page_dirty_lock(), rather than set_page_dirty(), unless I'm overlooking
> >>> something (which is very possible!).
> >>>
> >>> Either way, from a tunnel vision perspective of changing gup to pup, this
> >>> looks good to me, so
> >>>
> >>>      Acked-by: John Hubbard <jhubbard@nvidia.com>
> >>>
> >>>
> >>> thanks,
> >>> --
> >>> John Hubbard
> >>> NVIDIA
> >>>
> >>>>                    mark_page_accessed(page);
> >>>> -          put_page(page);
> >>>> +          unpin_user_page(page);
> >>>>            }
> >>>>            sg_free_table(ttm->sg);
> >>>>
> >>>
> >>
> >> --
> >> Daniel Vetter
> >> Software Engineer, Intel Corporation
> >> http://blog.ffwll.ch
> >
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
