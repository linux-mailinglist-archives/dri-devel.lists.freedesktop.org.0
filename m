Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5594AB3EFF9
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 22:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DE110E17D;
	Mon,  1 Sep 2025 20:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FHWaia8m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D4E10E17D;
 Mon,  1 Sep 2025 20:52:15 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-61e930b27bcso1840241a12.0; 
 Mon, 01 Sep 2025 13:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756759934; x=1757364734; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TBKc7ssrT6qDsEMIu1QLs0h2yIljCqUIFmZuPCjsOzc=;
 b=FHWaia8mU1vZFqKG8MTwvvMvEeyjz5o+lpuQceEbg+nAkaw0bYpy9pX7ALX+nJwcT7
 nQyk5YoWiRCu7EX6k0t56YF0JQEcMkANhBVPlm4pDYKFAhor82rHGq6s2DlAtZaNjQdQ
 /Qp4YwrB1Epy7ElPgkIjvkOP8IkWJHSYcD9Snw/L4Cbm3g727uAEFjG2JB+yzgzSlVNo
 5ImJq7Qc2DrftLn+ePoqiCadnNpcBkmWIyNSWWzscX/dDQJtrwkxNYVaY5QCUEqHb+dU
 qFz98YwCWOXRURkjEnrZZbq7DbovCdAtOs7RFNu7xLUQgJSXzDtAORYm+YytMHreVrzb
 avlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756759934; x=1757364734;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TBKc7ssrT6qDsEMIu1QLs0h2yIljCqUIFmZuPCjsOzc=;
 b=fy+HoiSDDDba5EH7R/qA4EDGlUMp/mDT678ZJh7qMGPIfpKM7SpnagrtPipXVoT8uY
 ZTKa7kitBPFgjz1Fk2zfu8rSvHzbAV8GylezfKOhqFKcIx7UgJyyw4Ckz+y5uHsN4tpW
 6ftTKqpMLuoem9ikCsF2sQcsTX+YpAV3yJ7eudfO9qVUbYxcWXc6JFiWlTiMd1pTihs2
 JFt8lVLoM29bzXFqOzZlr2DAGFWJg8lwE1HjmREYpBiPscLSroBEVCDsqHudxzoTSa3h
 3gyNh/Z1EkpVKtRAq44j3CNwm5Z0vIX3OlfzzF0Mk9tLM5zMcqxOoiSIMBdPkFZKjSZm
 fbGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGYbnTYNKqcjPKE8I4d1rqsdRoWC6ulNNoJ0fcEaLL5kejhvmnntKfeGnBdkl/9SKGiEPVb866@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHJ0XihOG+0RvsO79SF17LhV5FWkoGLS+1B6NHktO9Q83VZSe9
 XxrLV+jhibGaDsB1MBjI0UT38L8/oHZG/2YMzDn69e61253y4BPjuQLZI0mcL/UcwYZERSY881X
 TzaMxMcpwOkt/nHKZgO+GMakMOZgv0dA=
X-Gm-Gg: ASbGnctltlIGmdT/tuNQpf1kZ4Y51K0vdG2l6Ofl9+6HTXlSY53u0dgCvQsWtQ7qmRV
 IeIVEBiyBmgYOnMbkoeCs9yC6a7zrLj1BUpM5zKuNHQs4YcpCv3TN/6z8UO6NBzD1Vn6Ipgg5NW
 lJCrY5/GTtxgfA2eDr9/RrFj+EJP22naj8JSCSIz2It0jTs0GKGRU8Bp91VDSRT2xgeSL7tIV0e
 78sXOOfNpJrGU4gH6ZcEw+m+6A=
X-Google-Smtp-Source: AGHT+IFaJJlCmqusuelKzHJXBEGPy1YEonQdBfsrDl8c9WzVpDZP6PIi24icOoF6sxuW5zirVM+pPxQQ6N1/ylhTZpo=
X-Received: by 2002:a17:906:dc90:b0:b04:4ba7:4e0d with SMTP id
 a640c23a62f3a-b044ba75282mr50334166b.26.1756759933451; Mon, 01 Sep 2025
 13:52:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250829021633.1674524-1-airlied@gmail.com>
 <CAAgWFh0QgCe3MMExMkJqdRBj5NqDrJ7zq6eaQ-Yszm2xFaqRpQ@mail.gmail.com>
In-Reply-To: <CAAgWFh0QgCe3MMExMkJqdRBj5NqDrJ7zq6eaQ-Yszm2xFaqRpQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 2 Sep 2025 06:52:02 +1000
X-Gm-Features: Ac12FXzK5v2WimgnqwVsMLeuP9mcM_lQMAKL2ONmkMUhL13whujW_GCmKXbG978
Message-ID: <CAPM=9twR-NFDnZUPy4WO8dte5wii+Wq+GTJxZaLDJRifYsMYDg@mail.gmail.com>
Subject: Re: [PATCH 1/2] nouveau: fix disabling the nonstall irq due to storm
 code. (v2)
To: M Henning <mhenning@darkrefraction.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 dakr@kernel.org
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

On Tue, 2 Sept 2025 at 04:18, M Henning <mhenning@darkrefraction.com> wrote=
:
>
> On Thu, Aug 28, 2025 at 10:17=E2=80=AFPM Dave Airlie <airlied@gmail.com> =
wrote:
> >
> > From: Dave Airlie <airlied@redhat.com>
> >
> > Nouveau has code that when it gets an IRQ with no allowed handler
> > it disables it to avoid storms.
> >
> > However with nonstall interrupts, we often disable them from
> > the drm driver, but still request their emission via the push submissio=
n.
> >
> > Just don't disable nonstall irqs ever in normal operation, the
> > event handling code will filter them out, and the driver will
> > just enable/disable them at load time.
> >
> > This fixes timeouts we've been seeing on/off for a long time,
> > but they became a lot more noticable on Blackwell.
> >
> > This doesn't fix all of them, there is a subsequent fence emission
> > fix to fix the last few.
> >
> > Fixes: 3ebd64aa3c4f ("drm/nouveau/intr: support multiple trees, and exp=
licit interfaces")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Dave Airlie <airlied@redhat.com>
> >
> > ---
> > v2: add missing ga102.
> > ---
> >  .../gpu/drm/nouveau/nvkm/engine/fifo/base.c   |  2 ++
> >  .../gpu/drm/nouveau/nvkm/engine/fifo/ga100.c  | 22 ++++++++++++-------
> >  .../gpu/drm/nouveau/nvkm/engine/fifo/ga102.c  |  1 +
> >  .../gpu/drm/nouveau/nvkm/engine/fifo/priv.h   |  2 ++
> >  .../nouveau/nvkm/subdev/gsp/rm/r535/fifo.c    |  2 +-
> >  5 files changed, 20 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c b/drivers/=
gpu/drm/nouveau/nvkm/engine/fifo/base.c
> > index fdffa0391b31..6fd4e60634fb 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
> > @@ -350,6 +350,8 @@ nvkm_fifo_dtor(struct nvkm_engine *engine)
> >         nvkm_chid_unref(&fifo->chid);
> >
> >         nvkm_event_fini(&fifo->nonstall.event);
> > +       if (fifo->func->nonstall_dtor)
> > +               fifo->func->nonstall_dtor(fifo);
> >         mutex_destroy(&fifo->mutex);
> >
> >         if (fifo->func->dtor)
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c b/drivers=
/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
> > index e74493a4569e..81beae473122 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
> > @@ -517,19 +517,11 @@ ga100_fifo_nonstall_intr(struct nvkm_inth *inth)
> >  static void
> >  ga100_fifo_nonstall_block(struct nvkm_event *event, int type, int inde=
x)
> >  {
> > -       struct nvkm_fifo *fifo =3D container_of(event, typeof(*fifo), n=
onstall.event);
> > -       struct nvkm_runl *runl =3D nvkm_runl_get(fifo, index, 0);
> > -
> > -       nvkm_inth_block(&runl->nonstall.inth);
> >  }
> >
> >  static void
> >  ga100_fifo_nonstall_allow(struct nvkm_event *event, int type, int inde=
x)
> >  {
> > -       struct nvkm_fifo *fifo =3D container_of(event, typeof(*fifo), n=
onstall.event);
> > -       struct nvkm_runl *runl =3D nvkm_runl_get(fifo, index, 0);
> > -
> > -       nvkm_inth_allow(&runl->nonstall.inth);
> >  }
> >
> >  const struct nvkm_event_func
> > @@ -564,12 +556,25 @@ ga100_fifo_nonstall_ctor(struct nvkm_fifo *fifo)
> >                 if (ret)
> >                         return ret;
> >
> > +               nvkm_inth_allow(&runl->nonstall.inth);
> > +
> >                 nr =3D max(nr, runl->id + 1);
> >         }
> >
> >         return nr;
> >  }
> >
> > +void
> > +ga100_fifo_nonstall_dtor(struct nvkm_fifo *fifo)
> > +{
> > +       struct nvkm_runl *runl;
> > +       nvkm_runl_foreach(runl, fifo) {
> > +               if (runl->nonstall.vector < 0)
> > +                       continue;
> > +               nvkm_inth_block(&runl->nonstall.inth);
> > +       }
> > +}
> > +
> >  int
> >  ga100_fifo_runl_ctor(struct nvkm_fifo *fifo)
> >  {
> > @@ -599,6 +604,7 @@ ga100_fifo =3D {
> >         .runl_ctor =3D ga100_fifo_runl_ctor,
> >         .mmu_fault =3D &tu102_fifo_mmu_fault,
> >         .nonstall_ctor =3D ga100_fifo_nonstall_ctor,
> > +       .nonstall_dtor =3D ga100_fifo_nonstall_dtor,
> >         .nonstall =3D &ga100_fifo_nonstall,
> >         .runl =3D &ga100_runl,
> >         .runq =3D &ga100_runq,
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c b/drivers=
/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
> > index 755235f55b3a..18a0b1f4eab7 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
> > @@ -30,6 +30,7 @@ ga102_fifo =3D {
> >         .runl_ctor =3D ga100_fifo_runl_ctor,
> >         .mmu_fault =3D &tu102_fifo_mmu_fault,
> >         .nonstall_ctor =3D ga100_fifo_nonstall_ctor,
> > +       .nonstall_dtor =3D ga100_fifo_nonstall_dtor,
> >         .nonstall =3D &ga100_fifo_nonstall,
> >         .runl =3D &ga100_runl,
> >         .runq =3D &ga100_runq,
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h b/drivers/=
gpu/drm/nouveau/nvkm/engine/fifo/priv.h
> > index 5e81ae195329..fff1428ef267 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
> > @@ -41,6 +41,7 @@ struct nvkm_fifo_func {
> >         void (*start)(struct nvkm_fifo *, unsigned long *);
> >
> >         int (*nonstall_ctor)(struct nvkm_fifo *);
> > +       void (*nonstall_dtor)(struct nvkm_fifo *);
> >         const struct nvkm_event_func *nonstall;
> >
> >         const struct nvkm_runl_func *runl;
> > @@ -200,6 +201,7 @@ u32 tu102_chan_doorbell_handle(struct nvkm_chan *);
> >
> >  int ga100_fifo_runl_ctor(struct nvkm_fifo *);
> >  int ga100_fifo_nonstall_ctor(struct nvkm_fifo *);
> > +void ga100_fifo_nonstall_dtor(struct nvkm_fifo *);
> >  extern const struct nvkm_event_func ga100_fifo_nonstall;
> >  extern const struct nvkm_runl_func ga100_runl;
> >  extern const struct nvkm_runq_func ga100_runq;
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c b/d=
rivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
> > index 1ac5628c5140..b8be0a872e7a 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
> > @@ -601,7 +601,7 @@ r535_fifo_new(const struct nvkm_fifo_func *hw, stru=
ct nvkm_device *device,
> >         rm->chan.func =3D &r535_chan;
> >         rm->nonstall =3D &ga100_fifo_nonstall;
> >         rm->nonstall_ctor =3D ga100_fifo_nonstall_ctor;
> > -
> > +       rm->nonstall_dtor =3D ga100_fifo_nonstall_dtor;
> >         return nvkm_fifo_new_(rm, device, type, inst, pfifo);
> >  }
> >
> > --
> > 2.50.1
> >
>
> Maybe we should also do this for older GPUs? eg. perhaps we should
> also update gf100_fifo_nonstall_allow / gf100_fifo_nonstall_block ?

Those actually turn off the irq at the hardware, and therefore
shouldn't hit the allowed path check, not touching that without
someone showing it's broken.

Dave.
