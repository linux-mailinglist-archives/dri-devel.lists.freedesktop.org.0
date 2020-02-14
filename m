Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D0715E5F0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:44:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1EC56FAD2;
	Fri, 14 Feb 2020 16:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366996E829
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 16:44:45 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id m13so11910384edb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 08:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O9Zlz/3K+WoofAl64vT2Cy4j5gM2K2u5GEvlRXXoBX4=;
 b=FSke2htdOdAPJkT/h1phEhz5SnrveN4W0dKALnp5J7gWmvIXnbcVuYnYOlr1wYdY9G
 PVDdiyDeRlhoyGHxVXP25mxhno0ZdKkq3a0mHTUinqpUER7ApsD3j38JeD8NeNgjLOm1
 EEVmm87cVwyxE0NdFKkTFR1rVuLE5qWioIsVon5ciXcD9g56FCLdQFWgaaR0FVFbcb4/
 i1Y7lTEXCYvTzOjJESpJE3C6wMRslCC4/zhWyiBdK6/F2sZu4hmJQQPN3c49AnDm+R7O
 bk9+vQbnS7TrmWdo385OX5V/3HgH2h8B61zNf8MlyX7Xk0lHm5G3AUIBmwo/ZOYD0Vh6
 EBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O9Zlz/3K+WoofAl64vT2Cy4j5gM2K2u5GEvlRXXoBX4=;
 b=QvSaovFE4pgMqLGmAcRAEJKqhf4Y5XFZAFpVaVDNDvF52V1+iRF7KVLxMvs+dikdv6
 P2MuhQSupOnA6Iw7ii7luPsNseylKE7DEMp2yKMEbumy9rktmF/2dEhV1ZONFfg41JEk
 IrC4TTtt/0R9EFNrfzLtpCh815n3hpFCp29U+qd/1AxoTPkcSnTCwR5lU8NwbDNjR5z3
 iesr9o/QkB4iDiAsa2thjKUDb7nDJ9h1ElP7/OvOYYRlwh9LyCd8DyAgIPduM1WVOLO2
 edaNnPHT/aZnFp/K/0DDj98X0nM0/xNDIGPEGbHfbYrui3duYye/BhBXtMBlprYyFPha
 n62A==
X-Gm-Message-State: APjAAAULsZPwWmsA0pfou213hz5YNSjkxJ5Q4PjFXwjo+MPQYtQZIA97
 P3hvOj3NL04+fuQhhR381cu39qOwvklCVBFg0yq/jA==
X-Google-Smtp-Source: APXvYqwmwD0436+Fw2fEWRryJZO4sdHdqk9ZGmzwj3OHfKMYl199w4ve43J+HUcnbKRSuevOy+PxC/VfLJ9QA/kb+XE=
X-Received: by 2002:a17:906:2649:: with SMTP id
 i9mr3982739ejc.120.1581698683522; 
 Fri, 14 Feb 2020 08:44:43 -0800 (PST)
MIME-Version: 1.0
References: <20200214155650.21203-1-Kenny.Ho@amd.com>
 <20200214155650.21203-10-Kenny.Ho@amd.com>
In-Reply-To: <20200214155650.21203-10-Kenny.Ho@amd.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 14 Feb 2020 10:44:31 -0600
Message-ID: <CAOFGe96N5gG+08rQCRC+diHKDAfxPFYEnVxDS8_udvjcBYgsPg@mail.gmail.com>
Subject: Re: [PATCH 09/11] drm, cgroup: Introduce lgpu as DRM cgroup resource
To: Kenny Ho <Kenny.Ho@amd.com>
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
Cc: juan.zuniga-anaya@amd.com, felix.kuehling@amd.com, jsparks@cray.com,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, lkaplan@cray.com,
 alexander.deucher@amd.com, nirmoy.das@amd.com, y2kenny@gmail.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 joseph.greathouse@amd.com, tj@kernel.org, cgroups@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 damon.mcdougall@amd.com
Content-Type: multipart/mixed; boundary="===============0811772169=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0811772169==
Content-Type: multipart/alternative; boundary="0000000000002c600b059e8bec7d"

--0000000000002c600b059e8bec7d
Content-Type: text/plain; charset="UTF-8"

Pardon my ignorance but I'm a bit confused by this.  What is a "logical
GPU"?  What are we subdividing?  Are we carving up memory?  Compute power?
Both?

If it's carving up memory, why aren't we just measuring it in megabytes?

If it's carving up compute power, what's actually being carved up?  Time?
Execution units/waves/threads?  Even if that's the case, what advantage
does it give to have it in terms of a fixed set of lgpus where each cgroup
gets to pick a fixed set.  Does affinity matter that much?  Why not just
say how many waves the GPU supports and that they have to be allocated in
chunks of 16 waves (pulling a number out of thin air) and let the cgroup
specify how many waves it wants.

Don't get me wrong here.  I'm all for the notion of being able to use
cgroups to carve up GPU compute resources.  However, this sounds to me like
the most AMD-specific solution possible.  We (Intel) could probably do some
sort of carving up as well but we'd likely want to do it with preemption
and time-slicing rather than handing out specific EUs.

--Jason


On Fri, Feb 14, 2020 at 9:57 AM Kenny Ho <Kenny.Ho@amd.com> wrote:

> drm.lgpu
>       A read-write nested-keyed file which exists on all cgroups.
>       Each entry is keyed by the DRM device's major:minor.
>
>       lgpu stands for logical GPU, it is an abstraction used to
>       subdivide a physical DRM device for the purpose of resource
>       management.  This file stores user configuration while the
>       drm.lgpu.effective reflects the actual allocation after
>       considering the relationship between the cgroups and their
>       configurations.
>
>       The lgpu is a discrete quantity that is device specific (i.e.
>       some DRM devices may have 64 lgpus while others may have 100
>       lgpus.)  The lgpu is a single quantity that can be allocated
>       in three different ways denoted by the following nested keys.
>
>         =====     ==============================================
>         weight    Allocate by proportion in relationship with
>                   active sibling cgroups
>         count     Allocate by amount statically, treat lgpu as
>                   anonymous resources
>         list      Allocate statically, treat lgpu as named
>                   resource
>         =====     ==============================================
>
>       For example:
>       226:0 weight=100 count=256 list=0-255
>       226:1 weight=100 count=4 list=0,2,4,6
>       226:2 weight=100 count=32 list=32-63
>       226:3 weight=100 count=0 list=
>       226:4 weight=500 count=0 list=
>
>       lgpu is represented by a bitmap and uses the bitmap_parselist
>       kernel function so the list key input format is a
>       comma-separated list of decimal numbers and ranges.
>
>       Consecutively set bits are shown as two hyphen-separated decimal
>       numbers, the smallest and largest bit numbers set in the range.
>       Optionally each range can be postfixed to denote that only parts
>       of it should be set.  The range will divided to groups of
>       specific size.
>       Syntax: range:used_size/group_size
>       Example: 0-1023:2/256 ==> 0,1,256,257,512,513,768,769
>
>       The count key is the hamming weight / hweight of the bitmap.
>
>       Weight, count and list accept the max and default keywords.
>
>       Some DRM devices may only support lgpu as anonymous resources.
>       In such case, the significance of the position of the set bits
>       in list will be ignored.
>
>       The weight quantity is only in effect when static allocation
>       is not used (by setting count=0) for this cgroup.  The weight
>       quantity distributes lgpus that are not statically allocated by
>       the siblings.  For example, given siblings cgroupA, cgroupB and
>       cgroupC for a DRM device that has 64 lgpus, if cgroupA occupies
>       0-63, no lgpu is available to be distributed by weight.
>       Similarly, if cgroupA has list=0-31 and cgroupB has list=16-63,
>       cgroupC will be starved if it tries to allocate by weight.
>
>       On the other hand, if cgroupA has weight=100 count=0, cgroupB
>       has list=16-47, and cgroupC has weight=100 count=0, then 32
>       lgpus are available to be distributed evenly between cgroupA
>       and cgroupC.  In drm.lgpu.effective, cgroupA will have
>       list=0-15 and cgroupC will have list=48-63.
>
>       This lgpu resource supports the 'allocation' and 'weight'
>       resource distribution model.
>
> drm.lgpu.effective
>       A read-only nested-keyed file which exists on all cgroups.
>       Each entry is keyed by the DRM device's major:minor.
>
>       lgpu stands for logical GPU, it is an abstraction used to
>       subdivide a physical DRM device for the purpose of resource
>       management.  This file reflects the actual allocation after
>       considering the relationship between the cgroups and their
>       configurations in drm.lgpu.
>
> Change-Id: Idde0ef9a331fd67bb9c7eb8ef9978439e6452488
> Signed-off-by: Kenny Ho <Kenny.Ho@amd.com>
> ---
>  Documentation/admin-guide/cgroup-v2.rst |  80 ++++++
>  include/drm/drm_cgroup.h                |   3 +
>  include/linux/cgroup_drm.h              |  22 ++
>  kernel/cgroup/drm.c                     | 324 +++++++++++++++++++++++-
>  4 files changed, 427 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/cgroup-v2.rst
> b/Documentation/admin-guide/cgroup-v2.rst
> index ce5dc027366a..d8a41956e5c7 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -2120,6 +2120,86 @@ DRM Interface Files
>         Set largest allocation for /dev/dri/card1 to 4MB
>         echo "226:1 4m" > drm.buffer.peak.max
>
> +  drm.lgpu
> +       A read-write nested-keyed file which exists on all cgroups.
> +       Each entry is keyed by the DRM device's major:minor.
> +
> +       lgpu stands for logical GPU, it is an abstraction used to
> +       subdivide a physical DRM device for the purpose of resource
> +       management.  This file stores user configuration while the
> +        drm.lgpu.effective reflects the actual allocation after
> +        considering the relationship between the cgroups and their
> +        configurations.
> +
> +       The lgpu is a discrete quantity that is device specific (i.e.
> +       some DRM devices may have 64 lgpus while others may have 100
> +       lgpus.)  The lgpu is a single quantity that can be allocated
> +        in three different ways denoted by the following nested keys.
> +
> +         =====     ==============================================
> +         weight    Allocate by proportion in relationship with
> +                    active sibling cgroups
> +         count     Allocate by amount statically, treat lgpu as
> +                    anonymous resources
> +         list      Allocate statically, treat lgpu as named
> +                    resource
> +         =====     ==============================================
> +
> +       For example:
> +       226:0 weight=100 count=256 list=0-255
> +       226:1 weight=100 count=4 list=0,2,4,6
> +       226:2 weight=100 count=32 list=32-63
> +       226:3 weight=100 count=0 list=
> +       226:4 weight=500 count=0 list=
> +
> +       lgpu is represented by a bitmap and uses the bitmap_parselist
> +       kernel function so the list key input format is a
> +       comma-separated list of decimal numbers and ranges.
> +
> +       Consecutively set bits are shown as two hyphen-separated decimal
> +       numbers, the smallest and largest bit numbers set in the range.
> +       Optionally each range can be postfixed to denote that only parts
> +       of it should be set.  The range will divided to groups of
> +       specific size.
> +       Syntax: range:used_size/group_size
> +       Example: 0-1023:2/256 ==> 0,1,256,257,512,513,768,769
> +
> +       The count key is the hamming weight / hweight of the bitmap.
> +
> +       Weight, count and list accept the max and default keywords.
> +
> +       Some DRM devices may only support lgpu as anonymous resources.
> +       In such case, the significance of the position of the set bits
> +       in list will be ignored.
> +
> +       The weight quantity is only in effect when static allocation
> +       is not used (by setting count=0) for this cgroup.  The weight
> +       quantity distributes lgpus that are not statically allocated by
> +       the siblings.  For example, given siblings cgroupA, cgroupB and
> +       cgroupC for a DRM device that has 64 lgpus, if cgroupA occupies
> +       0-63, no lgpu is available to be distributed by weight.
> +       Similarly, if cgroupA has list=0-31 and cgroupB has list=16-63,
> +       cgroupC will be starved if it tries to allocate by weight.
> +
> +       On the other hand, if cgroupA has weight=100 count=0, cgroupB
> +       has list=16-47, and cgroupC has weight=100 count=0, then 32
> +       lgpus are available to be distributed evenly between cgroupA
> +       and cgroupC.  In drm.lgpu.effective, cgroupA will have
> +       list=0-15 and cgroupC will have list=48-63.
> +
> +       This lgpu resource supports the 'allocation' and 'weight'
> +       resource distribution model.
> +
> +  drm.lgpu.effective
> +       A read-only nested-keyed file which exists on all cgroups.
> +       Each entry is keyed by the DRM device's major:minor.
> +
> +       lgpu stands for logical GPU, it is an abstraction used to
> +       subdivide a physical DRM device for the purpose of resource
> +       management.  This file reflects the actual allocation after
> +        considering the relationship between the cgroups and their
> +        configurations in drm.lgpu.
> +
>  GEM Buffer Ownership
>  ~~~~~~~~~~~~~~~~~~~~
>
> diff --git a/include/drm/drm_cgroup.h b/include/drm/drm_cgroup.h
> index 2b41d4d22e33..619a110cc748 100644
> --- a/include/drm/drm_cgroup.h
> +++ b/include/drm/drm_cgroup.h
> @@ -17,6 +17,9 @@ struct drmcg_props {
>
>         s64                     bo_limits_total_allocated_default;
>         s64                     bo_limits_peak_allocated_default;
> +
> +       int                     lgpu_capacity;
> +       DECLARE_BITMAP(lgpu_slots, MAX_DRMCG_LGPU_CAPACITY);
>  };
>
>  void drmcg_bind(struct drm_minor (*(*acq_dm)(unsigned int minor_id)),
> diff --git a/include/linux/cgroup_drm.h b/include/linux/cgroup_drm.h
> index eae400f3d9b4..bb09704e7f71 100644
> --- a/include/linux/cgroup_drm.h
> +++ b/include/linux/cgroup_drm.h
> @@ -11,10 +11,14 @@
>  /* limit defined per the way drm_minor_alloc operates */
>  #define MAX_DRM_DEV (64 * DRM_MINOR_RENDER)
>
> +#define MAX_DRMCG_LGPU_CAPACITY 256
> +
>  enum drmcg_res_type {
>         DRMCG_TYPE_BO_TOTAL,
>         DRMCG_TYPE_BO_PEAK,
>         DRMCG_TYPE_BO_COUNT,
> +       DRMCG_TYPE_LGPU,
> +       DRMCG_TYPE_LGPU_EFF,
>         __DRMCG_TYPE_LAST,
>  };
>
> @@ -32,6 +36,24 @@ struct drmcg_device_resource {
>         s64                     bo_limits_peak_allocated;
>
>         s64                     bo_stats_count_allocated;
> +
> +       /**
> +        * Logical GPU
> +        *
> +        * *_cfg are properties configured by users
> +        * *_eff are the effective properties being applied to the hardware
> +         * *_stg is used to calculate _eff before applying to _eff
> +        * after considering the entire hierarchy
> +        */
> +       DECLARE_BITMAP(lgpu_stg, MAX_DRMCG_LGPU_CAPACITY);
> +       /* user configurations */
> +       s64                     lgpu_weight_cfg;
> +       DECLARE_BITMAP(lgpu_cfg, MAX_DRMCG_LGPU_CAPACITY);
> +       /* effective lgpu for the cgroup after considering
> +        * relationship with other cgroup
> +        */
> +       s64                     lgpu_count_eff;
> +       DECLARE_BITMAP(lgpu_eff, MAX_DRMCG_LGPU_CAPACITY);
>  };
>
>  /**
> diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
> index 5fcbbc13fa1c..a4e88a3704bb 100644
> --- a/kernel/cgroup/drm.c
> +++ b/kernel/cgroup/drm.c
> @@ -9,6 +9,7 @@
>  #include <linux/seq_file.h>
>  #include <linux/mutex.h>
>  #include <linux/kernel.h>
> +#include <linux/bitmap.h>
>  #include <linux/cgroup_drm.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_drv.h>
> @@ -41,6 +42,10 @@ enum drmcg_file_type {
>         DRMCG_FTYPE_DEFAULT,
>  };
>
> +#define LGPU_LIMITS_NAME_LIST "list"
> +#define LGPU_LIMITS_NAME_COUNT "count"
> +#define LGPU_LIMITS_NAME_WEIGHT "weight"
> +
>  /**
>   * drmcg_bind - Bind DRM subsystem to cgroup subsystem
>   * @acq_dm: function pointer to the drm_minor_acquire function
> @@ -98,6 +103,13 @@ static inline int init_drmcg_single(struct drmcg
> *drmcg, struct drm_device *dev)
>         ddr->bo_limits_peak_allocated =
>                 dev->drmcg_props.bo_limits_peak_allocated_default;
>
> +       bitmap_copy(ddr->lgpu_cfg, dev->drmcg_props.lgpu_slots,
> +                       MAX_DRMCG_LGPU_CAPACITY);
> +       bitmap_copy(ddr->lgpu_stg, dev->drmcg_props.lgpu_slots,
> +                       MAX_DRMCG_LGPU_CAPACITY);
> +
> +       ddr->lgpu_weight_cfg = CGROUP_WEIGHT_DFL;
> +
>         return 0;
>  }
>
> @@ -121,6 +133,120 @@ static inline void drmcg_update_cg_tree(struct
> drm_device *dev)
>         mutex_unlock(&cgroup_mutex);
>  }
>
> +static void drmcg_calculate_effective_lgpu(struct drm_device *dev,
> +               const unsigned long *free_static,
> +               const unsigned long *free_weighted,
> +               struct drmcg *parent_drmcg)
> +{
> +       int capacity = dev->drmcg_props.lgpu_capacity;
> +       DECLARE_BITMAP(lgpu_unused, MAX_DRMCG_LGPU_CAPACITY);
> +       DECLARE_BITMAP(lgpu_by_weight, MAX_DRMCG_LGPU_CAPACITY);
> +       struct drmcg_device_resource *parent_ddr;
> +       struct drmcg_device_resource *ddr;
> +       int minor = dev->primary->index;
> +       struct cgroup_subsys_state *pos;
> +       struct drmcg *child;
> +       s64 weight_sum = 0;
> +       s64 unused;
> +
> +       parent_ddr = parent_drmcg->dev_resources[minor];
> +
> +       if (bitmap_empty(parent_ddr->lgpu_cfg, capacity))
> +               /* no static cfg, use weight for calculating the effective
> */
> +               bitmap_copy(parent_ddr->lgpu_stg, free_weighted, capacity);
> +       else
> +               /* lgpu statically configured, use the overlap as
> effective */
> +               bitmap_and(parent_ddr->lgpu_stg, free_static,
> +                               parent_ddr->lgpu_cfg, capacity);
> +
> +       /* calculate lgpu available for distribution by weight for
> children */
> +       bitmap_copy(lgpu_unused, parent_ddr->lgpu_stg, capacity);
> +       css_for_each_child(pos, &parent_drmcg->css) {
> +               child = css_to_drmcg(pos);
> +               ddr = child->dev_resources[minor];
> +
> +               if (bitmap_empty(ddr->lgpu_cfg, capacity))
> +                       /* no static allocation, participate in weight
> dist */
> +                       weight_sum += ddr->lgpu_weight_cfg;
> +               else
> +                       /* take out statically allocated lgpu by siblings
> */
> +                       bitmap_andnot(lgpu_unused, lgpu_unused,
> ddr->lgpu_cfg,
> +                                       capacity);
> +       }
> +
> +       unused = bitmap_weight(lgpu_unused, capacity);
> +
> +       css_for_each_child(pos, &parent_drmcg->css) {
> +               child = css_to_drmcg(pos);
> +               ddr = child->dev_resources[minor];
> +
> +               bitmap_zero(lgpu_by_weight, capacity);
> +               /* no static allocation, participate in weight
> distribution */
> +               if (bitmap_empty(ddr->lgpu_cfg, capacity)) {
> +                       int c;
> +                       int p = 0;
> +
> +                       for (c = ddr->lgpu_weight_cfg * unused /
> weight_sum;
> +                                       c > 0; c--) {
> +                               p = find_next_bit(lgpu_unused, capacity,
> p);
> +                               if (p < capacity) {
> +                                       clear_bit(p, lgpu_unused);
> +                                       set_bit(p, lgpu_by_weight);
> +                               }
> +                       }
> +
> +               }
> +
> +               drmcg_calculate_effective_lgpu(dev, parent_ddr->lgpu_stg,
> +                               lgpu_by_weight, child);
> +       }
> +}
> +
> +static void drmcg_apply_effective_lgpu(struct drm_device *dev)
> +{
> +       int capacity = dev->drmcg_props.lgpu_capacity;
> +       int minor = dev->primary->index;
> +       struct drmcg_device_resource *ddr;
> +       struct cgroup_subsys_state *pos;
> +       struct drmcg *drmcg;
> +
> +       if (root_drmcg == NULL) {
> +               WARN_ON(root_drmcg == NULL);
> +               return;
> +       }
> +
> +       rcu_read_lock();
> +
> +       /* process the entire cgroup tree from root to simplify the
> algorithm */
> +       drmcg_calculate_effective_lgpu(dev, dev->drmcg_props.lgpu_slots,
> +                       dev->drmcg_props.lgpu_slots, root_drmcg);
> +
> +       /* apply changes to effective only if there is a change */
> +       css_for_each_descendant_pre(pos, &root_drmcg->css) {
> +               drmcg = css_to_drmcg(pos);
> +               ddr = drmcg->dev_resources[minor];
> +
> +               if (!bitmap_equal(ddr->lgpu_stg, ddr->lgpu_eff, capacity))
> {
> +                       bitmap_copy(ddr->lgpu_eff, ddr->lgpu_stg,
> capacity);
> +                       ddr->lgpu_count_eff =
> +                               bitmap_weight(ddr->lgpu_eff, capacity);
> +               }
> +       }
> +       rcu_read_unlock();
> +}
> +
> +static void drmcg_apply_effective(enum drmcg_res_type type,
> +               struct drm_device *dev, struct drmcg *changed_drmcg)
> +{
> +       switch (type) {
> +       case DRMCG_TYPE_LGPU:
> +               drmcg_apply_effective_lgpu(dev);
> +               break;
> +       default:
> +               break;
> +       }
> +}
> +
>  /**
>   * drmcg_register_dev - register a DRM device for usage in drm cgroup
>   * @dev: DRM device
> @@ -143,7 +269,13 @@ void drmcg_register_dev(struct drm_device *dev)
>         {
>                 dev->driver->drmcg_custom_init(dev, &dev->drmcg_props);
>
> +               WARN_ON(dev->drmcg_props.lgpu_capacity !=
> +                               bitmap_weight(dev->drmcg_props.lgpu_slots,
> +                                       MAX_DRMCG_LGPU_CAPACITY));
> +
>                 drmcg_update_cg_tree(dev);
> +
> +               drmcg_apply_effective(DRMCG_TYPE_LGPU, dev, root_drmcg);
>         }
>         mutex_unlock(&drmcg_mutex);
>  }
> @@ -297,7 +429,8 @@ static void drmcg_print_stats(struct
> drmcg_device_resource *ddr,
>  }
>
>  static void drmcg_print_limits(struct drmcg_device_resource *ddr,
> -               struct seq_file *sf, enum drmcg_res_type type)
> +               struct seq_file *sf, enum drmcg_res_type type,
> +               struct drm_device *dev)
>  {
>         if (ddr == NULL) {
>                 seq_puts(sf, "\n");
> @@ -311,6 +444,25 @@ static void drmcg_print_limits(struct
> drmcg_device_resource *ddr,
>         case DRMCG_TYPE_BO_PEAK:
>                 seq_printf(sf, "%lld\n", ddr->bo_limits_peak_allocated);
>                 break;
> +       case DRMCG_TYPE_LGPU:
> +               seq_printf(sf, "%s=%lld %s=%d %s=%*pbl\n",
> +                               LGPU_LIMITS_NAME_WEIGHT,
> +                               ddr->lgpu_weight_cfg,
> +                               LGPU_LIMITS_NAME_COUNT,
> +                               bitmap_weight(ddr->lgpu_cfg,
> +                                       dev->drmcg_props.lgpu_capacity),
> +                               LGPU_LIMITS_NAME_LIST,
> +                               dev->drmcg_props.lgpu_capacity,
> +                               ddr->lgpu_cfg);
> +               break;
> +       case DRMCG_TYPE_LGPU_EFF:
> +               seq_printf(sf, "%s=%lld %s=%*pbl\n",
> +                               LGPU_LIMITS_NAME_COUNT,
> +                               ddr->lgpu_count_eff,
> +                               LGPU_LIMITS_NAME_LIST,
> +                               dev->drmcg_props.lgpu_capacity,
> +                               ddr->lgpu_eff);
> +               break;
>         default:
>                 seq_puts(sf, "\n");
>                 break;
> @@ -329,6 +481,17 @@ static void drmcg_print_default(struct drmcg_props
> *props,
>                 seq_printf(sf, "%lld\n",
>                         props->bo_limits_peak_allocated_default);
>                 break;
> +       case DRMCG_TYPE_LGPU:
> +               seq_printf(sf, "%s=%d %s=%d %s=%*pbl\n",
> +                               LGPU_LIMITS_NAME_WEIGHT,
> +                               CGROUP_WEIGHT_DFL,
> +                               LGPU_LIMITS_NAME_COUNT,
> +                               bitmap_weight(props->lgpu_slots,
> +                                       props->lgpu_capacity),
> +                               LGPU_LIMITS_NAME_LIST,
> +                               props->lgpu_capacity,
> +                               props->lgpu_slots);
> +               break;
>         default:
>                 seq_puts(sf, "\n");
>                 break;
> @@ -358,7 +521,7 @@ static int drmcg_seq_show_fn(int id, void *ptr, void
> *data)
>                 drmcg_print_stats(ddr, sf, type);
>                 break;
>         case DRMCG_FTYPE_LIMIT:
> -               drmcg_print_limits(ddr, sf, type);
> +               drmcg_print_limits(ddr, sf, type, minor->dev);
>                 break;
>         case DRMCG_FTYPE_DEFAULT:
>                 drmcg_print_default(&minor->dev->drmcg_props, sf, type);
> @@ -415,6 +578,115 @@ static int drmcg_process_limit_s64_val(char *sval,
> bool is_mem,
>         return rc;
>  }
>
> +static void drmcg_nested_limit_parse(struct kernfs_open_file *of,
> +               struct drm_device *dev, char *attrs)
> +{
> +       DECLARE_BITMAP(tmp_bitmap, MAX_DRMCG_LGPU_CAPACITY);
> +       DECLARE_BITMAP(chk_bitmap, MAX_DRMCG_LGPU_CAPACITY);
> +       enum drmcg_res_type type =
> +               DRMCG_CTF_PRIV2RESTYPE(of_cft(of)->private);
> +       struct drmcg *drmcg = css_to_drmcg(of_css(of));
> +       struct drmcg_props *props = &dev->drmcg_props;
> +       char *cft_name = of_cft(of)->name;
> +       int minor = dev->primary->index;
> +       char *nested = strstrip(attrs);
> +       struct drmcg_device_resource *ddr =
> +               drmcg->dev_resources[minor];
> +       char *attr;
> +       char sname[256];
> +       char sval[256];
> +       s64 val;
> +       int rc;
> +
> +       while (nested != NULL) {
> +               attr = strsep(&nested, " ");
> +
> +               if (sscanf(attr, "%255[^=]=%255[^=]", sname, sval) != 2)
> +                       continue;
> +
> +               switch (type) {
> +               case DRMCG_TYPE_LGPU:
> +                       if (strncmp(sname, LGPU_LIMITS_NAME_LIST, 256) &&
> +                               strncmp(sname, LGPU_LIMITS_NAME_COUNT,
> 256) &&
> +                               strncmp(sname, LGPU_LIMITS_NAME_WEIGHT,
> 256))
> +                               continue;
> +
> +                       if (strncmp(sname, LGPU_LIMITS_NAME_WEIGHT, 256) &&
> +                                       (!strcmp("max", sval) ||
> +                                       !strcmp("default", sval))) {
> +                               bitmap_copy(ddr->lgpu_cfg,
> props->lgpu_slots,
> +                                               props->lgpu_capacity);
> +
> +                               continue;
> +                       }
> +
> +                       if (strncmp(sname, LGPU_LIMITS_NAME_WEIGHT, 256)
> == 0) {
> +                               rc = drmcg_process_limit_s64_val(sval,
> +                                       false, CGROUP_WEIGHT_DFL,
> +                                       CGROUP_WEIGHT_MAX, &val);
> +
> +                               if (rc || val < CGROUP_WEIGHT_MIN ||
> +                                               val > CGROUP_WEIGHT_MAX) {
> +                                       drmcg_pr_cft_err(drmcg, rc,
> cft_name,
> +                                                       minor);
> +                                       continue;
> +                               }
> +
> +                               ddr->lgpu_weight_cfg = val;
> +                               continue;
> +                       }
> +
> +                       if (strncmp(sname, LGPU_LIMITS_NAME_COUNT, 256) ==
> 0) {
> +                               rc = drmcg_process_limit_s64_val(sval,
> +                                       false, props->lgpu_capacity,
> +                                       props->lgpu_capacity, &val);
> +
> +                               if (rc || val < 0) {
> +                                       drmcg_pr_cft_err(drmcg, rc,
> cft_name,
> +                                                       minor);
> +                                       continue;
> +                               }
> +
> +                               bitmap_zero(tmp_bitmap,
> +                                               MAX_DRMCG_LGPU_CAPACITY);
> +                               bitmap_set(tmp_bitmap, 0, val);
> +                       }
> +
> +                       if (strncmp(sname, LGPU_LIMITS_NAME_LIST, 256) ==
> 0) {
> +                               rc = bitmap_parselist(sval, tmp_bitmap,
> +                                               MAX_DRMCG_LGPU_CAPACITY);
> +
> +                               if (rc) {
> +                                       drmcg_pr_cft_err(drmcg, rc,
> cft_name,
> +                                                       minor);
> +                                       continue;
> +                               }
> +
> +                               bitmap_andnot(chk_bitmap, tmp_bitmap,
> +                                       props->lgpu_slots,
> +                                       MAX_DRMCG_LGPU_CAPACITY);
> +
> +                               /* user setting does not intersect with
> +                                * available lgpu */
> +                               if (!bitmap_empty(chk_bitmap,
> +                                               MAX_DRMCG_LGPU_CAPACITY)) {
> +                                       drmcg_pr_cft_err(drmcg, 0,
> cft_name,
> +                                                       minor);
> +                                       continue;
> +                               }
> +                       }
> +
> +                       bitmap_copy(ddr->lgpu_cfg, tmp_bitmap,
> +                                       props->lgpu_capacity);
> +
> +                       break; /* DRMCG_TYPE_LGPU */
> +               default:
> +                       break;
> +               } /* switch (type) */
> +       }
> +}
> +
> +
>  /**
>   * drmcg_limit_write - parse cgroup interface files to obtain user config
>   *
> @@ -499,9 +771,15 @@ static ssize_t drmcg_limit_write(struct
> kernfs_open_file *of, char *buf,
>
>                         ddr->bo_limits_peak_allocated = val;
>                         break;
> +               case DRMCG_TYPE_LGPU:
> +                       drmcg_nested_limit_parse(of, dm->dev, sattr);
> +                       break;
>                 default:
>                         break;
>                 }
> +
> +               drmcg_apply_effective(type, dm->dev, drmcg);
> +
>                 mutex_unlock(&dm->dev->drmcg_mutex);
>
>                 mutex_lock(&drmcg_mutex);
> @@ -560,12 +838,51 @@ struct cftype files[] = {
>                 .private = DRMCG_CTF_PRIV(DRMCG_TYPE_BO_COUNT,
>                                                 DRMCG_FTYPE_STATS),
>         },
> +       {
> +               .name = "lgpu",
> +               .seq_show = drmcg_seq_show,
> +               .write = drmcg_limit_write,
> +               .private = DRMCG_CTF_PRIV(DRMCG_TYPE_LGPU,
> +                                               DRMCG_FTYPE_LIMIT),
> +       },
> +       {
> +               .name = "lgpu.default",
> +               .seq_show = drmcg_seq_show,
> +               .flags = CFTYPE_ONLY_ON_ROOT,
> +               .private = DRMCG_CTF_PRIV(DRMCG_TYPE_LGPU,
> +                                               DRMCG_FTYPE_DEFAULT),
> +       },
> +       {
> +               .name = "lgpu.effective",
> +               .seq_show = drmcg_seq_show,
> +               .private = DRMCG_CTF_PRIV(DRMCG_TYPE_LGPU_EFF,
> +                                               DRMCG_FTYPE_LIMIT),
> +       },
>         { }     /* terminate */
>  };
>
> +static int drmcg_online_fn(int id, void *ptr, void *data)
> +{
> +       struct drm_minor *minor = ptr;
> +       struct drmcg *drmcg = data;
> +
> +       if (minor->type != DRM_MINOR_PRIMARY)
> +               return 0;
> +
> +       drmcg_apply_effective(DRMCG_TYPE_LGPU, minor->dev, drmcg);
> +
> +       return 0;
> +}
> +
> +static int drmcg_css_online(struct cgroup_subsys_state *css)
> +{
> +       return drm_minor_for_each(&drmcg_online_fn, css_to_drmcg(css));
> +}
> +
>  struct cgroup_subsys drm_cgrp_subsys = {
>         .css_alloc      = drmcg_css_alloc,
>         .css_free       = drmcg_css_free,
> +       .css_online     = drmcg_css_online,
>         .early_init     = false,
>         .legacy_cftypes = files,
>         .dfl_cftypes    = files,
> @@ -585,6 +902,9 @@ void drmcg_device_early_init(struct drm_device *dev)
>         dev->drmcg_props.bo_limits_total_allocated_default = S64_MAX;
>         dev->drmcg_props.bo_limits_peak_allocated_default = S64_MAX;
>
> +       dev->drmcg_props.lgpu_capacity = MAX_DRMCG_LGPU_CAPACITY;
> +       bitmap_fill(dev->drmcg_props.lgpu_slots, MAX_DRMCG_LGPU_CAPACITY);
> +
>         drmcg_update_cg_tree(dev);
>  }
>  EXPORT_SYMBOL(drmcg_device_early_init);
> --
> 2.25.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--0000000000002c600b059e8bec7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj5QYXJkb24gbXkgaWdub3JhbmNlIGJ1dCBJJiMzOTttIGEgYml0
IGNvbmZ1c2VkIGJ5IHRoaXMuwqAgV2hhdCBpcyBhICZxdW90O2xvZ2ljYWwgR1BVJnF1b3Q7P8Kg
IFdoYXQgYXJlIHdlIHN1YmRpdmlkaW5nP8KgIEFyZSB3ZSBjYXJ2aW5nIHVwIG1lbW9yeT/CoCBD
b21wdXRlIHBvd2VyP8KgIEJvdGg/PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JZiBpdCYjMzk7
cyBjYXJ2aW5nIHVwIG1lbW9yeSwgd2h5IGFyZW4mIzM5O3Qgd2UganVzdCBtZWFzdXJpbmcgaXQg
aW4gbWVnYWJ5dGVzPzwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SWYgaXQmIzM5O3MgY2Fydmlu
ZyB1cCBjb21wdXRlIHBvd2VyLCB3aGF0JiMzOTtzIGFjdHVhbGx5IGJlaW5nIGNhcnZlZCB1cD/C
oCBUaW1lP8KgIEV4ZWN1dGlvbiB1bml0cy93YXZlcy90aHJlYWRzP8KgIEV2ZW4gaWYgdGhhdCYj
Mzk7cyB0aGUgY2FzZSwgd2hhdCBhZHZhbnRhZ2UgZG9lcyBpdCBnaXZlIHRvIGhhdmUgaXQgaW4g
dGVybXMgb2YgYSBmaXhlZCBzZXQgb2YgbGdwdXMgd2hlcmUgZWFjaCBjZ3JvdXAgZ2V0cyB0byBw
aWNrIGEgZml4ZWQgc2V0LsKgIERvZXMgYWZmaW5pdHkgbWF0dGVyIHRoYXQgbXVjaD/CoCBXaHkg
bm90IGp1c3Qgc2F5IGhvdyBtYW55IHdhdmVzIHRoZSBHUFUgc3VwcG9ydHMgYW5kIHRoYXQgdGhl
eSBoYXZlIHRvIGJlIGFsbG9jYXRlZCBpbiBjaHVua3Mgb2YgMTYgd2F2ZXMgKHB1bGxpbmcgYSBu
dW1iZXIgb3V0IG9mIHRoaW4gYWlyKSBhbmQgbGV0IHRoZSBjZ3JvdXAgc3BlY2lmeSBob3cgbWFu
eSB3YXZlcyBpdCB3YW50cy48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkRvbiYjMzk7dCBnZXQg
bWUgd3JvbmcgaGVyZS7CoCBJJiMzOTttIGFsbCBmb3IgdGhlIG5vdGlvbiBvZiBiZWluZyBhYmxl
IHRvIHVzZSBjZ3JvdXBzIHRvIGNhcnZlIHVwIEdQVSBjb21wdXRlIHJlc291cmNlcy7CoCBIb3dl
dmVyLCB0aGlzIHNvdW5kcyB0byBtZSBsaWtlIHRoZSBtb3N0IEFNRC1zcGVjaWZpYyBzb2x1dGlv
biBwb3NzaWJsZS7CoCBXZSAoSW50ZWwpIGNvdWxkIHByb2JhYmx5IGRvIHNvbWUgc29ydCBvZiBj
YXJ2aW5nIHVwIGFzIHdlbGwgYnV0IHdlJiMzOTtkIGxpa2VseSB3YW50IHRvIGRvIGl0IHdpdGgg
cHJlZW1wdGlvbiBhbmQgdGltZS1zbGljaW5nIHJhdGhlciB0aGFuIGhhbmRpbmcgb3V0IHNwZWNp
ZmljIEVVcy48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pi0tSmFzb248L2Rpdj48ZGl2Pjxicj48
L2Rpdj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNs
YXNzPSJnbWFpbF9hdHRyIj5PbiBGcmksIEZlYiAxNCwgMjAyMCBhdCA5OjU3IEFNIEtlbm55IEhv
ICZsdDs8YSBocmVmPSJtYWlsdG86S2VubnkuSG9AYW1kLmNvbSI+S2VubnkuSG9AYW1kLmNvbTwv
YT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0
eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigy
MDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+ZHJtLmxncHU8YnI+DQrCoCDCoCDCoCBBIHJl
YWQtd3JpdGUgbmVzdGVkLWtleWVkIGZpbGUgd2hpY2ggZXhpc3RzIG9uIGFsbCBjZ3JvdXBzLjxi
cj4NCsKgIMKgIMKgIEVhY2ggZW50cnkgaXMga2V5ZWQgYnkgdGhlIERSTSBkZXZpY2UmIzM5O3Mg
bWFqb3I6bWlub3IuPGJyPg0KPGJyPg0KwqAgwqAgwqAgbGdwdSBzdGFuZHMgZm9yIGxvZ2ljYWwg
R1BVLCBpdCBpcyBhbiBhYnN0cmFjdGlvbiB1c2VkIHRvPGJyPg0KwqAgwqAgwqAgc3ViZGl2aWRl
IGEgcGh5c2ljYWwgRFJNIGRldmljZSBmb3IgdGhlIHB1cnBvc2Ugb2YgcmVzb3VyY2U8YnI+DQrC
oCDCoCDCoCBtYW5hZ2VtZW50LsKgIFRoaXMgZmlsZSBzdG9yZXMgdXNlciBjb25maWd1cmF0aW9u
IHdoaWxlIHRoZTxicj4NCsKgIMKgIMKgIGRybS5sZ3B1LmVmZmVjdGl2ZSByZWZsZWN0cyB0aGUg
YWN0dWFsIGFsbG9jYXRpb24gYWZ0ZXI8YnI+DQrCoCDCoCDCoCBjb25zaWRlcmluZyB0aGUgcmVs
YXRpb25zaGlwIGJldHdlZW4gdGhlIGNncm91cHMgYW5kIHRoZWlyPGJyPg0KwqAgwqAgwqAgY29u
ZmlndXJhdGlvbnMuPGJyPg0KPGJyPg0KwqAgwqAgwqAgVGhlIGxncHUgaXMgYSBkaXNjcmV0ZSBx
dWFudGl0eSB0aGF0IGlzIGRldmljZSBzcGVjaWZpYyAoaS5lLjxicj4NCsKgIMKgIMKgIHNvbWUg
RFJNIGRldmljZXMgbWF5IGhhdmUgNjQgbGdwdXMgd2hpbGUgb3RoZXJzIG1heSBoYXZlIDEwMDxi
cj4NCsKgIMKgIMKgIGxncHVzLinCoCBUaGUgbGdwdSBpcyBhIHNpbmdsZSBxdWFudGl0eSB0aGF0
IGNhbiBiZSBhbGxvY2F0ZWQ8YnI+DQrCoCDCoCDCoCBpbiB0aHJlZSBkaWZmZXJlbnQgd2F5cyBk
ZW5vdGVkIGJ5IHRoZSBmb2xsb3dpbmcgbmVzdGVkIGtleXMuPGJyPg0KPGJyPg0KwqAgwqAgwqAg
wqAgPT09PT3CoCDCoCDCoD09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT08YnI+DQrCoCDCoCDCoCDCoCB3ZWlnaHTCoCDCoCBBbGxvY2F0ZSBieSBwcm9wb3J0aW9u
IGluIHJlbGF0aW9uc2hpcCB3aXRoPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYWN0
aXZlIHNpYmxpbmcgY2dyb3Vwczxicj4NCsKgIMKgIMKgIMKgIGNvdW50wqAgwqAgwqBBbGxvY2F0
ZSBieSBhbW91bnQgc3RhdGljYWxseSwgdHJlYXQgbGdwdSBhczxicj4NCsKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIGFub255bW91cyByZXNvdXJjZXM8YnI+DQrCoCDCoCDCoCDCoCBsaXN0wqAg
wqAgwqAgQWxsb2NhdGUgc3RhdGljYWxseSwgdHJlYXQgbGdwdSBhcyBuYW1lZDxicj4NCsKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlc291cmNlPGJyPg0KwqAgwqAgwqAgwqAgPT09PT3CoCDC
oCDCoD09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT08YnI+DQo8
YnI+DQrCoCDCoCDCoCBGb3IgZXhhbXBsZTo8YnI+DQrCoCDCoCDCoCAyMjY6MCB3ZWlnaHQ9MTAw
IGNvdW50PTI1NiBsaXN0PTAtMjU1PGJyPg0KwqAgwqAgwqAgMjI2OjEgd2VpZ2h0PTEwMCBjb3Vu
dD00IGxpc3Q9MCwyLDQsNjxicj4NCsKgIMKgIMKgIDIyNjoyIHdlaWdodD0xMDAgY291bnQ9MzIg
bGlzdD0zMi02Mzxicj4NCsKgIMKgIMKgIDIyNjozIHdlaWdodD0xMDAgY291bnQ9MCBsaXN0PTxi
cj4NCsKgIMKgIMKgIDIyNjo0IHdlaWdodD01MDAgY291bnQ9MCBsaXN0PTxicj4NCjxicj4NCsKg
IMKgIMKgIGxncHUgaXMgcmVwcmVzZW50ZWQgYnkgYSBiaXRtYXAgYW5kIHVzZXMgdGhlIGJpdG1h
cF9wYXJzZWxpc3Q8YnI+DQrCoCDCoCDCoCBrZXJuZWwgZnVuY3Rpb24gc28gdGhlIGxpc3Qga2V5
IGlucHV0IGZvcm1hdCBpcyBhPGJyPg0KwqAgwqAgwqAgY29tbWEtc2VwYXJhdGVkIGxpc3Qgb2Yg
ZGVjaW1hbCBudW1iZXJzIGFuZCByYW5nZXMuPGJyPg0KPGJyPg0KwqAgwqAgwqAgQ29uc2VjdXRp
dmVseSBzZXQgYml0cyBhcmUgc2hvd24gYXMgdHdvIGh5cGhlbi1zZXBhcmF0ZWQgZGVjaW1hbDxi
cj4NCsKgIMKgIMKgIG51bWJlcnMsIHRoZSBzbWFsbGVzdCBhbmQgbGFyZ2VzdCBiaXQgbnVtYmVy
cyBzZXQgaW4gdGhlIHJhbmdlLjxicj4NCsKgIMKgIMKgIE9wdGlvbmFsbHkgZWFjaCByYW5nZSBj
YW4gYmUgcG9zdGZpeGVkIHRvIGRlbm90ZSB0aGF0IG9ubHkgcGFydHM8YnI+DQrCoCDCoCDCoCBv
ZiBpdCBzaG91bGQgYmUgc2V0LsKgIFRoZSByYW5nZSB3aWxsIGRpdmlkZWQgdG8gZ3JvdXBzIG9m
PGJyPg0KwqAgwqAgwqAgc3BlY2lmaWMgc2l6ZS48YnI+DQrCoCDCoCDCoCBTeW50YXg6IHJhbmdl
OnVzZWRfc2l6ZS9ncm91cF9zaXplPGJyPg0KwqAgwqAgwqAgRXhhbXBsZTogMC0xMDIzOjIvMjU2
ID09Jmd0OyAwLDEsMjU2LDI1Nyw1MTIsNTEzLDc2OCw3Njk8YnI+DQo8YnI+DQrCoCDCoCDCoCBU
aGUgY291bnQga2V5IGlzIHRoZSBoYW1taW5nIHdlaWdodCAvIGh3ZWlnaHQgb2YgdGhlIGJpdG1h
cC48YnI+DQo8YnI+DQrCoCDCoCDCoCBXZWlnaHQsIGNvdW50IGFuZCBsaXN0IGFjY2VwdCB0aGUg
bWF4IGFuZCBkZWZhdWx0IGtleXdvcmRzLjxicj4NCjxicj4NCsKgIMKgIMKgIFNvbWUgRFJNIGRl
dmljZXMgbWF5IG9ubHkgc3VwcG9ydCBsZ3B1IGFzIGFub255bW91cyByZXNvdXJjZXMuPGJyPg0K
wqAgwqAgwqAgSW4gc3VjaCBjYXNlLCB0aGUgc2lnbmlmaWNhbmNlIG9mIHRoZSBwb3NpdGlvbiBv
ZiB0aGUgc2V0IGJpdHM8YnI+DQrCoCDCoCDCoCBpbiBsaXN0IHdpbGwgYmUgaWdub3JlZC48YnI+
DQo8YnI+DQrCoCDCoCDCoCBUaGUgd2VpZ2h0IHF1YW50aXR5IGlzIG9ubHkgaW4gZWZmZWN0IHdo
ZW4gc3RhdGljIGFsbG9jYXRpb248YnI+DQrCoCDCoCDCoCBpcyBub3QgdXNlZCAoYnkgc2V0dGlu
ZyBjb3VudD0wKSBmb3IgdGhpcyBjZ3JvdXAuwqAgVGhlIHdlaWdodDxicj4NCsKgIMKgIMKgIHF1
YW50aXR5IGRpc3RyaWJ1dGVzIGxncHVzIHRoYXQgYXJlIG5vdCBzdGF0aWNhbGx5IGFsbG9jYXRl
ZCBieTxicj4NCsKgIMKgIMKgIHRoZSBzaWJsaW5ncy7CoCBGb3IgZXhhbXBsZSwgZ2l2ZW4gc2li
bGluZ3MgY2dyb3VwQSwgY2dyb3VwQiBhbmQ8YnI+DQrCoCDCoCDCoCBjZ3JvdXBDIGZvciBhIERS
TSBkZXZpY2UgdGhhdCBoYXMgNjQgbGdwdXMsIGlmIGNncm91cEEgb2NjdXBpZXM8YnI+DQrCoCDC
oCDCoCAwLTYzLCBubyBsZ3B1IGlzIGF2YWlsYWJsZSB0byBiZSBkaXN0cmlidXRlZCBieSB3ZWln
aHQuPGJyPg0KwqAgwqAgwqAgU2ltaWxhcmx5LCBpZiBjZ3JvdXBBIGhhcyBsaXN0PTAtMzEgYW5k
IGNncm91cEIgaGFzIGxpc3Q9MTYtNjMsPGJyPg0KwqAgwqAgwqAgY2dyb3VwQyB3aWxsIGJlIHN0
YXJ2ZWQgaWYgaXQgdHJpZXMgdG8gYWxsb2NhdGUgYnkgd2VpZ2h0Ljxicj4NCjxicj4NCsKgIMKg
IMKgIE9uIHRoZSBvdGhlciBoYW5kLCBpZiBjZ3JvdXBBIGhhcyB3ZWlnaHQ9MTAwIGNvdW50PTAs
IGNncm91cEI8YnI+DQrCoCDCoCDCoCBoYXMgbGlzdD0xNi00NywgYW5kIGNncm91cEMgaGFzIHdl
aWdodD0xMDAgY291bnQ9MCwgdGhlbiAzMjxicj4NCsKgIMKgIMKgIGxncHVzIGFyZSBhdmFpbGFi
bGUgdG8gYmUgZGlzdHJpYnV0ZWQgZXZlbmx5IGJldHdlZW4gY2dyb3VwQTxicj4NCsKgIMKgIMKg
IGFuZCBjZ3JvdXBDLsKgIEluIGRybS5sZ3B1LmVmZmVjdGl2ZSwgY2dyb3VwQSB3aWxsIGhhdmU8
YnI+DQrCoCDCoCDCoCBsaXN0PTAtMTUgYW5kIGNncm91cEMgd2lsbCBoYXZlIGxpc3Q9NDgtNjMu
PGJyPg0KPGJyPg0KwqAgwqAgwqAgVGhpcyBsZ3B1IHJlc291cmNlIHN1cHBvcnRzIHRoZSAmIzM5
O2FsbG9jYXRpb24mIzM5OyBhbmQgJiMzOTt3ZWlnaHQmIzM5Ozxicj4NCsKgIMKgIMKgIHJlc291
cmNlIGRpc3RyaWJ1dGlvbiBtb2RlbC48YnI+DQo8YnI+DQpkcm0ubGdwdS5lZmZlY3RpdmU8YnI+
DQrCoCDCoCDCoCBBIHJlYWQtb25seSBuZXN0ZWQta2V5ZWQgZmlsZSB3aGljaCBleGlzdHMgb24g
YWxsIGNncm91cHMuPGJyPg0KwqAgwqAgwqAgRWFjaCBlbnRyeSBpcyBrZXllZCBieSB0aGUgRFJN
IGRldmljZSYjMzk7cyBtYWpvcjptaW5vci48YnI+DQo8YnI+DQrCoCDCoCDCoCBsZ3B1IHN0YW5k
cyBmb3IgbG9naWNhbCBHUFUsIGl0IGlzIGFuIGFic3RyYWN0aW9uIHVzZWQgdG88YnI+DQrCoCDC
oCDCoCBzdWJkaXZpZGUgYSBwaHlzaWNhbCBEUk0gZGV2aWNlIGZvciB0aGUgcHVycG9zZSBvZiBy
ZXNvdXJjZTxicj4NCsKgIMKgIMKgIG1hbmFnZW1lbnQuwqAgVGhpcyBmaWxlIHJlZmxlY3RzIHRo
ZSBhY3R1YWwgYWxsb2NhdGlvbiBhZnRlcjxicj4NCsKgIMKgIMKgIGNvbnNpZGVyaW5nIHRoZSBy
ZWxhdGlvbnNoaXAgYmV0d2VlbiB0aGUgY2dyb3VwcyBhbmQgdGhlaXI8YnI+DQrCoCDCoCDCoCBj
b25maWd1cmF0aW9ucyBpbiBkcm0ubGdwdS48YnI+DQo8YnI+DQpDaGFuZ2UtSWQ6IElkZGUwZWY5
YTMzMWZkNjdiYjljN2ViOGVmOTk3ODQzOWU2NDUyNDg4PGJyPg0KU2lnbmVkLW9mZi1ieTogS2Vu
bnkgSG8gJmx0OzxhIGhyZWY9Im1haWx0bzpLZW5ueS5Ib0BhbWQuY29tIiB0YXJnZXQ9Il9ibGFu
ayI+S2VubnkuSG9AYW1kLmNvbTwvYT4mZ3Q7PGJyPg0KLS0tPGJyPg0KwqBEb2N1bWVudGF0aW9u
L2FkbWluLWd1aWRlL2Nncm91cC12Mi5yc3QgfMKgIDgwICsrKysrKzxicj4NCsKgaW5jbHVkZS9k
cm0vZHJtX2Nncm91cC5owqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgMyArPGJyPg0KwqBp
bmNsdWRlL2xpbnV4L2Nncm91cF9kcm0uaMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCAyMiArKzxi
cj4NCsKga2VybmVsL2Nncm91cC9kcm0uY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
fCAzMjQgKysrKysrKysrKysrKysrKysrKysrKystPGJyPg0KwqA0IGZpbGVzIGNoYW5nZWQsIDQy
NyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKTxicj4NCjxicj4NCmRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2Nncm91cC12Mi5yc3QgYi9Eb2N1bWVudGF0aW9uL2Fk
bWluLWd1aWRlL2Nncm91cC12Mi5yc3Q8YnI+DQppbmRleCBjZTVkYzAyNzM2NmEuLmQ4YTQxOTU2
ZTVjNyAxMDA2NDQ8YnI+DQotLS0gYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2Nncm91cC12
Mi5yc3Q8YnI+DQorKysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2Nncm91cC12Mi5yc3Q8
YnI+DQpAQCAtMjEyMCw2ICsyMTIwLDg2IEBAIERSTSBJbnRlcmZhY2UgRmlsZXM8YnI+DQrCoCDC
oCDCoCDCoCBTZXQgbGFyZ2VzdCBhbGxvY2F0aW9uIGZvciAvZGV2L2RyaS9jYXJkMSB0byA0TUI8
YnI+DQrCoCDCoCDCoCDCoCBlY2hvICZxdW90OzIyNjoxIDRtJnF1b3Q7ICZndDsgZHJtLmJ1ZmZl
ci5wZWFrLm1heDxicj4NCjxicj4NCivCoCBkcm0ubGdwdTxicj4NCivCoCDCoCDCoCDCoEEgcmVh
ZC13cml0ZSBuZXN0ZWQta2V5ZWQgZmlsZSB3aGljaCBleGlzdHMgb24gYWxsIGNncm91cHMuPGJy
Pg0KK8KgIMKgIMKgIMKgRWFjaCBlbnRyeSBpcyBrZXllZCBieSB0aGUgRFJNIGRldmljZSYjMzk7
cyBtYWpvcjptaW5vci48YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgbGdwdSBzdGFuZHMgZm9yIGxv
Z2ljYWwgR1BVLCBpdCBpcyBhbiBhYnN0cmFjdGlvbiB1c2VkIHRvPGJyPg0KK8KgIMKgIMKgIMKg
c3ViZGl2aWRlIGEgcGh5c2ljYWwgRFJNIGRldmljZSBmb3IgdGhlIHB1cnBvc2Ugb2YgcmVzb3Vy
Y2U8YnI+DQorwqAgwqAgwqAgwqBtYW5hZ2VtZW50LsKgIFRoaXMgZmlsZSBzdG9yZXMgdXNlciBj
b25maWd1cmF0aW9uIHdoaWxlIHRoZTxicj4NCivCoCDCoCDCoCDCoCBkcm0ubGdwdS5lZmZlY3Rp
dmUgcmVmbGVjdHMgdGhlIGFjdHVhbCBhbGxvY2F0aW9uIGFmdGVyPGJyPg0KK8KgIMKgIMKgIMKg
IGNvbnNpZGVyaW5nIHRoZSByZWxhdGlvbnNoaXAgYmV0d2VlbiB0aGUgY2dyb3VwcyBhbmQgdGhl
aXI8YnI+DQorwqAgwqAgwqAgwqAgY29uZmlndXJhdGlvbnMuPGJyPg0KKzxicj4NCivCoCDCoCDC
oCDCoFRoZSBsZ3B1IGlzIGEgZGlzY3JldGUgcXVhbnRpdHkgdGhhdCBpcyBkZXZpY2Ugc3BlY2lm
aWMgKGkuZS48YnI+DQorwqAgwqAgwqAgwqBzb21lIERSTSBkZXZpY2VzIG1heSBoYXZlIDY0IGxn
cHVzIHdoaWxlIG90aGVycyBtYXkgaGF2ZSAxMDA8YnI+DQorwqAgwqAgwqAgwqBsZ3B1cy4pwqAg
VGhlIGxncHUgaXMgYSBzaW5nbGUgcXVhbnRpdHkgdGhhdCBjYW4gYmUgYWxsb2NhdGVkPGJyPg0K
K8KgIMKgIMKgIMKgIGluIHRocmVlIGRpZmZlcmVudCB3YXlzIGRlbm90ZWQgYnkgdGhlIGZvbGxv
d2luZyBuZXN0ZWQga2V5cy48YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgPT09PT3CoCDCoCDC
oD09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT08YnI+DQorwqAg
wqAgwqAgwqAgwqB3ZWlnaHTCoCDCoCBBbGxvY2F0ZSBieSBwcm9wb3J0aW9uIGluIHJlbGF0aW9u
c2hpcCB3aXRoPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGFjdGl2ZSBzaWJs
aW5nIGNncm91cHM8YnI+DQorwqAgwqAgwqAgwqAgwqBjb3VudMKgIMKgIMKgQWxsb2NhdGUgYnkg
YW1vdW50IHN0YXRpY2FsbHksIHRyZWF0IGxncHUgYXM8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgYW5vbnltb3VzIHJlc291cmNlczxicj4NCivCoCDCoCDCoCDCoCDCoGxpc3TC
oCDCoCDCoCBBbGxvY2F0ZSBzdGF0aWNhbGx5LCB0cmVhdCBsZ3B1IGFzIG5hbWVkPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlc291cmNlPGJyPg0KK8KgIMKgIMKgIMKgIMKg
PT09PT3CoCDCoCDCoD09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgRm9yIGV4YW1wbGU6PGJyPg0KK8KgIMKgIMKgIMKg
MjI2OjAgd2VpZ2h0PTEwMCBjb3VudD0yNTYgbGlzdD0wLTI1NTxicj4NCivCoCDCoCDCoCDCoDIy
NjoxIHdlaWdodD0xMDAgY291bnQ9NCBsaXN0PTAsMiw0LDY8YnI+DQorwqAgwqAgwqAgwqAyMjY6
MiB3ZWlnaHQ9MTAwIGNvdW50PTMyIGxpc3Q9MzItNjM8YnI+DQorwqAgwqAgwqAgwqAyMjY6MyB3
ZWlnaHQ9MTAwIGNvdW50PTAgbGlzdD08YnI+DQorwqAgwqAgwqAgwqAyMjY6NCB3ZWlnaHQ9NTAw
IGNvdW50PTAgbGlzdD08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgbGdwdSBpcyByZXByZXNlbnRl
ZCBieSBhIGJpdG1hcCBhbmQgdXNlcyB0aGUgYml0bWFwX3BhcnNlbGlzdDxicj4NCivCoCDCoCDC
oCDCoGtlcm5lbCBmdW5jdGlvbiBzbyB0aGUgbGlzdCBrZXkgaW5wdXQgZm9ybWF0IGlzIGE8YnI+
DQorwqAgwqAgwqAgwqBjb21tYS1zZXBhcmF0ZWQgbGlzdCBvZiBkZWNpbWFsIG51bWJlcnMgYW5k
IHJhbmdlcy48YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgQ29uc2VjdXRpdmVseSBzZXQgYml0cyBh
cmUgc2hvd24gYXMgdHdvIGh5cGhlbi1zZXBhcmF0ZWQgZGVjaW1hbDxicj4NCivCoCDCoCDCoCDC
oG51bWJlcnMsIHRoZSBzbWFsbGVzdCBhbmQgbGFyZ2VzdCBiaXQgbnVtYmVycyBzZXQgaW4gdGhl
IHJhbmdlLjxicj4NCivCoCDCoCDCoCDCoE9wdGlvbmFsbHkgZWFjaCByYW5nZSBjYW4gYmUgcG9z
dGZpeGVkIHRvIGRlbm90ZSB0aGF0IG9ubHkgcGFydHM8YnI+DQorwqAgwqAgwqAgwqBvZiBpdCBz
aG91bGQgYmUgc2V0LsKgIFRoZSByYW5nZSB3aWxsIGRpdmlkZWQgdG8gZ3JvdXBzIG9mPGJyPg0K
K8KgIMKgIMKgIMKgc3BlY2lmaWMgc2l6ZS48YnI+DQorwqAgwqAgwqAgwqBTeW50YXg6IHJhbmdl
OnVzZWRfc2l6ZS9ncm91cF9zaXplPGJyPg0KK8KgIMKgIMKgIMKgRXhhbXBsZTogMC0xMDIzOjIv
MjU2ID09Jmd0OyAwLDEsMjU2LDI1Nyw1MTIsNTEzLDc2OCw3Njk8YnI+DQorPGJyPg0KK8KgIMKg
IMKgIMKgVGhlIGNvdW50IGtleSBpcyB0aGUgaGFtbWluZyB3ZWlnaHQgLyBod2VpZ2h0IG9mIHRo
ZSBiaXRtYXAuPGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoFdlaWdodCwgY291bnQgYW5kIGxpc3Qg
YWNjZXB0IHRoZSBtYXggYW5kIGRlZmF1bHQga2V5d29yZHMuPGJyPg0KKzxicj4NCivCoCDCoCDC
oCDCoFNvbWUgRFJNIGRldmljZXMgbWF5IG9ubHkgc3VwcG9ydCBsZ3B1IGFzIGFub255bW91cyBy
ZXNvdXJjZXMuPGJyPg0KK8KgIMKgIMKgIMKgSW4gc3VjaCBjYXNlLCB0aGUgc2lnbmlmaWNhbmNl
IG9mIHRoZSBwb3NpdGlvbiBvZiB0aGUgc2V0IGJpdHM8YnI+DQorwqAgwqAgwqAgwqBpbiBsaXN0
IHdpbGwgYmUgaWdub3JlZC48YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgVGhlIHdlaWdodCBxdWFu
dGl0eSBpcyBvbmx5IGluIGVmZmVjdCB3aGVuIHN0YXRpYyBhbGxvY2F0aW9uPGJyPg0KK8KgIMKg
IMKgIMKgaXMgbm90IHVzZWQgKGJ5IHNldHRpbmcgY291bnQ9MCkgZm9yIHRoaXMgY2dyb3VwLsKg
IFRoZSB3ZWlnaHQ8YnI+DQorwqAgwqAgwqAgwqBxdWFudGl0eSBkaXN0cmlidXRlcyBsZ3B1cyB0
aGF0IGFyZSBub3Qgc3RhdGljYWxseSBhbGxvY2F0ZWQgYnk8YnI+DQorwqAgwqAgwqAgwqB0aGUg
c2libGluZ3MuwqAgRm9yIGV4YW1wbGUsIGdpdmVuIHNpYmxpbmdzIGNncm91cEEsIGNncm91cEIg
YW5kPGJyPg0KK8KgIMKgIMKgIMKgY2dyb3VwQyBmb3IgYSBEUk0gZGV2aWNlIHRoYXQgaGFzIDY0
IGxncHVzLCBpZiBjZ3JvdXBBIG9jY3VwaWVzPGJyPg0KK8KgIMKgIMKgIMKgMC02Mywgbm8gbGdw
dSBpcyBhdmFpbGFibGUgdG8gYmUgZGlzdHJpYnV0ZWQgYnkgd2VpZ2h0Ljxicj4NCivCoCDCoCDC
oCDCoFNpbWlsYXJseSwgaWYgY2dyb3VwQSBoYXMgbGlzdD0wLTMxIGFuZCBjZ3JvdXBCIGhhcyBs
aXN0PTE2LTYzLDxicj4NCivCoCDCoCDCoCDCoGNncm91cEMgd2lsbCBiZSBzdGFydmVkIGlmIGl0
IHRyaWVzIHRvIGFsbG9jYXRlIGJ5IHdlaWdodC48YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgT24g
dGhlIG90aGVyIGhhbmQsIGlmIGNncm91cEEgaGFzIHdlaWdodD0xMDAgY291bnQ9MCwgY2dyb3Vw
Qjxicj4NCivCoCDCoCDCoCDCoGhhcyBsaXN0PTE2LTQ3LCBhbmQgY2dyb3VwQyBoYXMgd2VpZ2h0
PTEwMCBjb3VudD0wLCB0aGVuIDMyPGJyPg0KK8KgIMKgIMKgIMKgbGdwdXMgYXJlIGF2YWlsYWJs
ZSB0byBiZSBkaXN0cmlidXRlZCBldmVubHkgYmV0d2VlbiBjZ3JvdXBBPGJyPg0KK8KgIMKgIMKg
IMKgYW5kIGNncm91cEMuwqAgSW4gZHJtLmxncHUuZWZmZWN0aXZlLCBjZ3JvdXBBIHdpbGwgaGF2
ZTxicj4NCivCoCDCoCDCoCDCoGxpc3Q9MC0xNSBhbmQgY2dyb3VwQyB3aWxsIGhhdmUgbGlzdD00
OC02My48YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgVGhpcyBsZ3B1IHJlc291cmNlIHN1cHBvcnRz
IHRoZSAmIzM5O2FsbG9jYXRpb24mIzM5OyBhbmQgJiMzOTt3ZWlnaHQmIzM5Ozxicj4NCivCoCDC
oCDCoCDCoHJlc291cmNlIGRpc3RyaWJ1dGlvbiBtb2RlbC48YnI+DQorPGJyPg0KK8KgIGRybS5s
Z3B1LmVmZmVjdGl2ZTxicj4NCivCoCDCoCDCoCDCoEEgcmVhZC1vbmx5IG5lc3RlZC1rZXllZCBm
aWxlIHdoaWNoIGV4aXN0cyBvbiBhbGwgY2dyb3Vwcy48YnI+DQorwqAgwqAgwqAgwqBFYWNoIGVu
dHJ5IGlzIGtleWVkIGJ5IHRoZSBEUk0gZGV2aWNlJiMzOTtzIG1ham9yOm1pbm9yLjxicj4NCis8
YnI+DQorwqAgwqAgwqAgwqBsZ3B1IHN0YW5kcyBmb3IgbG9naWNhbCBHUFUsIGl0IGlzIGFuIGFi
c3RyYWN0aW9uIHVzZWQgdG88YnI+DQorwqAgwqAgwqAgwqBzdWJkaXZpZGUgYSBwaHlzaWNhbCBE
Uk0gZGV2aWNlIGZvciB0aGUgcHVycG9zZSBvZiByZXNvdXJjZTxicj4NCivCoCDCoCDCoCDCoG1h
bmFnZW1lbnQuwqAgVGhpcyBmaWxlIHJlZmxlY3RzIHRoZSBhY3R1YWwgYWxsb2NhdGlvbiBhZnRl
cjxicj4NCivCoCDCoCDCoCDCoCBjb25zaWRlcmluZyB0aGUgcmVsYXRpb25zaGlwIGJldHdlZW4g
dGhlIGNncm91cHMgYW5kIHRoZWlyPGJyPg0KK8KgIMKgIMKgIMKgIGNvbmZpZ3VyYXRpb25zIGlu
IGRybS5sZ3B1Ljxicj4NCis8YnI+DQrCoEdFTSBCdWZmZXIgT3duZXJzaGlwPGJyPg0KwqB+fn5+
fn5+fn5+fn5+fn5+fn5+fjxicj4NCjxicj4NCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1f
Y2dyb3VwLmggYi9pbmNsdWRlL2RybS9kcm1fY2dyb3VwLmg8YnI+DQppbmRleCAyYjQxZDRkMjJl
MzMuLjYxOWExMTBjYzc0OCAxMDA2NDQ8YnI+DQotLS0gYS9pbmNsdWRlL2RybS9kcm1fY2dyb3Vw
Lmg8YnI+DQorKysgYi9pbmNsdWRlL2RybS9kcm1fY2dyb3VwLmg8YnI+DQpAQCAtMTcsNiArMTcs
OSBAQCBzdHJ1Y3QgZHJtY2dfcHJvcHMgezxicj4NCjxicj4NCsKgIMKgIMKgIMKgIHM2NMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYm9fbGltaXRzX3RvdGFsX2FsbG9jYXRlZF9kZWZh
dWx0Ozxicj4NCsKgIMKgIMKgIMKgIHM2NMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Ym9fbGltaXRzX3BlYWtfYWxsb2NhdGVkX2RlZmF1bHQ7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDC
oGludMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbGdwdV9jYXBhY2l0eTs8YnI+DQor
wqAgwqAgwqAgwqBERUNMQVJFX0JJVE1BUChsZ3B1X3Nsb3RzLCBNQVhfRFJNQ0dfTEdQVV9DQVBB
Q0lUWSk7PGJyPg0KwqB9Ozxicj4NCjxicj4NCsKgdm9pZCBkcm1jZ19iaW5kKHN0cnVjdCBkcm1f
bWlub3IgKCooKmFjcV9kbSkodW5zaWduZWQgaW50IG1pbm9yX2lkKSksPGJyPg0KZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvY2dyb3VwX2RybS5oIGIvaW5jbHVkZS9saW51eC9jZ3JvdXBfZHJt
Lmg8YnI+DQppbmRleCBlYWU0MDBmM2Q5YjQuLmJiMDk3MDRlN2Y3MSAxMDA2NDQ8YnI+DQotLS0g
YS9pbmNsdWRlL2xpbnV4L2Nncm91cF9kcm0uaDxicj4NCisrKyBiL2luY2x1ZGUvbGludXgvY2dy
b3VwX2RybS5oPGJyPg0KQEAgLTExLDEwICsxMSwxNCBAQDxicj4NCsKgLyogbGltaXQgZGVmaW5l
ZCBwZXIgdGhlIHdheSBkcm1fbWlub3JfYWxsb2Mgb3BlcmF0ZXMgKi88YnI+DQrCoCNkZWZpbmUg
TUFYX0RSTV9ERVYgKDY0ICogRFJNX01JTk9SX1JFTkRFUik8YnI+DQo8YnI+DQorI2RlZmluZSBN
QVhfRFJNQ0dfTEdQVV9DQVBBQ0lUWSAyNTY8YnI+DQorPGJyPg0KwqBlbnVtIGRybWNnX3Jlc190
eXBlIHs8YnI+DQrCoCDCoCDCoCDCoCBEUk1DR19UWVBFX0JPX1RPVEFMLDxicj4NCsKgIMKgIMKg
IMKgIERSTUNHX1RZUEVfQk9fUEVBSyw8YnI+DQrCoCDCoCDCoCDCoCBEUk1DR19UWVBFX0JPX0NP
VU5ULDxicj4NCivCoCDCoCDCoCDCoERSTUNHX1RZUEVfTEdQVSw8YnI+DQorwqAgwqAgwqAgwqBE
Uk1DR19UWVBFX0xHUFVfRUZGLDxicj4NCsKgIMKgIMKgIMKgIF9fRFJNQ0dfVFlQRV9MQVNULDxi
cj4NCsKgfTs8YnI+DQo8YnI+DQpAQCAtMzIsNiArMzYsMjQgQEAgc3RydWN0IGRybWNnX2Rldmlj
ZV9yZXNvdXJjZSB7PGJyPg0KwqAgwqAgwqAgwqAgczY0wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBib19saW1pdHNfcGVha19hbGxvY2F0ZWQ7PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAg
czY0wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBib19zdGF0c19jb3VudF9hbGxvY2F0
ZWQ7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoC8qKjxicj4NCivCoCDCoCDCoCDCoCAqIExvZ2lj
YWwgR1BVPGJyPg0KK8KgIMKgIMKgIMKgICo8YnI+DQorwqAgwqAgwqAgwqAgKiAqX2NmZyBhcmUg
cHJvcGVydGllcyBjb25maWd1cmVkIGJ5IHVzZXJzPGJyPg0KK8KgIMKgIMKgIMKgICogKl9lZmYg
YXJlIHRoZSBlZmZlY3RpdmUgcHJvcGVydGllcyBiZWluZyBhcHBsaWVkIHRvIHRoZSBoYXJkd2Fy
ZTxicj4NCivCoCDCoCDCoCDCoCDCoCogKl9zdGcgaXMgdXNlZCB0byBjYWxjdWxhdGUgX2VmZiBi
ZWZvcmUgYXBwbHlpbmcgdG8gX2VmZjxicj4NCivCoCDCoCDCoCDCoCAqIGFmdGVyIGNvbnNpZGVy
aW5nIHRoZSBlbnRpcmUgaGllcmFyY2h5PGJyPg0KK8KgIMKgIMKgIMKgICovPGJyPg0KK8KgIMKg
IMKgIMKgREVDTEFSRV9CSVRNQVAobGdwdV9zdGcsIE1BWF9EUk1DR19MR1BVX0NBUEFDSVRZKTs8
YnI+DQorwqAgwqAgwqAgwqAvKiB1c2VyIGNvbmZpZ3VyYXRpb25zICovPGJyPg0KK8KgIMKgIMKg
IMKgczY0wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsZ3B1X3dlaWdodF9jZmc7PGJy
Pg0KK8KgIMKgIMKgIMKgREVDTEFSRV9CSVRNQVAobGdwdV9jZmcsIE1BWF9EUk1DR19MR1BVX0NB
UEFDSVRZKTs8YnI+DQorwqAgwqAgwqAgwqAvKiBlZmZlY3RpdmUgbGdwdSBmb3IgdGhlIGNncm91
cCBhZnRlciBjb25zaWRlcmluZzxicj4NCivCoCDCoCDCoCDCoCAqIHJlbGF0aW9uc2hpcCB3aXRo
IG90aGVyIGNncm91cDxicj4NCivCoCDCoCDCoCDCoCAqLzxicj4NCivCoCDCoCDCoCDCoHM2NMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbGdwdV9jb3VudF9lZmY7PGJyPg0KK8KgIMKg
IMKgIMKgREVDTEFSRV9CSVRNQVAobGdwdV9lZmYsIE1BWF9EUk1DR19MR1BVX0NBUEFDSVRZKTs8
YnI+DQrCoH07PGJyPg0KPGJyPg0KwqAvKio8YnI+DQpkaWZmIC0tZ2l0IGEva2VybmVsL2Nncm91
cC9kcm0uYyBiL2tlcm5lbC9jZ3JvdXAvZHJtLmM8YnI+DQppbmRleCA1ZmNiYmMxM2ZhMWMuLmE0
ZTg4YTM3MDRiYiAxMDA2NDQ8YnI+DQotLS0gYS9rZXJuZWwvY2dyb3VwL2RybS5jPGJyPg0KKysr
IGIva2VybmVsL2Nncm91cC9kcm0uYzxicj4NCkBAIC05LDYgKzksNyBAQDxicj4NCsKgI2luY2x1
ZGUgJmx0O2xpbnV4L3NlcV9maWxlLmgmZ3Q7PGJyPg0KwqAjaW5jbHVkZSAmbHQ7bGludXgvbXV0
ZXguaCZndDs8YnI+DQrCoCNpbmNsdWRlICZsdDtsaW51eC9rZXJuZWwuaCZndDs8YnI+DQorI2lu
Y2x1ZGUgJmx0O2xpbnV4L2JpdG1hcC5oJmd0Ozxicj4NCsKgI2luY2x1ZGUgJmx0O2xpbnV4L2Nn
cm91cF9kcm0uaCZndDs8YnI+DQrCoCNpbmNsdWRlICZsdDtkcm0vZHJtX2ZpbGUuaCZndDs8YnI+
DQrCoCNpbmNsdWRlICZsdDtkcm0vZHJtX2Rydi5oJmd0Ozxicj4NCkBAIC00MSw2ICs0MiwxMCBA
QCBlbnVtIGRybWNnX2ZpbGVfdHlwZSB7PGJyPg0KwqAgwqAgwqAgwqAgRFJNQ0dfRlRZUEVfREVG
QVVMVCw8YnI+DQrCoH07PGJyPg0KPGJyPg0KKyNkZWZpbmUgTEdQVV9MSU1JVFNfTkFNRV9MSVNU
ICZxdW90O2xpc3QmcXVvdDs8YnI+DQorI2RlZmluZSBMR1BVX0xJTUlUU19OQU1FX0NPVU5UICZx
dW90O2NvdW50JnF1b3Q7PGJyPg0KKyNkZWZpbmUgTEdQVV9MSU1JVFNfTkFNRV9XRUlHSFQgJnF1
b3Q7d2VpZ2h0JnF1b3Q7PGJyPg0KKzxicj4NCsKgLyoqPGJyPg0KwqAgKiBkcm1jZ19iaW5kIC0g
QmluZCBEUk0gc3Vic3lzdGVtIHRvIGNncm91cCBzdWJzeXN0ZW08YnI+DQrCoCAqIEBhY3FfZG06
IGZ1bmN0aW9uIHBvaW50ZXIgdG8gdGhlIGRybV9taW5vcl9hY3F1aXJlIGZ1bmN0aW9uPGJyPg0K
QEAgLTk4LDYgKzEwMywxMyBAQCBzdGF0aWMgaW5saW5lIGludCBpbml0X2RybWNnX3NpbmdsZShz
dHJ1Y3QgZHJtY2cgKmRybWNnLCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KTxicj4NCsKgIMKgIMKg
IMKgIGRkci0mZ3Q7Ym9fbGltaXRzX3BlYWtfYWxsb2NhdGVkID08YnI+DQrCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBkZXYtJmd0O2RybWNnX3Byb3BzLmJvX2xpbWl0c19wZWFrX2FsbG9jYXRlZF9k
ZWZhdWx0Ozxicj4NCjxicj4NCivCoCDCoCDCoCDCoGJpdG1hcF9jb3B5KGRkci0mZ3Q7bGdwdV9j
ZmcsIGRldi0mZ3Q7ZHJtY2dfcHJvcHMubGdwdV9zbG90cyw8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBNQVhfRFJNQ0dfTEdQVV9DQVBBQ0lUWSk7PGJyPg0KK8KgIMKg
IMKgIMKgYml0bWFwX2NvcHkoZGRyLSZndDtsZ3B1X3N0ZywgZGV2LSZndDtkcm1jZ19wcm9wcy5s
Z3B1X3Nsb3RzLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE1BWF9E
Uk1DR19MR1BVX0NBUEFDSVRZKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgZGRyLSZndDtsZ3B1
X3dlaWdodF9jZmcgPSBDR1JPVVBfV0VJR0hUX0RGTDs8YnI+DQorPGJyPg0KwqAgwqAgwqAgwqAg
cmV0dXJuIDA7PGJyPg0KwqB9PGJyPg0KPGJyPg0KQEAgLTEyMSw2ICsxMzMsMTIwIEBAIHN0YXRp
YyBpbmxpbmUgdm9pZCBkcm1jZ191cGRhdGVfY2dfdHJlZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
KTxicj4NCsKgIMKgIMKgIMKgIG11dGV4X3VubG9jaygmYW1wO2Nncm91cF9tdXRleCk7PGJyPg0K
wqB9PGJyPg0KPGJyPg0KK3N0YXRpYyB2b2lkIGRybWNnX2NhbGN1bGF0ZV9lZmZlY3RpdmVfbGdw
dShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNv
bnN0IHVuc2lnbmVkIGxvbmcgKmZyZWVfc3RhdGljLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGNvbnN0IHVuc2lnbmVkIGxvbmcgKmZyZWVfd2VpZ2h0ZWQsPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgc3RydWN0IGRybWNnICpwYXJlbnRfZHJtY2cpPGJyPg0KK3s8YnI+DQorwqAg
wqAgwqAgwqBpbnQgY2FwYWNpdHkgPSBkZXYtJmd0O2RybWNnX3Byb3BzLmxncHVfY2FwYWNpdHk7
PGJyPg0KK8KgIMKgIMKgIMKgREVDTEFSRV9CSVRNQVAobGdwdV91bnVzZWQsIE1BWF9EUk1DR19M
R1BVX0NBUEFDSVRZKTs8YnI+DQorwqAgwqAgwqAgwqBERUNMQVJFX0JJVE1BUChsZ3B1X2J5X3dl
aWdodCwgTUFYX0RSTUNHX0xHUFVfQ0FQQUNJVFkpOzxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBk
cm1jZ19kZXZpY2VfcmVzb3VyY2UgKnBhcmVudF9kZHI7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0
IGRybWNnX2RldmljZV9yZXNvdXJjZSAqZGRyOzxicj4NCivCoCDCoCDCoCDCoGludCBtaW5vciA9
IGRldi0mZ3Q7cHJpbWFyeS0mZ3Q7aW5kZXg7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IGNncm91
cF9zdWJzeXNfc3RhdGUgKnBvczs8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3QgZHJtY2cgKmNoaWxk
Ozxicj4NCivCoCDCoCDCoCDCoHM2NCB3ZWlnaHRfc3VtID0gMDs8YnI+DQorwqAgwqAgwqAgwqBz
NjQgdW51c2VkOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBwYXJlbnRfZGRyID0gcGFyZW50X2Ry
bWNnLSZndDtkZXZfcmVzb3VyY2VzW21pbm9yXTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgaWYg
KGJpdG1hcF9lbXB0eShwYXJlbnRfZGRyLSZndDtsZ3B1X2NmZywgY2FwYWNpdHkpKTxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIG5vIHN0YXRpYyBjZmcsIHVzZSB3ZWlnaHQgZm9yIGNh
bGN1bGF0aW5nIHRoZSBlZmZlY3RpdmUgKi88YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBi
aXRtYXBfY29weShwYXJlbnRfZGRyLSZndDtsZ3B1X3N0ZywgZnJlZV93ZWlnaHRlZCwgY2FwYWNp
dHkpOzxicj4NCivCoCDCoCDCoCDCoGVsc2U8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAv
KiBsZ3B1IHN0YXRpY2FsbHkgY29uZmlndXJlZCwgdXNlIHRoZSBvdmVybGFwIGFzIGVmZmVjdGl2
ZSAqLzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJpdG1hcF9hbmQocGFyZW50X2Rkci0m
Z3Q7bGdwdV9zdGcsIGZyZWVfc3RhdGljLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBhcmVudF9kZHItJmd0O2xncHVfY2ZnLCBjYXBhY2l0eSk7
PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoC8qIGNhbGN1bGF0ZSBsZ3B1IGF2YWlsYWJsZSBmb3Ig
ZGlzdHJpYnV0aW9uIGJ5IHdlaWdodCBmb3IgY2hpbGRyZW4gKi88YnI+DQorwqAgwqAgwqAgwqBi
aXRtYXBfY29weShsZ3B1X3VudXNlZCwgcGFyZW50X2Rkci0mZ3Q7bGdwdV9zdGcsIGNhcGFjaXR5
KTs8YnI+DQorwqAgwqAgwqAgwqBjc3NfZm9yX2VhY2hfY2hpbGQocG9zLCAmYW1wO3BhcmVudF9k
cm1jZy0mZ3Q7Y3NzKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2hpbGQgPSBjc3Nf
dG9fZHJtY2cocG9zKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkZHIgPSBjaGlsZC0m
Z3Q7ZGV2X3Jlc291cmNlc1ttaW5vcl07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGlmIChiaXRtYXBfZW1wdHkoZGRyLSZndDtsZ3B1X2NmZywgY2FwYWNpdHkpKTxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIG5vIHN0YXRpYyBhbGxvY2F0aW9u
LCBwYXJ0aWNpcGF0ZSBpbiB3ZWlnaHQgZGlzdCAqLzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHdlaWdodF9zdW0gKz0gZGRyLSZndDtsZ3B1X3dlaWdodF9jZmc7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZWxzZTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoC8qIHRha2Ugb3V0IHN0YXRpY2FsbHkgYWxsb2NhdGVkIGxncHUgYnkg
c2libGluZ3MgKi88YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBiaXRt
YXBfYW5kbm90KGxncHVfdW51c2VkLCBsZ3B1X3VudXNlZCwgZGRyLSZndDtsZ3B1X2NmZyw8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBjYXBhY2l0eSk7PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCis8YnI+DQorwqAgwqAgwqAg
wqB1bnVzZWQgPSBiaXRtYXBfd2VpZ2h0KGxncHVfdW51c2VkLCBjYXBhY2l0eSk7PGJyPg0KKzxi
cj4NCivCoCDCoCDCoCDCoGNzc19mb3JfZWFjaF9jaGlsZChwb3MsICZhbXA7cGFyZW50X2RybWNn
LSZndDtjc3MpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjaGlsZCA9IGNzc190b19k
cm1jZyhwb3MpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRkciA9IGNoaWxkLSZndDtk
ZXZfcmVzb3VyY2VzW21pbm9yXTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Yml0bWFwX3plcm8obGdwdV9ieV93ZWlnaHQsIGNhcGFjaXR5KTs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAvKiBubyBzdGF0aWMgYWxsb2NhdGlvbiwgcGFydGljaXBhdGUgaW4gd2VpZ2h0
IGRpc3RyaWJ1dGlvbiAqLzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChiaXRtYXBf
ZW1wdHkoZGRyLSZndDtsZ3B1X2NmZywgY2FwYWNpdHkpKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50IGM7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgaW50IHAgPSAwOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBmb3IgKGMgPSBkZHItJmd0O2xncHVfd2VpZ2h0X2NmZyAqIHVudXNlZCAv
IHdlaWdodF9zdW07PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgYyAmZ3Q7IDA7IGMtLSkgezxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHAgPSBmaW5kX25leHRfYml0KGxncHVf
dW51c2VkLCBjYXBhY2l0eSwgcCk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgaWYgKHAgJmx0OyBjYXBhY2l0eSkgezxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsZWFyX2Jp
dChwLCBsZ3B1X3VudXNlZCk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2V0X2JpdChwLCBsZ3B1X2J5X3dlaWdodCk7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBk
cm1jZ19jYWxjdWxhdGVfZWZmZWN0aXZlX2xncHUoZGV2LCBwYXJlbnRfZGRyLSZndDtsZ3B1X3N0
Zyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBs
Z3B1X2J5X3dlaWdodCwgY2hpbGQpOzxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorfTxicj4NCis8
YnI+DQorc3RhdGljIHZvaWQgZHJtY2dfYXBwbHlfZWZmZWN0aXZlX2xncHUoc3RydWN0IGRybV9k
ZXZpY2UgKmRldik8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoGludCBjYXBhY2l0eSA9IGRldi0m
Z3Q7ZHJtY2dfcHJvcHMubGdwdV9jYXBhY2l0eTs8YnI+DQorwqAgwqAgwqAgwqBpbnQgbWlub3Ig
PSBkZXYtJmd0O3ByaW1hcnktJmd0O2luZGV4Ozxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBkcm1j
Z19kZXZpY2VfcmVzb3VyY2UgKmRkcjs8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3QgY2dyb3VwX3N1
YnN5c19zdGF0ZSAqcG9zOzxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBkcm1jZyAqZHJtY2c7PGJy
Pg0KKzxicj4NCivCoCDCoCDCoCDCoGlmIChyb290X2RybWNnID09IE5VTEwpIHs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBXQVJOX09OKHJvb3RfZHJtY2cgPT0gTlVMTCk7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuOzxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorPGJy
Pg0KK8KgIMKgIMKgIMKgcmN1X3JlYWRfbG9jaygpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAv
KiBwcm9jZXNzIHRoZSBlbnRpcmUgY2dyb3VwIHRyZWUgZnJvbSByb290IHRvIHNpbXBsaWZ5IHRo
ZSBhbGdvcml0aG0gKi88YnI+DQorwqAgwqAgwqAgwqBkcm1jZ19jYWxjdWxhdGVfZWZmZWN0aXZl
X2xncHUoZGV2LCBkZXYtJmd0O2RybWNnX3Byb3BzLmxncHVfc2xvdHMsPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGV2LSZndDtkcm1jZ19wcm9wcy5sZ3B1X3Nsb3Rz
LCByb290X2RybWNnKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgLyogYXBwbHkgY2hhbmdlcyB0
byBlZmZlY3RpdmUgb25seSBpZiB0aGVyZSBpcyBhIGNoYW5nZSAqLzxicj4NCivCoCDCoCDCoCDC
oGNzc19mb3JfZWFjaF9kZXNjZW5kYW50X3ByZShwb3MsICZhbXA7cm9vdF9kcm1jZy0mZ3Q7Y3Nz
KSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZHJtY2cgPSBjc3NfdG9fZHJtY2cocG9z
KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkZHIgPSBkcm1jZy0mZ3Q7ZGV2X3Jlc291
cmNlc1ttaW5vcl07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmICghYml0
bWFwX2VxdWFsKGRkci0mZ3Q7bGdwdV9zdGcsIGRkci0mZ3Q7bGdwdV9lZmYsIGNhcGFjaXR5KSkg
ezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJpdG1hcF9jb3B5KGRk
ci0mZ3Q7bGdwdV9lZmYsIGRkci0mZ3Q7bGdwdV9zdGcsIGNhcGFjaXR5KTs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkZHItJmd0O2xncHVfY291bnRfZWZmID08YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBiaXRtYXBf
d2VpZ2h0KGRkci0mZ3Q7bGdwdV9lZmYsIGNhcGFjaXR5KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCivCoCDCoCDCoCDCoHJjdV9yZWFkX3Vu
bG9jaygpOzxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgdm9pZCBkcm1jZ19hcHBseV9lZmZl
Y3RpdmUoZW51bSBkcm1jZ19yZXNfdHlwZSB0eXBlLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1jZyAqY2hhbmdlZF9kcm1jZyk8
YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHN3aXRjaCAodHlwZSkgezxicj4NCivCoCDCoCDCoCDC
oGNhc2UgRFJNQ0dfVFlQRV9MR1BVOjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRybWNn
X2FwcGx5X2VmZmVjdGl2ZV9sZ3B1KGRldik7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
YnJlYWs7PGJyPg0KK8KgIMKgIMKgIMKgZGVmYXVsdDo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBicmVhazs8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KK308YnI+DQorPGJyPg0KwqAvKio8
YnI+DQrCoCAqIGRybWNnX3JlZ2lzdGVyX2RldiAtIHJlZ2lzdGVyIGEgRFJNIGRldmljZSBmb3Ig
dXNhZ2UgaW4gZHJtIGNncm91cDxicj4NCsKgICogQGRldjogRFJNIGRldmljZTxicj4NCkBAIC0x
NDMsNyArMjY5LDEzIEBAIHZvaWQgZHJtY2dfcmVnaXN0ZXJfZGV2KHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYpPGJyPg0KwqAgwqAgwqAgwqAgezxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGRl
di0mZ3Q7ZHJpdmVyLSZndDtkcm1jZ19jdXN0b21faW5pdChkZXYsICZhbXA7ZGV2LSZndDtkcm1j
Z19wcm9wcyk7PGJyPg0KPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgV0FSTl9PTihkZXYt
Jmd0O2RybWNnX3Byb3BzLmxncHVfY2FwYWNpdHkgIT08YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBiaXRtYXBfd2VpZ2h0KGRldi0mZ3Q7ZHJtY2df
cHJvcHMubGdwdV9zbG90cyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBNQVhfRFJNQ0dfTEdQVV9DQVBBQ0lUWSkpOzxicj4N
Cis8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBkcm1jZ191cGRhdGVfY2dfdHJlZShkZXYp
Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkcm1jZ19hcHBseV9lZmZlY3Rp
dmUoRFJNQ0dfVFlQRV9MR1BVLCBkZXYsIHJvb3RfZHJtY2cpOzxicj4NCsKgIMKgIMKgIMKgIH08
YnI+DQrCoCDCoCDCoCDCoCBtdXRleF91bmxvY2soJmFtcDtkcm1jZ19tdXRleCk7PGJyPg0KwqB9
PGJyPg0KQEAgLTI5Nyw3ICs0MjksOCBAQCBzdGF0aWMgdm9pZCBkcm1jZ19wcmludF9zdGF0cyhz
dHJ1Y3QgZHJtY2dfZGV2aWNlX3Jlc291cmNlICpkZHIsPGJyPg0KwqB9PGJyPg0KPGJyPg0KwqBz
dGF0aWMgdm9pZCBkcm1jZ19wcmludF9saW1pdHMoc3RydWN0IGRybWNnX2RldmljZV9yZXNvdXJj
ZSAqZGRyLDxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0cnVjdCBzZXFfZmlsZSAqc2Ys
IGVudW0gZHJtY2dfcmVzX3R5cGUgdHlwZSk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBz
dHJ1Y3Qgc2VxX2ZpbGUgKnNmLCBlbnVtIGRybWNnX3Jlc190eXBlIHR5cGUsPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgc3RydWN0IGRybV9kZXZpY2UgKmRldik8YnI+DQrCoHs8YnI+DQrC
oCDCoCDCoCDCoCBpZiAoZGRyID09IE5VTEwpIHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBzZXFfcHV0cyhzZiwgJnF1b3Q7XG4mcXVvdDspOzxicj4NCkBAIC0zMTEsNiArNDQ0LDI1IEBA
IHN0YXRpYyB2b2lkIGRybWNnX3ByaW50X2xpbWl0cyhzdHJ1Y3QgZHJtY2dfZGV2aWNlX3Jlc291
cmNlICpkZHIsPGJyPg0KwqAgwqAgwqAgwqAgY2FzZSBEUk1DR19UWVBFX0JPX1BFQUs6PGJyPg0K
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc2VxX3ByaW50ZihzZiwgJnF1b3Q7JWxsZFxuJnF1b3Q7
LCBkZHItJmd0O2JvX2xpbWl0c19wZWFrX2FsbG9jYXRlZCk7PGJyPg0KwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgYnJlYWs7PGJyPg0KK8KgIMKgIMKgIMKgY2FzZSBEUk1DR19UWVBFX0xHUFU6PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2VxX3ByaW50ZihzZiwgJnF1b3Q7JXM9JWxsZCAl
cz0lZCAlcz0lKnBibFxuJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoExHUFVfTElNSVRTX05BTUVfV0VJR0hULDxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRkci0mZ3Q7bGdwdV93ZWln
aHRfY2ZnLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoExHUFVfTElNSVRTX05BTUVfQ09VTlQsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYml0bWFwX3dlaWdodChkZHItJmd0O2xncHVfY2ZnLDxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGRldi0mZ3Q7ZHJtY2dfcHJvcHMubGdwdV9jYXBhY2l0eSksPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTEdQVV9MSU1JVFNfTkFNRV9M
SVNULDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGRldi0mZ3Q7ZHJtY2dfcHJvcHMubGdwdV9jYXBhY2l0eSw8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkZHItJmd0O2xncHVfY2ZnKTs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQorwqAgwqAgwqAgwqBjYXNlIERSTUNH
X1RZUEVfTEdQVV9FRkY6PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2VxX3ByaW50Zihz
ZiwgJnF1b3Q7JXM9JWxsZCAlcz0lKnBibFxuJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoExHUFVfTElNSVRTX05BTUVfQ09VTlQsPGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGRyLSZn
dDtsZ3B1X2NvdW50X2VmZiw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBMR1BVX0xJTUlUU19OQU1FX0xJU1QsPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGV2LSZndDtkcm1jZ19wcm9wcy5sZ3B1
X2NhcGFjaXR5LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGRkci0mZ3Q7bGdwdV9lZmYpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJy
ZWFrOzxicj4NCsKgIMKgIMKgIMKgIGRlZmF1bHQ6PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgc2VxX3B1dHMoc2YsICZxdW90O1xuJnF1b3Q7KTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBicmVhazs8YnI+DQpAQCAtMzI5LDYgKzQ4MSwxNyBAQCBzdGF0aWMgdm9pZCBkcm1jZ19w
cmludF9kZWZhdWx0KHN0cnVjdCBkcm1jZ19wcm9wcyAqcHJvcHMsPGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgc2VxX3ByaW50ZihzZiwgJnF1b3Q7JWxsZFxuJnF1b3Q7LDxicj4NCsKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHByb3BzLSZndDtib19saW1pdHNfcGVha19h
bGxvY2F0ZWRfZGVmYXVsdCk7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYnJlYWs7PGJy
Pg0KK8KgIMKgIMKgIMKgY2FzZSBEUk1DR19UWVBFX0xHUFU6PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgc2VxX3ByaW50ZihzZiwgJnF1b3Q7JXM9JWQgJXM9JWQgJXM9JSpwYmxcbiZxdW90
Oyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBM
R1BVX0xJTUlUU19OQU1FX1dFSUdIVCw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBDR1JPVVBfV0VJR0hUX0RGTCw8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBMR1BVX0xJTUlUU19OQU1FX0NPVU5U
LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJp
dG1hcF93ZWlnaHQocHJvcHMtJmd0O2xncHVfc2xvdHMsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcHJvcHMtJmd0O2xncHVf
Y2FwYWNpdHkpLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoExHUFVfTElNSVRTX05BTUVfTElTVCw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwcm9wcy0mZ3Q7bGdwdV9jYXBhY2l0eSw8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwcm9wcy0mZ3Q7
bGdwdV9zbG90cyk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KwqAg
wqAgwqAgwqAgZGVmYXVsdDo8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzZXFfcHV0cyhz
ZiwgJnF1b3Q7XG4mcXVvdDspOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGJyZWFrOzxi
cj4NCkBAIC0zNTgsNyArNTIxLDcgQEAgc3RhdGljIGludCBkcm1jZ19zZXFfc2hvd19mbihpbnQg
aWQsIHZvaWQgKnB0ciwgdm9pZCAqZGF0YSk8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBk
cm1jZ19wcmludF9zdGF0cyhkZHIsIHNmLCB0eXBlKTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBicmVhazs8YnI+DQrCoCDCoCDCoCDCoCBjYXNlIERSTUNHX0ZUWVBFX0xJTUlUOjxicj4N
Ci3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRybWNnX3ByaW50X2xpbWl0cyhkZHIsIHNmLCB0eXBl
KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkcm1jZ19wcmludF9saW1pdHMoZGRyLCBz
ZiwgdHlwZSwgbWlub3ItJmd0O2Rldik7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYnJl
YWs7PGJyPg0KwqAgwqAgwqAgwqAgY2FzZSBEUk1DR19GVFlQRV9ERUZBVUxUOjxicj4NCsKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIGRybWNnX3ByaW50X2RlZmF1bHQoJmFtcDttaW5vci0mZ3Q7ZGV2
LSZndDtkcm1jZ19wcm9wcywgc2YsIHR5cGUpOzxicj4NCkBAIC00MTUsNiArNTc4LDExNSBAQCBz
dGF0aWMgaW50IGRybWNnX3Byb2Nlc3NfbGltaXRfczY0X3ZhbChjaGFyICpzdmFsLCBib29sIGlz
X21lbSw8YnI+DQrCoCDCoCDCoCDCoCByZXR1cm4gcmM7PGJyPg0KwqB9PGJyPg0KPGJyPg0KK3N0
YXRpYyB2b2lkIGRybWNnX25lc3RlZF9saW1pdF9wYXJzZShzdHJ1Y3Qga2VybmZzX29wZW5fZmls
ZSAqb2YsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RydWN0IGRybV9kZXZpY2UgKmRl
diwgY2hhciAqYXR0cnMpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBERUNMQVJFX0JJVE1BUCh0
bXBfYml0bWFwLCBNQVhfRFJNQ0dfTEdQVV9DQVBBQ0lUWSk7PGJyPg0KK8KgIMKgIMKgIMKgREVD
TEFSRV9CSVRNQVAoY2hrX2JpdG1hcCwgTUFYX0RSTUNHX0xHUFVfQ0FQQUNJVFkpOzxicj4NCivC
oCDCoCDCoCDCoGVudW0gZHJtY2dfcmVzX3R5cGUgdHlwZSA9PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgRFJNQ0dfQ1RGX1BSSVYyUkVTVFlQRShvZl9jZnQob2YpLSZndDtwcml2YXRlKTs8
YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3QgZHJtY2cgKmRybWNnID0gY3NzX3RvX2RybWNnKG9mX2Nz
cyhvZikpOzxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBkcm1jZ19wcm9wcyAqcHJvcHMgPSAmYW1w
O2Rldi0mZ3Q7ZHJtY2dfcHJvcHM7PGJyPg0KK8KgIMKgIMKgIMKgY2hhciAqY2Z0X25hbWUgPSBv
Zl9jZnQob2YpLSZndDtuYW1lOzxicj4NCivCoCDCoCDCoCDCoGludCBtaW5vciA9IGRldi0mZ3Q7
cHJpbWFyeS0mZ3Q7aW5kZXg7PGJyPg0KK8KgIMKgIMKgIMKgY2hhciAqbmVzdGVkID0gc3Ryc3Ry
aXAoYXR0cnMpOzxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBkcm1jZ19kZXZpY2VfcmVzb3VyY2Ug
KmRkciA9PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZHJtY2ctJmd0O2Rldl9yZXNvdXJj
ZXNbbWlub3JdOzxicj4NCivCoCDCoCDCoCDCoGNoYXIgKmF0dHI7PGJyPg0KK8KgIMKgIMKgIMKg
Y2hhciBzbmFtZVsyNTZdOzxicj4NCivCoCDCoCDCoCDCoGNoYXIgc3ZhbFsyNTZdOzxicj4NCivC
oCDCoCDCoCDCoHM2NCB2YWw7PGJyPg0KK8KgIMKgIMKgIMKgaW50IHJjOzxicj4NCis8YnI+DQor
wqAgwqAgwqAgwqB3aGlsZSAobmVzdGVkICE9IE5VTEwpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBhdHRyID0gc3Ryc2VwKCZhbXA7bmVzdGVkLCAmcXVvdDsgJnF1b3Q7KTs8YnI+DQor
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHNzY2FuZihhdHRyLCAmcXVvdDslMjU1
W149XT0lMjU1W149XSZxdW90Oywgc25hbWUsIHN2YWwpICE9IDIpPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29udGludWU7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHN3aXRjaCAodHlwZSkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGNhc2UgRFJNQ0dfVFlQRV9MR1BVOjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGlmIChzdHJuY21wKHNuYW1lLCBMR1BVX0xJTUlUU19OQU1FX0xJU1QsIDI1NikgJmFt
cDsmYW1wOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHN0cm5jbXAoc25hbWUsIExHUFVfTElNSVRTX05BTUVfQ09VTlQsIDI1NikgJmFtcDsmYW1w
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0
cm5jbXAoc25hbWUsIExHUFVfTElNSVRTX05BTUVfV0VJR0hULCAyNTYpKTxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbnRpbnVlOzxicj4NCis8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoc3RybmNtcChzbmFt
ZSwgTEdQVV9MSU1JVFNfTkFNRV9XRUlHSFQsIDI1NikgJmFtcDsmYW1wOzxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCghc3Ry
Y21wKCZxdW90O21heCZxdW90Oywgc3ZhbCkgfHw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAhc3RyY21wKCZxdW90O2RlZmF1
bHQmcXVvdDssIHN2YWwpKSkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGJpdG1hcF9jb3B5KGRkci0mZ3Q7bGdwdV9jZmcsIHByb3BzLSZndDts
Z3B1X3Nsb3RzLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHByb3BzLSZndDtsZ3B1X2NhcGFjaXR5KTs8
YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgY29udGludWU7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxi
cj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoc3RybmNt
cChzbmFtZSwgTEdQVV9MSU1JVFNfTkFNRV9XRUlHSFQsIDI1NikgPT0gMCkgezxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJjID0gZHJtY2dfcHJv
Y2Vzc19saW1pdF9zNjRfdmFsKHN2YWwsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZmFsc2UsIENHUk9VUF9XRUlHSFRfREZM
LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoENHUk9VUF9XRUlHSFRfTUFYLCAmYW1wO3ZhbCk7PGJyPg0KKzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChyYyB8fCB2YWwg
Jmx0OyBDR1JPVVBfV0VJR0hUX01JTiB8fDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHZhbCAmZ3Q7IENH
Uk9VUF9XRUlHSFRfTUFYKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZHJtY2dfcHJfY2Z0X2Vycihkcm1jZywgcmMsIGNm
dF9uYW1lLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG1pbm9yKTs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBj
b250aW51ZTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGRkci0mZ3Q7bGdwdV93ZWlnaHRfY2ZnID0gdmFsOzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbnRpbnVlOzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHN0cm5jbXAoc25hbWUsIExHUFVfTElNSVRTX05B
TUVfQ09VTlQsIDI1NikgPT0gMCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHJjID0gZHJtY2dfcHJvY2Vzc19saW1pdF9zNjRfdmFsKHN2YWws
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgZmFsc2UsIHByb3BzLSZndDtsZ3B1X2NhcGFjaXR5LDxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHByb3BzLSZn
dDtsZ3B1X2NhcGFjaXR5LCAmYW1wO3ZhbCk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChyYyB8fCB2YWwgJmx0OyAwKSB7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgZHJtY2dfcHJfY2Z0X2Vycihkcm1jZywgcmMsIGNmdF9uYW1lLDxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoG1pbm9yKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb250aW51ZTs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJpdG1hcF96ZXJv
KHRtcF9iaXRtYXAsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTUFYX0RSTUNHX0xHUFVfQ0FQQUNJVFkp
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJp
dG1hcF9zZXQodG1wX2JpdG1hcCwgMCwgdmFsKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGlmIChzdHJuY21wKHNuYW1lLCBMR1BVX0xJTUlUU19OQU1FX0xJU1QsIDI1NikgPT0g
MCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHJjID0gYml0bWFwX3BhcnNlbGlzdChzdmFsLCB0bXBfYml0bWFwLDxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoE1BWF9EUk1DR19MR1BVX0NBUEFDSVRZKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHJjKSB7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZHJtY2df
cHJfY2Z0X2Vycihkcm1jZywgcmMsIGNmdF9uYW1lLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoG1pbm9yKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb250aW51ZTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJpdG1hcF9hbmRub3QoY2hrX2JpdG1h
cCwgdG1wX2JpdG1hcCw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwcm9wcy0mZ3Q7bGdwdV9zbG90cyw8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBNQVhf
RFJNQ0dfTEdQVV9DQVBBQ0lUWSk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIHVzZXIgc2V0dGluZyBkb2VzIG5vdCBpbnRlcnNl
Y3Qgd2l0aDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCAqIGF2YWlsYWJsZSBsZ3B1ICovPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKCFiaXRtYXBfZW1wdHkoY2hrX2JpdG1hcCw8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBNQVhfRFJNQ0dfTEdQVV9DQVBBQ0lUWSkpIHs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkcm1jZ19w
cl9jZnRfZXJyKGRybWNnLCAwLCBjZnRfbmFtZSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBtaW5vcik7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgY29udGludWU7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgYml0bWFwX2NvcHkoZGRyLSZndDtsZ3B1X2NmZywgdG1wX2JpdG1hcCw8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBw
cm9wcy0mZ3Q7bGdwdV9jYXBhY2l0eSk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGJyZWFrOyAvKiBEUk1DR19UWVBFX0xHUFUgKi88YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBkZWZhdWx0Ojxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGJyZWFrOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0gLyogc3dpdGNo
ICh0eXBlKSAqLzxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorfTxicj4NCis8YnI+DQorPGJyPg0K
wqAvKio8YnI+DQrCoCAqIGRybWNnX2xpbWl0X3dyaXRlIC0gcGFyc2UgY2dyb3VwIGludGVyZmFj
ZSBmaWxlcyB0byBvYnRhaW4gdXNlciBjb25maWc8YnI+DQrCoCAqPGJyPg0KQEAgLTQ5OSw5ICs3
NzEsMTUgQEAgc3RhdGljIHNzaXplX3QgZHJtY2dfbGltaXRfd3JpdGUoc3RydWN0IGtlcm5mc19v
cGVuX2ZpbGUgKm9mLCBjaGFyICpidWYsPGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgZGRyLSZndDtib19saW1pdHNfcGVha19hbGxvY2F0ZWQgPSB2YWw7PGJy
Pg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYnJlYWs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgY2FzZSBEUk1DR19UWVBFX0xHUFU6PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZHJtY2dfbmVzdGVkX2xpbWl0X3BhcnNlKG9mLCBkbS0m
Z3Q7ZGV2LCBzYXR0cik7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
YnJlYWs7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZGVmYXVsdDo8YnI+DQrCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBicmVhazs8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRybWNnX2FwcGx5
X2VmZmVjdGl2ZSh0eXBlLCBkbS0mZ3Q7ZGV2LCBkcm1jZyk7PGJyPg0KKzxicj4NCsKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIG11dGV4X3VubG9jaygmYW1wO2RtLSZndDtkZXYtJmd0O2RybWNnX211
dGV4KTs8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBtdXRleF9sb2NrKCZhbXA7
ZHJtY2dfbXV0ZXgpOzxicj4NCkBAIC01NjAsMTIgKzgzOCw1MSBAQCBzdHJ1Y3QgY2Z0eXBlIGZp
bGVzW10gPSB7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLnByaXZhdGUgPSBEUk1DR19D
VEZfUFJJVihEUk1DR19UWVBFX0JPX0NPVU5ULDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIERSTUNHX0ZU
WVBFX1NUQVRTKSw8YnI+DQrCoCDCoCDCoCDCoCB9LDxicj4NCivCoCDCoCDCoCDCoHs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAubmFtZSA9ICZxdW90O2xncHUmcXVvdDssPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgLnNlcV9zaG93ID0gZHJtY2dfc2VxX3Nob3csPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgLndyaXRlID0gZHJtY2dfbGltaXRfd3JpdGUsPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgLnByaXZhdGUgPSBEUk1DR19DVEZfUFJJVihEUk1DR19UWVBF
X0xHUFUsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgRFJNQ0dfRlRZUEVfTElNSVQpLDxicj4NCivCoCDC
oCDCoCDCoH0sPGJyPg0KK8KgIMKgIMKgIMKgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oC5uYW1lID0gJnF1b3Q7bGdwdS5kZWZhdWx0JnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoC5zZXFfc2hvdyA9IGRybWNnX3NlcV9zaG93LDxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoC5mbGFncyA9IENGVFlQRV9PTkxZX09OX1JPT1QsPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgLnByaXZhdGUgPSBEUk1DR19DVEZfUFJJVihEUk1DR19UWVBFX0xHUFUsPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgRFJNQ0dfRlRZUEVfREVGQVVMVCksPGJyPg0KK8KgIMKgIMKgIMKgfSw8
YnI+DQorwqAgwqAgwqAgwqB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm5hbWUgPSAm
cXVvdDtsZ3B1LmVmZmVjdGl2ZSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAu
c2VxX3Nob3cgPSBkcm1jZ19zZXFfc2hvdyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAu
cHJpdmF0ZSA9IERSTUNHX0NURl9QUklWKERSTUNHX1RZUEVfTEdQVV9FRkYsPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgRFJNQ0dfRlRZUEVfTElNSVQpLDxicj4NCivCoCDCoCDCoCDCoH0sPGJyPg0KwqAg
wqAgwqAgwqAgeyB9wqAgwqAgwqAvKiB0ZXJtaW5hdGUgKi88YnI+DQrCoH07PGJyPg0KPGJyPg0K
K3N0YXRpYyBpbnQgZHJtY2dfb25saW5lX2ZuKGludCBpZCwgdm9pZCAqcHRyLCB2b2lkICpkYXRh
KTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IGRybV9taW5vciAqbWlub3IgPSBwdHI7
PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IGRybWNnICpkcm1jZyA9IGRhdGE7PGJyPg0KKzxicj4N
CivCoCDCoCDCoCDCoGlmIChtaW5vci0mZ3Q7dHlwZSAhPSBEUk1fTUlOT1JfUFJJTUFSWSk8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gMDs8YnI+DQorPGJyPg0KK8KgIMKgIMKg
IMKgZHJtY2dfYXBwbHlfZWZmZWN0aXZlKERSTUNHX1RZUEVfTEdQVSwgbWlub3ItJmd0O2Rldiwg
ZHJtY2cpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqByZXR1cm4gMDs8YnI+DQorfTxicj4NCis8
YnI+DQorc3RhdGljIGludCBkcm1jZ19jc3Nfb25saW5lKHN0cnVjdCBjZ3JvdXBfc3Vic3lzX3N0
YXRlICpjc3MpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqByZXR1cm4gZHJtX21pbm9yX2Zvcl9l
YWNoKCZhbXA7ZHJtY2dfb25saW5lX2ZuLCBjc3NfdG9fZHJtY2coY3NzKSk7PGJyPg0KK308YnI+
DQorPGJyPg0KwqBzdHJ1Y3QgY2dyb3VwX3N1YnN5cyBkcm1fY2dycF9zdWJzeXMgPSB7PGJyPg0K
wqAgwqAgwqAgwqAgLmNzc19hbGxvY8KgIMKgIMKgID0gZHJtY2dfY3NzX2FsbG9jLDxicj4NCsKg
IMKgIMKgIMKgIC5jc3NfZnJlZcKgIMKgIMKgIMKgPSBkcm1jZ19jc3NfZnJlZSw8YnI+DQorwqAg
wqAgwqAgwqAuY3NzX29ubGluZcKgIMKgIMKgPSBkcm1jZ19jc3Nfb25saW5lLDxicj4NCsKgIMKg
IMKgIMKgIC5lYXJseV9pbml0wqAgwqAgwqA9IGZhbHNlLDxicj4NCsKgIMKgIMKgIMKgIC5sZWdh
Y3lfY2Z0eXBlcyA9IGZpbGVzLDxicj4NCsKgIMKgIMKgIMKgIC5kZmxfY2Z0eXBlc8KgIMKgID0g
ZmlsZXMsPGJyPg0KQEAgLTU4NSw2ICs5MDIsOSBAQCB2b2lkIGRybWNnX2RldmljZV9lYXJseV9p
bml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpPGJyPg0KwqAgwqAgwqAgwqAgZGV2LSZndDtkcm1j
Z19wcm9wcy5ib19saW1pdHNfdG90YWxfYWxsb2NhdGVkX2RlZmF1bHQgPSBTNjRfTUFYOzxicj4N
CsKgIMKgIMKgIMKgIGRldi0mZ3Q7ZHJtY2dfcHJvcHMuYm9fbGltaXRzX3BlYWtfYWxsb2NhdGVk
X2RlZmF1bHQgPSBTNjRfTUFYOzxicj4NCjxicj4NCivCoCDCoCDCoCDCoGRldi0mZ3Q7ZHJtY2df
cHJvcHMubGdwdV9jYXBhY2l0eSA9IE1BWF9EUk1DR19MR1BVX0NBUEFDSVRZOzxicj4NCivCoCDC
oCDCoCDCoGJpdG1hcF9maWxsKGRldi0mZ3Q7ZHJtY2dfcHJvcHMubGdwdV9zbG90cywgTUFYX0RS
TUNHX0xHUFVfQ0FQQUNJVFkpOzxicj4NCis8YnI+DQrCoCDCoCDCoCDCoCBkcm1jZ191cGRhdGVf
Y2dfdHJlZShkZXYpOzxicj4NCsKgfTxicj4NCsKgRVhQT1JUX1NZTUJPTChkcm1jZ19kZXZpY2Vf
ZWFybHlfaW5pdCk7PGJyPg0KLS0gPGJyPg0KMi4yNS4wPGJyPg0KPGJyPg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+DQpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0PGJyPg0KPGEgaHJlZj0ibWFpbHRvOmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmciIHRhcmdldD0iX2JsYW5rIj5kcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPC9hPjxi
cj4NCjxhIGhyZWY9Imh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbDwvYT48YnI+DQo8
L2Jsb2NrcXVvdGU+PC9kaXY+DQo=
--0000000000002c600b059e8bec7d--

--===============0811772169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0811772169==--
