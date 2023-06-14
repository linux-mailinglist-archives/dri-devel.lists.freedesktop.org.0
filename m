Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78793730918
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 22:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5142510E0CE;
	Wed, 14 Jun 2023 20:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B3A10E0CE;
 Wed, 14 Jun 2023 20:19:27 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35EKBJPG015758; Wed, 14 Jun 2023 20:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=yPMyKREnlqdFDB9iGvYRFdtvqWofTa7Oea+u4TQq7RM=;
 b=O51AlbJ2nUps96FvZIp+J50aU+Z8hnLlRMkDuKfRqYOfwgeEG2FP5eFyKCy6BxR1HT91
 nUXyB94CiLKYODzlpeTqY9m/6e4sFdFfHlmslkPLRumg8pAOcBv50X6riF4APBUddDJ3
 ClkJguMI3TL3ARQoxaZKA0fLV7JczOlws38dwn3YjXXorarx3PpTZRIoKVQlsGQsDsAI
 6ZkzHzjm6EgXjOYs1qCtolX/hFcNfv7U7yZjzUTZYEh4vJYEHBN4xYxes62AkKR2oVGx
 Be7v137y0a6GbcL3StBr5HJLG8yc1x0ylLtl02lvVb3Cv8ChMqllyUUEQlN3eniTpY3w hQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r7cka15xr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jun 2023 20:19:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35EKJK8l008634
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jun 2023 20:19:20 GMT
Received: from akhilpo-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 14 Jun 2023 13:18:43 -0700
Date: Thu, 15 Jun 2023 01:48:40 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v8 18/18] drm/msm/a6xx: Add A610 speedbin support
Message-ID: <ab2yzsjp65t53wp5nytjuc7eb74zklkb6i342bc5edhm45j3qm@kpyq52is7tde>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
 <20230223-topic-gmuwrapper-v8-18-69c68206609e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230223-topic-gmuwrapper-v8-18-69c68206609e@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: TCG2ArjwSVxKVDwtz6tEoOotRt9OEspn
X-Proofpoint-ORIG-GUID: TCG2ArjwSVxKVDwtz6tEoOotRt9OEspn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-14_14,2023-06-14_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306140178
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 29, 2023 at 03:52:37PM +0200, Konrad Dybcio wrote:
> 
> A610 is implemented on at least three SoCs: SM6115 (bengal), SM6125
> (trinket) and SM6225 (khaje). Trinket does not support speed binning
> (only a single SKU exists) and we don't yet support khaje upstream.
> Hence, add a fuse mapping table for bengal to allow for per-chip
> frequency limiting.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index d046af5f6de2..c304fa118cff 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2098,6 +2098,30 @@ static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>  	return progress;
>  }
>  
> +static u32 a610_get_speed_bin(u32 fuse)
> +{
> +	/*
> +	 * There are (at least) three SoCs implementing A610: SM6125 (trinket),
> +	 * SM6115 (bengal) and SM6225 (khaje). Trinket does not have speedbinning,
> +	 * as only a single SKU exists and we don't support khaje upstream yet.
> +	 * Hence, this matching table is only valid for bengal and can be easily
> +	 * expanded if need be.
> +	 */
> +
> +	if (fuse == 0)
> +		return 0;
> +	else if (fuse == 206)
> +		return 1;
> +	else if (fuse == 200)
> +		return 2;
> +	else if (fuse == 157)
> +		return 3;
> +	else if (fuse == 127)
> +		return 4;
> +
> +	return UINT_MAX;
> +}
> +
>  static u32 a618_get_speed_bin(u32 fuse)
>  {
>  	if (fuse == 0)
> @@ -2195,6 +2219,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_gpu *adreno_gpu, u3
>  {
>  	u32 val = UINT_MAX;
>  
> +	if (adreno_is_a610(adreno_gpu))
> +		val = a610_get_speed_bin(fuse);
> +

Didn't you update here to convert to 'else if' in one of the earlier
patches??

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil.
>  	if (adreno_is_a618(adreno_gpu))
>  		val = a618_get_speed_bin(fuse);
>  
> 
> -- 
> 2.40.1
> 
