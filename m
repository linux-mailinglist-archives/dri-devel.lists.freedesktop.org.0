Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6290BAA953D
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 16:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95B310E2AB;
	Mon,  5 May 2025 14:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nsOz2vvs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61CB410E2AB;
 Mon,  5 May 2025 14:15:44 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-85db3475637so177163639f.1; 
 Mon, 05 May 2025 07:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746454543; x=1747059343; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DmFv/eGqP8BUD+cO2vw/j1sQpK2CcTzLRBctQj23AcA=;
 b=nsOz2vvs+Ln+leIZ8aA0INmfev8Ee599s6prl8OROijmI5Lw8uuDYZF1+n9AfdxN6k
 7pHg10A6aBqObsjgKwBemKyK8ma0Bvo8WVikdEMexceaL3UsJNH1QXbZ3tGvj6avNzni
 LvgBx8ABLGpC8Gb8OnYao/L6EdTgm9dRYSE/srrdC5DFBTGxdwNgjJnILESwLMX9Oul9
 h28RuFCxX7YMH4rUOj0dJ1tot5U8MxVZ/FuiuQ9T5wNcZwtKJ1kBig59sEO2gwNPbfam
 N68B9KB2CVJjle/StFEWq+5loKqERu9n7dHFNViSZ6nLox3lSgUyE9J7Pa5+8FVQuPlz
 CY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746454543; x=1747059343;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DmFv/eGqP8BUD+cO2vw/j1sQpK2CcTzLRBctQj23AcA=;
 b=EwLN+zL2aqU0u+51LoCENDMaChspdC7uQLYBhDw2oed3zCd0VHdw4Gm86wVGSnPDAG
 WAGOHjHHDAINsx/qWJBXYNvuAfqxyZyJ6fblLIEy28ailOMNPHBPAyRwMcE6LRWVV2J8
 H37d7Owt/RcrHi2Fe1RMDTUXvd4jwNCpwFuE0tzXev/gPtf1RwfAziEcPtwv8BIHESuf
 JrNTn95aEYgXl/XBrMe5uorD0LhJMbclzYxzuZMRuglQDU0YI6BFKVSUVD+es7tXiogg
 aeRW2O7hdRKABna6OWtwkT1oqOW4t1nFtT1M/wRl68/M4lAoAK3Tg9kAWZekLL4ekmjZ
 f+/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvThdTVnPtot221yVDwAOXP9BWSwy0h8duNFgVKZmj+MaVUFHxd+kS5sPcsaSDeePwhlBqI6oC7MQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzr1kHOey+8kFFJQMOkOrAhVj/A4IkmuLpr40pSSFEbVdy9Quay
 kNXayMf4Zfo/l5jeO8nD+NG3wgGOk8uK/MYsb3Q5T9qtDm00OupxtoMTLrsy9V802GXGMpK9kQV
 Glqd/mOc8wdf37If+i82TvItH5zM=
X-Gm-Gg: ASbGncvrfDpz+08abzqEfBPf/SWNWSOFm+ii3wxjYK8febYME7skzA2qwHYvAE23Xkd
 W09cTOK9XzFb2fhp/7mr2h8DGqpr9wdW2yRUq42fWGnMbzQAt1HVL67GIbDAg58VqXwjd+9Hhqd
 z19XM926VZgSfCIpsmuK34t/HkzbLJFvyTvfw2tMtrgKfpqob92AeR
X-Google-Smtp-Source: AGHT+IFqHcvzGD+XM74JPejK+dbntF5020jCymJ7lyVu5UGKNSp+Ot20Fw3HKkPY3VchZDwZUCgEVCgtr4nWezOVrRA=
X-Received: by 2002:a05:6e02:156c:b0:3d9:43fe:8e34 with SMTP id
 e9e14a558f8ab-3d97ad891bamr126880165ab.1.1746454543182; Mon, 05 May 2025
 07:15:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250502165831.44850-1-robdclark@gmail.com>
 <20250502165831.44850-22-robdclark@gmail.com>
 <3a4297fd-4554-4727-ab05-feaddaf63ea5@amd.com>
In-Reply-To: <3a4297fd-4554-4727-ab05-feaddaf63ea5@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 5 May 2025 07:15:31 -0700
X-Gm-Features: ATxdqUEENrcJUZ0hEKbuQkuJkiW3wko3qimL5agF-KRqx4_9Igop8VKUWG8b1zM
Message-ID: <CAF6AEGtmjLM-tK9Y=gT5XupW62X_eY2fiBJCYUnKqO9A9C4xFg@mail.gmail.com>
Subject: Re: [PATCH v4 21/33] drm/msm: Add _NO_SHARE flag
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
 Rob Clark <robdclark@chromium.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Konrad Dybcio <konradybcio@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal <sumit.semwal@linaro.org>,
 open list <linux-kernel@vger.kernel.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 5, 2025 at 12:54=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/2/25 18:56, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Buffers that are not shared between contexts can share a single resv
> > object.  This way drm_gpuvm will not track them as external objects, an=
d
> > submit-time validating overhead will be O(1) for all N non-shared BOs,
> > instead of O(n).
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/msm_drv.h       |  1 +
> >  drivers/gpu/drm/msm/msm_gem.c       | 23 +++++++++++++++++++++++
> >  drivers/gpu/drm/msm/msm_gem_prime.c | 15 +++++++++++++++
> >  include/uapi/drm/msm_drm.h          | 14 ++++++++++++++
> >  4 files changed, 53 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_dr=
v.h
> > index b77fd2c531c3..b0add236cbb3 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.h
> > +++ b/drivers/gpu/drm/msm/msm_drv.h
> > @@ -246,6 +246,7 @@ int msm_gem_prime_vmap(struct drm_gem_object *obj, =
struct iosys_map *map);
> >  void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map=
 *map);
> >  struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device=
 *dev,
> >               struct dma_buf_attachment *attach, struct sg_table *sg);
> > +struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int f=
lags);
> >  int msm_gem_prime_pin(struct drm_gem_object *obj);
> >  void msm_gem_prime_unpin(struct drm_gem_object *obj);
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_ge=
m.c
> > index 3708d4579203..d0f44c981351 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.c
> > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > @@ -532,6 +532,9 @@ static int get_and_pin_iova_range_locked(struct drm=
_gem_object *obj,
> >
> >       msm_gem_assert_locked(obj);
> >
> > +     if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
> > +             return -EINVAL;
> > +
> >       vma =3D get_vma_locked(obj, vm, range_start, range_end);
> >       if (IS_ERR(vma))
> >               return PTR_ERR(vma);
> > @@ -1060,6 +1063,16 @@ static void msm_gem_free_object(struct drm_gem_o=
bject *obj)
> >               put_pages(obj);
> >       }
> >
> > +     if (msm_obj->flags & MSM_BO_NO_SHARE) {
> > +             struct drm_gem_object *r_obj =3D
> > +                     container_of(obj->resv, struct drm_gem_object, _r=
esv);
> > +
> > +             BUG_ON(obj->resv =3D=3D &obj->_resv);
> > +
> > +             /* Drop reference we hold to shared resv obj: */
> > +             drm_gem_object_put(r_obj);
> > +     }
> > +
> >       drm_gem_object_release(obj);
> >
> >       kfree(msm_obj->metadata);
> > @@ -1092,6 +1105,15 @@ int msm_gem_new_handle(struct drm_device *dev, s=
truct drm_file *file,
> >       if (name)
> >               msm_gem_object_set_name(obj, "%s", name);
> >
> > +     if (flags & MSM_BO_NO_SHARE) {
> > +             struct msm_context *ctx =3D file->driver_priv;
> > +             struct drm_gem_object *r_obj =3D drm_gpuvm_resv_obj(ctx->=
vm);
> > +
> > +             drm_gem_object_get(r_obj);
> > +
> > +             obj->resv =3D r_obj->resv;
> > +     }
> > +
> >       ret =3D drm_gem_handle_create(file, obj, handle);
> >
> >       /* drop reference from allocate - handle holds it now */
> > @@ -1124,6 +1146,7 @@ static const struct drm_gem_object_funcs msm_gem_=
object_funcs =3D {
> >       .free =3D msm_gem_free_object,
> >       .open =3D msm_gem_open,
> >       .close =3D msm_gem_close,
> > +     .export =3D msm_gem_prime_export,
> >       .pin =3D msm_gem_prime_pin,
> >       .unpin =3D msm_gem_prime_unpin,
> >       .get_sg_table =3D msm_gem_prime_get_sg_table,
> > diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/=
msm_gem_prime.c
> > index ee267490c935..1a6d8099196a 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_prime.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_prime.c
> > @@ -16,6 +16,9 @@ struct sg_table *msm_gem_prime_get_sg_table(struct dr=
m_gem_object *obj)
> >       struct msm_gem_object *msm_obj =3D to_msm_bo(obj);
> >       int npages =3D obj->size >> PAGE_SHIFT;
> >
> > +     if (msm_obj->flags & MSM_BO_NO_SHARE)
> > +             return ERR_PTR(-EINVAL);
> > +
> >       if (WARN_ON(!msm_obj->pages))  /* should have already pinned! */
> >               return ERR_PTR(-ENOMEM);
> >
> > @@ -45,6 +48,15 @@ struct drm_gem_object *msm_gem_prime_import_sg_table=
(struct drm_device *dev,
> >       return msm_gem_import(dev, attach->dmabuf, sg);
> >  }
> >
> > +
> > +struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int f=
lags)
> > +{
> > +     if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
> > +             return ERR_PTR(-EPERM);
> > +
> > +     return drm_gem_prime_export(obj, flags);
> > +}
> > +
> >  int msm_gem_prime_pin(struct drm_gem_object *obj)
> >  {
> >       struct page **pages;
> > @@ -53,6 +65,9 @@ int msm_gem_prime_pin(struct drm_gem_object *obj)
> >       if (obj->import_attach)
> >               return 0;
> >
> > +     if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
> > +             return -EINVAL;
> > +
> >       pages =3D msm_gem_pin_pages_locked(obj);
> >       if (IS_ERR(pages))
> >               ret =3D PTR_ERR(pages);
> > diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> > index b974f5a24dbc..1bccc347945c 100644
> > --- a/include/uapi/drm/msm_drm.h
> > +++ b/include/uapi/drm/msm_drm.h
> > @@ -140,6 +140,19 @@ struct drm_msm_param {
> >
> >  #define MSM_BO_SCANOUT       0x00000001     /* scanout capable */
> >  #define MSM_BO_GPU_READONLY  0x00000002
> > +/* Private buffers do not need to be explicitly listed in the SUBMIT
> > + * ioctl, unless referenced by a drm_msm_gem_submit_cmd.  Private
> > + * buffers may NOT be imported/exported or used for scanout (or any
> > + * other situation where buffers can be indefinitely pinned, but
> > + * cases other than scanout are all kernel owned BOs which are not
> > + * visible to userspace).
>
> Why is pinning for scanout a problem with those?
>
> Maybe I missed something but for other drivers that doesn't seem to be a =
problem.

I guess _technically_ it could be ok because we track pin-count
separately from dma_resv.  But the motivation for that statement was
simply that _NO_SHARE buffers share a resv obj with the VM, so they
should not be used in a different VM (in this case, the display, which
has it's own VM).

BR,
-R

> Regards,
> Christian.
>
>
> > + *
> > + * In exchange for those constraints, all private BOs associated with
> > + * a single context (drm_file) share a single dma_resv, and if there
> > + * has been no eviction since the last submit, there are no per-BO
> > + * bookeeping to do, significantly cutting the SUBMIT overhead.
> > + */
> > +#define MSM_BO_NO_SHARE      0x00000004
> >  #define MSM_BO_CACHE_MASK    0x000f0000
> >  /* cache modes */
> >  #define MSM_BO_CACHED        0x00010000
> > @@ -149,6 +162,7 @@ struct drm_msm_param {
> >
> >  #define MSM_BO_FLAGS         (MSM_BO_SCANOUT | \
> >                                MSM_BO_GPU_READONLY | \
> > +                              MSM_BO_NO_SHARE | \
> >                                MSM_BO_CACHE_MASK)
> >
> >  struct drm_msm_gem_new {
>
