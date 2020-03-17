Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C673A1889B3
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 17:03:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D926E245;
	Tue, 17 Mar 2020 16:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A916E23D;
 Tue, 17 Mar 2020 16:03:34 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id h4so5795026wru.2;
 Tue, 17 Mar 2020 09:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tMlGQGB+oYIlvMnPFJA29Wh4mauBA+V5dYoIlJY/HjU=;
 b=ajqy5VxbiZhBU4ZMxi2OTNC+faAUWjenp6ED1Z/nHjog28ZsIZOfOK3yScSzAxR8/9
 vN9koPIUOW7wRReoiVRjniN5eYCkjRHosIgoe0YTFU+aZz0Xnd7W/sJdUxaDDA/8jDYQ
 PG/LJbtM1o6f9BxMJVHGlPRpJ/dmYpF/9MO4JgIhQ5+yD5z1uoK44Z5Sr0V91UcxuiMm
 JBO/tyUtEbqVDJ2aMYx0CcjFdc1qQQhGx0F4W3ceJd8z6QNrsdVflC4RTmVycfasTr3G
 3Ehpk83HdS9XA7K6+dJaAjHiqj9QyZuJVjv4ooKuQ9p6R6WLSVZmLauM9huxKpDZt8rI
 BYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tMlGQGB+oYIlvMnPFJA29Wh4mauBA+V5dYoIlJY/HjU=;
 b=BHSTt49HNjJnvne31qhFkoota2sdqjJlFqg1pVGCg0EvpOD3yWTPHgQ8rfiTsBqHxR
 wBKS66TeLaTIOP1ITseHws3fpn8Y/Mr7yr8K45ghd7e0mFb9Fx+4rV+16k5tV8CamXKR
 xNqK3S0g2ITxQitne1me6XO9VqTmtq/yGuFyGLeD7Dq+sKp+pJ6sw4FSzMjTNqUzBXgc
 Mksa93VaGEuiJmrapnGZkrPKmJBPwn83VBKcdURdTnVfD6kz1QVkTJ9+h16ojeWFZhl8
 u3k3ymCZJCUe8X/jBDXggO2DaK9GjDpqTgGgRJ85PE9VAxCFNUpbVlgXKCcZnmc5LYus
 cGdA==
X-Gm-Message-State: ANhLgQ2ZtTE86VodPnkLw3gLRxGNbJPuZlhwdrpIF57uCHMwhS6A0JE5
 naXAsJ5KQ0szEX5/4uDWJmroUVJ9hDydqzvdfjk=
X-Google-Smtp-Source: ADFU+vsqwhvP7+qXd84mEv/VN8m5wm44CR7fv9zlZqVVuCj/DXAKBr6PfrnXrQEAQpARXuRJVeTnAZeLkJ+L0mlrcks=
X-Received: by 2002:a5d:6091:: with SMTP id w17mr6747515wrt.402.1584461012473; 
 Tue, 17 Mar 2020 09:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200226190152.16131-1-Kenny.Ho@amd.com>
In-Reply-To: <20200226190152.16131-1-Kenny.Ho@amd.com>
From: Kenny Ho <y2kenny@gmail.com>
Date: Tue, 17 Mar 2020 12:03:20 -0400
Message-ID: <CAOWid-eyMGZfOyfEQikwCmPnKxx6MnTm17pBvPeNpgKWi0xN-w@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] new cgroup controller for gpu/drm subsystem
To: Kenny Ho <Kenny.Ho@amd.com>, Tejun Heo <tj@kernel.org>
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
Cc: "Kuehling, Felix" <felix.kuehling@amd.com>, jsparks@cray.com,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Greathouse,
 Joseph" <joseph.greathouse@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 cgroups@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tejun,

What's your thoughts on this latest series?

Regards,
Kenny

On Wed, Feb 26, 2020 at 2:02 PM Kenny Ho <Kenny.Ho@amd.com> wrote:
>
> This is a submission for the introduction of a new cgroup controller for the drm subsystem follow a series of RFCs [v1, v2, v3, v4]
>
> Changes from PR v1
> * changed cgroup controller name from drm to gpu
> * removed lgpu
> * added compute.weight resources, clarified resources being distributed as partitions of compute device
>
> PR v1: https://www.spinics.net/lists/cgroups/msg24479.html
>
> Changes from the RFC base on the feedbacks:
> * drop all drm.memory.* related implementation and focus only on buffer and lgpu
> * add weight resource type for logical gpu (lgpu)
> * uncoupled drmcg device iteration from drm_minor
>
> I'd also like to highlight the fact that these patches are currently released under MIT/X11 license aligning with the norm of the drm subsystem, but I am working to have the cgroup parts release under GPLv2 to align with the norm of the cgroup subsystem.
>
> RFC:
> [v1]: https://lists.freedesktop.org/archives/dri-devel/2018-November/197106.html
> [v2]: https://www.spinics.net/lists/cgroups/msg22074.html
> [v3]: https://lists.freedesktop.org/archives/amd-gfx/2019-June/036026.html
> [v4]: https://patchwork.kernel.org/cover/11120371/
>
> Changes since the start of RFC are as follows:
>
> v4:
> Unchanged (no review needed)
> * drm.memory.*/ttm resources (Patch 9-13, I am still working on memory bandwidth
> and shrinker)
> Base on feedbacks on v3:
> * update nominclature to drmcg
> * embed per device drmcg properties into drm_device
> * split GEM buffer related commits into stats and limit
> * rename function name to align with convention
> * combined buffer accounting and check into a try_charge function
> * support buffer stats without limit enforcement
> * removed GEM buffer sharing limitation
> * updated documentations
> New features:
> * introducing logical GPU concept
> * example implementation with AMD KFD
>
> v3:
> Base on feedbacks on v2:
> * removed .help type file from v2
> * conform to cgroup convention for default and max handling
> * conform to cgroup convention for addressing device specific limits (with major:minor)
> New function:
> * adopted memparse for memory size related attributes
> * added macro to marshall drmcgrp cftype private ?(DRMCG_CTF_PRIV, etc.)
> * added ttm buffer usage stats (per cgroup, for system, tt, vram.)
> * added ttm buffer usage limit (per cgroup, for vram.)
> * added per cgroup bandwidth stats and limiting (burst and average bandwidth)
>
> v2:
> * Removed the vendoring concepts
> * Add limit to total buffer allocation
> * Add limit to the maximum size of a buffer allocation
>
> v1: cover letter
>
> The purpose of this patch series is to start a discussion for a generic cgroup
> controller for the drm subsystem.  The design proposed here is a very early
> one.  We are hoping to engage the community as we develop the idea.
>
> Backgrounds
> ===========
> Control Groups/cgroup provide a mechanism for aggregating/partitioning sets of
> tasks, and all their future children, into hierarchical groups with specialized
> behaviour, such as accounting/limiting the resources which processes in a
> cgroup can access[1].  Weights, limits, protections, allocations are the main
> resource distribution models.  Existing cgroup controllers includes cpu,
> memory, io, rdma, and more.  cgroup is one of the foundational technologies
> that enables the popular container application deployment and management method.
>
> Direct Rendering Manager/drm contains code intended to support the needs of
> complex graphics devices. Graphics drivers in the kernel may make use of DRM
> functions to make tasks like memory management, interrupt handling and DMA
> easier, and provide a uniform interface to applications.  The DRM has also
> developed beyond traditional graphics applications to support compute/GPGPU
> applications.
>
> Motivations
> ===========
> As GPU grow beyond the realm of desktop/workstation graphics into areas like
> data center clusters and IoT, there are increasing needs to monitor and
> regulate GPU as a resource like cpu, memory and io.
>
> Matt Roper from Intel began working on similar idea in early 2018 [2] for the
> purpose of managing GPU priority using the cgroup hierarchy.  While that
> particular use case may not warrant a standalone drm cgroup controller, there
> are other use cases where having one can be useful [3].  Monitoring GPU
> resources such as VRAM and buffers, CU (compute unit [AMD's nomenclature])/EU
> (execution unit [Intel's nomenclature]), GPU job scheduling [4] can help
> sysadmins get a better understanding of the applications usage profile.
> Further usage regulations of the aforementioned resources can also help sysadmins
> optimize workload deployment on limited GPU resources.
>
> With the increased importance of machine learning, data science and other
> cloud-based applications, GPUs are already in production use in data centers
> today [5,6,7].  Existing GPU resource management is very course grain, however,
> as sysadmins are only able to distribute workload on a per-GPU basis [8].  An
> alternative is to use GPU virtualization (with or without SRIOV) but it
> generally acts on the entire GPU instead of the specific resources in a GPU.
> With a drm cgroup controller, we can enable alternate, fine-grain, sub-GPU
> resource management (in addition to what may be available via GPU
> virtualization.)
>
> In addition to production use, the DRM cgroup can also help with testing
> graphics application robustness by providing a mean to artificially limit DRM
> resources availble to the applications.
>
>
> Challenges
> ==========
> While there are common infrastructure in DRM that is shared across many vendors
> (the scheduler [4] for example), there are also aspects of DRM that are vendor
> specific.  To accommodate this, we borrowed the mechanism used by the cgroup to
> handle different kinds of cgroup controller.
>
> Resources for DRM are also often device (GPU) specific instead of system
> specific and a system may contain more than one GPU.  For this, we borrowed
> some of the ideas from RDMA cgroup controller.
>
> Approach
> ========
> To experiment with the idea of a DRM cgroup, we would like to start with basic
> accounting and statistics, then continue to iterate and add regulating
> mechanisms into the driver.
>
> [1] https://www.kernel.org/doc/Documentation/cgroup-v1/cgroups.txt
> [2] https://lists.freedesktop.org/archives/intel-gfx/2018-January/153156.html
> [3] https://www.spinics.net/lists/cgroups/msg20720.html
> [4] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/scheduler
> [5] https://kubernetes.io/docs/tasks/manage-gpus/scheduling-gpus/
> [6] https://blog.openshift.com/gpu-accelerated-sql-queries-with-postgresql-pg-strom-in-openshift-3-10/
> [7] https://github.com/RadeonOpenCompute/k8s-device-plugin
> [8] https://github.com/kubernetes/kubernetes/issues/52757
>
> Kenny Ho (11):
>   cgroup: Introduce cgroup for drm subsystem
>   drm, cgroup: Bind drm and cgroup subsystem
>   drm, cgroup: Initialize drmcg properties
>   drm, cgroup: Add total GEM buffer allocation stats
>   drm, cgroup: Add peak GEM buffer allocation stats
>   drm, cgroup: Add GEM buffer allocation count stats
>   drm, cgroup: Add total GEM buffer allocation limit
>   drm, cgroup: Add peak GEM buffer allocation limit
>   drm, cgroup: Add compute as gpu cgroup resource
>   drm, cgroup: add update trigger after limit change
>   drm/amdgpu: Integrate with DRM cgroup
>
>  Documentation/admin-guide/cgroup-v2.rst       | 138 ++-
>  Documentation/cgroup-v1/drm.rst               |   1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   4 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  48 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |   6 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |   7 +
>  drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   3 +
>  .../amd/amdkfd/kfd_process_queue_manager.c    | 153 +++
>  drivers/gpu/drm/drm_drv.c                     |  12 +
>  drivers/gpu/drm/drm_gem.c                     |  16 +-
>  include/drm/drm_cgroup.h                      |  81 ++
>  include/drm/drm_device.h                      |   7 +
>  include/drm/drm_drv.h                         |  19 +
>  include/drm/drm_gem.h                         |  12 +-
>  include/linux/cgroup_drm.h                    | 138 +++
>  include/linux/cgroup_subsys.h                 |   4 +
>  init/Kconfig                                  |   5 +
>  kernel/cgroup/Makefile                        |   1 +
>  kernel/cgroup/drm.c                           | 913 ++++++++++++++++++
>  19 files changed, 1563 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/cgroup-v1/drm.rst
>  create mode 100644 include/drm/drm_cgroup.h
>  create mode 100644 include/linux/cgroup_drm.h
>  create mode 100644 kernel/cgroup/drm.c
>
> --
> 2.25.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
