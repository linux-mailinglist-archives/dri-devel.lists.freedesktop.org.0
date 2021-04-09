Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5523B35A7EB
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 22:35:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606586EBAA;
	Fri,  9 Apr 2021 20:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D5F6EBAA;
 Fri,  9 Apr 2021 20:35:15 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id k128so3535826wmk.4;
 Fri, 09 Apr 2021 13:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lah2wW2I5ZnoZQtbrU1e6/KeLdxhjXLyi+ia8VJ6l7E=;
 b=F52FK/LNVuRZS2LbWNoyi0GAvEBilL7iln7ATl6DsCfoWe1KDt4isX56Wdj7zmkMDD
 OCqDBqC41k2OYx2Wa1jgDpnh9lH1Jh5Yk4hLquJfWEiQs6n/+FXHa3GT0fynk9VyLKCu
 xcY+PGgW5ZSMZ0RT8Z0VGz2oHNHw1XduhDJNUk7gfMsdkrnWRt8KhwTMqCc6rvdLuhuE
 juRAZhgs4TV5oWr3x4E8MTi1/Z2/Pu+Tz6FOhiFmdJqFV2624MAbsw0iRhTMhhVz1w0a
 7GvJUyWm0i6Lr/oz0jB73OgVvDEvJk+W6ofwmYdbEu/Bz0D4KyXuDZJp/ftWII3kQNrM
 H9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lah2wW2I5ZnoZQtbrU1e6/KeLdxhjXLyi+ia8VJ6l7E=;
 b=KGp+5f1UTHBX2VTdzjSx2pTpz0NEqYlegMnpeg5oi2xBkVAtycPEHnZNsVuJFgR2zT
 UxKT3z7hv/KXSmUrtlolCCsECrJuDHh8iyQ02BDWFVJYtKC7fgpsyKb9jMV2De/KOMaA
 X7YxfAZULgYFuzYNFh/1KBm/mcuc7IY63HKa7dPvQJmaoUEbOD8gAl1m3bEUTOU47fdz
 8gFpvVXE9y6wY66h3WhFc3QgOkbstHg7ViOGesQYh1rgTt3iF9rRnLXf6UWJsew7CRdG
 SlOBK+h7vZaPcdbatQJcQp7XtwyFy9XFyGAzfsaqRhi0NmunscBqg/xzcXd62bAlelIl
 BY/g==
X-Gm-Message-State: AOAM530+khqFRRCyOK89ifHWxIuAxkMgZ6Yo3IwX2Cu4eIPh6Uh+t7IR
 4Tgp1nxzBEGDsnO0+ovlHIm7ocj07hjDKIca0lE=
X-Google-Smtp-Source: ABdhPJy2XEE9Xe4UZgjee/uW77zx2o+lG97Hp47+t9eLH8L1C9oGDWXdeud/SyXaEqusSxgONakmsCBb6wcctOlVGbw=
X-Received: by 2002:a05:600c:4103:: with SMTP id
 j3mr15345399wmi.175.1618000514343; 
 Fri, 09 Apr 2021 13:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <1617935317-15571-1-git-send-email-abhinavk@codeaurora.org>
 <1617935317-15571-3-git-send-email-abhinavk@codeaurora.org>
In-Reply-To: <1617935317-15571-3-git-send-email-abhinavk@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 9 Apr 2021 13:38:42 -0700
Message-ID: <CAF6AEGt+-XmP-diTwVWoSRNM0u3ehY8ZkeHDdK3ZbVzUcmxX4A@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/msm/dpu: add support to dump dpu registers
To: Abhinav Kumar <abhinavk@codeaurora.org>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <khsieh@codeaurora.org>,
 Sean Paul <seanpaul@chromium.org>, aravindh@codeaurora.org,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 8, 2021 at 7:28 PM Abhinav Kumar <abhinavk@codeaurora.org> wrote:
>
> Add the dpu_dbg module which adds supports to dump dpu registers
> which can be used in case of error conditions.
>
> changes in v3:
>  - Get rid of registration mechanism for sub-modules and instead get
>    this information from the dpu catalog itself
>  - Get rid of global dpu_dbg struct and instead store it in dpu_kms
>  - delegate the power management of the sub-modules to the resp drivers
>  - refactor and remove the linked list logic and simplify it to have
>    just an array
>
> Change-Id: Ide975ecf5d7952ae44daaa6eb611e27d09630be5
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/Makefile                   |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.c        | 221 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.h        | 200 +++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c   | 257 +++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |   2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |  86 +++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h        |   5 +
>  drivers/gpu/drm/msm/dp/dp_catalog.c            |  10 +
>  drivers/gpu/drm/msm/dp/dp_catalog.h            |   5 +
>  drivers/gpu/drm/msm/dp/dp_display.c            |  37 ++++
>  drivers/gpu/drm/msm/dp/dp_display.h            |   1 +
>  drivers/gpu/drm/msm/dsi/dsi.c                  |   5 +
>  drivers/gpu/drm/msm/dsi/dsi.h                  |   4 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c             |  25 +++
>  drivers/gpu/drm/msm/msm_drv.c                  |  29 ++-
>  drivers/gpu/drm/msm/msm_drv.h                  |   2 +
>  16 files changed, 889 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.c
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.h
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c
>

[snip]

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.h
> new file mode 100644
> index 0000000..302205a
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.h
> @@ -0,0 +1,200 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef DPU_DBG_H_
> +#define DPU_DBG_H_
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_device.h>
> +#include "../../../drm_crtc_internal.h"
> +#include <drm/drm_print.h>
> +#include <drm/drm_atomic.h>
> +#include <linux/debugfs.h>
> +#include <linux/list.h>
> +#include <linux/delay.h>
> +#include <linux/spinlock.h>
> +#include <linux/ktime.h>
> +#include <linux/debugfs.h>
> +#include <linux/uaccess.h>
> +#include <linux/dma-buf.h>
> +#include <linux/slab.h>
> +#include <linux/list_sort.h>
> +#include <linux/pm.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/kthread.h>
> +#include <linux/devcoredump.h>
> +#include <stdarg.h>
> +#include "dpu_hw_catalog.h"
> +#include "dpu_kms.h"
> +#include "dsi.h"
> +
> +#define DPU_DBG_DUMP_DATA_LIMITER (NULL)
> +
> +enum dpu_dbg_dump_flag {
> +       DPU_DBG_DUMP_IN_LOG = BIT(0),
> +       DPU_DBG_DUMP_IN_MEM = BIT(1),
> +       DPU_DBG_DUMP_IN_COREDUMP = BIT(2),
> +};

overall, I like this better, but..

I'm not completely convinced about the need for
DUMP_IN_LOG/DUMP_IN_MEM.. we haven't really needed it on the GPU side
of things, and the only case I can think of where it might be useful
is if you can't boot far enough to get to some minimal userspace..
once you have at least some minimal userspace, you can just pull out
and clear the devcore dump via sysfs.  That said, if state snapshot
and printing were better separated it would just take a few lines of
code to use a different drm_printer to print the state snapshot to
dmesg.

[snip]

> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index ab281cb..d1675ee 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -2489,3 +2489,28 @@ struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host *host)
>
>         return of_drm_find_bridge(msm_host->device_node);
>  }
> +
> +void msm_dsi_host_dump_regs(struct mipi_dsi_host *host)
> +{
> +       struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> +       struct drm_device *dev = msm_host->dev;
> +       struct dpu_dbg_base *dpu_dbg;
> +
> +       dpu_dbg = dpu_dbg_get(dev);
> +
> +       if (dpu_dbg_is_drm_printer_needed(dpu_dbg) &&
> +                       !dpu_dbg->dpu_dbg_printer) {
> +               pr_err("invalid drm printer\n");
> +               return;
> +       }

for example, here ^^^

why should the other blocks even care?  All they should know is that
they've been asked to snapshot their state..

> +       if (dpu_dbg->reg_dump_method == DPU_DBG_DUMP_IN_MEM)
> +               pm_runtime_get_sync(&msm_host->pdev->dev);
> +
> +       dpu_dbg_dump_regs(&dpu_dbg->dsi_ctrl_regs[msm_host->id],
> +                       msm_iomap_size(msm_host->pdev, "dsi_ctrl"), msm_host->ctrl_base,
> +                       dpu_dbg->reg_dump_method, dpu_dbg->dpu_dbg_printer);
> +
> +       if (dpu_dbg->reg_dump_method == DPU_DBG_DUMP_IN_MEM)
> +               pm_runtime_put_sync(&msm_host->pdev->dev);
> +}

I'm thinking something more along the lines of (in drm/msm/disp so it
is a little less weird for dsi/dp/etc to be #include'ing header with
structs):

struct msm_disp_state {
    .. maybe a bit of generic information like kernel version, time, etc ...

   struct list_head blocks;  /* list of msm_disp_state_block */
};

struct msm_disp_state_block {
   const char *name;
   struct list_head node;  /* node in msm_disp_state::blocks */
   unsigned size;
   uint32_t state[];
};

struct msm_disp_state * msm_disp_snapshot_state(struct drm_device *dev)
{
   struct msm_disp_state *state = ...;

   if (priv->kms)
      priv->kms->snapshot(priv->kms, state);

   for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
      msm_dsi_snapshot(priv->dsi[i], state);

   if (priv->dp)
      msm_dp_snapshot(priv->dp, state);

   return state;
}

... maybe add a helper that can be used everywhere to allocate and
append a new state block.. Ie. pass it state/name/len/iomem

void msm_disp_state_free(struct msm_disp_state *state)
{
   list_for_each_entry_safe (block, ...)
     kfree(block);
   kfree(state)
}

void msm_disp_state_print(struct drm_disp_state *state, drm_printer *p)
{
   .. print generic state and loop over state->blocks printing them ..
}

... if you do need to support printing to dmesg, you could re-use
msm_disp_state_print() with an drm_info printer in just a few lines of
code, rather than spreading the logic far and wide.

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
