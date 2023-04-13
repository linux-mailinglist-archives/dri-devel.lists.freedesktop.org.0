Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C776E1166
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 17:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9E710EB6B;
	Thu, 13 Apr 2023 15:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA5010EB60;
 Thu, 13 Apr 2023 15:47:35 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 v15-20020a9d7d0f000000b006a43af689b6so487494otn.0; 
 Thu, 13 Apr 2023 08:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681400854; x=1683992854;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=40QSY4HJ0XRwmV80Hh5Qw6BSE3OLbUgvEyOCmgu55J0=;
 b=A0ksHXt8ehlfq9UKM3D1KM/FCmBS6mOWLxOp3Lw/XLuIF/H66x7SvlEWxjSgcTnSjg
 GELfYNw0e9KrrY8h31Efike5FijaNya91MUn0HfKFNF/i5KD0C33PXgacOK42C9PIDHX
 44+LsKqvmkXg6ot4w3Q+hmS0fi2pSoQt5tlf0ml49OsHm/svNbNlk7H0QF+cCf8gxkG/
 NKK6lQeStetqKgycujQct2W6PbU364QIlbLFI7qWhAWIIJr5yeKJCKC2+3UdCKDuvue+
 J1Z1pLZwSrk3mj18kaGiuX51Tx20lEIQyFTROmKuhf8vTqC0MsY5sY2qUt/RhU+SCLCI
 3gzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681400854; x=1683992854;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=40QSY4HJ0XRwmV80Hh5Qw6BSE3OLbUgvEyOCmgu55J0=;
 b=AoZsPPzLKH0Ffo8EGAgOD/uVwc/ikHJOIjHPNu1c85ff3IvXjLmbiD6un11O4UiY2N
 qWWMNmMmB5zvfheBgXGPdQEcJ0drxsSp9+MX7sSIEelbGA9HV+U3asTGeT7/MV98fsdU
 Y6Rb1Ivlw7OEupNiGUOSvXcw1/7ZMv7KiT1v8SK/eQKocjUDBuNhmyKuSpzEPr3LDQ3+
 tiXssU2YtuZPiIp+KnNV9O7Rg9g7uWtyZeM2zqj4LXymmED4watd79KiBWQOEdQCQcDU
 xaC/0pdFXgt370OBOYKDkiC6pbBYNgHiJEg8a1CiWWkLrdDqfIfRxzDM9npqb5zaXVmY
 zwTQ==
X-Gm-Message-State: AAQBX9cMQI19R3wFw6/Wl9BAogn3PERNcr/bmkkUXyo1yKyKFJhzEsFE
 CtChtu6FfAfdh9O4p5+tTQe/GEzm/EZDcuzZgfk=
X-Google-Smtp-Source: AKy350Y0rdOCcBL3A4+nrqG3S2UfhoJ+ePFTYrtKU0G3o3LBOemorq0U2UZp4x70H/0bh0hzdaH2HkeKLdnzOYwxhvA=
X-Received: by 2002:a05:6830:1bdc:b0:6a1:1b5c:c6db with SMTP id
 v28-20020a0568301bdc00b006a11b5cc6dbmr653947ota.7.1681400853867; Thu, 13 Apr
 2023 08:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230411225725.2032862-1-robdclark@gmail.com>
 <20230411225725.2032862-7-robdclark@gmail.com>
 <29a8d9aa-c6ea-873f-ce0b-fb8199b13068@linux.intel.com>
 <CAF6AEGsZsMx+Vy+4UQSx3X7w_QNvvjLqWxx=PnCLAOC9f-X2CQ@mail.gmail.com>
 <ZDb1phnddSne79iN@phenom.ffwll.local>
 <CAF6AEGvBeDVM12ac0j_PKSdcY83hNDhyrQs9-=h=dx_7AoMXLw@mail.gmail.com>
 <ZDcEGoSPGr/oRLas@phenom.ffwll.local>
 <c82fd8fa-9f4b-f62f-83be-25853f9ecf5e@linux.intel.com>
In-Reply-To: <c82fd8fa-9f4b-f62f-83be-25853f9ecf5e@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 13 Apr 2023 08:47:22 -0700
Message-ID: <CAF6AEGueanYczwmTW32j9pcG07aHVAUMEn1BEJn8dq6rXqqk7g@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] drm: Add fdinfo memory stats
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-arm-msm@vger.kernel.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 13, 2023 at 5:58=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 12/04/2023 20:18, Daniel Vetter wrote:
> > On Wed, Apr 12, 2023 at 11:42:07AM -0700, Rob Clark wrote:
> >> On Wed, Apr 12, 2023 at 11:17=E2=80=AFAM Daniel Vetter <daniel@ffwll.c=
h> wrote:
> >>>
> >>> On Wed, Apr 12, 2023 at 10:59:54AM -0700, Rob Clark wrote:
> >>>> On Wed, Apr 12, 2023 at 7:42=E2=80=AFAM Tvrtko Ursulin
> >>>> <tvrtko.ursulin@linux.intel.com> wrote:
> >>>>>
> >>>>>
> >>>>> On 11/04/2023 23:56, Rob Clark wrote:
> >>>>>> From: Rob Clark <robdclark@chromium.org>
> >>>>>>
> >>>>>> Add support to dump GEM stats to fdinfo.
> >>>>>>
> >>>>>> v2: Fix typos, change size units to match docs, use div_u64
> >>>>>> v3: Do it in core
> >>>>>>
> >>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>>>>> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> >>>>>> ---
> >>>>>>    Documentation/gpu/drm-usage-stats.rst | 21 ++++++++
> >>>>>>    drivers/gpu/drm/drm_file.c            | 76 ++++++++++++++++++++=
+++++++
> >>>>>>    include/drm/drm_file.h                |  1 +
> >>>>>>    include/drm/drm_gem.h                 | 19 +++++++
> >>>>>>    4 files changed, 117 insertions(+)
> >>>>>>
> >>>>>> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation=
/gpu/drm-usage-stats.rst
> >>>>>> index b46327356e80..b5e7802532ed 100644
> >>>>>> --- a/Documentation/gpu/drm-usage-stats.rst
> >>>>>> +++ b/Documentation/gpu/drm-usage-stats.rst
> >>>>>> @@ -105,6 +105,27 @@ object belong to this client, in the respecti=
ve memory region.
> >>>>>>    Default unit shall be bytes with optional unit specifiers of 'K=
iB' or 'MiB'
> >>>>>>    indicating kibi- or mebi-bytes.
> >>>>>>
> >>>>>> +- drm-shared-memory: <uint> [KiB|MiB]
> >>>>>> +
> >>>>>> +The total size of buffers that are shared with another file (ie. =
have more
> >>>>>> +than a single handle).
> >>>>>> +
> >>>>>> +- drm-private-memory: <uint> [KiB|MiB]
> >>>>>> +
> >>>>>> +The total size of buffers that are not shared with another file.
> >>>>>> +
> >>>>>> +- drm-resident-memory: <uint> [KiB|MiB]
> >>>>>> +
> >>>>>> +The total size of buffers that are resident in system memory.
> >>>>>
> >>>>> I think this naming maybe does not work best with the existing
> >>>>> drm-memory-<region> keys.
> >>>>
> >>>> Actually, it was very deliberate not to conflict with the existing
> >>>> drm-memory-<region> keys ;-)
> >>>>
> >>>> I wouldn't have preferred drm-memory-{active,resident,...} but it
> >>>> could be mis-parsed by existing userspace so my hands were a bit tie=
d.
> >>>>
> >>>>> How about introduce the concept of a memory region from the start a=
nd
> >>>>> use naming similar like we do for engines?
> >>>>>
> >>>>> drm-memory-$CATEGORY-$REGION: ...
> >>>>>
> >>>>> Then we document a bunch of categories and their semantics, for ins=
tance:
> >>>>>
> >>>>> 'size' - All reachable objects
> >>>>> 'shared' - Subset of 'size' with handle_count > 1
> >>>>> 'resident' - Objects with backing store
> >>>>> 'active' - Objects in use, subset of resident
> >>>>> 'purgeable' - Or inactive? Subset of resident.
> >>>>>
> >>>>> We keep the same semantics as with process memory accounting (if I =
got
> >>>>> it right) which could be desirable for a simplified mental model.
> >>>>>
> >>>>> (AMD needs to remind me of their 'drm-memory-...' keys semantics. I=
f we
> >>>>> correctly captured this in the first round it should be equivalent =
to
> >>>>> 'resident' above. In any case we can document no category is equal =
to
> >>>>> which category, and at most one of the two must be output.)
> >>>>>
> >>>>> Region names we at most partially standardize. Like we could say
> >>>>> 'system' is to be used where backing store is system RAM and others=
 are
> >>>>> driver defined.
> >>>>>
> >>>>> Then discrete GPUs could emit N sets of key-values, one for each me=
mory
> >>>>> region they support.
> >>>>>
> >>>>> I think this all also works for objects which can be migrated betwe=
en
> >>>>> memory regions. 'Size' accounts them against all regions while for
> >>>>> 'resident' they only appear in the region of their current placemen=
t, etc.
> >>>>
> >>>> I'm not too sure how to rectify different memory regions with this,
> >>>> since drm core doesn't really know about the driver's memory regions=
.
> >>>> Perhaps we can go back to this being a helper and drivers with vram
> >>>> just don't use the helper?  Or??
> >>>
> >>> I think if you flip it around to drm-$CATEGORY-memory{-$REGION}: then=
 it
> >>> all works out reasonably consistently?
> >>
> >> That is basically what we have now.  I could append -system to each to
> >> make things easier to add vram/etc (from a uabi standpoint)..
> >
> > What you have isn't really -system, but everything. So doesn't really m=
ake
> > sense to me to mark this -system, it's only really true for integrated =
(if
> > they don't have stolen or something like that).
> >
> > Also my comment was more in reply to Tvrtko's suggestion.
>
> Right so my proposal was drm-memory-$CATEGORY-$REGION which I think
> aligns with the current drm-memory-$REGION by extending, rather than
> creating confusion with different order of key name components.
>
> AMD currently has (among others) drm-memory-vram, which we could define
> in the spec maps to category X, if category component is not present.
>
> Some examples:
>
> drm-memory-resident-system:
> drm-memory-size-lmem0:
> drm-memory-active-vram:
>
> Etc.. I think it creates a consistent story.

It does read more naturally.. but there is a problem here (and the
reason I didn't take this route),

```
- drm-memory-<str>: <uint> [KiB|MiB]

Each possible memory type which can be used to store buffer objects by the
GPU in question shall be given a stable and unique name to be returned as t=
he
string here.
```

so, drm-memory-resident-system gets parsed as the "resident-system"
memory type by existing userspace :-(

This is why we are forced to use drm-$CATEGORY-memory...

BR,
-R

> Other than this, my two I think significant opens which haven't been
> addressed yet are:
>
> 1)
>
> Why do we want totals (not per region) when userspace can trivially
> aggregate if they want. What is the use case?
>
> 2)
>
> Current proposal limits the value to whole objects and fixates that by
> having it in the common code. If/when some driver is able to support
> sub-BO granularity they will need to opt out of the common printer at
> which point it may be less churn to start with a helper rather than
> mid-layer. Or maybe some drivers already support this, I don't know.
> Given how important VM BIND is I wouldn't be surprised.
>
> Regards,
>
> Tvrtko
>
> >>> And ttm could/should perhaps provide a helper to dump the region spec=
ific
> >>> version of this. Or we lift the concept of regions out of ttm a bit
> >>> higher, that's kinda needed for cgroups eventually anyway I think.
> >>> -Daniel
> >>>
> >>>>
> >>>> BR,
> >>>> -R
> >>>>
> >>>>> Userspace can aggregate if it wishes to do so but kernel side shoul=
d not.
> >>>>>
> >>>>>> +
> >>>>>> +- drm-purgeable-memory: <uint> [KiB|MiB]
> >>>>>> +
> >>>>>> +The total size of buffers that are purgeable.
> >>>>>> +
> >>>>>> +- drm-active-memory: <uint> [KiB|MiB]
> >>>>>> +
> >>>>>> +The total size of buffers that are active on one or more rings.
> >>>>>> +
> >>>>>>    - drm-cycles-<str> <uint>
> >>>>>>
> >>>>>>    Engine identifier string must be the same as the one specified =
in the
> >>>>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file=
.c
> >>>>>> index 37dfaa6be560..46fdd843bb3a 100644
> >>>>>> --- a/drivers/gpu/drm/drm_file.c
> >>>>>> +++ b/drivers/gpu/drm/drm_file.c
> >>>>>> @@ -42,6 +42,7 @@
> >>>>>>    #include <drm/drm_client.h>
> >>>>>>    #include <drm/drm_drv.h>
> >>>>>>    #include <drm/drm_file.h>
> >>>>>> +#include <drm/drm_gem.h>
> >>>>>>    #include <drm/drm_print.h>
> >>>>>>
> >>>>>>    #include "drm_crtc_internal.h"
> >>>>>> @@ -871,6 +872,79 @@ void drm_send_event(struct drm_device *dev, s=
truct drm_pending_event *e)
> >>>>>>    }
> >>>>>>    EXPORT_SYMBOL(drm_send_event);
> >>>>>>
> >>>>>> +static void print_size(struct drm_printer *p, const char *stat, s=
ize_t sz)
> >>>>>> +{
> >>>>>> +     const char *units[] =3D {"", " KiB", " MiB"};
> >>>>>> +     unsigned u;
> >>>>>> +
> >>>>>> +     for (u =3D 0; u < ARRAY_SIZE(units) - 1; u++) {
> >>>>>> +             if (sz < SZ_1K)
> >>>>>> +                     break;
> >>>>>> +             sz =3D div_u64(sz, SZ_1K);
> >>>>>> +     }
> >>>>>> +
> >>>>>> +     drm_printf(p, "%s:\t%zu%s\n", stat, sz, units[u]);
> >>>>>> +}
> >>>>>> +
> >>>>>> +static void print_memory_stats(struct drm_printer *p, struct drm_=
file *file)
> >>>>>> +{
> >>>>>> +     struct drm_gem_object *obj;
> >>>>>> +     struct {
> >>>>>> +             size_t shared;
> >>>>>> +             size_t private;
> >>>>>> +             size_t resident;
> >>>>>> +             size_t purgeable;
> >>>>>> +             size_t active;
> >>>>>> +     } size =3D {0};
> >>>>>> +     bool has_status =3D false;
> >>>>>> +     int id;
> >>>>>> +
> >>>>>> +     spin_lock(&file->table_lock);
> >>>>>> +     idr_for_each_entry (&file->object_idr, obj, id) {
> >>>>>> +             enum drm_gem_object_status s =3D 0;
> >>>>>> +
> >>>>>> +             if (obj->funcs && obj->funcs->status) {
> >>>>>> +                     s =3D obj->funcs->status(obj);
> >>>>>> +                     has_status =3D true;
> >>>>>> +             }
> >>>>>> +
> >>>>>> +             if (obj->handle_count > 1) {
> >>>>>> +                     size.shared +=3D obj->size;
> >>>>>> +             } else {
> >>>>>> +                     size.private +=3D obj->size;
> >>>>>> +             }
> >>>>>> +
> >>>>>> +             if (s & DRM_GEM_OBJECT_RESIDENT) {
> >>>>>> +                     size.resident +=3D obj->size;
> >>>>>> +             } else {
> >>>>>> +                     /* If already purged or not yet backed by pa=
ges, don't
> >>>>>> +                      * count it as purgeable:
> >>>>>> +                      */
> >>>>>> +                     s &=3D ~DRM_GEM_OBJECT_PURGEABLE;
> >>>>>
> >>>>> Side question - why couldn't resident buffers be purgeable? Did you=
 mean
> >>>>> for the if branch check to be active here? But then it wouldn't mak=
e
> >>>>> sense for a driver to report active _and_ purgeable..
> >>>>>
> >>>>>> +             }
> >>>>>> +
> >>>>>> +             if (!dma_resv_test_signaled(obj->resv, dma_resv_usag=
e_rw(true))) {
> >>>>>> +                     size.active +=3D obj->size;
> >>>>>> +
> >>>>>> +                     /* If still active, don't count as purgeable=
: */
> >>>>>> +                     s &=3D ~DRM_GEM_OBJECT_PURGEABLE;
> >>>>>
> >>>>> Another side question - I guess this tidies a race in reporting? If=
 so
> >>>>> not sure it matters given the stats are all rather approximate.
> >>>>>
> >>>>>> +             }
> >>>>>> +
> >>>>>> +             if (s & DRM_GEM_OBJECT_PURGEABLE)
> >>>>>> +                     size.purgeable +=3D obj->size;
> >>>>>> +     }
> >>>>>
> >>>>> One concern I have here is that it is all based on obj->size. That =
is,
> >>>>> there is no provision for drivers to implement page level granulari=
ty.
> >>>>> So correct reporting in use cases such as VM BIND in the future wou=
ldn't
> >>>>> work unless it was a driver hook to get almost all of the info abov=
e. At
> >>>>> which point common code is just a loop. TBF I don't know if any dri=
vers
> >>>>> do sub obj->size backing store granularity today, but I think it is
> >>>>> sometimes to be sure of before proceeding.
> >>>>>
> >>>>> Second concern is what I touched upon in the first reply block - if=
 the
> >>>>> common code blindly loops over all objects then on discrete GPUs it
> >>>>> seems we get an 'aggregate' value here which is not what I think we
> >>>>> want. We rather want to have the ability for drivers to list stats =
per
> >>>>> individual memory region.
> >>>>>
> >>>>>> +     spin_unlock(&file->table_lock);
> >>>>>> +
> >>>>>> +     print_size(p, "drm-shared-memory", size.shared);
> >>>>>> +     print_size(p, "drm-private-memory", size.private);
> >>>>>> +     print_size(p, "drm-active-memory", size.active);
> >>>>>> +
> >>>>>> +     if (has_status) {
> >>>>>> +             print_size(p, "drm-resident-memory", size.resident);
> >>>>>> +             print_size(p, "drm-purgeable-memory", size.purgeable=
);
> >>>>>> +     }
> >>>>>> +}
> >>>>>> +
> >>>>>>    /**
> >>>>>>     * drm_fop_show_fdinfo - helper for drm file fops
> >>>>>>     * @seq_file: output stream
> >>>>>> @@ -904,6 +978,8 @@ void drm_fop_show_fdinfo(struct seq_file *m, s=
truct file *f)
> >>>>>>
> >>>>>>        if (dev->driver->show_fdinfo)
> >>>>>>                dev->driver->show_fdinfo(&p, file);
> >>>>>> +
> >>>>>> +     print_memory_stats(&p, file);
> >>>>>>    }
> >>>>>>    EXPORT_SYMBOL(drm_fop_show_fdinfo);
> >>>>>>
> >>>>>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> >>>>>> index dfa995b787e1..e5b40084538f 100644
> >>>>>> --- a/include/drm/drm_file.h
> >>>>>> +++ b/include/drm/drm_file.h
> >>>>>> @@ -41,6 +41,7 @@
> >>>>>>    struct dma_fence;
> >>>>>>    struct drm_file;
> >>>>>>    struct drm_device;
> >>>>>> +struct drm_printer;
> >>>>>>    struct device;
> >>>>>>    struct file;
> >>>>>>
> >>>>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> >>>>>> index 189fd618ca65..213917bb6b11 100644
> >>>>>> --- a/include/drm/drm_gem.h
> >>>>>> +++ b/include/drm/drm_gem.h
> >>>>>> @@ -42,6 +42,14 @@
> >>>>>>    struct iosys_map;
> >>>>>>    struct drm_gem_object;
> >>>>>>
> >>>>>> +/**
> >>>>>> + * enum drm_gem_object_status - bitmask of object state for fdinf=
o reporting
> >>>>>> + */
> >>>>>> +enum drm_gem_object_status {
> >>>>>> +     DRM_GEM_OBJECT_RESIDENT  =3D BIT(0),
> >>>>>> +     DRM_GEM_OBJECT_PURGEABLE =3D BIT(1),
> >>>>>> +};
> >>>>>> +
> >>>>>>    /**
> >>>>>>     * struct drm_gem_object_funcs - GEM object functions
> >>>>>>     */
> >>>>>> @@ -174,6 +182,17 @@ struct drm_gem_object_funcs {
> >>>>>>         */
> >>>>>>        int (*evict)(struct drm_gem_object *obj);
> >>>>>>
> >>>>>> +     /**
> >>>>>> +      * @status:
> >>>>>> +      *
> >>>>>> +      * The optional status callback can return additional object=
 state
> >>>>>> +      * which determines which stats the object is counted agains=
t.  The
> >>>>>> +      * callback is called under table_lock.  Racing against obje=
ct status
> >>>>>> +      * change is "harmless", and the callback can expect to not =
race
> >>>>>> +      * against object destruction.
> >>>>>> +      */
> >>>>>> +     enum drm_gem_object_status (*status)(struct drm_gem_object *=
obj);
> >>>>>
> >>>>> Does this needs to be in object funcs and couldn't be consolidated =
to
> >>>>> driver level?
> >>>>>
> >>>>> Regards,
> >>>>>
> >>>>> Tvrtko
> >>>>>
> >>>>>> +
> >>>>>>        /**
> >>>>>>         * @vm_ops:
> >>>>>>         *
> >>>
> >>> --
> >>> Daniel Vetter
> >>> Software Engineer, Intel Corporation
> >>> http://blog.ffwll.ch
> >
