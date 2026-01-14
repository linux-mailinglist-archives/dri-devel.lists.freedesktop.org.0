Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A118D1CCD7
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 08:21:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF7810E5CA;
	Wed, 14 Jan 2026 07:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvGWSc+M";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jKdyYJ/g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28CD610E5CC
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:21:48 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60E65wqQ2631956
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mGua2V69u9ZPUxAilzeukZAAVkpOgN6IHQHMHMdlgeM=; b=lvGWSc+MdI+XfEAl
 O0tX2sTXTqZIrLDL8P5OkdFw+MwRsZyDEmsrVgvhr1nLT7F0LjOv8GUeD2+U4jKO
 Imjo1oMDeFUgeQo/JEQitkGDHQdBWjsZO+eK95RRxNmNaePE6FLlXayJbNI7+fE3
 53QM2wRTOsmCcpL+QqP5Zm3SENpt0fK/zkkStwMvuoa0R4VXqITHwdcgrkEjcsRG
 1WoCB+AcrCPGOG0uZ41d9jny9bGwSqUgcCB/42d3kEnO1Jf5exxs0puMvbeljbKC
 CWYwmHTORpuTbe0x1tgAqLbhpcnFoe3A2c8b56eZj13lB2eFIZcM7Aii0EijV5zB
 e1rNVQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnuk928vd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:21:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2a0f47c0e60so58075905ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 23:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768375306; x=1768980106;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mGua2V69u9ZPUxAilzeukZAAVkpOgN6IHQHMHMdlgeM=;
 b=jKdyYJ/gDwXoGgt6Z8LAdEuO/rjPO8GJNRveSyeeHBZHRNEV1XkCfWYotx+sXZxF90
 w+0jBXDA5YS3VPzDyTQahIR9pLASQ2wvQ8hwhB1YK/c922LwHDOytUDA0/eTP2EQdJiT
 x2gb3UOEHt9HFbR1tO8cyeX5F3mQ3Xk2NbXs1iIQH0j0gd5nOf2LjKCGyQtyOzKHfhFq
 Mg/EiCFJJCCf+50LlH8C/h9dIBoI7m2RkVgPS6PDZD0Kvk/F96fScoY7AWbLwRN3RQzH
 WEzlMn/0dECmxU92fk9i/0nYfLhTui/GY4acNZtJL+blvJxlBjSxVcqPYrKR8ExZeIBl
 8b5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768375306; x=1768980106;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mGua2V69u9ZPUxAilzeukZAAVkpOgN6IHQHMHMdlgeM=;
 b=WL3nlVmw62h5MSoxLZ70xkYJ6q6IifwI89P5UvzqwUCllUfR+O0EkII4uBVJ1fnSDE
 Ettn42rBOZyhnkimxoKtzpRbLDiKoK+PCQuglaNFqR2gR4PSafR3B/W38IXl5gULhsmC
 jEkwgu7WcBvsDoJlWfFcx8WsAbHWXG8GPL0TpYAjqoFXFK8tca8MRd5bBm2DFV0z61fR
 2pxip1bAbQpHR9HO9K+NKxAS9RAzkHIZ1LXhMhISESqb8DlrPtVMoFaimqf9Nf7Dc/KI
 MIUGsIkdlnIiBgyy7j2a6xYQXD91ghBVYnmkyazbseoX65QKu2WMMdN1U0z8gbyCHhBp
 QOGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8LivTir0nuhuADWG1l+8s7lHswDBkTrmOlasoYxGxwlYj3xi85AK3BocEf4zByiQvEDea+FS9hqY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUaQJuYLyEymekOzIVhs76vyjnV7zz9HNCnSuM7KhmDad0zM2N
 AjT8s3Id38jj/az822ZzEU3o3h4utfzDg5c2jrNC/DMU0J+aLVjgnZYUAP0w6jzNv6ToAcLpUWB
 xc9Ra8bx8tr7dZRMGg+enG5xDdkdB/wUqN8lzLCAw1SkYNoHwzxqIrECC7Y3UxDgaSNCneU4=
X-Gm-Gg: AY/fxX5KNFCut0wCr3JIuMl/LsZjagwRDAxOioVEVzkHBw3fbbLFRyTvVODXjoMLJtd
 /2zoEgRe8cqJjETz/3kPVmiyzW1UCniLEXB1wyihoGsnLSwxe1iHWl62ImWe7c57cRhpoHxL6ws
 HWNOxkQ5x8X800uj4oxnUmn9FfgTdQxgRf5P3jma2fpLKTAe1szWxOF2XEKPWjM7MUx8FVAHE71
 w9kCKN1bUrwWm26g1Iqs/t9+Y930lwpfOkDZOGt30ppdGDk0qe23rU8v9LjQNJGplUs3pCbWIo/
 Mzz4Dgnx51a7yYN7msvI7/lO7XLxRAcR6tf1Y8IlOU0HA5pl14wPThDXX397rsGHQqinzWAXt96
 +JdjCPc0eZpey1imnLqkmxNBvAMnSCG4ZqYxlrb+wpEch
X-Received: by 2002:a17:903:19e8:b0:29d:7b9b:515b with SMTP id
 d9443c01a7336-2a59bb74387mr12706555ad.20.1768375306041; 
 Tue, 13 Jan 2026 23:21:46 -0800 (PST)
X-Received: by 2002:a17:903:19e8:b0:29d:7b9b:515b with SMTP id
 d9443c01a7336-2a59bb74387mr12706145ad.20.1768375305597; 
 Tue, 13 Jan 2026 23:21:45 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3c48cc3sm220685455ad.39.2026.01.13.23.21.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 23:21:45 -0800 (PST)
Message-ID: <4eb4818f-115b-d0af-cfc8-109984190f5d@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 12:51:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 02/11] soc: qcom: ubwc: add helper to get min_acc length
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
 <20260113-iris-ubwc-v2-2-4346a6ef07a9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-2-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ebQwvrEH c=1 sm=1 tr=0 ts=6967440b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=o9KUHpD5kIPiLnKsU4kA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Uw-GiTlYML7N7O_IYMRLGPa8nm9m78Wg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1NiBTYWx0ZWRfXzdw9oCgLq175
 3i9EHW7QpU2Bg3dv236S0mw1rMZVltL+UU0YOarZ6NyiARnbzDbppCHNqxAoVS0lv4mewcdzBc4
 bFoGWdUOxwRFYQ9nR6abq7vav2tndJpK1vE0h1AIO+sOdN8YJpFzFeNcI0+O9W7ynfr8iEGkKG3
 vyLu5hNiPOUHlc1+z9eCRgiNmOyp/8fPWOyfdKCr21VAl3Hht1ZSS2XaMAvzYn06KAMU/rv0qtn
 JUY9kUICLTgCVNwBZhl6drAXu+EcfG7ZhfjamkY2K+RE2Qfilariomju3BZidUubhEf/urseoLW
 TyI1RYpkT1TLY0n+Rt5+U5rgyQxEH8oefNP7lH8UaNHWMR+INawmN+XcyZEGo6idjiy3v1iAh9/
 Z/fzUbXOxk/sD4eXpm6H26xNoEFtSAR/M6rrSIxzcR1LTYj9L4hDPmPwig4JsTFoXDmm6TyxuOb
 HKQwFG7lEhPRBo3vbvA==
X-Proofpoint-GUID: Uw-GiTlYML7N7O_IYMRLGPa8nm9m78Wg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140056
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
> MDSS and GPU drivers use different approaches to get min_acc length.
> Add helper function that can be used by all the drivers.
> 
> The helper reflects our current best guess, it blindly copies the
> approach adopted by the MDSS drivers and it matches current values
> selected by the GPU driver.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  include/linux/soc/qcom/ubwc.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> index f052e241736c..5bdeca18d54d 100644
> --- a/include/linux/soc/qcom/ubwc.h
> +++ b/include/linux/soc/qcom/ubwc.h
> @@ -74,4 +74,14 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
>  	return ret;
>  }
>  
> +/*
> + * This is the best guess, based on the MDSS driver, which worked so far.
> + */
> +static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
> +{
> +	return cfg->ubwc_enc_version == UBWC_1_0 &&
> +		(cfg->ubwc_dec_version == UBWC_2_0 ||
> +		 cfg->ubwc_dec_version == UBWC_3_0);
> +}
> +
>  #endif /* __QCOM_UBWC_H__ */
> 

Based on what I could check from video side, above looks correct.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita
