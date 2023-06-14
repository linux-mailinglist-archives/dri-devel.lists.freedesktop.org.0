Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E030730907
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 22:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C2510E0C9;
	Wed, 14 Jun 2023 20:16:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D84710E0C9;
 Wed, 14 Jun 2023 20:16:02 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35EJiksd025685; Wed, 14 Jun 2023 20:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=0v0hiAtFb6JcdivZuJLRZlGtX7dJm82zMnQi6DelwmU=;
 b=jZCZHLrVoNlphs1oRXZ0n6daoOUAE6MrBY5AdAgMNlf7uCcAPqgsedqgsl7uDujwPKdk
 VK4LqO4ZwSMFYhCOLa9QBeZjTSTwgjkkFvegP3yiAqnZ81lE9NPG76U+dC2Hh4o0NX3u
 DF39CVGNy0yV52sLmtr+p6lOSREfyUCrAsNQbPB2Vh/QKS6PdAJD2lwf46IajmibJ6uW
 wxMLPuAbFAvg7N8zdfNu8Gi1/OEFHSWZEOFlxtMtyorRcRJn9L7sEy2aEuLUdwwXJdkD
 kDobr72f41MkirYZQibkAO/wI8tkG88BynFRYinagFeY0vDVtgJvoUn6qrkrGvMKgvHr Bg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r79dfsnhw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jun 2023 20:15:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35EKFsTv005215
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jun 2023 20:15:55 GMT
Received: from akhilpo-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 14 Jun 2023 13:15:15 -0700
Date: Thu, 15 Jun 2023 01:45:11 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v8 17/18] drm/msm/a6xx: Add A619_holi speedbin support
Message-ID: <kdnjx5djbohaesploldfqxntzvdsb3ntc3f3nja23hnpwvqp3z@a662zzhj6p7z>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
 <20230223-topic-gmuwrapper-v8-17-69c68206609e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230223-topic-gmuwrapper-v8-17-69c68206609e@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: YWzesRBz_gypsA66rNMESuwnPURK3mPD
X-Proofpoint-ORIG-GUID: YWzesRBz_gypsA66rNMESuwnPURK3mPD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-14_14,2023-06-14_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 mlxscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

On Mon, May 29, 2023 at 03:52:36PM +0200, Konrad Dybcio wrote:
> 
> A619_holi is implemented on at least two SoCs: SM4350 (holi) and SM6375
> (blair). This is what seems to be a first occurrence of this happening,
> but it's easy to overcome by guarding the SoC-specific fuse values with
> of_machine_is_compatible(). Do just that to enable frequency limiting
> on these SoCs.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index ca4ffa44097e..d046af5f6de2 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2110,6 +2110,34 @@ static u32 a618_get_speed_bin(u32 fuse)
>  	return UINT_MAX;
>  }
>  
> +static u32 a619_holi_get_speed_bin(u32 fuse)
> +{
> +	/*
> +	 * There are (at least) two SoCs implementing A619_holi: SM4350 (holi)
> +	 * and SM6375 (blair). Limit the fuse matching to the corresponding
> +	 * SoC to prevent bogus frequency setting (as improbable as it may be,
> +	 * given unexpected fuse values are.. unexpected! But still possible.)
> +	 */
> +
> +	if (fuse == 0)
> +		return 0;
> +
> +	if (of_machine_is_compatible("qcom,sm4350")) {
> +		if (fuse == 138)
> +			return 1;
> +		else if (fuse == 92)
> +			return 2;
> +	} else if (of_machine_is_compatible("qcom,sm6375")) {
> +		if (fuse == 190)
> +			return 1;
> +		else if (fuse == 177)
> +			return 2;
> +	} else
> +		pr_warn("Unknown SoC implementing A619_holi!\n");
> +
> +	return UINT_MAX;
> +}
> +
>  static u32 a619_get_speed_bin(u32 fuse)
>  {
>  	if (fuse == 0)
> @@ -2170,6 +2198,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_gpu *adreno_gpu, u3
>  	if (adreno_is_a618(adreno_gpu))
>  		val = a618_get_speed_bin(fuse);
>  
> +	else if (adreno_is_a619_holi(adreno_gpu))
> +		val = a619_holi_get_speed_bin(fuse);
> +
>  	else if (adreno_is_a619(adreno_gpu))
>  		val = a619_get_speed_bin(fuse);
>  
> 
> -- 
> 2.40.1
> 
