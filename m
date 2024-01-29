Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E696F841613
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 23:57:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C0F10E6D0;
	Mon, 29 Jan 2024 22:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F83E10E6D0;
 Mon, 29 Jan 2024 22:56:49 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-51109060d6aso2716001e87.2; 
 Mon, 29 Jan 2024 14:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706568947; x=1707173747; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7zLOqGjvc5zAyBHVNLXc6kpkp0iyLeGdoW01AbqVVlE=;
 b=FIE9qfjoEwWFX28Hu2xe4PHQ/PFpr78S0Hd7J8glwzSsLRykXtnuCvkioPR39gJikh
 3N8tmiueMNNIbEs/xoAyp6hFmRuIbYQXUICDnS94zrGvSaOMejtQbSMglLxIM5sZeZLL
 iX0Zxf+mRZRBz1wJjO3I22B78hJwNUXta7XPxbIghT+zT11Agr18IHXkhpGQoUfdUEF8
 WsornKJ1a5rWN8G521VG6zPcQf2/ml50x6XjCg5etjNJGgxAEa6RKWtT4NmyfS7z76Un
 PyD5Y4XvUm8iylLBycLczETFZSt8q7tlZiSl0TJIz9BAayDmzWW9WIY9ogxGGvQ8TuIm
 piWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706568947; x=1707173747;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7zLOqGjvc5zAyBHVNLXc6kpkp0iyLeGdoW01AbqVVlE=;
 b=C1tqTmdeWdsiYuxmKqd01TBxXBAoIHQLTROFFRBhRg+EoF7TRE58Y4FWLYIlpNn2Mm
 ayncuQzYF87fNeaCEy1FsNyc0QtMZ+UDWwcKNKUjIb/YaCrJSJZ4KRYxhxc3j7zmiAKu
 w7P2/N0tZE9KjkSLzxnQYz22fhS9rpYI8m5BxOVOpNx4uvT4yYGLxS0vqHaA+Y50V9uK
 Ygnkz9AKE0mxkSP9RNfy1X9sBMlQeCs9IQl/8j75cTtBz9i600u72q4GgtqZ50oRsfzV
 J2f7M+x+a0HRMwcNK9AKaWSlnAeKAnROhB91Wvwd0cn1Rxifr826387NpWoSGpOKp2cB
 KYWA==
X-Gm-Message-State: AOJu0YzM9yyGGXSeHLEY0hzYPi3soiWuE/86WC2N6Cih/BNSEcUxBSYm
 JZGyc4B/wMj+POhmqMxvTmzp2DLvp8RIlFogs908cc88GshSQlDKPFQcHRDAFoZKR9vhs4p6ywf
 +9DU6zXjlPDdl35hcH7hDNiLUP7o=
X-Google-Smtp-Source: AGHT+IEaEdMN5UVckkQ+sBbas72IcdioezGXU3mTD98Ir0V5njNzJD1Atr2bbQcUIW2EhZKNSU8ZYLPNKVan2Smh2Mk=
X-Received: by 2002:a05:6512:2f9:b0:511:19c1:8e0b with SMTP id
 m25-20020a05651202f900b0051119c18e0bmr197277lfq.54.1706568947140; Mon, 29 Jan
 2024 14:55:47 -0800 (PST)
MIME-Version: 1.0
References: <20240124025947.2110659-1-nunes.erico@gmail.com>
 <20240124025947.2110659-6-nunes.erico@gmail.com>
 <CAKGbVbsjNdnoNW2JnxCiyZg-wjU0UK+jgsG18OFaHjdkdOWRQA@mail.gmail.com>
In-Reply-To: <CAKGbVbsjNdnoNW2JnxCiyZg-wjU0UK+jgsG18OFaHjdkdOWRQA@mail.gmail.com>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Mon, 29 Jan 2024 23:55:34 +0100
Message-ID: <CAK4VdL1RYHc11_bP785FYWtT7pqJzJf44QXi2kzXK=uPGwjY2g@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] drm/lima: handle spurious timeouts due to high irq
 latency
To: Qiang Yu <yuq825@gmail.com>
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
Cc: Daniel Vetter <daniel@ffwll.ch>, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, anarsoul@gmail.com,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 24, 2024 at 1:38=E2=80=AFPM Qiang Yu <yuq825@gmail.com> wrote:
>
> On Wed, Jan 24, 2024 at 11:00=E2=80=AFAM Erico Nunes <nunes.erico@gmail.c=
om> wrote:
> >
> > There are several unexplained and unreproduced cases of rendering
> > timeouts with lima, for which one theory is high IRQ latency coming fro=
m
> > somewhere else in the system.
> > This kind of occurrence may cause applications to trigger unnecessary
> > resets of the GPU or even applications to hang if it hits an issue in
> > the recovery path.
> > Panfrost already does some special handling to account for such
> > "spurious timeouts", it makes sense to have this in lima too to reduce
> > the chance that it hit users.
> >
> > Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> > ---
> >  drivers/gpu/drm/lima/lima_sched.c | 31 ++++++++++++++++++++++++++++---
> >  1 file changed, 28 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/l=
ima_sched.c
> > index c3bf8cda8498..814428564637 100644
> > --- a/drivers/gpu/drm/lima/lima_sched.c
> > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > @@ -1,6 +1,7 @@
> >  // SPDX-License-Identifier: GPL-2.0 OR MIT
> >  /* Copyright 2017-2019 Qiang Yu <yuq825@gmail.com> */
> >
> > +#include <linux/hardirq.h>
> >  #include <linux/iosys-map.h>
> >  #include <linux/kthread.h>
> >  #include <linux/slab.h>
> > @@ -401,9 +402,35 @@ static enum drm_gpu_sched_stat lima_sched_timedout=
_job(struct drm_sched_job *job
> >         struct lima_sched_pipe *pipe =3D to_lima_pipe(job->sched);
> >         struct lima_sched_task *task =3D to_lima_task(job);
> >         struct lima_device *ldev =3D pipe->ldev;
> > +       struct lima_ip *ip =3D pipe->processor[0];
> > +       int i;
> > +
> > +       /*
> > +        * If the GPU managed to complete this jobs fence, the timeout =
is
> > +        * spurious. Bail out.
> > +        */
> > +       if (dma_fence_is_signaled(task->fence)) {
> > +               DRM_WARN("%s spurious timeout\n", lima_ip_name(ip));
> > +               return DRM_GPU_SCHED_STAT_NOMINAL;
> > +       }
> > +
> > +       /*
> > +        * Lima IRQ handler may take a long time to process an interrup=
t
> > +        * if there is another IRQ handler hogging the processing.
> > +        * In order to catch such cases and not report spurious Lima jo=
b
> > +        * timeouts, synchronize the IRQ handler and re-check the fence
> > +        * status.
> > +        */
> > +       for (i =3D 0; i < pipe->num_processor; i++)
> > +               synchronize_irq(pipe->processor[i]->irq);
> > +
> I have a question, this timeout handler will be called when GP/PP error I=
RQ.
> If we call synchronize_irq() in the IRQ handler, will we block ourselves =
here?

If I understand correctly, this handler is only called by drm_sched in
a workqueue, not by gp or pp IRQ and it also does not run in any IRQ
context.
So I think this sort of lockup can't happen here.

I ran some additional tests with both timeouts and actual error IRQs
(locally modified Mesa to produce some errored jobs) and was not able
to cause any lockup related to this.

Erico
