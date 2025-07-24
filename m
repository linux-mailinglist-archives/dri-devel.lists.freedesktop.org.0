Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5956B10DBA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 16:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F4F10E947;
	Thu, 24 Jul 2025 14:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nKqqmxhd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A53B10E947
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 14:35:55 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9YZ8h023211
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 14:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GJP5OrXYtaNIwr5c3QE7nQS8J5flRoXRt0htwVVshBo=; b=nKqqmxhdhfF6hIJl
 JlHtcuALY42H9cVgkN6/8wF1vLCv07fNq1T9kyur2pJBO1u+51WxEHVhzwD5Sy6s
 aeN7gXGM1t+h+ZEy4BoiLJMyWWdP3XEfUiUZrZXTBImWC7M62ZigRDh7bVq/fCkT
 CZlk/h8ggAd3NXqsY8kxC7Ceg/Ab7ZNtqzKXOTnNt4dn3NVSEFbSP/DO41BZnvEy
 2TET/tNm7pCgwYn1hqYYyNO8RXYoVpOMPJylEsQhrkUe2Wb5Z+zxL3urkZ8VSQfL
 HOhq3Gtegu4wXHwZ+hFdmEUaOQWh6LjCJfrJIlXL0Tf1ThQ9Qm6oG6z+BePA4bXh
 7Yphqg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48313kkqyf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 14:35:54 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-748e4637739so682157b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 07:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753367753; x=1753972553;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GJP5OrXYtaNIwr5c3QE7nQS8J5flRoXRt0htwVVshBo=;
 b=mkIdBTi2MNJsdC4/BKHARibPoSHyse2S4oLJsmgnXeDR2trz1PZE4W8ZHHyR/GacEd
 W4jcqdr4sUD1yDJqijdsnL36YIhrO36c64hi3vNGAeYn13v6/dJ+D8QfrbnlKVz0MHdl
 /QuK76C/H95nkuSL15GYcgUe+SWsTLcaSGTCzsKclNFsQEukqRlp9MhNrdToDG/c4k18
 7mViUuwMtuQY702W6cwVNzI2FT2BD2npwxjYi1QNQEIGJ+aNXETDBVvn1LSXLyTMKr+E
 msXkRjeXv4Rl3qTsk6WIWNvGvNTVD3Rvqcz/rukFPuVKijAae2qLtFiy1as7jWj0/Ojw
 u3MQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+h6QLr2l4gJOUm5Lzawuz+w+NqkvIrTgzY3Pgq/rqs2TsJvPcF8XA1lG/JlUlovfXOSmsy6Hsdh4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxz921vNcFkpvaiboUCEkfWSL1bOoQq6y6JvOT147XrkHSGvppd
 v/MR6BLRGVhZzK1BywxpCSTIBMJq03uUvrgtSJWyEA3bT7q2yvGW3jNSEL+ymKZR9+Mdaamm7sE
 6TkZcUd5HoWxxM5A+oLTNzCbgeaO2jYmaN3zbPiXUUqCjFM8KB0Lu7W0J6ladgUF/OeQRBlw=
X-Gm-Gg: ASbGncvQ4IYvWVIpyVthC1PSkVLgW88xh7SzqOJA6FywY87QkEm/yiHpM9I7NesXJhA
 CVUDfzIi3mJNQi79TMXoSEOBnRIacCRegjx4iT11XLR0l+P8TLqg+5dzybOZN0+0gRVfUaBIKm+
 rVWxNdeX0Scp2bfqqhFFNUa9+0uXrFgPeFEPguDQXXD77w7S07cSir0zErldEFR6ohO0AP//wZ9
 Hj/AsQP/BeHm1NehzD2YuXKuw9TXVfZvyWBMUJ3ii/K3tmHcGTziGT0sltkuqykuQ1gCVKDjo9Y
 RHIGsCsCl0QXtTxHKzQq9PLec530Vkn9NEfjLQXAWSkU9N+SDD2fh73OGrS+NA==
X-Received: by 2002:a05:6a00:8b8c:b0:736:4c3d:2cba with SMTP id
 d2e1a72fcca58-761f0aae747mr2193514b3a.9.1753367753116; 
 Thu, 24 Jul 2025 07:35:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErsxD0US8xYnn5Y59yyRl45GxrphsiOAnuwC/zARlLpy5inA5mS3Yzry3LPCBjaE+Q2UR4zA==
X-Received: by 2002:a05:6a00:8b8c:b0:736:4c3d:2cba with SMTP id
 d2e1a72fcca58-761f0aae747mr2193469b3a.9.1753367752353; 
 Thu, 24 Jul 2025 07:35:52 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.3])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-761ab41dfe0sm1775131b3a.0.2025.07.24.07.35.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 07:35:52 -0700 (PDT)
Message-ID: <ac476949-d0e7-4058-ad76-c3cc45691092@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 20:05:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDExMSBTYWx0ZWRfX6UEq1XT+xWJ/
 NiOxLZg28Tv305XugukBUN0PkB42WoCwTSZlxlpJ+NlKMoyx6bvrjf3UZF+vu8vrLVQKdre6Bo1
 HvSlSEeS92PCi+XtCHgpLh/i2AS1Ud0ZWkUsOy/ZchaWHTm2ZbJpLHdL0lyYoPYK+/FnIzYi2+f
 5Q5HUALMeiLDU30egNQlL5lDljPzLIxu3BEtDr7OH9a3UZbx/DyGTut9LW6xHrjimyl50xs1EUn
 YhWCZh92Q0TOxXrBteks10VuVrVC4zAyjD0EDyHtu2YN5adfHTPJyiXetDYl/n9EMK184kdWZxw
 B/KOzMIozW7/klf/XMtd0psQUlvN2yX31G7u6jQPzctIEVWr2RcIbTVuOfjCcsp3G72xr4XQU6u
 Ly8QfYB3u/XlJfyLK9xC0H+wH5wNx3mXoQjQ3hSScJcxd6J+Mur1IN+GoMvSuXPB27M4cU6I
X-Proofpoint-ORIG-GUID: DsY-ecrHDHnxOyoJtMGxtiAQSPRUV8c0
X-Proofpoint-GUID: DsY-ecrHDHnxOyoJtMGxtiAQSPRUV8c0
X-Authority-Analysis: v=2.4 cv=C/TpyRP+ c=1 sm=1 tr=0 ts=688244ca cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=pSIa2sKh8ADkebnh61Ypzg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=1B6o04Z4kyHWbw-D5gsA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240111
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

On 7/21/2025 6:05 PM, Neil Armstrong wrote:
> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
> the Frequency and Power Domain level, but by default we leave the
> OPP core scale the interconnect ddr path.
> 
> Declare the Bus Control Modules (BCMs) and the corresponding parameters
> in the GPU info struct to allow the GMU to vote for the bandwidth.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..b313505e665ba50e46f2c2b7c34925b929a94c31 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>  			.pwrup_reglist = &a7xx_pwrup_reglist,
>  			.gmu_chipid = 0x7050001,
>  			.gmu_cgc_mode = 0x00020202,
> +			.bcms = (const struct a6xx_bcm[]) {
> +				{ .name = "SH0", .buswidth = 16 },
> +				{ .name = "MC0", .buswidth = 4 },
> +				{
> +					.name = "ACV",
> +					.fixed = true,
> +					.perfmode = BIT(2),
> +					.perfmode_bw = 10687500,

This configurations should be similar to X1-45.

-Akhil

> +				},
> +				{ /* sentinel */ },
> +			},
>  		},
>  		.preempt_record_size = 4192 * SZ_1K,
>  		.speedbins = ADRENO_SPEEDBINS(
> 
> ---
> base-commit: 97987520025658f30bb787a99ffbd9bbff9ffc9d
> change-id: 20250721-topic-x1e80100-gpu-bwvote-9fc4690fe5e3
> 
> Best regards,

