Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51354A86359
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 18:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BECB10EC42;
	Fri, 11 Apr 2025 16:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mil10c8x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E443210EC35
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 16:34:44 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BFngtL032515
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 16:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jvva2kE3vYVEBaJ0888Bum0UF9gFfTGvSCYYnphqITg=; b=mil10c8xL+HfNBzP
 GYA6yUcePBV3DXzcJPgKMLr3bNKVTBfWXuCYFQsG5CbDk+IPON0lpjIMC3mGo10X
 cnIatcq2HRpx0XYMIIY33HKg5eyDJH7e0cBr7VmWfDF7YG0nZRH5rPeCTclOUGLV
 GdsCS9gyVyS17Ga1acqm2brjkkQ0oJRwX2riD8z8Xgn29No6TpnmPUlGlUCdFA2M
 0DWfYSVZHpA9gq9FlemApC6G7MW90TLDJhOKvDkaomZQXsW0vU6omPC4UnBnv/B9
 Spqknnh4+44peIBNeB5rWjMlGeg0cDsxT9nJHGasm4iIF132WYRKf8MOyD7sw/p1
 iDEU7g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkttfu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 16:34:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2240a96112fso30686335ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 09:34:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744389282; x=1744994082;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jvva2kE3vYVEBaJ0888Bum0UF9gFfTGvSCYYnphqITg=;
 b=DbiI4De4z2xR7+hUSQPyiQe7yxb+crkXeOAmsuWPzvYSXdeTP2MeBbKYLAU4NL1KpR
 xXt2gT1yt/sDTQm3lYXdUy6qK4H7LItQpSEZc1m4pVeOLUhyz4wkuUAp3tqr69Zk+8/R
 eijS0fDHkjbXwLcVc7zGwTy/T6KUz0gxrAz4oUdVmDMJpUucH0f/H7V+7FR/Q3y77OzB
 V3nvhLjXTWoVjf7mFHPwuNtofXUUeo0mZrwaDPXRprcgPj5pcjnbF3QuAbEc3V1aBoSv
 fLtXN929ZzIGWfpdTQgZ/yrg+yb2On1cb4T2TAJw6IPLwHwapZvC8WHkHHhj1qQvRRIP
 gusg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSuY2s6LShuHiSMoIWyU708cO0cW/7+HzyXlLCmX8oO/SMKK1hvA799kFuiiGhBtZh0MyXGIP2PBg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFE+uNyn8bWG8Qs4iOaQqma8zX8cQ+jbu5DA3CO8Wen2VyfsXi
 UobOQM8p/gu4H6u/xbKHFSPeB+9cM59C/8Ta2kvrcjlCkk/jON7EDL4A5sM8m0pj/7SMQo8Y1cI
 UXpmOllUfftwP/PwDkMKF2KuM2vHbQd0dboc1BCwPqvI49UV10/XeQr5rUa3U+2fiWiE=
X-Gm-Gg: ASbGncuvPjHkxH3ANkXlnOAEV2oxN7gXRr7ParEzBACgIaFwkbn3YOjNypreGHww9Dq
 AJ1reR7sAF7xBeOCir3xtYu5nGB61c8eJRPA8z28Iiuz8Of6zihDrZhY++6ARcmVcTzDAd/eTvK
 SW6uBY3jGFD+i57vkOB5rvMaIoZjx4MY1MwCuyjJ8zLhGptHufLMJmViBL515uc1qxG50MU5Cg/
 8RiaE7t/Ia+40dfsG7gjrjNaobdD78PGP8mfcX2NXKOi38SoT00N8CLNxHbEXgtIwgInJHXj2Li
 +PDq+mD0yShtLOeqKxQ1gyG5wQHZNvNXFaFpZt6SPLLNNsBAWJ5+oYg5OAIN7g==
X-Received: by 2002:a17:903:13d0:b0:216:3c36:69a7 with SMTP id
 d9443c01a7336-22bea50bd92mr52568145ad.45.1744389281657; 
 Fri, 11 Apr 2025 09:34:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjVbhg891hBTEU/fDXSGsCtHr9+7WqQeuL91yoDYRZ8Vj/jNkTHN9KHit1bNNOf3beOPdFtw==
X-Received: by 2002:a17:903:13d0:b0:216:3c36:69a7 with SMTP id
 d9443c01a7336-22bea50bd92mr52567665ad.45.1744389281217; 
 Fri, 11 Apr 2025 09:34:41 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7b8c62dsm51759155ad.95.2025.04.11.09.34.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 09:34:40 -0700 (PDT)
Message-ID: <3260d7de-9e8b-48ee-9d1b-13745e95d933@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 10:34:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] accel/amdpk: add driver for AMD PKI accelerator
To: Nipun Gupta <nipun.gupta@amd.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 krzk+dt@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
 conor+dt@kernel.org, ogabbay@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 derek.kiernan@amd.com, dragan.cvetic@amd.com, arnd@arndb.de
Cc: praveen.jain@amd.com, harpreet.anand@amd.com, nikhil.agarwal@amd.com,
 srivatsa@csail.mit.edu, code@tyhicks.com, ptsm@linux.microsoft.com
References: <20250409173033.2261755-1-nipun.gupta@amd.com>
 <20250409173033.2261755-2-nipun.gupta@amd.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250409173033.2261755-2-nipun.gupta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dt1sC4uC2xbkrtSIVMRW3Zkk1mDmx_bw
X-Proofpoint-ORIG-GUID: dt1sC4uC2xbkrtSIVMRW3Zkk1mDmx_bw
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f944a3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=e5mUnYsNAAAA:8 a=zd2uoN0lAAAA:8
 a=t4VSQj1yoBEbmVwKJQYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110104
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

On 4/9/2025 11:30 AM, Nipun Gupta wrote:
> The AMD PKI accelerator driver provides a accel interface to interact

"an accel"

> with the device for offloading and accelerating asymmetric crypto
> operations.
> 
> Signed-off-by: Nipun Gupta <nipun.gupta@amd.com>
> ---
> 
> Changes RFC->v2:
> - moved from misc to accel
> - added architecture and compile test dependency in Kconfig
> - removed sysfs (and added debugfs in new patch 3/3)
> - fixed platform compat
> - removed redundant resource index 1 configuration (which was there in
>    RFC patch)
> 
>   MAINTAINERS                     |   2 +
>   drivers/accel/Kconfig           |   1 +
>   drivers/accel/Makefile          |   1 +
>   drivers/accel/amdpk/Kconfig     |  18 +
>   drivers/accel/amdpk/Makefile    |   8 +
>   drivers/accel/amdpk/amdpk_drv.c | 736 ++++++++++++++++++++++++++++++++
>   drivers/accel/amdpk/amdpk_drv.h | 271 ++++++++++++
>   include/uapi/drm/amdpk.h        |  49 +++
>   8 files changed, 1086 insertions(+)
>   create mode 100644 drivers/accel/amdpk/Kconfig
>   create mode 100644 drivers/accel/amdpk/Makefile
>   create mode 100644 drivers/accel/amdpk/amdpk_drv.c
>   create mode 100644 drivers/accel/amdpk/amdpk_drv.h
>   create mode 100644 include/uapi/drm/amdpk.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 11f8815daa77..cdc305a206aa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1161,6 +1161,8 @@ L:	dri-devel@lists.freedesktop.org
>   S:	Maintained
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>   F:	Documentation/devicetree/bindings/accel/amd,versal-net-pki.yaml
> +F:	drivers/accel/amdpk/
> +F:	include/uapi/drm/amdpk.h
> 
>   AMD PMC DRIVER
>   M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
> index 5b9490367a39..5632c6c62c15 100644
> --- a/drivers/accel/Kconfig
> +++ b/drivers/accel/Kconfig
> @@ -28,5 +28,6 @@ source "drivers/accel/amdxdna/Kconfig"
>   source "drivers/accel/habanalabs/Kconfig"
>   source "drivers/accel/ivpu/Kconfig"
>   source "drivers/accel/qaic/Kconfig"
> +source "drivers/accel/amdpk/Kconfig"

Alphabetical order

> 
>   endif
> diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
> index a301fb6089d4..caea6d636ac8 100644
> --- a/drivers/accel/Makefile
> +++ b/drivers/accel/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_DRM_ACCEL_AMDXDNA)		+= amdxdna/
>   obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
>   obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
>   obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
> +obj-$(CONFIG_DRM_ACCEL_AMDPK)		+= amdpk/

Alphabetical order

> diff --git a/drivers/accel/amdpk/amdpk_drv.c b/drivers/accel/amdpk/amdpk_drv.c
> new file mode 100644
> index 000000000000..17c328d03db8
> --- /dev/null
> +++ b/drivers/accel/amdpk/amdpk_drv.c
> @@ -0,0 +1,736 @@
> +// SPDX-License-Identifier: GPL-2.0

Deprecated SPDX tag.  Checkpatch will catch this.

> +/*
> + * Copyright (c) 2018-2021 Silex Insight sa
> + * Copyright (c) 2018-2021 Beerten Engineering scs
> + * Copyright (c) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +/*
> + * Device Overview
> + * ===============
> + * AMD PKI accelerator is a device on AMD versal-net to execute public
> + * key asymmetric crypto operations like ECDSA, ECDH, RSA etc. with high
> + * performance. The driver provides accel interface to applications for
> + * configuring the device and performing the required operations. AMD PKI
> + * device comprises of multiple Barco Silex ba414 PKI engines bundled together,
> + * and providing a queue based interface to interact with these devices on AMD
> + * versal-net.
> + *
> + * Following figure provides the brief overview of the device interface with
> + * the software:
> + *
> + * +------------------+
> + * |    Software      |
> + * +------------------+
> + *     |          |
> + *     |          v
> + *     |     +-----------------------------------------------------------+
> + *     |     |                     RAM                                   |
> + *     |     |  +----------------------------+   +---------------------+ |
> + *     |     |  |           RQ pages         |   |       CQ pages      | |
> + *     |     |  | +------------------------+ |   | +-----------------+ | |
> + *     |     |  | |   START (cmd)          | |   | | req_id | status | | |
> + *     |     |  | |   TFRI (addr, sz)---+  | |   | | req_id | status | | |
> + *     |     |  | | +-TFRO (addr, sz)   |  | |   | | ...             | | |
> + *     |     |  | | | NTFY (req_id)     |  | |   | +-----------------+ | |
> + *     |     |  | +-|-------------------|--+ |   |                     | |
> + *     |     |  |   |                   v    |   +---------------------+ |
> + *     |     |  |   |         +-----------+  |                           |
> + *     |     |  |   |         | input     |  |                           |
> + *     |     |  |   |         | data      |  |                           |
> + *     |     |  |   v         +-----------+  |                           |
> + *     |     |  |  +----------------+        |                           |
> + *     |     |  |  |  output data   |        |                           |
> + *     |     |  |  +----------------+        |                           |
> + *     |     |  +----------------------------+                           |
> + *     |     |                                                           |
> + *     |     +-----------------------------------------------------------+
> + *     |
> + *     |
> + * +---|----------------------------------------------------+
> + * |   v                AMD PKI device                      |
> + * |  +-------------------+     +------------------------+  |
> + * |  | New request FIFO  | --> |       PK engines       |  |
> + * |  +-------------------+     +------------------------+  |
> + * +--------------------------------------------------------+
> + *
> + * To perform a crypto operation, the software writes a sequence of descriptors,
> + * into the RQ memory. This includes input data and designated location for the
> + * output data. After preparing the request, request offset (from the RQ memory
> + * region) is written into the NEW_REQUEST register. Request is then stored in a
> + * common hardware FIFO shared among all RQs.
> + *
> + * When a PK engine becomes available, device pops the request from the FIFO and
> + * fetches the descriptors. It DMAs the input data from RQ memory and executes
> + * the necessary computations. After computation is complete, the device writes
> + * output data back to RAM via DMA. Device then writes a new entry in CQ ring
> + * buffer in RAM, indicating completion of the request. Device also generates
> + * an interrupt for notifying completion to the software.
> + */

Feels like this would be better served in Documentation

> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/interrupt.h>
> +#include <linux/delay.h>
> +#include <linux/eventfd.h>
> +#include <drm/drm_accel.h>
> +#include <drm/drm_ioctl.h>

Alphabetical order

> +
> +#include "amdpk_drv.h"
> +
> +#define DRIVER_NAME "amdpk"
> +
> +static void amdpk_init_cq(struct amdpk_dev *pkdev, struct amdpk_cq *cq,
> +			  int szcode, char *base)
> +{
> +	cq->pkdev = pkdev;
> +	cq->generation = 1;
> +	cq->szcode = szcode;
> +	cq->base = (u32 *)base;
> +	cq->tail = 0;
> +}
> +
> +static int amdpk_pop_cq(struct amdpk_cq *cq, int *rid)
> +{
> +	u32 status = CQ_STATUS_VALID;
> +	unsigned int sz;
> +	u32 completion;
> +
> +	completion = cq->base[cq->tail + 1];
> +	if ((completion & CQ_GENERATION_BIT) != cq->generation)
> +		return CQ_STATUS_INVALID;
> +
> +	*rid = (completion >> 16) & 0xffff;
> +	/* read memory barrier: to avoid a race condition, the status field should
> +	 * not be read before the completion generation bit. Otherwise we could
> +	 * get stale outdated status data.
> +	 */

Incorrect comment format.

> +	rmb();

Shouldn't you be using readl()?

> +	status |= cq->base[cq->tail];
> +	/* advance completion queue tail */
> +	cq->tail += 2;
> +	sz = 1 << (cq->szcode - 2);
> +	if (cq->tail >= sz) {
> +		cq->tail = 0;
> +		cq->generation ^= 1; /* invert generation bit */
> +	}
> +
> +	/* evaluate status from the completion queue */
> +	if (completion & CQ_COMPLETION_BIT)
> +		status |= CQ_COMPLETION_ERROR;
> +
> +	return status;
> +}
> +
> +static const struct file_operations amdpk_accel_fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= accel_open,
> +	.release	= drm_release,
> +	.unlocked_ioctl	= drm_ioctl,
> +	.compat_ioctl	= drm_compat_ioctl,
> +	.llseek		= noop_llseek,
> +	.mmap		= amdpk_accel_mmap,
> +};

DEFINE_DRM_ACCEL_FOPS ?

> diff --git a/include/uapi/drm/amdpk.h b/include/uapi/drm/amdpk.h
> new file mode 100644
> index 000000000000..e5e18fdbc2c4
> --- /dev/null
> +++ b/include/uapi/drm/amdpk.h
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef __AMDPK_H__
> +#define __AMDPK_H__
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +#define MAX_PK_REQS		256
> +
> +struct amdpk_info {
> +	/** maximum available queue depth */

This doesn't look like valid kerneldoc

> +	unsigned int avail_qdepth;
> +};

Doesn't look like this handles compat correctly.  Did you read the 
documentation on creating ioctls?

