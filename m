Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 773E27FAC0C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 21:52:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C5410E2F8;
	Mon, 27 Nov 2023 20:52:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3925810E2F8;
 Mon, 27 Nov 2023 20:52:45 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-54af1daf6a9so6490918a12.1; 
 Mon, 27 Nov 2023 12:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701118363; x=1701723163; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iq1f5KwVS7u1SEckZkDtY0vY5AxpaeWK/JmKNRqAs9g=;
 b=fwNQNYsRszwTGnKk+XzRGNRJYakaGyvS9aEVLd4KuazevYGa9xlYnQnDrtvjP4N+gM
 9P1Y28Vq7PsW8/hWoVkpCf/+bYwE8j65cj2Z2zybuxsrYB4PEtZRC7BcTYbS9lT8XMss
 hIwK0SvnnhShwkAfwLbSkyCWb8guvkgsB1xu4QmRO2QTNcEYL3BNMfHHKXSEXW/uaZID
 h7Hryy0fEgW5RTEr/3WYQGbseHK+eM/1LtZ0kLThWMq64jMqTDMdpag/Qzscq/k4w3RD
 LgsOiaLjYC9jnS6rhXBa/GI6n1Lnjl7JskPVVKppVW7ZvOlKHhlLf+lTizB3adfG1yIp
 GbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701118363; x=1701723163;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iq1f5KwVS7u1SEckZkDtY0vY5AxpaeWK/JmKNRqAs9g=;
 b=dAWmYs3UPyx+uaNAGhZ7eTp8fcEC5YdA9af8F7tj9lKInS4svYAkSjZR7PM8tsMxvN
 FLjPIFng27ZVvZN17VWg1COvA3crYf3sBNtEgPAiNcbSrvy7qAxbjqVrTjr7zvOjSOTN
 ceXMMkMDx1BxdRJ/uSJaNNbRG490SJ6y6prLyWzb3rPURpRfy1MALporc/NfKwCuu9rI
 a9WT0X4cmnHMHt/zAKYS2s0RKYD6ssSB7w+DTg5/QyC6x/TgruL0BFyAhywvB66Rb75q
 mgo9AqGqyncikmqpfpdRgKEBufCAsaj7migW2AiaqH2prkF484+GamcNkNhsXZEsldOB
 am4w==
X-Gm-Message-State: AOJu0Yzj+MJqtbsvf/V0uMnfmcCcigylqI9wkHiK7eEogdiAnKqSwE4V
 u487NXgM5pWKq0dDWxeuU+TfQQWEMXF+1sbmbjk=
X-Google-Smtp-Source: AGHT+IHA+7x/AjHTFDAwvhSHJMbTK0xbiS7p8hImH+hhMbLqntTZAz/X4UmP4JnJUgHE4QayqrQXgOxZGOx0FVS/fR8=
X-Received: by 2002:a05:6402:b08:b0:54b:35f1:905 with SMTP id
 bm8-20020a0564020b0800b0054b35f10905mr6518855edb.3.1701118363358; Mon, 27 Nov
 2023 12:52:43 -0800 (PST)
MIME-Version: 1.0
References: <20231115141928.429688-1-dipamt1729@gmail.com>
 <CAA8EJprqnUGQxmj4Y=qttVuj0zJxdD9B6neHa6sPseLLETpk5A@mail.gmail.com>
 <CALHmwsoC5h7_w9OzpUS_-xM6x5WF5V-vFExLEf4y99b2eCcqGQ@mail.gmail.com>
 <CAA8EJpoyC=paF1ZuznXgJAkT1fne0RwYfqJh-cdz0WLt02i+bw@mail.gmail.com>
 <CAF6AEGtdKD6-xA+AeZDXuKc+k4MnP8Ba4-12hHxt00bXLhJ7Eg@mail.gmail.com>
 <CAA8EJprj7F_K1zxnGdz1ReLNMR2CiYfRxWHUmudTZC+qjKA+kA@mail.gmail.com>
In-Reply-To: <CAA8EJprj7F_K1zxnGdz1ReLNMR2CiYfRxWHUmudTZC+qjKA+kA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 27 Nov 2023 12:52:31 -0800
Message-ID: <CAF6AEGtW5XZS+S0xQViE8RwmdsxXsSg3yz8-1=oGO5+HTzw52g@mail.gmail.com>
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

On Tue, Nov 21, 2023 at 5:14=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 21 Nov 2023 at 04:26, Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Wed, Nov 15, 2023 at 11:33=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Wed, 15 Nov 2023 at 20:46, Dipam Turkar <dipamt1729@gmail.com> wro=
te:
> > > >
> > > > They are not outdated, my bad. I went through the locks' code and s=
aw that they have been updated. But they are probably not necessary here as=
 most of the drivers do not use any form of locking in their implementation=
s. The generic implementations drm_gem_dumb_map_offset() and drm_gem_ttm_du=
mb_map_offset() do not have any locking mechanisms either.
> > >
> > > Excuse me, but this doesn't sound right to me. There are different
> > > drivers with different implementations. So either we'd need a good
> > > explanation of why it is not necessary, or this patch is NAKed.
> >
> > Digging a bit thru history, it looks like commit 0de23977cfeb
> > ("drm/gem: convert to new unified vma manager") made external locking
> > unnecessary, since the vma mgr already had it's own internal locking.
>
> So, should we drop our own locking system?

specifically for _just_ vma_offset_manager/vma_node, we could.  But I
think that only amounts to mmap_offset().

BR,
-R

> >
> > BR,
> > -R
> >
> > > >
> > > > Thanks and regards
> > > > Dipam Turkar
> > > >
> > > > On Wed, Nov 15, 2023 at 8:37=E2=80=AFPM Dmitry Baryshkov <dmitry.ba=
ryshkov@linaro.org> wrote:
> > > >>
> > > >> On Wed, 15 Nov 2023 at 16:30, Dipam Turkar <dipamt1729@gmail.com> =
wrote:
> > > >> >
> > > >> > Make msm use drm_gem_create_map_offset() instead of its custom
> > > >> > implementation for associating GEM object with a fake offset. Si=
nce,
> > > >> > we already have this generic implementation, we don't need the c=
ustom
> > > >> > implementation and it is better to standardize the code for GEM =
based
> > > >> > drivers. This also removes the outdated locking leftovers.
> > > >>
> > > >> Why are they outdated?
> > > >>
> > > >> >
> > > >> > Signed-off-by: Dipam Turkar <dipamt1729@gmail.com>
> > > >> > ---
> > > >> >  drivers/gpu/drm/msm/msm_drv.c |  2 +-
> > > >> >  drivers/gpu/drm/msm/msm_gem.c | 21 ---------------------
> > > >> >  drivers/gpu/drm/msm/msm_gem.h |  2 --
> > > >> >  3 files changed, 1 insertion(+), 24 deletions(-)
> > > >> >
> > > >> > Changes in v2:
> > > >> > Modify commit message to include the absence of internal locking=
 leftovers
> > > >> > around allocating a fake offset in msm_gem_mmap_offset() in the =
generic
> > > >> > implementation drm_gem_create_map_offset().
> > > >> >
> > > >> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm=
/msm_drv.c
> > > >> > index a428951ee539..86a15992c717 100644
> > > >> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > >> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > >> > @@ -1085,7 +1085,7 @@ static const struct drm_driver msm_driver =
=3D {
> > > >> >         .open               =3D msm_open,
> > > >> >         .postclose          =3D msm_postclose,
> > > >> >         .dumb_create        =3D msm_gem_dumb_create,
> > > >> > -       .dumb_map_offset    =3D msm_gem_dumb_map_offset,
> > > >> > +       .dumb_map_offset    =3D drm_gem_dumb_map_offset,
> > > >> >         .gem_prime_import_sg_table =3D msm_gem_prime_import_sg_t=
able,
> > > >> >  #ifdef CONFIG_DEBUG_FS
> > > >> >         .debugfs_init       =3D msm_debugfs_init,
> > > >> > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm=
/msm_gem.c
> > > >> > index db1e748daa75..489694ef79cb 100644
> > > >> > --- a/drivers/gpu/drm/msm/msm_gem.c
> > > >> > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > > >> > @@ -671,27 +671,6 @@ int msm_gem_dumb_create(struct drm_file *fi=
le, struct drm_device *dev,
> > > >> >                         MSM_BO_SCANOUT | MSM_BO_WC, &args->handl=
e, "dumb");
> > > >> >  }
> > > >> >
> > > >> > -int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_d=
evice *dev,
> > > >> > -               uint32_t handle, uint64_t *offset)
> > > >> > -{
> > > >> > -       struct drm_gem_object *obj;
> > > >> > -       int ret =3D 0;
> > > >> > -
> > > >> > -       /* GEM does all our handle to object mapping */
> > > >> > -       obj =3D drm_gem_object_lookup(file, handle);
> > > >> > -       if (obj =3D=3D NULL) {
> > > >> > -               ret =3D -ENOENT;
> > > >> > -               goto fail;
> > > >> > -       }
> > > >> > -
> > > >> > -       *offset =3D msm_gem_mmap_offset(obj);
> > > >> > -
> > > >> > -       drm_gem_object_put(obj);
> > > >> > -
> > > >> > -fail:
> > > >> > -       return ret;
> > > >> > -}
> > > >> > -
> > > >> >  static void *get_vaddr(struct drm_gem_object *obj, unsigned mad=
v)
> > > >> >  {
> > > >> >         struct msm_gem_object *msm_obj =3D to_msm_bo(obj);
> > > >> > diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm=
/msm_gem.h
> > > >> > index 8ddef5443140..dc74a0ef865d 100644
> > > >> > --- a/drivers/gpu/drm/msm/msm_gem.h
> > > >> > +++ b/drivers/gpu/drm/msm/msm_gem.h
> > > >> > @@ -139,8 +139,6 @@ struct page **msm_gem_pin_pages(struct drm_g=
em_object *obj);
> > > >> >  void msm_gem_unpin_pages(struct drm_gem_object *obj);
> > > >> >  int msm_gem_dumb_create(struct drm_file *file, struct drm_devic=
e *dev,
> > > >> >                 struct drm_mode_create_dumb *args);
> > > >> > -int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_d=
evice *dev,
> > > >> > -               uint32_t handle, uint64_t *offset);
> > > >> >  void *msm_gem_get_vaddr_locked(struct drm_gem_object *obj);
> > > >> >  void *msm_gem_get_vaddr(struct drm_gem_object *obj);
> > > >> >  void *msm_gem_get_vaddr_active(struct drm_gem_object *obj);
> > > >> > --
> > > >> > 2.34.1
> > > >> >
> > > >>
> > > >>
> > > >> --
> > > >> With best wishes
> > > >> Dmitry
> > >
> > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
>
>
> --
> With best wishes
> Dmitry
