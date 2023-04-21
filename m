Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBF16EA0F9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 03:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD9D310E12F;
	Fri, 21 Apr 2023 01:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F5710E12F;
 Fri, 21 Apr 2023 01:27:11 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-38c0a331d3cso991205b6e.1; 
 Thu, 20 Apr 2023 18:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682040430; x=1684632430;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZC4/W1cbFA/Zhg+P1OPc9XN0Biydw2emw/4HaAmyBTE=;
 b=EnEppNtdh56qytz6PmWJRFz8rsOnMkWDyLHHIYyAnHzhW7eIiAGy3b6mhGS/J6+aPK
 S9YRUspq7XFd3BilXjPHDpLYeFXhd/pEDGQcf05cN+SU5erLMnQd73n2CSgNai775yuS
 Md5924pc3NLIr2V1Bqkh3gmCOsa0oNC/GviBFEBZhWOO+6QziT0kdDqI3+SMxOuuW+Oz
 /U0s6tzHhvR+e930M6vEV8TXBym/vcRcY9Dlwv3xaP3vUSYM+GtLBqTIhWBac+gND6za
 VbmwppDftvDLOG5An/GjqeL2YWmOc/b6SpA+7qJb0k51wXfqDaidEF0p/+FLWowlNTj+
 Ylig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682040430; x=1684632430;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZC4/W1cbFA/Zhg+P1OPc9XN0Biydw2emw/4HaAmyBTE=;
 b=hslXAnidhaQixoAX9Y9HjpEvWgn0dEgaV13lq6Ad9uXEF/BGjZORqgytRTVdMZ2EQf
 3wPpVn2iWFi/AouZocx9x68PsV3jSp8pAGiDuJoIgxiGsCvtb84l+7zfaTm27oBRawzd
 Sx7YYoT/zE9si601Asw1HBJVWACz7kS5g9TZBFV+yi/o3XRDwE8+Swv0uDAo5/sTzJ8F
 UgJ8ZJayXs6pGJlMJk1il52B7uqaZFjFKDZI3RGDPbDQjK1rFJOBSEiOTCRPMiPkp69d
 hKovyPG8fQ+9j5+W9Y9cqkEQJCOufarkJmeFgZU48WR+lzEMig1wV87zYLUUz7BhGMC9
 g+Aw==
X-Gm-Message-State: AAQBX9dyw8of12DywL9LhSnna/LUVsPkjhKzeN7xlx6qmI/Ub37ayr9x
 q2WEyoGcSEAwgihDQd+4d8MMIT512OJZzbiF70M=
X-Google-Smtp-Source: AKy350YDzmdh09rKo9v9ZD6LetV+4xoCHPpPQksk6tEjQ5gIVAkmg/9r2B0gHRuyNMtot1cTjAUAaG5yI6dVNiHOKP8=
X-Received: by 2002:a54:4383:0:b0:38d:e9b3:e671 with SMTP id
 u3-20020a544383000000b0038de9b3e671mr2062625oiv.10.1682040430321; Thu, 20 Apr
 2023 18:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230417155613.4143258-1-tvrtko.ursulin@linux.intel.com>
 <20230417155613.4143258-7-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGuKovR_VL2UwyRddZ_d-AmZK3usC2zJ3Lb=sq-kN6EmAQ@mail.gmail.com>
 <a83f4f2c-f745-cb50-e05a-86862ab0ea96@linux.intel.com>
 <CAF6AEGudH15abZqM04Vb92-LCNt4=x7PNBbbP8LHu+SH83LURQ@mail.gmail.com>
 <b7dfb4a6-6636-42d0-ef6f-b8458c856c6a@linux.intel.com>
 <CAF6AEGukNCHL+rGWu95UPf5=2o=xLngKuY=1MFO8+XL1J_DK6Q@mail.gmail.com>
 <5c1fc317-483c-d828-c3bf-2bc8675fa60c@linux.intel.com>
In-Reply-To: <5c1fc317-483c-d828-c3bf-2bc8675fa60c@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 20 Apr 2023 18:26:59 -0700
Message-ID: <CAF6AEGvMG7m68nfJQYpKwoug9rQNHW362y3FUvRGsuU7QFN0oA@mail.gmail.com>
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

On Thu, Apr 20, 2023 at 6:11=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 19/04/2023 15:38, Rob Clark wrote:
> > On Wed, Apr 19, 2023 at 7:06=E2=80=AFAM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >>
> >> On 18/04/2023 17:08, Rob Clark wrote:
> >>> On Tue, Apr 18, 2023 at 7:58=E2=80=AFAM Tvrtko Ursulin
> >>> <tvrtko.ursulin@linux.intel.com> wrote:
> >>>> On 18/04/2023 15:39, Rob Clark wrote:
> >>>>> On Mon, Apr 17, 2023 at 8:56=E2=80=AFAM Tvrtko Ursulin
> >>>>> <tvrtko.ursulin@linux.intel.com> wrote:
> >>>>>>
> >>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>>>>>
> >>>>>> Show how more driver specific set of memory stats could be shown,
> >>>>>> more specifically where object can reside in multiple regions, sho=
wing all
> >>>>>> the supported stats, and where there is more to show than just use=
r visible
> >>>>>> objects.
> >>>>>>
> >>>>>> WIP...
> >>>>>>
> >>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>>>>> ---
> >>>>>>     drivers/gpu/drm/i915/i915_driver.c     |   5 ++
> >>>>>>     drivers/gpu/drm/i915/i915_drm_client.c | 102 +++++++++++++++++=
++++++++
> >>>>>>     drivers/gpu/drm/i915/i915_drm_client.h |   8 ++
> >>>>>>     drivers/gpu/drm/i915/i915_drv.h        |   2 +
> >>>>>>     4 files changed, 117 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/=
i915/i915_driver.c
> >>>>>> index 6493548c69bf..4c70206cbc27 100644
> >>>>>> --- a/drivers/gpu/drm/i915/i915_driver.c
> >>>>>> +++ b/drivers/gpu/drm/i915/i915_driver.c
> >>>>>> @@ -1806,6 +1806,11 @@ static const struct drm_driver i915_drm_dri=
ver =3D {
> >>>>>>            .dumb_create =3D i915_gem_dumb_create,
> >>>>>>            .dumb_map_offset =3D i915_gem_dumb_mmap_offset,
> >>>>>>
> >>>>>> +#ifdef CONFIG_PROC_FS
> >>>>>> +       .query_fdinfo_memory_regions =3D i915_query_fdinfo_memory_=
regions,
> >>>>>> +       .query_fdinfo_memory_stats =3D i915_query_fdinfo_memory_st=
ats,
> >>>>>> +#endif
> >>>>>> +
> >>>>>>            .ioctls =3D i915_ioctls,
> >>>>>>            .num_ioctls =3D ARRAY_SIZE(i915_ioctls),
> >>>>>>            .fops =3D &i915_driver_fops,
> >>>>>> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/=
drm/i915/i915_drm_client.c
> >>>>>> index c654984189f7..65857c68bdb3 100644
> >>>>>> --- a/drivers/gpu/drm/i915/i915_drm_client.c
> >>>>>> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
> >>>>>> @@ -12,6 +12,7 @@
> >>>>>>     #include <drm/drm_print.h>
> >>>>>>
> >>>>>>     #include "gem/i915_gem_context.h"
> >>>>>> +#include "intel_memory_region.h"
> >>>>>>     #include "i915_drm_client.h"
> >>>>>>     #include "i915_file_private.h"
> >>>>>>     #include "i915_gem.h"
> >>>>>> @@ -112,4 +113,105 @@ void i915_drm_client_fdinfo(struct drm_print=
er *p, struct drm_file *file)
> >>>>>>            for (i =3D 0; i < ARRAY_SIZE(uabi_class_names); i++)
> >>>>>>                    show_client_class(p, i915, file_priv->client, i=
);
> >>>>>>     }
> >>>>>> +
> >>>>>> +char **
> >>>>>> +i915_query_fdinfo_memory_regions(struct drm_device *dev, unsigned=
 int *num)
> >>>>>> +{
> >>>>>> +       struct drm_i915_private *i915 =3D to_i915(dev);
> >>>>>> +       struct intel_memory_region *mr;
> >>>>>> +       enum intel_region_id id;
> >>>>>> +
> >>>>>> +       /* FIXME move to init */
> >>>>>> +       for_each_memory_region(mr, i915, id) {
> >>>>>> +               if (!i915->mm.region_names[id])
> >>>>>> +                       i915->mm.region_names[id] =3D mr->name;
> >>>>>> +       }
> >>>>>> +
> >>>>>> +       *num =3D id;
> >>>>>> +
> >>>>>> +       return i915->mm.region_names;
> >>>>>> +}
> >>>>>> +
> >>>>>> +static void
> >>>>>> +add_obj(struct drm_i915_gem_object *obj, struct drm_fdinfo_memory=
_stat *stats)
> >>>>>> +{
> >>>>>> +        struct intel_memory_region *mr;
> >>>>>> +       u64 sz =3D obj->base.size;
> >>>>>> +        enum intel_region_id id;
> >>>>>> +       unsigned int i;
> >>>>>> +
> >>>>>> +       if (!obj)
> >>>>>> +               return;
> >>>>>> +
> >>>>>> +       /* Attribute size and shared to all possible memory region=
s. */
> >>>>>> +       for (i =3D 0; i < obj->mm.n_placements; i++) {
> >>>>>> +               mr =3D obj->mm.placements[i];
> >>>>>> +               id =3D mr->id;
> >>>>>> +
> >>>>>> +               stats[id].size +=3D sz;
> >>>>>
> >>>>> This implies that summing up all of the categories is not the same =
as
> >>>>> the toplevel stats that I was proposing
> >>>
> >>> Sorry, I mis-spoke, I meant "summing up all of the regions is not..."
> >>
> >> Ah okay. It could be made like that yes.
> >>
> >> I wasn't sure what would be more useful for drivers which support memo=
ry
> >> regions. To see how much memory file could be using worst case, or
> >> strictly how much it is currently using. So for buffer objects where
> >> userspace allows kernel to choose the region from a supplied list, I
> >> thought it would be useful to show that in total size against all
> >> possible regions.
> >>
> >> In a way you see this driver /could/ be using 1G in vram and 1G in
> >> system, but currently it only has resident 1G in vram. Or you see
> >> another file which has 1G vram size and 1G resident size and you can
> >> infer some things.
> >
> > AFAIU all the buffers could exist in system memory at some point in
> > time, and vram is more like an explicitly managed fast cache.  Like,
> > what happens on suspend to ram or hibernate, I assume you don't keep
> > vram powered?
>
> Yeah they can be swapped out on suspend, but that's different that
> buffers which are explicitly marked as being allowed to exist in either
> region at runtime.

it sounds, at least from the PoV of system memory usage, they still
need pages in system memory so they have somewhere to live when
swapped out of vram?

> >> Perhaps that can be confusing and it would be better to let total size
> >> migrate between regions at runtime as does resident and other
> >> categories. But then the total size per region would change at runtime
> >> influenced by other app activity (as driver is transparently migrating
> >> buffers between regions). Which can also be very confusing, it would
> >> appear as if the app is creating/freeing objects when it isn't.
> >>>> Correct, my categories are a bit different. You had private and shar=
ed as two mutually exclusive buckets, and then resident as subset of either=
/both. I have size as analogue to VmSize and resident as a subset of that, =
analogue to VmRss.
> >>>>
> >>>
> >>> I split shared because by definition shared buffers can be counted
> >>> against multiple drm_file's, whereas private is only counted against
> >>> the single drm_file.  Driver or app changes are unlikely to change th=
e
> >>> shared size, whereas private footprint is a thing you can optimize to
> >>> some degree.
> >>   >
> >>>> Shared is a bit wishy-washy, not sure about that one in either propo=
sals. It can be either imported or exported buffers, but in essence I think=
 it fits better as a subset of total size.
> >>>
> >>> Imported vs exported doesn't really matter.. it is just an
> >>> implementation detail of the winsys.  But I think it is useful to kno=
w
> >>> how much of an app's footprint is shared vs private.  You could
> >>> express it different ways, but my proposal had private and shared,
> >>> from which you can calculate total:
> >>>
> >>>      total =3D private + shared
> >>>
> >>> but you could flip the path around and advertise just total and
> >>> shared, and calculate private from that.
> >>
> >> Yeah I am not sure. My gut feeling was that stable "top level" size is
> >> the best option. Aka "this is how much this file could be using worst =
case".
> >>
> >> If shared for file A can drop once file B closes the object it
> >> previously imported from A, I think that could be confusing. Because A
> >> did nothing - it is not suddenly using more private memory (hasn't
> >> allocated anything) nor has closed any shared memory objects.
> >
> > ok, fair
> >
> >> And on a tangent, but what about shared vs private stats when we have
> >> userptr object created from shared memory? Core cannot really untangle
> >> those. Or the memory allocated for other than buffer objects as I argu=
e
> >> in the cover letter.
> >
> > hmm, not sure.. I'd be inclined to just count them as private.  Are
> > you allowed to dma-buf export a userptr buffer?  That seems like it
> > could go pretty badly..
>
> AFAIR we forbid that, but my point was more that there is shared memory
> and shared memory, not related to dma-buf I mean. Just that two
> processes could create two userptr objects from the same shared memory
> block. Memory accounting is as always complicated.

don't let "perfect" be the enemy of "good", especially in this case
when it sounds like "perfect" isn't even possible ;-)

ie, we should just count as private vs shared based on handle count

BR,
-R

> Regards,
>
> Tvrtko
