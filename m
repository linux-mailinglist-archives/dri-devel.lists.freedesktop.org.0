Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 759856C7C7C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 11:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D839110E159;
	Fri, 24 Mar 2023 10:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D532210E159
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 10:26:54 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id c18so1383482ple.11
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 03:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679653614;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TGBD8FEWEKxDa7aK1T0RCNQbdYp8oLYvFK8eEV3W7LA=;
 b=UcT+NAof1Ccxa4ZtsdQ9EdvfdNzrIb2CmNbdEj+HOHaXg8m0iOjKEQgt9HNvXkV4rz
 9lADCh2MMBVM87PG1MIieBf5CvmjUj3opMQiE4nqyoPzyItjzcBRUD2kd8gcy3RTPNBl
 5V5RlUWRcWD1GVta2TTHnUlbbQE0+Ae0ZDW1bM/pH2T57BCw/vdwLtmGHSZ6FAdo1XtM
 RFddG11GaqtIg7czUclZoJRxo3ndTle0Uu2ho/hLcjpX2iYKYwYEXxD3+Y4sU9ZWUSoF
 r2ORZEviNd0dCGIrIwNSZXBZQuhyuk9b8Ut/rkoT5ySOzTf5e4XGe/B5NwsvytAJWcX8
 I1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679653614;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TGBD8FEWEKxDa7aK1T0RCNQbdYp8oLYvFK8eEV3W7LA=;
 b=5xc5aUJ1kuVBs8fzvKwjZATjHR2ldEtMhJ1DWK2Z6hUScn09nEs09Vn0aaoaDVFE8U
 cYqKWFft/s789e89UjA4aabAomtjRuyrNshR7HuNBl/y3VpoxMbf4n/tHUTGIot242Wq
 E16RIjmjeZ9GfBZ0TJTfPaGJQSqYPZFfaQUcl2fLn0p8672YQP6pmAN1vVcC5t8pKzJv
 3nSVw1nQgSRBi1OvDjcvD7fQnyAPtoG+uld+UIO+Hv6J4DNuqdmshwV4BYEyPtd/2+Bx
 BMbhVjbTmMH28Y4JMG63gPMoE/OWYg1v0NZ6JrmHWDcehLpycFbdweihB7J3u2X8L2UY
 F1Yg==
X-Gm-Message-State: AO0yUKVdro73okxgu9N8mG8qVZyBVJwT+N0qs/Kl6NiecbL1GV64FzN+
 j4h63Xk0KNd0Hg1uh7Bqh/PA
X-Google-Smtp-Source: AK7set+n1gDTS/JZRzJwz0CgXfIV651PxtqHRmlNkqFCwcibcQZN1jAs/cXNK5xrcHF+n2ZWE9+WPw==
X-Received: by 2002:a05:6a20:b70f:b0:da:318a:981f with SMTP id
 fg15-20020a056a20b70f00b000da318a981fmr2473057pzb.42.1679653614258; 
 Fri, 24 Mar 2023 03:26:54 -0700 (PDT)
Received: from thinkpad ([117.217.184.219]) by smtp.gmail.com with ESMTPSA id
 a7-20020a62bd07000000b006222a261188sm13553144pff.62.2023.03.24.03.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 03:26:53 -0700 (PDT)
Date: Fri, 24 Mar 2023 15:56:45 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v4 3/8] accel/qaic: Add MHI controller
Message-ID: <20230324102645.GB4259@thinkpad>
References: <1679325074-5494-1-git-send-email-quic_jhugo@quicinc.com>
 <1679325074-5494-4-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1679325074-5494-4-git-send-email-quic_jhugo@quicinc.com>
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
Cc: dafna@fastmail.com, linux-doc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, ogabbay@kernel.org,
 dri-devel@lists.freedesktop.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, stanislaw.gruszka@linux.intel.com,
 quic_carlv@quicinc.com, jacek.lawrynowicz@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 20, 2023 at 09:11:09AM -0600, Jeffrey Hugo wrote:
> An AIC100 device contains a MHI interface with a number of different
> channels for controlling different aspects of the device. The MHI
> controller works with the MHI bus to enable and drive that interface.
> 
> AIC100 uses the BHI protocol in PBL to load SBL. The MHI controller
> expects the SBL to be located at /lib/firmware/qcom/aic100/sbl.bin and
> expects the MHI bus to manage the process of loading and sending SBL to
> the device.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>  drivers/accel/qaic/mhi_controller.c | 563 ++++++++++++++++++++++++++++++++++++
>  drivers/accel/qaic/mhi_controller.h |  16 +
>  2 files changed, 579 insertions(+)
>  create mode 100644 drivers/accel/qaic/mhi_controller.c
>  create mode 100644 drivers/accel/qaic/mhi_controller.h
> 
> diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
> new file mode 100644
> index 0000000..777dfbe
> --- /dev/null
> +++ b/drivers/accel/qaic/mhi_controller.c
> @@ -0,0 +1,563 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/* Copyright (c) 2019-2021, The Linux Foundation. All rights reserved. */
> +/* Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved. */
> +
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/memblock.h>
> +#include <linux/mhi.h>
> +#include <linux/moduleparam.h>
> +#include <linux/pci.h>
> +#include <linux/sizes.h>
> +
> +#include "mhi_controller.h"
> +#include "qaic.h"
> +
> +#define MAX_RESET_TIME_SEC 25
> +
> +static unsigned int mhi_timeout_ms = 2000; /* 2 sec default */
> +module_param(mhi_timeout_ms, uint, 0600);
> +MODULE_PARM_DESC(mhi_timeout_ms, "MHI controller timeout value");
> +
> +static struct mhi_channel_config aic100_channels[] = {
> +	{
> +		.name = "QAIC_LOOPBACK",

Why do you need QAIC_ prefix for channel names?

> +		.num = 0,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},

[...]

> +static struct mhi_event_config aic100_events[] = {
> +	{
> +		.num_elements = 32,
> +		.irq_moderation_ms = 0,
> +		.irq = 0,
> +		.channel = U32_MAX,
> +		.priority = 1,
> +		.mode = MHI_DB_BRST_DISABLE,
> +		.data_type = MHI_ER_CTRL,
> +		.hardware_event = false,
> +		.client_managed = false,
> +		.offload_channel = false,
> +	},
> +};
> +

It'd be nice to use macros for defining the channels and events as done in the
pci_generic driver.

> +static struct mhi_controller_config aic100_config = {
> +	.max_channels = 128,
> +	.timeout_ms = 0, /* controlled by mhi_timeout */
> +	.buf_len = 0,
> +	.num_channels = ARRAY_SIZE(aic100_channels),
> +	.ch_cfg = aic100_channels,
> +	.num_events = ARRAY_SIZE(aic100_events),
> +	.event_cfg = aic100_events,
> +	.use_bounce_buf = false,
> +	.m2_no_db = false,
> +};
> +
> +static int mhi_read_reg(struct mhi_controller *mhi_cntl, void __iomem *addr, u32 *out)
> +{
> +	u32 tmp = readl_relaxed(addr);
> +
> +	if (tmp == U32_MAX)
> +		return -EIO;
> +
> +	*out = tmp;
> +
> +	return 0;
> +}
> +
> +static void mhi_write_reg(struct mhi_controller *mhi_cntl, void __iomem *addr, u32 val)
> +{
> +	writel_relaxed(val, addr);
> +}
> +
> +static int mhi_runtime_get(struct mhi_controller *mhi_cntl)
> +{
> +	return 0;
> +}
> +
> +static void mhi_runtime_put(struct mhi_controller *mhi_cntl)
> +{
> +}
> +
> +static void mhi_status_cb(struct mhi_controller *mhi_cntl, enum mhi_callback reason)
> +{
> +	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(mhi_cntl->cntrl_dev));
> +
> +	/* this event occurs in atomic context */
> +	if (reason == MHI_CB_FATAL_ERROR)
> +		pci_err(qdev->pdev, "Fatal error received from device. Attempting to recover\n");

Why no dev_err()?

> +	/* this event occurs in non-atomic context */
> +	if (reason == MHI_CB_SYS_ERROR)
> +		qaic_dev_reset_clean_local_state(qdev, true);
> +}
> +
> +static int mhi_reset_and_async_power_up(struct mhi_controller *mhi_cntl)
> +{
> +	char time_sec = 1;

u8?

> +	int current_ee;
> +	int ret;
> +
> +	/* Reset the device to bring the device in PBL EE */
> +	mhi_soc_reset(mhi_cntl);
> +
> +	/*
> +	 * Keep checking the execution environment(EE) after every 1 second
> +	 * interval.
> +	 */
> +	do {
> +		msleep(1000);
> +		current_ee = mhi_get_exec_env(mhi_cntl);
> +	} while (current_ee != MHI_EE_PBL && time_sec++ <= MAX_RESET_TIME_SEC);
> +
> +	/* If the device is in PBL EE retry power up */
> +	if (current_ee == MHI_EE_PBL)
> +		ret = mhi_async_power_up(mhi_cntl);
> +	else
> +		ret = -EIO;
> +
> +	return ret;
> +}
> +
> +struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, void __iomem *mhi_bar,
> +						    int mhi_irq)
> +{
> +	struct mhi_controller *mhi_cntl;

Cosmetic change: We use "mhi_cntrl" in other controller drivers. So it is
better to follow the same pattern here also.

> +	int ret;
> +
> +	mhi_cntl = devm_kzalloc(&pci_dev->dev, sizeof(*mhi_cntl), GFP_KERNEL);
> +	if (!mhi_cntl)
> +		return ERR_PTR(-ENOMEM);
> +
> +	mhi_cntl->cntrl_dev = &pci_dev->dev;
> +
> +	/*
> +	 * Covers the entire possible physical ram region. Remote side is
> +	 * going to calculate a size of this range, so subtract 1 to prevent
> +	 * rollover.
> +	 */
> +	mhi_cntl->iova_start = 0;
> +	mhi_cntl->iova_stop = PHYS_ADDR_MAX - 1;
> +	mhi_cntl->status_cb = mhi_status_cb;
> +	mhi_cntl->runtime_get = mhi_runtime_get;
> +	mhi_cntl->runtime_put = mhi_runtime_put;
> +	mhi_cntl->read_reg = mhi_read_reg;
> +	mhi_cntl->write_reg = mhi_write_reg;
> +	mhi_cntl->regs = mhi_bar;
> +	mhi_cntl->reg_len = SZ_4K;

Is this size fixed for all AIC100 revisions? I think you should get this value
from pci_resource_len() to avoid issues later.

Thanks,
Mani

> +	mhi_cntl->nr_irqs = 1;
> +	mhi_cntl->irq = devm_kmalloc(&pci_dev->dev, sizeof(*mhi_cntl->irq), GFP_KERNEL);
> +
> +	if (!mhi_cntl->irq)
> +		return ERR_PTR(-ENOMEM);
> +
> +	mhi_cntl->irq[0] = mhi_irq;
> +	mhi_cntl->fw_image = "qcom/aic100/sbl.bin";
> +
> +	/* use latest configured timeout */
> +	aic100_config.timeout_ms = mhi_timeout_ms;
> +	ret = mhi_register_controller(mhi_cntl, &aic100_config);
> +	if (ret) {
> +		pci_err(pci_dev, "mhi_register_controller failed %d\n", ret);
> +		return ERR_PTR(ret);
> +	}
> +
> +	ret = mhi_prepare_for_power_up(mhi_cntl);
> +	if (ret) {
> +		pci_err(pci_dev, "mhi_prepare_for_power_up failed %d\n", ret);
> +		goto prepare_power_up_fail;
> +	}
> +
> +	ret = mhi_async_power_up(mhi_cntl);
> +	/*
> +	 * If EIO is returned it is possible that device is in SBL EE, which is
> +	 * undesired. SOC reset the device and try to power up again.
> +	 */
> +	if (ret == -EIO && MHI_EE_SBL == mhi_get_exec_env(mhi_cntl)) {
> +		pci_err(pci_dev, "Found device in SBL at MHI init. Attempting a reset.\n");
> +		ret = mhi_reset_and_async_power_up(mhi_cntl);
> +	}
> +
> +	if (ret) {
> +		pci_err(pci_dev, "mhi_async_power_up failed %d\n", ret);
> +		goto power_up_fail;
> +	}
> +
> +	return mhi_cntl;
> +
> +power_up_fail:
> +	mhi_unprepare_after_power_down(mhi_cntl);
> +prepare_power_up_fail:
> +	mhi_unregister_controller(mhi_cntl);
> +	return ERR_PTR(ret);
> +}
> +
> +void qaic_mhi_free_controller(struct mhi_controller *mhi_cntl, bool link_up)
> +{
> +	mhi_power_down(mhi_cntl, link_up);
> +	mhi_unprepare_after_power_down(mhi_cntl);
> +	mhi_unregister_controller(mhi_cntl);
> +}
> +
> +void qaic_mhi_start_reset(struct mhi_controller *mhi_cntl)
> +{
> +	mhi_power_down(mhi_cntl, true);
> +}
> +
> +void qaic_mhi_reset_done(struct mhi_controller *mhi_cntl)
> +{
> +	struct pci_dev *pci_dev = container_of(mhi_cntl->cntrl_dev, struct pci_dev, dev);
> +	int ret;
> +
> +	ret = mhi_async_power_up(mhi_cntl);
> +	if (ret)
> +		pci_err(pci_dev, "mhi_async_power_up failed after reset %d\n", ret);
> +}
> diff --git a/drivers/accel/qaic/mhi_controller.h b/drivers/accel/qaic/mhi_controller.h
> new file mode 100644
> index 0000000..c105e93
> --- /dev/null
> +++ b/drivers/accel/qaic/mhi_controller.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef MHICONTROLLERQAIC_H_
> +#define MHICONTROLLERQAIC_H_
> +
> +struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, void __iomem *mhi_bar,
> +						    int mhi_irq);
> +void qaic_mhi_free_controller(struct mhi_controller *mhi_cntl, bool link_up);
> +void qaic_mhi_start_reset(struct mhi_controller *mhi_cntl);
> +void qaic_mhi_reset_done(struct mhi_controller *mhi_cntl);
> +
> +#endif /* MHICONTROLLERQAIC_H_ */
> -- 
> 2.7.4
> 

-- 
மணிவண்ணன் சதாசிவம்
