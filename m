Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C17D6B7FAA
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 18:46:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542E510E5D3;
	Mon, 13 Mar 2023 17:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B8610E5D3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 17:46:00 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32DGaMSV003611; Mon, 13 Mar 2023 17:45:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=PkTkU0qQUPHgBNDRTHsedo1RsARe91JmcxMeDvG6aWY=;
 b=pU7EBk5fBULKpYMjpOoOQ8fSjmr8SgGj11EPAlJKTNE0aEa5Ug3fcPnvsG68LNItFfNS
 09XA9/F1RjGlK+F2fxqu5yacZd3fKmVXZYa8En2eH6lsYvPPmw6qIimE0otFGYSiYj7w
 3weYKAv1HUzVRYFoDu5bVZ7Nw0FzcNMp2AFL6qtQKCItWDF5pdkgH49n0z/oFKZCYxu/
 Ld+AGNdcoPhGjzxoLbZwAijeni6IPwERCnf1e1jgz7UFUyTs6zNnSaKvS38/o7Vb26Fr
 P6odaaauD3+Fhqt2qEdXV3h/wj/NXkN8l33lM1/wieKoaC+a6wWp4DTG9dJXvlNAlxcV TA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pa3ptrw6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 17:45:51 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32DHjnjP018254
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 17:45:50 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 13 Mar
 2023 10:45:35 -0700
Message-ID: <9e156ef9-a783-acd5-42c1-58cd451eeb65@quicinc.com>
Date: Mon, 13 Mar 2023 11:45:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v3 3/8] accel/qaic: Add MHI controller
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dafna@fastmail.com>, <ogabbay@kernel.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <1678138443-2760-1-git-send-email-quic_jhugo@quicinc.com>
 <1678138443-2760-4-git-send-email-quic_jhugo@quicinc.com>
 <14efa0d2-8958-7a0b-c243-45bd2fdeb1a2@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <14efa0d2-8958-7a0b-c243-45bd2fdeb1a2@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: co9phANkK0Cr7dT8lkFHEEunQ7iS0aQi
X-Proofpoint-ORIG-GUID: co9phANkK0Cr7dT8lkFHEEunQ7iS0aQi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_08,2023-03-13_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303130138
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

On 3/13/2023 7:39 AM, Jacek Lawrynowicz wrote:
> Hi,
> 
> On 06.03.2023 22:33, Jeffrey Hugo wrote:
>> An AIC100 device contains a MHI interface with a number of different
>> channels for controlling different aspects of the device. The MHI
>> controller works with the MHI bus to enable and drive that interface.
>>
>> AIC100 uses the BHI protocol in PBL to load SBL. The MHI controller
>> expects the SBL to be located at /lib/firmware/qcom/aic100/sbl.bin and
>> expects the MHI bus to manage the process of loading and sending SBL to
>> the device.
>>
>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
>> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>> ---
>>   drivers/accel/qaic/mhi_controller.c | 563 ++++++++++++++++++++++++++++++++++++
>>   drivers/accel/qaic/mhi_controller.h |  16 +
>>   2 files changed, 579 insertions(+)
>>   create mode 100644 drivers/accel/qaic/mhi_controller.c
>>   create mode 100644 drivers/accel/qaic/mhi_controller.h
>>
>> diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
>> new file mode 100644
>> index 0000000..f16dbb7
>> --- /dev/null
>> +++ b/drivers/accel/qaic/mhi_controller.c
>> @@ -0,0 +1,563 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
>> +/* Copyright (c) 2019-2021, The Linux Foundation. All rights reserved. */
>> +/* Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved. */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/err.h>
>> +#include <linux/memblock.h>
>> +#include <linux/mhi.h>
>> +#include <linux/moduleparam.h>
>> +#include <linux/pci.h>
>> +#include <linux/sizes.h>
>> +
>> +#include "mhi_controller.h"
>> +#include "qaic.h"
>> +
>> +#define MAX_RESET_TIME_SEC 25
>> +
>> +static unsigned int mhi_timeout = 2000; /* 2 sec default */
>> +module_param(mhi_timeout, uint, 0600);
> 
> Consider documenting the param with MODULE_PARM_DESC() and adding _ms postfix to
> indicate that time units it is using.

Will do.

> 
>> +
>> +static struct mhi_channel_config aic100_channels[] = {
>> +	{
>> +		.name = "QAIC_LOOPBACK",
>> +		.num = 0,
>> +		.num_elements = 32,
>> +		.local_elements = 0,
>> +		.event_ring = 0,
>> +		.dir = DMA_TO_DEVICE,
>> +		.ee_mask = MHI_CH_EE_AMSS,
>> +		.pollcfg = 0,
>> +		.doorbell = MHI_DB_BRST_DISABLE,
>> +		.lpm_notify = false,
>> +		.offload_channel = false,
>> +		.doorbell_mode_switch = false,
>> +		.auto_queue = false,
>> +		.wake_capable = false,
>> +	},
>> +	{
>> +		.name = "QAIC_LOOPBACK",
>> +		.num = 1,
>> +		.num_elements = 32,
>> +		.local_elements = 0,
>> +		.event_ring = 0,
>> +		.dir = DMA_FROM_DEVICE,
>> +		.ee_mask = MHI_CH_EE_AMSS,
>> +		.pollcfg = 0,
>> +		.doorbell = MHI_DB_BRST_DISABLE,
>> +		.lpm_notify = false,
>> +		.offload_channel = false,
>> +		.doorbell_mode_switch = false,
>> +		.auto_queue = false,
>> +		.wake_capable = false,
>> +	},
>> +	{
>> +		.name = "QAIC_SAHARA",
>> +		.num = 2,
>> +		.num_elements = 32,
>> +		.local_elements = 0,
>> +		.event_ring = 0,
>> +		.dir = DMA_TO_DEVICE,
>> +		.ee_mask = MHI_CH_EE_SBL,
>> +		.pollcfg = 0,
>> +		.doorbell = MHI_DB_BRST_DISABLE,
>> +		.lpm_notify = false,
>> +		.offload_channel = false,
>> +		.doorbell_mode_switch = false,
>> +		.auto_queue = false,
>> +		.wake_capable = false,
>> +	},
>> +	{
>> +		.name = "QAIC_SAHARA",
>> +		.num = 3,
>> +		.num_elements = 32,
>> +		.local_elements = 0,
>> +		.event_ring = 0,
>> +		.dir = DMA_FROM_DEVICE,
>> +		.ee_mask = MHI_CH_EE_SBL,
>> +		.pollcfg = 0,
>> +		.doorbell = MHI_DB_BRST_DISABLE,
>> +		.lpm_notify = false,
>> +		.offload_channel = false,
>> +		.doorbell_mode_switch = false,
>> +		.auto_queue = false,
>> +		.wake_capable = false,
>> +	},
>> +	{
>> +		.name = "QAIC_DIAG",
>> +		.num = 4,
>> +		.num_elements = 32,
>> +		.local_elements = 0,
>> +		.event_ring = 0,
>> +		.dir = DMA_TO_DEVICE,
>> +		.ee_mask = MHI_CH_EE_AMSS,
>> +		.pollcfg = 0,
>> +		.doorbell = MHI_DB_BRST_DISABLE,
>> +		.lpm_notify = false,
>> +		.offload_channel = false,
>> +		.doorbell_mode_switch = false,
>> +		.auto_queue = false,
>> +		.wake_capable = false,
>> +	},
>> +	{
>> +		.name = "QAIC_DIAG",
>> +		.num = 5,
>> +		.num_elements = 32,
>> +		.local_elements = 0,
>> +		.event_ring = 0,
>> +		.dir = DMA_FROM_DEVICE,
>> +		.ee_mask = MHI_CH_EE_AMSS,
>> +		.pollcfg = 0,
>> +		.doorbell = MHI_DB_BRST_DISABLE,
>> +		.lpm_notify = false,
>> +		.offload_channel = false,
>> +		.doorbell_mode_switch = false,
>> +		.auto_queue = false,
>> +		.wake_capable = false,
>> +	},
>> +	{
>> +		.name = "QAIC_SSR",
>> +		.num = 6,
>> +		.num_elements = 32,
>> +		.local_elements = 0,
>> +		.event_ring = 0,
>> +		.dir = DMA_TO_DEVICE,
>> +		.ee_mask = MHI_CH_EE_AMSS,
>> +		.pollcfg = 0,
>> +		.doorbell = MHI_DB_BRST_DISABLE,
>> +		.lpm_notify = false,
>> +		.offload_channel = false,
>> +		.doorbell_mode_switch = false,
>> +		.auto_queue = false,
>> +		.wake_capable = false,
>> +	},
>> +	{
>> +		.name = "QAIC_SSR",
>> +		.num = 7,
>> +		.num_elements = 32,
>> +		.local_elements = 0,
>> +		.event_ring = 0,
>> +		.dir = DMA_FROM_DEVICE,
>> +		.ee_mask = MHI_CH_EE_AMSS,
>> +		.pollcfg = 0,
>> +		.doorbell = MHI_DB_BRST_DISABLE,
>> +		.lpm_notify = false,
>> +		.offload_channel = false,
>> +		.doorbell_mode_switch = false,
>> +		.auto_queue = false,
>> +		.wake_capable = false,
>> +	},
>> +	{
>> +		.name = "QAIC_QDSS",
>> +		.num = 8,
>> +		.num_elements = 32,
>> +		.local_elements = 0,
>> +		.event_ring = 0,
>> +		.dir = DMA_TO_DEVICE,
>> +		.ee_mask = MHI_CH_EE_AMSS,
>> +		.pollcfg = 0,
>> +		.doorbell = MHI_DB_BRST_DISABLE,
>> +		.lpm_notify = false,
>> +		.offload_channel = false,
>> +		.doorbell_mode_switch = false,
>> +		.auto_queue = false,
>> +		.wake_capable = false,
>> +	},
>> +	{
>> +		.name = "QAIC_QDSS",
>> +		.num = 9,
>> +		.num_elements = 32,
>> +		.local_elements = 0,
>> +		.event_ring = 0,
>> +		.dir = DMA_FROM_DEVICE,
>> +		.ee_mask = MHI_CH_EE_AMSS,
>> +		.pollcfg = 0,
>> +		.doorbell = MHI_DB_BRST_DISABLE,
>> +		.lpm_notify = false,
>> +		.offload_channel = false,
>> +		.doorbell_mode_switch = false,
>> +		.auto_queue = false,
>> +		.wake_capable = false,
>> +	},
>> +	{
>> +		.name = "QAIC_CONTROL",
>> +		.num = 10,
>> +		.num_elements = 128,
>> +		.local_elements = 0,
>> +		.event_ring = 0,
>> +		.dir = DMA_TO_DEVICE,
>> +		.ee_mask = MHI_CH_EE_AMSS,
>> +		.pollcfg = 0,
>> +		.doorbell = MHI_DB_BRST_DISABLE,
>> +		.lpm_notify = false,
>> +		.offload_channel = false,
>> +		.doorbell_mode_switch = false,
>> +		.auto_queue = false,
>> +		.wake_capable = false,
>> +	},
>> +	{
>> +		.name = "QAIC_CONTROL",
>> +		.num = 11,
>> +		.num_elements = 128,
>> +		.local_elements = 0,
>> +		.event_ring = 0,
>> +		.dir = DMA_FROM_DEVICE,
>> +		.ee_mask = MHI_CH_EE_AMSS,
>> +		.pollcfg = 0,
>> +		.doorbell = MHI_DB_BRST_DISABLE,
>> +		.lpm_notify = false,
>> +		.offload_channel = false,
>> +		.doorbell_mode_switch = false,
>> +		.auto_queue = false,
>> +		.wake_capable = false,
>> +	},
>> +	{
>> +		.name = "QAIC_LOGGING",
>> +		.num = 12,
>> +		.num_elements = 32,
>> +		.local_elements = 0,
>> +		.event_ring = 0,
>> +		.dir = DMA_TO_DEVICE,
>> +		.ee_mask = MHI_CH_EE_SBL,
>> +		.pollcfg = 0,
>> +		.doorbell = MHI_DB_BRST_DISABLE,
>> +		.lpm_notify = false,
>> +		.offload_channel = false,
>> +		.doorbell_mode_switch = false,
>> +		.auto_queue = false,
>> +		.wake_capable = false,
>> +	},
>> +	{
>> +		.name = "QAIC_LOGGING",
>> +		.num = 13,
>> +		.num_elements = 32,
>> +		.local_elements = 0,
>> +		.event_ring = 0,
>> +		.dir = DMA_FROM_DEVICE,
>> +		.ee_mask = MHI_CH_EE_SBL,
>> +		.pollcfg = 0,
>> +		.doorbell = MHI_DB_BRST_DISABLE,
>> +		.lpm_notify = false,
>> +		.offload_channel = false,
>> +		.doorbell_mode_switch = false,
>> +		.auto_queue = false,
>> +		.wake_capable = false,
>> +	},
>> +	{
>> +		.name = "QAIC_STATUS",
>> +		.num = 14,
>> +		.num_elements = 32,
>> +		.local_elements = 0,
>> +		.event_ring = 0,
>> +		.dir = DMA_TO_DEVICE,
>> +		.ee_mask = MHI_CH_EE_AMSS,
>> +		.pollcfg = 0,
>> +		.doorbell = MHI_DB_BRST_DISABLE,
>> +		.lpm_notify = false,
>> +		.offload_channel = false,
>> +		.doorbell_mode_switch = false,
>> +		.auto_queue = false,
>> +		.wake_capable = false,
>> +	},
>> +	{
>> +		.name = "QAIC_STATUS",
>> +		.num = 15,
>> +		.num_elements = 32,
>> +		.local_elements = 0,
>> +		.event_ring = 0,
>> +		.dir = DMA_FROM_DEVICE,
>> +		.ee_mask = MHI_CH_EE_AMSS,
>> +		.pollcfg = 0,
>> +		.doorbell = MHI_DB_BRST_DISABLE,
>> +		.lpm_notify = false,
>> +		.offload_channel = false,
>> +		.doorbell_mode_switch = false,
>> +		.auto_queue = false,
>> +		.wake_capable = false,
>> +	},
>> +	{
>> +		.name = "QAIC_TELEMETRY",
>> +		.num = 16,
>> +		.num_elements = 32,
>> +		.local_elements = 0,
>> +		.event_ring = 0,
>> +		.dir = DMA_TO_DEVICE,
>> +		.ee_mask = MHI_CH_EE_AMSS,
>> +		.pollcfg = 0,
>> +		.doorbell = MHI_DB_BRST_DISABLE,
>> +		.lpm_notify = false,
>> +		.offload_channel = false,
>> +		.doorbell_mode_switch = false,
>> +		.auto_queue = false,
>> +		.wake_capable = false,
>> +	},
>> +	{
>> +		.name = "QAIC_TELEMETRY",
>> +		.num = 17,
>> +		.num_elements = 32,
>> +		.local_elements = 0,
>> +		.event_ring = 0,
>> +		.dir = DMA_FROM_DEVICE,
>> +		.ee_mask = MHI_CH_EE_AMSS,
>> +		.pollcfg = 0,
>> +		.doorbell = MHI_DB_BRST_DISABLE,
>> +		.lpm_notify = false,
>> +		.offload_channel = false,
>> +		.doorbell_mode_switch = false,
>> +		.auto_queue = false,
>> +		.wake_capable = false,
>> +	},
>> +	{
>> +		.name = "QAIC_DEBUG",
>> +		.num = 18,
>> +		.num_elements = 32,
>> +		.local_elements = 0,
>> +		.event_ring = 0,
>> +		.dir = DMA_TO_DEVICE,
>> +		.ee_mask = MHI_CH_EE_AMSS,
>> +		.pollcfg = 0,
>> +		.doorbell = MHI_DB_BRST_DISABLE,
>> +		.lpm_notify = false,
>> +		.offload_channel = false,
>> +		.doorbell_mode_switch = false,
>> +		.auto_queue = false,
>> +		.wake_capable = false,
>> +	},
>> +	{
>> +		.name = "QAIC_DEBUG",
>> +		.num = 19,
>> +		.num_elements = 32,
>> +		.local_elements = 0,
>> +		.event_ring = 0,
>> +		.dir = DMA_FROM_DEVICE,
>> +		.ee_mask = MHI_CH_EE_AMSS,
>> +		.pollcfg = 0,
>> +		.doorbell = MHI_DB_BRST_DISABLE,
>> +		.lpm_notify = false,
>> +		.offload_channel = false,
>> +		.doorbell_mode_switch = false,
>> +		.auto_queue = false,
>> +		.wake_capable = false,
>> +	},
>> +	{
>> +		.name = "QAIC_TIMESYNC",
>> +		.num = 20,
>> +		.num_elements = 32,
>> +		.local_elements = 0,
>> +		.event_ring = 0,
>> +		.dir = DMA_TO_DEVICE,
>> +		.ee_mask = MHI_CH_EE_SBL | MHI_CH_EE_AMSS,
>> +		.pollcfg = 0,
>> +		.doorbell = MHI_DB_BRST_DISABLE,
>> +		.lpm_notify = false,
>> +		.offload_channel = false,
>> +		.doorbell_mode_switch = false,
>> +		.auto_queue = false,
>> +		.wake_capable = false,
>> +	},
>> +	{
>> +		.num = 21,
>> +		.name = "QAIC_TIMESYNC",
>> +		.num_elements = 32,
>> +		.local_elements = 0,
>> +		.event_ring = 0,
>> +		.dir = DMA_FROM_DEVICE,
>> +		.ee_mask = MHI_CH_EE_SBL | MHI_CH_EE_AMSS,
>> +		.pollcfg = 0,
>> +		.doorbell = MHI_DB_BRST_DISABLE,
>> +		.lpm_notify = false,
>> +		.offload_channel = false,
>> +		.doorbell_mode_switch = false,
>> +		.auto_queue = false,
>> +		.wake_capable = false,
>> +	},
>> +};
>> +
>> +static struct mhi_event_config aic100_events[] = {
>> +	{
>> +		.num_elements = 32,
>> +		.irq_moderation_ms = 0,
>> +		.irq = 0,
>> +		.channel = U32_MAX,
>> +		.priority = 1,
>> +		.mode = MHI_DB_BRST_DISABLE,
>> +		.data_type = MHI_ER_CTRL,
>> +		.hardware_event = false,
>> +		.client_managed = false,
>> +		.offload_channel = false,
>> +	},
>> +};
>> +
>> +static struct mhi_controller_config aic100_config = {
>> +	.max_channels = 128,
>> +	.timeout_ms = 0, /* controlled by mhi_timeout */
>> +	.buf_len = 0,
>> +	.num_channels = ARRAY_SIZE(aic100_channels),
>> +	.ch_cfg = aic100_channels,
>> +	.num_events = ARRAY_SIZE(aic100_events),
>> +	.event_cfg = aic100_events,
>> +	.use_bounce_buf = false,
>> +	.m2_no_db = false,
>> +};
>> +
>> +static int mhi_read_reg(struct mhi_controller *mhi_cntl, void __iomem *addr, u32 *out)
>> +{
>> +	u32 tmp = readl_relaxed(addr);
>> +
>> +	if (tmp == U32_MAX)
>> +		return -EIO;
>> +
>> +	*out = tmp;
>> +
>> +	return 0;
>> +}
>> +
>> +static void mhi_write_reg(struct mhi_controller *mhi_cntl, void __iomem *addr, u32 val)
>> +{
>> +	writel_relaxed(val, addr);
>> +}
>> +
>> +static int mhi_runtime_get(struct mhi_controller *mhi_cntl)
>> +{
>> +	return 0;
>> +}
>> +
>> +static void mhi_runtime_put(struct mhi_controller *mhi_cntl)
>> +{
>> +}
>> +
>> +static void mhi_status_cb(struct mhi_controller *mhi_cntl, enum mhi_callback reason)
>> +{
>> +	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(mhi_cntl->cntrl_dev));
>> +
>> +	/* this event occurs in atomic context */
>> +	if (reason == MHI_CB_FATAL_ERROR)
>> +		pci_err(qdev->pdev, "Fatal error received from device. Attempting to recover\n");
>> +	/* this event occurs in non-atomic context */
>> +	if (reason == MHI_CB_SYS_ERROR && !qdev->in_reset)
> 
> Looks like qdev->in_reset should be protected by qdev->dev_lock.

Will check.

> 
>> +		qaic_dev_reset_clean_local_state(qdev, true);
>> +}
>> +
>> +static int mhi_reset_and_async_power_up(struct mhi_controller *mhi_cntl)
>> +{
>> +	char time_sec = 1;
>> +	int current_ee;
>> +	int ret;
>> +
>> +	/* Reset the device to bring the device in PBL EE */
>> +	mhi_soc_reset(mhi_cntl);
>> +
>> +	/*
>> +	 * Keep checking the execution environment(EE) after every 1 second
>> +	 * interval.
>> +	 */
>> +	do {
>> +		msleep(1000)> +		current_ee = mhi_get_exec_env(mhi_cntl);
>> +	} while (current_ee != MHI_EE_PBL && time_sec++ <= MAX_RESET_TIME_SEC);
>> +
>> +	/* If the device is in PBL EE retry power up */
>> +	if (current_ee == MHI_EE_PBL)
>> +		ret = mhi_async_power_up(mhi_cntl);
>> +	else
>> +		ret = -EIO;
>> +
>> +	return ret;
>> +}
>> +
>> +struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, void __iomem *mhi_bar,
>> +						    int mhi_irq)
>> +{
>> +	struct mhi_controller *mhi_cntl;
>> +	int ret;
>> +
>> +	mhi_cntl = devm_kzalloc(&pci_dev->dev, sizeof(*mhi_cntl), GFP_KERNEL);
>> +	if (!mhi_cntl)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	mhi_cntl->cntrl_dev = &pci_dev->dev;
>> +
>> +	/*
>> +	 * Covers the entire possible physical ram region. Remote side is
>> +	 * going to calculate a size of this range, so subtract 1 to prevent
>> +	 * rollover.
>> +	 */
>> +	mhi_cntl->iova_start = 0;
>> +	mhi_cntl->iova_stop = PHYS_ADDR_MAX - 1;
>> +	mhi_cntl->status_cb = mhi_status_cb;
>> +	mhi_cntl->runtime_get = mhi_runtime_get;
>> +	mhi_cntl->runtime_put = mhi_runtime_put;
>> +	mhi_cntl->read_reg = mhi_read_reg;
>> +	mhi_cntl->write_reg = mhi_write_reg;
>> +	mhi_cntl->regs = mhi_bar;
>> +	mhi_cntl->reg_len = SZ_4K;
>> +	mhi_cntl->nr_irqs = 1;
>> +	mhi_cntl->irq = devm_kmalloc(&pci_dev->dev, sizeof(*mhi_cntl->irq), GFP_KERNEL);
>> +
>> +	if (!mhi_cntl->irq)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	mhi_cntl->irq[0] = mhi_irq;
>> +	mhi_cntl->fw_image = "qcom/aic100/sbl.bin";
>> +
>> +	/* use latest configured timeout */
>> +	aic100_config.timeout_ms = mhi_timeout;
>> +	ret = mhi_register_controller(mhi_cntl, &aic100_config);
>> +	if (ret) {
>> +		pci_err(pci_dev, "mhi_register_controller failed %d\n", ret);
>> +		return ERR_PTR(ret);
>> +	}
>> +
>> +	ret = mhi_prepare_for_power_up(mhi_cntl);
>> +	if (ret) {
>> +		pci_err(pci_dev, "mhi_prepare_for_power_up failed %d\n", ret);
>> +		goto prepare_power_up_fail;
>> +	}
>> +
>> +	ret = mhi_async_power_up(mhi_cntl);
>> +	/*
>> +	 * If EIO is returned it is possible that device is in SBL EE, which is
>> +	 * undesired. SOC reset the device and try to power up again.
>> +	 */
>> +	if (ret == -EIO && MHI_EE_SBL == mhi_get_exec_env(mhi_cntl)) {
>> +		pci_err(pci_dev, "Device is not expected to be SBL EE. SOC resetting the device to put it in PBL EE and again trying mhi async power up. Error %d\n",

Will have a look.
