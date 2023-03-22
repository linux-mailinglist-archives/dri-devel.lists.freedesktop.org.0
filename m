Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 136626C445F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 08:51:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026BA10E096;
	Wed, 22 Mar 2023 07:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8AA10E096
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 07:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679471494; x=1711007494;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PU9GOuDi/fgTWi5Spx11PPiP9OpytiVar0EZ/+QMDmw=;
 b=JMHyP9/P0p2cWfGSMiaBbMewZ412igTX8ovhASvaDiDYNyrfBFW22hkZ
 9ZBfgE+I7q+MRc83x2bRqPSfvQlyMySpecx/ZJB8PFlCkOXG3aMnxtkU6
 DItOn8d9dSg14DHW1w7qgJjwT+1AZg9wf1hX5qRSsYBbIrM4ga2Q5qBk+
 W/TM4VQX4qZfKPzmGc3frLzFpxJ5iL5iEPM7J3nf5VL55RDRxgoizQ8qy
 3Xqt8mQ+LX2R0NcgwAHup20UHXBGndJkdZ0JdVoCjlIFKZW2qk29o4Bgk
 gKXaw/m97j5urdjrgpTMNfDYqmTDySvKephdmkQVr2+ERt8XMw6Wp/Fvp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="341508029"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="341508029"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 00:51:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="659099611"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="659099611"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.146.128])
 ([10.249.146.128])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 00:51:30 -0700
Message-ID: <4efc858e-8bfc-faba-94de-b9f32aec2047@linux.intel.com>
Date: Wed, 22 Mar 2023 08:51:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 3/8] accel/qaic: Add MHI controller
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, ogabbay@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch, stanislaw.gruszka@linux.intel.com
References: <1679325074-5494-1-git-send-email-quic_jhugo@quicinc.com>
 <1679325074-5494-4-git-send-email-quic_jhugo@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <1679325074-5494-4-git-send-email-quic_jhugo@quicinc.com>
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
Cc: dafna@fastmail.com, linux-doc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_ajitpals@quicinc.com, quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 20.03.2023 16:11, Jeffrey Hugo wrote:
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
> +	if (reason == MHI_CB_SYS_ERROR)
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
