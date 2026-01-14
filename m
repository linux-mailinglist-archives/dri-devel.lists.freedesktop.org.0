Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C207D1CD49
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 08:28:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9458710E5CD;
	Wed, 14 Jan 2026 07:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hFw7N+yR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FnVFQNCk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30D010E5D1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:28:27 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60E65wNL2816203
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KdMG9WA+kJ7VqYbxQxfdg6qolJCk+4/maOFlurAClgg=; b=hFw7N+yRkHjxu+g/
 3URn+CzxOvP3v0Q+MBUanCZVI9eKOBF1UazHmnnOtSQAaJODueuzlsnpmi8d1iT/
 3klzaZ1vYYM/DbS48JYPjxIbZfJfbt12JQuj0WCMS0+I1/CNEe/GEqR4StfcU02E
 2BKoe9eoLlKYP5GzxDGSmowClBun+5ASjJX9ZbD8Q5xZccC+LRo57cNG9SK2gubr
 zYwgaMeBvfmHxNpi5eWfDCTJVe0YKAqRiOX4tQT+C7HWjzpFpaYzKJ/bmO7rPrK9
 4TQnamMPUyqUd7ep+cqp+dnWTrwviAIz6XAma9XhKLSjk+q8OP3pCNfPbsMKCNIL
 3qdAog==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bny89hj0v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:28:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-29f27176aa7so123033095ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 23:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768375706; x=1768980506;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KdMG9WA+kJ7VqYbxQxfdg6qolJCk+4/maOFlurAClgg=;
 b=FnVFQNCk+nYNn1HXp1DODuoaW/bgJL6cSJ/2u88Y001XofMrTMnhpiU5rq/CMJG1yW
 T8s9QACloBaxsvDbPIJiJZYsDmYhGQeidilPvzPHoQJxr/d9IOtyXzi2/Uf1rXxBNpr9
 f9A2d1QYzrp367GF9CFa3nSW2L2g6dVZmCYtZk/fDY1JhQtDL9CXo7PDDTs1ymETjx9o
 Bk1P/UOU+griH3DwsSrvgN+ry2HAQEB8YrmYv9+23FCDV6hbX+jbdy5XodyFN5i4uBCg
 9E+kDqxuAgXX2CccLfD7miXnPGqpDMDgq0KnOj5FCVaAEY3mnHu0IIGgIoMW2wxps4mr
 UynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768375706; x=1768980506;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KdMG9WA+kJ7VqYbxQxfdg6qolJCk+4/maOFlurAClgg=;
 b=DjdCPHb6gATZKKKfDJNT5UpsAk7Pz3JCAoQJ2DMwvPMJbnQmHKbfRQqSRbA8mFxbsx
 PqieVKNp8qR+I2hiztfBUGG5TVbDpFqTEyHYPSfG6zYB2jmXOvRk1W6OLLRiD7BCco97
 0wk5O+T0cYoSg4TNxTVpDfqEwYPcvPdz93Zg9XwTP81JpWQ8fKX1OaKiz5wjoHjw/vmx
 lSXAaQkMFr1MbgQnOHIHHnWA98LIC1calLfJmMK66ad0SP8LsxHbfq9xj4ZDIm5eYpyN
 W8OllQHUuFU23s2i+WfxAewtPga064CY4oPZaCXfJ10XfY1EJ4A4Uv3jO4smDuQfXIya
 WPAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFc4Vo4rbHqG8HHOQwFJbeePcCRAM7z1Kw5PuvCZ54/0fDhHEL6kyh4NcWLIhgZnX2pMLsuHZ9vTw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTtu60ZTKkIhwayE2mYstKG+0dgBCAvHM4wB9Y6xnTql5WAW87
 kNW+G/87+eCtqGFglDIfUiT5Tdvm6SJ+UEDqMacMVrAJb7VR1p8Dsm0ZDQHQnINOl4jORaNPTUq
 0IlZ1xAVWUGlMoxfXyRAQCvTTJVd+6nZirmWsIbTfcqkZ777+IEBFw2mWp26CD7ZLmZgLNhg=
X-Gm-Gg: AY/fxX4Vz3EDwSfC9P3UwK7uOQKNv+WyigxwE36dzF8Pvqyrx6tjY3iV9fKZb4Q2YVU
 TzpJBnTZpmfEnNyNuwYfCVCjwO9XUSEp6VXvwb6oX6L0oIvW1t+mLPJvHNDwM6ce7Aa+hX6Dvvp
 fTBem8X2KwEKQz4DZ4GwwPvW4djU3aD+5qEMUXhGfkgQgZh7eWq95xDNuD+aGQoqbpv9lpNTOzu
 kX+qDEFur2d2ASHQvyHZVjIaqRvk49JTGkASG5sBhtVMQhpvNKENDklGm9VS+i7pEB+vWIqGzuO
 vdTn7EqANAj20/6P9gvMTKX+xwxY51kUSu4Kgci9pGzzwxZ0TEOi16BkTGOVl6jA6RHIX7Ygyai
 h/xc40lhXQXYMlZr0stHk3qQdPAfldm9KDHqth28D0FKF
X-Received: by 2002:a17:902:d4c5:b0:2a0:b02b:210c with SMTP id
 d9443c01a7336-2a599da501fmr16776595ad.1.1768375706077; 
 Tue, 13 Jan 2026 23:28:26 -0800 (PST)
X-Received: by 2002:a17:902:d4c5:b0:2a0:b02b:210c with SMTP id
 d9443c01a7336-2a599da501fmr16776485ad.1.1768375705647; 
 Tue, 13 Jan 2026 23:28:25 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3c3a560sm216788535ad.21.2026.01.13.23.28.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 23:28:25 -0800 (PST)
Message-ID: <b16abe0d-da13-ff3c-ec29-4e26981568a2@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 12:58:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 07/11] media: iris: don't specify bank_spreading in the
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
 <20260113-iris-ubwc-v2-7-4346a6ef07a9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-7-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1NyBTYWx0ZWRfX4DyxZgD6IHT4
 EKUwmydDrVh4W/5prH478ZBZTBHd+AUvGAfDpCs+h+ippvd8nAtKCxLs3u4z3sxEqin71rNBkFz
 ijvjPCB3uk6FLEfIatY6xuH2PZDK9CIDwWi9GlKDyT8vQBk4ugSt/7roKnIr5iGtfQ7dvvOS1cc
 7h7cTMpdindbVCT5JJV2n41nmsSPDbggMR0qY8H3aJUEiSYPI2d84Ig0Dz2tIOlBjJgYulcztF8
 Wu5Xt5xMZak1VdI7tvm28XfB2f2Qk/fx1DnzWJR2OsFtpmO1aUx41lXAKEx4a3lCQ+fOf7NP/VT
 FxoxIt/IL31a/SUsBQArNGb4WXKJScktM70QRprKQR4Yz3bxfagIUN7W4Oz9hKAwW26PX7FVtiS
 +br3+V/99VMbwvvUNEOgJ2MFXWPYY/OAuyiahtrDHR2NUrSQPmcVcrLBJhnmZ+MlBFIjehX7fc1
 2/4+4kfTDA5s6fzxnjg==
X-Proofpoint-ORIG-GUID: 6oBLUrv8M8IyID4mEiXp1EzNk1iylVNU
X-Authority-Analysis: v=2.4 cv=efEwvrEH c=1 sm=1 tr=0 ts=6967459b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=yL4243FK61EKG2Nsi2QA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 6oBLUrv8M8IyID4mEiXp1EzNk1iylVNU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140057
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
> The UBWC bank spreading is specified both in the Iris driver and in the
> platform UBWC config. Use the platform UBWC configuration instead of
> specifying it directly in the source.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
>  drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
>  3 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index a880751107c7..9945c939cd29 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -199,7 +199,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>  				    &payload,
>  				    sizeof(u32));
>  
> -	payload = core->iris_platform_data->ubwc_config->bank_spreading;
> +	payload = ubwc->ubwc_bank_spread;
>  	iris_hfi_gen2_create_packet(hdr,
>  				    HFI_PROP_UBWC_BANK_SPREADING,
>  				    HFI_HOST_FLAGS_NONE,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 9f9ee67e4732..f99fcbb8fced 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -73,7 +73,6 @@ struct tz_cp_config {
>  
>  struct ubwc_config_data {
>  	u32	max_channels;
> -	u32	bank_spreading;
>  };
>  
>  struct platform_inst_caps {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 0f06066d814a..c967db452dec 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
>  
>  static struct ubwc_config_data ubwc_config_sm8550 = {
>  	.max_channels = 8,
> -	.bank_spreading = 1,
>  };
>  
>  static struct tz_cp_config tz_cp_config_sm8550 = {
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita
