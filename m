Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E12EE4945C1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 03:17:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55FCE10F4EE;
	Thu, 20 Jan 2022 02:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662C710F4ED;
 Thu, 20 Jan 2022 02:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1642645053; x=1674181053;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=n9B3OZZYXrUobwS6/6oXjyZOzv1XIJzd2Yny6GbWnVk=;
 b=TDwnqSqS/ffrENaXnEQCfs1DBhq5GIWbKY0JBJ72G9jARnuBTGRc1IH0
 9OfvEuU+GXGQ0CPakNSIplH7QueWfVcLgAI1QswsXpeARguiWTuKSs7L0
 pZGxh3j8OyNp4GAHi+OWGn2oNwzrAE8MOnkqzJRvzt9X/JvQdmQOiphvr Y=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 19 Jan 2022 18:17:32 -0800
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 18:17:32 -0800
Received: from [10.71.111.172] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Wed, 19 Jan
 2022 18:17:32 -0800
Message-ID: <cc54a962-253b-c764-8439-60ba08159e9a@quicinc.com>
Date: Wed, 19 Jan 2022 18:17:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Freedreno] [PATCH v3 1/3] drm/msm: move utility functions from
 msm_drv.c
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220119221616.3089119-1-dmitry.baryshkov@linaro.org>
 <20220119221616.3089119-2-dmitry.baryshkov@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20220119221616.3089119-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/19/2022 2:16 PM, Dmitry Baryshkov wrote:
> Move clock/IO/hrtimer utility functions from msm_drv.c to new
> msm_io_utils.c file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Tested on: Qualcomm RB3 (debian, sdm845), Qualcomm RB5 (debian, qrb5165)

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/Makefile       |   1 +
>   drivers/gpu/drm/msm/msm_drv.c      | 118 ---------------------------
>   drivers/gpu/drm/msm/msm_io_utils.c | 126 +++++++++++++++++++++++++++++
>   3 files changed, 127 insertions(+), 118 deletions(-)
>   create mode 100644 drivers/gpu/drm/msm/msm_io_utils.c
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 03ab55c37beb..5b6e37477079 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -87,6 +87,7 @@ msm-y := \
>   	msm_gem_vma.o \
>   	msm_gpu.o \
>   	msm_gpu_devfreq.o \
> +	msm_io_utils.o \
>   	msm_iommu.o \
>   	msm_perf.o \
>   	msm_rd.o \
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index fd62a4da14a1..30c44c395a24 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -75,124 +75,6 @@ static bool modeset = true;
>   MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
>   module_param(modeset, bool, 0600);
>   
> -/*
> - * Util/helpers:
> - */
> -
> -struct clk *msm_clk_bulk_get_clock(struct clk_bulk_data *bulk, int count,
> -		const char *name)
> -{
> -	int i;
> -	char n[32];
> -
> -	snprintf(n, sizeof(n), "%s_clk", name);
> -
> -	for (i = 0; bulk && i < count; i++) {
> -		if (!strcmp(bulk[i].id, name) || !strcmp(bulk[i].id, n))
> -			return bulk[i].clk;
> -	}
> -
> -
> -	return NULL;
> -}
> -
> -struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
> -{
> -	struct clk *clk;
> -	char name2[32];
> -
> -	clk = devm_clk_get(&pdev->dev, name);
> -	if (!IS_ERR(clk) || PTR_ERR(clk) == -EPROBE_DEFER)
> -		return clk;
> -
> -	snprintf(name2, sizeof(name2), "%s_clk", name);
> -
> -	clk = devm_clk_get(&pdev->dev, name2);
> -	if (!IS_ERR(clk))
> -		dev_warn(&pdev->dev, "Using legacy clk name binding.  Use "
> -				"\"%s\" instead of \"%s\"\n", name, name2);
> -
> -	return clk;
> -}
> -
> -static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
> -				  bool quiet, phys_addr_t *psize)
> -{
> -	struct resource *res;
> -	unsigned long size;
> -	void __iomem *ptr;
> -
> -	if (name)
> -		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
> -	else
> -		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -
> -	if (!res) {
> -		if (!quiet)
> -			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n", name);
> -		return ERR_PTR(-EINVAL);
> -	}
> -
> -	size = resource_size(res);
> -
> -	ptr = devm_ioremap(&pdev->dev, res->start, size);
> -	if (!ptr) {
> -		if (!quiet)
> -			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n", name);
> -		return ERR_PTR(-ENOMEM);
> -	}
> -
> -	if (psize)
> -		*psize = size;
> -
> -	return ptr;
> -}
> -
> -void __iomem *msm_ioremap(struct platform_device *pdev, const char *name)
> -{
> -	return _msm_ioremap(pdev, name, false, NULL);
> -}
> -
> -void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name)
> -{
> -	return _msm_ioremap(pdev, name, true, NULL);
> -}
> -
> -void __iomem *msm_ioremap_size(struct platform_device *pdev, const char *name,
> -			  phys_addr_t *psize)
> -{
> -	return _msm_ioremap(pdev, name, false, psize);
> -}
> -
> -static enum hrtimer_restart msm_hrtimer_worktimer(struct hrtimer *t)
> -{
> -	struct msm_hrtimer_work *work = container_of(t,
> -			struct msm_hrtimer_work, timer);
> -
> -	kthread_queue_work(work->worker, &work->work);
> -
> -	return HRTIMER_NORESTART;
> -}
> -
> -void msm_hrtimer_queue_work(struct msm_hrtimer_work *work,
> -			    ktime_t wakeup_time,
> -			    enum hrtimer_mode mode)
> -{
> -	hrtimer_start(&work->timer, wakeup_time, mode);
> -}
> -
> -void msm_hrtimer_work_init(struct msm_hrtimer_work *work,
> -			   struct kthread_worker *worker,
> -			   kthread_work_func_t fn,
> -			   clockid_t clock_id,
> -			   enum hrtimer_mode mode)
> -{
> -	hrtimer_init(&work->timer, clock_id, mode);
> -	work->timer.function = msm_hrtimer_worktimer;
> -	work->worker = worker;
> -	kthread_init_work(&work->work, fn);
> -}
> -
>   static irqreturn_t msm_irq(int irq, void *arg)
>   {
>   	struct drm_device *dev = arg;
> diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
> new file mode 100644
> index 000000000000..7b504617833a
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/msm_io_utils.c
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2016-2018, 2020-2021 The Linux Foundation. All rights reserved.
> + * Copyright (C) 2013 Red Hat
> + * Author: Rob Clark <robdclark@gmail.com>
> + */
> +
> +#include "msm_drv.h"
> +
> +/*
> + * Util/helpers:
> + */
> +
> +struct clk *msm_clk_bulk_get_clock(struct clk_bulk_data *bulk, int count,
> +		const char *name)
> +{
> +	int i;
> +	char n[32];
> +
> +	snprintf(n, sizeof(n), "%s_clk", name);
> +
> +	for (i = 0; bulk && i < count; i++) {
> +		if (!strcmp(bulk[i].id, name) || !strcmp(bulk[i].id, n))
> +			return bulk[i].clk;
> +	}
> +
> +
> +	return NULL;
> +}
> +
> +struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
> +{
> +	struct clk *clk;
> +	char name2[32];
> +
> +	clk = devm_clk_get(&pdev->dev, name);
> +	if (!IS_ERR(clk) || PTR_ERR(clk) == -EPROBE_DEFER)
> +		return clk;
> +
> +	snprintf(name2, sizeof(name2), "%s_clk", name);
> +
> +	clk = devm_clk_get(&pdev->dev, name2);
> +	if (!IS_ERR(clk))
> +		dev_warn(&pdev->dev, "Using legacy clk name binding.  Use "
> +				"\"%s\" instead of \"%s\"\n", name, name2);
> +
> +	return clk;
> +}
> +
> +static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
> +				  bool quiet, phys_addr_t *psize)
> +{
> +	struct resource *res;
> +	unsigned long size;
> +	void __iomem *ptr;
> +
> +	if (name)
> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
> +	else
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +
> +	if (!res) {
> +		if (!quiet)
> +			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n", name);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	size = resource_size(res);
> +
> +	ptr = devm_ioremap(&pdev->dev, res->start, size);
> +	if (!ptr) {
> +		if (!quiet)
> +			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n", name);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	if (psize)
> +		*psize = size;
> +
> +	return ptr;
> +}
> +
> +void __iomem *msm_ioremap(struct platform_device *pdev, const char *name)
> +{
> +	return _msm_ioremap(pdev, name, false, NULL);
> +}
> +
> +void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name)
> +{
> +	return _msm_ioremap(pdev, name, true, NULL);
> +}
> +
> +void __iomem *msm_ioremap_size(struct platform_device *pdev, const char *name,
> +			  phys_addr_t *psize)
> +{
> +	return _msm_ioremap(pdev, name, false, psize);
> +}
> +
> +static enum hrtimer_restart msm_hrtimer_worktimer(struct hrtimer *t)
> +{
> +	struct msm_hrtimer_work *work = container_of(t,
> +			struct msm_hrtimer_work, timer);
> +
> +	kthread_queue_work(work->worker, &work->work);
> +
> +	return HRTIMER_NORESTART;
> +}
> +
> +void msm_hrtimer_queue_work(struct msm_hrtimer_work *work,
> +			    ktime_t wakeup_time,
> +			    enum hrtimer_mode mode)
> +{
> +	hrtimer_start(&work->timer, wakeup_time, mode);
> +}
> +
> +void msm_hrtimer_work_init(struct msm_hrtimer_work *work,
> +			   struct kthread_worker *worker,
> +			   kthread_work_func_t fn,
> +			   clockid_t clock_id,
> +			   enum hrtimer_mode mode)
> +{
> +	hrtimer_init(&work->timer, clock_id, mode);
> +	work->timer.function = msm_hrtimer_worktimer;
> +	work->worker = worker;
> +	kthread_init_work(&work->work, fn);
> +}
> -- 
> 2.34.1
> 
