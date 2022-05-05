Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3656B51BA99
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 10:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6A110E430;
	Thu,  5 May 2022 08:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B07310E331
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 08:35:52 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id g20so4350117edw.6
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 01:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ESa9RftxhuytIqdt64NRQOxviC+J+u06ZHQ5au8P0MU=;
 b=Sb9T9z9lW3YcLRS10JqCcxxPDAAhrdSL4i61kkOBOPHOKkjkRdOI/ONqbi7lXM6IzM
 7nmml0GGNg1gmdiHklq84QDX9A6gGq67jmm9vaOc6MzfRDzBod/uFKw/Jm4acypD7lxL
 hmuPvHp2lkgQi77SEYwpKrNhgge9ejzLQdrmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ESa9RftxhuytIqdt64NRQOxviC+J+u06ZHQ5au8P0MU=;
 b=uEnlmN83J7ZYl3nzGXnpaiujZdigfC43BEdrrsZamwWVFKtM0rr/hSqPGYSrKmllDs
 6UR7xrJoNlWjaNfOsCRNUtzU1TJQgPHrS0U1BJtNd/W6rAY6EaqJ64bOnqDQrAH0vbxG
 LGIaKMiml3o1xKvahcb3yY9Fd1z7C9Hs5LtUg8V8ElN/dpt+CGVgITFuQ140E/UX9Ss7
 LSfQ9pK5q1dkyDO//3z28fiH9pz1P4FKEuLYF7pHOUNTIbfcbLnm46VwYuHMoSWxh1uO
 M2YF3s6GthmjpT5x9MBGDmex8HTeVZoogfTN0GcZ8C0h5hC25oxryoPGOLaFaI5m/kgG
 Gkxw==
X-Gm-Message-State: AOAM530Kelg35lqIdt8dZEJ1CMpinppgSvfxEq3FkRzOy9JJGdsyLhoz
 iQwe4GYiM8rI4jjDZ85tUUDUgw==
X-Google-Smtp-Source: ABdhPJwmOvPLkPWpsiEcCSWn5g5VnHONBDKrB+psXat5vUuXuG8yW1gQ8DsHJln2V+wTtG4qA+H73g==
X-Received: by 2002:a05:6402:3488:b0:427:b4ec:991b with SMTP id
 v8-20020a056402348800b00427b4ec991bmr24082687edc.319.1651739751113; 
 Thu, 05 May 2022 01:35:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a50f10c000000b0042617ba63c4sm495492edl.78.2022.05.05.01.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 01:35:50 -0700 (PDT)
Date: Thu, 5 May 2022 10:35:48 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/2] dma-buf: Add an API for exporting sync files (v13)
Message-ID: <YnOMZGgqUFM0veSf@phenom.ffwll.local>
References: <20220504203404.1495485-1-jason@jlekstrand.net>
 <20220504203404.1495485-2-jason@jlekstrand.net>
 <7d478470-00fa-07a6-1479-dee80ced5b76@amd.com>
 <CAOFGe948_qtwrLd1DiHOJOkxK-iT_qU-3FG+uz4bGGnL7oKpCw@mail.gmail.com>
 <03423100-0266-1396-49ad-2b61d7331f6e@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03423100-0266-1396-49ad-2b61d7331f6e@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 05, 2022 at 10:27:39AM +0200, Christian König wrote:
> Am 05.05.22 um 10:10 schrieb Jason Ekstrand:
> > On Thu, May 5, 2022 at 1:25 AM Christian König
> > <christian.koenig@amd.com> wrote:
> > 
> >     [SNIP]
> >     > +     fd_install(fd, sync_file->file);
> >     > +
> >     > +     arg.fd = fd;
> >     > +     if (copy_to_user(user_data, &arg, sizeof(arg)))
> >     > +             return -EFAULT;
> > 
> >     I know we had that discussion before, but I'm not 100% any more
> >     what the
> >     outcome was.
> > 
> >     The problem here is that when the copy_to_user fails we have a file
> >     descriptor which is valid, but userspace doesn't know anything
> >     about it.
> > 
> >     I only see a few possibilities here:
> >     1. Keep it like this and just assume that a process which you
> >     can't copy
> >     the fd to is also dying (a bit to much assumption for my taste).
> > 
> >     2. Close the file descriptor when this happens (not ideal either).
> > 
> >     3. Instead of returning the fd in the parameter structure return
> >     it as
> >     IOCTL result.
> > 
> >     Number 3 is what drm_prime_handle_to_fd_ioctl() is doing as well and
> >     IIRC we said that this is probably the best option.
> > 
> > 
> > I don't have a strong preference here, so I'll go with whatever in the
> > end but let me at least explain my reasoning.  First, this was based on
> > the FD import/export in syncobj which stuffs the FD in the args struct. 
> > If `copy_to_user` is a problem here, it's a problem there as well. 
> > Second, the only way `copy_to_user` can fail is if the client gives us a
> > read-only page or somehow manages to race removing the page from their
> > address space (via unmap(), for instance) with this ioctl.  Both of
> > those seem like pretty serious client errors to me.  That, or the client
> > is in the process of dying, in which case we really don't care.
> 
> Yeah, I know about that copy_to_user() issue in the syncobj and also some
> driver specific handling.
> 
> That's why we discussed this before and IIRC somebody indeed ran into an
> issue with -EFAULT and that was the reason all this bubbled up.
> 
> I don't have a strong preference either, but I think we should try to learn
> from previous mistakes and design new interfaces based on such experience.

We have this in a bunch of places (like execbuf tail handling after
drm_sched_job_push()) and I think what we commonly do is just try to clean
up the mess a bit and fail.

I think what you could do here is do the copy_to_user before you do the
fd_install, and if the copy_to_user fails you just clean up everything and
fail. That just means there's a small window where userspace has an fd
reserve that didn't end up being used, but also in real apps this just
never matters.

Leaking the fd is maybe not the best option, but meh.
-Daniel

> 
> Christian.
> 
> > 
> > --Jason
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
