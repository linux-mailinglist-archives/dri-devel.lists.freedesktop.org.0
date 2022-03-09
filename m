Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4C94D3C04
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 22:23:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3724E10E45F;
	Wed,  9 Mar 2022 21:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64B910E482;
 Wed,  9 Mar 2022 21:23:11 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id i5so4026194oih.1;
 Wed, 09 Mar 2022 13:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2zuknQ2F8IFcYXiL5EyRvhr3K98oEwTorGO9Wp47QjY=;
 b=OPp5oa9gRHdtbppjAPnfTWlLJKNjnbN9ByKrQhoPvYQ2u0VxJzenRo1pt3BNoaSO10
 zxG1tFQSJo1bU8ng3fHDoMRxYBSXeLiNMW4G3TW/DHJr1uAEYfc9ZMNvJshxxS2Q8viK
 gJ2+i0Pmerw06LI7pNotW0NFymDrU4v6N7p0laX+eDyEFzlaueXp6n9j2JsWUxGxrR8U
 jQleOz0FOKrps5K/IgnyZ6XL3pSiR956GqkWeuCN7GnbWGlUF33m7FHWkZId19htwv5k
 izaQjIY5wN+ps+kRqzT+oljZxhCWCDgICPYSgXRnbRYMQ3dTNjvhFyzFrYBv4HIzjH93
 tlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2zuknQ2F8IFcYXiL5EyRvhr3K98oEwTorGO9Wp47QjY=;
 b=zSSWxBsp2gUa0EYD6BMQuSICm2N73JMLS348KZ8j8/G5NithUGOyFJndZ+e4J6+qYO
 ONwfdmJ/rSBVc6b26toIG1U52JxiuzRgO6F/PSJgEt1Yc4NSBN6JenkaKjqNyY7goimL
 d73qf/iVsizTvvdlQzavfRIQHHzB6KVU558NOzbn1po+W7YJrHhxevqWLZPMIvXHHA9M
 ffDmm1ejDKT2qnawDtbHpWKc8eQzlm1yXmRWLKkFDKgwcL9AH7zwQ47Hu3Li4PBQReuU
 QEeA3KJ1OzVy3eyDOV2vlKbTz9eSHjSFmKpI8iwXlEmvRgkIYf3wAzZq3r2OMSn5nGOt
 FHQQ==
X-Gm-Message-State: AOAM533qmGdHBI7eNwMC/7/o5VlD6BS6E5HZzkYVYzYlNZaMVER4Pddu
 nAka5uini3v8kQPl4rEBsP+/SW2x1D1LlyF+ZJE=
X-Google-Smtp-Source: ABdhPJzm8lZx+uXc7vhIrMu3Ggc4iCdVUI4Ewkp89153Cylj84RVI5Za78WJOCC6y16HoaJ1iycyTJSc3zTkKgxq3TA=
X-Received: by 2002:a05:6808:1281:b0:2d9:a01a:4bd6 with SMTP id
 a1-20020a056808128100b002d9a01a4bd6mr1039630oiw.253.1646860991073; Wed, 09
 Mar 2022 13:23:11 -0800 (PST)
MIME-Version: 1.0
References: <20220309174133.14454-1-david.yatsin@amd.com>
 <2e207a5e-0c94-a148-6986-9e3922945ce0@amd.com>
 <CADnq5_MLh5SSvtaj1j80zZBZkQ4dmA5hhMVidhdXYy4171Jr4A@mail.gmail.com>
In-Reply-To: <CADnq5_MLh5SSvtaj1j80zZBZkQ4dmA5hhMVidhdXYy4171Jr4A@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 9 Mar 2022 16:23:00 -0500
Message-ID: <CADnq5_Ph0f5NCUFTsM3Dn6MGwtgALLUHGie_w+eEpcVsq9r24g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: Set handle to invalid for non GTT/VRAM BOs
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 David Yat Sin <david.yatsin@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 9, 2022 at 4:21 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Wed, Mar 9, 2022 at 4:10 PM Felix Kuehling <felix.kuehling@amd.com> wrote:
> >
> > On 2022-03-09 12:41, David Yat Sin wrote:
> > > Set dmabuf handle to invalid for BOs that cannot be accessed using SDMA
> > > during checkpoint/restore.
> > >
> > > Signed-off-by: David Yat Sin <david.yatsin@amd.com>
> > > ---
> > >   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 8 ++++++--
> > >   include/uapi/linux/kfd_ioctl.h           | 2 ++
> > >   2 files changed, 8 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> > > index e1e2362841f8..1ffa976ad318 100644
> > > --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> > > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> > > @@ -1767,7 +1767,9 @@ static int criu_checkpoint_bos(struct kfd_process *p,
> > >                                               &bo_bucket->dmabuf_fd);
> > >                               if (ret)
> > >                                       goto exit;
> > > -                     }
> > > +                     } else
> > > +                             bo_bucket->dmabuf_fd = KFD_INVALID_FD;
> >
> > Minor nit-pick: It would be better to use {} around the else-branch for
> > consistency with the if-branch. Same below.
> >
> > Ideally, this should have been part of the patch that bumped the KFD
> > version to 1.8. Alex, is there a way to squash this when you send this
> > in a pull-request for drm-next? Maybe if we create the commit with "git
> > commit --fixup" you can let auto-squash handle it.
> >
>
> When did that patch land?  If I haven't included it in a PR yet, I can
> squash this in.

Ah, I see it.  It was from yesterday, so no problem.

Alex

>
> Alex
>
>
> > Other than that, the patch looks good to me.
> >
> > Regards,
> >    Felix
> >
> >
> > > +
> > >                       if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL)
> > >                               bo_bucket->offset = KFD_MMAP_TYPE_DOORBELL |
> > >                                       KFD_MMAP_GPU_ID(pdd->dev->id);
> > > @@ -2219,7 +2221,9 @@ static int criu_restore_bo(struct kfd_process *p,
> > >                                           &bo_bucket->dmabuf_fd);
> > >               if (ret)
> > >                       return ret;
> > > -     }
> > > +     } else
> > > +             bo_bucket->dmabuf_fd = KFD_INVALID_FD;
> > > +
> > >       return 0;
> > >   }
> > >
> > > diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
> > > index eb9ff85f8556..42975e940758 100644
> > > --- a/include/uapi/linux/kfd_ioctl.h
> > > +++ b/include/uapi/linux/kfd_ioctl.h
> > > @@ -196,6 +196,8 @@ struct kfd_ioctl_dbg_wave_control_args {
> > >       __u32 buf_size_in_bytes;        /*including gpu_id and buf_size */
> > >   };
> > >
> > > +#define KFD_INVALID_FD     0xffffffff
> > > +
> > >   /* Matching HSA_EVENTTYPE */
> > >   #define KFD_IOC_EVENT_SIGNAL                        0
> > >   #define KFD_IOC_EVENT_NODECHANGE            1
