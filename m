Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9C915FC55
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2020 03:29:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D366E0DD;
	Sat, 15 Feb 2020 02:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C81D6E0DD
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2020 02:29:22 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id a13so12779831ljm.10
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 18:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XtZdxSn5euEJn/aRCp6b/ogPBNRDU00+tWLI/C0o2PI=;
 b=ZggSIXfi/5JHR0u/lm99Dh3+LtX0euPM671Ei0O8F7/Mipe0OfCGwoZf5to/RcMbQ/
 kIW+t7brmH71Rsc6M7DBekVBiJxceutNu1A7gV37fDoZ/XV8MC6lv4VYsMF9rH+shn4O
 wNSO5r4ZNVNPKH1NbLChFD2gWY9wynsKvAPhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XtZdxSn5euEJn/aRCp6b/ogPBNRDU00+tWLI/C0o2PI=;
 b=iM07Jm5YcnHrtiS3vFYWmMIQUdIomWvDLGsV992yqbm/olAG3p+49kt/nvN55b/uWk
 k53VmuFYC5VhPdTUNlI56WeP940yPX+GB95FV/2S1ytv9r6Pj6dXMa+HwrZAaEpRG8u5
 rIxFNyrPtt2bRetfecTmGMmr3JOsIJaX4j5zhUR3oKGzB7qKdQ8hkyMXzMMvpMjBd8Nt
 YeSPVbQGWSjMgmklmXrdsXrwaCkJRKhIxB5No/R0S2+Rs4kzAHNqCr9mzZH5sxbUemIe
 04uzq5K/XqCpsKJxYLsyQ0VJJUi14hAhMRrE0V2/tuukRE0HzRAxMVwtpCCOeLNyF2ro
 FOKA==
X-Gm-Message-State: APjAAAXPiJZHkPfb1Ocvf+cHJs9eeW/746Vn8d38C0b7IGekFw0ADSpi
 NDSz1Q9Lhj9ixPdnfgexY6iLeeLJ4c4=
X-Google-Smtp-Source: APXvYqyNsrX1A1XwakR1cqIPUte4jMdnXnT0/m9ZK5r7qQ0SJbhSshGn3o/455gB9Yv8Nq/sPQ854Q==
X-Received: by 2002:a2e:9e4c:: with SMTP id g12mr3651264ljk.15.1581733760614; 
 Fri, 14 Feb 2020 18:29:20 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com.
 [209.85.208.176])
 by smtp.gmail.com with ESMTPSA id t29sm3616103lfg.84.2020.02.14.18.29.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2020 18:29:20 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id q8so12731295ljj.11
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 18:29:20 -0800 (PST)
X-Received: by 2002:a2e:995a:: with SMTP id r26mr3910885ljj.78.1581733759664; 
 Fri, 14 Feb 2020 18:29:19 -0800 (PST)
MIME-Version: 1.0
References: <20200213231805.622-1-gurchetansingh@chromium.org>
 <20200213231805.622-4-gurchetansingh@chromium.org>
 <CAPaKu7QTTSWmts2embnRrfNcnHqnPrK9dGuLNpuiQx82MX0nNQ@mail.gmail.com>
In-Reply-To: <CAPaKu7QTTSWmts2embnRrfNcnHqnPrK9dGuLNpuiQx82MX0nNQ@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Fri, 14 Feb 2020 18:29:08 -0800
X-Gmail-Original-Message-ID: <CAAfnVB=MrO7KwYnUbVoG=TOqQMeFiZM3R2KgH=N7A5Ceq=Raaw@mail.gmail.com>
Message-ID: <CAAfnVB=MrO7KwYnUbVoG=TOqQMeFiZM3R2KgH=N7A5Ceq=Raaw@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/virtio: track whether or not a context has been
 initiated
To: Chia-I Wu <olvaffe@gmail.com>
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

On Fri, Feb 14, 2020 at 11:27 AM Chia-I Wu <olvaffe@gmail.com> wrote:
>
> On Thu, Feb 13, 2020 at 3:18 PM Gurchetan Singh
> <gurchetansingh@chromium.org> wrote:
> >
> > Use an atomic variable to track whether a context has been
> > initiated.
> >
> > v2: Fix possible race (@olv)
> >
> > Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> > ---
> >  drivers/gpu/drm/virtio/virtgpu_drv.h   | 1 +
> >  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 3 +++
> >  drivers/gpu/drm/virtio/virtgpu_kms.c   | 1 +
> >  3 files changed, 5 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> > index 72c1d9b59dfe..ca505984f8ab 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> > +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> > @@ -209,6 +209,7 @@ struct virtio_gpu_device {
> >
> >  struct virtio_gpu_fpriv {
> >         uint32_t ctx_id;
> > +       atomic_t context_initiated;
> >  };
> >
> >  /* virtio_ioctl.c */
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > index 896c3f419a6d..a98884462944 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > @@ -44,6 +44,9 @@ void virtio_gpu_create_context(struct drm_device *dev,
> >         if (!vgdev->has_virgl_3d)
> >                 return;
> >
> > +       if (!atomic_add_unless(&vfpriv->context_initiated, 1, 1))
> > +               return;
> > +
> How does this work?  When thread A and B enter this function at the
> same time, and thread B returns early, it is possible that thread B
> queues other commands before thread A has the chance to queue
> virtio_gpu_cmd_context_create.

Good catch, I'll add a spinlock in v3.

>
> >         get_task_comm(dbgname, current);
> >         virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
> >                                       strlen(dbgname), dbgname);
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> > index 282558576527..25248bad3fc4 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> > @@ -263,6 +263,7 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
> >         }
> >
> >         vfpriv->ctx_id = handle + 1;
> > +       atomic_set(&vfpriv->context_initiated, 0);
> >         file->driver_priv = vfpriv;
> >         virtio_gpu_create_context(dev, file);
> >         return 0;
> > --
> > 2.25.0.265.gbab2e86ba0-goog
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
