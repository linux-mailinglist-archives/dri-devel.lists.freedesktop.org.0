Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A48BF4BBEAB
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 18:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACD210E390;
	Fri, 18 Feb 2022 17:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF73110E390
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 17:51:06 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 d14-20020a05600c34ce00b0037bf4d14dc7so6937922wmq.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 09:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jE4Xp1Su1BAg5kbbWTHG1FN0oJ9hDn50nQE95kDMcIE=;
 b=MxLJUtFlCRDP8c5O9j7qn9H/9WVcYL4FTz/wJsj1nBC+8Eo7be0XNzCcMG7IFYF04X
 wfSyyZYpZtYVyyzKGH155eXDDEch6z2ZoqVYBAA3SNjeyUkC4u+Z5QXEW7dRRNTB7wpO
 83YVexXJl0rD3c9EOSiO9DqUX53R0VSvbjAmJwKK2eZ0Tk+ckvUOAB97JrBBXmlVYZ8C
 09uaJvKoUc721Z66ZJI17FbTVzKUlB70k1OuxB5g3t+2i3ZP6ETNDB3AQe1n/CVWhvIH
 k+/fbSZNULkJiP0rWzkJS+3+Q338dbHCs3yc4DyQviIXL1hYhDOe5uSZagoCIhgJ4Gvt
 Kbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jE4Xp1Su1BAg5kbbWTHG1FN0oJ9hDn50nQE95kDMcIE=;
 b=Sdky9fj3pjFBLX7F4IhIT65eBavvITBtHwY1GZRw8Ng0FuhaaF7zIGc/Lr2rvAdB45
 ObXLym4OIh8HS48szjpnzBqZdlY1rMzsjjjs2ZvuM3j1rhUcPGRaQ8DDk/7Y6Q1MH9ON
 UZjizvYSXV//OwWKceCvpzEgjSJpEYJ91HoFOQuwsQ/3DwhfCBZpKasYKIL5Rgpf1GaF
 MULte4KIUWP76E7IRghxnR94M/bI+03wSs29ehAJp6kA8utQB623iITFBznkHFkXzEkS
 SQyioqLEwzkggKSLQqOe9tBA1in5CFgXjanT/BPFeJcHek6i+hdknuOHZdeTNy6qfQtM
 gvwg==
X-Gm-Message-State: AOAM533HjpBAi0VXnDqCRbpWAZlpM0lMMnz9jGWCdd9nscsGTxSDQSC7
 jEcM4ZPanyMARGJM8854YkjcERRccA7gbNSCoqM=
X-Google-Smtp-Source: ABdhPJx24uWpNh4PfLwgQ+xUx/EoND/HPGkbbfmZDRMurF3pbX/iA/d2w1P971ubT+7wz+S9OWfwFAODyX9SZVdqpFI=
X-Received: by 2002:a7b:c409:0:b0:34d:4775:4961 with SMTP id
 k9-20020a7bc409000000b0034d47754961mr11458478wmi.44.1645206665172; Fri, 18
 Feb 2022 09:51:05 -0800 (PST)
MIME-Version: 1.0
References: <20220218155725.487785-1-robdclark@gmail.com>
 <CAPaKu7R+6g9XRzWPk-u0jKWa602z6CJVxhPqgjJPipzY=S-txA@mail.gmail.com>
In-Reply-To: <CAPaKu7R+6g9XRzWPk-u0jKWa602z6CJVxhPqgjJPipzY=S-txA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 18 Feb 2022 09:51:25 -0800
Message-ID: <CAF6AEGtrQ7rcK6sEbiaHa72cebGbrdS0RNS22T07XQwCM2sQ0g@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Add USE_INTERNAL blob flag
To: Chia-I Wu <olvaffe@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 18, 2022 at 8:42 AM Chia-I Wu <olvaffe@gmail.com> wrote:
>
> On Fri, Feb 18, 2022 at 7:57 AM Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > With native userspace drivers in guest, a lot of GEM objects need to be
> > neither shared nor mappable.  And in fact making everything mappable
> > and/or sharable results in unreasonably high fd usage in host VMM.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> > This is for a thing I'm working on, a new virtgpu context type that
> > allows for running native userspace driver in the guest, with a
> > thin shim in the host VMM.  In this case, the guest has a lot of
> > GEM buffer objects which need to be neither shared nor mappable.
> >
> > Alternative idea is to just drop the restriction that blob_flags
> > be non-zero.  I'm ok with either approach.
> Dropping the restriction sounds better to me.
>
> What is the use case for such a resource?  Does the host need to know
> such a resource exists?

There are a bunch of use cases, some internal (like visibility stream
buffers filled during binning pass and consumed during draw pass),
some external (tiled and/or UBWC buffers are never accessed on the
CPU).

In theory, at least currently, drm/virtgpu does not need to know about
them, but there are a lot of places in userspace that expect to have a
gem handle.  Longer term, I think I want to extend virtgpu with
MADVISE ioctl so we can track DONTNEED state in guest and only release
buffers when host and/or guest is under memory pressure.  For that we
will defn need guest side gem handles

BR,
-R

> >
> >  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 7 ++++++-
> >  include/uapi/drm/virtgpu_drm.h         | 1 +
> >  2 files changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > index 69f1952f3144..92e1ba6b8078 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > @@ -36,7 +36,8 @@
> >
> >  #define VIRTGPU_BLOB_FLAG_USE_MASK (VIRTGPU_BLOB_FLAG_USE_MAPPABLE | \
> >                                     VIRTGPU_BLOB_FLAG_USE_SHAREABLE | \
> > -                                   VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE)
> > +                                   VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE | \
> > +                                   VIRTGPU_BLOB_FLAG_USE_INTERNAL)
> >
> >  static int virtio_gpu_fence_event_create(struct drm_device *dev,
> >                                          struct drm_file *file,
> > @@ -662,6 +663,10 @@ static int verify_blob(struct virtio_gpu_device *vgdev,
> >         params->size = rc_blob->size;
> >         params->blob = true;
> >         params->blob_flags = rc_blob->blob_flags;
> > +
> > +       /* USE_INTERNAL is local to guest kernel, don't past to host: */
> > +       params->blob_flags &= ~VIRTGPU_BLOB_FLAG_USE_INTERNAL;
> > +
> >         return 0;
> >  }
> >
> > diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
> > index 0512fde5e697..62b7483e5c60 100644
> > --- a/include/uapi/drm/virtgpu_drm.h
> > +++ b/include/uapi/drm/virtgpu_drm.h
> > @@ -163,6 +163,7 @@ struct drm_virtgpu_resource_create_blob {
> >  #define VIRTGPU_BLOB_FLAG_USE_MAPPABLE     0x0001
> >  #define VIRTGPU_BLOB_FLAG_USE_SHAREABLE    0x0002
> >  #define VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE 0x0004
> > +#define VIRTGPU_BLOB_FLAG_USE_INTERNAL     0x0008   /* not-mappable, not-shareable */
> >         /* zero is invalid blob_mem */
> >         __u32 blob_mem;
> >         __u32 blob_flags;
> > --
> > 2.34.1
> >
