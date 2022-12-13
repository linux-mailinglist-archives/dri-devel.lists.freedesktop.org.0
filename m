Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9799064B033
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 08:08:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0303710E2D7;
	Tue, 13 Dec 2022 07:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA6010E2C8;
 Tue, 13 Dec 2022 07:07:15 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BD6HboH008632; Tue, 13 Dec 2022 07:07:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=loXd4sKnl9c27l7Xp+zJ+XQQW0vTj4Ys4XUUdw9ZWr0=;
 b=QyKpBrynFPn3drqpLF1bdUUsybWxacFv6iC3jafdfpi2kxAbpo0OvqeiWDFL6Fsnq1Uk
 NVFkoOtlLDUHjOGlt3ftx11RDGC55X8d1EU7+TuCECndhQCp5pumHIyE2ucKhYxh5weW
 9vze7v8fOnM5Pw7WLLq5O1sSwkO5+7LOori7NrSZ6Kh/z6zZYcKNn+fwgHFGWjkDyKca
 PYiFDrffdfCKYrdCY14N1M3Glm8ha8l/wnk8UerNsisK2xirwkd8dURGEIP2qtS1gnaZ
 KiZcLq5L++qNX9CaLixWlSzgjPOhDv//irFxrCpkjpuj3jfMhA8rxuy3hLRNc1vWJBh3 Rw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3me83sj29y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 07:07:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BD778Bj019000
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 07:07:08 GMT
Received: from [10.216.17.160] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 12 Dec
 2022 23:07:03 -0800
Message-ID: <3c017429-15c6-11d0-9aef-c718a39d87aa@quicinc.com>
Date: Tue, 13 Dec 2022 12:36:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 3/7] drm/msm/a6xx: Add support for A640 speed binning
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <linux-arm-msm@vger.kernel.org>, 
 <andersson@kernel.org>, <agross@kernel.org>,
 <krzysztof.kozlowski@linaro.org>
References: <20221213002423.259039-1-konrad.dybcio@linaro.org>
 <20221213002423.259039-4-konrad.dybcio@linaro.org>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20221213002423.259039-4-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: MrJ4nlK9qg5HEWa8kw7rAuhUmlOxUr6O
X-Proofpoint-ORIG-GUID: MrJ4nlK9qg5HEWa8kw7rAuhUmlOxUr6O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-13_03,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212130064
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
Cc: freedreno@lists.freedesktop.org, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/13/2022 5:54 AM, Konrad Dybcio wrote:
> Add support for matching QFPROM fuse values to get the correct speed bin
> on A640 (SM8150) GPUs.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 36c8fb699b56..2c1630f0c04c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1877,6 +1877,16 @@ static u32 a619_get_speed_bin(u32 fuse)
>  	return UINT_MAX;
>  }
>  
> +static u32 a640_get_speed_bin(u32 fuse)
> +{
> +	if (fuse == 0)
> +		return 0;
> +	else if (fuse == 1)
> +		return 1;
> +
> +	return UINT_MAX;
> +}
> +
>  static u32 adreno_7c3_get_speed_bin(u32 fuse)
>  {
>  	if (fuse == 0)
> @@ -1902,6 +1912,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
>  	if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
>  		val = adreno_7c3_get_speed_bin(fuse);
>  
> +	if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
> +		val = a640_get_speed_bin(fuse);
> +
>  	if (val == UINT_MAX) {
>  		DRM_DEV_ERROR(dev,
>  			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>


-Akhil.
