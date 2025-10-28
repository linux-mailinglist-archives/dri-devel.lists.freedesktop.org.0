Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC77C16CE3
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 21:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B3210E128;
	Tue, 28 Oct 2025 20:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oAqeAVnG";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NWw/uozZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA63B10E128
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 20:39:09 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlSam2616118
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 20:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4PBeAoboq9UeaJ4TKCXDk+7vPZjcuQg/yJtVUFLA2u4=; b=oAqeAVnGEy6xWI47
 /VUThAOpL6bmU5eIa913LpTkx6u+H9ozsZ8hLzAKAgDwbG30xxZM/kFg0bwKmdOX
 nIy7HEwzYhQvp5hn84feeXlJBgIVL8jLo3hiMQ/CxyJumy//1fpJSOGsMBovkvc6
 OH5hXhdTpBCKhShlP2n0ew3g1/J4HUNOubF7RyAUTVjq92PtLbv2/As7LVqprz8L
 /GrgmhjijUfeBZ9WwkunXInQ8dUu+vcJgr6EIsp4WGsEqGTsER/3IQJ5fOHjWUuW
 u7X3XtwRlwgrBvlL99pd1mraGasWVqzq9OhEPcxChSDgAuE31iV2KH/cgNaZgSRH
 KvOAyQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a0g3y8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 20:39:08 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7a27ab05999so4124770b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 13:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761683948; x=1762288748;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4PBeAoboq9UeaJ4TKCXDk+7vPZjcuQg/yJtVUFLA2u4=;
 b=NWw/uozZYDSGWlXPjjJ+pwvEBVvCvKG73/gDXgWn/uuOVyp2JA00RyhJw4q7+pvuCY
 FHFQ+dx23yrmV2+GySy+UhNKTSvfDPemfcHS87PMKbLXSg7HaxXF0cxXZmjzFsV+VJPH
 +0fcpNoEzG46AUGkCVPkeif+ADX3aLCvYhn3hLSbWDtD01wbBUzO62vWbcI2RxdnpR2F
 9qQ7YoDmFnG6zb8wb0XyLy7zJb5E66CNmplB9/+R/HpcpI1vP4ShO3EcwHtXt4Rpy8Oe
 MtNeFmSxpPQKqmEbH5FZOF10Q5HY86V4psixWo3w5uTSzN99AjMHDordN8HR5HBv3LyD
 gDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761683948; x=1762288748;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4PBeAoboq9UeaJ4TKCXDk+7vPZjcuQg/yJtVUFLA2u4=;
 b=jwtl2QMf+0H8nKBCozwQb65UTmHhIbV+kGQgcliINxFZdxdFy0aA8MU9VGyoNLqYPR
 KQrl+HwD9Oh/ylYZhicFoXco0jvatDtemBJC2/pbrlSLLirkVV1pG0Q0Iv4ESnHhSw2w
 CUOLxx3pN0mrBqo9StZAEk/RBnoI91RXc2mhdoG7wCABrKavCpuXVXYas2Huc6XUvD3o
 V/5zKj/iDGy6fiZz2BxEWUFZJhkNNOSFBhy1aDIc4Wbhj7ymZVOErWObWcg+H2sPdkaK
 kgTj87WVrXPIn5nJAcm2NWaxhLHLJ+jtfvR6zqUv5L9VL9pNvJs4KP4k3HY3I/Fd4UdQ
 DauQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMH0EZYg8nBWjrvUbm3aR8fzRpN5yl4iVi3YiDtFuE9CoYjUWu5As3NrUrXI/O0hjwztMFLbrqvRw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfKB4CzGEwTyWHjnCxVK5Np0/jxCdei49s/wcdClJEP2pHOzSM
 9/N9FwB8m2o4ZRGFiP7NfT55cyIjh7GwBs/mD68HII+0JxtsrgVLsLbGfzxgKq2BZwjAh31QpFq
 01Eyn4+WeLJ+l5eTkV3m9WBjvlC3+a5ziRb4JFGFb1NIncodgCKxZTO9OvNzuN9m9yDnsB/U=
X-Gm-Gg: ASbGncv7ZaCrwscYpGrm+OIKxPSm0dJ5BG5PCgvwqQ8iArlGFDjILa31/+qQCnWJGfk
 j9E1xFaMdgJckgvZbW4ceE7R9/KwQ/MXVSX4Vm0hTZqtjoFD8gJmxhKBVEgmJdjcirlTGB/zQ2s
 wbWpaxNTnvwxjB+pUAde/fOSwHFo4czXs9jmstb2Rt7163g1GXX54qxXi2Qswpu41+40aZ95cqR
 1baJ1YsTPTu4+CYZws9dPCqLmmpGlGi8hDoC+axZaNv+U61SdlK4Z/u9AtHoRlJgJ7ArThVm/4m
 4RIzZMFbl6ztGpPpTnlCvgsbSsDvydq4R7kfCNb5c1+sQNOiAMUfZP8GdJprQrbBRhPhVSpFCrj
 sVt01hDUMoV+zbnTfh4FHFCLl9uEmXl+U1Y54SzK79pOqjS0/5yt7
X-Received: by 2002:a05:6a20:12c9:b0:340:fce2:a152 with SMTP id
 adf61e73a8af0-34653e276bfmr392753637.55.1761683947668; 
 Tue, 28 Oct 2025 13:39:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGG9pjjJFU5TgOTjqaMB/ulvnETMuGQ2QAkJ78A8X9VmkGLrNzq9jWZufiAfTv1VlFMsmZodw==
X-Received: by 2002:a05:6a20:12c9:b0:340:fce2:a152 with SMTP id
 adf61e73a8af0-34653e276bfmr392722637.55.1761683947164; 
 Tue, 28 Oct 2025 13:39:07 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a41408ef94sm12656167b3a.68.2025.10.28.13.39.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 13:39:06 -0700 (PDT)
Message-ID: <e18e73eb-79f8-4e23-9223-6a5ddbfe77ae@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 14:39:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Add support for userptr buffer objects
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
References: <20251028070624.135142-1-karol.wachowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251028070624.135142-1-karol.wachowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HvZ72kTS c=1 sm=1 tr=0 ts=690129ec cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=on8cqEdgRNrYzwZKkhAA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 4QRWZruG9is6x-MbQcHgRNlqcISd_U40
X-Proofpoint-ORIG-GUID: 4QRWZruG9is6x-MbQcHgRNlqcISd_U40
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE3NCBTYWx0ZWRfX3npRBzif0LCG
 izro9JJdvrHNli21NpwyZGm+x6SfWY1mt8s9G4n7nAOe9Kzw8FrDT0cYM9VUdBh+v6HSFlO3sD3
 IYH1OHIiOHbOJFHEsqrqIKX2q0jceDituZUDh4wKWjY2l0UzZzQlSyf2Dw+PtjwSKJcPhHqN9sJ
 bCzsZE6gS7c9zmIJes7KLpDa+/lp+UvU9POW0cdG3H1elaJJh3g/8ugnyJbpQ5BqRHAbo6wOidl
 y/b+geCif6qPNdF/ysLnHYZsQMh6HmqBEL0wY7I4Wr2KCdt7dbJDCEL4goxTU2JHV1KVXwGjbvb
 Ii3tExbBhcVXbai2m04WNyCD8gYrGi7qiOc28fL6CblRsIoBW53uzklCnJOWF8NjFoeSbLC8YhQ
 /oQi+RgJJnTHk4BOZEDsEoNoKgh55A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280174
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

On 10/28/2025 1:06 AM, Karol Wachowski wrote:
> From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> 
> Add support for creating buffer objects from user pointers
> in the Intel NPU driver.

This feels redundant. $SUBJECT already mentions adding the support, and 
in the Intel NPU driver is a given.

> Introduce a new ioctl `drm_ivpu_bo_create_from_userptr` that allows
> users to create a GEM buffer object from a user pointer to a memory region.
> The user pointer must be page-aligned and the memory region must remain
> valid for the lifetime of the buffer object.

This seems good, but perhaps incomplete. Why do this? What benifit would 
this new IOCTL give the user? Increases performance when the user has a 
specific usecase?

> diff --git a/drivers/accel/ivpu/ivpu_gem_userptr.c b/drivers/accel/ivpu/ivpu_gem_userptr.c
> new file mode 100644
> index 000000000000..c5b64e0f2b13
> --- /dev/null
> +++ b/drivers/accel/ivpu/ivpu_gem_userptr.c
> @@ -0,0 +1,207 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2020-2025 Intel Corporation
> + */
> +
> +#include <linux/dma-buf.h>
> +#include <linux/err.h>
> +#include <linux/highmem.h>
> +#include <linux/mm.h>
> +#include <linux/mman.h>
> +#include <linux/scatterlist.h>
> +#include <linux/slab.h>
> +#include <linux/capability.h>
> +
> +#include <drm/drm_device.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_gem.h>
> +
> +#include "ivpu_drv.h"
> +#include "ivpu_gem.h"
> +
> +#define IVPU_BO_USERPTR_MAX_SIZE (4ULL * SZ_1G)

Is this not the same as SZ_4G?

> +/**
> + * struct drm_ivpu_bo_create_from_userptr - Create dma-buf from user pointer
> + *
> + * Create a GEM buffer object from a user pointer to a memory region.
> + */
> +struct drm_ivpu_bo_create_from_userptr {
> +	/** @user_ptr: User pointer to memory region (must be page aligned) */
> +	__u64 user_ptr;
> +
> +	/** @size: Size of the memory region in bytes (must be page aligned) */

Mention max size?

> +	__u64 size;
> +
> +	/**
> +	 * @flags:
> +	 *
> +	 * Supported flags:
> +	 *
> +	 * %DRM_IVPU_BO_HIGH_MEM:
> +	 *
> +	 * Allocate VPU address from >4GB range.
> +	 *
> +	 * %DRM_IVPU_BO_DMA_MEM:
> +	 *
> +	 * Allocate from DMA memory range accessible by hardware DMA.
> +	 *
> +	 * %DRM_IVPU_BO_READ_ONLY:
> +	 *
> +	 * Allocate as a read-only buffer object.
> +	 */
> +	__u32 flags;
> +
> +	/** @handle: Returned GEM object handle */
> +	__u32 handle;
> +
> +	/** @vpu_addr: Returned VPU virtual address */
> +	__u64 vpu_addr;
> +};
> +
>   /**
>    * struct drm_ivpu_bo_info - Query buffer object info
>    */

