Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 138766DC09B
	for <lists+dri-devel@lfdr.de>; Sun,  9 Apr 2023 18:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4124610E1C5;
	Sun,  9 Apr 2023 15:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B7B10E1C3;
 Sun,  9 Apr 2023 15:59:57 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id m2so1496612oiw.0;
 Sun, 09 Apr 2023 08:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681055996;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OKSx+BThSiB9jUyMzJ/mVQaX8wNZeNkLCwm7ggA60Lo=;
 b=I8xNdWVHMLyxojtPZ7QS+y0Q1R2JpZ+SlKbyhW63/HECNN4q3aFFVyrBsT34WK2PmY
 HBx7SjD62wgjmgZJFZkMsAQEEOQLHXxrKhAiouSya3YduwrWOs11E8lB15a0JxxrR4zy
 C3RurE3rwJXewaN4A0bUyIpdrSMBgUyivBFKgw2Wp0yU3g04zgaXNyXgC7ULnXQBsg1m
 LiPKKgghnYhrrQeQXNaQy8yBT48bcskfxrNxFpD/87Tyehui3YeeU666M5x9R8y2CdTW
 XtJzjh5paWEJKLwyDeVIaHPcW60HeVtiuy6u6NlGnFyg/7l7H5tcRt+HuawSZwLwfYl1
 WFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681055996;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OKSx+BThSiB9jUyMzJ/mVQaX8wNZeNkLCwm7ggA60Lo=;
 b=neFRyzEDKSk/SpSwA6l00RKjIknS9+bKtrB2BiUvGfitOHks+iGIoGOdeRbeZMcGYE
 2RkJ1RYU72Lo9MrRrw6I6ifDNNJI+DTNKXdBF3g0+HMIlN1d0WEoOb53me+lUtmfFmpS
 /ikgoU4XOH9AvgEIJ6eClxGKDJDE9UuNRF3IlMcd15RrDaEL2vuOFDsIE92+LFSlCXBT
 IMzxT7GUv5cby1kz1rnRL0zXkuUCFt6QT2NCcdxMF4jm1BhDz/xLZysmxYiswb1gXgev
 lhbCbfZPM3tONaRWkfbYxo/g3a1iKpyKND6G6uxYkD83c9pfSab4eEduf2atq0jOakhI
 t8lQ==
X-Gm-Message-State: AAQBX9f1CAHTNSsxb1+BUQkQPvpnpgpvSCb7j+ZSoXsf6IpuU1n/7fKt
 pnbYY69u0OsP13L335M9zGaK9RW1smts6I9bq5I=
X-Google-Smtp-Source: AKy350ZaZjhvnKfo1yDx5wAVpP/ZXGLLNI1FUxzWsAm6DKPw50DEDVYlVUIM2GJ4EBeKyJ/M4yDf7ZYqzK/buWBmAs4=
X-Received: by 2002:aca:171a:0:b0:386:e7e7:d93d with SMTP id
 j26-20020aca171a000000b00386e7e7d93dmr2328119oii.5.1681055996599; Sun, 09 Apr
 2023 08:59:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230406215917.1475704-1-robdclark@gmail.com>
 <20230406215917.1475704-3-robdclark@gmail.com>
 <CACvgo50FEYhdpp3nqX-AyAvLK8hJnK2xynTtLnCb9A+GSeHCvg@mail.gmail.com>
In-Reply-To: <CACvgo50FEYhdpp3nqX-AyAvLK8hJnK2xynTtLnCb9A+GSeHCvg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 9 Apr 2023 08:59:45 -0700
Message-ID: <CAF6AEGuyu5AoCTneqZQLasTfb5YEotVr35hSBvYhRTMaTbYPUw@mail.gmail.com>
Subject: Re: [RFC 2/2] drm/msm: Add memory stats to fdinfo
To: Emil Velikov <emil.l.velikov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Christopher Healy <healych@amazon.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 8, 2023 at 5:28=E2=80=AFAM Emil Velikov <emil.l.velikov@gmail.c=
om> wrote:
>
> On Thu, 6 Apr 2023 at 22:59, Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Use the new helper to export stats about memory usage.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/msm_drv.c | 26 +++++++++++++++++++++++++-
> >  drivers/gpu/drm/msm/msm_gpu.c |  2 --
> >  2 files changed, 25 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_dr=
v.c
> > index 9b6f17b1261f..385776f6a531 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -1043,17 +1043,40 @@ static const struct drm_ioctl_desc msm_ioctls[]=
 =3D {
> >         DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_=
query, DRM_RENDER_ALLOW),
> >  };
> >
> > +enum drm_gem_object_status gem_status(struct drm_gem_object *obj)
> > +{
> > +       struct msm_gem_object *msm_obj =3D to_msm_bo(obj);
> > +       enum drm_gem_object_status status =3D 0;
> > +
> > +       if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true))=
)
> > +               status |=3D DRM_GEM_OBJECT_ACTIVE;
> > +
> > +       if (msm_obj->pages)
> > +               status |=3D DRM_GEM_OBJECT_RESIDENT;
> > +
> > +       if (msm_obj->madv =3D=3D MSM_MADV_DONTNEED)
> > +               status |=3D DRM_GEM_OBJECT_PURGEABLE;
> > +
> > +       return status;
> > +}
> > +
> >  static void msm_fop_show_fdinfo(struct seq_file *m, struct file *f)
> >  {
> >         struct drm_file *file =3D f->private_data;
> >         struct drm_device *dev =3D file->minor->dev;
> >         struct msm_drm_private *priv =3D dev->dev_private;
> > +       struct msm_file_private *ctx =3D file->driver_priv;
> >         struct drm_printer p =3D drm_seq_file_printer(m);
> >
> >         if (!priv->gpu)
> >                 return;
> >
> > -       msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, &p);
> > +       drm_printf(&p, "drm-driver:\t%s\n", dev->driver->name);
> > +       drm_printf(&p, "drm-client-id:\t%u\n", ctx->seqno);
> > +
> > +       msm_gpu_show_fdinfo(priv->gpu, ctx, &p);
> > +
> > +       drm_print_memory_stats(file, &p, gem_status);
> >  }
> >
> >  static const struct file_operations fops =3D {
> > @@ -1067,6 +1090,7 @@ static const struct drm_driver msm_driver =3D {
> >                                 DRIVER_RENDER |
> >                                 DRIVER_ATOMIC |
> >                                 DRIVER_MODESET |
> > +                               DRIVER_SYNCOBJ_TIMELINE |
>
> This line should probably be its own patch. AFAICT it was supported
> since ab723b7a992a19b843f798b183f53f7472f598c8, although explicitly
> kept disabled until there's userspace/turnip support.

ahh, yes, that wasn't intended to be part of this patch, just a local
thing I happened to be testing

BR,
-R

> With the above line removed, the patch is:
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>
> HTH
> Emil
