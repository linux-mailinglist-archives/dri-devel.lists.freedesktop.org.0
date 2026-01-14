Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C061D1CD58
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 08:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8891010E5B9;
	Wed, 14 Jan 2026 07:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tp8n5oNv";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C5OyLNWa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42E110E5B9
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:29:02 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60E66DN12579079
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nhGxIZ9kW1OKAnMPXyr3he7wuhlzcR3uKNd2soiX6x0=; b=Tp8n5oNvR/Vtq7h0
 s0i5rW07+zZadJjA4M6DJhtHLgSxobKOhMHtUsN7Vr68Gp9nOY2ZgRuwCnkoutiR
 yPy9sM/sD2aTd6kry87EMhcx+TWEH+aMIr04oltlqr108KBf/Z0QBl/I+GPnt6K4
 VZi5CapUOJyrkynBYsqQMdvj2eXqRBjRor3+ALMRnVHlIBr0uK7hv++dUMsjzoU+
 QmaDGjQFzAXnphzMtty22l8jvj5WyNc8iyUMFjj2KS4t49Aoxa3qC5d5D/tjx+KL
 ApEzTnYT1wHM4bL+8AySWohl5z3tB3rQpXXXVVSfC3weJMiefojVnKoNkmkRHILu
 TKfBCA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnw7v9ug0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:29:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-29f1f69eec6so88342895ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 23:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768375741; x=1768980541;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nhGxIZ9kW1OKAnMPXyr3he7wuhlzcR3uKNd2soiX6x0=;
 b=C5OyLNWad/P2vJEfBRoX7VSeRZAKPpWlNNU9tAi2Q43hd6A9XdMZnBWqVYC/ExGWLT
 tQPfJztNUKLV1iHoN6lYaDXmwN6y/AuHloKwZ1pYPxbw8BDdsIj+zekNg8Z/RUmdhHJ3
 B10p/R2DpudqSUJC8f/LKYKI9C1LoOuzbqsqqVYNJFFxY1SGAFyldT+NSVYta4kMVnL0
 CTk3HCPIWWSHCeDZVJFaIiNDEKZ2CygpLyHxrIuSWQdLSqCXogD2Ziufe5zoMG0oWmKt
 TMNUghVcae+4NKyh8M/vA6kIhTKc3HZ7EtAF5kQGKdEgvwksHJx1zIvGDlmncpkO62DH
 K3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768375741; x=1768980541;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nhGxIZ9kW1OKAnMPXyr3he7wuhlzcR3uKNd2soiX6x0=;
 b=bDW4gvioJtSwDzDeI+QwrzGbMmFt2zYKXjzEGtbIprShpotctcT8N3WgKXbPSeRQrM
 1jw7kBu2W3WdfQ0oipk7mWBmZsFc0HFwrsqc6f6t9RSquUz2L02uxlNe+VAcaEH/rdsQ
 wWs7uGWU8hLMwWWOKnaLq9lSVwgRAMuW2R5mS3McUGaU+mALIlup2AROx0hdKsPmITNd
 lKr3pMwKd/Oex3xZkK1Dm0f1sdaUJ7u/wSHixaaAtRxKxIZa7b2kRcmfRbnEfl4lyiU5
 pmQkTceezA3GFOoft0+/WoWFzReg73OZE6BdHHfYOxAZu4vdAXS03YsyrJYHN7yVckKs
 nwNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFOPvasC80krdTuM8HvCYw3PtZfu1fEr7ezf05R/cMOXhClrEElxLptdZigIFKK8njPcnOyYBPYYs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyN6MqYApP81H6Lj6yGjdv+TqADGyYp6WFG7poSUo3BUgL9eYQ/
 VVp5XkrJXm8O3BKN1ObXAGD3viokRxFs96JwjbwykNntkZFa7OXlJXhvvZ/vxH2cKXIE0ImV6pA
 ogSBXzYB+b/5pbf0mecSRMaNOCPbzmq+MGQzjgYmr9l7fWC6WwjJwfy29TQf9oUhtAWEmWxg=
X-Gm-Gg: AY/fxX4wqgIFl46edFVFOBAN3K+439ou076UcPrM1R7Z8r6IkJJAEVBBTz7hr3ssSUF
 xNZ9pz4q25PfaJBUj7kr0aE7YgKOAmmvjj3NxEb+QknHKyydXjr4g6vo+YDxBqk9+eH6HYP8tR4
 PrkLz+UHxnq2PQVIlafYbGnBswr/k6O8rYDvxzdes3o07Fr6X4NJjZ6d+moEpjdh4HOwr7LpU1L
 8QIWG1yd0waJIlWfJukr4Pf5na9L1mgIpXidNY818OeAGlAVTMLmufsHNtQifh1g0Kxg/tDxIFF
 cVFn5cddXjgqs9xUr6bUMxj79mqm+k3eoD354Nd1HwvLqaU0s/slE9LBU6KB2270JvinLlM4wc4
 As0fA92qhm/e99o0UH9zXrj8GAjyKQU033Bt3/PNsMEWI
X-Received: by 2002:a17:903:40cb:b0:298:4ee3:c21a with SMTP id
 d9443c01a7336-2a599d826b0mr20847085ad.2.1768375741537; 
 Tue, 13 Jan 2026 23:29:01 -0800 (PST)
X-Received: by 2002:a17:903:40cb:b0:298:4ee3:c21a with SMTP id
 d9443c01a7336-2a599d826b0mr20846895ad.2.1768375741018; 
 Tue, 13 Jan 2026 23:29:01 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3c3a2f7sm223039555ad.16.2026.01.13.23.28.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 23:29:00 -0800 (PST)
Message-ID: <4124d961-b262-c75e-5e34-01be1edf7959@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 12:58:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 08/11] media: iris: don't specify max_channels in the
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
 <20260113-iris-ubwc-v2-8-4346a6ef07a9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-8-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1NyBTYWx0ZWRfX7Jm2bOW+bsTq
 Dce6a18qnM8PBUBPVk7JorASmBspWRN8T20Y9sZ699KehcUspZ+zFlon3qs0psu1hfv8RuIdXRB
 PsaltMC+IjnqTgtSXnIjtkhgl7JpwSMnAiKgMnn+aD9sWvVtdEGUwvXtQglovu3RfNMqFFV9ObK
 WAidETf1lNtPOMcxojcTfxFZeNkZsVCa/l5Uv0dAMFqzn3piFchFmTVypgIHZNt+N+0kDd0RckX
 n/T+B9k/r4TsMGpXgeEVWB0euaEGVIoDrb3B/UJvlM90f9AglQT8Sx6unvVCcIXQ4nYXMayPq60
 1Ah8jTBxcTJGi5Ijo9eCaecx1+Xq7Q/vXggmLwEg2dddNuC7l+bWv6e7mNYIGNmMRkKeQg18y0J
 HOj0i+v45WI/Cn425x6Sng8Ivb/aGZRsl0y6rDyi4aPeduxducVTH21sXwHyeGWub8Azl22IOiK
 S4jVjlhlISXylLMM1/Q==
X-Authority-Analysis: v=2.4 cv=PJ0COPqC c=1 sm=1 tr=0 ts=696745be cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=S5pdipytwMNRnYpo3tEA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: i5wT-31IpwBjq-mMHuECRERfi1Vi7iYS
X-Proofpoint-ORIG-GUID: i5wT-31IpwBjq-mMHuECRERfi1Vi7iYS
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
> The UBWC max_channels spreading is specified in the Iris driver, but it
> also can be calculated from the platform UBWC config. Use the platform
> UBWC configuration instead of specifying it directly in the source.
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
> index 9945c939cd29..91dbea4c6664 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -139,7 +139,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>  				    &payload,
>  				    sizeof(u32));
>  
> -	payload = core->iris_platform_data->ubwc_config->max_channels;
> +	payload = ubwc->macrotile_mode ? 8 : 4;
>  	iris_hfi_gen2_create_packet(hdr,
>  				    HFI_PROP_UBWC_MAX_CHANNELS,
>  				    HFI_HOST_FLAGS_NONE,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index f99fcbb8fced..4abaf4615cea 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -72,7 +72,6 @@ struct tz_cp_config {
>  };
>  
>  struct ubwc_config_data {
> -	u32	max_channels;
>  };
>  
>  struct platform_inst_caps {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index c967db452dec..e78cda7e307d 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -632,7 +632,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
>  };
>  
>  static struct ubwc_config_data ubwc_config_sm8550 = {
> -	.max_channels = 8,
>  };
>  
>  static struct tz_cp_config tz_cp_config_sm8550 = {
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita
