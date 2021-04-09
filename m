Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4095A35A848
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 23:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C876E053;
	Fri,  9 Apr 2021 21:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7806E053
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 21:20:29 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1618003230; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=OFzAxc4AiEMD6iYfqi8DGnfdTbkUGmiVNkhtHquvZYc=;
 b=AniqIqK2WY0ymvdRpmFQ+9F+XyYbfJp3+0rVe+JBnQbJzc6jXeVX9FHboS6KTiaYFVlR9+YT
 MmPNs4vkFAB29Z2BehMwL5ksLV23113dVWRoMoSv6+FcpO0BTU8XDZBTfbbmfmBg+LD0vdU+
 MUpMQINNOObyzm0KkMBqNCyxHEU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6070c5198807bcde1d90a9ab (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Apr 2021 21:20:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 26A65C43464; Fri,  9 Apr 2021 21:20:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7AF01C433C6;
 Fri,  9 Apr 2021 21:20:23 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 09 Apr 2021 14:20:23 -0700
From: abhinavk@codeaurora.org
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v3 2/3] drm/msm/dpu: add support to dump dpu registers
In-Reply-To: <CAF6AEGt+-XmP-diTwVWoSRNM0u3ehY8ZkeHDdK3ZbVzUcmxX4A@mail.gmail.com>
References: <1617935317-15571-1-git-send-email-abhinavk@codeaurora.org>
 <1617935317-15571-3-git-send-email-abhinavk@codeaurora.org>
 <CAF6AEGt+-XmP-diTwVWoSRNM0u3ehY8ZkeHDdK3ZbVzUcmxX4A@mail.gmail.com>
Message-ID: <cc00d0dcc5a299255121d45a3232b01d@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob

Thank you for the review.

On 2021-04-09 13:38, Rob Clark wrote:
> On Thu, Apr 8, 2021 at 7:28 PM Abhinav Kumar <abhinavk@codeaurora.org> 
> wrote:
>> 
>> Add the dpu_dbg module which adds supports to dump dpu registers
>> which can be used in case of error conditions.
>> 
>> changes in v3:
>>  - Get rid of registration mechanism for sub-modules and instead get
>>    this information from the dpu catalog itself
>>  - Get rid of global dpu_dbg struct and instead store it in dpu_kms
>>  - delegate the power management of the sub-modules to the resp 
>> drivers
>>  - refactor and remove the linked list logic and simplify it to have
>>    just an array
>> 
>> Change-Id: Ide975ecf5d7952ae44daaa6eb611e27d09630be5
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
>> ---
>>  drivers/gpu/drm/msm/Makefile                   |   2 +
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.c        | 221 
>> +++++++++++++++++++++
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.h        | 200 
>> +++++++++++++++++++
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c   | 257 
>> +++++++++++++++++++++++++
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |   2 +-
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |  86 +++++++++
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h        |   5 +
>>  drivers/gpu/drm/msm/dp/dp_catalog.c            |  10 +
>>  drivers/gpu/drm/msm/dp/dp_catalog.h            |   5 +
>>  drivers/gpu/drm/msm/dp/dp_display.c            |  37 ++++
>>  drivers/gpu/drm/msm/dp/dp_display.h            |   1 +
>>  drivers/gpu/drm/msm/dsi/dsi.c                  |   5 +
>>  drivers/gpu/drm/msm/dsi/dsi.h                  |   4 +
>>  drivers/gpu/drm/msm/dsi/dsi_host.c             |  25 +++
>>  drivers/gpu/drm/msm/msm_drv.c                  |  29 ++-
>>  drivers/gpu/drm/msm/msm_drv.h                  |   2 +
>>  16 files changed, 889 insertions(+), 2 deletions(-)
>>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.c
>>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.h
>>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c
>> 
> 
> [snip]
> 
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.h
>> new file mode 100644
>> index 0000000..302205a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.h
>> @@ -0,0 +1,200 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2020-2021, The Linux Foundation. All rights 
>> reserved.
>> + */
>> +
>> +#ifndef DPU_DBG_H_
>> +#define DPU_DBG_H_
>> +
>> +#include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_device.h>
>> +#include "../../../drm_crtc_internal.h"
>> +#include <drm/drm_print.h>
>> +#include <drm/drm_atomic.h>
>> +#include <linux/debugfs.h>
>> +#include <linux/list.h>
>> +#include <linux/delay.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/ktime.h>
>> +#include <linux/debugfs.h>
>> +#include <linux/uaccess.h>
>> +#include <linux/dma-buf.h>
>> +#include <linux/slab.h>
>> +#include <linux/list_sort.h>
>> +#include <linux/pm.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/kthread.h>
>> +#include <linux/devcoredump.h>
>> +#include <stdarg.h>
>> +#include "dpu_hw_catalog.h"
>> +#include "dpu_kms.h"
>> +#include "dsi.h"
>> +
>> +#define DPU_DBG_DUMP_DATA_LIMITER (NULL)
>> +
>> +enum dpu_dbg_dump_flag {
>> +       DPU_DBG_DUMP_IN_LOG = BIT(0),
>> +       DPU_DBG_DUMP_IN_MEM = BIT(1),
>> +       DPU_DBG_DUMP_IN_COREDUMP = BIT(2),
>> +};
> 
> overall, I like this better, but..
> 
> I'm not completely convinced about the need for
> DUMP_IN_LOG/DUMP_IN_MEM.. we haven't really needed it on the GPU side
> of things, and the only case I can think of where it might be useful
> is if you can't boot far enough to get to some minimal userspace..
> once you have at least some minimal userspace, you can just pull out
> and clear the devcore dump via sysfs.  That said, if state snapshot
> and printing were better separated it would just take a few lines of
> code to use a different drm_printer to print the state snapshot to
> dmesg.
> 
> [snip]
> 
Yes, dumping the registers to log is just a debug feature and also 
useful if
CONFIG_DEVCOREDUMP is not enabled.
Its also useful for developers who can just view the dumps in the logs.

Yes, the way this is written it is already generic enough to just take a 
different drm_printer.

For the log i use this:

+	if (DPU_DBG_DUMP_IN_CONSOLE) {
+		p = drm_info_printer(dpu_dbg->drm_dev->dev);
+		dpu_dbg->dpu_dbg_printer = &p;
+		dpu_dbg_print_regs(dpu_dbg->drm_dev, DPU_DBG_DUMP_IN_LOG);
+	}

For the coredump I use this,

p = drm_coredump_printer(&iter);
+
+	drm_printf(&p, "---\n");
+
+	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
+	drm_printf(&p, "dpu devcoredump\n");
+	drm_printf(&p, "timestamp %lld\n", ktime_to_ns(dpu_dbg->timestamp));
+
+	dpu_dbg->dpu_dbg_printer = &p;
+
+	dpu_dbg_print_regs(dpu_dbg->drm_dev, DPU_DBG_DUMP_IN_COREDUMP);


>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index ab281cb..d1675ee 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -2489,3 +2489,28 @@ struct drm_bridge 
>> *msm_dsi_host_get_bridge(struct mipi_dsi_host *host)
>> 
>>         return of_drm_find_bridge(msm_host->device_node);
>>  }
>> +
>> +void msm_dsi_host_dump_regs(struct mipi_dsi_host *host)
>> +{
>> +       struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>> +       struct drm_device *dev = msm_host->dev;
>> +       struct dpu_dbg_base *dpu_dbg;
>> +
>> +       dpu_dbg = dpu_dbg_get(dev);
>> +
>> +       if (dpu_dbg_is_drm_printer_needed(dpu_dbg) &&
>> +                       !dpu_dbg->dpu_dbg_printer) {
>> +               pr_err("invalid drm printer\n");
>> +               return;
>> +       }
> 
> for example, here ^^^
> 
> why should the other blocks even care?  All they should know is that
> they've been asked to snapshot their state..
> 

You are right, the printer check can be moved to one level up to 
dpu_dbg_print_regs().
That way it will avoid this redundant valid printer check in the 
dump_regs() function of the sub-modules.
The name of the function is xxx_xxx_dump_regs() but maybe I can just 
rename this to capture_state().
The reason for having the same function to capture the state and also 
print it out is to avoid code duplication.


>> +       if (dpu_dbg->reg_dump_method == DPU_DBG_DUMP_IN_MEM)
>> +               pm_runtime_get_sync(&msm_host->pdev->dev);
>> +
>> +       dpu_dbg_dump_regs(&dpu_dbg->dsi_ctrl_regs[msm_host->id],
>> +                       msm_iomap_size(msm_host->pdev, "dsi_ctrl"), 
>> msm_host->ctrl_base,
>> +                       dpu_dbg->reg_dump_method, 
>> dpu_dbg->dpu_dbg_printer);
>> +
>> +       if (dpu_dbg->reg_dump_method == DPU_DBG_DUMP_IN_MEM)
>> +               pm_runtime_put_sync(&msm_host->pdev->dev);
>> +}
> 
> I'm thinking something more along the lines of (in drm/msm/disp so it
> is a little less weird for dsi/dp/etc to be #include'ing header with
> structs):
Are you suggesting we move the dpu_dbg to drm/msm/disp? I am okay with 
that.

> 
> struct msm_disp_state {
>     .. maybe a bit of generic information like kernel version, time, 
> etc ...
> 
>    struct list_head blocks;  /* list of msm_disp_state_block */
> };
> 
> struct msm_disp_state_block {
>    const char *name;
>    struct list_head node;  /* node in msm_disp_state::blocks */
>    unsigned size;
>    uint32_t state[];
> };
> 
> struct msm_disp_state * msm_disp_snapshot_state(struct drm_device *dev)
> {
>    struct msm_disp_state *state = ...;
> 
>    if (priv->kms)
>       priv->kms->snapshot(priv->kms, state);
> 
>    for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
>       msm_dsi_snapshot(priv->dsi[i], state);
> 
>    if (priv->dp)
>       msm_dp_snapshot(priv->dp, state);
> 
>    return state;
> }

This is essentially what the dpu_dbg_dump_regs does right now. It just 
delegates the dumping to the respective modules.

+{
+	int i;
+
+	for (i = 0; i < DPU_DBG_BASE_MAX; i++) {
+		if (dpu_dbg->blk_names[i] != NULL) {
+			DRM_DEBUG("blk name is %s\n", dpu_dbg->blk_names[i]);
+			if (!strcmp(dpu_dbg->blk_names[i], "all")) {
+				dpu_dbg_dump_all_regs(dpu_dbg->drm_dev);
+				break;
+			} else if (!strcmp(dpu_dbg->blk_names[i], "mdp")) {
+				dpu_dbg_dump_mdp_regs(dpu_dbg->drm_dev);
+			} else if (!strcmp(dpu_dbg->blk_names[i], "dsi")) {
+				dpu_dbg_dump_dsi_regs(dpu_dbg->drm_dev);
+			} else if (!strcmp(dpu_dbg->blk_names[i], "dp")) {
+				dpu_dbg_dump_dp_regs(dpu_dbg->drm_dev);
+			} else {
+				DRM_ERROR("blk name not found %s\n", dpu_dbg->blk_names[i]);
+			}
+		}
+	}
+}

> 
> ... maybe add a helper that can be used everywhere to allocate and
> append a new state block.. Ie. pass it state/name/len/iomem
> 
> void msm_disp_state_free(struct msm_disp_state *state)
> {
>    list_for_each_entry_safe (block, ...)
>      kfree(block);
>    kfree(state)
> }
> 
> void msm_disp_state_print(struct drm_disp_state *state, drm_printer *p)
> {
>    .. print generic state and loop over state->blocks printing them ..
> }
> 
> ... if you do need to support printing to dmesg, you could re-use
> msm_disp_state_print() with an drm_info printer in just a few lines of
> code, rather than spreading the logic far and wide.
> 
> BR,
> -R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
