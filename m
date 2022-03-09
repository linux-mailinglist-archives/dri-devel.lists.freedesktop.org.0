Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC4B4D3C3E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 22:39:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C218210E379;
	Wed,  9 Mar 2022 21:39:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF13D10E379;
 Wed,  9 Mar 2022 21:39:54 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 k13-20020a4a948d000000b003172f2f6bdfso4543330ooi.1; 
 Wed, 09 Mar 2022 13:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BtkPADRnTNW1bWoXQJNvhN2Ab+xlM9f0hFBPvwqTW1Q=;
 b=eEh04vQ/0QSeod6rMvqDyiHrBxF4SZOQgNyZKRJnc/1Rznstq3DTzIzR8SsDPQbqGZ
 WeUs+jJdNwAiyu1KeQenWuzbsTGd9j7tXMj9OBof9vDB30eANLHllCRcV6Ao6EyPHo4e
 luRdlmYO/oejsmgbaY4vUG+WZZJLfVeVzeOyK+yEXhg0rZQTIy2JablAftLc0gVhn737
 NT19USzgpIE6p9LNPP/jvhLP2MyQulJSHGRa96CJA/ngTZ/MzDmz5fWGU0/rmYBc8tHU
 XUnu/MWEwGBwDahE+evoMF2aJ1xUgQt8fUKOIPf+dzRZw2EqT01LEqHsb6VvJzIKFwBQ
 Nx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BtkPADRnTNW1bWoXQJNvhN2Ab+xlM9f0hFBPvwqTW1Q=;
 b=6/EDbI7ldM/v1GHWarFsRuNtkbRMjOUg3rMi0hadD6lolmtCLFauiEub+lB+Pge20B
 kcO2xBMIK+5vJwOAIx1yipMN3qrrM/uHaUAm/2QMr8nKQstue9b/GDrLQEhD/rT3eTbp
 Uuc1WP2bgYaqHBExqhU2ysSTlwc/M75eRtpvPEm3rYaPR0B4vaq0tb2VUxl1f+LfRq5+
 g6CtzKP4fjk5v6FlBpWzZrNrRwxVfFPrEHo6wJSz6CJ9EL6/MihyEPvUb5xhao2HZ4n7
 iRbdZAaI0q91Lvvc663VGlPKC/95okw/QvpFVhU4sORDcONVE1SNbeYGicX7TlGZvxIr
 Iy9Q==
X-Gm-Message-State: AOAM5318UFmyc6/u4u8v7l2617HGSjKTUGuTGSDGxK7HWC4MmEveFUNf
 TgzvCvKcNPH93lYA0otPcZJNjJPvDpmTsU49GmE=
X-Google-Smtp-Source: ABdhPJwSyds76xJs9YmdvRnWPrRXhRqZnnJBgwsHTYeny744kxPTu9LVEe9CXmIOtfO/2ebWuzQj8mLg2mrE6367C44=
X-Received: by 2002:a05:6870:d250:b0:da:b3f:2b29 with SMTP id
 h16-20020a056870d25000b000da0b3f2b29mr6270636oac.200.1646861993898; Wed, 09
 Mar 2022 13:39:53 -0800 (PST)
MIME-Version: 1.0
References: <20220309212031.3063-1-david.yatsin@amd.com>
 <3e6eb8ab-57f9-8118-4d80-0db0b51e7786@amd.com>
In-Reply-To: <3e6eb8ab-57f9-8118-4d80-0db0b51e7786@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 9 Mar 2022 16:39:42 -0500
Message-ID: <CADnq5_NVpN=YH1DDPPqJmyToTYN=-aT1fQvrBhxNubcvHEg5jA@mail.gmail.com>
Subject: Re: [PATCH] fixup! drm/amdkfd: CRIU export dmabuf handles for GTT BOs
To: Felix Kuehling <felix.kuehling@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 David Yat Sin <david.yatsin@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No problem.  squashed in:
https://gitlab.freedesktop.org/agd5f/linux/-/commit/74041e46982cd627e7b52f9c3ed37d23a4973b5f

Alex


Alex

On Wed, Mar 9, 2022 at 4:23 PM Felix Kuehling <felix.kuehling@amd.com> wrote:
>
> On 2022-03-09 16:20, David Yat Sin wrote:
> > Signed-off-by: David Yat Sin <david.yatsin@amd.com>
>
> Please add the commit description back. And let's wait for Alex to
> confirm that the fixup-method is OK. With that fixed, the patch is
>
> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
>
>
> > ---
> >   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 6 ++++++
> >   include/uapi/linux/kfd_ioctl.h           | 2 ++
> >   2 files changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> > index e1e2362841f8..607f65ab39ac 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> > @@ -1767,7 +1767,10 @@ static int criu_checkpoint_bos(struct kfd_process *p,
> >                                               &bo_bucket->dmabuf_fd);
> >                               if (ret)
> >                                       goto exit;
> > +                     } else {
> > +                             bo_bucket->dmabuf_fd = KFD_INVALID_FD;
> >                       }
> > +
> >                       if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL)
> >                               bo_bucket->offset = KFD_MMAP_TYPE_DOORBELL |
> >                                       KFD_MMAP_GPU_ID(pdd->dev->id);
> > @@ -2219,7 +2222,10 @@ static int criu_restore_bo(struct kfd_process *p,
> >                                           &bo_bucket->dmabuf_fd);
> >               if (ret)
> >                       return ret;
> > +     } else {
> > +             bo_bucket->dmabuf_fd = KFD_INVALID_FD;
> >       }
> > +
> >       return 0;
> >   }
> >
> > diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
> > index eb9ff85f8556..42975e940758 100644
> > --- a/include/uapi/linux/kfd_ioctl.h
> > +++ b/include/uapi/linux/kfd_ioctl.h
> > @@ -196,6 +196,8 @@ struct kfd_ioctl_dbg_wave_control_args {
> >       __u32 buf_size_in_bytes;        /*including gpu_id and buf_size */
> >   };
> >
> > +#define KFD_INVALID_FD     0xffffffff
> > +
> >   /* Matching HSA_EVENTTYPE */
> >   #define KFD_IOC_EVENT_SIGNAL                        0
> >   #define KFD_IOC_EVENT_NODECHANGE            1
