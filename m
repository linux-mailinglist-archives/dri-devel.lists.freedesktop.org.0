Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF56C6EA0F6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 03:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C79710E219;
	Fri, 21 Apr 2023 01:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D3610E12F;
 Fri, 21 Apr 2023 01:24:32 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6a5f765d595so1160502a34.0; 
 Thu, 20 Apr 2023 18:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682040271; x=1684632271;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1pegAtM0HuvpZOhUha/IPJ5oOgjyR24GQmR7IfIKEck=;
 b=OwYDnYOUUCr/sbMghyWbRe0dVjVYBndyUF8mKzTwD1X8Ekej02u3fptHuD3N2hCxTT
 tZUltuS+jMVDI3jX0Vhs/hp0uXvUolQTsOpTqCFhOAaEfCg3JsUtkrD2WM0BA/wOxHgY
 oilmomsElBYEMRkzFK+QLAfG2m3ezKi8JGXCx9qvUHNrGhapGeD47uDDdM2IQcRIpuT7
 WiXaIY4EvvIOAJul87YaU5n7uO3RtQ4JEbKdxZ6o7DUOeRNp/+l4puioQFbBFyiVCGva
 omC9lABYcGA7Cbol1dg179m3sqjJlqzg4DTmGX6O68RxLUVDapZc8q5rJ/Xjn1vta01d
 O9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682040271; x=1684632271;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1pegAtM0HuvpZOhUha/IPJ5oOgjyR24GQmR7IfIKEck=;
 b=KxkJQloYqAbX5WJHS+jA2NGL8MNPPWhkiPTHi6OCn0IOyewT/Ps0BdwPDzxl7vNUz7
 kNE86CcC3Vzo+FVMIZjAhwt1P8ab9ZZLpOkKUz7hGCRfoy18Edkj50MDvMx4LlfzkRi7
 k2ieuf6wC3QXEMoCjhNZhUQBJrz699wBDRrs4yoFPPoXg4qqrNhmSM4ckmeiNGIlMj5G
 +EqwpcC4duDtO2MxutPBrkuLqyo3naXV7nOb+id89Nh6/DSZySrAjgzLK2Hw8ipCUPK/
 ShA8xBmhEc2c0HNkm1yPz0cfEId93NlVVYyd88YiGKdE5ZWhpS1HfuNmXz/muoLqp5mg
 hDMg==
X-Gm-Message-State: AAQBX9eX3cXSvyNDlcfd2m0t+cLVcikRJCr/x1dHdivm3hWpY2b6B1Qw
 jPYNGbgV7YK3pmEhP1fXMbX4OBLOQnIj1XfA6m8=
X-Google-Smtp-Source: AKy350aa/q4fT9JdXMonZaDdQpxgNyu8H2xa+jmhQj8BfuwshtZBvjGxwJoR8lcD1NZskILAe09IGTQluwoKzZC+S7A=
X-Received: by 2002:a05:6870:1fce:b0:187:9783:a20e with SMTP id
 gp14-20020a0568701fce00b001879783a20emr2394504oac.37.1682040271317; Thu, 20
 Apr 2023 18:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230417155613.4143258-1-tvrtko.ursulin@linux.intel.com>
 <20230417155613.4143258-5-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGuobv8+fU-WU9D9vffNJC5zCqrHDtkppf__ieMJDHsWnw@mail.gmail.com>
 <3c9d4aed-5c26-6a20-071c-8a3d24f3c9ce@linux.intel.com>
 <CAF6AEGvdz9Y96jBqPhbfgNXEsc_NS-nsc_nDqoX-qmJ9VPmLBA@mail.gmail.com>
 <f068707f-8f45-0354-b190-5a81700ef537@linux.intel.com>
In-Reply-To: <f068707f-8f45-0354-b190-5a81700ef537@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 20 Apr 2023 18:24:20 -0700
Message-ID: <CAF6AEGvLTOLBNeT87NJOSYbj0mfKfBSKqJ9Xh69P_=wFN+wzUw@mail.gmail.com>
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

On Thu, Apr 20, 2023 at 6:14=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 19/04/2023 15:32, Rob Clark wrote:
> > On Wed, Apr 19, 2023 at 6:16=E2=80=AFAM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >>
> >> On 18/04/2023 18:18, Rob Clark wrote:
> >>> On Mon, Apr 17, 2023 at 8:56=E2=80=AFAM Tvrtko Ursulin
> >>> <tvrtko.ursulin@linux.intel.com> wrote:
> >>>>
> >>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>>>
> >>>> For drivers who only wish to show one memory region called 'system,
> >>>> and only account the GEM buffer object handles under it.
> >>>>
> >>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>>> ---
> >>>>    drivers/gpu/drm/drm_file.c | 45 +++++++++++++++++++++++++++++++++=
+++++
> >>>>    include/drm/drm_file.h     |  6 +++++
> >>>>    2 files changed, 51 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> >>>> index e202f79e816d..1e70669dddf7 100644
> >>>> --- a/drivers/gpu/drm/drm_file.c
> >>>> +++ b/drivers/gpu/drm/drm_file.c
> >>>> @@ -872,6 +872,51 @@ void drm_send_event(struct drm_device *dev, str=
uct drm_pending_event *e)
> >>>>    }
> >>>>    EXPORT_SYMBOL(drm_send_event);
> >>>>
> >>>> +static void
> >>>> +add_obj(struct drm_gem_object *obj, struct drm_fdinfo_memory_stat *=
stats)
> >>>> +{
> >>>> +       u64 sz =3D obj->size;
> >>>> +
> >>>> +       stats[0].size +=3D sz;
> >>>> +
> >>>> +       if (obj->handle_count > 1)
> >>>> +               stats[0].shared +=3D sz;
> >>>> +
> >>>> +       if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(tru=
e)))
> >>>> +               stats[0].active +=3D sz;
> >>>> +
> >>>> +       /* Not supported. */
> >>>> +       stats[0].resident =3D ~0ull;
> >>>> +       stats[0].purgeable =3D ~0ull;
> >>>
> >>> Hmm, this kinda makes the simple helper not very useful.  In my
> >>> version, you get something that is useful for all UMA drivers (which
> >>> all, IIRC, have some form of madv ioctl).  I was kinda imagining that
> >>> for ttm drivers, my print_memory_stats() would just become a helper
> >>> and that TTM (or "multi-region") drivers would have their own thing.
> >>
> >> Hm how? Your version also needed a driver specific vfunc:
> >
> > Sure, but there is a possibility for a driver specific vfunc ;-)
>
> Indeed, they are there in both proposals! :)
>
> > And arguably we could move madv to drm_gem_object, along with get/put
> > pages tracking.. since all the UMA drivers pretty much do the same
> > thing.  So maybe the vfunc is a temporary thing.
> >
> > Anyways, I could go back to my original version where it was a helper
> > called from the driver to print mem stats.  That way, TTM drivers
> > could do their own thing.
>
> I must have missed that. So it was the same idea as in my RFC?

similar, danvet asked for something "more core" ;-)

https://patchwork.freedesktop.org/patch/531403/?series=3D116216&rev=3D1

BR,
-R

> Regards,
>
> Tvrtko
>
> > BR,
> > -R
> >
> >> +static enum drm_gem_object_status msm_gem_status(struct drm_gem_objec=
t *obj)
> >> +{
> >> +       struct msm_gem_object *msm_obj =3D to_msm_bo(obj);
> >> +       enum drm_gem_object_status status =3D 0;
> >> +
> >> +       if (msm_obj->pages)
> >> +               status |=3D DRM_GEM_OBJECT_RESIDENT;
> >> +
> >> +       if (msm_obj->madv =3D=3D MSM_MADV_DONTNEED)
> >> +               status |=3D DRM_GEM_OBJECT_PURGEABLE;
> >> +
> >> +       return status;
> >> +}
> >>
> >> Regards,
> >>
> >> Tvrtko
> >>
> >>>
> >>> BR,
> >>> -R
> >>>
> >>>> +}
> >>>> +
> >>>> +char **
> >>>> +drm_query_fdinfo_system_region(struct drm_device *dev, unsigned int=
 *num)
> >>>> +{
> >>>> +       static char *region[] =3D {
> >>>> +               "system",
> >>>> +       };
> >>>> +
> >>>> +       *num =3D 1;
> >>>> +
> >>>> +       return region;
> >>>> +}
> >>>> +EXPORT_SYMBOL(drm_query_fdinfo_system_region);
> >>>> +
> >>>> +void
> >>>> +drm_query_fdinfo_system_memory(struct drm_file *file,
> >>>> +                              struct drm_fdinfo_memory_stat *stats)
> >>>> +{
> >>>> +       struct drm_gem_object *obj;
> >>>> +       int id;
> >>>> +
> >>>> +       spin_lock(&file->table_lock);
> >>>> +       idr_for_each_entry(&file->object_idr, obj, id)
> >>>> +               add_obj(obj, stats);
> >>>> +       spin_unlock(&file->table_lock);
> >>>> +}
> >>>> +EXPORT_SYMBOL(drm_query_fdinfo_system_memory);
> >>>> +
> >>>>    static void
> >>>>    print_stat(struct drm_printer *p, const char *stat, const char *r=
egion, u64 sz)
> >>>>    {
> >>>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> >>>> index 00d48beeac5c..dd7c6fb2c975 100644
> >>>> --- a/include/drm/drm_file.h
> >>>> +++ b/include/drm/drm_file.h
> >>>> @@ -383,6 +383,12 @@ struct drm_fdinfo_memory_stat {
> >>>>           u64 active;
> >>>>    };
> >>>>
> >>>> +char **drm_query_fdinfo_system_region(struct drm_device *dev,
> >>>> +                                     unsigned int *num);
> >>>> +void drm_query_fdinfo_system_memory(struct drm_file *file,
> >>>> +                                   struct drm_fdinfo_memory_stat *s=
tats);
> >>>> +
> >>>> +
> >>>>    /**
> >>>>     * drm_is_primary_client - is this an open file of the primary no=
de
> >>>>     * @file_priv: DRM file
> >>>> --
> >>>> 2.37.2
> >>>>
