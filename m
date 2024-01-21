Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7C983563C
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jan 2024 16:13:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D79D10E0A5;
	Sun, 21 Jan 2024 15:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED10610E00A;
 Sun, 21 Jan 2024 15:12:55 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-50e4e3323a6so3615184e87.0; 
 Sun, 21 Jan 2024 07:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705849914; x=1706454714; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d+yj1AHvkEM0T6peXvl2abVUiirRYEugftyA4GeUYHQ=;
 b=dGBTXBaLC+7b3ueStgcqwAaZvZJxyAfnzmkPP05cJMOcfXPf62tbWNlv8owdbZRc+V
 5wi8ZB6J3unsKHx2LNG3sX0oux3UO3WAhHqBf9U31+LbYXJC6b9Fyf4G48H3mPjTlE7H
 QxUMw8Cc+ZN4liczOg1rMTE4AHzvC3rCPplSNQrv1u+zR504N4olcAc4ucE3nFrq5pFK
 tmBCjdeD6p0PtB17QVOeGEB6mgK+hvKpnlCcXtH/L4C1/2LoVEkBmHdBu4wFs38vYuPE
 e/3HVzw1bgqvz2L8hxkd5JxqE6AojeE3LtbCaBOZ+aC6DMGPShXm3jDWbiJVjBhQAlmK
 eygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705849914; x=1706454714;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d+yj1AHvkEM0T6peXvl2abVUiirRYEugftyA4GeUYHQ=;
 b=tYjgAo2wMMqZdlbD+Xf7SOQ3P3scbJaX7xY3YrZbklP1ulYNZ+FY/5m6u0MbY2khhx
 3p787dN6owoNwVztulgsSMkpK88EsuxUyfn67TnUMR17fAOVnqclI7j7U32bvRfCSvd1
 xkkrTB2xgR7QOWJpher26tjoTXYLgqoYt5ZqqOW2VrySbnUBMrmzBsnKp6keoqyyuR4G
 m8V0KFBRnihmq5Jqj40X+mRCWl1J7n+tDw7oX7OPRn7uim9lJ5WD/dXDyJ+u7U2R8tr6
 5ldKwNGD6+sZMs1OTyn78qgNxiV2cvWqaYjyA3dvdvoj7lQzLXgzlgPCqZgs3i05M8HM
 TljA==
X-Gm-Message-State: AOJu0Yz6d8LLEZTOavdUQ+Mx35m2+kj4LyXvW0bvw0PJWyfV9oBzFWVM
 rsw1paRkowQMFKJiJxQJfi8EZPjZb3GKO6na6Hskd4+pNoZeIVGPFx8TyxrwHW85hyA+h6sjzeB
 StFAueoCanLuiJ9YSfKcRlptumWI=
X-Google-Smtp-Source: AGHT+IGqCUKLUrCIqeeTuQKg18uGXt+e9JAE407QXXnquhO5PN84ug2tdpfnaTg8POFQBmOLWwJRLQqMXdviUBL+V0c=
X-Received: by 2002:a05:6512:3f23:b0:50f:c24:39f8 with SMTP id
 y35-20020a0565123f2300b0050f0c2439f8mr2133641lfa.6.1705849914011; Sun, 21 Jan
 2024 07:11:54 -0800 (PST)
MIME-Version: 1.0
References: <20240117031212.1104034-1-nunes.erico@gmail.com>
 <20240117031212.1104034-5-nunes.erico@gmail.com>
 <20240121095604.2368-1-hdanton@sina.com>
 <CAKGbVbtww65w+sr7OiccawRkGt-p3MRWaWNU=nkQTaqdyMxqVA@mail.gmail.com>
In-Reply-To: <CAKGbVbtww65w+sr7OiccawRkGt-p3MRWaWNU=nkQTaqdyMxqVA@mail.gmail.com>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Sun, 21 Jan 2024 16:11:41 +0100
Message-ID: <CAK4VdL2oRsvCMAWsMyvT+MpPz5e=7=mVtMWAbJKopLEOM0_A+w@mail.gmail.com>
Subject: Re: [PATCH v1 4/6] drm/lima: handle spurious timeouts due to high irq
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
Cc: Hillf Danton <hdanton@sina.com>, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 21, 2024 at 12:20=E2=80=AFPM Qiang Yu <yuq825@gmail.com> wrote:
>
> On Sun, Jan 21, 2024 at 5:56=E2=80=AFPM Hillf Danton <hdanton@sina.com> w=
rote:
> >
> > On Wed, 17 Jan 2024 04:12:10 +0100 Erico Nunes <nunes.erico@gmail.com>
> > >
> > > @@ -401,9 +399,33 @@ static enum drm_gpu_sched_stat lima_sched_timedo=
ut_job(struct drm_sched_job *job
> > >       struct lima_sched_pipe *pipe =3D to_lima_pipe(job->sched);
> > >       struct lima_sched_task *task =3D to_lima_task(job);
> > >       struct lima_device *ldev =3D pipe->ldev;
> > > +     struct lima_ip *ip =3D pipe->processor[0];
> > > +
> > > +     /*
> > > +      * If the GPU managed to complete this jobs fence, the timeout =
is
> > > +      * spurious. Bail out.
> > > +      */
> > > +     if (dma_fence_is_signaled(task->done_fence)) {
> > > +             DRM_WARN("%s spurious timeout\n", lima_ip_name(ip));
> > > +             return DRM_GPU_SCHED_STAT_NOMINAL;
> > > +     }
> >
> > Given 500ms in lima_sched_pipe_init(), no timeout is spurious by define=
,
> > and stop selling bandaid like this because you have options like locati=
ng
> > the reasons behind timeout.
>
> This chang do look like to aim for 2FPS apps. Maybe 500ms is too short
> for week mali4x0 gpus (2FPS apps appear more likely). AMD/NV GPU uses
> 10s timeout. So increasing the timeout seems to be an equivalent and bett=
er
> way?

Indeed 500ms might be too optimistic for the sort of applications that
users expect to run on this hardware currently. For a more similar
reference though, other embedded drivers like v3d and panfrost do
still set it to 500ms. Note that this patch is just exactly the same
as exists in Panfrost today and was already discussed with some common
arguments in the patches of this series:
https://patchwork.freedesktop.org/series/120820/

But I would agree to bump the timeout to a higher value for lima. Some
distributions are already doing this with module parameters anyway to
even be able to run some more demanding application stacks on a Mali
400.

Another thing we might consider (probably in a followup patchset to
not delay these fixes forever for the people hitting this issue) is to
configure the Mali hardware watchdog to the value that we would like
as a timeout. That way we would get timeout jobs going through the
same error irq path as other hardware error jobs and might be able to
delete(?)/simplify this software timeout code.

In the meantime for v2 of this series I'll make the change to account
for the multiple pp irqs. So do you agree it is ok to leave
drm_sched_stop() as it is at least for this series?

Thanks all for the reviews

Erico
