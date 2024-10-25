Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD4E9B123C
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 00:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2AE810EB94;
	Fri, 25 Oct 2024 22:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="mneKf7nz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 691BD10EB94
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 22:02:22 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PBaxLZ003726;
 Fri, 25 Oct 2024 22:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 unqZyCgNu9y3JNL4D+vF9Du7quIUHjBrUhkFlZeyWc4=; b=mneKf7nzD3bc2UoU
 Ps4RPfTPeFtqBo17RUi0clIKsJDXAzfM8qTM5VlX5Y15x8GtdgcCRJtXjN69uK9E
 zLbS9hzkDpyc4kBHR4RV2MNR3Ln8DmAMcPj7NayWHHUmfCJMJ1AqQ6nUUYbzT3Ej
 2lXL9KOL6vp985Y+wBscnKjYSRXc9FCKoVmt5lqR/N4yxiM++Pj7+/9wEKxnH1gK
 zg5/koF0YW2AUes8+fng8GsdRr2iJ5+vdPfOkFp8jGD46OdzFdnwzbLE9q8cBnUM
 o3o+SdD8o+3GX3cTBnrUm22Kv3zkZbHsvUdOFdQONnZMLDfUDpaFTIYvVPTwzXkp
 Ww/OaQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em68ae1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Oct 2024 22:02:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PM2EP5016597
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Oct 2024 22:02:14 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 15:02:14 -0700
Message-ID: <49b76568-572d-b3ef-da79-36f1a3c44f27@quicinc.com>
Date: Fri, 25 Oct 2024 16:02:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V5 00/10] AMD XDNA driver
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20241021161931.3701754-1-lizhi.hou@amd.com>
 <de895a18-e40f-4996-b799-0a957bd3ca48@quicinc.com>
 <28047f7a-ee20-0b5b-5bdc-5dea8e0bd412@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <28047f7a-ee20-0b5b-5bdc-5dea8e0bd412@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: JADy4uNBJqIGLIjebYbAyP7zIQoDOOCO
X-Proofpoint-GUID: JADy4uNBJqIGLIjebYbAyP7zIQoDOOCO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250170
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

On 10/25/2024 3:28 PM, Lizhi Hou wrote:
> 
> On 10/25/24 10:55, Jeffrey Hugo wrote:
>> On 10/21/2024 10:19 AM, Lizhi Hou wrote:
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
>>>
>>> The firmware for the NPU is distributed as a closed source binary, 
>>> and has
>>> already been pushed to the DRM firmware repository [4].
>>>
>>> [1]https://www.amd.com/en/technologies/xdna.html
>>> [2]https://github.com/Xilinx/XRT
>>> [3]https://github.com/nod-ai/iree-amd-aie
>>> [4]https://gitlab.freedesktop.org/drm/firmware/-/tree/amd-ipu-staging/amdnpu 
>>>
>>>
>>> Changes since v4:
>>> - Fix lockdep errors
>>> - Use __u* structure for struct aie_error
>>
>> One nit, when you send the next version would you please either To: or 
>> Cc: me on the entire series?  I only get pieces in my inbox which is 
>> mildly annoying on my end.
> Sure.
>>
>> Looks like we are getting close here.  One procedural question I have, 
>> do you have commit permissions to drm-misc?
> No, I do not have commit permissions yet.

You should apply for access.  Assuming this series is ready before that 
goes through, I'll apply it.

>> I applied the series to drm-misc-next and tried to build.  Got the 
>> following errors -
> 
> Could you share the build command line? So I can reproduce and verify my 
> fix.

The command is simple:
make -j20

The system details, incase it somehow matters:
Ubuntu 22.04 w/ 5.15 kernel

$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 22.04.3 LTS
Release:        22.04
Codename:       jammy

$ uname -a
Linux jhugo-lnx 5.15.0-89-generic #99-Ubuntu SMP Mon Oct 30 20:42:41 UTC 
2023 x86_64 x86_64 x86_64 GNU/Linux

The kernel config is probably the relevant piece.  When I first built 
after applying the series, I was asked to choose what to do with the new 
config item.  I selected =m.
.config can be found at 
https://gist.github.com/quic-jhugo/4cc249b1e3ba127039fbc709a513a432

> 
> I used "make M=drivers/accel/amdxdna" and did not reproduce the error 
> with drm-misc-next. It looks build robot did not complain with the patch 
> neither.
> 
> $ git branch
> * drm-misc-next
> $ make M=drivers/accel/amdxdna
>    CC [M]  drivers/accel/amdxdna/aie2_ctx.o
>    CC [M]  drivers/accel/amdxdna/aie2_error.o
>    CC [M]  drivers/accel/amdxdna/aie2_message.o
>    CC [M]  drivers/accel/amdxdna/aie2_pci.o
>    CC [M]  drivers/accel/amdxdna/aie2_psp.o
>    CC [M]  drivers/accel/amdxdna/aie2_smu.o
>    CC [M]  drivers/accel/amdxdna/aie2_solver.o
>    CC [M]  drivers/accel/amdxdna/amdxdna_ctx.o
>    CC [M]  drivers/accel/amdxdna/amdxdna_gem.o
>    CC [M]  drivers/accel/amdxdna/amdxdna_mailbox.o
>    CC [M]  drivers/accel/amdxdna/amdxdna_mailbox_helper.o
>    CC [M]  drivers/accel/amdxdna/amdxdna_pci_drv.o
>    CC [M]  drivers/accel/amdxdna/amdxdna_sysfs.o
>    CC [M]  drivers/accel/amdxdna/npu1_regs.o
>    CC [M]  drivers/accel/amdxdna/npu2_regs.o
>    CC [M]  drivers/accel/amdxdna/npu4_regs.o
>    CC [M]  drivers/accel/amdxdna/npu5_regs.o
>    LD [M]  drivers/accel/amdxdna/amdxdna.o
>    MODPOST drivers/accel/amdxdna/Module.symvers
>    CC [M]  drivers/accel/amdxdna/amdxdna.mod.o
>    CC [M]  drivers/accel/amdxdna/.module-common.o
>    LD [M]  drivers/accel/amdxdna/amdxdna.ko
> $
> 
>>
>>   CC [M]  drivers/accel/amdxdna/aie2_ctx.o
>>   CC [M]  drivers/accel/amdxdna/aie2_error.o
>>   CC [M]  drivers/accel/amdxdna/aie2_message.o
>>   CC [M]  drivers/accel/amdxdna/aie2_pci.o
>>   CC [M]  drivers/accel/amdxdna/aie2_psp.o
>>   CC [M]  drivers/accel/amdxdna/aie2_smu.o
>>   CC [M]  drivers/accel/amdxdna/aie2_solver.o
>>   CC [M]  drivers/accel/amdxdna/amdxdna_ctx.o
>>   CC [M]  drivers/accel/amdxdna/amdxdna_gem.o
>>   CC [M]  drivers/accel/amdxdna/amdxdna_mailbox.o
>>   CC [M]  drivers/accel/amdxdna/amdxdna_mailbox_helper.o
>>   CC [M]  drivers/accel/amdxdna/amdxdna_pci_drv.o
>>   CC [M]  drivers/accel/amdxdna/amdxdna_sysfs.o
>>   CC [M]  drivers/accel/amdxdna/npu1_regs.o
>>   CC [M]  drivers/accel/amdxdna/npu2_regs.o
>>   CC [M]  drivers/accel/amdxdna/npu4_regs.o
>>   CC [M]  drivers/accel/amdxdna/npu5_regs.o
>>   AR      drivers/base/firmware_loader/built-in.a
>>   AR      drivers/base/built-in.a
>> In file included from drivers/accel/amdxdna/aie2_message.c:19:
>> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_get_op’:
>> drivers/accel/amdxdna/amdxdna_ctx.h:112:16: error: implicit 
>> declaration of function ‘FIELD_GET’ 
>> [-Werror=implicit-function-declaration]
>>   112 |         return FIELD_GET(AMDXDNA_CMD_OPCODE, cmd->header);
>>       |                ^~~~~~~~~
>> In file included from drivers/accel/amdxdna/amdxdna_gem.c:15:
>> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_get_op’:
>> drivers/accel/amdxdna/amdxdna_ctx.h:112:16: error: implicit 
>> declaration of function ‘FIELD_GET’ 
>> [-Werror=implicit-function-declaration]
>>   112 |         return FIELD_GET(AMDXDNA_CMD_OPCODE, cmd->header);
>>       |                ^~~~~~~~~
>> In file included from drivers/accel/amdxdna/aie2_psp.c:11:
>> drivers/accel/amdxdna/aie2_psp.c: In function ‘psp_exec’:
>> drivers/accel/amdxdna/aie2_psp.c:62:34: error: implicit declaration of 
>> function ‘FIELD_GET’ [-Werror=implicit-function-declaration]
>>    62 | FIELD_GET(PSP_STATUS_READY, ready),
>>       |                                  ^~~~~~~~~
>> ./include/linux/iopoll.h:47:21: note: in definition of macro 
>> ‘read_poll_timeout’
>>    47 |                 if (cond) \
>>       |                     ^~~~
>> drivers/accel/amdxdna/aie2_psp.c:61:15: note: in expansion of macro 
>> ‘readx_poll_timeout’
>>    61 |         ret = readx_poll_timeout(readl, PSP_REG(psp, 
>> PSP_STATUS_REG), ready,
>>       |               ^~~~~~~~~~~~~~~~~~
>> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_set_state’:
>> drivers/accel/amdxdna/amdxdna_ctx.h:121:24: error: implicit 
>> declaration of function ‘FIELD_PREP’ 
>> [-Werror=implicit-function-declaration]
>>   121 |         cmd->header |= FIELD_PREP(AMDXDNA_CMD_STATE, s);
>>       |                        ^~~~~~~~~~
>> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_set_state’:
>> drivers/accel/amdxdna/amdxdna_ctx.h:121:24: error: implicit 
>> declaration of function ‘FIELD_PREP’ 
>> [-Werror=implicit-function-declaration]
>>   121 |         cmd->header |= FIELD_PREP(AMDXDNA_CMD_STATE, s);
>>       |                        ^~~~~~~~~~
>> In file included from drivers/accel/amdxdna/aie2_pci.c:22:
>> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_get_op’:
>> drivers/accel/amdxdna/amdxdna_ctx.h:112:16: error: implicit 
>> declaration of function ‘FIELD_GET’ 
>> [-Werror=implicit-function-declaration]
>>   112 |         return FIELD_GET(AMDXDNA_CMD_OPCODE, cmd->header);
>>       |                ^~~~~~~~~
>> In file included from drivers/accel/amdxdna/aie2_ctx.c:18:
>> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_get_op’:
>> drivers/accel/amdxdna/amdxdna_ctx.h:112:16: error: implicit 
>> declaration of function ‘FIELD_GET’ 
>> [-Werror=implicit-function-declaration]
>>   112 |         return FIELD_GET(AMDXDNA_CMD_OPCODE, cmd->header);
>>       |                ^~~~~~~~~
>> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_set_state’:
>> drivers/accel/amdxdna/amdxdna_ctx.h:121:24: error: implicit 
>> declaration of function ‘FIELD_PREP’ 
>> [-Werror=implicit-function-declaration]
>>   121 |         cmd->header |= FIELD_PREP(AMDXDNA_CMD_STATE, s);
>>       |                        ^~~~~~~~~~
>> In file included from drivers/accel/amdxdna/amdxdna_ctx.c:16:
>> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_get_op’:
>> drivers/accel/amdxdna/amdxdna_ctx.h:112:16: error: implicit 
>> declaration of function ‘FIELD_GET’ 
>> [-Werror=implicit-function-declaration]
>>   112 |         return FIELD_GET(AMDXDNA_CMD_OPCODE, cmd->header);
>>       |                ^~~~~~~~~
>> cc1: all warnings being treated as errors
>> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_set_state’:
>> drivers/accel/amdxdna/amdxdna_ctx.h:121:24: error: implicit 
>> declaration of function ‘FIELD_PREP’ 
>> [-Werror=implicit-function-declaration]
>>   121 |         cmd->header |= FIELD_PREP(AMDXDNA_CMD_STATE, s);
>>       |                        ^~~~~~~~~~
>> drivers/accel/amdxdna/aie2_ctx.c: In function ‘aie2_hwctx_restart’:
>> drivers/accel/amdxdna/aie2_ctx.c:114:9: error: too few arguments to 
>> function ‘drm_sched_start’
>>   114 |         drm_sched_start(&hwctx->priv->sched);
>>       |         ^~~~~~~~~~~~~~~
>> In file included from ./include/trace/events/amdxdna.h:12,
>>                  from drivers/accel/amdxdna/aie2_ctx.c:13:
>> ./include/drm/gpu_scheduler.h:593:6: note: declared here
>>   593 | void drm_sched_start(struct drm_gpu_scheduler *sched, int errno);
>>       |      ^~~~~~~~~~~~~~~
>> make[5]: *** [scripts/Makefile.build:229: 
>> drivers/accel/amdxdna/aie2_psp.o] Error 1
>> make[5]: *** Waiting for unfinished jobs....
>> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_set_state’:
>> drivers/accel/amdxdna/amdxdna_ctx.h:121:24: error: implicit 
>> declaration of function ‘FIELD_PREP’ 
>> [-Werror=implicit-function-declaration]
>>   121 |         cmd->header |= FIELD_PREP(AMDXDNA_CMD_STATE, s);
>>       |                        ^~~~~~~~~~
>> In file included from drivers/accel/amdxdna/amdxdna_pci_drv.c:18:
>> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_get_op’:
>> drivers/accel/amdxdna/amdxdna_ctx.h:112:16: error: implicit 
>> declaration of function ‘FIELD_GET’ 
>> [-Werror=implicit-function-declaration]
>>   112 |         return FIELD_GET(AMDXDNA_CMD_OPCODE, cmd->header);
>>       |                ^~~~~~~~~
>> cc1: all warnings being treated as errors
>> make[5]: *** [scripts/Makefile.build:229: 
>> drivers/accel/amdxdna/aie2_ctx.o] Error 1
>> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_set_state’:
>> drivers/accel/amdxdna/amdxdna_ctx.h:121:24: error: implicit 
>> declaration of function ‘FIELD_PREP’ 
>> [-Werror=implicit-function-declaration]
>>   121 |         cmd->header |= FIELD_PREP(AMDXDNA_CMD_STATE, s);
>>       |                        ^~~~~~~~~~
>> drivers/accel/amdxdna/amdxdna_mailbox.c: In function 
>> ‘xdna_mailbox_send_msg’:
>> drivers/accel/amdxdna/amdxdna_mailbox.c:444:26: error: implicit 
>> declaration of function ‘FIELD_PREP’ 
>> [-Werror=implicit-function-declaration]
>>   444 |         header->sz_ver = FIELD_PREP(MSG_BODY_SZ, 
>> msg->send_size) |
>>       |                          ^~~~~~~~~~
>>
>>
>> You also have the following checkpatch issues -
> 
> Could you share the command you used?  I tried to use 'dim checkpatch' 
> and it did not find out the misspelling issue.

./scripts/checkpatch.pl --strict --codespell *.patch

Note, --codespell requires some local setup.  I beleive the comments in 
the checkpatch.pl script are fairly straightforward.  I use a copy of 
the database from the github that is rather recent.  The Ubuntu distro 
package is really out of date and I don't think I looked to see if there 
is a pythong pip version.  Grabbing the one file from the github repo 
seemed simple emough.

-Jeff
