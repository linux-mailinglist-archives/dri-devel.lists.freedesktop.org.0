Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B565AAA3FA2
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 02:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B48E10E5BF;
	Wed, 30 Apr 2025 00:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="A0gkUzKI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E96B10E5BF;
 Wed, 30 Apr 2025 00:42:58 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLb6WG011110;
 Wed, 30 Apr 2025 00:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6Sag34qJ52YuT6efMvy0748mP7F3CM21Yf357Xp+F6k=; b=A0gkUzKIrTNBn5pd
 biDb2FHDZt8cQVMhi5Fv/0NGkGDSlMfdFoWGxisCafAr3QBCu2KcOQo4s0KVUlk/
 WrKtgOMDSPQxtLsHvwwtCHP7Y59UVNhrb0LFZZ9LrLdl3Cfo9bQ1qe7SeBt7MDXT
 3mj8mzP3mRol9traZ1jVRky9/Y3H8P4CaaBDo+/oTVWWJ/RmyBHbrOFI6TbZAgKq
 Oz990loJBH/sD4N6fv4xTknR+dSAqvFs6klw5W4IYu/7dNbq5tHpr0EG5Hfl/bw0
 Y8yHMNpkQWy5AGh12Ij+aVF3sh3KJONIluKWipHgz9pBaZln1im2BRJxCHKFTOpv
 fd0Agg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uarapq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Apr 2025 00:42:53 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53U0gq5M004292
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Apr 2025 00:42:52 GMT
Received: from [10.134.71.99] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 17:42:52 -0700
Message-ID: <4d7dd217-1fd8-4ce6-ac2b-9845d9f39732@quicinc.com>
Date: Tue, 29 Apr 2025 17:42:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] drm/msm/dpu: drop now-unused condition for
 has_legacy_ctls
To: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>
References: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
 <20250307-dpu-active-ctl-v3-8-5d20655f10ca@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250307-dpu-active-ctl-v3-8-5d20655f10ca@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: GI8BjsSTDI29XiYA8kwh5IraShTTMp82
X-Authority-Analysis: v=2.4 cv=KtlN2XWN c=1 sm=1 tr=0 ts=6811720d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8
 a=tVI0ZWmoAAAA:8 a=COk6AnOGAAAA:8
 a=IHR0_4M0J_M6PwUVkEsA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: GI8BjsSTDI29XiYA8kwh5IraShTTMp82
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDAwMyBTYWx0ZWRfXxwMJcbM9C4F5
 dfJZpfSE9GXmyEmACJILttAks6dJ8dBuWXzGG1YAQcom5fwdrb3XZwDXX8iUvW1tUgQ8GgOdQ7r
 ODL5YEFxNhGuXYj6Jg1za7n74UYUM6t+z17amSBPW7q0wEo5eGvaiqeDsXgqtKuMnn4D1Bfcm9z
 N4/IMWPj8toSDN0/0CHfVWuRg2xJRshOJC69mTWjZtJsF3EWu6Sofz0wgiL86QxXOsCfMjoip0p
 /D+48DS5pCDtLLWJuPmUfhARkRP9uMqgGPaztd+cuzVbIVWWB7l0vaI0z02pglc6vCF2yXy8P6c
 +CAqMnXwULeTE0i7aL0sgFA4wf9r9FuueJNqs2zXA36NmAJDpP6AIZDhzVErnmyJAzauSI/BgRm
 BarA9MBjeH2kpqmJWfPEi2rhmgusYYtABWV+QuqVRUycyvW/nkrUTFYRgENCnySFVT4u36i8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300003
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



On 3/6/2025 10:24 PM, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Now as we have dropped the DPU_CTL_SPLIT_DISPLAY from DPU >= 5.0
> configuration, drop the rm->has_legacy_ctl condition which short-cutted
> the check for those platforms.
> 
> Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
> 
> Note, it is imposible to reoder commits in any other sensible way. The
> DPU_CTL_SPLIT_DISPLAY can not be dropped before the patch that enables
> single-CTL support.
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index c72b968d58a65960605456e752278def2a21df7b..2e296f79cba1437470eeb30900a650f6f4e334b6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -466,8 +466,7 @@ static int _dpu_rm_reserve_ctls(
>   
>   		DPU_DEBUG("ctl %d caps 0x%lX\n", j + CTL_0, features);
>   
> -		if (rm->has_legacy_ctls &&
> -		    needs_split_display != has_split_display)
> +		if (needs_split_display != has_split_display)
>   			continue;
>   
>   		ctl_idx[i] = j;
> 

