Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74079B49613
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 18:49:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C327B10E579;
	Mon,  8 Sep 2025 16:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OWoo2BWm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856F910E579
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 16:49:21 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588GRgKF022793
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 16:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TOMlKuJgvjAl2wbNgrUtIbyGV3gXkbep4YDrso3Os/g=; b=OWoo2BWmjx+yIUc3
 MO5SzcHPNtwZdQIA8PCIKO31LNgsMDkQ1hdhc78d0xge96cYO4rpl5obdVFtZkAW
 tkeicnfjZetwGtMsSCHOGYPADaK07E3uVm4olike16TqV6tDnmwb8Z0H29+ioEeU
 uoWRbO20+wV2U4243ZCYAVaqgVQBvcJaQlKENVRioPNRJUD49vixeQ5ITQlLZXdv
 F72Mq4WYV3ZIi2vMZqZV7EDF287CTKcqIWpni+jE+vzrdyFxQdi33i2tFLy+M+tC
 b5sxGIy2Rytfr0cIVI/Sp2G6oxTlv1yeVcdX+VDYLnlMSc8dQXF/XqtKjLNA6Z0O
 zUEeQQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by8wdxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 16:49:20 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b4fae9f22c2so7489081a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 09:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757350159; x=1757954959;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TOMlKuJgvjAl2wbNgrUtIbyGV3gXkbep4YDrso3Os/g=;
 b=ImZ0FJFqlE5jCqUr2fuoShK7b0mYDzZPGyIlkYKBTpn8x/q0doFX5j+fRtjrnhOUyn
 s2Qf3vMJgoq/Rczp0FnMb/Ce37znIWCByrt+aFbAoJkQpdicRDRzohjFtW5NjFvoQ82L
 BtliXa9zcl+j+GDMNG/cKneZCC57vLoiwElbJCN0G7323oF+wAIc1qQx3K9ucAZVjklf
 uOF7XS3dfrUvzzQrk3EbFMBcXdX1icwDlhRke8PGDJA2msrinNksK1Uc+q7Ubh1bqsUu
 Irb52M/jsFC2u4JW8JWPGCehCMDXYCJ052duvjX1z/FQxMO8LjAlZL4JPAqbAKpiF/bC
 K0BQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1xUktDz+uxjZP4r7I4cGjfkolveZ8l1nDuO9FBeNjRCbV28LrjFhl28+LxgP7wD5kfCekXFfPsMU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/VreLzk4WM8GHQQk17XZupfHS7bB9qVbHA0iBvF5Cow2JSwjK
 6Cz8xppW0PKNCiUzv7RHPRXGImPTYXEtU7DN6SogXii95qGBBxE87IvEkjGfkfaYhmbIeZ0jguG
 7BhPKjCBSdyMzn//I+ncvRu6r781/LkTn0rVISQO9D2X33wtX6A5b3nUZBlgYxvZHOAnnTWyrp5
 5VcgE=
X-Gm-Gg: ASbGnctLBytwwEDM108IjpWbRSm5Bpx8Nk2sQWy1OKoTdIdVr6dJBzuRmXUkkPyBqJM
 NO5G4YnoiO5LC0wCnp8mclb0EP+QSn5Vdew1ctZeEUHyXj0icmUYhh+7BkTwvpW2Np1mVoi8M01
 +gLPl5jhF33+11Kc03QmZfLlwBLn93Nnk9Qv1zElEbd5a1joBYzN1+k/0LKf7ETC3/Kx4O9kBTm
 3dG4w98QiL9LbE3f8dB7jWdDR5c7pTsQZrwXRrvCoW8cg0NkaXu6aZOwJoMj57XM5RIehlrwd1T
 NOYP2dVsA/08Fn4HiOTA4/pYA+Nd6fZFeUf54ro5jFrORAPw0b5F1mi0W7iwdg==
X-Received: by 2002:a05:6a20:72a2:b0:243:d1bd:fbbb with SMTP id
 adf61e73a8af0-2534775a1e6mr13236798637.59.1757350159285; 
 Mon, 08 Sep 2025 09:49:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1It0dv5BR9m68fGngu0EK/yeg+C603sZAq9ZhSJtilPcPbfpfhlLXJ7uaZ1TlMyG2wUj1rw==
X-Received: by 2002:a05:6a20:72a2:b0:243:d1bd:fbbb with SMTP id
 adf61e73a8af0-2534775a1e6mr13236761637.59.1757350158859; 
 Mon, 08 Sep 2025 09:49:18 -0700 (PDT)
Received: from [10.91.118.43] ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a4e5b44sm29578565b3a.88.2025.09.08.09.49.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 09:49:18 -0700 (PDT)
Message-ID: <dc2ce606-52e3-4ffa-87f3-ce4c42b055c4@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 22:19:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/16] drm/msm/a6xx: Poll additional DRV status
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
 <20250908-ifpc-support-v2-3-631b1080bf91@oss.qualcomm.com>
 <77cfd9d7-c3f1-4e0b-8cf4-8567611c3a9d@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <77cfd9d7-c3f1-4e0b-8cf4-8567611c3a9d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68bf0910 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=MmCsC9iFmiawHEAYgzAA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: AgByV_v_6DJZalHs-K2Lf5LT8cyJx8qL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX7ekte8Bxh2Yz
 5wzXJvUZQWsAv3W6/OfI8Dw5hzlwTtdAJ61xwJq1tfrwO/okk1GgQah3J3lwGuze7HsLx93waPR
 v/sRE2PL5mfui2iZWI/YA5jauzsLWNg9Bev4+GopUd5DB8K+FXIfBCqR53vo6Fkh22TLMP1CXIY
 TnEDoDf29xfAoifVSU7200W9y3BJrMA4T/9AE7lHtt8cPqYmbIkqXbzVYJDTxOLLoSiP5jtIk9t
 i2RUF0rfjUNxHuCTto9qHLDTtUZkUz+9MhOg412wt1THEnuu7jSH4P8KjnS4IXj/TAL3uu7dYcF
 2CYyBzXlQbmsS8IgcUU6x03ZNr4isSq0o0XE6PPgaKV/t3pJuLeGPTKU0i2X5Ag3xU/7243HzQv
 if3PWyk3
X-Proofpoint-ORIG-GUID: AgByV_v_6DJZalHs-K2Lf5LT8cyJx8qL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

On 9/8/2025 8:48 PM, Konrad Dybcio wrote:
> On 9/8/25 10:26 AM, Akhil P Oommen wrote:
>> A7XX_GEN2 generation has additional TCS slots. Poll the respective
>> DRV status registers before pm suspend.
>>
>> Fixes: 1f8c29e80066 ("drm/msm/a6xx: Add A740 support")
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index bb30b11175737e04d4bfd6bfa5470d6365c520fa..06870f6596a7cb045deecaff3c95fba32ee84d52 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -987,6 +987,22 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>>  		val, (val & 1), 100, 10000);
>>  	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
>>  		val, (val & 1), 100, 1000);
>> +
>> +	if (!adreno_is_a740_family(adreno_gpu))
>> +		return;
>> +
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS4_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 10000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS5_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 10000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS6_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 10000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS7_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 1000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS8_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 10000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS9_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 1000);
> 
> https://lore.kernel.org/linux-arm-msm/002eb889-87cb-4b8c-98fb-6826c6977868@oss.qualcomm.com/

I missed the timeout value update. It is not bad since we already have
the same value for TCS3 above. Will fix them all separately.

-Akhil.

> 
> Konrad

