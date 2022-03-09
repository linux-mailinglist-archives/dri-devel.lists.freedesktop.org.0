Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C23CA4D3BFB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 22:21:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9750010E43A;
	Wed,  9 Mar 2022 21:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7325310E43A;
 Wed,  9 Mar 2022 21:21:17 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id x193so4056214oix.0;
 Wed, 09 Mar 2022 13:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FYJRgSwaXI26mu4u+jbTMJAfQ8LCsdQ2zDlJQAbYT5s=;
 b=p8V0RzVZ2CURQk07WnkwaFgzTt5K74nvg2rqbtzCwjif/a0ygJdO8J3Z1/mULHL+Wb
 Tf6hpFzq9QFXEIvE6v79oCtnZhQ4Dx6UpNWwFLpTHrprhYsYNX71Lavd3DPWMrJNtX6d
 pLQG8RY1BGaG7N2pW140/axs7ZrJ2UoXdhC7MEmo9a/5IAHAL0u8m+4d8ZmUz2pPjO0t
 ouBLD/sbYpDl0stz7+jacqWRutAa9dCJJ2740JE5DLwq9D01kJOzu2rhdPdLtNVcgSoT
 J7nSsxPFFHFaIj/12BKIXJvJy2hDrjwcklRkrDAEpAQQ3WEwAmX/+FDtuJw8bksQuMkA
 e/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FYJRgSwaXI26mu4u+jbTMJAfQ8LCsdQ2zDlJQAbYT5s=;
 b=xyTbQ41Qw1MFNfDC2l6twFpdCLBJEP14GINjq6LFPTxPbiT972PQlGAVocSazy7B6P
 sasFZTx6R5Kpehbd2gh++dJCCnmm0OZOc2n8P+2FmrBQo1YoAFFpql0yrW46rbyWVb2m
 cbZ+2hzAdkt4W0248IdWEFxwCIcvOLHiCul1WPCvpWCp/mmp3aeMcE7GT7nq0Utl+d4T
 wAhDXCNSYXf8P+Jj14KOdhppzmQq3SuKm00yeDmY6cDflRra19VlQROtzIaTl+4HIxk3
 pXObopN9n8aD0ZfE1FeSaediMzXt4kG0LsnQd0VJ0glZvHU398xaAw7FhP6+/C+35k7L
 yR8g==
X-Gm-Message-State: AOAM5328/axx0NOZbWc2LivOAR+RVRBRsg49VP+7+0FGANmLyiOyj0Rn
 YjmIZVrmmEvWlfdrlsSU56GcpcztpSRv6miYfPc=
X-Google-Smtp-Source: ABdhPJxcSVrtUNFcTixWUgCGZ5oEpFdQBrK2C47Go+1RhN6GwrJctQh4hrS8qzQiTxv0dPUJ00wYg2esNL0U/ER9zFw=
X-Received: by 2002:a05:6808:1281:b0:2d9:a01a:4bd6 with SMTP id
 a1-20020a056808128100b002d9a01a4bd6mr1034938oiw.253.1646860876638; Wed, 09
 Mar 2022 13:21:16 -0800 (PST)
MIME-Version: 1.0
References: <20220309174133.14454-1-david.yatsin@amd.com>
 <2e207a5e-0c94-a148-6986-9e3922945ce0@amd.com>
In-Reply-To: <2e207a5e-0c94-a148-6986-9e3922945ce0@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 9 Mar 2022 16:21:05 -0500
Message-ID: <CADnq5_MLh5SSvtaj1j80zZBZkQ4dmA5hhMVidhdXYy4171Jr4A@mail.gmail.com>
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

On Wed, Mar 9, 2022 at 4:10 PM Felix Kuehling <felix.kuehling@amd.com> wrote:
>
> On 2022-03-09 12:41, David Yat Sin wrote:
> > Set dmabuf handle to invalid for BOs that cannot be accessed using SDMA
> > during checkpoint/restore.
> >
> > Signed-off-by: David Yat Sin <david.yatsin@amd.com>
> > ---
> >   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 8 ++++++--
> >   include/uapi/linux/kfd_ioctl.h           | 2 ++
> >   2 files changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> > index e1e2362841f8..1ffa976ad318 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> > @@ -1767,7 +1767,9 @@ static int criu_checkpoint_bos(struct kfd_process *p,
> >                                               &bo_bucket->dmabuf_fd);
> >                               if (ret)
> >                                       goto exit;
> > -                     }
> > +                     } else
> > +                             bo_bucket->dmabuf_fd = KFD_INVALID_FD;
>
> Minor nit-pick: It would be better to use {} around the else-branch for
> consistency with the if-branch. Same below.
>
> Ideally, this should have been part of the patch that bumped the KFD
> version to 1.8. Alex, is there a way to squash this when you send this
> in a pull-request for drm-next? Maybe if we create the commit with "git
> commit --fixup" you can let auto-squash handle it.
>

When did that patch land?  If I haven't included it in a PR yet, I can
squash this in.

Alex


> Other than that, the patch looks good to me.
>
> Regards,
>    Felix
>
>
> > +
> >                       if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL)
> >                               bo_bucket->offset = KFD_MMAP_TYPE_DOORBELL |
> >                                       KFD_MMAP_GPU_ID(pdd->dev->id);
> > @@ -2219,7 +2221,9 @@ static int criu_restore_bo(struct kfd_process *p,
> >                                           &bo_bucket->dmabuf_fd);
> >               if (ret)
> >                       return ret;
> > -     }
> > +     } else
> > +             bo_bucket->dmabuf_fd = KFD_INVALID_FD;
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
