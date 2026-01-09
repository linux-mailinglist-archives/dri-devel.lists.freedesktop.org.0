Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59238D0A717
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 14:36:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87CA10E8CC;
	Fri,  9 Jan 2026 13:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKTRAGkn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KNhWFyf7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A48F10E8CC
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 13:36:23 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6099XjxK1048558
 for <dri-devel@lists.freedesktop.org>; Fri, 9 Jan 2026 13:36:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=tFI5rqxjD8ECVsoRgmhbfh35
 9hI+y+aqdH5nS72dQVw=; b=kKTRAGknM5Z86RKsrslx2EMzWkEQdYcMhy+z4PJJ
 t2x4bOXstE0YdQQhCeNsFlyHWQHA5rz57LX+fTAcWUt7aCZVtR1pH2V54m3zhtSI
 W96DfYMU2zLdIX/hCOcdzeFMlCe1P8VeBR437y3GC+//yICP1nvyCgBxRfr7x9Yj
 WkILsAVEISXQhA5hFiIIdN7eyYyUNYSw//QpnPF4u9VEihGUqHqZMLzbq7KAhidp
 yQjtVmMvj/PdGlsVmI303jC5LbHKVZAzFTxJOHcfmRtuCtQ7g17Cw+RgKwJXxQXd
 +z6z55LDQ1rdWU4ip64VWmux5QFdWxs/aSW5BKqti9j4SQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjy5b8mt9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 13:36:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-34c64cd48a8so5424536a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 05:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767965781; x=1768570581;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tFI5rqxjD8ECVsoRgmhbfh359hI+y+aqdH5nS72dQVw=;
 b=KNhWFyf7zPFBSP5A6wCcFsoOIbMTcGzRsvJSTISyhHjvyiJJDdACPIUpWlE0eEVEgk
 iQUJrFOwFTYUlBHWKcmfGTHSuWHPLRAl7XdhVEd8+Jcn3sRlkpqlBxrOTiLAast5hnd0
 yxHkmfrQQALEVUIBAbSQkwERZQkArOaaQ9S+j9L3zjRTE43sRdaZu/p3C6CxjcObb725
 6IzFZwhwaDQvpLo67gCi3fbV+pIgz5WTIT5rWYwheW2PQOVt2WBLsDUa+DCExD5KEjvn
 3KWJALVQcQL9KYjzSevFWpepqbu1ZuzRu/M3XepuxnTcV71EZg2/neoTG6zvOq8/wrgi
 QTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767965781; x=1768570581;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tFI5rqxjD8ECVsoRgmhbfh359hI+y+aqdH5nS72dQVw=;
 b=aDGszw9nUbacjg7QduuYSZIcMMP9ZmbguM4MyVF2bmjtS3KSHL2H4jZVvntp/q0Uy4
 REEWyYq+hdB4CS3ALnP3fRSnATMG1nOlcXYVXBUSQFJW0mGXbsNYsg26y+QJFWlrX88k
 fHalmpm1nacY0Vo9O6Q3CSHlogPshKopZOC9r1v/h0bZHQuof6Hm5nY4ct9ixFjRPmVu
 wl8ZeHK2zSr+WlVMQ1F9CuGn50TY6CJI1Ft/nnTzRTtg5NfnQ/9TjsqRqN9R8fwBbaO6
 oOzTmkiPEKUWEj++u9HbBauZceyQAxoXBO3Rknl6K6Q3clY4FzL+jNsjG3QAPl4byAKG
 8axw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+bKygiB7VR7EM2eBfp5lYG1ohqWErMO0nfKPDYFl0D+bcqK7wYTrMXaF+f2ypNr2a5hfRGnQfLdU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNnpwJohrhLXNQun2ikXDF8gbidKZuAImZZKpBeJ5yL0N6koYh
 geZXwIryJ4eTCQ/xvjFIKGjM6ITXdnzii7LUiZ4S9901GuXF3tcuCz5vTyliEBpzYdzZWv+fRZY
 SygsTDVkKRBelDaFCaUElsVCOdy88Gpos2YE5rm47pDfkaLX8ghQgxnra88FJPfQ5McLlB4Owfq
 wIoZo=
X-Gm-Gg: AY/fxX58ub1Xk/aeKspnfH+jDsd4rdQnEzMTZRSiB0LXzGj06sp02c0zf3gPZnmdbL4
 L37u64StnIf58TM8K+hVsLWGEJvMPLFN4/awj20Lwbj5aRQE9sCHk9m7VOYIAf8zSRrRpyO+2Nw
 pPSO3xNDRT4gS4M2n8elEdk70z2O2okZ9b+A5IoxhGbz09FHac1OWFG7GwBpqzU7F5wBezRb6th
 O/dj2U4WVqU4VKAkhQFFUbrtPOR0CkzYQ4BSKF6QhnKVmRIeQY1jpdBDCeSFod5nJEYNxs59r3t
 1YYuGPp1aDxONHBYqeJhH0+Sa0nXbGo09V2zxM/0FlE/FIESAjC10kVfcGO6JXRfeo68MIIVU1X
 jgN6uzyu5jG/WyvT5CYKjnm5Zxu8jNMuS55pZ
X-Received: by 2002:a17:90b:5846:b0:34c:6d33:7d34 with SMTP id
 98e67ed59e1d1-34f68c20417mr10587619a91.16.1767965780775; 
 Fri, 09 Jan 2026 05:36:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJDknTE5Bozkb0FN396jmB8DNOX6wrkFzMoPqZ/bvK1YQN+b9N3PFhcDMCaoXQMId4ncQGFg==
X-Received: by 2002:a17:90b:5846:b0:34c:6d33:7d34 with SMTP id
 98e67ed59e1d1-34f68c20417mr10587567a91.16.1767965779984; 
 Fri, 09 Jan 2026 05:36:19 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34f5f84ef1dsm10845911a91.0.2026.01.09.05.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 05:36:19 -0800 (PST)
Date: Fri, 9 Jan 2026 19:06:12 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] soc: qcom: smem: Expose DDR data from SMEM
Message-ID: <20260109133612.ommcoivkbhbisp6o@hu-mojha-hyd.qualcomm.com>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-1-6b64df58a017@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-topic-smem_dramc-v3-1-6b64df58a017@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9n-9THV2WPn0Q4S_XS89u-vP_YptziA7
X-Authority-Analysis: v=2.4 cv=JP42csKb c=1 sm=1 tr=0 ts=69610456 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=qP6zmmjdO5xXDVAk0ngA:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEwMSBTYWx0ZWRfXydLT3qYWhocW
 fjwdwp9zqXWzmvJRC3wd7ehrxcARUVkQwN/vVwU7kVB73rNHiFzzYUcXiBlyFMO7PmEQ4CAgmY+
 0+Tssh4uHJxABiLiJr6FKhGXdKzP1WAUyyOEQ96+AcYJBJH420MJWqeY0WQhuzkJvqbxanz9mRE
 WIr4sBQARG/OdChKeCsrxACIzX+ansJ57k+2uROBVH7m++Lnbgk7PAy0yke1FJxvTONBxfVwL2O
 2VZVlcu9i3sl/bfiC+xkwaysrAv9mYw9QVtA0sFpSKAQhiDtFWCoWdRl5JPVgsRQ4H286HntZQ6
 saBP28UjXL5QEEXgLaKJ3YtIxfqpBbTP33bRF7ccV3/mbh6RDJO0oscnaw11PYUZppUmoUOjZ7G
 wkxs3znSH779OQ5UUV9g4Ki/buHt+97aAIwhFGsGehLxBqUC3Se9ctKdSnpWaDDbCbdy5N2dht7
 d/I203tDx7BIEu0cvPg==
X-Proofpoint-GUID: 9n-9THV2WPn0Q4S_XS89u-vP_YptziA7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1011 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090101
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

On Thu, Jan 08, 2026 at 03:21:50PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Most modern Qualcomm platforms (>= SM8150) expose information about the
> DDR memory present on the system via SMEM.
> 
> Details from this information is used in various scenarios, such as
> multimedia drivers configuring the hardware based on the "Highest Bank
> address Bit" (hbb), or the list of valid frequencies in validation
> scenarios...
> 
> Add support for parsing v3-v7 version of the structs. Unforunately,
> they are not versioned, so some elbow grease is necessary to determine
> which one is present. See for reference:
> 
> ver 3: https://git.codelinaro.org/clo/la/abl/tianocore/edk2/-/commit/1d11897d2cfcc7b85f28ff74c445018dbbecac7a
> ver 4: https://git.codelinaro.org/clo/la/abl/tianocore/edk2/-/commit/f6e9aa549260bbc0bdcb156c2b05f48dc5963203
> ver 5: https://git.codelinaro.org/clo/la/abl/tianocore/edk2/-/commit/617d3297abe8b1b8dd3de3d1dd69c3961e6f343f
> ver 5 with 6regions: https://git.codelinaro.org/clo/la/abl/tianocore/edk2/-/commit/d770e009f9bae58d56d926f7490bbfb45af8341f
> ver 6: https://git.codelinaro.org/clo/la/abl/tianocore/edk2/-/commit/62659b557fdb1551b20fae8073d1d701dfa8a62e
> ver 7: https://git.codelinaro.org/clo/la/abl/tianocore/edk2/-/commit/734d95599c5ebb1ca0d4e1639142e65c590532b7
> 
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/Makefile     |   3 +-
>  drivers/soc/qcom/smem.c       |  14 +-
>  drivers/soc/qcom/smem.h       |   9 +
>  drivers/soc/qcom/smem_dramc.c | 408 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/soc/qcom/smem.h |   4 +
>  5 files changed, 436 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index b7f1d2a57367..798643be3590 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -23,7 +23,8 @@ obj-$(CONFIG_QCOM_RPMH)		+= qcom_rpmh.o
>  qcom_rpmh-y			+= rpmh-rsc.o
>  qcom_rpmh-y			+= rpmh.o
>  obj-$(CONFIG_QCOM_SMD_RPM)	+= rpm-proc.o smd-rpm.o
> -obj-$(CONFIG_QCOM_SMEM) +=	smem.o
> +qcom_smem-y			+= smem.o smem_dramc.o
> +obj-$(CONFIG_QCOM_SMEM) +=	qcom_smem.o
>  obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
>  CFLAGS_smp2p.o := -I$(src)
>  obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index 088b2bbee9e6..a53bf9ed8e92 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -4,6 +4,7 @@
>   * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
>   */
>  
> +#include <linux/debugfs.h>
>  #include <linux/hwspinlock.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> @@ -16,6 +17,8 @@
>  #include <linux/soc/qcom/smem.h>
>  #include <linux/soc/qcom/socinfo.h>
>  
> +#include "smem.h"
> +
>  /*
>   * The Qualcomm shared memory system is a allocate only heap structure that
>   * consists of one of more memory areas that can be accessed by the processors
> @@ -284,6 +287,8 @@ struct qcom_smem {
>  	struct smem_partition global_partition;
>  	struct smem_partition partitions[SMEM_HOST_COUNT];
>  
> +	struct dentry *debugfs_dir;
> +
>  	unsigned num_regions;
>  	struct smem_region regions[] __counted_by(num_regions);
>  };
> @@ -1236,17 +1241,24 @@ static int qcom_smem_probe(struct platform_device *pdev)
>  
>  	__smem = smem;
>  
> +	smem->debugfs_dir = smem_dram_parse(smem->dev);

Is it possible, even after calling qcom_smem_is_available() before calling 
qcom_smem_dram_get_hbb() we are getting __dram as NULL.

is it good to move __smem assignment to the end with barrier so all the
changes before the assignment are seen when somebody checking qcom_smem_is_available()
with a pair smp store/release pair.

> +
>  	smem->socinfo = platform_device_register_data(&pdev->dev, "qcom-socinfo",
>  						      PLATFORM_DEVID_NONE, NULL,
>  						      0);
> -	if (IS_ERR(smem->socinfo))
> +	if (IS_ERR(smem->socinfo)) {
> +		debugfs_remove_recursive(smem->debugfs_dir);
> +
>  		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
> +	}
>  
>  	return 0;
>  }
>  
>  static void qcom_smem_remove(struct platform_device *pdev)
>  {
> +	debugfs_remove_recursive(__smem->debugfs_dir);
> +
>  	platform_device_unregister(__smem->socinfo);
>  
>  	__smem = NULL;
> diff --git a/drivers/soc/qcom/smem.h b/drivers/soc/qcom/smem.h
> new file mode 100644
> index 000000000000..8bf3f606e1ae
> --- /dev/null
> +++ b/drivers/soc/qcom/smem.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __QCOM_SMEM_INTERNAL__
> +#define __QCOM_SMEM_INTERNAL__
> +
> +#include <linux/device.h>
> +
> +struct dentry *smem_dram_parse(struct device *dev);
> +
> +#endif
> diff --git a/drivers/soc/qcom/smem_dramc.c b/drivers/soc/qcom/smem_dramc.c
> new file mode 100644
> index 000000000000..017bb894a91b
> --- /dev/null
> +++ b/drivers/soc/qcom/smem_dramc.c
> @@ -0,0 +1,408 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.

Year less.. ??

> + */
> +
> +#include <linux/debugfs.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/soc/qcom/smem.h>
> +#include <linux/units.h>
> +#include <linux/soc/qcom/smem.h>

2nd time..

> +
> +#include "smem.h"
> +
> +#define SMEM_DDR_INFO_ID		603
> +
> +#define MAX_DDR_FREQ_NUM_V3		13
> +#define MAX_DDR_FREQ_NUM_V5		14
> +
> +#define MAX_CHAN_NUM			8
> +#define MAX_RANK_NUM			2
> +
> +#define DDR_HBB_MIN			13
> +#define DDR_HBB_MAX			19
> +
> +#define MAX_SHUB_ENTRIES		8
> +
> +static struct smem_dram *__dram;
> +
> +enum ddr_info_version {
> +	INFO_UNKNOWN,
> +	INFO_V3,
> +	INFO_V3_WITH_14_FREQS,
> +	INFO_V4,
> +	INFO_V5,
> +	INFO_V5_WITH_6_REGIONS,
> +	INFO_V6, /* INFO_V6 seems to only have shipped with 6 DDR regions, unlike V7 */
> +	INFO_V7,
> +	INFO_V7_WITH_6_REGIONS,
> +};
> +
> +struct smem_dram {
> +	unsigned long frequencies[MAX_DDR_FREQ_NUM_V5];
> +	u32 num_frequencies;

freq and num_freq_entries ? since you have used freq at various places..

> +	u8 hbb;
> +};
> +
> +enum ddr_type {
> +	DDR_TYPE_NODDR = 0,
> +	DDR_TYPE_LPDDR1 = 1,
> +	DDR_TYPE_LPDDR2 = 2,
> +	DDR_TYPE_PCDDR2 = 3,
> +	DDR_TYPE_PCDDR3 = 4,
> +	DDR_TYPE_LPDDR3 = 5,
> +	DDR_TYPE_LPDDR4 = 6,
> +	DDR_TYPE_LPDDR4X = 7,
> +	DDR_TYPE_LPDDR5 = 8,
> +	DDR_TYPE_LPDDR5X = 9,
> +};
> +
> +/* The data structures below are NOT __packed on purpose! */
> +
> +/* Structs used across multiple versions */
> +struct ddr_part_details {
> +	__le16 revision_id1;
> +	__le16 revision_id2;
> +	__le16 width;
> +	__le16 density;
> +};
> +
> +struct ddr_freq_table {
> +	u32 freq_khz;
> +	u8 enabled;
> +};
> +
> +/* V3 */
> +struct ddr_freq_plan_v3 {
> +	struct ddr_freq_table ddr_freq[MAX_DDR_FREQ_NUM_V3]; /* NOTE: some have 14 like v5 */
> +	u8 num_ddr_freqs;
> +	phys_addr_t clk_period_address;
> +};
> +
> +struct ddr_details_v3 {
> +	u8 manufacturer_id;
> +	u8 device_type;
> +	struct ddr_part_details ddr_params[MAX_CHAN_NUM];
> +	struct ddr_freq_plan_v3 ddr_freq_tbl;
> +	u8 num_channels;
> +};
> +
> +/* V4 */
> +struct ddr_details_v4 {
> +	u8 manufacturer_id;
> +	u8 device_type;
> +	struct ddr_part_details ddr_params[MAX_CHAN_NUM];
> +	struct ddr_freq_plan_v3 ddr_freq_tbl;
> +	u8 num_channels;
> +	u8 num_ranks[MAX_CHAN_NUM];
> +	u8 highest_bank_addr_bit[MAX_CHAN_NUM][MAX_RANK_NUM];
> +};
> +
> +/* V5 */
> +struct shub_freq_table {
> +	u8 enable;
> +	u32 freq_khz;
> +};
> +
> +struct shub_freq_plan_entry {
> +	u8 num_shub_freqs;
> +	struct shub_freq_table shub_freq[MAX_SHUB_ENTRIES];
> +};
> +
> +struct ddr_xbl2quantum_smem_data {
> +	phys_addr_t ssr_cookie_addr;
> +	u32 reserved[10];
> +};
> +
> +struct ddr_freq_plan_v5 {
> +	struct ddr_freq_table ddr_freq[MAX_DDR_FREQ_NUM_V5];
> +	u8 num_ddr_freqs;
> +	phys_addr_t clk_period_address;
> +	u32 max_nom_ddr_freq;
> +};
> +
> +struct ddr_region_v5 {
> +	u64 start_address;
> +	u64 size;
> +	u64 mem_controller_address;
> +	u32 granule_size; /* MiB */
> +	u8  ddr_rank;
> +#define DDR_RANK_0	BIT(0)
> +#define DDR_RANK_1	BIT(1)
> +	u8  segments_start_index;
> +	u64 segments_start_offset;
> +};
> +
> +struct ddr_regions_v5 {
> +	u32 ddr_region_num; /* We expect this to always be 4 or 6 */
> +	u64 ddr_rank0_size;
> +	u64 ddr_rank1_size;
> +	u64 ddr_cs0_start_addr;
> +	u64 ddr_cs1_start_addr;
> +	u32 highest_bank_addr_bit;
> +	struct ddr_region_v5 ddr_region[] __counted_by(ddr_region_num);
> +};
> +
> +struct ddr_details_v5 {
> +	u8 manufacturer_id;
> +	u8 device_type;
> +	struct ddr_part_details ddr_params[MAX_CHAN_NUM];
> +	struct ddr_freq_plan_v5 ddr_freq_tbl;
> +	u8 num_channels;
> +	u8 _padding;
> +	struct ddr_regions_v5 ddr_regions;
> +};
> +
> +/* V6 */
> +struct ddr_misc_info_v6 {
> +	u32 dsf_version;
> +	u32 reserved[10];
> +};
> +
> +/* V7 */
> +struct ddr_details_v7 {
> +	u8 manufacturer_id;
> +	u8 device_type;
> +	struct ddr_part_details ddr_params[MAX_CHAN_NUM];
> +	struct ddr_freq_plan_v5 ddr_freq_tbl;
> +	u8 num_channels;
> +	u8 sct_config;
> +	struct ddr_regions_v5 ddr_regions;
> +};
> +
> +/**
> + * qcom_smem_dram_get_hbb(): Get the Highest bank address bit
> + *
> + * Context: Check qcom_smem_is_available() before calling this function.
> + * Because __dram * is initialized by smem_dram_parse(), which is in turn
> + * called from * qcom_smem_probe(), __dram will only be NULL if the data
> + * couldn't have been found/interpreted correctly.
> + *
> + * Return: 0 on success, -ENODATA on failure.
> + */
> +int qcom_smem_dram_get_hbb(void)
> +{
> +	int hbb;
> +
> +	if (!__dram)
> +		return -ENODATA;
> +
> +	hbb = __dram->hbb;
> +	if (hbb == 0)
> +		return -ENODATA;

Incase, you want to consider to save some lines..

if (!__dram || !__dram->hbb)
	return -ENODATA;


> +	else if (hbb < DDR_HBB_MIN || hbb > DDR_HBB_MAX)
> +		return -EINVAL;
> +
> +	return hbb;
> +}
> +EXPORT_SYMBOL_GPL(qcom_smem_dram_get_hbb);
> +
> +static void smem_dram_parse_v3_data(struct smem_dram *dram, void *data, bool additional_freq_entry)
> +{
> +	/* This may be 13 or 14 */
> +	int num_freq_entries = MAX_DDR_FREQ_NUM_V3;
> +	struct ddr_details_v3 *details = data;
> +
> +	if (additional_freq_entry)
> +		num_freq_entries++;
> +
> +	for (int i = 0; i < num_freq_entries; i++) {
> +		struct ddr_freq_table *freq_entry = &details->ddr_freq_tbl.ddr_freq[i];
> +
> +		if (freq_entry->freq_khz && freq_entry->enabled)
> +			dram->frequencies[dram->num_frequencies++] = 1000 * freq_entry->freq_khz;
> +	}
> +}
> +
> +static void smem_dram_parse_v4_data(struct smem_dram *dram, void *data)
> +{
> +	struct ddr_details_v4 *details = data;
> +
> +	/* Rank 0 channel 0 entry holds the correct value */
> +	dram->hbb = details->highest_bank_addr_bit[0][0];
> +
> +	for (int i = 0; i < MAX_DDR_FREQ_NUM_V3; i++) {
> +		struct ddr_freq_table *freq_entry = &details->ddr_freq_tbl.ddr_freq[i];
> +
> +		if (freq_entry->freq_khz && freq_entry->enabled)
> +			dram->frequencies[dram->num_frequencies++] = 1000 * freq_entry->freq_khz;
> +	}
> +}
> +
> +static void smem_dram_parse_v5_data(struct smem_dram *dram, void *data)
> +{
> +	struct ddr_details_v5 *details = data;
> +	struct ddr_regions_v5 *region = &details->ddr_regions;
> +
> +	dram->hbb = region[0].highest_bank_addr_bit;
> +
> +	for (int i = 0; i < MAX_DDR_FREQ_NUM_V5; i++) {
> +		struct ddr_freq_table *freq_entry = &details->ddr_freq_tbl.ddr_freq[i];
> +
> +		if (freq_entry->freq_khz && freq_entry->enabled)
> +			dram->frequencies[dram->num_frequencies++] = 1000 * freq_entry->freq_khz;
> +	}
> +}
> +
> +static void smem_dram_parse_v7_data(struct smem_dram *dram, void *data)
> +{
> +	struct ddr_details_v7 *details = data;
> +	struct ddr_regions_v5 *region = &details->ddr_regions;
> +
> +	dram->hbb = region[0].highest_bank_addr_bit;
> +
> +	for (int i = 0; i < MAX_DDR_FREQ_NUM_V5; i++) {
> +		struct ddr_freq_table *freq_entry = &details->ddr_freq_tbl.ddr_freq[i];
> +
> +		if (freq_entry->freq_khz && freq_entry->enabled)
> +			dram->frequencies[dram->num_frequencies++] = 1000 * freq_entry->freq_khz;
> +	}
> +}
> +
> +/* The structure contains no version field, so we have to perform some guesswork.. */
> +static int smem_dram_infer_struct_version(size_t size)
> +{
> +	/* Some early versions provided less bytes of less useful data */
> +	if (size < sizeof(struct ddr_details_v3))
> +		return -EINVAL;
> +
> +	if (size == sizeof(struct ddr_details_v3))
> +		return INFO_V3;
> +
> +	if (size == sizeof(struct ddr_details_v3)
> +		 + sizeof(struct ddr_freq_table))
> +		return INFO_V3_WITH_14_FREQS;
> +
> +	if (size == sizeof(struct ddr_details_v4))
> +		return INFO_V4;
> +
> +	if (size == sizeof(struct ddr_details_v5)
> +		 + 4 * sizeof(struct ddr_region_v5))
> +		return INFO_V5;
> +
> +	if (size == sizeof(struct ddr_details_v5)
> +		 + 4 * sizeof(struct ddr_region_v5)
> +		 + sizeof(struct ddr_xbl2quantum_smem_data)
> +		 + sizeof(struct shub_freq_plan_entry))
> +		return INFO_V5;

Why this does not have separate name ?

> +
> +	if (size == sizeof(struct ddr_details_v5)
> +		 + 6 * sizeof(struct ddr_region_v5))
> +		return INFO_V5_WITH_6_REGIONS;
> +
> +	if (size == sizeof(struct ddr_details_v5)
> +		 + 6 * sizeof(struct ddr_region_v5)
> +		 + sizeof(struct ddr_xbl2quantum_smem_data)
> +		 + sizeof(struct shub_freq_plan_entry))
> +		return INFO_V5_WITH_6_REGIONS;
> +
> +	if (size == sizeof(struct ddr_details_v5)
> +		 + 6 * sizeof(struct ddr_region_v5)
> +		 + sizeof(struct ddr_misc_info_v6)
> +		 + sizeof(struct shub_freq_plan_entry))
> +		return INFO_V6;
> +
> +	if (size == sizeof(struct ddr_details_v7)
> +		 + 4 * sizeof(struct ddr_region_v5)
> +		 + sizeof(struct ddr_misc_info_v6)
> +		 + sizeof(struct shub_freq_plan_entry))
> +		return INFO_V7;
> +
> +	if (size == sizeof(struct ddr_details_v7)
> +		 + 6 * sizeof(struct ddr_region_v5)
> +		 + sizeof(struct ddr_misc_info_v6)
> +		 + sizeof(struct shub_freq_plan_entry))
> +		return INFO_V7_WITH_6_REGIONS;
> +
> +	return INFO_UNKNOWN;
> +}
> +
> +static int smem_dram_frequencies_show(struct seq_file *s, void *unused)
> +{
> +	struct smem_dram *dram = s->private;
> +
> +	for (int i = 0; i < dram->num_frequencies; i++)
> +		seq_printf(s, "%lu\n", dram->frequencies[i]);
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(smem_dram_frequencies);
> +
> +static int smem_hbb_show(struct seq_file *s, void *unused)
> +{
> +	struct smem_dram *dram = s->private;
> +
> +	if (!dram->hbb)
> +		return -EINVAL;
> +
> +	seq_printf(s, "%d\n", dram->hbb);
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(smem_hbb);
> +
> +struct dentry *smem_dram_parse(struct device *dev)
> +{
> +	struct dentry *debugfs_dir;
> +	enum ddr_info_version ver;
> +	struct smem_dram *dram;
> +	size_t actual_size;
> +	void *data = NULL;
> +
> +	/* No need to check qcom_smem_is_available(), this func is called by the SMEM driver */

This comment seems redundant..

> +	data = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_DDR_INFO_ID, &actual_size);
> +	if (IS_ERR_OR_NULL(data))
> +		return ERR_PTR(-ENODATA);
> +
> +	ver = smem_dram_infer_struct_version(actual_size);
> +	if (ver < 0) {
> +		/* Some SoCs don't provide data that's useful for us */
> +		return ERR_PTR(-ENODATA);
> +	} else if (ver == INFO_UNKNOWN) {
> +		/* In other cases, we may not have added support for a newer struct revision */
> +		pr_err("Found an unknown type of DRAM info struct (size = %zu)\n", actual_size);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	dram = devm_kzalloc(dev, sizeof(*dram), GFP_KERNEL);
> +	if (!dram)
> +		return ERR_PTR(-ENOMEM);
> +
> +	switch (ver) {
> +	case INFO_V3:
> +		smem_dram_parse_v3_data(dram, data, false);
> +		break;
> +	case INFO_V3_WITH_14_FREQS:
> +		smem_dram_parse_v3_data(dram, data, true);
> +		break;
> +	case INFO_V4:
> +		smem_dram_parse_v4_data(dram, data);
> +		break;
> +	case INFO_V5:
> +	case INFO_V5_WITH_6_REGIONS:
> +	case INFO_V6:
> +		smem_dram_parse_v5_data(dram, data);
> +		break;
> +	case INFO_V7:
> +	case INFO_V7_WITH_6_REGIONS:
> +		smem_dram_parse_v7_data(dram, data);
> +		break;
> +	default:
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	/* Both the entry and its parent dir will be cleaned up by debugfs_remove_recursive */
> +	debugfs_dir = debugfs_create_dir("qcom_smem", NULL);
> +	debugfs_create_file("dram_frequencies", 0444, debugfs_dir, dram,
> +			    &smem_dram_frequencies_fops);
> +	debugfs_create_file("hbb", 0444, debugfs_dir, dram, &smem_hbb_fops);
> +
> +	/* If there was no failure so far, assign the global variable */

nit: I agree that we should write comments, but sometimes it is too obvious.
This is a simple assignment, not something complex like a barrier that requires
detailed explanation.

> +	__dram = dram;
> +
> +	return debugfs_dir;
> +}
> diff --git a/include/linux/soc/qcom/smem.h b/include/linux/soc/qcom/smem.h
> index f946e3beca21..223cd5090a2a 100644
> --- a/include/linux/soc/qcom/smem.h
> +++ b/include/linux/soc/qcom/smem.h
> @@ -2,6 +2,8 @@
>  #ifndef __QCOM_SMEM_H__
>  #define __QCOM_SMEM_H__
>  
> +#include <linux/platform_device.h>
> +

Why this ?

>  #define QCOM_SMEM_HOST_ANY -1
>  
>  bool qcom_smem_is_available(void);
> @@ -17,4 +19,6 @@ int qcom_smem_get_feature_code(u32 *code);
>  
>  int qcom_smem_bust_hwspin_lock_by_host(unsigned int host);
>  
> +int qcom_smem_dram_get_hbb(void);
> +
>  #endif
> 
> -- 
> 2.52.0
> 

-- 
-Mukesh Ojha
