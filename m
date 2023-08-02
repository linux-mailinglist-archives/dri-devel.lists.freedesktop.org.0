Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA7E76D3E1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 18:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4E910E038;
	Wed,  2 Aug 2023 16:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248A410E038
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 16:40:39 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 372CQApf011234; Wed, 2 Aug 2023 16:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=mg2WHja6ofsTH0l8oE1bTBovcHm3m7oHI3H+MgA2Guk=;
 b=Y2diiDKJTTC2wRovh4NOzAiw2qcn1pjD5aSah0qO8LJ8y86rQiwdcaVivLRqhOoPoXoG
 lHBQLRBL12c0UrH9MGKSdfvhxISqvsQYBKACCzoCBINrA/gHkxTOePcTW8P8Xc/49/Fh
 XmuQN5mOJXlQIroYMXCTzKH3bITFDpEkQQzqg3cqHWSXR+IM4g7NMLLuDlMsYrOuSsAs
 H0sM55AABYtsPdQsSCRrCTzvNxSSfrBMJSLye7KkRweLGVgKVGRWoR/q/j/mZNuIX6Q0
 rV1gwa5n7jc8PbBamx1HY9KihQrtHa/+zJ3rnkEc1AcBy2g5lykl+XCKozu3LBHUl9l2 RQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s75b32y30-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Aug 2023 16:40:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 372GeWVw023545
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 2 Aug 2023 16:40:32 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 2 Aug
 2023 09:40:31 -0700
Message-ID: <e74bf174-897f-c808-2db7-93c891a3b38b@quicinc.com>
Date: Wed, 2 Aug 2023 10:40:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/6] accel/ivpu: Rename sources to use generation based
 names
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230731161258.2987564-1-stanislaw.gruszka@linux.intel.com>
 <20230731161258.2987564-2-stanislaw.gruszka@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230731161258.2987564-2-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: aNeagmTgzSgdZf2PJVcdpdPNlihaS3me
X-Proofpoint-ORIG-GUID: aNeagmTgzSgdZf2PJVcdpdPNlihaS3me
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_12,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308020147
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/31/2023 10:12 AM, Stanislaw Gruszka wrote:
> From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> 
> Given that VPU generation can be used by multiple platforms, driver should
> use VPU IP generation in names instead of a platform names.

I think just "platform." instead of "platform names" reads better.

> 
> Change naming for sources files.
> 
> Use 37XX format, where:
>    3 - major VPU IP generation version
>    7 - minor VPU IP generation version
>    XX - postfix indicating this is a architecture and not marketing name

"an architecture"

> 
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

> ---
>   drivers/accel/ivpu/Makefile                                  | 2 +-
>   drivers/accel/ivpu/{ivpu_hw_mtl.c => ivpu_hw_37xx.c}         | 2 +-
>   drivers/accel/ivpu/{ivpu_hw_mtl_reg.h => ivpu_hw_37xx_reg.h} | 0
>   drivers/accel/ivpu/ivpu_mmu.c                                | 2 +-
>   4 files changed, 3 insertions(+), 3 deletions(-)
>   rename drivers/accel/ivpu/{ivpu_hw_mtl.c => ivpu_hw_37xx.c} (99%)
>   rename drivers/accel/ivpu/{ivpu_hw_mtl_reg.h => ivpu_hw_37xx_reg.h} (100%)
> 
> diff --git a/drivers/accel/ivpu/Makefile b/drivers/accel/ivpu/Makefile
> index 9858d9fea36e..3179e146e173 100644
> --- a/drivers/accel/ivpu/Makefile
> +++ b/drivers/accel/ivpu/Makefile
> @@ -7,7 +7,7 @@ intel_vpu-y := \
>   	ivpu_fw.o \
>   	ivpu_fw_log.o \
>   	ivpu_gem.o \
> -	ivpu_hw_mtl.o \
> +	ivpu_hw_37xx.o \
>   	ivpu_ipc.o \
>   	ivpu_job.o \
>   	ivpu_jsm_msg.o \
> diff --git a/drivers/accel/ivpu/ivpu_hw_mtl.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
> similarity index 99%
> rename from drivers/accel/ivpu/ivpu_hw_mtl.c
> rename to drivers/accel/ivpu/ivpu_hw_37xx.c
> index f1211e74017d..495be81840ac 100644
> --- a/drivers/accel/ivpu/ivpu_hw_mtl.c
> +++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
> @@ -5,7 +5,7 @@
>   
>   #include "ivpu_drv.h"
>   #include "ivpu_fw.h"
> -#include "ivpu_hw_mtl_reg.h"
> +#include "ivpu_hw_37xx_reg.h"
>   #include "ivpu_hw_reg_io.h"
>   #include "ivpu_hw.h"
>   #include "ivpu_ipc.h"
> diff --git a/drivers/accel/ivpu/ivpu_hw_mtl_reg.h b/drivers/accel/ivpu/ivpu_hw_37xx_reg.h
> similarity index 100%
> rename from drivers/accel/ivpu/ivpu_hw_mtl_reg.h
> rename to drivers/accel/ivpu/ivpu_hw_37xx_reg.h
> diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
> index 53878e77aad3..b64eb094343b 100644
> --- a/drivers/accel/ivpu/ivpu_mmu.c
> +++ b/drivers/accel/ivpu/ivpu_mmu.c
> @@ -7,7 +7,7 @@
>   #include <linux/highmem.h>
>   
>   #include "ivpu_drv.h"
> -#include "ivpu_hw_mtl_reg.h"
> +#include "ivpu_hw_37xx_reg.h"
>   #include "ivpu_hw_reg_io.h"
>   #include "ivpu_mmu.h"
>   #include "ivpu_mmu_context.h"

