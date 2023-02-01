Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C61416862E6
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 10:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9CA010E3D7;
	Wed,  1 Feb 2023 09:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BB010E175;
 Wed,  1 Feb 2023 09:31:20 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 311801M4020506; Wed, 1 Feb 2023 09:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=poMPKTkErIDSsr/9JLUflP7fyo2b0wsDzmUjt27HgZ0=;
 b=lBJ+hrC2vbjROp4YS/ho+xo0NvU9ZJPingNb4n+Sz+VZJzhIFZDzBM2VebkS7ySjho6Y
 NiM+AO3lOckQyzwsnKHOajj4sufYObYHNrDSrq8X3O81EcjufYm9ksUz+2hI2jrXATCD
 7pc6lM/UVqcClq4FIOUi+M9WfUxDcnblCKBD+l1fMzE5KdRyiJkDodyIscacrig0VHea
 R0R3QOlJ5/eqzphCk4LUOeTNAgMPIqY0xamVZ2b5+1HXgrRs3VAAXPYymfIvlxDtKBB1
 N8x7HUFCjWHiiL9b0Fo01i8vFld58pCJ/4YurfNYfUhrc5Q1gsOkQv/RC/VmY1S4aWgC nQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3neuwcbqg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 09:31:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3119VEdV007776
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 1 Feb 2023 09:31:14 GMT
Received: from [10.216.52.229] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 1 Feb 2023
 01:30:58 -0800
Message-ID: <3644f111-0d69-1006-f032-782e1b00cd17@quicinc.com>
Date: Wed, 1 Feb 2023 15:00:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 02/14] drm/msm/a6xx: Extend UBWC config
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <linux-arm-msm@vger.kernel.org>, 
 <andersson@kernel.org>, <agross@kernel.org>,
 <krzysztof.kozlowski@linaro.org>
References: <20230126151618.225127-1-konrad.dybcio@linaro.org>
 <20230126151618.225127-3-konrad.dybcio@linaro.org>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20230126151618.225127-3-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: KHR2-mIP4vS_NAFximysDwfT3Cw8d1NT
X-Proofpoint-ORIG-GUID: KHR2-mIP4vS_NAFximysDwfT3Cw8d1NT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_03,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302010082
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

On 1/26/2023 8:46 PM, Konrad Dybcio wrote:
> Port setting min_access_length, ubwc_mode and upper_bit from downstream.
> Values were validated using downstream device trees for SM8[123]50 and
> left default (as per downstream) elsewhere.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index c5f5d0bb3fdc..ad5d791b804c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -786,17 +786,22 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> -	u32 lower_bit = 2;
> +	u32 lower_bit = 1;
Wouldn't this break a630?

-Akhil.
> +	u32 upper_bit = 0;
>  	u32 amsbc = 0;
>  	u32 rgb565_predicator = 0;
>  	u32 uavflagprd_inv = 0;
> +	u32 min_acc_len = 0;
> +	u32 ubwc_mode = 0;
>  
>  	/* a618 is using the hw default values */
>  	if (adreno_is_a618(adreno_gpu))
>  		return;
>  
> -	if (adreno_is_a640_family(adreno_gpu))
> +	if (adreno_is_a640_family(adreno_gpu)) {
>  		amsbc = 1;
> +		lower_bit = 2;
> +	}
>  
>  	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu)) {
>  		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
> @@ -807,18 +812,23 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  	}
>  
>  	if (adreno_is_7c3(adreno_gpu)) {
> -		lower_bit = 1;
>  		amsbc = 1;
>  		rgb565_predicator = 1;
>  		uavflagprd_inv = 2;
>  	}
>  
>  	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
> -		rgb565_predicator << 11 | amsbc << 4 | lower_bit << 1);
> -	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, lower_bit << 1);
> -	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
> -		uavflagprd_inv << 4 | lower_bit << 1);
> -	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, lower_bit << 21);
> +		  rgb565_predicator << 11 | upper_bit << 10 | amsbc << 4 |
> +		  min_acc_len << 3 | lower_bit << 1 | ubwc_mode);
> +
> +	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, upper_bit << 4 |
> +		  min_acc_len << 3 | lower_bit << 1 | ubwc_mode);
> +
> +	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, upper_bit << 10 |
> +		  uavflagprd_inv << 4 | min_acc_len << 3 |
> +		  lower_bit << 1 | ubwc_mode);
> +
> +	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, min_acc_len << 23 | lower_bit << 21);
>  }
>  
>  static int a6xx_cp_init(struct msm_gpu *gpu)

