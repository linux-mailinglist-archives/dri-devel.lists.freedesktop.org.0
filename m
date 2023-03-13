Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A376B792A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 14:39:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B54B10E11C;
	Mon, 13 Mar 2023 13:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAAD210E11C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 13:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678714752; x=1710250752;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Xc2RMaE3lC0su5hkiJE21J7OIAUA4MEI1x9jT8You6U=;
 b=PSfgkMyesN4YpxY7atjL64rAtsq9HqoS1UrxpNUO742lnEIWPoTnNqBP
 94NBjjHRZjRdaNJASu7sU0Uz9XcC8PTIN5eyUEZNjFuu6uCHzSZILjElK
 rbhtZZvwXDX8zqPOTwEgeyfvoxPq7RdnSnxfq2up8xmy1UOxJ0Bwxejn5
 xPECqDOXmTV3Qp4/zZLGfaOgXn49nEi73t8HS61ghISmCgmEP2iR2R4uL
 jdmu1LO23AUlbDjGaG8xkO5RWSaybTOKlKes8M6WL9s/gLckQ08k7Lfby
 //DtPfNbSoFTrPiTsEs3lAL+cdcjpPyFso8fcaI54ITqJLbKDPaFy0JOz A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="325505688"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="325505688"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 06:39:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="628639935"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="628639935"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.136.90])
 ([10.249.136.90])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 06:39:08 -0700
Message-ID: <14efa0d2-8958-7a0b-c243-45bd2fdeb1a2@linux.intel.com>
Date: Mon, 13 Mar 2023 14:39:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 3/8] accel/qaic: Add MHI controller
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dafna@fastmail.com,
 ogabbay@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 stanislaw.gruszka@linux.intel.com, dri-devel@lists.freedesktop.org
References: <1678138443-2760-1-git-send-email-quic_jhugo@quicinc.com>
 <1678138443-2760-4-git-send-email-quic_jhugo@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <1678138443-2760-4-git-send-email-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: quic_pkanojiy@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_carlv@quicinc.com, quic_ajitpals@quicinc.com, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 06.03.2023 22:33, Jeffrey Hugo wrote:
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
> ---
>  drivers/accel/qaic/mhi_controller.c | 563 ++++++++++++++++++++++++++++++++++++
>  drivers/accel/qaic/mhi_controller.h |  16 +
>  2 files changed, 579 insertions(+)
>  create mode 100644 drivers/accel/qaic/mhi_controller.c
>  create mode 100644 drivers/accel/qaic/mhi_controller.h
> 
> diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
> new file mode 100644
> index 0000000..f16dbb7
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
> +static unsigned int mhi_timeout = 2000; /* 2 sec default */
> +module_param(mhi_timeout, uint, 0600);

Consider documenting the param with MODULE_PARM_DESC() and adding _ms postfix to
indicate that time units it is using.

> +
> +static struct mhi_channel_config aic100_channels[] = {
> +	{
> +		.name = "QAIC_LOOPBACK",
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
> +	{
> +		.name = "QAIC_LOOPBACK",
> +		.num = 1,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_SAHARA",
> +		.num = 2,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = MHI_CH_EE_SBL,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_SAHARA",
> +		.num = 3,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_SBL,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_DIAG",
> +		.num = 4,
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
> +	{
> +		.name = "QAIC_DIAG",
> +		.num = 5,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_SSR",
> +		.num = 6,
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
> +	{
> +		.name = "QAIC_SSR",
> +		.num = 7,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_QDSS",
> +		.num = 8,
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
> +	{
> +		.name = "QAIC_QDSS",
> +		.num = 9,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_CONTROL",
> +		.num = 10,
> +		.num_elements = 128,
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
> +	{
> +		.name = "QAIC_CONTROL",
> +		.num = 11,
> +		.num_elements = 128,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_LOGGING",
> +		.num = 12,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = MHI_CH_EE_SBL,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_LOGGING",
> +		.num = 13,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_SBL,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_STATUS",
> +		.num = 14,
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
> +	{
> +		.name = "QAIC_STATUS",
> +		.num = 15,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_TELEMETRY",
> +		.num = 16,
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
> +	{
> +		.name = "QAIC_TELEMETRY",
> +		.num = 17,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_DEBUG",
> +		.num = 18,
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
> +	{
> +		.name = "QAIC_DEBUG",
> +		.num = 19,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_TIMESYNC",
> +		.num = 20,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = MHI_CH_EE_SBL | MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.num = 21,
> +		.name = "QAIC_TIMESYNC",
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_SBL | MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +};
> +
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
> +	/* this event occurs in non-atomic context */
> +	if (reason == MHI_CB_SYS_ERROR && !qdev->in_reset)

Looks like qdev->in_reset should be protected by qdev->dev_lock.

> +		qaic_dev_reset_clean_local_state(qdev, true);
> +}
> +
> +static int mhi_reset_and_async_power_up(struct mhi_controller *mhi_cntl)
> +{
> +	char time_sec = 1;
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
> +		msleep(1000)> +		current_ee = mhi_get_exec_env(mhi_cntl);
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
> +	aic100_config.timeout_ms = mhi_timeout;
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
> +		pci_err(pci_dev, "Device is not expected to be SBL EE. SOC resetting the device to put it in PBL EE and again trying mhi async power up. Error %d\n",

Please try to make this error message shorter. 

Regards,
Jacek
