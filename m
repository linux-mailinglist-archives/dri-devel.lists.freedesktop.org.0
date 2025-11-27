Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F95C8FD89
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 19:01:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470CB10E851;
	Thu, 27 Nov 2025 18:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F58ECKSp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com
 [74.125.224.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F17A910E851
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 18:01:48 +0000 (UTC)
Received: by mail-yx1-f54.google.com with SMTP id
 956f58d0204a3-640c857ce02so987492d50.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 10:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764266508; x=1764871308; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GHLSPiyG4X0EnNDBbg9KkeKJuDvWO+qpAoSxGTKzKDg=;
 b=F58ECKSpq9C9ndOWOlbA0gyO7pucZtu+ar3R+TPBa48nokWIP6ZpMeaomFX8Rr4MFd
 ZrZVd6V4+LDHo2cQX+HpBor7KohqN1tQ61W/+uUCQ8Er3CV7BFTjSSMXhWdrKTvwnECS
 Y+oYo0DCHO3N40cdAzuHRqhdPHTgGrDLKH2rRRkwbJfOsxGxlXyNp4iDrKt0JnSrCTVT
 7JFuxaXI5CO52rdH9T3yFpj4aW15aUMIej3aKSAisg/FD+EEHPQuwb6pLnwQugIQXr+F
 Tp+O3oz3vb31yPLJN5t2iQ0I/eRiYXWgZz/LgH7IsTAdTXfgyvwuGvT9NqfUVSaICkqX
 hsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764266508; x=1764871308;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GHLSPiyG4X0EnNDBbg9KkeKJuDvWO+qpAoSxGTKzKDg=;
 b=ANNv6KNglxUAV33QnyJMCEMnPkC08XZiM8IIEV5MvADASyEL8FBDEL/sBaKeRhlbmM
 psumDmROMaAgwlfO9NM3MHqO5O5yJ9X3WWvAmUti/fQuBfOmb4NaHFO3Yekl7K4XAhXy
 1bivt4JUs0RWMQZOra0q0LsPP6wz7/HlXu8bM67QjE3IHpH7QndcCQngQ6henwSygZiS
 gxKClRcWxe9ZN3aXCzvoB0ZcovNbwQ9tnf65KzsfulhVRmdAIjRrEjhWUqX0v/OQsbSC
 5yLf3FlUUPNY4Y95NgHL3oUuK9tXfMa2ATZ8utfsT8jS2afe06DqOrG53U+kh0/C1uMH
 vWZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr/1A4TDjYsQOh0yger+5XI8AaZWzRAnUe8oZ0sQ06tcr59bnNvgTA/NHfuDiG9goMl1dxkh7Hur8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEghj0ZNEi3vrPi/xTBVvRQpbDVgmo4lZOrtyY1Z1kQZqq97yC
 UCRug9Q4OqV/VdrFdQm8iSoTSUcm/gCN7gaamoYxTm+m1VRm8J5nyRag1pMxe8bQr0clXMHVdVJ
 FkEfs6OolH9gh72S0UII4wZwum1BbEHM=
X-Gm-Gg: ASbGncuH28+J/jnttk69ZXLpqHzXSZ3UYfUAOYe+a9kQ0i9Ud3xPS3ByI4aP+lvPBVH
 59SlEj325mSbOYGaczsE9AWzzb2rPw+kTibP2F5TPq0SOF3g9/PhIxvJc/AY0JaSZ7vIAuvInV7
 Lz2wiYf6VCDUFhPVCOOIuMN6yHpsJhlHRdTmqTua41w86xq4h9RniryjK+Yb82ra47xwfdpUpH7
 pTFvX45tZ0uQtGpaZRCTred/upyzwAZJnTy3mDh9su3sx0r5xQ/eF1ZjKBdgJcx13ApoyrRA5Hi
 SAqADBzcl/OmALPHXg5UVILBU6JDszHmNso=
X-Google-Smtp-Source: AGHT+IGBcHJ20gDkhUcJR6X+VGBnxqxYDBJ2cI6YC92e4m5kNIwufG45qtuRVGiF08RpRFLTZmXAIZ2ss1ULwLuIDTU=
X-Received: by 2002:a05:690e:2501:20b0:63f:a283:9ac1 with SMTP id
 956f58d0204a3-64302af0addmr15437782d50.46.1764266507844; Thu, 27 Nov 2025
 10:01:47 -0800 (PST)
MIME-Version: 1.0
References: <20251127164912.3788155-1-akash.goel@arm.com>
 <20251127175247.2d64d82e@fedora>
In-Reply-To: <20251127175247.2d64d82e@fedora>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 27 Nov 2025 10:01:36 -0800
X-Gm-Features: AWmQ_bnCPnhdMl6YrHKPC-rtb8pIWJ3BWEUvqYCRzbGoIeb5YjL7ATO5gfeZJM8
Message-ID: <CAPaKu7Sb1hCCpB=qAi4jCi_6J1huKVsgpKzPZFetKgOzAEYEog@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panthor: Prevent potential UAF in group creation
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Akash Goel <akash.goel@arm.com>, liviu.dudau@arm.com, steven.price@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
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

On Thu, Nov 27, 2025 at 9:09=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Thu, 27 Nov 2025 16:49:12 +0000
> Akash Goel <akash.goel@arm.com> wrote:
>
> > This commit prevents the possibility of a use after free issue in the
> > GROUP_CREATE ioctl function, which arose as pointer to the group is
> > accessed in that ioctl function after storing it in the Xarray.
> > A malicious userspace can second guess the handle of a group and try
> > to call GROUP_DESTROY ioctl from another thread around the same time
> > as GROUP_CREATE ioctl.
> >
> > To prevent the use after free exploit, this commit uses a mark on an
> > entry of group pool Xarray which is added just before returning from
> > the GROUP_CREATE ioctl function. The mark is checked for all ioctls
> > that specify the group handle and so userspace won't be abe to delete
> > a group that isn't marked yet.
> >
> > v2: Add R-bs and fixes tags
> >
> > Fixes: de85488138247 ("drm/panthor: Add the scheduler logical block")
> > Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>
> to please checkpacth.
>
> > Signed-off-by: Akash Goel <akash.goel@arm.com>
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>

Thanks!
> > ---
> >  drivers/gpu/drm/panthor/panthor_sched.c | 19 +++++++++++++++----
> >  1 file changed, 15 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/=
panthor/panthor_sched.c
> > index b834123a6560..a6b8024e1a3c 100644
> > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > @@ -779,6 +779,12 @@ struct panthor_job_profiling_data {
> >   */
> >  #define MAX_GROUPS_PER_POOL 128
> >
> > +/*
> > + * Mark added on an entry of group pool Xarray to identify if the grou=
p has
> > + * been fully initialized and can be accessed elsewhere in the driver =
code.
> > + */
> > +#define GROUP_REGISTERED XA_MARK_1
> > +
> >  /**
> >   * struct panthor_group_pool - Group pool
> >   *
> > @@ -3007,7 +3013,7 @@ void panthor_fdinfo_gather_group_samples(struct p=
anthor_file *pfile)
> >               return;
> >
> >       xa_lock(&gpool->xa);
> > -     xa_for_each(&gpool->xa, i, group) {
> > +     xa_for_each_marked(&gpool->xa, i, group, GROUP_REGISTERED) {
> >               guard(spinlock)(&group->fdinfo.lock);
> >               pfile->stats.cycles +=3D group->fdinfo.data.cycles;
> >               pfile->stats.time +=3D group->fdinfo.data.time;
> > @@ -3727,6 +3733,8 @@ int panthor_group_create(struct panthor_file *pfi=
le,
> >
> >       group_init_task_info(group);
> >
> > +     xa_set_mark(&gpool->xa, gid, GROUP_REGISTERED);
> > +
> >       return gid;
> >
> >  err_erase_gid:
> > @@ -3744,6 +3752,9 @@ int panthor_group_destroy(struct panthor_file *pf=
ile, u32 group_handle)
> >       struct panthor_scheduler *sched =3D ptdev->scheduler;
> >       struct panthor_group *group;
> >
> > +     if (!xa_get_mark(&gpool->xa, group_handle, GROUP_REGISTERED))
> > +             return -EINVAL;
> > +
> >       group =3D xa_erase(&gpool->xa, group_handle);
> >       if (!group)
> >               return -EINVAL;
> > @@ -3769,12 +3780,12 @@ int panthor_group_destroy(struct panthor_file *=
pfile, u32 group_handle)
> >  }
> >
> >  static struct panthor_group *group_from_handle(struct panthor_group_po=
ol *pool,
> > -                                            u32 group_handle)
> > +                                            unsigned long group_handle=
)
> >  {
> >       struct panthor_group *group;
> >
> >       xa_lock(&pool->xa);
> > -     group =3D group_get(xa_load(&pool->xa, group_handle));
> > +     group =3D group_get(xa_find(&pool->xa, &group_handle, group_handl=
e, GROUP_REGISTERED));
> >       xa_unlock(&pool->xa);
> >
> >       return group;
> > @@ -3861,7 +3872,7 @@ panthor_fdinfo_gather_group_mem_info(struct panth=
or_file *pfile,
> >               return;
> >
> >       xa_lock(&gpool->xa);
> > -     xa_for_each(&gpool->xa, i, group) {
> > +     xa_for_each_marked(&gpool->xa, i, group, GROUP_REGISTERED) {
> >               stats->resident +=3D group->fdinfo.kbo_sizes;
> >               if (group->csg_id >=3D 0)
> >                       stats->active +=3D group->fdinfo.kbo_sizes;
>
