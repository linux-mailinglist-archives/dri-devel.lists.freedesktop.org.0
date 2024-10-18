Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A859A497B
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 00:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5085A10E9D0;
	Fri, 18 Oct 2024 22:09:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="nSPc29aX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989B510E9D0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 22:09:06 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IEhbBN029274;
 Fri, 18 Oct 2024 22:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KDyzLeDND4YlyvkNavh75mKjjQdykqhl9l5yxwwO3AA=; b=nSPc29aXXT9hL8b9
 WBrJ3J5Tu1Gy7DZln7dOWU9q4XhQ6cHnrYw6yqO7+H/Cgg5QJ11wmmV9vNetGxhY
 6VEVwV5XVUpM1HFYAasEsDH+fE4lS/V2yxJcmSj076gHBsbnFX/oemhywsT/KAyb
 c5bgBXlYjamU+3IDQ3QDbPgYvEvbJD6rPezA1S3xFw3NU8US5IEGvJBJ3is++EYG
 0+RLkaOK1I+zv2tzZWS0yD/0cA5yLkA33RyXgNxxeAESyYsGWdEyggTx9o/Zg++G
 SDoznCXZHQQI9/7SU1sECADuSrAlY4FOn6tZfOoOfWkr1y0HKcC7CQtVwSHy+vF8
 qG3/4A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42bhbqanw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Oct 2024 22:09:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49IM93Bb030980
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Oct 2024 22:09:03 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Oct
 2024 15:09:02 -0700
Message-ID: <c3f3c4a5-0927-0228-1cdf-3f8645a16681@quicinc.com>
Date: Fri, 18 Oct 2024 16:09:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 09/11] accel/ivpu: Add debug Kconfig option
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, Maciej Falkowski
 <maciej.falkowski@linux.intel.com>
References: <20241017145817.121590-1-jacek.lawrynowicz@linux.intel.com>
 <20241017145817.121590-10-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20241017145817.121590-10-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: -guepnegRshSiZjthefhro-xM3Kb3TWT
X-Proofpoint-GUID: -guepnegRshSiZjthefhro-xM3Kb3TWT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0
 clxscore=1011 suspectscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180142
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

On 10/17/2024 8:58 AM, Jacek Lawrynowicz wrote:
> From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> 
> Add CONFIG_DRM_ACCEL_IVPU_DEBUG option that:
>   - Adds -DDEBUG that enables printk regardless of the kernel config
>   - Enables unsafe module params (that are now disabled by default)
> 
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>   drivers/accel/ivpu/Kconfig    | 10 ++++++++++
>   drivers/accel/ivpu/Makefile   |  2 ++
>   drivers/accel/ivpu/ivpu_drv.c |  2 ++
>   drivers/accel/ivpu/ivpu_fw.c  |  2 ++
>   drivers/accel/ivpu/ivpu_pm.c  |  2 ++
>   5 files changed, 18 insertions(+)
> 
> diff --git a/drivers/accel/ivpu/Kconfig b/drivers/accel/ivpu/Kconfig
> index e4d418b44626e..8858b32e05640 100644
> --- a/drivers/accel/ivpu/Kconfig
> +++ b/drivers/accel/ivpu/Kconfig
> @@ -16,3 +16,13 @@ config DRM_ACCEL_IVPU
>   	  and Deep Learning applications.
>   
>   	  If "M" is selected, the module will be called intel_vpu.
> +
> +config DRM_ACCEL_IVPU_DEBUG
> +	bool "Intel NPU debug mode"
> +	depends on DRM_ACCEL_IVPU
> +	default n

The default is N, so this is redundant, no?

> +	help
> +	  Choose this option to enable additional
> +	  debug features for the Intel NPU driver:
> +	  - Always print debug messages regardless of dyndbg config,
> +	  - Enable unsafe module params.
> diff --git a/drivers/accel/ivpu/Makefile b/drivers/accel/ivpu/Makefile
> index e73937c86d9ad..1029e0bab0615 100644
