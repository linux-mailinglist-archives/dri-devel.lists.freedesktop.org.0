Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B784C0368
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 21:54:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A538910E4E3;
	Tue, 22 Feb 2022 20:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3B310E4E3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 20:54:46 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id s1so6808978edd.13
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 12:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SPRBbHRt1jN0bCazBjflxzkMQpBKCrhFsjWbB/Pd2ho=;
 b=d8byAmakXv8TUEk2D3GwlOKX2veEXZG3SWc2Oaanly7GJmSflwIsHiwmAW1Aa2txaX
 AKK3+3n03VecgUvTM1Mi6rNS8aDHCmfVQUJmMiUpE3pmhqDMi+B2xRts9mbJUecdnSbG
 KGIw6911dhsDhVjGLJH1evW17Ycoey+JUh5TO5i48ZRTiLmNOEyzz+TLFuAFVvZ2Enru
 kcmQF9MsPyqrsrMAJOYwyxeyvnskKlFZOzZDgvFJ3RCeQgzMJDZq/ERMFqADAO/5UoLh
 /E8cANGceNrsLPHdXEmGExgir+nUUx1gz+ICKFUCpYPEkJmMkDm7rtspo1sVW7ettc9Q
 y5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SPRBbHRt1jN0bCazBjflxzkMQpBKCrhFsjWbB/Pd2ho=;
 b=NHaSYH0CfJVaggmWGDePHN13z0n/ccIwAFRl+VyMl8AVnIRq1ftEVLHyacyk5mx7nU
 4J3+zYccuA2WQXwx9R/3H3dYXZJIBQrLJEqm0nEppWdMQgTB8s3Px+sZt1XHzePJ0bwD
 mPsQ+1J95kJj4OjwZ3I4b/Y9HL2edz5DcakGwxRGSMULQA6tUfdhBfAyoKk8ovwd7iN5
 WwnAM30ejeAw2T/YaAZV43Macs/t/D0ZK/rtDcMT9T4V1IW2W7I0Z9df1MEbdzN80MoZ
 Wz6gagZexml1mIID+ne/RKxWxh/Qlb6VB2QW9DZVHwruxIVIWrmEfPvphwCeVCoiISwn
 ExMQ==
X-Gm-Message-State: AOAM532nZnoZXBhoz8xvMzLnXomY4dELRru7CVmKVQY56HppXqcu+DRG
 NiHSb0F6+xydORhuQnBOnPmJL4oH+vnOjcPm3lw=
X-Google-Smtp-Source: ABdhPJwdHuLXrwIwpdBJAf4/39epc/M85MPWl0qEVJog5KwT3yV9aX9Lv1vppSRgkpo7O6i4fZ7LtUt34SnQcTuhQQI=
X-Received: by 2002:a05:6402:1cc1:b0:413:2b12:fc49 with SMTP id
 ds1-20020a0564021cc100b004132b12fc49mr3663984edb.118.1645563285075; Tue, 22
 Feb 2022 12:54:45 -0800 (PST)
MIME-Version: 1.0
References: <20220218155725.487785-1-robdclark@gmail.com>
 <CAPaKu7R+6g9XRzWPk-u0jKWa602z6CJVxhPqgjJPipzY=S-txA@mail.gmail.com>
 <CAF6AEGtrQ7rcK6sEbiaHa72cebGbrdS0RNS22T07XQwCM2sQ0g@mail.gmail.com>
In-Reply-To: <CAF6AEGtrQ7rcK6sEbiaHa72cebGbrdS0RNS22T07XQwCM2sQ0g@mail.gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 22 Feb 2022 12:54:34 -0800
Message-ID: <CAPaKu7TqRBQ6_v2nKCTsc4OySOSeK9_kzKK=HfALL_42qU2WnQ@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Add USE_INTERNAL blob flag
To: Rob Clark <robdclark@gmail.com>
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

On Fri, Feb 18, 2022 at 9:51 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, Feb 18, 2022 at 8:42 AM Chia-I Wu <olvaffe@gmail.com> wrote:
> >
> > On Fri, Feb 18, 2022 at 7:57 AM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > With native userspace drivers in guest, a lot of GEM objects need to be
> > > neither shared nor mappable.  And in fact making everything mappable
> > > and/or sharable results in unreasonably high fd usage in host VMM.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > > This is for a thing I'm working on, a new virtgpu context type that
> > > allows for running native userspace driver in the guest, with a
> > > thin shim in the host VMM.  In this case, the guest has a lot of
> > > GEM buffer objects which need to be neither shared nor mappable.
> > >
> > > Alternative idea is to just drop the restriction that blob_flags
> > > be non-zero.  I'm ok with either approach.
> > Dropping the restriction sounds better to me.
> >
> > What is the use case for such a resource?  Does the host need to know
> > such a resource exists?
>
> There are a bunch of use cases, some internal (like visibility stream
> buffers filled during binning pass and consumed during draw pass),
> some external (tiled and/or UBWC buffers are never accessed on the
> CPU).
For these use cases, it's true that userspace might want internal bos,
and serialize them as res_ids which the host maps to host gem_handles.
But userspace can also skip the internal bos and encode host
gem_handles directly.

But the kernel probably should not dictate what the userspace should
do by requiring non-zero blob flags.

>
> In theory, at least currently, drm/virtgpu does not need to know about
> them, but there are a lot of places in userspace that expect to have a
> gem handle.  Longer term, I think I want to extend virtgpu with
> MADVISE ioctl so we can track DONTNEED state in guest and only release
> buffers when host and/or guest is under memory pressure.  For that we
> will defn need guest side gem handles
MADVICE is a hint that userspace sets and is not based on memory
pressure.  It is the receivers of the hint who take actions when under
memory pressure.  I think it can be between the guest userspace and
the host?


>
> BR,
> -R
>
> > >
> > >  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 7 ++++++-
> > >  include/uapi/drm/virtgpu_drm.h         | 1 +
> > >  2 files changed, 7 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > > index 69f1952f3144..92e1ba6b8078 100644
> > > --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > > +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > > @@ -36,7 +36,8 @@
> > >
> > >  #define VIRTGPU_BLOB_FLAG_USE_MASK (VIRTGPU_BLOB_FLAG_USE_MAPPABLE | \
> > >                                     VIRTGPU_BLOB_FLAG_USE_SHAREABLE | \
> > > -                                   VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE)
> > > +                                   VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE | \
> > > +                                   VIRTGPU_BLOB_FLAG_USE_INTERNAL)
> > >
> > >  static int virtio_gpu_fence_event_create(struct drm_device *dev,
> > >                                          struct drm_file *file,
> > > @@ -662,6 +663,10 @@ static int verify_blob(struct virtio_gpu_device *vgdev,
> > >         params->size = rc_blob->size;
> > >         params->blob = true;
> > >         params->blob_flags = rc_blob->blob_flags;
> > > +
> > > +       /* USE_INTERNAL is local to guest kernel, don't past to host: */
> > > +       params->blob_flags &= ~VIRTGPU_BLOB_FLAG_USE_INTERNAL;
> > > +
> > >         return 0;
> > >  }
> > >
> > > diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
> > > index 0512fde5e697..62b7483e5c60 100644
> > > --- a/include/uapi/drm/virtgpu_drm.h
> > > +++ b/include/uapi/drm/virtgpu_drm.h
> > > @@ -163,6 +163,7 @@ struct drm_virtgpu_resource_create_blob {
> > >  #define VIRTGPU_BLOB_FLAG_USE_MAPPABLE     0x0001
> > >  #define VIRTGPU_BLOB_FLAG_USE_SHAREABLE    0x0002
> > >  #define VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE 0x0004
> > > +#define VIRTGPU_BLOB_FLAG_USE_INTERNAL     0x0008   /* not-mappable, not-shareable */
> > >         /* zero is invalid blob_mem */
> > >         __u32 blob_mem;
> > >         __u32 blob_flags;
> > > --
> > > 2.34.1
> > >
