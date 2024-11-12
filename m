Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 244439C629A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 21:30:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B3E10E64C;
	Tue, 12 Nov 2024 20:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ftZAx+wX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7433110E236;
 Tue, 12 Nov 2024 20:30:27 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACCGhv7005745;
 Tue, 12 Nov 2024 20:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Au4EFGKypvp3GDzbOIj5YnMCOF2q1QNzsySezonXE2k=; b=ftZAx+wXpl8Lg50x
 vQl5jLUXXnMTnR2avmFkgwKw4olieFdOvWqDrur2naYIJf9ERfS3+li5LayzyhUU
 DpaFMLtcVltZsJIDN08DyFePXy1B/cyyf/4MoSn3xygJi95rV1d3ssR7H5I7wSeB
 40SqmYBikyD0/Zehht4QCdWsOYVhnwxUyu7xNgYDqYQH3SFN//q5Qf8yPhzEcnzc
 USKIFeC3yYmAH060YzeOLRpPClSFH6+jL2pZBC4tDM27Yz2M2/T82IRPXU2WMdpe
 pfnc/3QAblt0Dct8UNFGE0SVzR1UwRtQuMLVGJGqyR3CA7c9g5OLMgDZPcjzl2jd
 kChA3w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42uwt5jqys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2024 20:30:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ACKULXv006224
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2024 20:30:21 GMT
Received: from [10.216.22.98] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 12:30:16 -0800
Message-ID: <eb665284-31f0-4e95-8f24-c2782bec72bd@quicinc.com>
Date: Wed, 13 Nov 2024 02:00:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][V2] drm/msm/a5xx: remove null pointer check on pdev
To: Colin Ian King <colin.i.king@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 "Abhinav Kumar" <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
CC: <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241112182218.1119158-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20241112182218.1119158-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: xZXpRrSehdhS4gDgZuKMyLCWgIDajSip
X-Proofpoint-ORIG-GUID: xZXpRrSehdhS4gDgZuKMyLCWgIDajSip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=965
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 adultscore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120164
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

On 11/12/2024 11:52 PM, Colin Ian King wrote:
> The call chain on a5xx_gpu_init is such that pdev is not going to be
> null, so the null check on pdev can be removed. This also cleans up
> a static analysis warning where pdev is dereferenced before the null
> check which cannot actually occur.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> 
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil
> ---
> 
> V2: rewrite Subject, remove null check on pdev
> 
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index ee89db72e36e..4edf9109d1d8 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1760,11 +1760,6 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>  	unsigned int nr_rings;
>  	int ret;
>  
> -	if (!pdev) {
> -		DRM_DEV_ERROR(dev->dev, "No A5XX device is defined\n");
> -		return ERR_PTR(-ENXIO);
> -	}
> -
>  	a5xx_gpu = kzalloc(sizeof(*a5xx_gpu), GFP_KERNEL);
>  	if (!a5xx_gpu)
>  		return ERR_PTR(-ENOMEM);

