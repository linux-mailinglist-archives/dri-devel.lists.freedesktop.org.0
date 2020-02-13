Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 178FB15B6EA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 02:54:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95566E14A;
	Thu, 13 Feb 2020 01:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5826E14A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 01:54:41 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id y6so4697399lji.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 17:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cOc0E0exyHhRFu1bIK5CHNILc1L1XJinALoe+7sJYrw=;
 b=HT/lLtI8Bupfb/v6GkoWzQhMpcZdi+joPx52bjY3v94Yu5DAOkezI87Jf1UYDUuD8R
 /3TOCHPTa0QughrgZqISGW+Wwhzvt2v5HYdYaWxbByMP5k1014NNI2rHKdcT5WKgSd8Z
 TJx5NsZBoZxkNmZ8qvibha/X+jJgEMN0tjxbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cOc0E0exyHhRFu1bIK5CHNILc1L1XJinALoe+7sJYrw=;
 b=nKmtFoLMwzyPkrAvVnsQCSxsYfosFE/Es60n1ED4RkhFuoxVQx38uchRfwNCGy/Kir
 g8mY+oiY0R/qjjyo94KvF5oMsf/NrFE25/Uhs8UrVsdmfZMNeDyWaqn3prdcSlhyH/2x
 9jf2APXzFCchtaJ/DyAdRTjLWF7IguW0HfWHA1YANV7d53n2Kk7UUHZqWpD4P6gIY9qm
 n3TQiG0y7aBevyP1+y5pSy7PzJa+82q26gWNVMzofLJ4Q9pdKLXtoQt791RNH10X9Dj8
 1OO+oSTh15+8An+X5SXOA6Kvan7ad9urbktOsXbTEgbiDddd9KWtephPWo65EiiOp8gY
 u+Cg==
X-Gm-Message-State: APjAAAWCn/8ihLSRlzy1qzQTUelrAPoU6gtefRL92HGk0nwB3RX3tpMB
 9QU+Jbd5SuGqV832QUQmpq7EGFMdjs4=
X-Google-Smtp-Source: APXvYqytCzwSRRjb5szdldNI81Fh0lrbX7H6ClNnFefyJRSohs3XzaRxsLHfXNYgs6zBxC7vSBEqdg==
X-Received: by 2002:a2e:8e84:: with SMTP id z4mr9114257ljk.207.1581558879563; 
 Wed, 12 Feb 2020 17:54:39 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174])
 by smtp.gmail.com with ESMTPSA id x18sm334283lfe.37.2020.02.12.17.54.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2020 17:54:38 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id h23so4672184ljc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 17:54:38 -0800 (PST)
X-Received: by 2002:a2e:96da:: with SMTP id d26mr9836892ljj.6.1581558878436;
 Wed, 12 Feb 2020 17:54:38 -0800 (PST)
MIME-Version: 1.0
References: <20200211235635.488-1-gurchetansingh@chromium.org>
 <20200211235635.488-4-gurchetansingh@chromium.org>
 <CAPaKu7QrK9PKaLdtmLd657-vnAPbisCr7EoYS9QyiQZSqevKQQ@mail.gmail.com>
In-Reply-To: <CAPaKu7QrK9PKaLdtmLd657-vnAPbisCr7EoYS9QyiQZSqevKQQ@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Wed, 12 Feb 2020 17:54:27 -0800
X-Gmail-Original-Message-ID: <CAAfnVBkzWJzOqg7X6cAdGM14WGHdaMCcu9XA2SVoZKD7i6MdSQ@mail.gmail.com>
Message-ID: <CAAfnVBkzWJzOqg7X6cAdGM14WGHdaMCcu9XA2SVoZKD7i6MdSQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/virtio: track whether or not a context has been
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
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 12, 2020 at 10:50 AM Chia-I Wu <olvaffe@gmail.com> wrote:
>
> On Tue, Feb 11, 2020 at 3:56 PM Gurchetan Singh
> <gurchetansingh@chromium.org> wrote:
> >
> > We only want create a new virglrenderer context after the first
> > 3D ioctl.
> >
> > Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> > ---
> >  drivers/gpu/drm/virtio/virtgpu_drv.h   | 1 +
> >  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 5 +++++
> >  drivers/gpu/drm/virtio/virtgpu_kms.c   | 2 ++
> >  3 files changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> > index edaa7b8224a8..93ce69c0d9be 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> > +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> > @@ -209,6 +209,7 @@ struct virtio_gpu_device {
> >
> >  struct virtio_gpu_fpriv {
> >         uint32_t ctx_id;
> > +       atomic_t context_initiated;
> >  };
> >  /* virtio_ioctl.c */
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > index f1afabaa3a08..858ee153fb18 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > @@ -44,9 +44,14 @@ void virtio_gpu_create_context(struct drm_device *dev,
> >         if (!vgdev->has_virgl_3d)
> >                 return;
> >
> > +       if (atomic_read(&vfpriv->context_initiated))
> > +               return;
> > +
> >         get_task_comm(dbgname, current);
> >         virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
> >                                       strlen(dbgname), dbgname);
> > +
> > +       atomic_inc(&vfpriv->context_initiated);
> >  }
> This needs to be protected with a lock.

What do you think about atomic_add_unless(&vfpriv->context_initiated, 1, 1)?

> ctx_id can probably be
> generated here as well.

If we generate the context id in virtio_gpu_create_context, we'll have
to add error checking in all of the ioctl call-sites (since ida_alloc
may fail).

int virtio_gpu_create_context(..)
ret = virtio_gpu_create_context(dev, file);
if (ret)
    return -EINVAL

vs.

void virtio_gpu_create_context(..)
virtio_gpu_create_context(..)

Any strong opinions here?

>
> >
> >  static int virtio_gpu_map_ioctl(struct drm_device *dev, void *data,
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> > index e1e1c0821a35..64fe5fcbedfd 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> > @@ -270,7 +270,9 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
> >                 return id;
> >         }
> >
> > +
> >         vfpriv->ctx_id = id;
> > +       atomic_set(&vfpriv->context_initiated, 0);
> >         file->driver_priv = vfpriv;
> >         virtio_gpu_create_context(dev, file);
> >
> > --
> > 2.25.0.225.g125e21ebc7-goog
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
