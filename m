Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9598735FEC5
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 02:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8D86E97F;
	Thu, 15 Apr 2021 00:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472DC6E97F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 00:16:35 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id f41so12805729lfv.8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 17:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IE88L0fVOCeVuxvoVorGjnKAwSB5oO6MP/8IOKkmjsA=;
 b=Szjrcl9AoAT5tVHn6AQiA0HL9DPGEYfj4LeMeKIccbVblNKZNKOGyOWYLj9ZQxMpbF
 vESzJXC+4YV3We7dMfdNaOswlWe2s8R5fLkFSG3APnN+OqTDgrb+0LLarbmbRgsUPSaW
 X6PsUpuzpbudpTJdtnHR+1jOeqmBK5DBsoS/u9UwJ3SdSnIMknuO8H8QlGU/9cr0IkL7
 Z5grpvP57cw6/y/KrHvjXBYVYwC9nrhmCc51Bh82IeiQ+UuthJ1gex8sg6CMyAjg1SFM
 XryuGLX63sWBubTORMordKKO8Q3qzRfVtGsI/RaeaeBZIgrB/CeJkq0Koqa4rJQkFgmQ
 nzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IE88L0fVOCeVuxvoVorGjnKAwSB5oO6MP/8IOKkmjsA=;
 b=J5MX4Oduwtk76oA8gxGAHPAuSB0UIex4iFab374IedurIozpajoN/C+nqMERQHqjsB
 DXyE6v/MBGO3o7TSNDzAyPuhCQrxQmktsSCBVupDgFvrjR16ZHr32DQciq+HDs5bomET
 8R5q9RS10ooGDJWfFmyZevmsdTiRU1I9SCWPFIfjvHya5AANM+BKEFYGFx1EpbB+UcNJ
 ye1Aq5jq3BsliK9BAtt5XoogNy+0hPZ/roMed5jBbFQN9DGPrm2BzG69bBQeDDjJ22RD
 nr1Xbl+PzT2hvB4Ad+AqthXdpvrncOVXx+yUJk5U02+RyFtxPM3UtFoHYjkofO2zWVoH
 OzxA==
X-Gm-Message-State: AOAM5315Zi6cteB9KEAwNkF/XtUKh/ByEM+xT73l6t1IXpeZtvx7TBiO
 O3BAJ91Kaxj+ZW4afpiIq+t/DQ==
X-Google-Smtp-Source: ABdhPJznZEcB3QJNTXv/uT8udR0Ux1LqcAoEA3ozwGk/Z+wyltHbvI/g3zQ5ebrCALLoN+3Vqoq4aQ==
X-Received: by 2002:ac2:4e98:: with SMTP id o24mr491410lfr.353.1618445793250; 
 Wed, 14 Apr 2021 17:16:33 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id f11sm368555lfr.119.2021.04.14.17.16.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 17:16:32 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] drm/msm: add support to take dpu snapshot
To: Abhinav Kumar <abhinavk@codeaurora.org>, dri-devel@lists.freedesktop.org
References: <1618441897-17123-1-git-send-email-abhinavk@codeaurora.org>
 <1618441897-17123-3-git-send-email-abhinavk@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <b087fd6f-9307-d31a-ee21-75e5adf8a20b@linaro.org>
Date: Thu, 15 Apr 2021 03:16:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <1618441897-17123-3-git-send-email-abhinavk@codeaurora.org>
Content-Language: en-GB
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
Cc: linux-arm-msm@vger.kernel.org, swboyd@chromium.org, khsieh@codeaurora.org,
 seanpaul@chromium.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/04/2021 02:11, Abhinav Kumar wrote:
> Add the msm_disp_snapshot module which adds supports to dump dpu
> registers and capture the drm atomic state which can be used in
> case of error conditions.
> 
> changes in v4:
>   - rename dpu_dbg to msm_disp_snapshot and move it to msm/disp
>   - start using a list of blocks to store the hardware block information
>   - cleanup block allocation and freeing logic to simplify it
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>   drivers/gpu/drm/msm/Makefile                      |   2 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           |  61 ++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h           |   5 +
>   drivers/gpu/drm/msm/disp/msm_disp_snapshot.c      | 161 +++++++++++++++++++
>   drivers/gpu/drm/msm/disp/msm_disp_snapshot.h      | 167 ++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 181 ++++++++++++++++++++++
>   drivers/gpu/drm/msm/dp/dp_catalog.c               |  12 ++
>   drivers/gpu/drm/msm/dp/dp_catalog.h               |   4 +
>   drivers/gpu/drm/msm/dp/dp_display.c               |  29 ++++
>   drivers/gpu/drm/msm/dp/dp_display.h               |   1 +
>   drivers/gpu/drm/msm/dsi/dsi.c                     |   5 +
>   drivers/gpu/drm/msm/dsi/dsi.h                     |   4 +
>   drivers/gpu/drm/msm/dsi/dsi_host.c                |  19 +++
>   drivers/gpu/drm/msm/msm_drv.c                     |  29 +++-
>   drivers/gpu/drm/msm/msm_drv.h                     |   2 +

Generic suggestion: Could you please split this patch, separating core 
snapshotting functionality, dpu1, dsi and dp changes? This would ease 
reviewing.

>   16 files changed, 682 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
>   create mode 100644 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
>   create mode 100644 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 610d630..65d86ce 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -77,6 +77,8 @@ msm-y := \
>   	disp/dpu1/dpu_plane.o \
>   	disp/dpu1/dpu_rm.o \
>   	disp/dpu1/dpu_vbif.o \
> +	disp/msm_disp_snapshot.o \
> +	disp/msm_disp_snapshot_util.o \

If snapshotting is going to be used by dsi/dp, what about landing it 
into the top drivers/gpu/drm/msm dir? This way we'd point that it is a 
generic piece of code shared between all drm/msm drivers.

>   	msm_atomic.o \
>   	msm_atomic_tracepoints.o \
>   	msm_debugfs.o \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 4dfd8a2..0f9f0a5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -1,5 +1,5 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> +/* Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
>    */
>   
>   #ifndef _DPU_HW_CATALOG_H
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 88e9cc3..7529566 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -798,6 +798,67 @@ static void dpu_irq_uninstall(struct msm_kms *kms)
>   	dpu_core_irq_uninstall(dpu_kms);
>   }
>   
> +void dpu_kms_mdp_snapshot(struct drm_device *dev)
> +{
> +	int i;
> +	struct msm_drm_private *priv;
> +	struct dpu_kms *dpu_kms;
> +	struct dpu_mdss_cfg *cat;
> +	struct dpu_hw_mdp *top;
> +	struct msm_disp_state *disp_state;
> +	char name[SZ_128];
> +
> +	priv = dev->dev_private;
> +	dpu_kms = to_dpu_kms(priv->kms);
> +	disp_state = dpu_kms->disp_state;
> +
> +	cat = dpu_kms->catalog;
> +	top = dpu_kms->hw_mdp;
> +
> +	pm_runtime_get_sync(&dpu_kms->pdev->dev);
> +
> +	/* dump CTL sub-blocks HW regs info */
> +	for (i = 0; i < cat->ctl_count; i++) {
> +		snprintf(name, SZ_128, "ctl_%d", i);

snprintf(name, sizeof(name), "ctl_%d", i);
(the same bellow)

> +		msm_disp_snapshot_add_block(disp_state, name, cat->ctl[i].len,
> +				dpu_kms->mmio + cat->ctl[i].base);
> +	}
> +
> +	/* dump DSPP sub-blocks HW regs info */
> +	for (i = 0; i < cat->dspp_count; i++) {
> +		snprintf(name, SZ_128, "dspp_%d", i);
> +		msm_disp_snapshot_add_block(disp_state, name, cat->dspp[i].len,
> +				dpu_kms->mmio + cat->dspp[i].base);
> +	}
> +
> +	/* dump INTF sub-blocks HW regs info */
> +	for (i = 0; i < cat->intf_count; i++) {
> +		snprintf(name, SZ_128, "intf_%d", i);
> +		msm_disp_snapshot_add_block(disp_state, name, cat->intf[i].len,
> +				dpu_kms->mmio + cat->intf[i].base);
> +	}
> +
> +	/* dump PP sub-blocks HW regs info */
> +	for (i = 0; i < cat->pingpong_count; i++) {
> +		snprintf(name, SZ_128, "ping-pong_%d", i);

Just a nitpick: we usually call it pp or pingpong, without dash.

> +		msm_disp_snapshot_add_block(disp_state, name, cat->pingpong[i].len,
> +				dpu_kms->mmio + cat->pingpong[i].base);
> +	}
> +
> +	/* dump SSPP sub-blocks HW regs info */
> +	for (i = 0; i < cat->sspp_count; i++) {
> +		snprintf(name, SZ_128, "sspp_%d", i);
> +		msm_disp_snapshot_add_block(disp_state, name, cat->sspp[i].len,
> +				dpu_kms->mmio + cat->sspp[i].base);
> +	}
> +
> +	snprintf(name, SZ_128, "top");
> +	msm_disp_snapshot_add_block(disp_state, name, top->hw.length,
> +			dpu_kms->mmio + top->hw.blk_off);
> +
> +	pm_runtime_put_sync(&dpu_kms->pdev->dev);
> +}
> +
>   static const struct msm_kms_funcs kms_funcs = {
>   	.hw_init         = dpu_kms_hw_init,
>   	.irq_preinstall  = dpu_irq_preinstall,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index d6717d6..74b6ce6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -13,6 +13,7 @@
>   #include <drm/drm_drv.h>
>   
>   #include "msm_drv.h"
> +#include "disp/msm_disp_snapshot.h"
>   #include "msm_kms.h"
>   #include "msm_mmu.h"
>   #include "msm_gem.h"
> @@ -132,6 +133,8 @@ struct dpu_kms {
>   
>   	struct opp_table *opp_table;
>   
> +	struct msm_disp_state *disp_state;
> +
>   	struct dss_module_power mp;
>   
>   	/* reference count bandwidth requests, so we know when we can
> @@ -265,4 +268,6 @@ void dpu_kms_encoder_enable(struct drm_encoder *encoder);
>    */
>   u64 dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name);
>   
> +void dpu_kms_mdp_snapshot(struct drm_device *dev);
> +
>   #endif /* __dpu_kms_H__ */
> diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
> new file mode 100644
> index 0000000..1bdad16
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
> @@ -0,0 +1,161 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> + */
> +
> +#define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
> +
> +#include "msm_disp_snapshot.h"
> +
> +#ifdef CONFIG_DEV_COREDUMP
> +static ssize_t disp_devcoredump_read(char *buffer, loff_t offset,
> +		size_t count, void *data, size_t datalen)
> +{
> +	struct drm_print_iterator iter;
> +	struct drm_printer p;
> +	struct msm_disp_state *disp_state;
> +
> +	disp_state = data;
> +
> +	iter.data = buffer;
> +	iter.offset = 0;
> +	iter.start = offset;
> +	iter.remain = count;
> +
> +	p = drm_coredump_printer(&iter);
> +
> +	msm_disp_state_print(disp_state, &p, MSM_DISP_SNAPSHOT_IN_COREDUMP);
> +
> +	return count - iter.remain;
> +}
> +
> +static void disp_devcoredump_free(void *data)
> +{
> +	struct msm_disp_state *disp_state;
> +
> +	disp_state = data;
> +
> +	msm_disp_state_free(disp_state);
> +
> +	disp_state->coredump_pending = false;
> +}
> +#endif /* CONFIG_DEV_COREDUMP */
> +
> +static void _msm_disp_snapshot_work(struct kthread_work *work)
> +{
> +	struct msm_disp_state *disp_state = container_of(work, struct msm_disp_state, dump_work);
> +	struct drm_printer p;
> +
> +	mutex_lock(&disp_state->mutex);
> +
> +	msm_disp_snapshot_capture_state(disp_state);
> +
> +	if (MSM_DISP_SNAPSHOT_DUMP_IN_CONSOLE) {
> +		p = drm_info_printer(disp_state->drm_dev->dev);
> +		msm_disp_state_print(disp_state, &p, MSM_DISP_SNAPSHOT_IN_LOG);
> +	}
> +
> +	/*
> +	 * if devcoredump is not defined free the state immediately
> +	 * otherwise it will be freed in the free handler.
> +	 */
> +#ifdef CONFIG_DEV_COREDUMP
> +	dev_coredumpm(disp_state->dev, THIS_MODULE, disp_state, 0, GFP_KERNEL,
> +			disp_devcoredump_read, disp_devcoredump_free);
> +	disp_state->coredump_pending = true;
> +#else
> +	msm_disp_state_free(disp_state);
> +#endif
> +
> +	mutex_unlock(&disp_state->mutex);
> +}
> +
> +void msm_disp_snapshot_state(struct drm_device *drm_dev)
> +{
> +	struct msm_drm_private *priv;
> +	struct dpu_kms *dpu_kms;
> +	struct msm_disp_state *disp_state;
> +
> +	if (!drm_dev) {
> +		DRM_ERROR("invalid params\n");
> +		return;
> +	}
> +
> +	priv = drm_dev->dev_private;
> +	dpu_kms = to_dpu_kms(priv->kms);

If we are outside of disp/dpu1, we shouldn't reference dpu_kms 
internals. Probably this can be changed to use msm_drm_private, msm_kms 
or msm_mdss?

> +	disp_state = dpu_kms->disp_state;
> +
> +	if (!disp_state) {
> +		DRM_ERROR("invalid params\n");
> +		return;
> +	}
> +
> +	/*
> +	 * if there is a coredump pending return immediately till dump
> +	 * if read by userspace or timeout happens

Where do we handle the timeout? Stale comment or did I miss something?

> +	 */
> +	if (disp_state->coredump_pending) {
> +		DRM_DEBUG("coredump is pending read\n");
> +		return;
> +	}
> +
> +	kthread_queue_work(disp_state->dump_worker,
> +			&disp_state->dump_work);
> +}
> +
> +int msm_disp_snapshot_init(struct drm_device *drm_dev)
> +{
> +	struct dpu_kms *dpu_kms;
> +	struct msm_drm_private *priv;
> +	struct msm_disp_state *disp_state;
> +
> +	if (!drm_dev) {
> +		DRM_ERROR("invalid params\n");
> +		return -EINVAL;
> +	}
> +
> +	priv = drm_dev->dev_private;
> +	dpu_kms = to_dpu_kms(priv->kms);
> +
> +	disp_state = devm_kzalloc(drm_dev->dev, sizeof(struct msm_disp_state), GFP_KERNEL);
> +
> +	mutex_init(&disp_state->mutex);
> +
> +	disp_state->dev = drm_dev->dev;
> +	disp_state->drm_dev = drm_dev;
> +
> +	INIT_LIST_HEAD(&disp_state->blocks);
> +
> +	disp_state->dump_worker = kthread_create_worker(0, "%s", "disp_snapshot");
> +	if (IS_ERR(disp_state->dump_worker))
> +		DRM_ERROR("failed to create disp state task\n");
> +
> +	kthread_init_work(&disp_state->dump_work, _msm_disp_snapshot_work);
> +
> +	dpu_kms->disp_state = disp_state;

Judging from this code, I think it should be possible to push disp_state 
directly into struct msm_drm_private.

> +
> +	return 0;
> +}
> +
> +void msm_disp_snapshot_destroy(struct drm_device *drm_dev)
> +{
> +	struct dpu_kms *dpu_kms;
> +	struct msm_drm_private *priv;
> +	struct msm_disp_state *disp_state;
> +
> +	if (!drm_dev) {
> +		DRM_ERROR("invalid params\n");
> +		return;
> +	}
> +
> +	priv = drm_dev->dev_private;
> +	dpu_kms = to_dpu_kms(priv->kms);
> +	disp_state = dpu_kms->disp_state;
> +
> +	if (disp_state->dump_worker)
> +		kthread_destroy_worker(disp_state->dump_worker);
> +
> +	list_del(&disp_state->blocks);
> +
> +	mutex_destroy(&disp_state->mutex);
> +}
> diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
> new file mode 100644
> index 0000000..0ccb7e7
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
> @@ -0,0 +1,167 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef MSM_DISP_SNAPSHOT_H_
> +#define MSM_DISP_SNAPSHOT_H_
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
> +enum msm_disp_snapshot_dump_flag {
> +	MSM_DISP_SNAPSHOT_IN_LOG = BIT(0),
> +	MSM_DISP_SNAPSHOT_IN_MEM = BIT(1),
> +	MSM_DISP_SNAPSHOT_IN_COREDUMP = BIT(2),

Are they mutually exclusive or can they be specified in parallel?	

> +};
> +
> +#define MSM_DISP_SNAPSHOT_MAX_BLKS		10
> +
> +/* debug option to print the registers in logs */
> +#define MSM_DISP_SNAPSHOT_DUMP_IN_CONSOLE 0
> +
> +/* print debug ranges in groups of 4 u32s */
> +#define REG_DUMP_ALIGN		16
> +
> +/**
> + * struct msm_disp_state - structure to store current dpu state
> + * @dev: device pointer
> + * @drm_dev: drm device pointer
> + * @mutex: mutex to serialize access to serialze dumps, debugfs access
> + * @coredump_pending: coredump is pending read from userspace
> + * @atomic_state: atomic state duplicated at the time of the error
> + * @dump_worker: kworker thread which runs the dump work
> + * @dump_work: kwork which dumps the registers and drm state
> + * @timestamp: timestamp at which the coredump was captured
> + */
> +struct msm_disp_state {
> +	struct device *dev;
> +	struct drm_device *drm_dev;
> +	struct mutex mutex;
> +
> +	bool coredump_pending;
> +
> +	struct list_head blocks;
> +
> +	struct drm_atomic_state *atomic_state;
> +
> +	struct kthread_worker *dump_worker;
> +	struct kthread_work dump_work;
> +	ktime_t timestamp;
> +};
> +
> +/**
> + * struct msm_disp_state_block - structure to store each hardware block state
> + * @name: name of the block
> + * @drm_dev: handle to the linked list head
> + * @size: size of the register space of this hardware block
> + * @state: array holding the register dump of this hardware block
> + * @base_addr: starting address of this hardware block's register space
> + */
> +struct msm_disp_state_block {
> +	char name[SZ_128];
> +	struct list_head node;
> +	unsigned int size;
> +	u32 *state;
> +	void __iomem *base_addr;
> +};
> +
> +/**
> + * MSM_DISP_SNAPSHOT - trigger to dump the display snapshot
> + * @drm_dev:	handle to drm device
> + */
> +#define MSM_DISP_SNAPSHOT(drm_dev) msm_disp_snapshot_state(drm_dev)

Why do you need it?

> +
> +/**
> + * msm_disp_snapshot_init - initialize global sde debug facilities: evtlog, regdump

Just a nitpick here and below: there is no sde in the upstream. And no 
evtlog.

> + * @drm_dev:	drm device handle
> + *
> + * Returns:		0 or -ERROR
> + */
> +int msm_disp_snapshot_init(struct drm_device *drm_dev);
> +
> +/**
> + * msm_disp_snapshot_destroy - destroy the global sde debug facilities
> + * @drm_dev:    drm device handle
> + *
> + * Returns:	none
> + */
> +void msm_disp_snapshot_destroy(struct drm_device *drm_dev);
> +
> +/**
> + * msm_disp_snapshot_state - trigger to dump the display snapshot
> + * @drm_dev:	handle to drm device
> +
> + * Returns:	none
> + */
> +void msm_disp_snapshot_state(struct drm_device *drm_dev);
> +
> +/**
> + * msm_disp_state_get - get the handle to msm_disp_state struct from the drm device
> + * @drm:	    handle to drm device
> +
> + * Returns:	handle to the msm_disp_state struct
> + */
> +struct msm_disp_state *msm_disp_state_get(struct drm_device *drm);
> +
> +/**
> + * msm_disp_state_print - print out the current dpu state
> + * @disp_state:	    handle to drm device
> + * @p:	    handle to drm printer
> + * @reg_dump_method: tells whether the state has to be dumped in log or coredump
> + *
> + * Returns:	none
> + */
> +void msm_disp_state_print(struct msm_disp_state *disp_state, struct drm_printer *p,
> +		u8 reg_dump_method);
> +
> +/**
> + * msm_disp_snapshot_capture_state - utility to capture atomic state and hw registers
> + * @disp_state:	    handle to msm_disp_state struct
> +
> + * Returns:	none
> + */
> +void msm_disp_snapshot_capture_state(struct msm_disp_state *disp_state);
> +
> +/**
> + * msm_disp_state_free - free the memory after the coredump has been read
> + * @disp_state:	    handle to struct msm_disp_state
> +
> + * Returns: none
> + */
> +void msm_disp_state_free(struct msm_disp_state *disp_state);
> +
> +/**
> + * msm_disp_snapshot_add_block - add a hardware block with its register dump
> + * @disp_state:	    handle to struct msm_disp_state
> + * @name:           name of the hardware block
> + * @len:            size of the register space of the hardware block
> + * @base_addr:      starting address of the register space of the hardware block
> + *
> + * Returns: none
> + */
> +void msm_disp_snapshot_add_block(struct msm_disp_state *disp_state, char *name, u32 len,
> +		void __iomem *base_addr);
> +
> +#endif /* MSM_DISP_SNAPSHOT_H_ */
> diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> new file mode 100644
> index 0000000..383f225
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> @@ -0,0 +1,181 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> + */
> +
> +#define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
> +
> +#include "msm_disp_snapshot.h"
> +
> +static void msm_disp_state_dump_regs(u32 **reg, u32 len, void __iomem *base_addr,
> +		u32 dump_op, struct drm_printer *p)
> +{
> +	u32 len_aligned, len_padded;
> +	u32 x0, x4, x8, xc;
> +	void __iomem *addr;
> +	u32 *dump_addr = NULL;
> +	void __iomem *end_addr;
> +	int i;
> +	bool in_drm_printer = false;
> +
> +	len_aligned = (len + REG_DUMP_ALIGN - 1) / REG_DUMP_ALIGN;
> +	len_padded = len_aligned * REG_DUMP_ALIGN;
> +
> +	addr = base_addr;
> +	end_addr = base_addr + len;
> +
> +	if ((dump_op == MSM_DISP_SNAPSHOT_IN_COREDUMP) ||
> +		(dump_op == MSM_DISP_SNAPSHOT_IN_LOG))
> +		in_drm_printer = true;
> +
> +	if (in_drm_printer && !p) {
> +		DRM_ERROR("invalid drm printer\n");
> +		return;
> +	}
> +
> +	if (dump_op == MSM_DISP_SNAPSHOT_IN_MEM && !(*reg))
> +		*reg = kzalloc(len_padded, GFP_KERNEL);
> +
> +	if (*reg)
> +		dump_addr = *reg;
> +
> +	for (i = 0; i < len_aligned; i++) {
> +		if (dump_op == MSM_DISP_SNAPSHOT_IN_MEM) {
> +			x0 = (addr < end_addr) ? readl_relaxed(addr + 0x0) : 0;
> +			x4 = (addr + 0x4 < end_addr) ? readl_relaxed(addr + 0x4) : 0;
> +			x8 = (addr + 0x8 < end_addr) ? readl_relaxed(addr + 0x8) : 0;
> +			xc = (addr + 0xc < end_addr) ? readl_relaxed(addr + 0xc) : 0;
> +		}
> +
> +		if (dump_addr) {
> +			if (dump_op == MSM_DISP_SNAPSHOT_IN_MEM) {
> +				dump_addr[i * 4] = x0;
> +				dump_addr[i * 4 + 1] = x4;
> +				dump_addr[i * 4 + 2] = x8;
> +				dump_addr[i * 4 + 3] = xc;
> +			} else if (in_drm_printer) {
> +				drm_printf(p, "0x%lx : %08x %08x %08x %08x\n",
> +						(unsigned long)(addr - base_addr),
> +						dump_addr[i * 4], dump_addr[i * 4 + 1],
> +						dump_addr[i * 4 + 2], dump_addr[i * 4 + 3]);
> +			}
> +		}
> +
> +		addr += REG_DUMP_ALIGN;
> +	}
> +}

I'd just split this function into two different cases, IN_MEM and 
DRM_PRINTER.

> +
> +struct msm_disp_state *msm_disp_state_get(struct drm_device *drm)
> +{
> +	struct msm_drm_private *priv;
> +	struct dpu_kms *dpu_kms;
> +
> +	priv = drm->dev_private;
> +	dpu_kms = to_dpu_kms(priv->kms);
> +
> +	return dpu_kms->disp_state;
> +}
> +
> +void msm_disp_state_print(struct msm_disp_state *state, struct drm_printer *p,
> +		u8 reg_dump_method)
> +{
> +	struct msm_disp_state_block *block, *tmp;
> +
> +	if (!p) {
> +		DRM_ERROR("invalid drm printer\n");
> +		return;
> +	}
> +
> +	drm_printf(p, "---\n");
> +
> +	drm_printf(p, "module: " KBUILD_MODNAME "\n");
> +	drm_printf(p, "dpu devcoredump\n");
> +	drm_printf(p, "timestamp %lld\n", ktime_to_ns(state->timestamp));
> +
> +	list_for_each_entry_safe(block, tmp, &state->blocks, node) {
> +		drm_printf(p, "====================%s================\n", block->name);
> +		msm_disp_state_dump_regs(&block->state, block->size, block->base_addr,
> +				reg_dump_method, p);
> +	}
> +
> +	drm_printf(p, "===================dpu drm state================\n");
> +
> +	if (state->atomic_state)
> +		drm_atomic_print_new_state(state->atomic_state, p);
> +}
> +
> +static void msm_disp_capture_atomic_state(struct msm_disp_state *disp_state)
> +{
> +	struct drm_device *ddev;
> +	struct drm_modeset_acquire_ctx ctx;
> +
> +	disp_state->timestamp = ktime_get();
> +
> +	ddev = disp_state->drm_dev;
> +
> +	drm_modeset_acquire_init(&ctx, 0);
> +
> +	while (drm_modeset_lock_all_ctx(ddev, &ctx) != 0)
> +		drm_modeset_backoff(&ctx);
> +
> +	disp_state->atomic_state = drm_atomic_helper_duplicate_state(ddev,
> +			&ctx);
> +	drm_modeset_drop_locks(&ctx);
> +	drm_modeset_acquire_fini(&ctx);
> +}
> +
> +void msm_disp_snapshot_capture_state(struct msm_disp_state *disp_state)
> +{
> +	struct msm_drm_private *priv;
> +	int i;
> +	struct drm_device *drm_dev;
> +
> +	drm_dev = disp_state->drm_dev;
> +	priv = drm_dev->dev_private;
> +
> +	msm_disp_capture_atomic_state(disp_state);
> +
> +	if (priv->dp)
> +		msm_dp_snapshot(priv->dp);
> +
> +	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
> +		if (!priv->dsi[i])
> +			continue;
> +
> +		msm_dsi_snapshot(priv->dsi[i]);
> +	}
> +
> +	dpu_kms_mdp_snapshot(drm_dev);

Hmm, I now see why do you need the dpu_kms. Can we have a check for the 
mdp version here? The rest of the code seems generic enough, so we can 
at least dump the dsi/dp (and hopefully eDP/HDMI) data for MDP4/5.

Ideally subdrivers should be able to report back to the core, which 
regions are available, so that we won't have this static code. But this 
might look like an overkill. Not to mention that it might lead to the 
not-so-static sequence of dumps. (As you can judge, I quite liked the 
previous approach, when the drivers registered the dumping regions and 
then the dumper would go through them.)

Let's have the static config in place with the version check.

> +}
> +
> +void msm_disp_state_free(struct msm_disp_state *disp_state)
> +{
> +	struct msm_disp_state_block *block, *tmp;
> +
> +	if (disp_state->atomic_state) {
> +		drm_atomic_state_put(disp_state->atomic_state);
> +		disp_state->atomic_state = NULL;
> +	}
> +
> +	list_for_each_entry_safe(block, tmp, &disp_state->blocks, node) {
> +		kfree(block->state);
> +		list_del(&block->node);

I'd swap these two lines, so while the block is in the list, its state 
is coherent.

> +		kfree(block);
> +	}
> +}
> +
> +void msm_disp_snapshot_add_block(struct msm_disp_state *disp_state, char *name, u32 len,
> +		void __iomem *base_addr)
> +{
> +	struct msm_disp_state_block *new_blk;
> +
> +	new_blk = kzalloc(sizeof(struct msm_disp_state_block), GFP_KERNEL);
> +
> +	strscpy(new_blk->name, name, sizeof(new_blk->name));
> +	INIT_LIST_HEAD(&new_blk->node);
> +	new_blk->size = len;
> +	new_blk->base_addr = base_addr;
> +	msm_disp_state_dump_regs(&new_blk->state, len, base_addr,
> +			MSM_DISP_SNAPSHOT_IN_MEM, NULL);
> +	list_add(&new_blk->node, &disp_state->blocks);
> +}
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index b1a9b1b..ce8d19a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -62,6 +62,18 @@ struct dp_catalog_private {
>   	u8 aux_lut_cfg_index[PHY_AUX_CFG_MAX];
>   };
>   
> +void dp_catalog_snapshot(struct dp_catalog *dp_catalog, struct msm_disp_state *disp_state)
> +{
> +	struct dp_catalog_private *catalog = container_of(dp_catalog,
> +			struct dp_catalog_private, dp_catalog);
> +	char name[SZ_128];
> +
> +	snprintf(name, SZ_128, "dp_ctrl");
> +
> +	msm_disp_snapshot_add_block(disp_state, name, catalog->io->dp_controller.len,
> +			catalog->io->dp_controller.base);
> +}
> +
>   static inline u32 dp_read_aux(struct dp_catalog_private *catalog, u32 offset)
>   {
>   	offset += MSM_DP_CONTROLLER_AUX_OFFSET;
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 176a902..e7e8b13 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -9,6 +9,7 @@
>   #include <drm/drm_modes.h>
>   
>   #include "dp_parser.h"
> +#include "disp/msm_disp_snapshot.h"
>   
>   /* interrupts */
>   #define DP_INTR_HPD		BIT(0)
> @@ -71,6 +72,9 @@ struct dp_catalog {
>   	u32 audio_data;
>   };
>   
> +/* Debug module */
> +void dp_catalog_snapshot(struct dp_catalog *dp_catalog, struct msm_disp_state *disp_state);
> +
>   /* AUX APIs */
>   u32 dp_catalog_aux_read_data(struct dp_catalog *dp_catalog);
>   int dp_catalog_aux_write_data(struct dp_catalog *dp_catalog);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5a39da6..6670558 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1009,6 +1009,35 @@ int dp_display_get_test_bpp(struct msm_dp *dp)
>   		dp_display->link->test_video.test_bit_depth);
>   }
>   
> +void msm_dp_snapshot(struct msm_dp *dp)
> +{
> +	struct dp_display_private *dp_display;
> +	struct drm_device *drm;
> +	struct msm_disp_state *disp_state;
> +
> +	dp_display = container_of(dp, struct dp_display_private, dp_display);
> +	drm = dp->drm_dev;
> +	disp_state = msm_disp_state_get(drm);
> +
> +	/*
> +	 * if we are reading registers we need the link clocks to be on
> +	 * however till DP cable is connected this will not happen as we
> +	 * do not know the resolution to power up with. Hence check the
> +	 * power_on status before dumping DP registers to avoid crash due
> +	 * to unclocked access
> +	 */
> +	mutex_lock(&dp_display->event_mutex);
> +
> +	if (!dp->power_on) {
> +		mutex_unlock(&dp_display->event_mutex);
> +		return;
> +	}
> +
> +	dp_catalog_snapshot(dp_display->catalog, disp_state);
> +
> +	mutex_unlock(&dp_display->event_mutex);
> +}
> +
>   static void dp_display_config_hpd(struct dp_display_private *dp)
>   {
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 6092ba1..4d39373 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -8,6 +8,7 @@
>   
>   #include "dp_panel.h"
>   #include <sound/hdmi-codec.h>
> +#include "disp/msm_disp_snapshot.h"
>   
>   struct msm_dp {
>   	struct drm_device *drm_dev;
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index 62704885..bccc006 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -266,3 +266,8 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
>   	return ret;
>   }
>   
> +void msm_dsi_snapshot(struct msm_dsi *msm_dsi)
> +{
> +	msm_dsi_host_snapshot(msm_dsi->host);
> +}
> +
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index 7abfeab..bb39403 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -15,6 +15,7 @@
>   #include <drm/drm_panel.h>
>   
>   #include "msm_drv.h"
> +#include "disp/msm_disp_snapshot.h"
>   
>   #define DSI_0	0
>   #define DSI_1	1
> @@ -90,6 +91,8 @@ static inline bool msm_dsi_device_connected(struct msm_dsi *msm_dsi)
>   	return msm_dsi->panel || msm_dsi->external_bridge;
>   }
>   
> +void msm_dsi_snapshot(struct msm_dsi *msm_dsi);
> +
>   struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi);
>   
>   /* dsi host */
> @@ -146,6 +149,7 @@ int dsi_clk_init_v2(struct msm_dsi_host *msm_host);
>   int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host);
>   int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_dual_dsi);
>   int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_dual_dsi);
> +void msm_dsi_host_snapshot(struct mipi_dsi_host *host);
>   
>   /* dsi phy */
>   struct msm_dsi_phy;
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 8a10e43..d9fdc07 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -2487,3 +2487,22 @@ struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host *host)
>   
>   	return of_drm_find_bridge(msm_host->device_node);
>   }
> +
> +void msm_dsi_host_snapshot(struct mipi_dsi_host *host)
> +{
> +	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> +	struct drm_device *dev = msm_host->dev;
> +	struct msm_disp_state *disp_state;
> +	char name[SZ_128];
> +
> +	disp_state = msm_disp_state_get(dev);
> +
> +	pm_runtime_get_sync(&msm_host->pdev->dev);
> +
> +	snprintf(name, SZ_128, "dsi%d_ctrl", msm_host->id);
> +
> +	msm_disp_snapshot_add_block(disp_state, name, msm_iomap_size(msm_host->pdev, "dsi_ctrl"),

You can store the size into the msm_host, rather than querrying it on 
each dump.

> +			msm_host->ctrl_base);
> +
> +	pm_runtime_put_sync(&msm_host->pdev->dev);
> +}
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index e1104d2..ebf9283 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2016-2018, 2020-2021 The Linux Foundation. All rights reserved.
>    * Copyright (C) 2013 Red Hat
>    * Author: Rob Clark <robdclark@gmail.com>
>    */
> @@ -19,6 +19,7 @@
>   #include <drm/drm_of.h>
>   #include <drm/drm_vblank.h>
>   
> +#include "disp/msm_disp_snapshot.h"
>   #include "msm_drv.h"
>   #include "msm_debugfs.h"
>   #include "msm_fence.h"
> @@ -167,6 +168,24 @@ void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name,
>   	return _msm_ioremap(pdev, name, dbgname, true);
>   }
>   
> +unsigned long msm_iomap_size(struct platform_device *pdev, const char *name)
> +{
> +	struct resource *res;
> +
> +	if (name)
> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
> +	else
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +
> +	if (!res) {
> +		dev_dbg(&pdev->dev, "failed to get memory resource: %s\n",
> +				name);
> +		return 0;
> +	}
> +
> +	return resource_size(res);
> +}
> +
>   void msm_writel(u32 data, void __iomem *addr)
>   {
>   	if (reglog)
> @@ -278,6 +297,8 @@ static int msm_drm_uninit(struct device *dev)
>   		msm_fbdev_free(ddev);
>   #endif
>   
> +	msm_disp_snapshot_destroy(ddev);
> +
>   	drm_mode_config_cleanup(ddev);
>   
>   	pm_runtime_get_sync(dev);
> @@ -550,6 +571,12 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   	if (ret)
>   		goto err_msm_uninit;
>   
> +	if (get_mdp_ver(pdev) == KMS_DPU) {
> +		ret = msm_disp_snapshot_init(ddev);
> +		if (ret)
> +			DRM_DEV_ERROR(dev, "msm_disp_snapshot_init failed ret = %d\n", ret);
> +	}
> +

Let's get it out of if (KMS_DPU), even if we do not dump mdp4/mdp5 
registers for now.

>   	drm_mode_config_reset(ddev);
>   
>   #ifdef CONFIG_DRM_FBDEV_EMULATION
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 2668941..9c40bac 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -367,6 +367,7 @@ void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
>   				struct drm_display_mode *mode,
>   				struct drm_display_mode *adjusted_mode);
>   void msm_dp_irq_postinstall(struct msm_dp *dp_display);
> +void msm_dp_snapshot(struct msm_dp *dp_display);
>   
>   void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor);
>   
> @@ -450,6 +451,7 @@ void __iomem *msm_ioremap(struct platform_device *pdev, const char *name,
>   		const char *dbgname);
>   void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name,
>   		const char *dbgname);
> +unsigned long msm_iomap_size(struct platform_device *pdev, const char *name);
>   void msm_writel(u32 data, void __iomem *addr);
>   u32 msm_readl(const void __iomem *addr);
>   void msm_rmw(void __iomem *addr, u32 mask, u32 or);
> 


-- 
With best wishes
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
