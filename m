Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5EF15F627
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 19:51:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD986FB94;
	Fri, 14 Feb 2020 18:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669306FB92;
 Fri, 14 Feb 2020 18:51:46 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t3so12089151wru.7;
 Fri, 14 Feb 2020 10:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ikQXKcsF3Gob7KzmD6dmWmAwfxdpbqe4u57iz+TtkQU=;
 b=jLpB7Grga0+IUhbkdNJ/kipRr5z4eM8YKipZpF8LAVAA1DJtwN93Nu8Ne1QQKk166E
 qT6PbdaVUIuE2lOoADoJpeu9hFF33zi2Ui1TOHXqkAJLJNqyOWT6evxgNDeyzqJs0W+r
 Zj+Clc1oGjwaSr6njP1givNp1ZWPjgJTC2Q9znMD48ezsBvfAWqHbZF4d0+b4oinHGgh
 9VCbnmO5wXdF30HHvDwNQ+e5oBldOd34Rsb2xdxS4f7pRDYCLClFhgB1Bj63831ZOTjh
 rN3Ky/LN3Tuw/aJdxQ0th1PGxq7iAkLALcP/1pOobUNDevn9XuOVxSlEPGceZj1dpHH+
 tEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ikQXKcsF3Gob7KzmD6dmWmAwfxdpbqe4u57iz+TtkQU=;
 b=fs1slFwmMMqioi510CY8cWqmIwxkIupesV+5ZT7OaKJtqSxnB3W0nWaZyke5fny8Oq
 9+p17ZzpD1OOndiEZ9yY8XCn79jePPbLTjSGtSlcO20iRA2SAi4mc2gq38NRuWUWRU5H
 IQEgyGNPyQCjmLZo3evsSM/dg1U/iz/SLz617Y2lODxotlSYb7UX6dhjHP3zz29QxDB8
 5j0piZZ8DaIRmF21HrOFdse9hclNAkdLcMy1M33JRLd/C/B7Hm5xzeTLfSOIDIS8oASJ
 LiMv+7peNgx7jZp48x3SqqZGACYHNE3ZnkzXMmcmSSKUFIxo805gt42QzlI3KzjQLw8M
 BCwg==
X-Gm-Message-State: APjAAAX/ydbgicyiBRY+pT7YvXZ7lQwptSHuuF+GHhNtCPaG/vKwC933
 C8mhuDKSnsxNexz+70FGVFvc5A2Tm/kF/oD5Wu+lx34e39seDg==
X-Google-Smtp-Source: APXvYqyMnXTSQV0vNhUjGYyrDojlyEkLJz+DwCEHtjNtaXhzx2XPy7/ZeYVK/n1+oGGLt6meBilkOrUWnceEwuQZPZM=
X-Received: by 2002:a5d:4a89:: with SMTP id o9mr5192671wrq.32.1581706304584;
 Fri, 14 Feb 2020 10:51:44 -0800 (PST)
MIME-Version: 1.0
References: <20200214155650.21203-1-Kenny.Ho@amd.com>
 <20200214155650.21203-10-Kenny.Ho@amd.com>
 <CAOFGe96N5gG+08rQCRC+diHKDAfxPFYEnVxDS8_udvjcBYgsPg@mail.gmail.com>
 <CAOWid-f62Uv=GZXX2V2BsQGM5A1JJG_qmyrOwd=KwZBx_sr-bg@mail.gmail.com>
 <20200214183401.GY2363188@phenom.ffwll.local>
In-Reply-To: <20200214183401.GY2363188@phenom.ffwll.local>
From: Kenny Ho <y2kenny@gmail.com>
Date: Fri, 14 Feb 2020 13:51:32 -0500
Message-ID: <CAOWid-caJHeXUnQv3MOi=9U+vdBLfewN+CrA-7jRrz0VXqatbQ@mail.gmail.com>
Subject: Re: [PATCH 09/11] drm, cgroup: Introduce lgpu as DRM cgroup resource
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: juan.zuniga-anaya@amd.com, "Greathouse, Joseph" <joseph.greathouse@amd.com>,
 Kenny Ho <Kenny.Ho@amd.com>, "Kuehling, Felix" <felix.kuehling@amd.com>,
 jsparks@cray.com, amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 lkaplan@cray.com, Alex Deucher <alexander.deucher@amd.com>, nirmoy.das@amd.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Tejun Heo <tj@kernel.org>,
 cgroups@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 damon.mcdougall@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 14, 2020 at 1:34 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> I think guidance from Tejun in previos discussions was pretty clear that
> he expects cgroups to be both a) standardized and c) sufficient clear
> meaning that end-users have a clear understanding of what happens when
> they change the resource allocation.
>
> I'm not sure lgpu here, at least as specified, passes either.

I disagree (at least on the characterization of the feedback
provided.)  I believe this series satisfied the sprite of Tejun's
guidance so far (the weight knob for lgpu, for example, was
specifically implemented base on his input.)  But, I will let Tejun
speak for himself after he considered the implementation in detail.

Regards,
Kenny


> But I also
> don't have much clue, so pulled Jason in - he understands how this all
> gets reflected to userspace apis a lot better than me.
> -Daniel
>
>
> >
> > > If it's carving up compute power, what's actually being carved up?  Time?  Execution units/waves/threads?  Even if that's the case, what advantage does it give to have it in terms of a fixed set of lgpus where each cgroup gets to pick a fixed set.  Does affinity matter that much?  Why not just say how many waves the GPU supports and that they have to be allocated in chunks of 16 waves (pulling a number out of thin air) and let the cgroup specify how many waves it wants.
> > >
> > > Don't get me wrong here.  I'm all for the notion of being able to use cgroups to carve up GPU compute resources.  However, this sounds to me like the most AMD-specific solution possible.  We (Intel) could probably do some sort of carving up as well but we'd likely want to do it with preemption and time-slicing rather than handing out specific EUs.
> >
> > This has been discussed in the RFC before
> > (https://www.spinics.net/lists/cgroups/msg23469.html.)  As mentioned
> > before, the idea of a compute unit is hardly an AMD specific thing as
> > it is in the OpenCL standard and part of the architecture of many
> > different vendors.  In addition, the interface presented here supports
> > Intel's use case.  What you described is what I considered as the
> > "anonymous resources" view of the lgpu.  What you/Intel can do, is to
> > register your device to drmcg to have 100 lgpu and users can specify
> > simply by count.  So if they want to allocate 5% for a cgroup, they
> > would set count=5.  Per the documentation in this patch: "Some DRM
> > devices may only support lgpu as anonymous resources.  In such case,
> > the significance of the position of the set bits in list will be
> > ignored."  What Intel does with the user expressed configuration of "5
> > out of 100" is entirely up to Intel (time slice if you like, change to
> > specific EUs later if you like, or make it driver configurable to
> > support both if you like.)
> >
> > Regards,
> > Kenny
> >
> > >
> > > On Fri, Feb 14, 2020 at 9:57 AM Kenny Ho <Kenny.Ho@amd.com> wrote:
> > >>
> > >> drm.lgpu
> > >>       A read-write nested-keyed file which exists on all cgroups.
> > >>       Each entry is keyed by the DRM device's major:minor.
> > >>
> > >>       lgpu stands for logical GPU, it is an abstraction used to
> > >>       subdivide a physical DRM device for the purpose of resource
> > >>       management.  This file stores user configuration while the
> > >>       drm.lgpu.effective reflects the actual allocation after
> > >>       considering the relationship between the cgroups and their
> > >>       configurations.
> > >>
> > >>       The lgpu is a discrete quantity that is device specific (i.e.
> > >>       some DRM devices may have 64 lgpus while others may have 100
> > >>       lgpus.)  The lgpu is a single quantity that can be allocated
> > >>       in three different ways denoted by the following nested keys.
> > >>
> > >>         =====     ==============================================
> > >>         weight    Allocate by proportion in relationship with
> > >>                   active sibling cgroups
> > >>         count     Allocate by amount statically, treat lgpu as
> > >>                   anonymous resources
> > >>         list      Allocate statically, treat lgpu as named
> > >>                   resource
> > >>         =====     ==============================================
> > >>
> > >>       For example:
> > >>       226:0 weight=100 count=256 list=0-255
> > >>       226:1 weight=100 count=4 list=0,2,4,6
> > >>       226:2 weight=100 count=32 list=32-63
> > >>       226:3 weight=100 count=0 list=
> > >>       226:4 weight=500 count=0 list=
> > >>
> > >>       lgpu is represented by a bitmap and uses the bitmap_parselist
> > >>       kernel function so the list key input format is a
> > >>       comma-separated list of decimal numbers and ranges.
> > >>
> > >>       Consecutively set bits are shown as two hyphen-separated decimal
> > >>       numbers, the smallest and largest bit numbers set in the range.
> > >>       Optionally each range can be postfixed to denote that only parts
> > >>       of it should be set.  The range will divided to groups of
> > >>       specific size.
> > >>       Syntax: range:used_size/group_size
> > >>       Example: 0-1023:2/256 ==> 0,1,256,257,512,513,768,769
> > >>
> > >>       The count key is the hamming weight / hweight of the bitmap.
> > >>
> > >>       Weight, count and list accept the max and default keywords.
> > >>
> > >>       Some DRM devices may only support lgpu as anonymous resources.
> > >>       In such case, the significance of the position of the set bits
> > >>       in list will be ignored.
> > >>
> > >>       The weight quantity is only in effect when static allocation
> > >>       is not used (by setting count=0) for this cgroup.  The weight
> > >>       quantity distributes lgpus that are not statically allocated by
> > >>       the siblings.  For example, given siblings cgroupA, cgroupB and
> > >>       cgroupC for a DRM device that has 64 lgpus, if cgroupA occupies
> > >>       0-63, no lgpu is available to be distributed by weight.
> > >>       Similarly, if cgroupA has list=0-31 and cgroupB has list=16-63,
> > >>       cgroupC will be starved if it tries to allocate by weight.
> > >>
> > >>       On the other hand, if cgroupA has weight=100 count=0, cgroupB
> > >>       has list=16-47, and cgroupC has weight=100 count=0, then 32
> > >>       lgpus are available to be distributed evenly between cgroupA
> > >>       and cgroupC.  In drm.lgpu.effective, cgroupA will have
> > >>       list=0-15 and cgroupC will have list=48-63.
> > >>
> > >>       This lgpu resource supports the 'allocation' and 'weight'
> > >>       resource distribution model.
> > >>
> > >> drm.lgpu.effective
> > >>       A read-only nested-keyed file which exists on all cgroups.
> > >>       Each entry is keyed by the DRM device's major:minor.
> > >>
> > >>       lgpu stands for logical GPU, it is an abstraction used to
> > >>       subdivide a physical DRM device for the purpose of resource
> > >>       management.  This file reflects the actual allocation after
> > >>       considering the relationship between the cgroups and their
> > >>       configurations in drm.lgpu.
> > >>
> > >> Change-Id: Idde0ef9a331fd67bb9c7eb8ef9978439e6452488
> > >> Signed-off-by: Kenny Ho <Kenny.Ho@amd.com>
> > >> ---
> > >>  Documentation/admin-guide/cgroup-v2.rst |  80 ++++++
> > >>  include/drm/drm_cgroup.h                |   3 +
> > >>  include/linux/cgroup_drm.h              |  22 ++
> > >>  kernel/cgroup/drm.c                     | 324 +++++++++++++++++++++++-
> > >>  4 files changed, 427 insertions(+), 2 deletions(-)
> > >>
> > >> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> > >> index ce5dc027366a..d8a41956e5c7 100644
> > >> --- a/Documentation/admin-guide/cgroup-v2.rst
> > >> +++ b/Documentation/admin-guide/cgroup-v2.rst
> > >> @@ -2120,6 +2120,86 @@ DRM Interface Files
> > >>         Set largest allocation for /dev/dri/card1 to 4MB
> > >>         echo "226:1 4m" > drm.buffer.peak.max
> > >>
> > >> +  drm.lgpu
> > >> +       A read-write nested-keyed file which exists on all cgroups.
> > >> +       Each entry is keyed by the DRM device's major:minor.
> > >> +
> > >> +       lgpu stands for logical GPU, it is an abstraction used to
> > >> +       subdivide a physical DRM device for the purpose of resource
> > >> +       management.  This file stores user configuration while the
> > >> +        drm.lgpu.effective reflects the actual allocation after
> > >> +        considering the relationship between the cgroups and their
> > >> +        configurations.
> > >> +
> > >> +       The lgpu is a discrete quantity that is device specific (i.e.
> > >> +       some DRM devices may have 64 lgpus while others may have 100
> > >> +       lgpus.)  The lgpu is a single quantity that can be allocated
> > >> +        in three different ways denoted by the following nested keys.
> > >> +
> > >> +         =====     ==============================================
> > >> +         weight    Allocate by proportion in relationship with
> > >> +                    active sibling cgroups
> > >> +         count     Allocate by amount statically, treat lgpu as
> > >> +                    anonymous resources
> > >> +         list      Allocate statically, treat lgpu as named
> > >> +                    resource
> > >> +         =====     ==============================================
> > >> +
> > >> +       For example:
> > >> +       226:0 weight=100 count=256 list=0-255
> > >> +       226:1 weight=100 count=4 list=0,2,4,6
> > >> +       226:2 weight=100 count=32 list=32-63
> > >> +       226:3 weight=100 count=0 list=
> > >> +       226:4 weight=500 count=0 list=
> > >> +
> > >> +       lgpu is represented by a bitmap and uses the bitmap_parselist
> > >> +       kernel function so the list key input format is a
> > >> +       comma-separated list of decimal numbers and ranges.
> > >> +
> > >> +       Consecutively set bits are shown as two hyphen-separated decimal
> > >> +       numbers, the smallest and largest bit numbers set in the range.
> > >> +       Optionally each range can be postfixed to denote that only parts
> > >> +       of it should be set.  The range will divided to groups of
> > >> +       specific size.
> > >> +       Syntax: range:used_size/group_size
> > >> +       Example: 0-1023:2/256 ==> 0,1,256,257,512,513,768,769
> > >> +
> > >> +       The count key is the hamming weight / hweight of the bitmap.
> > >> +
> > >> +       Weight, count and list accept the max and default keywords.
> > >> +
> > >> +       Some DRM devices may only support lgpu as anonymous resources.
> > >> +       In such case, the significance of the position of the set bits
> > >> +       in list will be ignored.
> > >> +
> > >> +       The weight quantity is only in effect when static allocation
> > >> +       is not used (by setting count=0) for this cgroup.  The weight
> > >> +       quantity distributes lgpus that are not statically allocated by
> > >> +       the siblings.  For example, given siblings cgroupA, cgroupB and
> > >> +       cgroupC for a DRM device that has 64 lgpus, if cgroupA occupies
> > >> +       0-63, no lgpu is available to be distributed by weight.
> > >> +       Similarly, if cgroupA has list=0-31 and cgroupB has list=16-63,
> > >> +       cgroupC will be starved if it tries to allocate by weight.
> > >> +
> > >> +       On the other hand, if cgroupA has weight=100 count=0, cgroupB
> > >> +       has list=16-47, and cgroupC has weight=100 count=0, then 32
> > >> +       lgpus are available to be distributed evenly between cgroupA
> > >> +       and cgroupC.  In drm.lgpu.effective, cgroupA will have
> > >> +       list=0-15 and cgroupC will have list=48-63.
> > >> +
> > >> +       This lgpu resource supports the 'allocation' and 'weight'
> > >> +       resource distribution model.
> > >> +
> > >> +  drm.lgpu.effective
> > >> +       A read-only nested-keyed file which exists on all cgroups.
> > >> +       Each entry is keyed by the DRM device's major:minor.
> > >> +
> > >> +       lgpu stands for logical GPU, it is an abstraction used to
> > >> +       subdivide a physical DRM device for the purpose of resource
> > >> +       management.  This file reflects the actual allocation after
> > >> +        considering the relationship between the cgroups and their
> > >> +        configurations in drm.lgpu.
> > >> +
> > >>  GEM Buffer Ownership
> > >>  ~~~~~~~~~~~~~~~~~~~~
> > >>
> > >> diff --git a/include/drm/drm_cgroup.h b/include/drm/drm_cgroup.h
> > >> index 2b41d4d22e33..619a110cc748 100644
> > >> --- a/include/drm/drm_cgroup.h
> > >> +++ b/include/drm/drm_cgroup.h
> > >> @@ -17,6 +17,9 @@ struct drmcg_props {
> > >>
> > >>         s64                     bo_limits_total_allocated_default;
> > >>         s64                     bo_limits_peak_allocated_default;
> > >> +
> > >> +       int                     lgpu_capacity;
> > >> +       DECLARE_BITMAP(lgpu_slots, MAX_DRMCG_LGPU_CAPACITY);
> > >>  };
> > >>
> > >>  void drmcg_bind(struct drm_minor (*(*acq_dm)(unsigned int minor_id)),
> > >> diff --git a/include/linux/cgroup_drm.h b/include/linux/cgroup_drm.h
> > >> index eae400f3d9b4..bb09704e7f71 100644
> > >> --- a/include/linux/cgroup_drm.h
> > >> +++ b/include/linux/cgroup_drm.h
> > >> @@ -11,10 +11,14 @@
> > >>  /* limit defined per the way drm_minor_alloc operates */
> > >>  #define MAX_DRM_DEV (64 * DRM_MINOR_RENDER)
> > >>
> > >> +#define MAX_DRMCG_LGPU_CAPACITY 256
> > >> +
> > >>  enum drmcg_res_type {
> > >>         DRMCG_TYPE_BO_TOTAL,
> > >>         DRMCG_TYPE_BO_PEAK,
> > >>         DRMCG_TYPE_BO_COUNT,
> > >> +       DRMCG_TYPE_LGPU,
> > >> +       DRMCG_TYPE_LGPU_EFF,
> > >>         __DRMCG_TYPE_LAST,
> > >>  };
> > >>
> > >> @@ -32,6 +36,24 @@ struct drmcg_device_resource {
> > >>         s64                     bo_limits_peak_allocated;
> > >>
> > >>         s64                     bo_stats_count_allocated;
> > >> +
> > >> +       /**
> > >> +        * Logical GPU
> > >> +        *
> > >> +        * *_cfg are properties configured by users
> > >> +        * *_eff are the effective properties being applied to the hardware
> > >> +         * *_stg is used to calculate _eff before applying to _eff
> > >> +        * after considering the entire hierarchy
> > >> +        */
> > >> +       DECLARE_BITMAP(lgpu_stg, MAX_DRMCG_LGPU_CAPACITY);
> > >> +       /* user configurations */
> > >> +       s64                     lgpu_weight_cfg;
> > >> +       DECLARE_BITMAP(lgpu_cfg, MAX_DRMCG_LGPU_CAPACITY);
> > >> +       /* effective lgpu for the cgroup after considering
> > >> +        * relationship with other cgroup
> > >> +        */
> > >> +       s64                     lgpu_count_eff;
> > >> +       DECLARE_BITMAP(lgpu_eff, MAX_DRMCG_LGPU_CAPACITY);
> > >>  };
> > >>
> > >>  /**
> > >> diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
> > >> index 5fcbbc13fa1c..a4e88a3704bb 100644
> > >> --- a/kernel/cgroup/drm.c
> > >> +++ b/kernel/cgroup/drm.c
> > >> @@ -9,6 +9,7 @@
> > >>  #include <linux/seq_file.h>
> > >>  #include <linux/mutex.h>
> > >>  #include <linux/kernel.h>
> > >> +#include <linux/bitmap.h>
> > >>  #include <linux/cgroup_drm.h>
> > >>  #include <drm/drm_file.h>
> > >>  #include <drm/drm_drv.h>
> > >> @@ -41,6 +42,10 @@ enum drmcg_file_type {
> > >>         DRMCG_FTYPE_DEFAULT,
> > >>  };
> > >>
> > >> +#define LGPU_LIMITS_NAME_LIST "list"
> > >> +#define LGPU_LIMITS_NAME_COUNT "count"
> > >> +#define LGPU_LIMITS_NAME_WEIGHT "weight"
> > >> +
> > >>  /**
> > >>   * drmcg_bind - Bind DRM subsystem to cgroup subsystem
> > >>   * @acq_dm: function pointer to the drm_minor_acquire function
> > >> @@ -98,6 +103,13 @@ static inline int init_drmcg_single(struct drmcg *drmcg, struct drm_device *dev)
> > >>         ddr->bo_limits_peak_allocated =
> > >>                 dev->drmcg_props.bo_limits_peak_allocated_default;
> > >>
> > >> +       bitmap_copy(ddr->lgpu_cfg, dev->drmcg_props.lgpu_slots,
> > >> +                       MAX_DRMCG_LGPU_CAPACITY);
> > >> +       bitmap_copy(ddr->lgpu_stg, dev->drmcg_props.lgpu_slots,
> > >> +                       MAX_DRMCG_LGPU_CAPACITY);
> > >> +
> > >> +       ddr->lgpu_weight_cfg = CGROUP_WEIGHT_DFL;
> > >> +
> > >>         return 0;
> > >>  }
> > >>
> > >> @@ -121,6 +133,120 @@ static inline void drmcg_update_cg_tree(struct drm_device *dev)
> > >>         mutex_unlock(&cgroup_mutex);
> > >>  }
> > >>
> > >> +static void drmcg_calculate_effective_lgpu(struct drm_device *dev,
> > >> +               const unsigned long *free_static,
> > >> +               const unsigned long *free_weighted,
> > >> +               struct drmcg *parent_drmcg)
> > >> +{
> > >> +       int capacity = dev->drmcg_props.lgpu_capacity;
> > >> +       DECLARE_BITMAP(lgpu_unused, MAX_DRMCG_LGPU_CAPACITY);
> > >> +       DECLARE_BITMAP(lgpu_by_weight, MAX_DRMCG_LGPU_CAPACITY);
> > >> +       struct drmcg_device_resource *parent_ddr;
> > >> +       struct drmcg_device_resource *ddr;
> > >> +       int minor = dev->primary->index;
> > >> +       struct cgroup_subsys_state *pos;
> > >> +       struct drmcg *child;
> > >> +       s64 weight_sum = 0;
> > >> +       s64 unused;
> > >> +
> > >> +       parent_ddr = parent_drmcg->dev_resources[minor];
> > >> +
> > >> +       if (bitmap_empty(parent_ddr->lgpu_cfg, capacity))
> > >> +               /* no static cfg, use weight for calculating the effective */
> > >> +               bitmap_copy(parent_ddr->lgpu_stg, free_weighted, capacity);
> > >> +       else
> > >> +               /* lgpu statically configured, use the overlap as effective */
> > >> +               bitmap_and(parent_ddr->lgpu_stg, free_static,
> > >> +                               parent_ddr->lgpu_cfg, capacity);
> > >> +
> > >> +       /* calculate lgpu available for distribution by weight for children */
> > >> +       bitmap_copy(lgpu_unused, parent_ddr->lgpu_stg, capacity);
> > >> +       css_for_each_child(pos, &parent_drmcg->css) {
> > >> +               child = css_to_drmcg(pos);
> > >> +               ddr = child->dev_resources[minor];
> > >> +
> > >> +               if (bitmap_empty(ddr->lgpu_cfg, capacity))
> > >> +                       /* no static allocation, participate in weight dist */
> > >> +                       weight_sum += ddr->lgpu_weight_cfg;
> > >> +               else
> > >> +                       /* take out statically allocated lgpu by siblings */
> > >> +                       bitmap_andnot(lgpu_unused, lgpu_unused, ddr->lgpu_cfg,
> > >> +                                       capacity);
> > >> +       }
> > >> +
> > >> +       unused = bitmap_weight(lgpu_unused, capacity);
> > >> +
> > >> +       css_for_each_child(pos, &parent_drmcg->css) {
> > >> +               child = css_to_drmcg(pos);
> > >> +               ddr = child->dev_resources[minor];
> > >> +
> > >> +               bitmap_zero(lgpu_by_weight, capacity);
> > >> +               /* no static allocation, participate in weight distribution */
> > >> +               if (bitmap_empty(ddr->lgpu_cfg, capacity)) {
> > >> +                       int c;
> > >> +                       int p = 0;
> > >> +
> > >> +                       for (c = ddr->lgpu_weight_cfg * unused / weight_sum;
> > >> +                                       c > 0; c--) {
> > >> +                               p = find_next_bit(lgpu_unused, capacity, p);
> > >> +                               if (p < capacity) {
> > >> +                                       clear_bit(p, lgpu_unused);
> > >> +                                       set_bit(p, lgpu_by_weight);
> > >> +                               }
> > >> +                       }
> > >> +
> > >> +               }
> > >> +
> > >> +               drmcg_calculate_effective_lgpu(dev, parent_ddr->lgpu_stg,
> > >> +                               lgpu_by_weight, child);
> > >> +       }
> > >> +}
> > >> +
> > >> +static void drmcg_apply_effective_lgpu(struct drm_device *dev)
> > >> +{
> > >> +       int capacity = dev->drmcg_props.lgpu_capacity;
> > >> +       int minor = dev->primary->index;
> > >> +       struct drmcg_device_resource *ddr;
> > >> +       struct cgroup_subsys_state *pos;
> > >> +       struct drmcg *drmcg;
> > >> +
> > >> +       if (root_drmcg == NULL) {
> > >> +               WARN_ON(root_drmcg == NULL);
> > >> +               return;
> > >> +       }
> > >> +
> > >> +       rcu_read_lock();
> > >> +
> > >> +       /* process the entire cgroup tree from root to simplify the algorithm */
> > >> +       drmcg_calculate_effective_lgpu(dev, dev->drmcg_props.lgpu_slots,
> > >> +                       dev->drmcg_props.lgpu_slots, root_drmcg);
> > >> +
> > >> +       /* apply changes to effective only if there is a change */
> > >> +       css_for_each_descendant_pre(pos, &root_drmcg->css) {
> > >> +               drmcg = css_to_drmcg(pos);
> > >> +               ddr = drmcg->dev_resources[minor];
> > >> +
> > >> +               if (!bitmap_equal(ddr->lgpu_stg, ddr->lgpu_eff, capacity)) {
> > >> +                       bitmap_copy(ddr->lgpu_eff, ddr->lgpu_stg, capacity);
> > >> +                       ddr->lgpu_count_eff =
> > >> +                               bitmap_weight(ddr->lgpu_eff, capacity);
> > >> +               }
> > >> +       }
> > >> +       rcu_read_unlock();
> > >> +}
> > >> +
> > >> +static void drmcg_apply_effective(enum drmcg_res_type type,
> > >> +               struct drm_device *dev, struct drmcg *changed_drmcg)
> > >> +{
> > >> +       switch (type) {
> > >> +       case DRMCG_TYPE_LGPU:
> > >> +               drmcg_apply_effective_lgpu(dev);
> > >> +               break;
> > >> +       default:
> > >> +               break;
> > >> +       }
> > >> +}
> > >> +
> > >>  /**
> > >>   * drmcg_register_dev - register a DRM device for usage in drm cgroup
> > >>   * @dev: DRM device
> > >> @@ -143,7 +269,13 @@ void drmcg_register_dev(struct drm_device *dev)
> > >>         {
> > >>                 dev->driver->drmcg_custom_init(dev, &dev->drmcg_props);
> > >>
> > >> +               WARN_ON(dev->drmcg_props.lgpu_capacity !=
> > >> +                               bitmap_weight(dev->drmcg_props.lgpu_slots,
> > >> +                                       MAX_DRMCG_LGPU_CAPACITY));
> > >> +
> > >>                 drmcg_update_cg_tree(dev);
> > >> +
> > >> +               drmcg_apply_effective(DRMCG_TYPE_LGPU, dev, root_drmcg);
> > >>         }
> > >>         mutex_unlock(&drmcg_mutex);
> > >>  }
> > >> @@ -297,7 +429,8 @@ static void drmcg_print_stats(struct drmcg_device_resource *ddr,
> > >>  }
> > >>
> > >>  static void drmcg_print_limits(struct drmcg_device_resource *ddr,
> > >> -               struct seq_file *sf, enum drmcg_res_type type)
> > >> +               struct seq_file *sf, enum drmcg_res_type type,
> > >> +               struct drm_device *dev)
> > >>  {
> > >>         if (ddr == NULL) {
> > >>                 seq_puts(sf, "\n");
> > >> @@ -311,6 +444,25 @@ static void drmcg_print_limits(struct drmcg_device_resource *ddr,
> > >>         case DRMCG_TYPE_BO_PEAK:
> > >>                 seq_printf(sf, "%lld\n", ddr->bo_limits_peak_allocated);
> > >>                 break;
> > >> +       case DRMCG_TYPE_LGPU:
> > >> +               seq_printf(sf, "%s=%lld %s=%d %s=%*pbl\n",
> > >> +                               LGPU_LIMITS_NAME_WEIGHT,
> > >> +                               ddr->lgpu_weight_cfg,
> > >> +                               LGPU_LIMITS_NAME_COUNT,
> > >> +                               bitmap_weight(ddr->lgpu_cfg,
> > >> +                                       dev->drmcg_props.lgpu_capacity),
> > >> +                               LGPU_LIMITS_NAME_LIST,
> > >> +                               dev->drmcg_props.lgpu_capacity,
> > >> +                               ddr->lgpu_cfg);
> > >> +               break;
> > >> +       case DRMCG_TYPE_LGPU_EFF:
> > >> +               seq_printf(sf, "%s=%lld %s=%*pbl\n",
> > >> +                               LGPU_LIMITS_NAME_COUNT,
> > >> +                               ddr->lgpu_count_eff,
> > >> +                               LGPU_LIMITS_NAME_LIST,
> > >> +                               dev->drmcg_props.lgpu_capacity,
> > >> +                               ddr->lgpu_eff);
> > >> +               break;
> > >>         default:
> > >>                 seq_puts(sf, "\n");
> > >>                 break;
> > >> @@ -329,6 +481,17 @@ static void drmcg_print_default(struct drmcg_props *props,
> > >>                 seq_printf(sf, "%lld\n",
> > >>                         props->bo_limits_peak_allocated_default);
> > >>                 break;
> > >> +       case DRMCG_TYPE_LGPU:
> > >> +               seq_printf(sf, "%s=%d %s=%d %s=%*pbl\n",
> > >> +                               LGPU_LIMITS_NAME_WEIGHT,
> > >> +                               CGROUP_WEIGHT_DFL,
> > >> +                               LGPU_LIMITS_NAME_COUNT,
> > >> +                               bitmap_weight(props->lgpu_slots,
> > >> +                                       props->lgpu_capacity),
> > >> +                               LGPU_LIMITS_NAME_LIST,
> > >> +                               props->lgpu_capacity,
> > >> +                               props->lgpu_slots);
> > >> +               break;
> > >>         default:
> > >>                 seq_puts(sf, "\n");
> > >>                 break;
> > >> @@ -358,7 +521,7 @@ static int drmcg_seq_show_fn(int id, void *ptr, void *data)
> > >>                 drmcg_print_stats(ddr, sf, type);
> > >>                 break;
> > >>         case DRMCG_FTYPE_LIMIT:
> > >> -               drmcg_print_limits(ddr, sf, type);
> > >> +               drmcg_print_limits(ddr, sf, type, minor->dev);
> > >>                 break;
> > >>         case DRMCG_FTYPE_DEFAULT:
> > >>                 drmcg_print_default(&minor->dev->drmcg_props, sf, type);
> > >> @@ -415,6 +578,115 @@ static int drmcg_process_limit_s64_val(char *sval, bool is_mem,
> > >>         return rc;
> > >>  }
> > >>
> > >> +static void drmcg_nested_limit_parse(struct kernfs_open_file *of,
> > >> +               struct drm_device *dev, char *attrs)
> > >> +{
> > >> +       DECLARE_BITMAP(tmp_bitmap, MAX_DRMCG_LGPU_CAPACITY);
> > >> +       DECLARE_BITMAP(chk_bitmap, MAX_DRMCG_LGPU_CAPACITY);
> > >> +       enum drmcg_res_type type =
> > >> +               DRMCG_CTF_PRIV2RESTYPE(of_cft(of)->private);
> > >> +       struct drmcg *drmcg = css_to_drmcg(of_css(of));
> > >> +       struct drmcg_props *props = &dev->drmcg_props;
> > >> +       char *cft_name = of_cft(of)->name;
> > >> +       int minor = dev->primary->index;
> > >> +       char *nested = strstrip(attrs);
> > >> +       struct drmcg_device_resource *ddr =
> > >> +               drmcg->dev_resources[minor];
> > >> +       char *attr;
> > >> +       char sname[256];
> > >> +       char sval[256];
> > >> +       s64 val;
> > >> +       int rc;
> > >> +
> > >> +       while (nested != NULL) {
> > >> +               attr = strsep(&nested, " ");
> > >> +
> > >> +               if (sscanf(attr, "%255[^=]=%255[^=]", sname, sval) != 2)
> > >> +                       continue;
> > >> +
> > >> +               switch (type) {
> > >> +               case DRMCG_TYPE_LGPU:
> > >> +                       if (strncmp(sname, LGPU_LIMITS_NAME_LIST, 256) &&
> > >> +                               strncmp(sname, LGPU_LIMITS_NAME_COUNT, 256) &&
> > >> +                               strncmp(sname, LGPU_LIMITS_NAME_WEIGHT, 256))
> > >> +                               continue;
> > >> +
> > >> +                       if (strncmp(sname, LGPU_LIMITS_NAME_WEIGHT, 256) &&
> > >> +                                       (!strcmp("max", sval) ||
> > >> +                                       !strcmp("default", sval))) {
> > >> +                               bitmap_copy(ddr->lgpu_cfg, props->lgpu_slots,
> > >> +                                               props->lgpu_capacity);
> > >> +
> > >> +                               continue;
> > >> +                       }
> > >> +
> > >> +                       if (strncmp(sname, LGPU_LIMITS_NAME_WEIGHT, 256) == 0) {
> > >> +                               rc = drmcg_process_limit_s64_val(sval,
> > >> +                                       false, CGROUP_WEIGHT_DFL,
> > >> +                                       CGROUP_WEIGHT_MAX, &val);
> > >> +
> > >> +                               if (rc || val < CGROUP_WEIGHT_MIN ||
> > >> +                                               val > CGROUP_WEIGHT_MAX) {
> > >> +                                       drmcg_pr_cft_err(drmcg, rc, cft_name,
> > >> +                                                       minor);
> > >> +                                       continue;
> > >> +                               }
> > >> +
> > >> +                               ddr->lgpu_weight_cfg = val;
> > >> +                               continue;
> > >> +                       }
> > >> +
> > >> +                       if (strncmp(sname, LGPU_LIMITS_NAME_COUNT, 256) == 0) {
> > >> +                               rc = drmcg_process_limit_s64_val(sval,
> > >> +                                       false, props->lgpu_capacity,
> > >> +                                       props->lgpu_capacity, &val);
> > >> +
> > >> +                               if (rc || val < 0) {
> > >> +                                       drmcg_pr_cft_err(drmcg, rc, cft_name,
> > >> +                                                       minor);
> > >> +                                       continue;
> > >> +                               }
> > >> +
> > >> +                               bitmap_zero(tmp_bitmap,
> > >> +                                               MAX_DRMCG_LGPU_CAPACITY);
> > >> +                               bitmap_set(tmp_bitmap, 0, val);
> > >> +                       }
> > >> +
> > >> +                       if (strncmp(sname, LGPU_LIMITS_NAME_LIST, 256) == 0) {
> > >> +                               rc = bitmap_parselist(sval, tmp_bitmap,
> > >> +                                               MAX_DRMCG_LGPU_CAPACITY);
> > >> +
> > >> +                               if (rc) {
> > >> +                                       drmcg_pr_cft_err(drmcg, rc, cft_name,
> > >> +                                                       minor);
> > >> +                                       continue;
> > >> +                               }
> > >> +
> > >> +                               bitmap_andnot(chk_bitmap, tmp_bitmap,
> > >> +                                       props->lgpu_slots,
> > >> +                                       MAX_DRMCG_LGPU_CAPACITY);
> > >> +
> > >> +                               /* user setting does not intersect with
> > >> +                                * available lgpu */
> > >> +                               if (!bitmap_empty(chk_bitmap,
> > >> +                                               MAX_DRMCG_LGPU_CAPACITY)) {
> > >> +                                       drmcg_pr_cft_err(drmcg, 0, cft_name,
> > >> +                                                       minor);
> > >> +                                       continue;
> > >> +                               }
> > >> +                       }
> > >> +
> > >> +                       bitmap_copy(ddr->lgpu_cfg, tmp_bitmap,
> > >> +                                       props->lgpu_capacity);
> > >> +
> > >> +                       break; /* DRMCG_TYPE_LGPU */
> > >> +               default:
> > >> +                       break;
> > >> +               } /* switch (type) */
> > >> +       }
> > >> +}
> > >> +
> > >> +
> > >>  /**
> > >>   * drmcg_limit_write - parse cgroup interface files to obtain user config
> > >>   *
> > >> @@ -499,9 +771,15 @@ static ssize_t drmcg_limit_write(struct kernfs_open_file *of, char *buf,
> > >>
> > >>                         ddr->bo_limits_peak_allocated = val;
> > >>                         break;
> > >> +               case DRMCG_TYPE_LGPU:
> > >> +                       drmcg_nested_limit_parse(of, dm->dev, sattr);
> > >> +                       break;
> > >>                 default:
> > >>                         break;
> > >>                 }
> > >> +
> > >> +               drmcg_apply_effective(type, dm->dev, drmcg);
> > >> +
> > >>                 mutex_unlock(&dm->dev->drmcg_mutex);
> > >>
> > >>                 mutex_lock(&drmcg_mutex);
> > >> @@ -560,12 +838,51 @@ struct cftype files[] = {
> > >>                 .private = DRMCG_CTF_PRIV(DRMCG_TYPE_BO_COUNT,
> > >>                                                 DRMCG_FTYPE_STATS),
> > >>         },
> > >> +       {
> > >> +               .name = "lgpu",
> > >> +               .seq_show = drmcg_seq_show,
> > >> +               .write = drmcg_limit_write,
> > >> +               .private = DRMCG_CTF_PRIV(DRMCG_TYPE_LGPU,
> > >> +                                               DRMCG_FTYPE_LIMIT),
> > >> +       },
> > >> +       {
> > >> +               .name = "lgpu.default",
> > >> +               .seq_show = drmcg_seq_show,
> > >> +               .flags = CFTYPE_ONLY_ON_ROOT,
> > >> +               .private = DRMCG_CTF_PRIV(DRMCG_TYPE_LGPU,
> > >> +                                               DRMCG_FTYPE_DEFAULT),
> > >> +       },
> > >> +       {
> > >> +               .name = "lgpu.effective",
> > >> +               .seq_show = drmcg_seq_show,
> > >> +               .private = DRMCG_CTF_PRIV(DRMCG_TYPE_LGPU_EFF,
> > >> +                                               DRMCG_FTYPE_LIMIT),
> > >> +       },
> > >>         { }     /* terminate */
> > >>  };
> > >>
> > >> +static int drmcg_online_fn(int id, void *ptr, void *data)
> > >> +{
> > >> +       struct drm_minor *minor = ptr;
> > >> +       struct drmcg *drmcg = data;
> > >> +
> > >> +       if (minor->type != DRM_MINOR_PRIMARY)
> > >> +               return 0;
> > >> +
> > >> +       drmcg_apply_effective(DRMCG_TYPE_LGPU, minor->dev, drmcg);
> > >> +
> > >> +       return 0;
> > >> +}
> > >> +
> > >> +static int drmcg_css_online(struct cgroup_subsys_state *css)
> > >> +{
> > >> +       return drm_minor_for_each(&drmcg_online_fn, css_to_drmcg(css));
> > >> +}
> > >> +
> > >>  struct cgroup_subsys drm_cgrp_subsys = {
> > >>         .css_alloc      = drmcg_css_alloc,
> > >>         .css_free       = drmcg_css_free,
> > >> +       .css_online     = drmcg_css_online,
> > >>         .early_init     = false,
> > >>         .legacy_cftypes = files,
> > >>         .dfl_cftypes    = files,
> > >> @@ -585,6 +902,9 @@ void drmcg_device_early_init(struct drm_device *dev)
> > >>         dev->drmcg_props.bo_limits_total_allocated_default = S64_MAX;
> > >>         dev->drmcg_props.bo_limits_peak_allocated_default = S64_MAX;
> > >>
> > >> +       dev->drmcg_props.lgpu_capacity = MAX_DRMCG_LGPU_CAPACITY;
> > >> +       bitmap_fill(dev->drmcg_props.lgpu_slots, MAX_DRMCG_LGPU_CAPACITY);
> > >> +
> > >>         drmcg_update_cg_tree(dev);
> > >>  }
> > >>  EXPORT_SYMBOL(drmcg_device_early_init);
> > >> --
> > >> 2.25.0
> > >>
> > >> _______________________________________________
> > >> dri-devel mailing list
> > >> dri-devel@lists.freedesktop.org
> > >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
