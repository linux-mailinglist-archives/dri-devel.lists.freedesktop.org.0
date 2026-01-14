Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7FCD1CD34
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 08:27:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2485910E57A;
	Wed, 14 Jan 2026 07:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DlXtE8ES";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O6ofWseB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D9210E57A
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:27:55 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60E66CfO2579076
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Y7k2tgjAg8hmeGu+ou2mei9nPjqC+aosoSBIaKA5fY8=; b=DlXtE8EStOut9Tqq
 c6QVOvtjFtFDyKD4kg3CVxU6TGHu49ALAFtucCUicRJBunj3hpxh40abnfwalanS
 7ChVNHvpU+oZ9l+Ap2MfqeGrKttPrH9UN0UZs254Oi0YwZ4Ux5rOGltUKkFbG1Zl
 P5yAQJXUz2roItr5ZHuI97jv0fiX+4UL/ekYYZUGhyp8tT/LH5DEdqyv2ZrOXgfC
 ywAIkbnIYRqdt5QUHdLOOhh8EvQfpVy/v0/A55cgXVD6trFsmSqCUXFwPtCQl2iB
 z51RlXlXoiiydUhAsBSGyerhJ6kQlWQHB2Yc9y8tCU2YiJBRAIe1rL8y9qXykVmT
 BpJDWg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnw7v9ucr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:27:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7f21951c317so5618822b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 23:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768375674; x=1768980474;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y7k2tgjAg8hmeGu+ou2mei9nPjqC+aosoSBIaKA5fY8=;
 b=O6ofWseBs9hCZ/Bz70k0L7+4bydvAR+XN4S+Y9VIKDZAL3+MOdrSonHdU2cqysjHY1
 JeXl6ibaZDGcqsm14/itrH0pMAQVk/DGQEOzpe+SR5O9ZzRnJrxmwTvCAH5Ir2f4j+mM
 YCWF5h/SBu+1AsoFsG0T0TJdg9t7XJmj3rpNXIcq/GMJqd0l8+s0Ls8bXLiDtbc40LIx
 8mvHtjQfHAkYLUgj7NipPFEbp6N2wEMrLr6kqzbU/SUfHCMWZE0tfFb40C5bhi7xN2WV
 j/5DogU9uU6tFObAfibOVKj93p4XMZ6a8F0s4o4h5UBpmVdDtyKgumlY0yBF0hysAI/3
 2p6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768375674; x=1768980474;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y7k2tgjAg8hmeGu+ou2mei9nPjqC+aosoSBIaKA5fY8=;
 b=rrv1W2pzrD5NA4gWH+3hpb6aHDwLf+ZzfWBGaGtm4YtICuToMpUPMYDIyy4953y82t
 7b1jWSF94vkdAtSvvawKsrik2MSpv9CPyVIyR33/P5Hz69fI7vue19ArzuB5v6lh0nJ5
 lm6qtV60HtYwENGyldJqUaOdY6i51JckuQ+/fvCvAfIenlb0z2hmBfF4SeZ+Q/xh/H5+
 uf/3Wjoj3ovt2WDz8gsDPFFCqTUx7pMlQJHhm3HRtM2FmATAOdS9L52OhA4uEHmM9K6j
 BcawEAqbFTFNKoAhzz9Nzed+VETxEsM9HqJZWrhNz2AXdjYL78NjIadAf5RIr6FJFVWQ
 T9Gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXH3e1wJjpTaGycFevVY8O1k18Fbg/L1a+COdkoLLcTlzMSXVWJ+KCY3K3UH9CjTjkMSb3VFhS8oaU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzX4BFh5ynkkQMH+9LIp6aOAk8RCkmv4fTx19g12qnWo/LKgl31
 /ogtGfJOHU6cKs73skgoF0VFakzk9NOaD0IT4XIixNEy7MATfjRhFhl7u5aIPKV2hyvvAnLy5oI
 U6R7pKmjelwIsMHp0zFQN4XVH/kUmp043mCynRJmPDrVbD4I3Qnr7JYoIwI/IcN2WTrKxc7U=
X-Gm-Gg: AY/fxX5gzR0wwkRvPJDbAI3I14zH9fNUzJUwOhga8QJ3FHqoj8IGJTrv/FccrTC87Nk
 IRBfg7dbqHTRx/LumhMgFR5MLnMbu4dovQefSt6Epe508g5ZktbE7Iu5bVQKRA2Ddrf36hIN8fN
 5r1ztUU4OuwP8FEgMXg6RYdDvpJv+zoGY5wB4GpY9jVAg0WAWk81k81Hpqm18zsfiqTtMmRCr5V
 WxCWr44D4cY1a6WHKcDpuMCc6EEY/LJEZFzAjzN78JyVv05pcqXcyNntgpxUZHIUGchcsKsyBUW
 /Ti8Eq8qb6rbz1qFsTsmSbrOJ7l0YeCXyLLXUn+g6mpg3+iegtmFRJVlQu5AsRe6bNuFucLC3yC
 FIVfN62pyxdBJIPogHhrZtNLXoDdU1vD8yljkMQe7YhVX
X-Received: by 2002:a05:6a00:1f12:b0:81f:52d9:5fe with SMTP id
 d2e1a72fcca58-81f81fa1bd9mr1478050b3a.33.1768375674455; 
 Tue, 13 Jan 2026 23:27:54 -0800 (PST)
X-Received: by 2002:a05:6a00:1f12:b0:81f:52d9:5fe with SMTP id
 d2e1a72fcca58-81f81fa1bd9mr1478023b3a.33.1768375673926; 
 Tue, 13 Jan 2026 23:27:53 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c4cbfe1ca24sm2855229a12.12.2026.01.13.23.27.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 23:27:53 -0800 (PST)
Message-ID: <a6e15ff8-d674-de9b-3892-5db3748f3bef@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 12:57:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 06/11] media: iris: don't specify ubwc_swizzle in the
 source code
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
 <20260113-iris-ubwc-v2-6-4346a6ef07a9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-6-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1NyBTYWx0ZWRfX/ys9m3zygQrm
 cLMW81D4kwyuvML4llb1+3qY6As5x5RnFpLOt/Epm2FwOxo3Fq8iKqMNj54+f69j6vnPFMGBYpA
 LDroF+1IfeK2Vgh/3H7ic0TwI4MeP7Y0Lx6xtygczir2PMeDVKKJJpFjCmPkugvRtDCO5z6WLwM
 0S2V3Rq3YKVV0TrsTA8gPIEbLpwlXxU/eapuCFVXlUBEEi2nuyFKmAJ7mJgQFw40aii8GKBDVQl
 cKfGOeNbZrhcRg6el9PidWOA4y5DGZ6QijhAHDmp3SSTgt6kH9K5c/Yb6cqiyBGSfgOlgjMVkv6
 ehp6ORI56YBgPV9Nbo1bdPEZ9gRrGx0eiwuAV5qrJr/rvEPxkWCz7zfbsHSaSyjc7SRYbes1nFF
 +jcR4f+cEqAaMTBwI9hVlAmErH44evMBQ8Kvw3jNoj4gEjtexab5lXY7L7HETKnH27Z54FjlMUP
 ZWQPBxtHOD7hFTp6rqw==
X-Authority-Analysis: v=2.4 cv=PJ0COPqC c=1 sm=1 tr=0 ts=6967457b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=rBqFcrSGyHFvDjdq3-MA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: PH7U8nFBTn8rIUXEGONI0jPiXmtZPk64
X-Proofpoint-ORIG-GUID: PH7U8nFBTn8rIUXEGONI0jPiXmtZPk64
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140057
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



On 1/13/2026 10:27 PM, Dmitry Baryshkov wrote:
> The UBWC swizzle is specified both in the Iris driver and in the
> platform UBWC config. Use the platform UBWC configuration instead of
> specifying it directly in the source.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 6 +++---
>  drivers/media/platform/qcom/iris/iris_platform_common.h | 3 ---
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 3 ---
>  3 files changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index a4e60e9d32a4..a880751107c7 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -169,7 +169,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>  				    &payload,
>  				    sizeof(u32));
>  
> -	payload = core->iris_platform_data->ubwc_config->bank_swzl_level;
> +	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL1);
>  	iris_hfi_gen2_create_packet(hdr,
>  				    HFI_PROP_UBWC_BANK_SWZL_LEVEL1,
>  				    HFI_HOST_FLAGS_NONE,
> @@ -179,7 +179,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>  				    &payload,
>  				    sizeof(u32));
>  
> -	payload = core->iris_platform_data->ubwc_config->bank_swz2_level;
> +	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
>  	iris_hfi_gen2_create_packet(hdr,
>  				    HFI_PROP_UBWC_BANK_SWZL_LEVEL2,
>  				    HFI_HOST_FLAGS_NONE,
> @@ -189,7 +189,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>  				    &payload,
>  				    sizeof(u32));
>  
> -	payload = core->iris_platform_data->ubwc_config->bank_swz3_level;
> +	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL3);
>  	iris_hfi_gen2_create_packet(hdr,
>  				    HFI_PROP_UBWC_BANK_SWZL_LEVEL3,
>  				    HFI_HOST_FLAGS_NONE,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 8421711dbe60..9f9ee67e4732 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -73,9 +73,6 @@ struct tz_cp_config {
>  
>  struct ubwc_config_data {
>  	u32	max_channels;
> -	u32	bank_swzl_level;
> -	u32	bank_swz2_level;
> -	u32	bank_swz3_level;
>  	u32	bank_spreading;
>  };
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 5ae996d19ffd..0f06066d814a 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -633,9 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
>  
>  static struct ubwc_config_data ubwc_config_sm8550 = {
>  	.max_channels = 8,
> -	.bank_swzl_level = 0,
> -	.bank_swz2_level = 1,
> -	.bank_swz3_level = 1,
>  	.bank_spreading = 1,
>  };
>  
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita
