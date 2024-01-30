Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B45841819
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 02:07:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A7D112BBF;
	Tue, 30 Jan 2024 01:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7073112BB7;
 Tue, 30 Jan 2024 01:06:56 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5100cb238bcso6036339e87.3; 
 Mon, 29 Jan 2024 17:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706576755; x=1707181555; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=utPiESSNDR+AI47TC84EhLaybxmywBIeykLJp3N7b/8=;
 b=gwBd/1YUZgv/PjUSLZsmBPDFQY2uMkKLBg30pMFU92mIJDPyQRPWrs3LrKTARrjkRP
 iWXjoqzrdTJ8nksa+GIjdCPqayO4MC6+6MDq+QnS7hBC5NwGs1DgCC367NdDQI3vH4OA
 UfTEfP71xLQT0mEOh/g8DFsLgrCJxmBiWcZ5rqPfP26S0Wuuf82xzfpUtcJVPJf/GFOg
 m6HWEVX7NWy/UiClKa90RmGiMZcea3QWSLpa7Yr02dpVbgdekpc4ENKA9iaeW+6nTUA5
 qcydXJ5TPEg+bNplsgeH3duhTP5glGaaUEQTJkoc+24cMtJAa2wlQrvOS8BdBfLwwvVC
 GgZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706576755; x=1707181555;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=utPiESSNDR+AI47TC84EhLaybxmywBIeykLJp3N7b/8=;
 b=SSy+zUSzJvTE4TtkDH6BUPFFcfHkfjE7F+3gTAq4JfAFWDlYwRP75Vm+VktA2AVEOD
 k/VdaM00qcBxczBPqXsiFPau2VyTwlLEvpI3Tspv31GdHishwpgTdE/VJ1SycSAC3rvN
 C0MwyAvuKDA32zffAkojBQygxtaaDG8UXwnfI78mCR246ZSwKnIf2ir/GG6sqbDzZaEU
 C55Yqq6DL3P6eBWMWbtztfQNjcPgA3OSOouetPdzH6iYunxUtBB/rD/rcJxf4gE2r65K
 BaHwd4zMFctw+ja7B09B4XfryMTu0CjP7PmRWzuB2qCFdemP/FG2qnlnb+6ECErStear
 i2ig==
X-Gm-Message-State: AOJu0Yy4CETxaA+JopWaWvcbARnmN0kfPC+7ImOeGvnAzLpWQ47ONeTw
 RNwUmio31IsfDY+e+97Z9mni6HTW1rfuACLhwY9VCnOm2GQs29Hcwc6trSbNeTMxh7/INzAjKQb
 ap1iVdRXWWW6eTu3XeKdR5VJpAk8=
X-Google-Smtp-Source: AGHT+IEN1tQ9S5IOdm+qmGt+etuGABXHJCkeBOCMHd7t8G9FGNh0YipjMQzXu53+lJf/Yr40gE+/K1jIGrE2j7eq5IQ=
X-Received: by 2002:ac2:519a:0:b0:511:1b89:1a30 with SMTP id
 u26-20020ac2519a000000b005111b891a30mr74110lfi.63.1706576754843; Mon, 29 Jan
 2024 17:05:54 -0800 (PST)
MIME-Version: 1.0
References: <20240124025947.2110659-1-nunes.erico@gmail.com>
 <20240124025947.2110659-6-nunes.erico@gmail.com>
 <CAKGbVbsjNdnoNW2JnxCiyZg-wjU0UK+jgsG18OFaHjdkdOWRQA@mail.gmail.com>
 <CAK4VdL1RYHc11_bP785FYWtT7pqJzJf44QXi2kzXK=uPGwjY2g@mail.gmail.com>
In-Reply-To: <CAK4VdL1RYHc11_bP785FYWtT7pqJzJf44QXi2kzXK=uPGwjY2g@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Tue, 30 Jan 2024 09:05:42 +0800
Message-ID: <CAKGbVbumNMYXTCDoSbWBj3NnODPZuWi4mV1QgqoadnV-X1PVBA@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] drm/lima: handle spurious timeouts due to high irq
 latency
To: Erico Nunes <nunes.erico@gmail.com>
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

On Tue, Jan 30, 2024 at 6:55=E2=80=AFAM Erico Nunes <nunes.erico@gmail.com>=
 wrote:
>
> On Wed, Jan 24, 2024 at 1:38=E2=80=AFPM Qiang Yu <yuq825@gmail.com> wrote=
:
> >
> > On Wed, Jan 24, 2024 at 11:00=E2=80=AFAM Erico Nunes <nunes.erico@gmail=
.com> wrote:
> > >
> > > There are several unexplained and unreproduced cases of rendering
> > > timeouts with lima, for which one theory is high IRQ latency coming f=
rom
> > > somewhere else in the system.
> > > This kind of occurrence may cause applications to trigger unnecessary
> > > resets of the GPU or even applications to hang if it hits an issue in
> > > the recovery path.
> > > Panfrost already does some special handling to account for such
> > > "spurious timeouts", it makes sense to have this in lima too to reduc=
e
> > > the chance that it hit users.
> > >
> > > Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> > > ---
> > >  drivers/gpu/drm/lima/lima_sched.c | 31 ++++++++++++++++++++++++++++-=
--
> > >  1 file changed, 28 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima=
/lima_sched.c
> > > index c3bf8cda8498..814428564637 100644
> > > --- a/drivers/gpu/drm/lima/lima_sched.c
> > > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > > @@ -1,6 +1,7 @@
> > >  // SPDX-License-Identifier: GPL-2.0 OR MIT
> > >  /* Copyright 2017-2019 Qiang Yu <yuq825@gmail.com> */
> > >
> > > +#include <linux/hardirq.h>
> > >  #include <linux/iosys-map.h>
> > >  #include <linux/kthread.h>
> > >  #include <linux/slab.h>
> > > @@ -401,9 +402,35 @@ static enum drm_gpu_sched_stat lima_sched_timedo=
ut_job(struct drm_sched_job *job
> > >         struct lima_sched_pipe *pipe =3D to_lima_pipe(job->sched);
> > >         struct lima_sched_task *task =3D to_lima_task(job);
> > >         struct lima_device *ldev =3D pipe->ldev;
> > > +       struct lima_ip *ip =3D pipe->processor[0];
> > > +       int i;
> > > +
> > > +       /*
> > > +        * If the GPU managed to complete this jobs fence, the timeou=
t is
> > > +        * spurious. Bail out.
> > > +        */
> > > +       if (dma_fence_is_signaled(task->fence)) {
> > > +               DRM_WARN("%s spurious timeout\n", lima_ip_name(ip));
> > > +               return DRM_GPU_SCHED_STAT_NOMINAL;
> > > +       }
> > > +
> > > +       /*
> > > +        * Lima IRQ handler may take a long time to process an interr=
upt
> > > +        * if there is another IRQ handler hogging the processing.
> > > +        * In order to catch such cases and not report spurious Lima =
job
> > > +        * timeouts, synchronize the IRQ handler and re-check the fen=
ce
> > > +        * status.
> > > +        */
> > > +       for (i =3D 0; i < pipe->num_processor; i++)
> > > +               synchronize_irq(pipe->processor[i]->irq);
> > > +
> > I have a question, this timeout handler will be called when GP/PP error=
 IRQ.
> > If we call synchronize_irq() in the IRQ handler, will we block ourselve=
s here?
>
> If I understand correctly, this handler is only called by drm_sched in
> a workqueue, not by gp or pp IRQ and it also does not run in any IRQ
> context.
> So I think this sort of lockup can't happen here.
>
Oh, right. I miss understand the drm_sched_fault() which still call the tim=
eout
handler in work queue instead of caller thread.

> I ran some additional tests with both timeouts and actual error IRQs
> (locally modified Mesa to produce some errored jobs) and was not able
> to cause any lockup related to this.
>
> Erico
