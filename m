Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDE6D1CDCA
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 08:35:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14CA10E5D0;
	Wed, 14 Jan 2026 07:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mOUvy5u8";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AghZoyOS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A01510E5D0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:35:16 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60E669gL2138939
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AGfARA3z8BONDY/2WKAVdBuRhb+NP2USjZMkAP5TPRI=; b=mOUvy5u8heDw6tUK
 WaCC5X1PgxI1b21NvrdkW+7V87Yabu9iN3s7zGRj9imEPhrZ/V3TAEBXe1tIls3J
 YOv4GzrAlv7a3PcaCcTINM1O2PqxEiM1pxlk6JfkQS1bmkT8cCbPfkZKMjKf5WJO
 JGcagbhXal0yS14ltDvbraqmpslE/MpaDtdCqlrY6Il6kM6LGQJK3pRNPS9YKyuA
 6P9z8VPor9F2KtCY8Iy6yHGQPlFj+OK8cx4Ez1WGfzPKY5vDsSuzehx/pQ37Q16g
 fCs7S3tQVEnq0m1kazfHpM7WrumT2jcASEMc9sdxkniofVJObsZaHNbvsi6Ggye3
 F+hS6A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnm0duwxp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:35:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2a58c1c74a3so15206305ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 23:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768376114; x=1768980914;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AGfARA3z8BONDY/2WKAVdBuRhb+NP2USjZMkAP5TPRI=;
 b=AghZoyOSLLSK/C87qqBwUiBts6PbE5dy2+KJ/8j+uRzE5BPw3QycKGlABez74AASvU
 hk/qtEv1yhZcDiVM6YZdHvxtmV4XJMamQCBiInetTLQxN5UUARwQS8ONCt8UQIlyci/u
 MBO+cKG5o1qqL3WgLBrt49iR9r7anRaR3/SlR33sRVsDmxSeeDAbw8/YPrHcPx+kja4C
 q/+1+6hUlQ86z+Il2gQNmQyY5LGMduCGC4fQ6vPSqtUuQSzQZXRwT+nCNUkkNq4mkge3
 ZgOxyyvstI/r9I48ZTrRHNa5JIcJslzMdltgclHzqiE8CvsV1wHJp9P6J8C3dsYadPfq
 RWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768376114; x=1768980914;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AGfARA3z8BONDY/2WKAVdBuRhb+NP2USjZMkAP5TPRI=;
 b=DEylq7wn2YEs4dHwJNShOBrSbOXrcYnTn18x0KNywzXsESiZeAxGiXRL8bUAiaKQOC
 91B00cW1ZFbtMrA+nKxsR34hEqGKbZRyJklFmpFWngLkvZMsAPRvWsM5ysn5WbLoR6P8
 T7Z0+kdeveAPuvhgFux3mvpi/UG5mkdR9gdq8YIjX94x/lNDZ6AhMyPczI46+cTE6wsT
 r7gMeJb/V6RZIReo+g3XsN60v0tbsTjqF6C+alnaq4cALGMpAN5jp+GB1rj4Q/3bZZnb
 CkfffMH2zUGOtw/Xa1SXk0Hoaix2wN6lj/b3Tf/W6ApvwBvlaSzH0vxmksnLO19SZrg9
 HsWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAdfySLSJvhShA7WSYXIy1a5iu6Y3b3Xn7e3t8CM7V0IhHOvlzPJNLdZK6RizxNPQ1MsGGEo8XyQA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTQmbpzFkVBfeEEjq8YVfMwOfTLwsJmWJnoePZP/KviWnxadKJ
 TF3kR6UVLdznPoLlU3ci8vxvHjR1qcrX0LCxF9AU+YkAPTeMoeV7PqDHI9IqBIq84mC/RBhqoj9
 0HXMNhBZ7U2LBMkmAXHRw/JBkX/qo5L3SxorESCG5XwPMnGIoHt0PjTX6naqx+6Oozxqpous=
X-Gm-Gg: AY/fxX5fqmrq7qOHOeJ7uNarq+gThTIiP6wTIQq4qmMW19p5MCeLpNiEfliLXFyJT9+
 yQfMGD/8HSzTZVQN5UNbrjxdZso1s0OHd5q4PcEx5wmqTGLR1gRA7boqU6hgqqks3ODIn6M5UyN
 rkUNbu7rbLWGrgdBFV+IUw6b93MVUjzCexnC44ja1o9LbWloP9Q2x7BIfBb3doXdvnO3NkM2++I
 Ft7pe/rKZAqBXQUEStAzCzZroXRWx/07uaYNmTk9KOCVclvF5YVLBRI1opLEGVGld5AEnOAIe+d
 /C6jA/TETJv/h38y5g4sVKaV3cZMcvdXoQGimiNf3yKl2uY1fiKnvgPfAJ0X6kLWPMMxPzA/SL7
 eHBOQtg0lq+TAZc5n+EMN+83QBvzoq63MLw0Uenx3/dPi
X-Received: by 2002:a17:903:1510:b0:2a1:3ee3:c6ae with SMTP id
 d9443c01a7336-2a599e697e0mr21455255ad.59.1768376114010; 
 Tue, 13 Jan 2026 23:35:14 -0800 (PST)
X-Received: by 2002:a17:903:1510:b0:2a1:3ee3:c6ae with SMTP id
 d9443c01a7336-2a599e697e0mr21454945ad.59.1768376113468; 
 Tue, 13 Jan 2026 23:35:13 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3cd2b3asm216764535ad.88.2026.01.13.23.35.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 23:35:13 -0800 (PST)
Message-ID: <66f99363-046c-85fa-0cf2-05f45755532b@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 13:05:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 09/11] media: iris: drop remnants of UBWC configuration
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
 <20260113-iris-ubwc-v2-9-4346a6ef07a9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-9-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BYXVE7t2 c=1 sm=1 tr=0 ts=69674733 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=mgZWc8mK_52uscwXSFwA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: o5vnBckwNoKNQGy2oJhnYjvnX-Ts54QC
X-Proofpoint-GUID: o5vnBckwNoKNQGy2oJhnYjvnX-Ts54QC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1OSBTYWx0ZWRfX2BL49oX64ygE
 IEg5yUUNYE1PJMfbH8ytvsBrzeJKLwuH04p0BS3THNL9+NAZNHepEvor87IuxoZmpx/rPSNIg0C
 rha0STYIDwdTHl8Dvrsidc/he5VURvyga1/R/9EsiECqd4Bm7cyPOXmOtfMIh9huYY2do+5OurI
 YwTk28kI7yGJYjO5xdsXHdKvbSwq5XPn4Ol+ym00hEm5NvsWDzzFE7vlALmQNG4EAy57OTF9Jyj
 KTSp1Lawq2q1UA5wer0XalM/zZAJpJl4EgU41NRgn9qMqg3Out7rc5HLLcYMcskuEvBHfCM4b7+
 yaQdou7zTr8cHQajuXJwP+0bfRthUSX4XnMD7T5ov1GHMyTxeHYaZQKRNvY2m1WW6Mx/AKieJXk
 idHNq047CdLE0JyeLiTYfV4mBHolA6IDNDpUNLNItU19Pj4rw921N7O2bTYFvenfjKPvmytnRxd
 tVWx/6NkJ4I7m57JYmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 impostorscore=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140059
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
> Now as all UBWC configuration bits were migrated to be used or derived
> from the global UBWC platform-specific data, drop the unused struct and
> field definitions.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_platform_common.h | 4 ----
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 7 -------
>  2 files changed, 11 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 4abaf4615cea..3b0e9e3cfecb 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -71,9 +71,6 @@ struct tz_cp_config {
>  	u32 cp_nonpixel_size;
>  };
>  
> -struct ubwc_config_data {
> -};
> -
>  struct platform_inst_caps {
>  	u32 min_frame_width;
>  	u32 max_frame_width;
> @@ -218,7 +215,6 @@ struct iris_platform_data {
>  	struct tz_cp_config *tz_cp_config_data;
>  	u32 core_arch;
>  	u32 hw_response_timeout;
> -	struct ubwc_config_data *ubwc_config;
>  	u32 num_vpp_pipe;
>  	bool no_aon;
>  	u32 max_session_count;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index e78cda7e307d..5c4f108c14a2 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -631,9 +631,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
>  	{IRIS_HW_CLK,   "vcodec0_core" },
>  };
>  
> -static struct ubwc_config_data ubwc_config_sm8550 = {
> -};
> -
>  static struct tz_cp_config tz_cp_config_sm8550 = {
>  	.cp_start = 0,
>  	.cp_size = 0x25800000,
> @@ -760,7 +757,6 @@ const struct iris_platform_data sm8550_data = {
>  	.tz_cp_config_data = &tz_cp_config_sm8550,
>  	.core_arch = VIDEO_ARCH_LX,
>  	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> -	.ubwc_config = &ubwc_config_sm8550,
>  	.num_vpp_pipe = 4,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
> @@ -852,7 +848,6 @@ const struct iris_platform_data sm8650_data = {
>  	.tz_cp_config_data = &tz_cp_config_sm8550,
>  	.core_arch = VIDEO_ARCH_LX,
>  	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> -	.ubwc_config = &ubwc_config_sm8550,
>  	.num_vpp_pipe = 4,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
> @@ -934,7 +929,6 @@ const struct iris_platform_data sm8750_data = {
>  	.tz_cp_config_data = &tz_cp_config_sm8550,
>  	.core_arch = VIDEO_ARCH_LX,
>  	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> -	.ubwc_config = &ubwc_config_sm8550,
>  	.num_vpp_pipe = 4,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
> @@ -1020,7 +1014,6 @@ const struct iris_platform_data qcs8300_data = {
>  	.tz_cp_config_data = &tz_cp_config_sm8550,
>  	.core_arch = VIDEO_ARCH_LX,
>  	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> -	.ubwc_config = &ubwc_config_sm8550,
>  	.num_vpp_pipe = 2,
>  	.max_session_count = 16,
>  	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita
