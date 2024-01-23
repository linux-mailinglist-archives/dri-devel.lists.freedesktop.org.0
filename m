Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71266837CDE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 02:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B94DB10F259;
	Tue, 23 Jan 2024 01:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61F310F259;
 Tue, 23 Jan 2024 01:19:15 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-55a90a0a1a1so2733785a12.0; 
 Mon, 22 Jan 2024 17:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705972694; x=1706577494; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z6lo1t0xIINgMF9rkW3F98A1LhixJMkR04sT2kjXH0U=;
 b=Ms/vmjKKpYXWIYKxwgGUiBU2cCKfsiJiFJ/p9Ny3UbNmwK4tWnjfCHynA2fvOll79s
 +xktqBwtOE95jqsGCPyNL4rlIeMnCII7Q+tiCsOwn+s/eLXJ6Yz59k5Ech5kejPvqzcn
 M1QO/dTCOMzitXU9y0DPT3CAIj5KVFBX+fT1bcAcGwV7+NH/8Ij8+PC4Ob+nc2RMhO39
 53zH/5oD/LAVhK39yGaFcGIu8xecaaPDon0mtcnFd5TvHRKT6+GIvqO9KiBG5bOCcPuM
 M+qiazcngHQPsZN60ncEHIv6Lj1MgSsFGDOZLOKgt7A43W0DhHvp8hC3QOurz3J2aRDc
 yfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705972694; x=1706577494;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z6lo1t0xIINgMF9rkW3F98A1LhixJMkR04sT2kjXH0U=;
 b=tE2i22KP+TrG5NcWaKHncykqnXZD5NF4+npecmA/ImKnxs0Af/treIrrV1S/Vo9Dyt
 7bY7zqhg0ta3PpypneA2jDbbw4PDlGFRpS0YG6EcOLy8NhvrEVZsHq+qmIxcUvzODoYQ
 jrhHOWcPIeR815iXuE/scwgp9M9wMhy6hSGfdvUI2PXqViFE647g1j/mvoJb4VR1xU1y
 fsnouCyzw9tqNc+3xmwku2MxQNr993XhQ5512E04v9iA6CboIYa9OnfMzCJlTzympzb1
 gBHuTAMFKKD5jIIxkJEkiGottziOqsUfOPDwR5aHxekbEt1AMX1HRLiSaKbhjXvrz+qQ
 jnRA==
X-Gm-Message-State: AOJu0Yxe1fgf7PJ+u4WBCNoSv/WeLI5imvh95bPjtj+fR7HiJMMF4msU
 AL6y0wcl0UAZQ4mvnOgMd+o+oxsFgwrVy+MOSdbAJMlUkZ9zmKMghHmzB+LXGDuwyh6/X6cUpNK
 6Dkzqa2UTZxM1uukXNNYw+TteTLs=
X-Google-Smtp-Source: AGHT+IEZviig2ABwI+Udm06OKNNEtIsVzvahiXfDsMin+LKRvil70+W7da5h9vtTL+44GHv7o1I4liutXvYTauIlvGw=
X-Received: by 2002:a05:6402:3552:b0:556:cda3:469c with SMTP id
 f18-20020a056402355200b00556cda3469cmr258947edd.153.1705972693986; Mon, 22
 Jan 2024 17:18:13 -0800 (PST)
MIME-Version: 1.0
References: <20240117031212.1104034-1-nunes.erico@gmail.com>
 <20240117031212.1104034-5-nunes.erico@gmail.com>
 <20240121095604.2368-1-hdanton@sina.com>
 <CAKGbVbtww65w+sr7OiccawRkGt-p3MRWaWNU=nkQTaqdyMxqVA@mail.gmail.com>
 <CAK4VdL2oRsvCMAWsMyvT+MpPz5e=7=mVtMWAbJKopLEOM0_A+w@mail.gmail.com>
In-Reply-To: <CAK4VdL2oRsvCMAWsMyvT+MpPz5e=7=mVtMWAbJKopLEOM0_A+w@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Tue, 23 Jan 2024 09:18:02 +0800
Message-ID: <CAKGbVbu18v_f4N0nGQAKmTZa5Dijy7u1GMqOrggthrXCsYzyRg@mail.gmail.com>
Subject: Re: [PATCH v1 4/6] drm/lima: handle spurious timeouts due to high irq
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
Cc: Hillf Danton <hdanton@sina.com>, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 21, 2024 at 11:11=E2=80=AFPM Erico Nunes <nunes.erico@gmail.com=
> wrote:
>
> On Sun, Jan 21, 2024 at 12:20=E2=80=AFPM Qiang Yu <yuq825@gmail.com> wrot=
e:
> >
> > On Sun, Jan 21, 2024 at 5:56=E2=80=AFPM Hillf Danton <hdanton@sina.com>=
 wrote:
> > >
> > > On Wed, 17 Jan 2024 04:12:10 +0100 Erico Nunes <nunes.erico@gmail.com=
>
> > > >
> > > > @@ -401,9 +399,33 @@ static enum drm_gpu_sched_stat lima_sched_time=
dout_job(struct drm_sched_job *job
> > > >       struct lima_sched_pipe *pipe =3D to_lima_pipe(job->sched);
> > > >       struct lima_sched_task *task =3D to_lima_task(job);
> > > >       struct lima_device *ldev =3D pipe->ldev;
> > > > +     struct lima_ip *ip =3D pipe->processor[0];
> > > > +
> > > > +     /*
> > > > +      * If the GPU managed to complete this jobs fence, the timeou=
t is
> > > > +      * spurious. Bail out.
> > > > +      */
> > > > +     if (dma_fence_is_signaled(task->done_fence)) {
> > > > +             DRM_WARN("%s spurious timeout\n", lima_ip_name(ip));
> > > > +             return DRM_GPU_SCHED_STAT_NOMINAL;
> > > > +     }
> > >
> > > Given 500ms in lima_sched_pipe_init(), no timeout is spurious by defi=
ne,
> > > and stop selling bandaid like this because you have options like loca=
ting
> > > the reasons behind timeout.
> >
> > This chang do look like to aim for 2FPS apps. Maybe 500ms is too short
> > for week mali4x0 gpus (2FPS apps appear more likely). AMD/NV GPU uses
> > 10s timeout. So increasing the timeout seems to be an equivalent and be=
tter
> > way?
>
> Indeed 500ms might be too optimistic for the sort of applications that
> users expect to run on this hardware currently. For a more similar
> reference though, other embedded drivers like v3d and panfrost do
> still set it to 500ms. Note that this patch is just exactly the same
> as exists in Panfrost today and was already discussed with some common
> arguments in the patches of this series:
> https://patchwork.freedesktop.org/series/120820/
>
> But I would agree to bump the timeout to a higher value for lima. Some
> distributions are already doing this with module parameters anyway to
> even be able to run some more demanding application stacks on a Mali
> 400.
>
> Another thing we might consider (probably in a followup patchset to
> not delay these fixes forever for the people hitting this issue) is to
> configure the Mali hardware watchdog to the value that we would like
> as a timeout. That way we would get timeout jobs going through the
> same error irq path as other hardware error jobs and might be able to
> delete(?)/simplify this software timeout code.
>
This way should be much simpler and stable.

> In the meantime for v2 of this series I'll make the change to account
> for the multiple pp irqs. So do you agree it is ok to leave
> drm_sched_stop() as it is at least for this series?
>
I'm OK with this.

> Thanks all for the reviews
>
> Erico
