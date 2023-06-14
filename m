Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBE47308C4
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 21:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBB310E109;
	Wed, 14 Jun 2023 19:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B1E210E109;
 Wed, 14 Jun 2023 19:50:47 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35EJohhn008327; Wed, 14 Jun 2023 19:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=5QQGspG3g+2JaPYjv9lq5YgPV0Br5XZHNqjGJ39Hy7Y=;
 b=Bah/WaBSozLpgoUjzq94YAyWiLOSKiN4RPl1XHAsf7zLDBmqd8tPYrhig8TCeCT4QgDU
 Z9URQUkbPvXA54fk/4z0MQEiUJgPyNYg/ZLl4zAFb4L/VgSeU893YpnyGuJLQWNthXqP
 E3ihQ8m5LGdERBQhZQarCxxrRyvl5Drf/rU7V3cix9Ww+8R3mZQXHwPo4Xpj9Lqmcv1M
 I3/Uli9OkWQHIAzBNB+4ea6bMu+dqjSYbH+zSq6ToSBqJ42PI/2A1R57mHoJ8XStSifI
 zMVT0o85TfaIJLA+fA5B+Q/R8RLbD7gGG9ZOS6hHGaWDW1pncU9SNJz7pmecY3K/Rtp1 Gg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r7ks680st-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jun 2023 19:50:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35EJoHqA002831
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jun 2023 19:50:17 GMT
Received: from akhilpo-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 14 Jun 2023 12:50:12 -0700
Date: Thu, 15 Jun 2023 01:20:09 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v8 16/18] drm/msm/a6xx: Use adreno_is_aXYZ macros in
 speedbin matching
Message-ID: <u74y24z3jmklfyx7zvmiw3oakejm3t253tcs2kmrupl6l3qqpa@3rsubk6pkz5b>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
 <20230223-topic-gmuwrapper-v8-16-69c68206609e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230223-topic-gmuwrapper-v8-16-69c68206609e@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 75qc-1zx_NpXC3zHzMSNdYL5rpXtTRQE
X-Proofpoint-GUID: 75qc-1zx_NpXC3zHzMSNdYL5rpXtTRQE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-14_14,2023-06-14_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=878 bulkscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306140174
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

On Mon, May 29, 2023 at 03:52:35PM +0200, Konrad Dybcio wrote:
> 
> Before transitioning to using per-SoC and not per-Adreno speedbin
> fuse values (need another patchset to land elsewhere), a good
> improvement/stopgap solution is to use adreno_is_aXYZ macros in
> place of explicit revision matching. Do so to allow differentiating
> between A619 and A619_holi.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 18 +++++++++---------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 14 ++++++++++++--
>  2 files changed, 21 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 5faa85543428..ca4ffa44097e 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2163,23 +2163,23 @@ static u32 adreno_7c3_get_speed_bin(u32 fuse)
>  	return UINT_MAX;
>  }
>  
> -static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
> +static u32 fuse_to_supp_hw(struct device *dev, struct adreno_gpu *adreno_gpu, u32 fuse)
>  {
>  	u32 val = UINT_MAX;
>  
> -	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
> +	if (adreno_is_a618(adreno_gpu))
>  		val = a618_get_speed_bin(fuse);
>  
> -	else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
> +	else if (adreno_is_a619(adreno_gpu))
>  		val = a619_get_speed_bin(fuse);
>  
> -	else if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
> +	else if (adreno_is_7c3(adreno_gpu))
>  		val = adreno_7c3_get_speed_bin(fuse);
>  
> -	else if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
> +	else if (adreno_is_a640(adreno_gpu))
>  		val = a640_get_speed_bin(fuse);
>  
> -	else if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
> +	else if (adreno_is_a650(adreno_gpu))
>  		val = a650_get_speed_bin(fuse);
>  
>  	if (val == UINT_MAX) {
> @@ -2192,7 +2192,7 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
>  	return (1 << val);
>  }
>  
> -static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
> +static int a6xx_set_supported_hw(struct device *dev, struct adreno_gpu *adreno_gpu)
>  {
>  	u32 supp_hw;
>  	u32 speedbin;
> @@ -2211,7 +2211,7 @@ static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
>  		return ret;
>  	}
>  
> -	supp_hw = fuse_to_supp_hw(dev, rev, speedbin);
> +	supp_hw = fuse_to_supp_hw(dev, adreno_gpu, speedbin);
>  
>  	ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
>  	if (ret)
> @@ -2330,7 +2330,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  
>  	a6xx_llc_slices_init(pdev, a6xx_gpu);
>  
> -	ret = a6xx_set_supported_hw(&pdev->dev, config->rev);
> +	ret = a6xx_set_supported_hw(&pdev->dev, adreno_gpu);
>  	if (ret) {
>  		a6xx_destroy(&(a6xx_gpu->base.base));
>  		return ERR_PTR(ret);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 7a5d595d4b99..21513cec038f 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -268,9 +268,9 @@ static inline int adreno_is_a630(struct adreno_gpu *gpu)
>  	return gpu->revn == 630;
>  }
>  
> -static inline int adreno_is_a640_family(struct adreno_gpu *gpu)
> +static inline int adreno_is_a640(struct adreno_gpu *gpu)
>  {
> -	return (gpu->revn == 640) || (gpu->revn == 680);
> +	return gpu->revn == 640;
>  }
>  
>  static inline int adreno_is_a650(struct adreno_gpu *gpu)
> @@ -289,6 +289,11 @@ static inline int adreno_is_a660(struct adreno_gpu *gpu)
>  	return gpu->revn == 660;
>  }
>  
> +static inline int adreno_is_a680(struct adreno_gpu *gpu)
> +{
> +	return gpu->revn == 680;
> +}
> +
>  /* check for a615, a616, a618, a619 or any derivatives */
>  static inline int adreno_is_a615_family(struct adreno_gpu *gpu)
>  {
> @@ -306,6 +311,11 @@ static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
>  	return gpu->revn == 650 || gpu->revn == 620 || adreno_is_a660_family(gpu);
>  }
>  
> +static inline int adreno_is_a640_family(struct adreno_gpu *gpu)
> +{
> +	return adreno_is_a640(gpu) || adreno_is_a680(gpu);
> +}
> +
>  u64 adreno_private_address_space_size(struct msm_gpu *gpu);
>  int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
>  		     uint32_t param, uint64_t *value, uint32_t *len);
> 
> -- 
> 2.40.1
> 
