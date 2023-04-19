Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3F26E7CC2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 16:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016F910E9CA;
	Wed, 19 Apr 2023 14:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 714B010E966;
 Wed, 19 Apr 2023 14:33:16 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-18482e20958so1174197fac.0; 
 Wed, 19 Apr 2023 07:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681914795; x=1684506795;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gNs831EdotUgW8kXqosYJlzejOeNWxagGfzxyck9Wxs=;
 b=QA2uecnfOJeL0BQefgLI30QO7jyZKlmqJJEI6wb8N6vOWlTzCu459CLoEK2yKoNZwQ
 jsEXrqPBRsuxaEhuHFz0if7zzrOqRRgldL1yHflDWISo/+bo0HctjVtLQAfgIGDgbyeP
 XQdbts0W7UfLYRNX0mX3vDZmVCaHHZKPmF/AOdMfjdUK9bOJE05HdtbEuYEQjK+MtNA6
 XKOJGUGrIsQcf64vDLUHHwD6AsNGepFibLxOVX3uLJzFuFLx1WJGGgO18hTh6NENgp4z
 tiuzvN/Fv4DA4MeJiJx5NvVqc5uYv0VnurCIi+9n8fZQnXd1RWxpJvDKWSQdXWR0Ud53
 Ueog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681914795; x=1684506795;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gNs831EdotUgW8kXqosYJlzejOeNWxagGfzxyck9Wxs=;
 b=LO0g0WG+AICdsj9KjLCwwFzWLrypAB10JVZukxsYPxtB28LxXNqoK/3ojqvTogagz4
 pW4eNZ8HmNd0YjltNnJznuQUQpIyYKZRXtBdUtYgeVgaxagpdG0UC1WYfLeZsftonAig
 5sCF5iFfxKjUL0tZFF9V3AEl7FxVvGTqSRMc2XXMAU3xKkjOfd304mWJ3x4bjnXBNvbN
 rNCcdkTC5EtdYftWrHSgpnwqvISS9jRFJSi/JjMMbBkk6AbFVAOvFcUZiXlC4+0f5UyU
 79Rn14SELgX3vu/G3ptpqgTUY4hBpop48qpUVBd3wxixdldUy7ofhZoSjUINnLptM1c1
 3mGA==
X-Gm-Message-State: AAQBX9fqtMmuiWwYqVuYRS2CZdrloHE+r8csbzbnVQBF3hU1tHRMOVgx
 3ca8uhcdiTbwKrMKYWLAvU3u4653u5ojNFhg88k=
X-Google-Smtp-Source: AKy350Yn6F0sA3sbNdWO5nQM2nqKZlqDLS/xFy1ugnkbTjLaikvUgZR8+bJ/Z/7siCVFh7Vnor8haqvc+SiChw9166w=
X-Received: by 2002:a05:6870:d60b:b0:184:4cef:728e with SMTP id
 a11-20020a056870d60b00b001844cef728emr3778885oaq.46.1681914795165; Wed, 19
 Apr 2023 07:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230417155613.4143258-1-tvrtko.ursulin@linux.intel.com>
 <20230417155613.4143258-5-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGuobv8+fU-WU9D9vffNJC5zCqrHDtkppf__ieMJDHsWnw@mail.gmail.com>
 <3c9d4aed-5c26-6a20-071c-8a3d24f3c9ce@linux.intel.com>
In-Reply-To: <3c9d4aed-5c26-6a20-071c-8a3d24f3c9ce@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 19 Apr 2023 07:32:32 -0700
Message-ID: <CAF6AEGvdz9Y96jBqPhbfgNXEsc_NS-nsc_nDqoX-qmJ9VPmLBA@mail.gmail.com>
Subject: Re: [RFC 4/6] drm: Add simple fdinfo memory helpers
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 6:16=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 18/04/2023 18:18, Rob Clark wrote:
> > On Mon, Apr 17, 2023 at 8:56=E2=80=AFAM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>
> >> For drivers who only wish to show one memory region called 'system,
> >> and only account the GEM buffer object handles under it.
> >>
> >> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >> ---
> >>   drivers/gpu/drm/drm_file.c | 45 ++++++++++++++++++++++++++++++++++++=
++
> >>   include/drm/drm_file.h     |  6 +++++
> >>   2 files changed, 51 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> >> index e202f79e816d..1e70669dddf7 100644
> >> --- a/drivers/gpu/drm/drm_file.c
> >> +++ b/drivers/gpu/drm/drm_file.c
> >> @@ -872,6 +872,51 @@ void drm_send_event(struct drm_device *dev, struc=
t drm_pending_event *e)
> >>   }
> >>   EXPORT_SYMBOL(drm_send_event);
> >>
> >> +static void
> >> +add_obj(struct drm_gem_object *obj, struct drm_fdinfo_memory_stat *st=
ats)
> >> +{
> >> +       u64 sz =3D obj->size;
> >> +
> >> +       stats[0].size +=3D sz;
> >> +
> >> +       if (obj->handle_count > 1)
> >> +               stats[0].shared +=3D sz;
> >> +
> >> +       if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true)=
))
> >> +               stats[0].active +=3D sz;
> >> +
> >> +       /* Not supported. */
> >> +       stats[0].resident =3D ~0ull;
> >> +       stats[0].purgeable =3D ~0ull;
> >
> > Hmm, this kinda makes the simple helper not very useful.  In my
> > version, you get something that is useful for all UMA drivers (which
> > all, IIRC, have some form of madv ioctl).  I was kinda imagining that
> > for ttm drivers, my print_memory_stats() would just become a helper
> > and that TTM (or "multi-region") drivers would have their own thing.
>
> Hm how? Your version also needed a driver specific vfunc:

Sure, but there is a possibility for a driver specific vfunc ;-)

And arguably we could move madv to drm_gem_object, along with get/put
pages tracking.. since all the UMA drivers pretty much do the same
thing.  So maybe the vfunc is a temporary thing.

Anyways, I could go back to my original version where it was a helper
called from the driver to print mem stats.  That way, TTM drivers
could do their own thing.

BR,
-R

> +static enum drm_gem_object_status msm_gem_status(struct drm_gem_object *=
obj)
> +{
> +       struct msm_gem_object *msm_obj =3D to_msm_bo(obj);
> +       enum drm_gem_object_status status =3D 0;
> +
> +       if (msm_obj->pages)
> +               status |=3D DRM_GEM_OBJECT_RESIDENT;
> +
> +       if (msm_obj->madv =3D=3D MSM_MADV_DONTNEED)
> +               status |=3D DRM_GEM_OBJECT_PURGEABLE;
> +
> +       return status;
> +}
>
> Regards,
>
> Tvrtko
>
> >
> > BR,
> > -R
> >
> >> +}
> >> +
> >> +char **
> >> +drm_query_fdinfo_system_region(struct drm_device *dev, unsigned int *=
num)
> >> +{
> >> +       static char *region[] =3D {
> >> +               "system",
> >> +       };
> >> +
> >> +       *num =3D 1;
> >> +
> >> +       return region;
> >> +}
> >> +EXPORT_SYMBOL(drm_query_fdinfo_system_region);
> >> +
> >> +void
> >> +drm_query_fdinfo_system_memory(struct drm_file *file,
> >> +                              struct drm_fdinfo_memory_stat *stats)
> >> +{
> >> +       struct drm_gem_object *obj;
> >> +       int id;
> >> +
> >> +       spin_lock(&file->table_lock);
> >> +       idr_for_each_entry(&file->object_idr, obj, id)
> >> +               add_obj(obj, stats);
> >> +       spin_unlock(&file->table_lock);
> >> +}
> >> +EXPORT_SYMBOL(drm_query_fdinfo_system_memory);
> >> +
> >>   static void
> >>   print_stat(struct drm_printer *p, const char *stat, const char *regi=
on, u64 sz)
> >>   {
> >> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> >> index 00d48beeac5c..dd7c6fb2c975 100644
> >> --- a/include/drm/drm_file.h
> >> +++ b/include/drm/drm_file.h
> >> @@ -383,6 +383,12 @@ struct drm_fdinfo_memory_stat {
> >>          u64 active;
> >>   };
> >>
> >> +char **drm_query_fdinfo_system_region(struct drm_device *dev,
> >> +                                     unsigned int *num);
> >> +void drm_query_fdinfo_system_memory(struct drm_file *file,
> >> +                                   struct drm_fdinfo_memory_stat *sta=
ts);
> >> +
> >> +
> >>   /**
> >>    * drm_is_primary_client - is this an open file of the primary node
> >>    * @file_priv: DRM file
> >> --
> >> 2.37.2
> >>
