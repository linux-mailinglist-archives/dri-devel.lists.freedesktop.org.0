Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 148C59EFD81
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 21:32:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17EAE10EEAE;
	Thu, 12 Dec 2024 20:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jtoNMoUa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F8010EE9A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 20:32:38 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC9kbeC030100
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 20:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MhBLGRTjN+wy+d9lgDLUbymMJJz+nFkVV7ekVI51mL4=; b=jtoNMoUaiNjMXr+8
 JAx1x8nP8xlfzgrz7BDhzouCHivEXGVA+dhjtaWRPAqVlo4qL1Gozj7JYrvtr9qM
 MkCb3X0t1gkQXIIIix64LY8mD4s5Y4hh4uzq2GeTJ3ySuaw8RWyPUUBX58rdtvCS
 z6gP6jUkeJUFMvMv3Qe+fo8HlZt3dl618ypqUucl6/epwG/MpQxzpeeYa8YFdhrM
 99mbvSvdf9bJE9V/t6IIF/R9RYZptYta5iXmbC5ZZ9xOASghHJ1h0Hb3fy0Z0pxi
 2hIMQW1h0oad+Q4y2X3ihhtj9QwF7uiIu4bn4VLYPziGLFhqWnJRlPIqH8pUK4v7
 AAouSA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fwgehp16-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 20:32:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7b66edf3284so5214785a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 12:32:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734035556; x=1734640356;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MhBLGRTjN+wy+d9lgDLUbymMJJz+nFkVV7ekVI51mL4=;
 b=NQ2hFwwNzqM+7xeo/Aqsqn0v8SuS+6KFcM62KgjEe11E5+RLkncd19AFHT4uOBL8jL
 0sXcOmUnrW5AV9JOmZl6sLRKJ6O/cUswxUS8qRLEjZAK9ns6yCFCypvV3meueYikswD+
 6/GJ4hWbAWSvqNsxDSDukVujfX0V66KLXJaKvJOPjjIUSTjK4KMtv5MGRZT6PCdPFk/4
 HKARIVeZCAP/ZQVxeU12/GTGDJ6xIirfc/FG/FfbZPSDE8/mPiJ6SJ4C9hQGEmkCdtYi
 dqkHmpCY0EVOd8TtoX7GStCg+25dEgpOEkcgNqQfuMgb0dvuSyzMV2GIEa/e1DPIvpD1
 TzJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoXAA8MB1/m920Y9spLlF5fvbFmtefPYC/xUNyXjcidKynFOjD4C7Cl8ZPGT/IkQo99rYea9jjhNg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxszCeLUuykMpLjCd4a03F6QhIfXhmK/JQ5blNCnLzyyOJeObFR
 UdpWiCEloNXX9YypOtuTIVDQMZFbNoa599EQj9YGx+/bO08R8tzLJSNvwe17lJTt+JvY1vMsIiU
 IfBKopkj39n+RRa+b1iuQfeAGy57E4RQKz0g50PbujmxiYXOTRQci2QHIk7QTbq8gueQ=
X-Gm-Gg: ASbGncunf2Rt7sRW/yMAMZwpy+JZnoFEwyF1t+4ZBNvAoMWmJF5kNrXt1IS8iQqd5Ej
 OPYJvSDblWzmfJl4ZbMqBkhLNiCAhF7880t37u9lRbmmQ3k6U7GSp90Gewr1dKd3qOyO1KxGjTh
 dWxOgigqpgzFjuyg5Ef0AFCoaaKqcagYv9tMj3xrrb6Xnw5EAO1W6F0xmWNKzv0y+/SCwbdqwby
 RJ8BVhxielQBZXff0293E/m7ieDv/7f73RTvs2UcSW5cqLraE1MugqMDBvTQzFTSPQDdMnaZpfl
 h+c9ZS67AkNToWFrLBjL2uYv6pHaMNl0HcpmNA==
X-Received: by 2002:a05:620a:3905:b0:7a9:bc9b:b27 with SMTP id
 af79cd13be357-7b6f890562emr83307185a.6.1734035556556; 
 Thu, 12 Dec 2024 12:32:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZopsOLk6/XkFBqZnV98IPFq5LepZFprenEt5dRRro0F9YUmKjZgKugYy/6AwCP6/weI3sBA==
X-Received: by 2002:a05:620a:3905:b0:7a9:bc9b:b27 with SMTP id
 af79cd13be357-7b6f890562emr83304785a.6.1734035556157; 
 Thu, 12 Dec 2024 12:32:36 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d14c798fc7sm10620346a12.62.2024.12.12.12.32.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 12:32:34 -0800 (PST)
Message-ID: <31264e68-2cdc-41b2-8d84-459dc257f0f5@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 21:32:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] drm/msm: adreno: enable GMU bandwidth for A740 and
 A750
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
 <20241211-topic-sm8x50-gpu-bw-vote-v5-5-6112f9f785ec@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241211-topic-sm8x50-gpu-bw-vote-v5-5-6112f9f785ec@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YwWM1y72OtAxNj3kvO-1TwzFVj9nsUaF
X-Proofpoint-ORIG-GUID: YwWM1y72OtAxNj3kvO-1TwzFVj9nsUaF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120149
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

On 11.12.2024 9:29 AM, Neil Armstrong wrote:
> Now all the DDR bandwidth voting via the GPU Management Unit (GMU)
> is in place, declare the Bus Control Modules (BCMs) and the
> corresponding parameters in the GPU info struct.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..edffb7737a97b268bb2986d557969e651988a344 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1388,6 +1388,17 @@ static const struct adreno_info a7xx_gpus[] = {
>  			.pwrup_reglist = &a7xx_pwrup_reglist,
>  			.gmu_chipid = 0x7020100,
>  			.gmu_cgc_mode = 0x00020202,
> +			.bcms = (const struct a6xx_bcm[]) {
> +				{ .name = "SH0", .buswidth = 16 },

All a7xx targets use the same BCMs with the only difference being
the ACV voting mask. You may want to make these non-anonymous structs.

> +				{ .name = "MC0", .buswidth = 4 },
> +				{
> +					.name = "ACV",
> +					.fixed = true,
> +					.perfmode = BIT(3),
> +					.perfmode_bw = 16500000,

I think perfmode is simply supposed to be set when bw == max_bw

Konrad
