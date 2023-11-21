Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D487F23ED
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 03:26:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2945710E266;
	Tue, 21 Nov 2023 02:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90F810E25C;
 Tue, 21 Nov 2023 02:26:30 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-53d8320f0easo7267130a12.3; 
 Mon, 20 Nov 2023 18:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700533589; x=1701138389; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FXWC307Dp9u2imlsTZmzROKAzNui6h4OdxHhVZFr+NU=;
 b=CRqhA9PIqx+1zakI6IFiab/6faXzRF8Xbu5XsgOH7f7IJ5YlZhiCyABKto0i94t0Rc
 hy6rXiHPcgL/N6w33ivovkq22y/eYqczrE4hI2fVn48/7iTx72OIuqk4TxjR1+a5mpPn
 ChkTWjmB+Xo+irJOQIc7yM1p/M79vJnsTju72noIZHev6X+BIBorYGVcnbE9zgn/zHKl
 IB6dy3vjf4SXrajS/JhIutGLQFHXouQooUvv+o0D1TJC5xZpNWltYHmy5DdaHy9NgKqm
 UMpy+vd6kDNRhqqJu2+1U3ZMTfEee1r/TgeSao2taLeigaL9sn1S5cS+pmXRjCGwqoTM
 n2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700533589; x=1701138389;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FXWC307Dp9u2imlsTZmzROKAzNui6h4OdxHhVZFr+NU=;
 b=BgzDdCyUDQWknqweXzGbiXyiEVVBysSz8hJcRlPiScq++fWywqSt7UMnkAF3UsqUyT
 KeI0naFsxfdprXTWLFqs1RGqkeDgyA6dWEWxW7I4l6n6rLYjQCiX8767JTMCD0Hg3Bcd
 rMC/m8fxF67qIUpeJkdJUb2NcmnhMveUNpiUHaMatQRaEWFUvbl0B8q5uydVLg9FVVnF
 Ta3UR1J27LkE5rHDJVxJsv4t2QneESdbocCdKHtPADBiTwk9Pj98V70VIP1UPBMa9hqr
 NPHultTsAlKHuTzVP4sh+uuSXDrV3Lp42+q5DUbnkfgP34r4HcNlqHyru+MotovWpk44
 rf8Q==
X-Gm-Message-State: AOJu0Yy3cy4/CFEOs6u0o/fbXYOG1C9PpJYfUTSP+DKaV0AL00e0RxT5
 2eyZWBAQW8alJG/0MUY8xjT+dJiVZDRoObf5LV0=
X-Google-Smtp-Source: AGHT+IH56yMF3NRERY/qq1l5njWYq3/wuLxXmfWb61dIfzxkRhGLr/bIUHV8Fs6QMEgTumbbTTKDRcPmRVeVTKkOhEY=
X-Received: by 2002:a50:ba81:0:b0:53e:72be:2b31 with SMTP id
 x1-20020a50ba81000000b0053e72be2b31mr678133ede.42.1700533589077; Mon, 20 Nov
 2023 18:26:29 -0800 (PST)
MIME-Version: 1.0
References: <20231115141928.429688-1-dipamt1729@gmail.com>
 <CAA8EJprqnUGQxmj4Y=qttVuj0zJxdD9B6neHa6sPseLLETpk5A@mail.gmail.com>
 <CALHmwsoC5h7_w9OzpUS_-xM6x5WF5V-vFExLEf4y99b2eCcqGQ@mail.gmail.com>
 <CAA8EJpoyC=paF1ZuznXgJAkT1fne0RwYfqJh-cdz0WLt02i+bw@mail.gmail.com>
In-Reply-To: <CAA8EJpoyC=paF1ZuznXgJAkT1fne0RwYfqJh-cdz0WLt02i+bw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 20 Nov 2023 18:26:16 -0800
Message-ID: <CAF6AEGtdKD6-xA+AeZDXuKc+k4MnP8Ba4-12hHxt00bXLhJ7Eg@mail.gmail.com>
Subject: Re: [PATCH v2] Remove custom dumb_map_offset implementation in msm
 driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Dipam Turkar <dipamt1729@gmail.com>,
 sean@poorly.run, quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 marijn.suijten@somainline.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 15, 2023 at 11:33=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, 15 Nov 2023 at 20:46, Dipam Turkar <dipamt1729@gmail.com> wrote:
> >
> > They are not outdated, my bad. I went through the locks' code and saw t=
hat they have been updated. But they are probably not necessary here as mos=
t of the drivers do not use any form of locking in their implementations. T=
he generic implementations drm_gem_dumb_map_offset() and drm_gem_ttm_dumb_m=
ap_offset() do not have any locking mechanisms either.
>
> Excuse me, but this doesn't sound right to me. There are different
> drivers with different implementations. So either we'd need a good
> explanation of why it is not necessary, or this patch is NAKed.

Digging a bit thru history, it looks like commit 0de23977cfeb
("drm/gem: convert to new unified vma manager") made external locking
unnecessary, since the vma mgr already had it's own internal locking.

BR,
-R

> >
> > Thanks and regards
> > Dipam Turkar
> >
> > On Wed, Nov 15, 2023 at 8:37=E2=80=AFPM Dmitry Baryshkov <dmitry.barysh=
kov@linaro.org> wrote:
> >>
> >> On Wed, 15 Nov 2023 at 16:30, Dipam Turkar <dipamt1729@gmail.com> wrot=
e:
> >> >
> >> > Make msm use drm_gem_create_map_offset() instead of its custom
> >> > implementation for associating GEM object with a fake offset. Since,
> >> > we already have this generic implementation, we don't need the custo=
m
> >> > implementation and it is better to standardize the code for GEM base=
d
> >> > drivers. This also removes the outdated locking leftovers.
> >>
> >> Why are they outdated?
> >>
> >> >
> >> > Signed-off-by: Dipam Turkar <dipamt1729@gmail.com>
> >> > ---
> >> >  drivers/gpu/drm/msm/msm_drv.c |  2 +-
> >> >  drivers/gpu/drm/msm/msm_gem.c | 21 ---------------------
> >> >  drivers/gpu/drm/msm/msm_gem.h |  2 --
> >> >  3 files changed, 1 insertion(+), 24 deletions(-)
> >> >
> >> > Changes in v2:
> >> > Modify commit message to include the absence of internal locking lef=
tovers
> >> > around allocating a fake offset in msm_gem_mmap_offset() in the gene=
ric
> >> > implementation drm_gem_create_map_offset().
> >> >
> >> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm=
_drv.c
> >> > index a428951ee539..86a15992c717 100644
> >> > --- a/drivers/gpu/drm/msm/msm_drv.c
> >> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> >> > @@ -1085,7 +1085,7 @@ static const struct drm_driver msm_driver =3D =
{
> >> >         .open               =3D msm_open,
> >> >         .postclose          =3D msm_postclose,
> >> >         .dumb_create        =3D msm_gem_dumb_create,
> >> > -       .dumb_map_offset    =3D msm_gem_dumb_map_offset,
> >> > +       .dumb_map_offset    =3D drm_gem_dumb_map_offset,
> >> >         .gem_prime_import_sg_table =3D msm_gem_prime_import_sg_table=
,
> >> >  #ifdef CONFIG_DEBUG_FS
> >> >         .debugfs_init       =3D msm_debugfs_init,
> >> > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm=
_gem.c
> >> > index db1e748daa75..489694ef79cb 100644
> >> > --- a/drivers/gpu/drm/msm/msm_gem.c
> >> > +++ b/drivers/gpu/drm/msm/msm_gem.c
> >> > @@ -671,27 +671,6 @@ int msm_gem_dumb_create(struct drm_file *file, =
struct drm_device *dev,
> >> >                         MSM_BO_SCANOUT | MSM_BO_WC, &args->handle, "=
dumb");
> >> >  }
> >> >
> >> > -int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_devic=
e *dev,
> >> > -               uint32_t handle, uint64_t *offset)
> >> > -{
> >> > -       struct drm_gem_object *obj;
> >> > -       int ret =3D 0;
> >> > -
> >> > -       /* GEM does all our handle to object mapping */
> >> > -       obj =3D drm_gem_object_lookup(file, handle);
> >> > -       if (obj =3D=3D NULL) {
> >> > -               ret =3D -ENOENT;
> >> > -               goto fail;
> >> > -       }
> >> > -
> >> > -       *offset =3D msm_gem_mmap_offset(obj);
> >> > -
> >> > -       drm_gem_object_put(obj);
> >> > -
> >> > -fail:
> >> > -       return ret;
> >> > -}
> >> > -
> >> >  static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
> >> >  {
> >> >         struct msm_gem_object *msm_obj =3D to_msm_bo(obj);
> >> > diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm=
_gem.h
> >> > index 8ddef5443140..dc74a0ef865d 100644
> >> > --- a/drivers/gpu/drm/msm/msm_gem.h
> >> > +++ b/drivers/gpu/drm/msm/msm_gem.h
> >> > @@ -139,8 +139,6 @@ struct page **msm_gem_pin_pages(struct drm_gem_o=
bject *obj);
> >> >  void msm_gem_unpin_pages(struct drm_gem_object *obj);
> >> >  int msm_gem_dumb_create(struct drm_file *file, struct drm_device *d=
ev,
> >> >                 struct drm_mode_create_dumb *args);
> >> > -int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_devic=
e *dev,
> >> > -               uint32_t handle, uint64_t *offset);
> >> >  void *msm_gem_get_vaddr_locked(struct drm_gem_object *obj);
> >> >  void *msm_gem_get_vaddr(struct drm_gem_object *obj);
> >> >  void *msm_gem_get_vaddr_active(struct drm_gem_object *obj);
> >> > --
> >> > 2.34.1
> >> >
> >>
> >>
> >> --
> >> With best wishes
> >> Dmitry
>
>
>
> --
> With best wishes
> Dmitry
