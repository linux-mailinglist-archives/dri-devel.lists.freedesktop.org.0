Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9667F15FC91
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2020 05:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F2D6E0EE;
	Sat, 15 Feb 2020 04:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827916E0EE
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2020 04:29:35 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id h8so419523iob.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 20:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8jrPUAST5OrlAuzaZGqL8mja6GoITz5q20XCIgnRu/A=;
 b=e2n8YlSyNNL6NBxMSM2XZFrjkU2pJkXhZ75A8DNN5jClucDbLCmr1dDZvvoq9N9s/X
 VJnNgCnx8UdNACWmjzvDOIIU5mVQwqQvUXkb5+x2rWPNdOzUmEdTOwBjO/uzw8D3ZXyL
 SxZfHuMX9oERSpfofrUEDYlGUg+n4vTfMC2PDu+1Bv+9UOvr+Oq6YGQt0I8uNtqdL4Wf
 L00y4gmcPHKUhOXZBvdhv/gVC7LggUxMgPTVUxtSVJnEk302q0mPuCgwjP6//sqL/gPw
 ET974V1X96MY5X7cpWB1PDieL71Zm8wRZ010uckSETjWGO22/WWiI24d+PU2Py1A/uUW
 4nkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8jrPUAST5OrlAuzaZGqL8mja6GoITz5q20XCIgnRu/A=;
 b=PMWjENebMqDLGPKozEDOqymRuhM26D9gCXie4doOVK7TaDMozSUMqW6Xqs4yOXtpOM
 YkevUK5vcmelqR+7df0MfjJgjwcjV74bKwWTqq9c3cdDMNKtbQLF8/FlCGhZnp5Rc+KI
 Y5vsmHAWH4D7V7a6r9J5oVkc2Lqji94MFTu4tczJomZb3pl01kmrvjTRP9oQPhC+3ZAD
 eQqRyeYG3XT6cQheE/YmZn9iDXBRLGec42yEZ1K7jxfGkU9Ur0bE6SW0AW4YI0P4nRuX
 Z+il89rIRbZ/Qsi6YD7wFWS4x3ewKVbMEg6tYFQF7VuPfzGyDEA3UskHSYyGUcSp5vA+
 CYsQ==
X-Gm-Message-State: APjAAAVnM1V4XWLrJ/bvU0ekNMWNPcxGLw4Y4LywXMv+P8Ias0xGMhbz
 z0xqDd2nfIrFZ6lbb5/bHFSYHuroSJE03O9qufbHFJRs
X-Google-Smtp-Source: APXvYqyhBq1CorMiyF4WmA4UaN1rXbaQs33PIoj9ij3zb5exfZ3o5Z6D45+f/Uk1vHKoPrQFpzWo2nkAKtp1zqA3LeY=
X-Received: by 2002:a5e:9246:: with SMTP id z6mr5161214iop.232.1581740974706; 
 Fri, 14 Feb 2020 20:29:34 -0800 (PST)
MIME-Version: 1.0
References: <20200213231805.622-1-gurchetansingh@chromium.org>
 <20200213231805.622-4-gurchetansingh@chromium.org>
 <CAPaKu7QTTSWmts2embnRrfNcnHqnPrK9dGuLNpuiQx82MX0nNQ@mail.gmail.com>
 <CAAfnVB=MrO7KwYnUbVoG=TOqQMeFiZM3R2KgH=N7A5Ceq=Raaw@mail.gmail.com>
In-Reply-To: <CAAfnVB=MrO7KwYnUbVoG=TOqQMeFiZM3R2KgH=N7A5Ceq=Raaw@mail.gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 14 Feb 2020 20:29:23 -0800
Message-ID: <CAPaKu7SHrke+awMeOG_jsStcmKYX-GgoWK7iikoq4s5d0nNSZA@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/virtio: track whether or not a context has been
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
 ML dri-devel <dri-devel@lists.freedesktop.org>, jbates@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 14, 2020 at 6:29 PM Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
> On Fri, Feb 14, 2020 at 11:27 AM Chia-I Wu <olvaffe@gmail.com> wrote:
> >
> > On Thu, Feb 13, 2020 at 3:18 PM Gurchetan Singh
> > <gurchetansingh@chromium.org> wrote:
> > >
> > > Use an atomic variable to track whether a context has been
> > > initiated.
> > >
> > > v2: Fix possible race (@olv)
> > >
> > > Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> > > ---
> > >  drivers/gpu/drm/virtio/virtgpu_drv.h   | 1 +
> > >  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 3 +++
> > >  drivers/gpu/drm/virtio/virtgpu_kms.c   | 1 +
> > >  3 files changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> > > index 72c1d9b59dfe..ca505984f8ab 100644
> > > --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> > > +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> > > @@ -209,6 +209,7 @@ struct virtio_gpu_device {
> > >
> > >  struct virtio_gpu_fpriv {
> > >         uint32_t ctx_id;
> > > +       atomic_t context_initiated;
> > >  };
> > >
> > >  /* virtio_ioctl.c */
> > > diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > > index 896c3f419a6d..a98884462944 100644
> > > --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > > +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > > @@ -44,6 +44,9 @@ void virtio_gpu_create_context(struct drm_device *dev,
> > >         if (!vgdev->has_virgl_3d)
> > >                 return;
> > >
> > > +       if (!atomic_add_unless(&vfpriv->context_initiated, 1, 1))
> > > +               return;
> > > +
> > How does this work?  When thread A and B enter this function at the
> > same time, and thread B returns early, it is possible that thread B
> > queues other commands before thread A has the chance to queue
> > virtio_gpu_cmd_context_create.
>
> Good catch, I'll add a spinlock in v3.
virtio_gpu_cmd_context_create can sleep.  You will need a mutex (or
figure out another way to do the lazy initialization).

>
> >
> > >         get_task_comm(dbgname, current);
> > >         virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
> > >                                       strlen(dbgname), dbgname);
> > > diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> > > index 282558576527..25248bad3fc4 100644
> > > --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> > > +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> > > @@ -263,6 +263,7 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
> > >         }
> > >
> > >         vfpriv->ctx_id = handle + 1;
> > > +       atomic_set(&vfpriv->context_initiated, 0);
> > >         file->driver_priv = vfpriv;
> > >         virtio_gpu_create_context(dev, file);
> > >         return 0;
> > > --
> > > 2.25.0.265.gbab2e86ba0-goog
> > >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
