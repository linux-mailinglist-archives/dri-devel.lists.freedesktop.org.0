Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8333952233
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 20:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 415EB10E517;
	Wed, 14 Aug 2024 18:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="plSKNrQ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3BF10E515
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 18:49:49 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47ECPpbv016994;
 Wed, 14 Aug 2024 18:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fgV6NQAu+IZkTrrMVMvgaPAmjlIClqViv/QolvnC3tY=; b=plSKNrQ5NuQjaGAY
 Y2cSCdspgF4j+9ZKgtlHO7XRA6gZir+L6SUM9BG/WNBtAF4p//lh/YTwTzbkC2O8
 UA+c0iPHAdPmGnLY1CyILzMUYfF3J+FqhzTNe6LBIgG89+zofcL/3hnCFobeoNAO
 inmvTAt7CSO1Jn7OWTWN+ngj629sviaCZ74N5/MtsbsO4kLw2M/b3aRDfpUlovpm
 gOWNMbkmDVPdC/0HP8b7yKnspZ37nOL+WcDHLO0SJcp/wLlhzM706F9pUgVYeYkR
 mx7W2ISd5wrRmrz8hmtVHKKhbZN809xlGWPmfrklKLBKaPqEyGT/dRU6Rs6/B8ER
 OyYByA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 410kywjgba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Aug 2024 18:49:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47EIngh1019718
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Aug 2024 18:49:42 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 Aug
 2024 11:49:42 -0700
Message-ID: <1aadcb3d-75e2-285c-2244-e472cc21bb97@quicinc.com>
Date: Wed, 14 Aug 2024 12:49:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V2 00/10] AMD XDNA driver
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20240805173959.3181199-1-lizhi.hou@amd.com>
 <292c06d0-b96a-b5b5-5d82-e74b82bbb6de@quicinc.com>
 <d7f757e9-ed6e-7be6-89db-3ec9ddbb8050@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <d7f757e9-ed6e-7be6-89db-3ec9ddbb8050@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: x9ENv_liMRjCz_GPtsSQnbdRY6_QSRRX
X-Proofpoint-GUID: x9ENv_liMRjCz_GPtsSQnbdRY6_QSRRX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_14,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408140128
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

On 8/12/2024 12:16 PM, Lizhi Hou wrote:
> 
> On 8/9/24 08:21, Jeffrey Hugo wrote:
>> On 8/5/2024 11:39 AM, Lizhi Hou wrote:
>>> This patchset introduces a new Linux Kernel Driver, amdxdna for AMD 
>>> NPUs.
>>> The driver is based on Linux accel subsystem.
>>>
>>> NPU (Neural Processing Unit) is an AI inference accelerator integrated
>>> into AMD client CPUs. NPU enables efficient execution of Machine 
>>> Learning
>>> applications like CNNs, LLMs, etc.  NPU is based on AMD XDNA
>>> architecture [1].
>>>
>>> AMD NPU consists of the following components:
>>>
>>>    - Tiled array of AMD AI Engine processors.
>>>    - Micro Controller which runs the NPU Firmware responsible for
>>>      command processing, AIE array configuration, and execution 
>>> management.
>>>    - PCI EP for host control of the NPU device.
>>>    - Interconnect for connecting the NPU components together.
>>>    - SRAM for use by the NPU Firmware.
>>>    - Address translation hardware for protected host memory access by 
>>> the
>>>      NPU.
>>>
>>> NPU supports multiple concurrent fully isolated contexts. Concurrent
>>> contexts may be bound to AI Engine array spatially and or temporarily.
>>>
>>> The driver is licensed under GPL-2.0 except for UAPI header which is
>>> licensed GPL-2.0 WITH Linux-syscall-note.
>>>
>>> User mode driver stack consists of XRT [2] and AMD AIE Plugin for 
>>> IREE [3].
>>
>> Is there a special branch with the code?  I don't see any of the uAPI 
>> in either project when searching for the ioctl codes or ioctl structures.
> 
> Please see git repo: https://github.com/amd/xdna-driver
> 
> This contains the out tree driver and shim code which interact with 
> driver. E.g.
> 
> https://github.com/amd/xdna-driver/blob/main/src/shim/bo.cpp#L18

Ok, I need to have a look at this.  Long term is the plan to move the 
shim to the XRT repo once the driver is merged upstream?

> 
>>
>>>
>>> The firmware for the NPU is distributed as a closed source binary, 
>>> and has
>>> already been pushed to the DRM firmware repository [4].
>>>
>>> [1] https://www.amd.com/en/technologies/xdna.html
>>> [2] https://github.com/Xilinx/XRT
>>> [3] https://github.com/nod-ai/iree-amd-aie
>>> [4] 
>>> https://gitlab.freedesktop.org/drm/firmware/-/tree/amd-ipu-staging/amdnpu 
>>>
>>>
>>> Changes since v1:
>>> - Remove some inline defines
>>> - Minor changes based code review comments
>>>
>>> Lizhi Hou (10):
>>>    accel/amdxdna: Add a new driver for AMD AI Engine
>>>    accel/amdxdna: Support hardware mailbox
>>>    accel/amdxdna: Add hardware resource solver
>>>    accel/amdxdna: Add hardware context
>>>    accel/amdxdna: Add GEM buffer object management
>>>    accel/amdxdna: Add command execution
>>>    accel/amdxdna: Add suspend and resume
>>>    accel/amdxdna: Add error handling
>>>    accel/amdxdna: Add query functions
>>>    accel/amdxdna: Add firmware debug buffer support
>>>
>>>   MAINTAINERS                                   |   9 +
>>>   drivers/accel/Kconfig                         |   1 +
>>>   drivers/accel/Makefile                        |   1 +
>>>   drivers/accel/amdxdna/Kconfig                 |  15 +
>>>   drivers/accel/amdxdna/Makefile                |  22 +
>>>   drivers/accel/amdxdna/TODO                    |   4 +
>>>   drivers/accel/amdxdna/aie2_ctx.c              | 949 ++++++++++++++++++
>>>   drivers/accel/amdxdna/aie2_error.c            | 349 +++++++
>>>   drivers/accel/amdxdna/aie2_message.c          | 775 ++++++++++++++
>>>   drivers/accel/amdxdna/aie2_msg_priv.h         | 372 +++++++
>>>   drivers/accel/amdxdna/aie2_pci.c              | 756 ++++++++++++++
>>>   drivers/accel/amdxdna/aie2_pci.h              | 264 +++++
>>>   drivers/accel/amdxdna/aie2_psp.c              | 137 +++
>>>   drivers/accel/amdxdna/aie2_smu.c              | 112 +++
>>>   drivers/accel/amdxdna/aie2_solver.c           | 329 ++++++
>>>   drivers/accel/amdxdna/aie2_solver.h           | 156 +++
>>>   drivers/accel/amdxdna/amdxdna_ctx.c           | 597 +++++++++++
>>>   drivers/accel/amdxdna/amdxdna_ctx.h           | 165 +++
>>>   drivers/accel/amdxdna/amdxdna_drm.c           | 172 ++++
>>>   drivers/accel/amdxdna/amdxdna_drm.h           | 114 +++
>>>   drivers/accel/amdxdna/amdxdna_gem.c           | 700 +++++++++++++
>>>   drivers/accel/amdxdna/amdxdna_gem.h           |  73 ++
>>>   drivers/accel/amdxdna/amdxdna_mailbox.c       | 582 +++++++++++
>>>   drivers/accel/amdxdna/amdxdna_mailbox.h       | 124 +++
>>>   .../accel/amdxdna/amdxdna_mailbox_helper.c    |  50 +
>>>   .../accel/amdxdna/amdxdna_mailbox_helper.h    |  43 +
>>>   drivers/accel/amdxdna/amdxdna_pci_drv.c       | 234 +++++
>>>   drivers/accel/amdxdna/amdxdna_pci_drv.h       |  31 +
>>>   drivers/accel/amdxdna/amdxdna_sysfs.c         |  58 ++
>>>   drivers/accel/amdxdna/npu1_regs.c             |  94 ++
>>>   drivers/accel/amdxdna/npu2_regs.c             | 111 ++
>>>   drivers/accel/amdxdna/npu4_regs.c             | 111 ++
>>>   drivers/accel/amdxdna/npu5_regs.c             | 111 ++
>>>   include/trace/events/amdxdna.h                | 101 ++
>>>   include/uapi/drm/amdxdna_accel.h              | 456 +++++++++
>>>   35 files changed, 8178 insertions(+)
>>>   create mode 100644 drivers/accel/amdxdna/Kconfig
>>>   create mode 100644 drivers/accel/amdxdna/Makefile
>>>   create mode 100644 drivers/accel/amdxdna/TODO
>>>   create mode 100644 drivers/accel/amdxdna/aie2_ctx.c
>>>   create mode 100644 drivers/accel/amdxdna/aie2_error.c
>>>   create mode 100644 drivers/accel/amdxdna/aie2_message.c
>>>   create mode 100644 drivers/accel/amdxdna/aie2_msg_priv.h
>>>   create mode 100644 drivers/accel/amdxdna/aie2_pci.c
>>>   create mode 100644 drivers/accel/amdxdna/aie2_pci.h
>>>   create mode 100644 drivers/accel/amdxdna/aie2_psp.c
>>>   create mode 100644 drivers/accel/amdxdna/aie2_smu.c
>>>   create mode 100644 drivers/accel/amdxdna/aie2_solver.c
>>>   create mode 100644 drivers/accel/amdxdna/aie2_solver.h
>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_ctx.c
>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_ctx.h
>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_drm.c
>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_drm.h
>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_gem.c
>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_gem.h
>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox.c
>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox.h
>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox_helper.c
>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox_helper.h
>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_pci_drv.c
>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_pci_drv.h
>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_sysfs.c
>>>   create mode 100644 drivers/accel/amdxdna/npu1_regs.c
>>>   create mode 100644 drivers/accel/amdxdna/npu2_regs.c
>>>   create mode 100644 drivers/accel/amdxdna/npu4_regs.c
>>>   create mode 100644 drivers/accel/amdxdna/npu5_regs.c
>>>   create mode 100644 include/trace/events/amdxdna.h
>>>   create mode 100644 include/uapi/drm/amdxdna_accel.h
>>>
>>
>> No Documentation?
> 
> Is it ok to add a work item to TODO and add documentation in later patches?

I beleive best practice would be to add Documnetation in the same 
patch/series that adds the functionality.  I'm not expecting 
Documentation for items not implemented in this series, however I think 
describing the product/architecture/other high level topics would help 
put the code in context during review.

It does seem like the AMD GPU driver had a lot of documentation, which 
makes the lack of documentation for the AMD Accel driver particularly odd.

