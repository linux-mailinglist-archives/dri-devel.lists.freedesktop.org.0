Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B29AE6DFDD0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 20:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4188C10E20F;
	Wed, 12 Apr 2023 18:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5ACE10E0BF;
 Wed, 12 Apr 2023 18:42:20 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1842e278605so14850818fac.6; 
 Wed, 12 Apr 2023 11:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681324939;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rowzVR1gSPrUpoTXZ7EcM+hK67GNvWWmaXuXO5DMFKA=;
 b=Zx5PK02vvl1ksSoh/UgIMwVyHk8LzJc4opI+uj/OXc992zjzwat4nrNOelmCDYcfty
 ltaCqPnP1ExOEZ/8hsKB6tMCp//+u5zvPfI8wr6VgU+0D9M4LHZu/mE8aQPESSFGBsJm
 DDRfK0WSekzIce64pvG7kMFptRF5GauY/TIvB3vgLmN2Fqw1srxy06Cnvtbhm8u+XhpK
 nYC4SJjT8+4HhG4j+w3/pg3ipVfgOKLG9Wxp/KXz5knkhnxyHTUEVezoFSkBoBui2lwU
 WV35JKy8OUadRFuFw4h5BSnAyDIHNHhbMXQCejIWLi0gM1VXydIHnCnXEbncQW6bw/zB
 Gesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681324939;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rowzVR1gSPrUpoTXZ7EcM+hK67GNvWWmaXuXO5DMFKA=;
 b=Z6tIG05GvEgOLKFsRAU5iddn02c9PUAu797OzswvotIn4xrArLmfTp6OUbdJMPQg73
 j8C6KWTPVo7JVNSmkn30RFIiPSPUx7gCujsfBeplBFU3Zln6x7NrOudL2oYIW3klF/5k
 o1pzFNnZKetHGEDGHBpFAy40JGiE7dwZRWR7vGvx3S0L3GM8pjTDgt/ezOxaaqrccICg
 0yMniXRQWPiJEM/qi4YbVpf3H1T8m4z5BVmVJR8uI0NtpEWkfQ9G+wGp3haXimQlv42O
 +2xbTPUgp379uj59jj6eJ7YGC7iQ10kO6/vUrU9o08mfMlkHg5VG87llazJa7B8OBuQJ
 yAWQ==
X-Gm-Message-State: AAQBX9flOUT6baLjN/63ZmRqGd4g+0gKfAJ/5BJC0TTA5Pq64idmMwLT
 gCtBGvgYTmsav/1c9aueDi1WHB8eg1XQDsyQU1s=
X-Google-Smtp-Source: AKy350aJqYzIM0I6sty+TARLrJ3STJ3j4+D7EjgIYedUvEov2aLHuEcIkz3UEXKUJE3y4F2VxvmGsD9//rh7E/rb2WM=
X-Received: by 2002:a05:6870:524b:b0:186:d9e3:e279 with SMTP id
 o11-20020a056870524b00b00186d9e3e279mr1204389oai.5.1681324938794; Wed, 12 Apr
 2023 11:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230411225725.2032862-1-robdclark@gmail.com>
 <20230411225725.2032862-7-robdclark@gmail.com>
 <29a8d9aa-c6ea-873f-ce0b-fb8199b13068@linux.intel.com>
 <CAF6AEGsZsMx+Vy+4UQSx3X7w_QNvvjLqWxx=PnCLAOC9f-X2CQ@mail.gmail.com>
 <ZDb1phnddSne79iN@phenom.ffwll.local>
In-Reply-To: <ZDb1phnddSne79iN@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 12 Apr 2023 11:42:07 -0700
Message-ID: <CAF6AEGvBeDVM12ac0j_PKSdcY83hNDhyrQs9-=h=dx_7AoMXLw@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] drm: Add fdinfo memory stats
To: Rob Clark <robdclark@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christopher Healy <healych@amazon.com>, 
 Emil Velikov <emil.l.velikov@gmail.com>, Rob Clark <robdclark@chromium.org>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>
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

On Wed, Apr 12, 2023 at 11:17=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wr=
ote:
>
> On Wed, Apr 12, 2023 at 10:59:54AM -0700, Rob Clark wrote:
> > On Wed, Apr 12, 2023 at 7:42=E2=80=AFAM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> > >
> > >
> > > On 11/04/2023 23:56, Rob Clark wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > Add support to dump GEM stats to fdinfo.
> > > >
> > > > v2: Fix typos, change size units to match docs, use div_u64
> > > > v3: Do it in core
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> > > > ---
> > > >   Documentation/gpu/drm-usage-stats.rst | 21 ++++++++
> > > >   drivers/gpu/drm/drm_file.c            | 76 ++++++++++++++++++++++=
+++++
> > > >   include/drm/drm_file.h                |  1 +
> > > >   include/drm/drm_gem.h                 | 19 +++++++
> > > >   4 files changed, 117 insertions(+)
> > > >
> > > > diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/=
gpu/drm-usage-stats.rst
> > > > index b46327356e80..b5e7802532ed 100644
> > > > --- a/Documentation/gpu/drm-usage-stats.rst
> > > > +++ b/Documentation/gpu/drm-usage-stats.rst
> > > > @@ -105,6 +105,27 @@ object belong to this client, in the respectiv=
e memory region.
> > > >   Default unit shall be bytes with optional unit specifiers of 'KiB=
' or 'MiB'
> > > >   indicating kibi- or mebi-bytes.
> > > >
> > > > +- drm-shared-memory: <uint> [KiB|MiB]
> > > > +
> > > > +The total size of buffers that are shared with another file (ie. h=
ave more
> > > > +than a single handle).
> > > > +
> > > > +- drm-private-memory: <uint> [KiB|MiB]
> > > > +
> > > > +The total size of buffers that are not shared with another file.
> > > > +
> > > > +- drm-resident-memory: <uint> [KiB|MiB]
> > > > +
> > > > +The total size of buffers that are resident in system memory.
> > >
> > > I think this naming maybe does not work best with the existing
> > > drm-memory-<region> keys.
> >
> > Actually, it was very deliberate not to conflict with the existing
> > drm-memory-<region> keys ;-)
> >
> > I wouldn't have preferred drm-memory-{active,resident,...} but it
> > could be mis-parsed by existing userspace so my hands were a bit tied.
> >
> > > How about introduce the concept of a memory region from the start and
> > > use naming similar like we do for engines?
> > >
> > > drm-memory-$CATEGORY-$REGION: ...
> > >
> > > Then we document a bunch of categories and their semantics, for insta=
nce:
> > >
> > > 'size' - All reachable objects
> > > 'shared' - Subset of 'size' with handle_count > 1
> > > 'resident' - Objects with backing store
> > > 'active' - Objects in use, subset of resident
> > > 'purgeable' - Or inactive? Subset of resident.
> > >
> > > We keep the same semantics as with process memory accounting (if I go=
t
> > > it right) which could be desirable for a simplified mental model.
> > >
> > > (AMD needs to remind me of their 'drm-memory-...' keys semantics. If =
we
> > > correctly captured this in the first round it should be equivalent to
> > > 'resident' above. In any case we can document no category is equal to
> > > which category, and at most one of the two must be output.)
> > >
> > > Region names we at most partially standardize. Like we could say
> > > 'system' is to be used where backing store is system RAM and others a=
re
> > > driver defined.
> > >
> > > Then discrete GPUs could emit N sets of key-values, one for each memo=
ry
> > > region they support.
> > >
> > > I think this all also works for objects which can be migrated between
> > > memory regions. 'Size' accounts them against all regions while for
> > > 'resident' they only appear in the region of their current placement,=
 etc.
> >
> > I'm not too sure how to rectify different memory regions with this,
> > since drm core doesn't really know about the driver's memory regions.
> > Perhaps we can go back to this being a helper and drivers with vram
> > just don't use the helper?  Or??
>
> I think if you flip it around to drm-$CATEGORY-memory{-$REGION}: then it
> all works out reasonably consistently?

That is basically what we have now.  I could append -system to each to
make things easier to add vram/etc (from a uabi standpoint)..

BR,
-R

> And ttm could/should perhaps provide a helper to dump the region specific
> version of this. Or we lift the concept of regions out of ttm a bit
> higher, that's kinda needed for cgroups eventually anyway I think.
> -Daniel
>
> >
> > BR,
> > -R
> >
> > > Userspace can aggregate if it wishes to do so but kernel side should =
not.
> > >
> > > > +
> > > > +- drm-purgeable-memory: <uint> [KiB|MiB]
> > > > +
> > > > +The total size of buffers that are purgeable.
> > > > +
> > > > +- drm-active-memory: <uint> [KiB|MiB]
> > > > +
> > > > +The total size of buffers that are active on one or more rings.
> > > > +
> > > >   - drm-cycles-<str> <uint>
> > > >
> > > >   Engine identifier string must be the same as the one specified in=
 the
> > > > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.=
c
> > > > index 37dfaa6be560..46fdd843bb3a 100644
> > > > --- a/drivers/gpu/drm/drm_file.c
> > > > +++ b/drivers/gpu/drm/drm_file.c
> > > > @@ -42,6 +42,7 @@
> > > >   #include <drm/drm_client.h>
> > > >   #include <drm/drm_drv.h>
> > > >   #include <drm/drm_file.h>
> > > > +#include <drm/drm_gem.h>
> > > >   #include <drm/drm_print.h>
> > > >
> > > >   #include "drm_crtc_internal.h"
> > > > @@ -871,6 +872,79 @@ void drm_send_event(struct drm_device *dev, st=
ruct drm_pending_event *e)
> > > >   }
> > > >   EXPORT_SYMBOL(drm_send_event);
> > > >
> > > > +static void print_size(struct drm_printer *p, const char *stat, si=
ze_t sz)
> > > > +{
> > > > +     const char *units[] =3D {"", " KiB", " MiB"};
> > > > +     unsigned u;
> > > > +
> > > > +     for (u =3D 0; u < ARRAY_SIZE(units) - 1; u++) {
> > > > +             if (sz < SZ_1K)
> > > > +                     break;
> > > > +             sz =3D div_u64(sz, SZ_1K);
> > > > +     }
> > > > +
> > > > +     drm_printf(p, "%s:\t%zu%s\n", stat, sz, units[u]);
> > > > +}
> > > > +
> > > > +static void print_memory_stats(struct drm_printer *p, struct drm_f=
ile *file)
> > > > +{
> > > > +     struct drm_gem_object *obj;
> > > > +     struct {
> > > > +             size_t shared;
> > > > +             size_t private;
> > > > +             size_t resident;
> > > > +             size_t purgeable;
> > > > +             size_t active;
> > > > +     } size =3D {0};
> > > > +     bool has_status =3D false;
> > > > +     int id;
> > > > +
> > > > +     spin_lock(&file->table_lock);
> > > > +     idr_for_each_entry (&file->object_idr, obj, id) {
> > > > +             enum drm_gem_object_status s =3D 0;
> > > > +
> > > > +             if (obj->funcs && obj->funcs->status) {
> > > > +                     s =3D obj->funcs->status(obj);
> > > > +                     has_status =3D true;
> > > > +             }
> > > > +
> > > > +             if (obj->handle_count > 1) {
> > > > +                     size.shared +=3D obj->size;
> > > > +             } else {
> > > > +                     size.private +=3D obj->size;
> > > > +             }
> > > > +
> > > > +             if (s & DRM_GEM_OBJECT_RESIDENT) {
> > > > +                     size.resident +=3D obj->size;
> > > > +             } else {
> > > > +                     /* If already purged or not yet backed by pag=
es, don't
> > > > +                      * count it as purgeable:
> > > > +                      */
> > > > +                     s &=3D ~DRM_GEM_OBJECT_PURGEABLE;
> > >
> > > Side question - why couldn't resident buffers be purgeable? Did you m=
ean
> > > for the if branch check to be active here? But then it wouldn't make
> > > sense for a driver to report active _and_ purgeable..
> > >
> > > > +             }
> > > > +
> > > > +             if (!dma_resv_test_signaled(obj->resv, dma_resv_usage=
_rw(true))) {
> > > > +                     size.active +=3D obj->size;
> > > > +
> > > > +                     /* If still active, don't count as purgeable:=
 */
> > > > +                     s &=3D ~DRM_GEM_OBJECT_PURGEABLE;
> > >
> > > Another side question - I guess this tidies a race in reporting? If s=
o
> > > not sure it matters given the stats are all rather approximate.
> > >
> > > > +             }
> > > > +
> > > > +             if (s & DRM_GEM_OBJECT_PURGEABLE)
> > > > +                     size.purgeable +=3D obj->size;
> > > > +     }
> > >
> > > One concern I have here is that it is all based on obj->size. That is=
,
> > > there is no provision for drivers to implement page level granularity=
.
> > > So correct reporting in use cases such as VM BIND in the future would=
n't
> > > work unless it was a driver hook to get almost all of the info above.=
 At
> > > which point common code is just a loop. TBF I don't know if any drive=
rs
> > > do sub obj->size backing store granularity today, but I think it is
> > > sometimes to be sure of before proceeding.
> > >
> > > Second concern is what I touched upon in the first reply block - if t=
he
> > > common code blindly loops over all objects then on discrete GPUs it
> > > seems we get an 'aggregate' value here which is not what I think we
> > > want. We rather want to have the ability for drivers to list stats pe=
r
> > > individual memory region.
> > >
> > > > +     spin_unlock(&file->table_lock);
> > > > +
> > > > +     print_size(p, "drm-shared-memory", size.shared);
> > > > +     print_size(p, "drm-private-memory", size.private);
> > > > +     print_size(p, "drm-active-memory", size.active);
> > > > +
> > > > +     if (has_status) {
> > > > +             print_size(p, "drm-resident-memory", size.resident);
> > > > +             print_size(p, "drm-purgeable-memory", size.purgeable)=
;
> > > > +     }
> > > > +}
> > > > +
> > > >   /**
> > > >    * drm_fop_show_fdinfo - helper for drm file fops
> > > >    * @seq_file: output stream
> > > > @@ -904,6 +978,8 @@ void drm_fop_show_fdinfo(struct seq_file *m, st=
ruct file *f)
> > > >
> > > >       if (dev->driver->show_fdinfo)
> > > >               dev->driver->show_fdinfo(&p, file);
> > > > +
> > > > +     print_memory_stats(&p, file);
> > > >   }
> > > >   EXPORT_SYMBOL(drm_fop_show_fdinfo);
> > > >
> > > > diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> > > > index dfa995b787e1..e5b40084538f 100644
> > > > --- a/include/drm/drm_file.h
> > > > +++ b/include/drm/drm_file.h
> > > > @@ -41,6 +41,7 @@
> > > >   struct dma_fence;
> > > >   struct drm_file;
> > > >   struct drm_device;
> > > > +struct drm_printer;
> > > >   struct device;
> > > >   struct file;
> > > >
> > > > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > > > index 189fd618ca65..213917bb6b11 100644
> > > > --- a/include/drm/drm_gem.h
> > > > +++ b/include/drm/drm_gem.h
> > > > @@ -42,6 +42,14 @@
> > > >   struct iosys_map;
> > > >   struct drm_gem_object;
> > > >
> > > > +/**
> > > > + * enum drm_gem_object_status - bitmask of object state for fdinfo=
 reporting
> > > > + */
> > > > +enum drm_gem_object_status {
> > > > +     DRM_GEM_OBJECT_RESIDENT  =3D BIT(0),
> > > > +     DRM_GEM_OBJECT_PURGEABLE =3D BIT(1),
> > > > +};
> > > > +
> > > >   /**
> > > >    * struct drm_gem_object_funcs - GEM object functions
> > > >    */
> > > > @@ -174,6 +182,17 @@ struct drm_gem_object_funcs {
> > > >        */
> > > >       int (*evict)(struct drm_gem_object *obj);
> > > >
> > > > +     /**
> > > > +      * @status:
> > > > +      *
> > > > +      * The optional status callback can return additional object =
state
> > > > +      * which determines which stats the object is counted against=
.  The
> > > > +      * callback is called under table_lock.  Racing against objec=
t status
> > > > +      * change is "harmless", and the callback can expect to not r=
ace
> > > > +      * against object destruction.
> > > > +      */
> > > > +     enum drm_gem_object_status (*status)(struct drm_gem_object *o=
bj);
> > >
> > > Does this needs to be in object funcs and couldn't be consolidated to
> > > driver level?
> > >
> > > Regards,
> > >
> > > Tvrtko
> > >
> > > > +
> > > >       /**
> > > >        * @vm_ops:
> > > >        *
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
