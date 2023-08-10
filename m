Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE992777AB4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 16:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E800910E1A6;
	Thu, 10 Aug 2023 14:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914B010E1A4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 14:27:20 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37ACbHLF015758; Thu, 10 Aug 2023 14:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=RnQEYD06cWiNarL3yzcyhBiypLvpTnqhEujT1VWUIR4=;
 b=MtpoeaD/HHix574npt8Gt+8Tzs07VsRf+FtUhHKQL3j+mpn3rRd0OSSDDwGtTHZ+8uC3
 yD6GinccdfDM73Ni/88/U1ijDPj28idoML1u1bUny1UHvvag5vzb0q0urfZwg/IMZB52
 JViTnxqGZRllgLFBrO3FgcNNvYjeaY+8RdQ32vND4Zp+GJzNjbdvygwAdshdObk5ACVL
 /BJI7nqxq26lnioJteV5BZDdYpISE5rCAR5Pq9dXjCNAvgqeEWRkOOOU2K4yY+Vdlhf+
 N6ptRx7ENWONTNnH4ESd60ADgASYLpPWpc/Lv+snLqQk7H2R4+c5MCZiFibdr+KaaGTO Kw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3scbcgjqfv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Aug 2023 14:27:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37AERAKW016744
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Aug 2023 14:27:10 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 10 Aug
 2023 07:27:09 -0700
Message-ID: <6bbd1cc5-f85b-2b42-22f9-4fd313a6ebfc@quicinc.com>
Date: Thu, 10 Aug 2023 08:27:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/ivpu: Document DRM_IVPU_PARAM_CAPABILITIES
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230810080707.3545883-1-stanislaw.gruszka@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230810080707.3545883-1-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: yhAr4Jd46KdW1SOMJ0RpDysAWtO5fRtz
X-Proofpoint-ORIG-GUID: yhAr4Jd46KdW1SOMJ0RpDysAWtO5fRtz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_11,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308100123
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

On 8/10/2023 2:07 AM, Stanislaw Gruszka wrote:
> Add comments regarding new DRM_IVPU_PARAM_CAPABILITIES param.
> 
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>   include/uapi/drm/ivpu_accel.h | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/drm/ivpu_accel.h b/include/uapi/drm/ivpu_accel.h
> index a58a14c9f222..7d1ecc5bbac3 100644
> --- a/include/uapi/drm/ivpu_accel.h
> +++ b/include/uapi/drm/ivpu_accel.h
> @@ -69,8 +69,21 @@ extern "C" {
>   #define DRM_IVPU_CONTEXT_PRIORITY_FOCUS	    2
>   #define DRM_IVPU_CONTEXT_PRIORITY_REALTIME  3
>   
> -#define DRM_IVPU_CAP_METRIC_STREAMER	    1
> -#define DRM_IVPU_CAP_DMA_MEMORY_RANGE       2
> +/**
> + * DRM_IVPU_CAP_METRIC_STREAMER
> + *
> + * Metric streamer support, provides sampling of various hardware
> + * performance metrics (like DMA bandwidth, cache miss/hits),
> + * can be used for profiling.

Feels like this is a run-on sentence.  I think this reads better -

Metric streamer support.  Provides sampling of various hardware 
performance metrics like DMA bandwidth and cache miss/hits.  Can be used 
for profiling.

What do you think?

> + */
> +#define DRM_IVPU_CAP_METRIC_STREAMER	1
> +/**
> + * DRM_IVPU_CAP_DMA_MEMORY_RANGE
> + *
> + * Driver has capability to allocate separate memory range
> + * accessible by hardware DMA.
> + */
> +#define DRM_IVPU_CAP_DMA_MEMORY_RANGE	2
>   
>   /**
>    * struct drm_ivpu_param - Get/Set VPU parameters
> @@ -123,6 +136,8 @@ struct drm_ivpu_param {
>   	 * %DRM_IVPU_PARAM_SKU:
>   	 * VPU SKU ID (read-only)
>   	 *
> +	 * %DRM_IVPU_PARAM_CAPABILITIES:
> +	 * Supported capabilities (read-only)
>   	 */
>   	__u32 param;
>   

