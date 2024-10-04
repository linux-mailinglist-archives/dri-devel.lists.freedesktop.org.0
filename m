Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A72459909F3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 19:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9514C10EA4A;
	Fri,  4 Oct 2024 17:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ECBw0Z6x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0357610EA48
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 17:07:00 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494B3xHJ026679;
 Fri, 4 Oct 2024 17:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qjJBjn1lwvrbWTHKFi5quj/JEB46GL6HjVtx6cCZw8k=; b=ECBw0Z6x55r2tA0U
 ThDRhKup6VcpaYPUyeZV+LuxGX113KWFdl6IWpBtxK2ws7mBMqwy3Q/whPX2a56f
 +6e/9y3IiNU5+ZiqBiS50FGO3XnYCDxKpUDzHOMJXbCvmB1LgWiY1eT407hR1Daa
 bgO/g5tqOo4Wihx91d7tsshP1g2lGOsLy3o3Pc641mHxX0YA/nvnbOqjckz9s7po
 bjbFVd5i+/ZvOhC2HNTgU3PFJV5yEy+rWTHcENL2mE9ntl7a7tHNOD/bFxuKIjks
 ZdGfL6Z9KcV99GPhKGTwQhDgiq7O07TZqR5qRX0H/5V3BAsdcb/UpJzYKAlwbGqh
 t1TV+g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42207v2scq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Oct 2024 17:06:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494H6smm016562
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 4 Oct 2024 17:06:54 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 4 Oct 2024
 10:06:54 -0700
Message-ID: <71e97cd0-f224-7c0e-f1f3-87ca7c3889ce@quicinc.com>
Date: Fri, 4 Oct 2024 11:06:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V3 01/11] accel/amdxdna: Add documentation for AMD NPU
 accelerator driver
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20240911180604.1834434-1-lizhi.hou@amd.com>
 <20240911180604.1834434-2-lizhi.hou@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240911180604.1834434-2-lizhi.hou@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: v3AY9IulofEOkV-lqIdonOigmOfoQJGu
X-Proofpoint-ORIG-GUID: v3AY9IulofEOkV-lqIdonOigmOfoQJGu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011
 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040118
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/11/2024 12:05 PM, Lizhi Hou wrote:
> AMD NPU (Neural Processing Unit) is a multi-user AI inference accelerator
> integrated into AMD client APU. NPU enables efficient execution of Machine
> Learning applications like CNN, LLM, etc. NPU is based on AMD XDNA
> Architecture. NPU is managed by amdxdna driver.
> 
> Co-developed-by: Sonal Santan <sonal.santan@amd.com>
> Signed-off-by: Sonal Santan <sonal.santan@amd.com>
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   Documentation/accel/amdxdna/amdnpu.rst | 283 +++++++++++++++++++++++++
>   Documentation/accel/amdxdna/index.rst  |  11 +
>   Documentation/accel/index.rst          |   1 +
>   3 files changed, 295 insertions(+)
>   create mode 100644 Documentation/accel/amdxdna/amdnpu.rst
>   create mode 100644 Documentation/accel/amdxdna/index.rst
> 
> diff --git a/Documentation/accel/amdxdna/amdnpu.rst b/Documentation/accel/amdxdna/amdnpu.rst
> new file mode 100644
> index 000000000000..2af3bc5b2a9e
> --- /dev/null
> +++ b/Documentation/accel/amdxdna/amdnpu.rst
> @@ -0,0 +1,283 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +.. include:: <isonum.txt>
> +
> +.. SPDX-License-Identifier: GPL-2.0-only

SPDX twice?

> +
> +=========
> + AMD NPU
> +=========
> +
> +:Copyright: |copy| 2024 Advanced Micro Devices, Inc.
> +:Author: Sonal Santan <sonal.santan@amd.com>
> +
> +Overview
> +========
> +
> +AMD NPU (Neural Processing Unit) is a multi-user AI inference accelerator
> +integrated into AMD client APU. NPU enables efficient execution of Machine
> +Learning applications like CNN, LLM, etc. NPU is based on
> +`AMD XDNA Architecture`_. NPU is managed by **amdxdna** driver.
> +
> +
> +Hardware Description
> +====================
> +
> +AMD NPU consists of the following hardware components:
> +
> +AMD XDNA Array
> +--------------
> +
> +AMD XDNA Array comprises of 2D array of compute and memory tiles built with
> +`AMD AI Engine Technology`_. Each column has 4 rows of compute tiles and 1
> +row of memory tile. Each compute tile contains a VLIW processor with its own
> +dedicated program and data memory. The memory tile acts as L2 memory. The 2D
> +array can be partitioned at a column boundary creating a spatially isolated
> +partition which can be bound to a workload context.
> +
> +Each column also has dedicated DMA engines to move data between host DDR and
> +memory tile.
> +
> +AMD Phoenix and AMD Hawk Point client NPU have a 4x5 topology, i.e., 4 rows of
> +compute tiles arranged into 5 columns. AMD Strix Point client APU have 4x8
> +topology, i.e., 4 rows of compute tiles arranged into 8 columns.
> +
> +Shared L2 Memory
> +................

Why a line of "." instead of "-" likse elsewhere?

> +
> +The single row of memory tiles create a pool of software managed on chip L2
> +memory. DMA engines are used to move data between host DDR and memory tiles.
> +AMD Phoenix and AMD Hawk Point NPUs have a total of 2560 KB of L2 memory.
> +AMD Strix Point NPU has a total of 4096 KB of L2 memory.
> +
> +Microcontroller
> +---------------
> +
> +A microcontroller runs NPU Firmware which is responsible for command processing,
> +XDNA Array partition setup, XDNA Array configuration, workload context
> +management and workload orchestration.
> +
> +NPU Firmware uses a dedicated instance of an isolated non-privileged context
> +called ERT to service each workload context. ERT is also used to execute user
> +provided ``ctrlcode`` associated with the workload context.
> +
> +NPU Firmware uses a single isolated privileged context called MERT to service
> +management commands from the amdxdna driver.
> +
> +Mailboxes
> +.........

Again, odd delimiter

> +
> +The microcontroller and amdxdna driver use a privileged channel for management
> +tasks like setting up of contexts, telemetry, query, error handling, setting up
> +user channel, etc. As mentioned before, privileged channel requests are
> +serviced by MERT. The privileged channel is bound to a single mailbox.
> +
> +The microcontroller and amdxdna driver use a dedicated user channel per
> +workload context. The user channel is primarily used for submitting work to
> +the NPU. As mentioned before, a user channel requests are serviced by an
> +instance of ERT. Each user channel is bound to its own dedicated mailbox.
> +
> +PCIe EP
> +-------
> +
> +NPU is visible to the x86 as a PCIe device with multiple BARs and some MSI-X

"to the x86" - feels like something is missing here.  Maybe "x86 host CPU"?

> +interrupt vectors. NPU uses a dedicated high bandwidth SoC level fabric for
> +reading or writing into host memory. Each instance of ERT gets its own dedicated
> +MSI-X interrupt. MERT gets a single instance of MSI-X interrupt.

<snip>

> diff --git a/Documentation/accel/amdxdna/index.rst b/Documentation/accel/amdxdna/index.rst
> new file mode 100644
> index 000000000000..38c16939f1fc
> --- /dev/null
> +++ b/Documentation/accel/amdxdna/index.rst
> @@ -0,0 +1,11 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +=====================================
> + accel/amdxdna NPU driver
> +=====================================
> +
> +The accel/amdxdna driver supports the AMD NPU (Neural Processing Unit).
> +
> +.. toctree::
> +
> +   amdnpu
> diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
> index e94a0160b6a0..0a94b6766263 100644
> --- a/Documentation/accel/index.rst
> +++ b/Documentation/accel/index.rst
> @@ -9,6 +9,7 @@ Compute Accelerators
>   
>      introduction
>      qaic/index
> +   amdxdna/index

I think alphabetical order makes sense to me, considering there probably 
should be more entries added over time. This would suggest that your 
addition should occur one line up. What do you think?

>   
>   .. only::  subproject and html
>   

