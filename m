Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E46206CA7CD
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 16:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C12B10E383;
	Mon, 27 Mar 2023 14:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BEC910E139
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 14:35:05 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RAJChr024594; Mon, 27 Mar 2023 14:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=3ItZbRd/OkRnzkPQJFD/cEwajGnhrmtb+HyTes/nPpw=;
 b=TtDPqaWGT8fqtNo6lLvQ1lzgtw+nJKW4cAqBzobx33EZY+fKrP504qX+yhdgkh+AonCL
 dCY54Wp15Ms4rAc64Scqn71D50AfP/8EBqqBkP6z2nGGlvcEi7V80ocQ+bTu0ha0Ikmc
 /IrhlpDOKRr+61pOfFt0jcTkfW2AV+NfuF1rAeytBlXs5ruBdgLgOT+cCc7RIiFW0WrZ
 +Yfqb2+QJOJzPT8EzkhiwiUSnZi1GVFm2LrUTbqC41Ln/WveWhhW6t4bPggLVzvcYORo
 yizPBXZDW7lGKp1ZQdQPxaD9Aqjz85kl0BjhgpmfMv5cQ3ilUABnvICUSPBu+hog1P2e ww== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pk57715tw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 14:34:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32REYu0a020299
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 14:34:56 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 27 Mar
 2023 07:34:55 -0700
Message-ID: <bfab7ef8-1b2a-b873-9887-723e52016537@quicinc.com>
Date: Mon, 27 Mar 2023 08:34:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v4 3/8] accel/qaic: Add MHI controller
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <1679325074-5494-1-git-send-email-quic_jhugo@quicinc.com>
 <1679325074-5494-4-git-send-email-quic_jhugo@quicinc.com>
 <20230324102645.GB4259@thinkpad>
 <e671d2df-6429-185a-31b2-27734d537281@quicinc.com>
 <20230327065955.GB6270@thinkpad>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230327065955.GB6270@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: eJO7u5MCJTeYmiKK70z-8pq06OuoChzS
X-Proofpoint-ORIG-GUID: eJO7u5MCJTeYmiKK70z-8pq06OuoChzS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303270115
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

On 3/27/2023 12:59 AM, Manivannan Sadhasivam wrote:
> On Fri, Mar 24, 2023 at 09:26:49AM -0600, Jeffrey Hugo wrote:
>> On 3/24/2023 4:26 AM, Manivannan Sadhasivam wrote:
>>> On Mon, Mar 20, 2023 at 09:11:09AM -0600, Jeffrey Hugo wrote:
>>>> An AIC100 device contains a MHI interface with a number of different
>>>> channels for controlling different aspects of the device. The MHI
>>>> controller works with the MHI bus to enable and drive that interface.
>>>>
>>>> AIC100 uses the BHI protocol in PBL to load SBL. The MHI controller
>>>> expects the SBL to be located at /lib/firmware/qcom/aic100/sbl.bin and
>>>> expects the MHI bus to manage the process of loading and sending SBL to
>>>> the device.
>>>>
>>>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>>>> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
>>>> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>>> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
>>>> ---
>>>>    drivers/accel/qaic/mhi_controller.c | 563 ++++++++++++++++++++++++++++++++++++
>>>>    drivers/accel/qaic/mhi_controller.h |  16 +
>>>>    2 files changed, 579 insertions(+)
>>>>    create mode 100644 drivers/accel/qaic/mhi_controller.c
>>>>    create mode 100644 drivers/accel/qaic/mhi_controller.h
>>>>
>>>> diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
>>>> new file mode 100644
>>>> index 0000000..777dfbe
>>>> --- /dev/null
>>>> +++ b/drivers/accel/qaic/mhi_controller.c
>>>> @@ -0,0 +1,563 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +
>>>> +/* Copyright (c) 2019-2021, The Linux Foundation. All rights reserved. */
>>>> +/* Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved. */
>>>> +
>>>> +#include <linux/delay.h>
>>>> +#include <linux/err.h>
>>>> +#include <linux/memblock.h>
>>>> +#include <linux/mhi.h>
>>>> +#include <linux/moduleparam.h>
>>>> +#include <linux/pci.h>
>>>> +#include <linux/sizes.h>
>>>> +
>>>> +#include "mhi_controller.h"
>>>> +#include "qaic.h"
>>>> +
>>>> +#define MAX_RESET_TIME_SEC 25
>>>> +
>>>> +static unsigned int mhi_timeout_ms = 2000; /* 2 sec default */
>>>> +module_param(mhi_timeout_ms, uint, 0600);
>>>> +MODULE_PARM_DESC(mhi_timeout_ms, "MHI controller timeout value");
>>>> +
>>>> +static struct mhi_channel_config aic100_channels[] = {
>>>> +	{
>>>> +		.name = "QAIC_LOOPBACK",
>>>
>>> Why do you need QAIC_ prefix for channel names?
>>
>> To avoid existing and anticipated conflicts.
>>
>> As you are aware, the channel name becomes critical for the bus device and
>> is the key that the consumer driver will probe on.
>>
>> Sadly, that is rife for conflicts.  You can only have one driver for a
>> particular MHI device (channel).  Multiple drivers can register for it, but
>> only the first one will bind to the device.  This creates a race condition.
>> Whoever is able to register with the bus first, owns all instances of that
>> device.  That also means that particular driver on the bus also needs to be
>> able to handle all instances of that device.
>>
>> The WWAN subsystem already claims DIAG.  You and I both know from the WWAN
>> subsystem creation experience, the Net folks don't want a common framework
>> that can service multiple types of devices.  QAIC devices are not WWAN
>> devices, and were an argument for having a WWAN specific thing.  So, I can't
>> leverage WWAN, and frankly I shouldn't because my device is not a WWAN
>> device.  The WWAN userspace shouldn't try to use ACCEL/QAIC devices (one of
>> the reasons for having ACCEL instead of DRM).  Therefore DIAG devices are
>> WWAN exclusive, and I need to have a different device.  "DIAG2" seems like a
>> poor name.  If the QAIC DIAG device is going to be QAIC specific, having
>> QAIC in the name to isolate and identify it seems like the best option.
>>
>> I anticipate similar conflicts with
>> SAHARA/QDSS/DEBUG/TIMESYNC/LOGGING/LOOPBACK.  All of these are "common" with
>> other existing MHI devices.
>>
> 
> Hmm, this is something I anticipated to happen... :/
> 
>> I anticipate future conflicts with STATUS/RAS/TELEMETRY/CONTROL/SSR. These
>> are rather generic channel names.  It seems likely that a future WWAN device
>> or other MHI device would want a channel with the same name as one of these.
>> I'd like to leave that open as a possibility by not exclusivly claiming the
>> sole use to one of these names.
>>
>> Arguably this is an internal implementation detail with how the MHI bus
>> operates and could be fixed at first look.  However I don't think that is
>> the case because it looks like the WWAN subsystem is exposing these names to
>> userspace, which creates a uAPI that cannot be broken. Therefore I think we
>> are rather quite stuck with this situation and what I have proposed with
>> this patch is the best thing I've come up with to address the problem.  If
>> you have an alternate suggestion, I'm willing to discuss with you.
>>
> 
> I think what you have is the best for now. Only downside of this approach is
> the code duplication among the client drivers but I think we compromised this
> during the WWAN framework discussion.
> 
>>>
>>>> +		.num = 0,
>>>> +		.num_elements = 32,
>>>> +		.local_elements = 0,
>>>> +		.event_ring = 0,
>>>> +		.dir = DMA_TO_DEVICE,
>>>> +		.ee_mask = MHI_CH_EE_AMSS,
>>>> +		.pollcfg = 0,
>>>> +		.doorbell = MHI_DB_BRST_DISABLE,
>>>> +		.lpm_notify = false,
>>>> +		.offload_channel = false,
>>>> +		.doorbell_mode_switch = false,
>>>> +		.auto_queue = false,
>>>> +		.wake_capable = false,
>>>> +	},
>>>
>>> [...]
>>>
>>>> +static struct mhi_event_config aic100_events[] = {
>>>> +	{
>>>> +		.num_elements = 32,
>>>> +		.irq_moderation_ms = 0,
>>>> +		.irq = 0,
>>>> +		.channel = U32_MAX,
>>>> +		.priority = 1,
>>>> +		.mode = MHI_DB_BRST_DISABLE,
>>>> +		.data_type = MHI_ER_CTRL,
>>>> +		.hardware_event = false,
>>>> +		.client_managed = false,
>>>> +		.offload_channel = false,
>>>> +	},
>>>> +};
>>>> +
>>>
>>> It'd be nice to use macros for defining the channels and events as done in the
>>> pci_generic driver.
>>
>> I think the pci_generic driver has a usecase for using a macro in that it is
>> servicing multiple devices, with different configuration.  Right now, we
>> only have the one device with the one config.  I suspect that will change in
>> the future, but I don't have concrete information at the time to inform a
>> proper design.
>>
>> I feel this should be left until such time the multi-device scenario becomes
>> realized.
>>
> 
> Ok, this sounds reasonable to me.
> 
>>>
>>>> +static struct mhi_controller_config aic100_config = {
>>>> +	.max_channels = 128,
>>>> +	.timeout_ms = 0, /* controlled by mhi_timeout */
>>>> +	.buf_len = 0,
>>>> +	.num_channels = ARRAY_SIZE(aic100_channels),
>>>> +	.ch_cfg = aic100_channels,
>>>> +	.num_events = ARRAY_SIZE(aic100_events),
>>>> +	.event_cfg = aic100_events,
>>>> +	.use_bounce_buf = false,
>>>> +	.m2_no_db = false,
>>>> +};
>>>> +
>>>> +static int mhi_read_reg(struct mhi_controller *mhi_cntl, void __iomem *addr, u32 *out)
>>>> +{
>>>> +	u32 tmp = readl_relaxed(addr);
>>>> +
>>>> +	if (tmp == U32_MAX)
>>>> +		return -EIO;
>>>> +
>>>> +	*out = tmp;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void mhi_write_reg(struct mhi_controller *mhi_cntl, void __iomem *addr, u32 val)
>>>> +{
>>>> +	writel_relaxed(val, addr);
>>>> +}
>>>> +
>>>> +static int mhi_runtime_get(struct mhi_controller *mhi_cntl)
>>>> +{
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void mhi_runtime_put(struct mhi_controller *mhi_cntl)
>>>> +{
>>>> +}
>>>> +
>>>> +static void mhi_status_cb(struct mhi_controller *mhi_cntl, enum mhi_callback reason)
>>>> +{
>>>> +	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(mhi_cntl->cntrl_dev));
>>>> +
>>>> +	/* this event occurs in atomic context */
>>>> +	if (reason == MHI_CB_FATAL_ERROR)
>>>> +		pci_err(qdev->pdev, "Fatal error received from device. Attempting to recover\n");
>>>
>>> Why no dev_err()?
>>
>> pci_err is more specific than dev_err.  It is built upon dev_err. pci_err
>> seems to be preferred for pci devices, and also matches uses elsewhere in
>> the driver.
>>
> 
> Ok.
> 
>>>
>>>> +	/* this event occurs in non-atomic context */
>>>> +	if (reason == MHI_CB_SYS_ERROR)
>>>> +		qaic_dev_reset_clean_local_state(qdev, true);
>>>> +}
>>>> +
>>>> +static int mhi_reset_and_async_power_up(struct mhi_controller *mhi_cntl)
>>>> +{
>>>> +	char time_sec = 1;
>>>
>>> u8?
>>
>> Eh.  Ok I guess.  I usually reserve the size specific types for things where
>> that size is required, such as sending data over a network.
>>
>>>
>>>> +	int current_ee;
>>>> +	int ret;
>>>> +
>>>> +	/* Reset the device to bring the device in PBL EE */
>>>> +	mhi_soc_reset(mhi_cntl);
>>>> +
>>>> +	/*
>>>> +	 * Keep checking the execution environment(EE) after every 1 second
>>>> +	 * interval.
>>>> +	 */
>>>> +	do {
>>>> +		msleep(1000);
>>>> +		current_ee = mhi_get_exec_env(mhi_cntl);
>>>> +	} while (current_ee != MHI_EE_PBL && time_sec++ <= MAX_RESET_TIME_SEC);
>>>> +
>>>> +	/* If the device is in PBL EE retry power up */
>>>> +	if (current_ee == MHI_EE_PBL)
>>>> +		ret = mhi_async_power_up(mhi_cntl);
>>>> +	else
>>>> +		ret = -EIO;
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, void __iomem *mhi_bar,
>>>> +						    int mhi_irq)
>>>> +{
>>>> +	struct mhi_controller *mhi_cntl;
>>>
>>> Cosmetic change: We use "mhi_cntrl" in other controller drivers. So it is
>>> better to follow the same pattern here also.
>>
>> If you insist.  "cntl" is the more common abbreviation.  The MHI bus is the
>> first place I recall seeing "cntrl".
>>
> 
> For some reason, all MHI controller drivers have picked up this notation. So
> I'd like to keep it same.

Done.

> 
>>>
>>>> +	int ret;
>>>> +
>>>> +	mhi_cntl = devm_kzalloc(&pci_dev->dev, sizeof(*mhi_cntl), GFP_KERNEL);
>>>> +	if (!mhi_cntl)
>>>> +		return ERR_PTR(-ENOMEM);
>>>> +
>>>> +	mhi_cntl->cntrl_dev = &pci_dev->dev;
>>>> +
>>>> +	/*
>>>> +	 * Covers the entire possible physical ram region. Remote side is
>>>> +	 * going to calculate a size of this range, so subtract 1 to prevent
>>>> +	 * rollover.
>>>> +	 */
>>>> +	mhi_cntl->iova_start = 0;
>>>> +	mhi_cntl->iova_stop = PHYS_ADDR_MAX - 1;
>>>> +	mhi_cntl->status_cb = mhi_status_cb;
>>>> +	mhi_cntl->runtime_get = mhi_runtime_get;
>>>> +	mhi_cntl->runtime_put = mhi_runtime_put;
>>>> +	mhi_cntl->read_reg = mhi_read_reg;
>>>> +	mhi_cntl->write_reg = mhi_write_reg;
>>>> +	mhi_cntl->regs = mhi_bar;
>>>> +	mhi_cntl->reg_len = SZ_4K;
>>>
>>> Is this size fixed for all AIC100 revisions? I think you should get this value
>>> from pci_resource_len() to avoid issues later.
>>
>> Yes, this size is burned into the silicon with no provision for ever
>> changing it.
>>
> 
> Fine then!
> 
> Thanks,
> Mani
> 
>>>
>>> Thanks,
>>> Mani
>>>
>>>> +	mhi_cntl->nr_irqs = 1;
>>>> +	mhi_cntl->irq = devm_kmalloc(&pci_dev->dev, sizeof(*mhi_cntl->irq), GFP_KERNEL);
>>>> +
>>>> +	if (!mhi_cntl->irq)
>>>> +		return ERR_PTR(-ENOMEM);
>>>> +
>>>> +	mhi_cntl->irq[0] = mhi_irq;
>>>> +	mhi_cntl->fw_image = "qcom/aic100/sbl.bin";
>>>> +
>>>> +	/* use latest configured timeout */
>>>> +	aic100_config.timeout_ms = mhi_timeout_ms;
>>>> +	ret = mhi_register_controller(mhi_cntl, &aic100_config);
>>>> +	if (ret) {
>>>> +		pci_err(pci_dev, "mhi_register_controller failed %d\n", ret);
>>>> +		return ERR_PTR(ret);
>>>> +	}
>>>> +
>>>> +	ret = mhi_prepare_for_power_up(mhi_cntl);
>>>> +	if (ret) {
>>>> +		pci_err(pci_dev, "mhi_prepare_for_power_up failed %d\n", ret);
>>>> +		goto prepare_power_up_fail;
>>>> +	}
>>>> +
>>>> +	ret = mhi_async_power_up(mhi_cntl);
>>>> +	/*
>>>> +	 * If EIO is returned it is possible that device is in SBL EE, which is
>>>> +	 * undesired. SOC reset the device and try to power up again.
>>>> +	 */
>>>> +	if (ret == -EIO && MHI_EE_SBL == mhi_get_exec_env(mhi_cntl)) {
>>>> +		pci_err(pci_dev, "Found device in SBL at MHI init. Attempting a reset.\n");
>>>> +		ret = mhi_reset_and_async_power_up(mhi_cntl);
>>>> +	}
>>>> +
>>>> +	if (ret) {
>>>> +		pci_err(pci_dev, "mhi_async_power_up failed %d\n", ret);
>>>> +		goto power_up_fail;
>>>> +	}
>>>> +
>>>> +	return mhi_cntl;
>>>> +
>>>> +power_up_fail:
>>>> +	mhi_unprepare_after_power_down(mhi_cntl);
>>>> +prepare_power_up_fail:
>>>> +	mhi_unregister_controller(mhi_cntl);
>>>> +	return ERR_PTR(ret);
>>>> +}
>>>> +
>>>> +void qaic_mhi_free_controller(struct mhi_controller *mhi_cntl, bool link_up)
>>>> +{
>>>> +	mhi_power_down(mhi_cntl, link_up);
>>>> +	mhi_unprepare_after_power_down(mhi_cntl);
>>>> +	mhi_unregister_controller(mhi_cntl);
>>>> +}
>>>> +
>>>> +void qaic_mhi_start_reset(struct mhi_controller *mhi_cntl)
>>>> +{
>>>> +	mhi_power_down(mhi_cntl, true);
>>>> +}
>>>> +
>>>> +void qaic_mhi_reset_done(struct mhi_controller *mhi_cntl)
>>>> +{
>>>> +	struct pci_dev *pci_dev = container_of(mhi_cntl->cntrl_dev, struct pci_dev, dev);
>>>> +	int ret;
>>>> +
>>>> +	ret = mhi_async_power_up(mhi_cntl);
>>>> +	if (ret)
>>>> +		pci_err(pci_dev, "mhi_async_power_up failed after reset %d\n", ret);
>>>> +}
>>>> diff --git a/drivers/accel/qaic/mhi_controller.h b/drivers/accel/qaic/mhi_controller.h
>>>> new file mode 100644
>>>> index 0000000..c105e93
>>>> --- /dev/null
>>>> +++ b/drivers/accel/qaic/mhi_controller.h
>>>> @@ -0,0 +1,16 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only
>>>> + *
>>>> + * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
>>>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>>>> + */
>>>> +
>>>> +#ifndef MHICONTROLLERQAIC_H_
>>>> +#define MHICONTROLLERQAIC_H_
>>>> +
>>>> +struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, void __iomem *mhi_bar,
>>>> +						    int mhi_irq);
>>>> +void qaic_mhi_free_controller(struct mhi_controller *mhi_cntl, bool link_up);
>>>> +void qaic_mhi_start_reset(struct mhi_controller *mhi_cntl);
>>>> +void qaic_mhi_reset_done(struct mhi_controller *mhi_cntl);
>>>> +
>>>> +#endif /* MHICONTROLLERQAIC_H_ */
>>>> -- 
>>>> 2.7.4
>>>>
>>>
>>
> 

