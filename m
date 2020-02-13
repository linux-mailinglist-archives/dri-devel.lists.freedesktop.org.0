Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A3215B721
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 03:21:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97AE46E150;
	Thu, 13 Feb 2020 02:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6941E6E150
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 02:20:55 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id b15so3620277iln.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 18:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fHKXn9BpMZfdhI/OaHapin8InfjlcGPzLnSLkrmJfsQ=;
 b=AzYKIveVgkoL1cwTOUGMRcUDjaDgCFrgWid0jcQTW/5J1cBwY4YDgsRMb5pRsKQQ2X
 2UHd7nRwcs/hZDyY7W9st+MtQqPQ/Z59OF737ZCYik2X34qd6h49EfK4GqJ2xRobUPhf
 PJ/4mDZCKfD8/qt/Xwkfo5pY3Qx6RgD4AzKr/nwJ1oew3Gkg+v7WGsLZY4jHD84iS30V
 Wn4YR9gYF2JWSpg2FeSWI3WGXBZUOku5xYACByKtbu+IbiczXKRQm1Yi6wVQgVMS3VZr
 sF2VjeLS2ALbgr7PM0QfOtD3RhIzzQy2H80LKGKp5cRs8/FcPeuCRR8dSTmb99Dyt6bI
 kp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fHKXn9BpMZfdhI/OaHapin8InfjlcGPzLnSLkrmJfsQ=;
 b=eEB6iR0gzVwob/rTruSexZGVC5C54g7AhWv055cSWEitqWF5+7AMPHH0DF0RVhk/DK
 yg24ZKRchLqxzrEsNrgCVnz8X9rzbILvMHDDOdVW0XBarH5Bq+po4CjXNdUvy2dnyvLv
 ONSR2bM6Jx+j1VjHFhUAaXb5h/uL5Eqw9ZXw8Y4EcopXbD0n251NR74lxzcfY4A0g8/m
 D3aqcClJwFATUWr03NcQ6ZrJj/6BMOORZAKdcjwQ3awwyaRrveEiDhkbYZ1OkioelPDk
 cuvffXcCPuROUnKgntL+5HgjbRgeaQ7lUmlRoX1Bo5UW59gz/piqMyjPHb8l13LMIf1L
 YR8A==
X-Gm-Message-State: APjAAAWw4MvCCOURaE+3b/KtwtriDD/qcFGu8J+sgIJntgrQZwD3wlC6
 LzyU4WADXfGt3R2E4A7tlTzxSs+AB+bYjAacR40=
X-Google-Smtp-Source: APXvYqyfbkM2dZEVkB0jF7/VIqYSlNaLz1Eh1sOkToZcnoKXY4sn7CVK41xOa0UI4KbEDOFBZ/vHgx2ky6Vt2bAXP9g=
X-Received: by 2002:a92:9e97:: with SMTP id s23mr14930317ilk.139.1581560454577; 
 Wed, 12 Feb 2020 18:20:54 -0800 (PST)
MIME-Version: 1.0
References: <20200211235635.488-1-gurchetansingh@chromium.org>
 <20200211235635.488-4-gurchetansingh@chromium.org>
 <CAPaKu7QrK9PKaLdtmLd657-vnAPbisCr7EoYS9QyiQZSqevKQQ@mail.gmail.com>
 <CAAfnVBkzWJzOqg7X6cAdGM14WGHdaMCcu9XA2SVoZKD7i6MdSQ@mail.gmail.com>
In-Reply-To: <CAAfnVBkzWJzOqg7X6cAdGM14WGHdaMCcu9XA2SVoZKD7i6MdSQ@mail.gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 12 Feb 2020 18:20:42 -0800
Message-ID: <CAPaKu7Tf0t8Tpcsa+STurHk-ry-_wOjXGGprLFJdnpboN6pJiw@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/virtio: track whether or not a context has been
 initiated
To: Gurchetan Singh <gurchetansingh@chromium.org>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 12, 2020 at 5:54 PM Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
> On Wed, Feb 12, 2020 at 10:50 AM Chia-I Wu <olvaffe@gmail.com> wrote:
> >
> > On Tue, Feb 11, 2020 at 3:56 PM Gurchetan Singh
> > <gurchetansingh@chromium.org> wrote:
> > >
> > > We only want create a new virglrenderer context after the first
> > > 3D ioctl.
> > >
> > > Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> > > ---
> > >  drivers/gpu/drm/virtio/virtgpu_drv.h   | 1 +
> > >  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 5 +++++
> > >  drivers/gpu/drm/virtio/virtgpu_kms.c   | 2 ++
> > >  3 files changed, 8 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> > > index edaa7b8224a8..93ce69c0d9be 100644
> > > --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> > > +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> > > @@ -209,6 +209,7 @@ struct virtio_gpu_device {
> > >
> > >  struct virtio_gpu_fpriv {
> > >         uint32_t ctx_id;
> > > +       atomic_t context_initiated;
> > >  };
> > >  /* virtio_ioctl.c */
> > > diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > > index f1afabaa3a08..858ee153fb18 100644
> > > --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > > +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > > @@ -44,9 +44,14 @@ void virtio_gpu_create_context(struct drm_device *dev,
> > >         if (!vgdev->has_virgl_3d)
> > >                 return;
> > >
> > > +       if (atomic_read(&vfpriv->context_initiated))
> > > +               return;
> > > +
> > >         get_task_comm(dbgname, current);
> > >         virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
> > >                                       strlen(dbgname), dbgname);
> > > +
> > > +       atomic_inc(&vfpriv->context_initiated);
> > >  }
> > This needs to be protected with a lock.
>
> What do you think about atomic_add_unless(&vfpriv->context_initiated, 1, 1)?
Does that prevent virtio_gpu_cmd_context_create from being called more
than once when two threads call this function at the same time?


>
> > ctx_id can probably be
> > generated here as well.
>
> If we generate the context id in virtio_gpu_create_context, we'll have
> to add error checking in all of the ioctl call-sites (since ida_alloc
> may fail).
>
> int virtio_gpu_create_context(..)
> ret = virtio_gpu_create_context(dev, file);
> if (ret)
>     return -EINVAL
>
> vs.
>
> void virtio_gpu_create_context(..)
> virtio_gpu_create_context(..)
>
> Any strong opinions here?
Yeah, the current way should be better... unless we decide to make
virtio_gpu_cmd_context_create synchronous and check for errors.

>
> >
> > >
> > >  static int virtio_gpu_map_ioctl(struct drm_device *dev, void *data,
> > > diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> > > index e1e1c0821a35..64fe5fcbedfd 100644
> > > --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> > > +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> > > @@ -270,7 +270,9 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
> > >                 return id;
> > >         }
> > >
> > > +
> > >         vfpriv->ctx_id = id;
> > > +       atomic_set(&vfpriv->context_initiated, 0);
> > >         file->driver_priv = vfpriv;
> > >         virtio_gpu_create_context(dev, file);
> > >
> > > --
> > > 2.25.0.225.g125e21ebc7-goog
> > >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
