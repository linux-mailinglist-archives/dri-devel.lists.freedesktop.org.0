Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F9036A086
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 11:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA886E1DE;
	Sat, 24 Apr 2021 09:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86636E1DE;
 Sat, 24 Apr 2021 09:27:51 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id y22so1879002vsd.13;
 Sat, 24 Apr 2021 02:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rlGWPl25FCa96zci06+ZWbGtm3tUuzzsH67YozYxWGE=;
 b=sTf+76tWRNc4bSEDLdNAg0wexuK5dsnVUl1FWko6IsXWXz/k/VwT0CaZf0e8mls9yX
 vu1RB8IyOarHBHxpzItwynwKzCbzaS/+MMT0KRiBZ4rA9605WPwZXHYHgDe2k2FM09bp
 CQSd3E0bqSC5dT8cBVIvvaqyKr1+Oh1dB/0gHOlSeDAKII+SYBYSPnbpJPId9kXMYaFI
 c+kLweW2xBC/8F4ZmsxPywClM4LWKtZjjikKmFAEF4k0AFqs2/8c3Fxh+xnDKHyL1SvO
 aIp4bkXU6+SNL+jFNhEFUDMeX31he7KDwDtASt+FhQfviO6tbx9s2pm+MPI7iRjsI55U
 vybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rlGWPl25FCa96zci06+ZWbGtm3tUuzzsH67YozYxWGE=;
 b=YBWIM3Ar+L7jJoHOLjkHzsYCt8miVFJQ/tbVPYLAxZ9zCtV+J86zy/wVHXEtBkFPk4
 6LAXWkBC4jrmB6q2ZlUzHbK8Ynve9tnu5k6IR7h0CIt3Cyo/9Z+jGroGVVZLXWZ1hp/C
 UFRQ1gSg7zaL6Aj3ozo6Qz6VnpFQHXmHfdm/kO5A0w/vjZeLqCkrHK7upORk5ASjuV3Y
 i6jLRVhVx6OLfK+Eck6kyP8iCQmXFi9lxT6L3S0Do8af3oJK8Wgwd5Bg4v9Rgq5JqjcB
 SlkQyhD706HlMjs6koC9Hif+q+QIQHDNSm9YOW1RHT89ep2/cnuzfvzO9xOw0i6ujJbh
 yV/A==
X-Gm-Message-State: AOAM532eYkd9xGQhI46idsN8SJQEJmcoLJyWajDYGT9LG285H8XMuAF9
 qiBvpAXfDYwdh0RVcj2AWBnfq4+YpmXS5Wv1Tr4=
X-Google-Smtp-Source: ABdhPJzewChMoUIj259gk1Tr7mqAnTRL0xv0ExATevzweUjTPS5Pzj3bXAxO4wZu56lswZD7wmGZZCObG+AIzQh6yKo=
X-Received: by 2002:a05:6102:322f:: with SMTP id
 x15mr6785842vsf.9.1619256470690; 
 Sat, 24 Apr 2021 02:27:50 -0700 (PDT)
MIME-Version: 1.0
References: <1619213997-5475-1-git-send-email-jrdr.linux@gmail.com>
 <da39ded9-7222-8530-2388-aef3879d1ca3@amd.com>
In-Reply-To: <da39ded9-7222-8530-2388-aef3879d1ca3@amd.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Sat, 24 Apr 2021 14:57:39 +0530
Message-ID: <CAFqt6zbnK6xVvsy5F7ZbOfKhQhfUnv5tPwp+d-_rwxK6TnJUhQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Added missing prototype
To: Felix Kuehling <felix.kuehling@amd.com>
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
Cc: jonathan.kim@amd.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>, amd-gfx@lists.freedesktop.org, "Deucher,
 Alexander" <alexander.deucher@amd.com>, evan.quan@amd.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Dennis.Li@amd.com,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 24, 2021 at 5:03 AM Felix Kuehling <felix.kuehling@amd.com> wrote:
>
> Am 2021-04-23 um 5:39 p.m. schrieb Souptick Joarder:
> > Kernel test robot throws below warning ->
> >
> >>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c:125:5: warning:
> >>> no previous prototype for 'kgd_arcturus_hqd_sdma_load'
> >>> [-Wmissing-prototypes]
> >      125 | int kgd_arcturus_hqd_sdma_load(struct kgd_dev *kgd, void
> > *mqd,
> >
> >>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c:227:6: warning:
> >>> no previous prototype for 'kgd_arcturus_hqd_sdma_is_occupied'
> >>> [-Wmissing-prototypes]
> >      227 | bool kgd_arcturus_hqd_sdma_is_occupied(struct kgd_dev *kgd,
> > void *mqd)
> >          |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c:246:5: warning:
> >>> no previous prototype for 'kgd_arcturus_hqd_sdma_destroy'
> >>> [-Wmissing-prototypes]
> >      246 | int kgd_arcturus_hqd_sdma_destroy(struct kgd_dev *kgd, void
> > *mqd,
> >          |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > Added prototype for these functions.
> The prototypes are already defined in amdgpu_amdkfd_arcturus.h. I think
> we just need to add a #include in amdgpu_amdkfd_arcturus.c.
>

Right. I missed that file. Will send v2.

> Regards,
>   Felix
>
>
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu.h | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > index dc3a692..8fff0e7 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > @@ -316,6 +316,11 @@ int amdgpu_device_ip_wait_for_idle(struct amdgpu_device *adev,
> >                                  enum amd_ip_block_type block_type);
> >  bool amdgpu_device_ip_is_idle(struct amdgpu_device *adev,
> >                             enum amd_ip_block_type block_type);
> > +int kgd_arcturus_hqd_sdma_load(struct kgd_dev *kgd, void *mqd,
> > +                             uint32_t __user *wptr, struct mm_struct *mm);
> > +bool kgd_arcturus_hqd_sdma_is_occupied(struct kgd_dev *kgd, void *mqd);
> > +int kgd_arcturus_hqd_sdma_destroy(struct kgd_dev *kgd, void *mqd,
> > +                                     unsigned int utimeout);
> >
> >  #define AMDGPU_MAX_IP_NUM 16
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
