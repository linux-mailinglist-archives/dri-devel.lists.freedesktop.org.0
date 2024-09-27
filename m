Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A42C988B31
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 22:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA7810E07E;
	Fri, 27 Sep 2024 20:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="NsGxNaPk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEC210E07E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 20:24:25 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48RGU7B4000903;
 Fri, 27 Sep 2024 20:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 p8Vf6l1geQRx1NbmBDuA9Y+mGZzg/wZbkndTiveDVBk=; b=NsGxNaPkkIbh+ely
 kcGmcOzu++e3E+Ct42kzPoRLx+JGK1fmKcDxFPySoe/fRlYA/F0TKz/aYlGHIZap
 NuIds4PoDg4TuByuBxcnHd+xSPAU+U4CfSA3cx69D6PwtE1Ci2abFdRZNSooQjm0
 doI15M4WsYdrunW6IuJQ63MAmy0dPif4/DbdMBmxpCOIBKgkZ16U8Q5OpsiCN7Ti
 RlTTkjSkWgxo9SbcEZwJWCtVN1B2WOBqeqScXFf/Tu4o6x3dMtUrdBM056W/PqFQ
 xsKl5y87PsO9/nqTrgpDwLZIPZo+TjJfWbIFm1Li8MIq/s9dCb0BZU73ygpy3XMo
 XTYdxw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sn3skx1g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Sep 2024 20:24:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48RKOL4Z008208
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Sep 2024 20:24:21 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 27 Sep
 2024 13:24:21 -0700
Message-ID: <e9dacb7f-19e3-b527-4f44-45ac9116b445@quicinc.com>
Date: Fri, 27 Sep 2024 14:24:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 01/29] accel/ivpu: Update VPU FW API headers
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>,
 Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
 <20240924081754.209728-2-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240924081754.209728-2-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: qBEaUZkRWA76Tuced1pJFDi9nAZSEjBG
X-Proofpoint-ORIG-GUID: qBEaUZkRWA76Tuced1pJFDi9nAZSEjBG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 mlxscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 clxscore=1011
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409270149
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

On 9/24/2024 2:17 AM, Jacek Lawrynowicz wrote:
> @@ -301,7 +308,14 @@ struct vpu_boot_params {
>   	u32 temp_sensor_period_ms;
>   	/** PLL ratio for efficient clock frequency */
>   	u32 pn_freq_pll_ratio;
> -	/** DVFS Mode: Default: 0, Max Performance: 1, On Demand: 2, Power Save: 3 */
> +	/**
> +	 * DVFS Mode:
> +	 * 0 - Default, DVFS mode selected by the firmware
> +	 * 1 - Max Performance
> +	 * 2 - On Demand
> +	 * 3 - Power Save
> +	 * 2 - On Demand Priority Aware

Should this be 4 ?

> +	 */
>   	u32 dvfs_mode;
>   	/**
>   	 * Depending on DVFS Mode:

<snip>

> @@ -130,7 +171,7 @@
>   /*
>    * vpu_jsm_engine_reset_context flag definitions
>    */
> -#define VPU_ENGINE_RESET_CONTEXT_FLAG_COLLATERAL_DAMAGE_MASK BIT(0)
> +#define VPU_ENGINE_RESET_CONTEXT_FLAG_COLLATERAL_DAMAGE_MASK BIT(1)

This feels like a bug fix. How can this be a FW API update without 
backwards compatibility?

>   #define VPU_ENGINE_RESET_CONTEXT_HANG_PRIMARY_CAUSE	     0
>   #define VPU_ENGINE_RESET_CONTEXT_COLLATERAL_DAMAGE	     1
>   
