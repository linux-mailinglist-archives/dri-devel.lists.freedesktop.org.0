Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBA96BDAD6
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 22:23:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D585410E090;
	Thu, 16 Mar 2023 21:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0029A10E090;
 Thu, 16 Mar 2023 21:22:59 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-177ca271cb8so3684902fac.2; 
 Thu, 16 Mar 2023 14:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679001778;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZOLm3MMBl89f2knm/a6i4nSTBzWYSuBzK1XClYHpMY4=;
 b=dSmvj4c+vhVDAQ5Zaj5Yr1DRJ4ybiDnIB4G/ylPHrFHhzAkda0nDV6qsFCC8XDGrq+
 eT863QrK6B/IcIyiPUEC4cRa0GtMAf779fuR3ilmeIz53fivuQJbIrNpTfioj65CSN0H
 EeQrdTv00bm9+R5ydA9cNvPyYFvlb5Cnck9wzX0V9VQxZBd0VDTDVRn3TXCLm3gBmkgv
 aW6YQ2C6DOswHq1c91ga2KdN/R7P23WfSv+rgkxc82u7+5Opfko/BDf2Zi8BEuF7OVQ7
 SKPdGvyXBblcQx6g3Bq8ebiT5ydjjneIU031EZX9bw84Lsn8FMDupirSITw5TxEuucC9
 t07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679001778;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZOLm3MMBl89f2knm/a6i4nSTBzWYSuBzK1XClYHpMY4=;
 b=YQ0l4Ey2xVryHl3ugS6iBQm00QT+CcO8/+BbsAZxr/t3gffn3hKn8uC/z+J5yQqMBn
 HLr/1WE393Li71kwuf6/uhZLt6NHw7K7StIVgofEByeXL/K1NUZVZuEPERz6o8ffQSRm
 tsr9CeEWvUaxdWbJv7Y5ztGPefarQNiWh9enGkOtLLvlrR4GJJn0u7i6TCxGerUPrPkQ
 Ek3y7+GSCrFG4e6ptFOsKzjuMg6dYKKTT7llEEDWI9/IBiMbC4zOGeEzvMGKTudvtuZA
 QFlkDhWVi0NkVK8fhKQi6kjJgFBdGDi0Tc8qLy/2P2DQ0OsMeGVUh5Qzm/zbHGw7MePo
 hRbA==
X-Gm-Message-State: AO0yUKXtURuNSOM+a0URTUUpb18QB7XNfqOefE3cwY17epGNG2Ap46X0
 IsfKTDghpUrS8CoGzLnPeI/CXL33nZzyCSbrpO/mjsCSYPg=
X-Google-Smtp-Source: AK7set+faq17A1DBESVulT7MGuaccV0D25PIH9DGSJys9ZSVMyY9sK6nmcgZ9NZNMc3lxfUhJXYBUInIOT3YmaNi5n0=
X-Received: by 2002:a05:6870:6125:b0:177:be3d:2e4d with SMTP id
 s37-20020a056870612500b00177be3d2e4dmr6744075oae.5.1679001778698; Thu, 16 Mar
 2023 14:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230308155322.344664-1-robdclark@gmail.com>
In-Reply-To: <20230308155322.344664-1-robdclark@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 16 Mar 2023 14:22:47 -0700
Message-ID: <CAF6AEGs1A-3vHtCCam+LfweBNG76TPrpsn8u+RzZ8=sq18yrNg@mail.gmail.com>
Subject: Re: [PATCH v10 00/15] dma-fence: Deadline awareness
To: dri-devel@lists.freedesktop.org
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Douglas Anderson <dianders@chromium.org>, Liu Shixin <liushixin2@huawei.com>,
 Rob Clark <robdclark@chromium.org>, Vinod Polimera <quic_vpolimer@quicinc.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Matt Turner <mattst88@gmail.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 8, 2023 at 7:53=E2=80=AFAM Rob Clark <robdclark@gmail.com> wrot=
e:
>
> From: Rob Clark <robdclark@chromium.org>
>
> This series adds a deadline hint to fences, so realtime deadlines
> such as vblank can be communicated to the fence signaller for power/
> frequency management decisions.
>
> This is partially inspired by a trick i915 does, but implemented
> via dma-fence for a couple of reasons:
>
> 1) To continue to be able to use the atomic helpers
> 2) To support cases where display and gpu are different drivers
>
> This iteration adds a dma-fence ioctl to set a deadline (both to
> support igt-tests, and compositors which delay decisions about which
> client buffer to display), and a sw_sync ioctl to read back the
> deadline.  IGT tests utilizing these can be found at:
>
>   https://gitlab.freedesktop.org/robclark/igt-gpu-tools/-/commits/fence-d=
eadline
>

jfwiw, mesa side of this:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/21973

BR,
-R

>
> v1: https://patchwork.freedesktop.org/series/93035/
> v2: Move filtering out of later deadlines to fence implementation
>     to avoid increasing the size of dma_fence
> v3: Add support in fence-array and fence-chain; Add some uabi to
>     support igt tests and userspace compositors.
> v4: Rebase, address various comments, and add syncobj deadline
>     support, and sync_file EPOLLPRI based on experience with perf/
>     freq issues with clvk compute workloads on i915 (anv)
> v5: Clarify that this is a hint as opposed to a more hard deadline
>     guarantee, switch to using u64 ns values in UABI (still absolute
>     CLOCK_MONOTONIC values), drop syncobj related cap and driver
>     feature flag in favor of allowing count_handles=3D=3D0 for probing
>     kernel support.
> v6: Re-work vblank helper to calculate time of _start_ of vblank,
>     and work correctly if the last vblank event was more than a
>     frame ago.  Add (mostly unrelated) drm/msm patch which also
>     uses the vblank helper.  Use dma_fence_chain_contained().  More
>     verbose syncobj UABI comments.  Drop DMA_FENCE_FLAG_HAS_DEADLINE_BIT.
> v7: Fix kbuild complaints about vblank helper.  Add more docs.
> v8: Add patch to surface sync_file UAPI, and more docs updates.
> v9: Drop (E)POLLPRI support.. I still like it, but not essential and
>     it can always be revived later.  Fix doc build warning.
> v10: Update 11/15 to handle multiple CRTCs
>
> Rob Clark (15):
>   dma-buf/dma-fence: Add deadline awareness
>   dma-buf/fence-array: Add fence deadline support
>   dma-buf/fence-chain: Add fence deadline support
>   dma-buf/dma-resv: Add a way to set fence deadline
>   dma-buf/sync_file: Surface sync-file uABI
>   dma-buf/sync_file: Add SET_DEADLINE ioctl
>   dma-buf/sw_sync: Add fence deadline support
>   drm/scheduler: Add fence deadline support
>   drm/syncobj: Add deadline support for syncobj waits
>   drm/vblank: Add helper to get next vblank time
>   drm/atomic-helper: Set fence deadline for vblank
>   drm/msm: Add deadline based boost support
>   drm/msm: Add wait-boost support
>   drm/msm/atomic: Switch to vblank_start helper
>   drm/i915: Add deadline based boost support
>
> Rob Clark (15):
>   dma-buf/dma-fence: Add deadline awareness
>   dma-buf/fence-array: Add fence deadline support
>   dma-buf/fence-chain: Add fence deadline support
>   dma-buf/dma-resv: Add a way to set fence deadline
>   dma-buf/sync_file: Surface sync-file uABI
>   dma-buf/sync_file: Add SET_DEADLINE ioctl
>   dma-buf/sw_sync: Add fence deadline support
>   drm/scheduler: Add fence deadline support
>   drm/syncobj: Add deadline support for syncobj waits
>   drm/vblank: Add helper to get next vblank time
>   drm/atomic-helper: Set fence deadline for vblank
>   drm/msm: Add deadline based boost support
>   drm/msm: Add wait-boost support
>   drm/msm/atomic: Switch to vblank_start helper
>   drm/i915: Add deadline based boost support
>
>  Documentation/driver-api/dma-buf.rst    | 16 ++++-
>  drivers/dma-buf/dma-fence-array.c       | 11 ++++
>  drivers/dma-buf/dma-fence-chain.c       | 12 ++++
>  drivers/dma-buf/dma-fence.c             | 60 ++++++++++++++++++
>  drivers/dma-buf/dma-resv.c              | 22 +++++++
>  drivers/dma-buf/sw_sync.c               | 81 +++++++++++++++++++++++++
>  drivers/dma-buf/sync_debug.h            |  2 +
>  drivers/dma-buf/sync_file.c             | 19 ++++++
>  drivers/gpu/drm/drm_atomic_helper.c     | 37 +++++++++++
>  drivers/gpu/drm/drm_syncobj.c           | 64 +++++++++++++++----
>  drivers/gpu/drm/drm_vblank.c            | 53 +++++++++++++---
>  drivers/gpu/drm/i915/i915_request.c     | 20 ++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 15 -----
>  drivers/gpu/drm/msm/msm_atomic.c        |  8 ++-
>  drivers/gpu/drm/msm/msm_drv.c           | 12 ++--
>  drivers/gpu/drm/msm/msm_fence.c         | 74 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_fence.h         | 20 ++++++
>  drivers/gpu/drm/msm/msm_gem.c           |  5 ++
>  drivers/gpu/drm/msm/msm_kms.h           |  8 ---
>  drivers/gpu/drm/scheduler/sched_fence.c | 46 ++++++++++++++
>  drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
>  include/drm/drm_vblank.h                |  1 +
>  include/drm/gpu_scheduler.h             | 17 ++++++
>  include/linux/dma-fence.h               | 22 +++++++
>  include/linux/dma-resv.h                |  2 +
>  include/uapi/drm/drm.h                  | 17 ++++++
>  include/uapi/drm/msm_drm.h              | 14 ++++-
>  include/uapi/linux/sync_file.h          | 59 +++++++++++-------
>  28 files changed, 640 insertions(+), 79 deletions(-)
>
> --
> 2.39.2
>
