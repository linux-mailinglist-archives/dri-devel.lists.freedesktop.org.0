Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 849376E7CF8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 16:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA0310E966;
	Wed, 19 Apr 2023 14:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0414F10E133;
 Wed, 19 Apr 2023 14:39:00 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id gb12so30274183qtb.6;
 Wed, 19 Apr 2023 07:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681915139; x=1684507139;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RaUiGnpaAXc/aQTFWYVVjSXV5cbbo2/U0CK4Yc/nwOw=;
 b=aeEy2rH/CtPDhxFvOv5tIoOG41qaageEfKDD56iP1q+fzaj1c+7NI8v+61Gv3ujPv1
 yCiRN8ESMy8GP1ZqyAMWZyzgL4k9dXtV/3lFCKvO9sI7WODu6j17R4zOKTWWTzsSomIa
 lkn9GPn55Vqr9nKhY41qMJipx1VZGp7/WrmrRrFz8n2cLXs6QwQJhliuIeR/262QdjGL
 XTgLTueoTgmX35wbvl8gEQAYeumc92aTqLP7O4890EyX8eoWz3pGFPir00chi05/HLnO
 9RKYIOzsc7PeT1fiSUHsp0O/xF2TixQnZfSjaZR6fvfR9Ub4xIBC+AoudExfw6Wwc3N/
 BJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681915139; x=1684507139;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RaUiGnpaAXc/aQTFWYVVjSXV5cbbo2/U0CK4Yc/nwOw=;
 b=UH9Nzs8BMpR68i+T0saCyuWYIl+eYbvDZe4aNq9r90RX4jYcu1nqa9dEjc+9asYx2l
 l8sLaFSOEdrok/BUX2fAeUof++KbnsZFT/CH7+OBRXlZYbSZa0eOgOwwvUiKEUOquak9
 DhIRK6EqA2igYFwLg//0Q0i9wJsdmaIA8KwN1aILXX3U2aA5qXr0eGADUTPRHY1Gm6Oe
 oJ+oT3rFoZGQ8C/2fYBhkfwfxNjC9Y3BzRATBWDACfd9aBSmdeLHJp+LRL0XP+GrmG30
 qCfy2aGFNoS6oJcJqa390W9N6mQ9noGYyYNRv7ZbWLKmY/p3vB6WJ2241ETfKBE5KMX/
 VeBQ==
X-Gm-Message-State: AAQBX9fAegUwcsXfpgk0b+hAm6kBp3b4FAnoqYWcVoAcW2G0Mas1AIYn
 lQfyiOeKZYKBpU4rKkeW32kGx2TsbQMr4rnbbxI=
X-Google-Smtp-Source: AKy350b+7dLLJakQB05ntSe2V28it+nPMuA8IRglVFIetDjvWcf93eyF7yEUArLvLsTROTQVLwxQXZLvpRCTnP1kDrA=
X-Received: by 2002:a05:622a:1a2a:b0:3e9:243a:c35b with SMTP id
 f42-20020a05622a1a2a00b003e9243ac35bmr6857676qtb.51.1681915139342; Wed, 19
 Apr 2023 07:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230417155613.4143258-1-tvrtko.ursulin@linux.intel.com>
 <20230417155613.4143258-7-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGuKovR_VL2UwyRddZ_d-AmZK3usC2zJ3Lb=sq-kN6EmAQ@mail.gmail.com>
 <a83f4f2c-f745-cb50-e05a-86862ab0ea96@linux.intel.com>
 <CAF6AEGudH15abZqM04Vb92-LCNt4=x7PNBbbP8LHu+SH83LURQ@mail.gmail.com>
 <b7dfb4a6-6636-42d0-ef6f-b8458c856c6a@linux.intel.com>
In-Reply-To: <b7dfb4a6-6636-42d0-ef6f-b8458c856c6a@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 19 Apr 2023 07:38:48 -0700
Message-ID: <CAF6AEGukNCHL+rGWu95UPf5=2o=xLngKuY=1MFO8+XL1J_DK6Q@mail.gmail.com>
Subject: Re: [RFC 6/6] drm/i915: Implement fdinfo memory stats printing
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

On Wed, Apr 19, 2023 at 7:06=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 18/04/2023 17:08, Rob Clark wrote:
> > On Tue, Apr 18, 2023 at 7:58=E2=80=AFAM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >> On 18/04/2023 15:39, Rob Clark wrote:
> >>> On Mon, Apr 17, 2023 at 8:56=E2=80=AFAM Tvrtko Ursulin
> >>> <tvrtko.ursulin@linux.intel.com> wrote:
> >>>>
> >>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>>>
> >>>> Show how more driver specific set of memory stats could be shown,
> >>>> more specifically where object can reside in multiple regions, showi=
ng all
> >>>> the supported stats, and where there is more to show than just user =
visible
> >>>> objects.
> >>>>
> >>>> WIP...
> >>>>
> >>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>>> ---
> >>>>    drivers/gpu/drm/i915/i915_driver.c     |   5 ++
> >>>>    drivers/gpu/drm/i915/i915_drm_client.c | 102 ++++++++++++++++++++=
+++++
> >>>>    drivers/gpu/drm/i915/i915_drm_client.h |   8 ++
> >>>>    drivers/gpu/drm/i915/i915_drv.h        |   2 +
> >>>>    4 files changed, 117 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i9=
15/i915_driver.c
> >>>> index 6493548c69bf..4c70206cbc27 100644
> >>>> --- a/drivers/gpu/drm/i915/i915_driver.c
> >>>> +++ b/drivers/gpu/drm/i915/i915_driver.c
> >>>> @@ -1806,6 +1806,11 @@ static const struct drm_driver i915_drm_drive=
r =3D {
> >>>>           .dumb_create =3D i915_gem_dumb_create,
> >>>>           .dumb_map_offset =3D i915_gem_dumb_mmap_offset,
> >>>>
> >>>> +#ifdef CONFIG_PROC_FS
> >>>> +       .query_fdinfo_memory_regions =3D i915_query_fdinfo_memory_re=
gions,
> >>>> +       .query_fdinfo_memory_stats =3D i915_query_fdinfo_memory_stat=
s,
> >>>> +#endif
> >>>> +
> >>>>           .ioctls =3D i915_ioctls,
> >>>>           .num_ioctls =3D ARRAY_SIZE(i915_ioctls),
> >>>>           .fops =3D &i915_driver_fops,
> >>>> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/dr=
m/i915/i915_drm_client.c
> >>>> index c654984189f7..65857c68bdb3 100644
> >>>> --- a/drivers/gpu/drm/i915/i915_drm_client.c
> >>>> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
> >>>> @@ -12,6 +12,7 @@
> >>>>    #include <drm/drm_print.h>
> >>>>
> >>>>    #include "gem/i915_gem_context.h"
> >>>> +#include "intel_memory_region.h"
> >>>>    #include "i915_drm_client.h"
> >>>>    #include "i915_file_private.h"
> >>>>    #include "i915_gem.h"
> >>>> @@ -112,4 +113,105 @@ void i915_drm_client_fdinfo(struct drm_printer=
 *p, struct drm_file *file)
> >>>>           for (i =3D 0; i < ARRAY_SIZE(uabi_class_names); i++)
> >>>>                   show_client_class(p, i915, file_priv->client, i);
> >>>>    }
> >>>> +
> >>>> +char **
> >>>> +i915_query_fdinfo_memory_regions(struct drm_device *dev, unsigned i=
nt *num)
> >>>> +{
> >>>> +       struct drm_i915_private *i915 =3D to_i915(dev);
> >>>> +       struct intel_memory_region *mr;
> >>>> +       enum intel_region_id id;
> >>>> +
> >>>> +       /* FIXME move to init */
> >>>> +       for_each_memory_region(mr, i915, id) {
> >>>> +               if (!i915->mm.region_names[id])
> >>>> +                       i915->mm.region_names[id] =3D mr->name;
> >>>> +       }
> >>>> +
> >>>> +       *num =3D id;
> >>>> +
> >>>> +       return i915->mm.region_names;
> >>>> +}
> >>>> +
> >>>> +static void
> >>>> +add_obj(struct drm_i915_gem_object *obj, struct drm_fdinfo_memory_s=
tat *stats)
> >>>> +{
> >>>> +        struct intel_memory_region *mr;
> >>>> +       u64 sz =3D obj->base.size;
> >>>> +        enum intel_region_id id;
> >>>> +       unsigned int i;
> >>>> +
> >>>> +       if (!obj)
> >>>> +               return;
> >>>> +
> >>>> +       /* Attribute size and shared to all possible memory regions.=
 */
> >>>> +       for (i =3D 0; i < obj->mm.n_placements; i++) {
> >>>> +               mr =3D obj->mm.placements[i];
> >>>> +               id =3D mr->id;
> >>>> +
> >>>> +               stats[id].size +=3D sz;
> >>>
> >>> This implies that summing up all of the categories is not the same as
> >>> the toplevel stats that I was proposing
> >
> > Sorry, I mis-spoke, I meant "summing up all of the regions is not..."
>
> Ah okay. It could be made like that yes.
>
> I wasn't sure what would be more useful for drivers which support memory
> regions. To see how much memory file could be using worst case, or
> strictly how much it is currently using. So for buffer objects where
> userspace allows kernel to choose the region from a supplied list, I
> thought it would be useful to show that in total size against all
> possible regions.
>
> In a way you see this driver /could/ be using 1G in vram and 1G in
> system, but currently it only has resident 1G in vram. Or you see
> another file which has 1G vram size and 1G resident size and you can
> infer some things.

AFAIU all the buffers could exist in system memory at some point in
time, and vram is more like an explicitly managed fast cache.  Like,
what happens on suspend to ram or hibernate, I assume you don't keep
vram powered?

> Perhaps that can be confusing and it would be better to let total size
> migrate between regions at runtime as does resident and other
> categories. But then the total size per region would change at runtime
> influenced by other app activity (as driver is transparently migrating
> buffers between regions). Which can also be very confusing, it would
> appear as if the app is creating/freeing objects when it isn't.
> >> Correct, my categories are a bit different. You had private and shared=
 as two mutually exclusive buckets, and then resident as subset of either/b=
oth. I have size as analogue to VmSize and resident as a subset of that, an=
alogue to VmRss.
> >>
> >
> > I split shared because by definition shared buffers can be counted
> > against multiple drm_file's, whereas private is only counted against
> > the single drm_file.  Driver or app changes are unlikely to change the
> > shared size, whereas private footprint is a thing you can optimize to
> > some degree.
>  >
> >> Shared is a bit wishy-washy, not sure about that one in either proposa=
ls. It can be either imported or exported buffers, but in essence I think i=
t fits better as a subset of total size.
> >
> > Imported vs exported doesn't really matter.. it is just an
> > implementation detail of the winsys.  But I think it is useful to know
> > how much of an app's footprint is shared vs private.  You could
> > express it different ways, but my proposal had private and shared,
> > from which you can calculate total:
> >
> >     total =3D private + shared
> >
> > but you could flip the path around and advertise just total and
> > shared, and calculate private from that.
>
> Yeah I am not sure. My gut feeling was that stable "top level" size is
> the best option. Aka "this is how much this file could be using worst cas=
e".
>
> If shared for file A can drop once file B closes the object it
> previously imported from A, I think that could be confusing. Because A
> did nothing - it is not suddenly using more private memory (hasn't
> allocated anything) nor has closed any shared memory objects.

ok, fair

> And on a tangent, but what about shared vs private stats when we have
> userptr object created from shared memory? Core cannot really untangle
> those. Or the memory allocated for other than buffer objects as I argue
> in the cover letter.

hmm, not sure.. I'd be inclined to just count them as private.  Are
you allowed to dma-buf export a userptr buffer?  That seems like it
could go pretty badly..

BR,
-R

> Regards,
>
> Tvrtko
