Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5C38FD5C6
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 20:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111CC10E597;
	Wed,  5 Jun 2024 18:31:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="JPGAA+RA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43EDA10E41E;
 Wed,  5 Jun 2024 18:31:40 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455I2vod014213;
 Wed, 5 Jun 2024 18:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lNDweJq8WOexpVGadm1HsCQHiC7xA9GF7/ziWHMu88Y=; b=JPGAA+RADzu5VcfB
 clQB0pVmdkOJ2WHOkJKwtCGR3KzeUgaNuZ3RlBnOFmVPaYr/JvW9km8DH7jxwvig
 S/kionDsgogj1oRR+mky5JqGe6fIu6SmPORi/pdpskF+d8nwGgDrEq18nNIzNlPs
 yxhtJm1ATEHMY6KSuahNsC9wrDukkoEsDQbQndcPrl3ejbAC/PyZe34fJXrX6+mU
 0hSHdWcUyEnSKZI+7aNFrMWMeOWfkU5/GBND+bWDHf1cplThebJc4gI07mM+DzUM
 OGAgw1RSrugifbpmTez1qJBt7bv83rDxMcCZL+puHcSi8Bmz+q0bwrVDiLKlRJqM
 Gld9RQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjvxy82av-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jun 2024 18:31:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 455IVWUI022056
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 5 Jun 2024 18:31:32 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Jun 2024
 11:31:28 -0700
Message-ID: <77e34b55-b114-e807-b81e-a5525350e547@quicinc.com>
Date: Wed, 5 Jun 2024 11:31:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] drm/msm/a6xx: use __unused__ to fix compiler warnings
 for gen7_* includes
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
CC: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>, "Sean
 Paul" <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
 Connor Abbott <cwabbott0@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <seanpaul@chromium.org>, <quic_jesszhan@quicinc.com>,
 Rob Clark <robdclark@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20240605003829.4120343-1-quic_abhinavk@quicinc.com>
 <20240605180553.GA2457302@thelio-3990X>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240605180553.GA2457302@thelio-3990X>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: RoYk8VptRL-YRt4XhvlSzUgCYjr4uYX4
X-Proofpoint-GUID: RoYk8VptRL-YRt4XhvlSzUgCYjr4uYX4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0
 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406050140
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

Hi Nathan

On 6/5/2024 11:05 AM, Nathan Chancellor wrote:
> Hi Abhinav,
> 
> Just a drive by style comment.
> 
> On Tue, Jun 04, 2024 at 05:38:28PM -0700, Abhinav Kumar wrote:
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
>> index 0a7717a4fc2f..a958e2b3c025 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
>> @@ -8,19 +8,15 @@
>>   #include "a6xx_gpu_state.h"
>>   #include "a6xx_gmu.xml.h"
>>   
>> -/* Ignore diagnostics about register tables that we aren't using yet. We don't
>> - * want to modify these headers too much from their original source.
>> - */
>> -#pragma GCC diagnostic push
>> -#pragma GCC diagnostic ignored "-Wunused-variable"
>> -#pragma GCC diagnostic ignored "-Wunused-const-variable"
>> +static const unsigned int *gen7_0_0_external_core_regs[] __attribute((__unused__));
>> +static const unsigned int *gen7_2_0_external_core_regs[] __attribute((__unused__));
>> +static const unsigned int *gen7_9_0_external_core_regs[] __attribute((__unused__));
>> +static struct gen7_sptp_cluster_registers gen7_9_0_sptp_clusters[] __attribute((__unused__));
> 
> Please do not open code attributes. This is available as either
> '__always_unused' or '__maybe_unused', depending on the context.
> checkpatch would have warned about this if it was '__attribute__'
> instead of '__attribute'.
> 

Thanks for the note. Let me update the patch to use __always_unused.

> Cheers,
> Nathan
