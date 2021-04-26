Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8684336B6DC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 18:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161146E529;
	Mon, 26 Apr 2021 16:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CAA46E529
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 16:32:16 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id n2so3394713wrm.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 09:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=DSddSBC25NBuTxIEN9ejSZuOSQJJ3I77VRmPNEgH8ew=;
 b=MP1XOqRDjh2cqCNvbiPKV5Ql4a4PUo0JWaxEcCwA4LnGWlClkOsO6KCyPDV1zJEKap
 qFj2C8H4svBMefEZznprg9YZL+Rp5ojCOOpLPBTM5e/eXA7dJIM8B2ff/zW82zqumqyz
 oFqfNXv7X8Qky17RRboGgc6q9hb0I+Ato6jhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DSddSBC25NBuTxIEN9ejSZuOSQJJ3I77VRmPNEgH8ew=;
 b=d+Qu13+V4r0dSbk4ymwfUIJAMaKfrJlBJVHXf9P8O+5LFprdU0uvwj/qtoo8tj7x87
 EhODfGW/iYvtoS9v+CowlDCusG2G0iasXi4KnNOmFP/EeCQ4l0rj7h7Tly3SjFGTChTc
 zI9RDi0R+IXlTHxtn57HVxjiYVINDr+Z51p+3dHF7JZmdfMI9wuPhVN0iF8UIG8JCPE+
 ZQfaT6ewSf+rs4taaRtZz0lISu8F6m5yYfwwbuqbe2LCwokn3pIxrP3Q2Jpe/3jOdFDB
 gGie5Yr0oGUaxeu7iE96RToDRgFDe2rGy/r0/ONXzpu5GrN8mN1mNZcII+CcpnO5K+Ui
 kQog==
X-Gm-Message-State: AOAM532yG8DvjYvSthy7i98dXqnFLm72j1s7yyRBxpHpoibXiFp1X3aJ
 VAjFeJemviDnKW3lNXJ3ua1WOw==
X-Google-Smtp-Source: ABdhPJxT8xHZl383ZtZabVqMVnC062p//g5ClCZHyFLtAD8IA1Ez2Db40VI/775avkjGAct4os3UEw==
X-Received: by 2002:a5d:4850:: with SMTP id n16mr24233377wrs.294.1619454735516; 
 Mon, 26 Apr 2021 09:32:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z7sm785651wrl.11.2021.04.26.09.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 09:32:14 -0700 (PDT)
Date: Mon, 26 Apr 2021 18:32:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 1/9] drm/doc/rfc: i915 DG1 uAPI
Message-ID: <YIbrDMWHi9I7Dnx5@phenom.ffwll.local>
References: <20210426093901.28937-1-matthew.auld@intel.com>
 <CAOFGe965NSUgspU0-EC1+k4NzXrJNs+j=Aek9SPECvBrq8vGDA@mail.gmail.com>
 <ab1d4029-df0b-61a9-de56-3e66ef4e9d4e@intel.com>
 <CAOFGe95efhHeR4EXarCfA+mfU=00KVaTgyTCnj3=-r5T=_gYVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOFGe95efhHeR4EXarCfA+mfU=00KVaTgyTCnj3=-r5T=_gYVQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>, Jordan Justen <jordan.l.justen@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 26, 2021 at 11:25:09AM -0500, Jason Ekstrand wrote:
> On Mon, Apr 26, 2021 at 10:31 AM Matthew Auld <matthew.auld@intel.com> wr=
ote:
> >
> > On 26/04/2021 16:11, Jason Ekstrand wrote:
> > > On Mon, Apr 26, 2021 at 4:42 AM Matthew Auld <matthew.auld@intel.com>=
 wrote:
> > >>
> > >> Add an entry for the new uAPI needed for DG1. Also add the overall
> > >> upstream plan, including some notes for the TTM conversion.
> > >>
> > >> v2(Daniel):
> > >>    - include the overall upstreaming plan
> > >>    - add a note for mmap, there are differences here for TTM vs i915
> > >>    - bunch of other suggestions from Daniel
> > >> v3:
> > >>   (Daniel)
> > >>    - add a note for set/get caching stuff
> > >>    - add some more docs for existing query and extensions stuff
> > >>    - add an actual code example for regions query
> > >>    - bunch of other stuff
> > >>   (Jason)
> > >>    - uAPI change(!):
> > >>          - try a simpler design with the placements extension
> > >>          - rather than have a generic setparam which can cover multi=
ple
> > >>            use cases, have each extension be responsible for one thi=
ng
> > >>            only
> > >> v4:
> > >>   (Daniel)
> > >>    - add some more notes for ttm conversion
> > >>    - bunch of other stuff
> > >>   (Jason)
> > >>    - uAPI change(!):
> > >>          - drop all the extra rsvd members for the region_query and
> > >>            region_info, just keep the bare minimum needed for padding
> > >>
> > >> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > >> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > >> Cc: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> > >> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > >> Cc: Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>
> > >> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> > >> Cc: Jordan Justen <jordan.l.justen@intel.com>
> > >> Cc: Daniel Vetter <daniel.vetter@intel.com>
> > >> Cc: Kenneth Graunke <kenneth@whitecape.org>
> > >> Cc: Jason Ekstrand <jason@jlekstrand.net>
> > >> Cc: Dave Airlie <airlied@gmail.com>
> > >> Cc: dri-devel@lists.freedesktop.org
> > >> Cc: mesa-dev@lists.freedesktop.org
> > >> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > >> Acked-by: Dave Airlie <airlied@redhat.com>
> > >> ---
> > >>   Documentation/gpu/rfc/i915_gem_lmem.h   | 212 ++++++++++++++++++++=
++++
> > >>   Documentation/gpu/rfc/i915_gem_lmem.rst | 130 +++++++++++++++
> > >>   Documentation/gpu/rfc/index.rst         |   4 +
> > >>   3 files changed, 346 insertions(+)
> > >>   create mode 100644 Documentation/gpu/rfc/i915_gem_lmem.h
> > >>   create mode 100644 Documentation/gpu/rfc/i915_gem_lmem.rst
> > >>
> > >> diff --git a/Documentation/gpu/rfc/i915_gem_lmem.h b/Documentation/g=
pu/rfc/i915_gem_lmem.h
> > >> new file mode 100644
> > >> index 000000000000..7ed59b6202d5
> > >> --- /dev/null
> > >> +++ b/Documentation/gpu/rfc/i915_gem_lmem.h
> > >> @@ -0,0 +1,212 @@
> > >> +/**
> > >> + * enum drm_i915_gem_memory_class - Supported memory classes
> > >> + */
> > >> +enum drm_i915_gem_memory_class {
> > >> +       /** @I915_MEMORY_CLASS_SYSTEM: System memory */
> > >> +       I915_MEMORY_CLASS_SYSTEM =3D 0,
> > >> +       /** @I915_MEMORY_CLASS_DEVICE: Device local-memory */
> > >> +       I915_MEMORY_CLASS_DEVICE,
> > >> +};
> > >> +
> > >> +/**
> > >> + * struct drm_i915_gem_memory_class_instance - Identify particular =
memory region
> > >> + */
> > >> +struct drm_i915_gem_memory_class_instance {
> > >> +       /** @memory_class: See enum drm_i915_gem_memory_class */
> > >> +       __u16 memory_class;
> > >> +
> > >> +       /** @memory_instance: Which instance */
> > >> +       __u16 memory_instance;
> > >> +};
> > >> +
> > >> +/**
> > >> + * struct drm_i915_memory_region_info - Describes one region as kno=
wn to the
> > >> + * driver.
> > >> + *
> > >> + * Note that we reserve some stuff here for potential future work. =
As an example
> > >> + * we might want expose the capabilities(see @caps) for a given reg=
ion, which
> > >> + * could include things like if the region is CPU mappable/accessib=
le, what are
> > >> + * the supported mapping types etc.
> > >> + *
> > >> + * Note this is using both struct drm_i915_query_item and struct dr=
m_i915_query.
> > >> + * For this new query we are adding the new query id DRM_I915_QUERY=
_MEMORY_REGIONS
> > >> + * at &drm_i915_query_item.query_id.
> > >> + */
> > >> +struct drm_i915_memory_region_info {
> > >> +       /** @region: The class:instance pair encoding */
> > >> +       struct drm_i915_gem_memory_class_instance region;
> > >> +
> > >> +       /** @pad: MBZ */
> > >> +       __u32 pad;
> > >> +
> > >> +       /** @caps: MBZ */
> > >> +       __u64 caps;
> > >> +
> > >> +       /** @probed_size: Memory probed by the driver (-1 =3D unknow=
n) */
> > >> +       __u64 probed_size;
> > >> +
> > >> +       /** @unallocated_size: Estimate of memory remaining (-1 =3D =
unknown) */
> > >> +       __u64 unallocated_size;
> > >> +};
> > >> +
> > >> +/**
> > >> + * struct drm_i915_query_memory_regions
> > >> + *
> > >> + * The region info query enumerates all regions known to the driver=
 by filling
> > >> + * in an array of struct drm_i915_memory_region_info structures.
> > >> + *
> > >> + * Example for getting the list of supported regions:
> > >> + *
> > >> + * .. code-block:: C
> > >> + *
> > >> + *     struct drm_i915_query_memory_regions *info;
> > >> + *     struct drm_i915_query_item item =3D {
> > >> + *             .query_id =3D DRM_I915_QUERY_MEMORY_REGIONS;
> > >> + *     };
> > >> + *     struct drm_i915_query query =3D {
> > >> + *             .num_items =3D 1,
> > >> + *             .items_ptr =3D (uintptr_t)&item,
> > >> + *     };
> > >> + *     int err, i;
> > >> + *
> > >> + *     // First query the size of the blob we need, this needs to b=
e large
> > >> + *     // enough to hold our array of regions. The kernel will fill=
 out the
> > >> + *     // item.length for us, which is the number of bytes we need.
> > >> + *     err =3D ioctl(fd, DRM_IOCTL_I915_QUERY, &query);
> > >> + *     if (err) ...
> > >> + *
> > >> + *     info =3D calloc(1, item.length);
> > >> + *     // Now that we allocated the required number of bytes, we ca=
ll the ioctl
> > >> + *     // again, this time with the data_ptr pointing to our newly =
allocated
> > >> + *     // blob, which the kernel can then populate with the all the=
 region info.
> > >> + *     item.data_ptr =3D (uintptr_t)&info,
> > >> + *
> > >> + *     err =3D ioctl(fd, DRM_IOCTL_I915_QUERY, &query);
> > >> + *     if (err) ...
> > >> + *
> > >> + *     // We can now access each region in the array
> > >> + *     for (i =3D 0; i < info->num_regions; i++) {
> > >> + *             struct drm_i915_memory_region_info mr =3D info->regi=
ons[i];
> > >> + *             u16 class =3D mr.region.class;
> > >> + *             u16 instance =3D mr.region.instance;
> > >> + *
> > >> + *             ....
> > >> + *     }
> > >> + *
> > >> + *     free(info);
> > >> + */
> > >> +struct drm_i915_query_memory_regions {
> > >> +       /** @num_regions: Number of supported regions */
> > >> +       __u32 num_regions;
> > >> +
> > >> +       /** @pad: MBZ */
> > >> +       __u32 pad;
> > >> +
> > >> +       /** @regions: Info about each supported region */
> > >> +       struct drm_i915_memory_region_info regions[];
> > >> +};
> > >> +
> > >> +#define DRM_I915_GEM_CREATE_EXT                0xdeadbeaf
> > >> +#define DRM_IOCTL_I915_GEM_CREATE_EXT  DRM_IOWR(DRM_COMMAND_BASE + =
DRM_I915_GEM_CREATE_EXT, struct drm_i915_gem_create_ext)
> > >
> > > Here's another thought:  Instead of burning a new IOCTL number, should
> > > we just re-use DRM_I915_GEM_CREATE?  The different structure size
> > > should let us tell the two apart.
> >
> > Yeah, it was exactly like that in the original version[1]. Scrolling
> > through the review comments, I think the concern was with an older
> > kernel just silently ignoring the extensions with new userspace.
> >
> > [1] https://patchwork.freedesktop.org/patch/404455/?series=3D84344&rev=
=3D1
> =

> Yeah, I think Chris is right.  I just dug through the code and there
> really is no way for us to reject different sized structs; they just
> show up zero-extended.  That's aggravating.

I'm not sure why that's a big deal? Userspace doing nonsense isn't really
an issue, as long as we have a getparam or similar for announcing the
flags.

But also we're not that limited yet on ioctl numbers (but when they're
gone, they're gone), so *shrug*.
-Daniel

> =

> --Jason
> =

> > >
> > > --Jason
> > >
> > >
> > >> +
> > >> +/**
> > >> + * struct drm_i915_gem_create_ext - Existing gem_create behaviour, =
with added
> > >> + * extension support using struct i915_user_extension.
> > >> + *
> > >> + * Note that in the future we want to have our buffer flags here, a=
t least for
> > >> + * the stuff that is immutable. Previously we would have two ioctls=
, one to
> > >> + * create the object with gem_create, and another to apply various =
parameters,
> > >> + * however this creates some ambiguity for the params which are con=
sidered
> > >> + * immutable. Also in general we're phasing out the various SET/GET=
 ioctls.
> > >> + */
> > >> +struct drm_i915_gem_create_ext {
> > >> +       /**
> > >> +        * @size: Requested size for the object.
> > >> +        *
> > >> +        * The (page-aligned) allocated size for the object will be =
returned.
> > >> +        *
> > >> +        * Note that for some devices we have might have further min=
imum
> > >> +        * page-size restrictions(larger than 4K), like for device l=
ocal-memory.
> > >> +        * However in general the final size here should always refl=
ect any
> > >> +        * rounding up, if for example using the I915_GEM_CREATE_EXT=
_MEMORY_REGIONS
> > >> +        * extension to place the object in device local-memory.
> > >> +        */
> > >> +       __u64 size;
> > >> +       /**
> > >> +        * @handle: Returned handle for the object.
> > >> +        *
> > >> +        * Object handles are nonzero.
> > >> +        */
> > >> +       __u32 handle;
> > >> +       /** @flags: MBZ */
> > >> +       __u32 flags;
> > >> +       /**
> > >> +        * @extensions: The chain of extensions to apply to this obj=
ect.
> > >> +        *
> > >> +        * This will be useful in the future when we need to support=
 several
> > >> +        * different extensions, and we need to apply more than one =
when
> > >> +        * creating the object. See struct i915_user_extension.
> > >> +        *
> > >> +        * If we don't supply any extensions then we get the same ol=
d gem_create
> > >> +        * behaviour.
> > >> +        *
> > >> +        * For I915_GEM_CREATE_EXT_MEMORY_REGIONS usage see
> > >> +        * struct drm_i915_gem_create_ext_memory_regions.
> > >> +        */
> > >> +#define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
> > >> +       __u64 extensions;
> > >> +};
> > >> +
> > >> +/**
> > >> + * struct drm_i915_gem_create_ext_memory_regions - The
> > >> + * I915_GEM_CREATE_EXT_MEMORY_REGIONS extension.
> > >> + *
> > >> + * Set the object with the desired set of placements/regions in pri=
ority
> > >> + * order. Each entry must be unique and supported by the device.
> > >> + *
> > >> + * This is provided as an array of struct drm_i915_gem_memory_class=
_instance, or
> > >> + * an equivalent layout of class:instance pair encodings. See struct
> > >> + * drm_i915_query_memory_regions and DRM_I915_QUERY_MEMORY_REGIONS =
for how to
> > >> + * query the supported regions for a device.
> > >> + *
> > >> + * As an example, on discrete devices, if we wish to set the placem=
ent as
> > >> + * device local-memory we can do something like:
> > >> + *
> > >> + * .. code-block:: C
> > >> + *
> > >> + *     struct drm_i915_gem_memory_class_instance region_lmem =3D {
> > >> + *              .memory_class =3D I915_MEMORY_CLASS_DEVICE,
> > >> + *              .memory_instance =3D 0,
> > >> + *      };
> > >> + *      struct drm_i915_gem_create_ext_memory_regions regions =3D {
> > >> + *              .base =3D { .name =3D I915_GEM_CREATE_EXT_MEMORY_RE=
GIONS },
> > >> + *              .regions =3D (uintptr_t)&region_lmem,
> > >> + *              .num_regions =3D 1,
> > >> + *      };
> > >> + *      struct drm_i915_gem_create_ext create_ext =3D {
> > >> + *              .size =3D 16 * PAGE_SIZE,
> > >> + *              .extensions =3D (uintptr_t)&regions,
> > >> + *      };
> > >> + *
> > >> + *      int err =3D ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &creat=
e_ext);
> > >> + *      if (err) ...
> > >> + *
> > >> + * At which point we get the object handle in &drm_i915_gem_create_=
ext.handle,
> > >> + * along with the final object size in &drm_i915_gem_create_ext.siz=
e, which
> > >> + * should account for any rounding up, if required.
> > >> + */
> > >> +struct drm_i915_gem_create_ext_memory_regions {
> > >> +       /** @base: Extension link. See struct i915_user_extension. */
> > >> +       struct i915_user_extension base;
> > >> +
> > >> +       /** @pad: MBZ */
> > >> +       __u32 pad;
> > >> +       /** @num_regions: Number of elements in the @regions array. =
*/
> > >> +       __u32 num_regions;
> > >> +       /**
> > >> +        * @regions: The regions/placements array.
> > >> +        *
> > >> +        * An array of struct drm_i915_gem_memory_class_instance.
> > >> +        */
> > >> +       __u64 regions;
> > >> +};
> > >> diff --git a/Documentation/gpu/rfc/i915_gem_lmem.rst b/Documentation=
/gpu/rfc/i915_gem_lmem.rst
> > >> new file mode 100644
> > >> index 000000000000..462f1efd9003
> > >> --- /dev/null
> > >> +++ b/Documentation/gpu/rfc/i915_gem_lmem.rst
> > >> @@ -0,0 +1,130 @@
> > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > >> +I915 DG1/LMEM RFC Section
> > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > >> +
> > >> +Upstream plan
> > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >> +For upstream the overall plan for landing all the DG1 stuff and tur=
ning it for
> > >> +real, with all the uAPI bits is:
> > >> +
> > >> +* Merge basic HW enabling of DG1(still without pciid)
> > >> +* Merge the uAPI bits behind special CONFIG_BROKEN(or so) flag
> > >> +        * At this point we can still make changes, but importantly =
this lets us
> > >> +          start running IGTs which can utilize local-memory in CI
> > >> +* Convert over to TTM, make sure it all keeps working. Some of the =
work items:
> > >> +        * TTM shrinker for discrete
> > >> +        * dma_resv_lockitem for full dma_resv_lock, i.e not just tr=
ylock
> > >> +        * Use TTM CPU pagefault handler
> > >> +        * Route shmem backend over to TTM SYSTEM for discrete
> > >> +        * TTM purgeable object support
> > >> +        * Move i915 buddy allocator over to TTM
> > >> +        * MMAP ioctl mode(see `I915 MMAP`_)
> > >> +        * SET/GET ioctl caching(see `I915 SET/GET CACHING`_)
> > >> +* Add pciid for DG1 and turn on uAPI for real
> > >> +
> > >> +New object placement and region query uAPI
> > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >> +Starting from DG1 we need to give userspace the ability to allocate=
 buffers from
> > >> +device local-memory. Currently the driver supports gem_create, whic=
h can place
> > >> +buffers in system memory via shmem, and the usual assortment of oth=
er
> > >> +interfaces, like dumb buffers and userptr.
> > >> +
> > >> +To support this new capability, while also providing a uAPI which w=
ill work
> > >> +beyond just DG1, we propose to offer three new bits of uAPI:
> > >> +
> > >> +DRM_I915_QUERY_MEMORY_REGIONS
> > >> +-----------------------------
> > >> +New query ID which allows userspace to discover the list of support=
ed memory
> > >> +regions(like system-memory and local-memory) for a given device. We=
 identify
> > >> +each region with a class and instance pair, which should be unique.=
 The class
> > >> +here would be DEVICE or SYSTEM, and the instance would be zero, on =
platforms
> > >> +like DG1.
> > >> +
> > >> +Side note: The class/instance design is borrowed from our existing =
engine uAPI,
> > >> +where we describe every physical engine in terms of its class, and =
the
> > >> +particular instance, since we can have more than one per class.
> > >> +
> > >> +In the future we also want to expose more information which can fur=
ther
> > >> +describe the capabilities of a region.
> > >> +
> > >> +.. kernel-doc:: Documentation/gpu/rfc/i915_gem_lmem.h
> > >> +        :functions: drm_i915_gem_memory_class drm_i915_gem_memory_c=
lass_instance drm_i915_memory_region_info drm_i915_query_memory_regions
> > >> +
> > >> +GEM_CREATE_EXT
> > >> +--------------
> > >> +New ioctl which is basically just gem_create but now allows userspa=
ce to
> > >> +provide a chain of possible extensions. Note that if we don't provi=
de any
> > >> +extensions then we get the exact same behaviour as gem_create.
> > >> +
> > >> +Side note: We also need to support PXP[1] in the near future, which=
 is also
> > >> +applicable to integrated platforms, and adds its own gem_create_ext=
 extension,
> > >> +which basically lets userspace mark a buffer as "protected".
> > >> +
> > >> +.. kernel-doc:: Documentation/gpu/rfc/i915_gem_lmem.h
> > >> +        :functions: drm_i915_gem_create_ext
> > >> +
> > >> +I915_GEM_CREATE_EXT_MEMORY_REGIONS
> > >> +----------------------------------
> > >> +Implemented as an extension for gem_create_ext, we would now allow =
userspace to
> > >> +optionally provide an immutable list of preferred placements at cre=
ation time,
> > >> +in priority order, for a given buffer object.  For the placements w=
e expect
> > >> +them each to use the class/instance encoding, as per the output of =
the regions
> > >> +query. Having the list in priority order will be useful in the futu=
re when
> > >> +placing an object, say during eviction.
> > >> +
> > >> +.. kernel-doc:: Documentation/gpu/rfc/i915_gem_lmem.h
> > >> +        :functions: drm_i915_gem_create_ext_memory_regions
> > >> +
> > >> +One fair criticism here is that this seems a little over-engineered=
[2]. If we
> > >> +just consider DG1 then yes, a simple gem_create.flags or something =
is totally
> > >> +all that's needed to tell the kernel to allocate the buffer in loca=
l-memory or
> > >> +whatever. However looking to the future we need uAPI which can also=
 support
> > >> +upcoming Xe HP multi-tile architecture in a sane way, where there c=
an be
> > >> +multiple local-memory instances for a given device, and so using bo=
th class and
> > >> +instance in our uAPI to describe regions is desirable, although spe=
cifically
> > >> +for DG1 it's uninteresting, since we only have a single local-memor=
y instance.
> > >> +
> > >> +Existing uAPI issues
> > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >> +Some potential issues we still need to resolve.
> > >> +
> > >> +I915 MMAP
> > >> +---------
> > >> +In i915 there are multiple ways to MMAP GEM object, including mappi=
ng the same
> > >> +object using different mapping types(WC vs WB), i.e multiple active=
 mmaps per
> > >> +object. TTM expects one MMAP at most for the lifetime of the object=
. If it
> > >> +turns out that we have to backpedal here, there might be some poten=
tial
> > >> +userspace fallout.
> > >> +
> > >> +I915 SET/GET CACHING
> > >> +--------------------
> > >> +In i915 we have set/get_caching ioctl. TTM doesn't let us to change=
 this, but
> > >> +DG1 doesn't support non-snooped pcie transactions, so we can just a=
lways
> > >> +allocate as WB for smem-only buffers.  If/when our hw gains support=
 for
> > >> +non-snooped pcie transactions then we must fix this mode at allocat=
ion time as
> > >> +a new GEM extension.
> > >> +
> > >> +This is related to the mmap problem, because in general (meaning, w=
hen we're
> > >> +not running on intel cpus) the cpu mmap must not, ever, be inconsis=
tent with
> > >> +allocation mode.
> > >> +
> > >> +Possible idea is to let the kernel picks the mmap mode for userspac=
e from the
> > >> +following table:
> > >> +
> > >> +smem-only: WB. Userspace does not need to call clflush.
> > >> +
> > >> +smem+lmem: We allocate uncached memory, and give userspace a WC map=
ping
> > >> +for when the buffer is in smem, and WC when it's in lmem. GPU does =
snooped
> > >> +access, which is a bit inefficient.
> > >> +
> > >> +lmem only: always WC
> > >> +
> > >> +This means on discrete you only get a single mmap mode, all others =
must be
> > >> +rejected. That's probably going to be a new default mode or somethi=
ng like
> > >> +that.
> > >> +
> > >> +Links
> > >> +=3D=3D=3D=3D=3D
> > >> +[1] https://patchwork.freedesktop.org/series/86798/
> > >> +
> > >> +[2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/5599#=
note_553791
> > >> diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc=
/index.rst
> > >> index a8621f7dab8b..05670442ca1b 100644
> > >> --- a/Documentation/gpu/rfc/index.rst
> > >> +++ b/Documentation/gpu/rfc/index.rst
> > >> @@ -15,3 +15,7 @@ host such documentation:
> > >>
> > >>   * Once the code has landed move all the documentation to the right=
 places in
> > >>     the main core, helper or driver sections.
> > >> +
> > >> +.. toctree::
> > >> +
> > >> +    i915_gem_lmem.rst
> > >> --
> > >> 2.26.3
> > >>

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
