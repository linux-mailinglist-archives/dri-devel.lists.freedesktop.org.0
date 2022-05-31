Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D591539392
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 17:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F69510F929;
	Tue, 31 May 2022 15:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5D510F929;
 Tue, 31 May 2022 15:06:32 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id e25so8472398wra.11;
 Tue, 31 May 2022 08:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5bCaroklbf/U4mqNPu0LNscz5aC535JX6CPL5uAxXAI=;
 b=jfqQnNZii+75fSaTHUWPJEY2XHEtJw4xd0A026Vn7sHQl4prEeA5qiYT1aRy/rWOYk
 VPy8wEkgSqw8joWPeBpN0+c+jRCrHTyfR0HNuKMkyIRthxtf9V/lfk+AQK3zbnPPt8pX
 ppbJErd58KNElC4AYuGkn8WfsEbZ67XJPhVLuGB5Poz1ojfgR7GjGh7deaQo6F+R5VI0
 NvUuWo/3zatBq7/QVSBrYKZPLt5pOM6CLpGHUjvpRhzBeGKoaRk0oTegHC4zsXUpdwPn
 jdbTd0ODnS0IuNqNj3h/ST1Q61Vn5C1COZ0utpcbfCACS+NJdJmleN3vPIFaGdPvrTbN
 sr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5bCaroklbf/U4mqNPu0LNscz5aC535JX6CPL5uAxXAI=;
 b=n2xLa+Pt3QjJwxSWVaLdrqc3A9BQisRCkt/oekp/7U1pczWiYZ61r9LsUvLFIkXUf1
 golkh6xcIiXmfWYu4tzSD9+M+V6BNiJXKWNEm770UPbeIv41FOB5RizcaBWRmbA57zqj
 47zy2Ew4dP/IoIB2yh9L6vduxGz6L3E2rYFpR0NBh4qjDLFDNqZdaAROsyT3DRVqqcyP
 ENlhsHUqfqpUDV2wpF0WtkH+6L7Yte8SIWT6OogcFWo0PmzuGT38n26/rm5mKC7pnkhy
 KWuOSHBZK9f4mYxreNhUgncYKh91UqZF3E+JvYoKq/jbcfuVpot2kNr7UBdsk93BaDdR
 tcbg==
X-Gm-Message-State: AOAM533Oi1sQ04RG8S5tg53EwyML9cd9A/ccj7qyOSN/Aid1jsulrH2A
 r8eYLuzMo1n+pFBTR7KC73nCbYKqpM2Adnwhah8=
X-Google-Smtp-Source: ABdhPJyf/C0cb2+w7ok6CDWbvJMk9c3GxpSFlN9kcBV848gupLusmpTSfW3tp2dfNRTFFAmEQbs7OI5wh5zN1Tn7VGk=
X-Received: by 2002:adf:f645:0:b0:20e:652d:2a4e with SMTP id
 x5-20020adff645000000b0020e652d2a4emr52246019wrp.344.1654009590856; Tue, 31
 May 2022 08:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220529162936.2539901-1-robdclark@gmail.com>
 <0bf230f4-c888-b9c9-f061-7450406baa4a@suse.de>
 <CAF6AEGthAfWyAvbuE4EP+u52LEKS2Fs6X=gG8qUjc7gci6oh-A@mail.gmail.com>
 <CAKMK7uG9=EcmD4hPqm4zYsDHiS9Mr=y_5tUa_R1veDxSSK-P-Q@mail.gmail.com>
 <CAF6AEGuLeLmD4m+yi5csGdb0XZbnAOfYOKx6c-wEgMGt6rj7Cw@mail.gmail.com>
 <CAKMK7uE2sywR9qpVqGqk4s71pini3iU47iBfYakz=V=xfm8DZg@mail.gmail.com>
In-Reply-To: <CAKMK7uE2sywR9qpVqGqk4s71pini3iU47iBfYakz=V=xfm8DZg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 31 May 2022 08:06:18 -0700
Message-ID: <CAF6AEGvnCmUYjAU54A=DqBVjeVq1LUqF2wOV_zr9sSDkN9WPew@mail.gmail.com>
Subject: Re: [PATCH] drm/prime: Ensure mmap offset is initialized
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 31, 2022 at 5:32 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, 30 May 2022 at 17:41, Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Mon, May 30, 2022 at 7:49 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Mon, 30 May 2022 at 15:54, Rob Clark <robdclark@gmail.com> wrote:
> > > >
> > > > On Mon, May 30, 2022 at 12:26 AM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
> > > > >
> > > > > Hi
> > > > >
> > > > > Am 29.05.22 um 18:29 schrieb Rob Clark:
> > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > >
> > > > > > If a GEM object is allocated, and then exported as a dma-buf fd=
 which is
> > > > > > mmap'd before or without the GEM buffer being directly mmap'd, =
the
> > > > > > vma_node could be unitialized.  This leads to a situation where=
 the CPU
> > > > > > mapping is not correctly torn down in drm_vma_node_unmap().
> > > > >
> > > > > Which drivers are affected by this problem?
> > > > >
> > > > > I checked several drivers and most appear to be initializing the =
offset
> > > > > during object construction, such as GEM SHMEM. [1] TTM-based driv=
ers
> > > > > also seem unaffected. [2]
> > > > >
> > > > >  From a quick grep, only etnaviv, msm and omapdrm appear to be af=
fected?
> > > > > They only seem to run drm_gem_create_mmap_offset() from their
> > > > > ioctl-handling code.
> > > > >
> > > > > If so, I'd say it's preferable to fix these drivers and put a
> > > > > drm_WARN_ONCE() into drm_gem_prime_mmap().
> > > >
> > > > That is good if fewer drivers are affected, however I disagree with
> > > > your proposal.  At least for freedreno userspace, a lot of bo's nev=
er
> > > > get mmap'd (either directly of via dmabuf), so we should not be
> > > > allocating a mmap offset unnecessarily.
> > >
> > > Does this actually matter in the grand scheme of things? We originall=
y
> > > allocated mmap offset only on demand because userspace only had 32bit
> > > loff_t support and so simply couldn't mmap anything if the offset
> > > ended up above 32bit (even if there was still va space available).
> > >
> > > But those days are long gone (about 10 years or so) and the allocatio=
n
> > > overhead for an mmap offset is tiny. So I think unless you can
> > > benchmark an impact allocating it at bo alloc seems like the simplest
> > > design overall, and hence what we should be doing. And if the vma
> > > offset allocation every gets too slow due to fragmentation we can lif=
t
> > > the hole tree from i915 into drm_mm and the job should be done. At
> > > that point we could also allocate the offset unconditionally in the
> > > gem_init function and be done with it.
> > >
> > > Iow I concur with Thomas here, unless there's hard data contrary
> > > simplicity imo trumps here.
> >
> > 32b userspace is still alive and well, at least on arm chromebooks ;-)
>
> There's lots of different 32b userspace. The old thing was about
> userspace which didn't use mmap64, but only mmap. Which could only
> mmap the lower 4GB of a file, and so if you ended up with mmap_offset
> above 4G then you'd blow up.
>
> But mmap64 is a thing since forever, and if you compile with the right
> glibc switch (loff_t is the magic thing iirc) it all works even with
> default mmap. So I really don't think you should have this problem
> anymore (except when cros is doing something really, really silly).

The other thing, not sure quite how much it matters, is the
vma_offset_manager size is smaller with 32b kernels, which is still a
thing on some devices.

But at any rate, not allocating a mmap offset when it isn't needed
still seems like an eminently reasonable thing to do.  And IMO my fix
is quite reasonable too.  But if you disagree I can workaround the
core helpers in the driver.

BR,
-R

> -Daniel
>
> >
> > BR,
> > -R
> >
> > > -Daniel
> > >
> > > >
> > > > BR,
> > > > -R
> > > >
> > > > > Best regards
> > > > > Thomas
> > > > >
> > > > > [1]
> > > > > https://elixir.bootlin.com/linux/v5.18/source/drivers/gpu/drm/drm=
_gem_shmem_helper.c#L85
> > > > > [2]
> > > > > https://elixir.bootlin.com/linux/v5.18/source/drivers/gpu/drm/ttm=
/ttm_bo.c#L1002
> > > > >
> > > > > >
> > > > > > Fixes: e5516553999f ("drm: call drm_gem_object_funcs.mmap with =
fake offset")
> > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > ---
> > > > > > Note, it's possible the issue existed in some related form prio=
r to the
> > > > > > commit tagged with Fixes.
> > > > > >
> > > > > >   drivers/gpu/drm/drm_prime.c | 5 +++++
> > > > > >   1 file changed, 5 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_=
prime.c
> > > > > > index e3f09f18110c..849eea154dfc 100644
> > > > > > --- a/drivers/gpu/drm/drm_prime.c
> > > > > > +++ b/drivers/gpu/drm/drm_prime.c
> > > > > > @@ -716,6 +716,11 @@ int drm_gem_prime_mmap(struct drm_gem_obje=
ct *obj, struct vm_area_struct *vma)
> > > > > >       struct file *fil;
> > > > > >       int ret;
> > > > > >
> > > > > > +     /* Ensure that the vma_node is initialized: */
> > > > > > +     ret =3D drm_gem_create_mmap_offset(obj);
> > > > > > +     if (ret)
> > > > > > +             return ret;
> > > > > > +
> > > > > >       /* Add the fake offset */
> > > > > >       vma->vm_pgoff +=3D drm_vma_node_start(&obj->vma_node);
> > > > > >
> > > > >
> > > > > --
> > > > > Thomas Zimmermann
> > > > > Graphics Driver Developer
> > > > > SUSE Software Solutions Germany GmbH
> > > > > Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> > > > > (HRB 36809, AG N=C3=BCrnberg)
> > > > > Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
> > >
> > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
