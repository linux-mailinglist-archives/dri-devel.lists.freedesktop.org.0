Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 384BFB0E478
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 21:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9AC10E706;
	Tue, 22 Jul 2025 19:56:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OKqie+tW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A9B10E706
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 19:56:03 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MFGLZF013043
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 19:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GjTWvnObvG/UeJuKXHL9K9+ApIca33uxx+7EN7uxT/4=; b=OKqie+tWt99ZKEf8
 mAm/cX/RY8ADiZ3d49ZZhhZ5C76BICLa+fxEe2uT9OC6zM0Lm2Po8S8BxqByx7kS
 b780q1o0HyQBv5ayhLBW47cTHVXGkt4dXh0ZTTWmpS4u4H7FXmW5I2zolHBIWoZM
 X9LWlos02N+xOaumOQlS1BbYiBvI2mVxfhQfLC8fYn1FHaVW1A/guRX7VgX7cUoT
 1fU2PIgSKIoyaOBG+X1ygtz8YMV0ErNXxLNj8Oz+twJshpKBI+T6AatLG190oGdm
 9l1Acc4talfp7qKRwld2uG2GQ5WJf6lHRM+SjzTl7sXLILfTAaMs68dY2XE/x+UQ
 QDlToQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3enh46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 19:56:03 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-75ab147e0a3so5303283b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 12:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753214162; x=1753818962;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GjTWvnObvG/UeJuKXHL9K9+ApIca33uxx+7EN7uxT/4=;
 b=Vhw8K77c6oudr5thQvLyI3CIq59OX2yA/K6+7pExJk37BgOl/HMNSK0sQ2wnNfW92T
 vdTeMEBOd2sbzubh/Lz9DdA+knusXURelXFZlfSZRCr9X+O4CeKRZlxaR3Ws8VkoYYCh
 run85RanEVvLx579/T4Q6uAOpUMTrPNglFZdp8icOf/K638bIjeiGXsiJaKPLg4p0p4q
 sPaHDl2MpoN4HGyeTFgXLN5o59XmJ2Y8th6GsmX5NMWkixWYKw7u0wjn1jV3/WFJK9jM
 7E73/7m4eEYRUw/hRz5Qb7787pB1OjP0Tf4QGsO0V0P0pnQG6Gsxt2ED4w0Z7iz0qxz0
 nqVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDcoA1HFh5ruAHYuzlcEYZz5ioz4O2Padn2wSJ8hCK8NKI/cdBP27sJ93upYJ8lNDnaFH7t8kIy0Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1bzfYtfG4jxxfTCmaEm2dVOpTgnV+AOyY6rukWKnmCh206itV
 r7nQI1r6Msl4cPL87qtPDNiVFQjr4QRN55ih/Jq1BqzM/RUC2K7qj1NHafymLmIu7kspHbG2HAf
 5/17Msw9gIeJzvsqGWUM09E2ER5/p3yZ+WIYil0VyQbIS0d8bHWJvX3xVJTPIvzb2pnizrXk=
X-Gm-Gg: ASbGnct/1zqrggifyMJ16ox1+x1vvjdEMu/j0KLLw9bVQMQ/HRzuJthN5nCyG6JTSVM
 26T3Q+d/gJU0KiG3uixzqxRqRk/aDWy9d0dkkWlRqWlSuUXjjMbf8mRQRZP6hkKpe1O7wqnN+PY
 M9q8l8rRX/Yug7mJpMep5mOlTl0y/v9/OMZANWdxZhPtpl2gSszLz6AO9+N+KCcwzX9v+tM153d
 MLdWcCnGAQnUoP6ffb4fagJ/hCKZXo754fKnYXLG2pPc590JNixL+DeRLO9LYTbwfS4gMYNObqV
 7k+6zNdxaT0T5Z1mdoVD50UvCL0ye0nN9DmnEA/UgAPC4tlcY+WI27USiUTYwbNM
X-Received: by 2002:a05:6a00:92a7:b0:736:31cf:2590 with SMTP id
 d2e1a72fcca58-760353f2759mr687691b3a.16.1753214162226; 
 Tue, 22 Jul 2025 12:56:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJK019g6DqECaNDbpD0Yvmal8JjGmdWP1kCx05y6YQEB+NqSgr5xgmvBvu9sxGV/5wQFRvhg==
X-Received: by 2002:a05:6a00:92a7:b0:736:31cf:2590 with SMTP id
 d2e1a72fcca58-760353f2759mr687654b3a.16.1753214161634; 
 Tue, 22 Jul 2025 12:56:01 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cbc680absm8266052b3a.144.2025.07.22.12.55.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 12:56:01 -0700 (PDT)
Message-ID: <1b7817eb-6d54-4ed0-9ab3-d5b521d5bf6d@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 01:25:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/17] drm/msm/a6xx: Poll additional DRV status
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-4-9347aa5bcbd6@oss.qualcomm.com>
 <shq6rnj5qrw52xvtcnu3bbvxuxjuddzajugawcojdyrm74fpp6@abeztbbmtqnr>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <shq6rnj5qrw52xvtcnu3bbvxuxjuddzajugawcojdyrm74fpp6@abeztbbmtqnr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CKx8KyGWVFnazz4dgFyNTd8bv9Nfr0Zy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE3MCBTYWx0ZWRfX+n7G/fHLu95E
 ByBX2eqZHlRwWTnJy1BGZE+OtCDoCDYQPuPvDh4ZpzELr6LK2NQ5W8UUS98N7aXKLM/pXh+c7LM
 S8ThqohGz1OFPJTJXyIMEpM48x7iexD/MmxrFP1XgR7mwSoYeLg3y+Up/QtQR3lK+7atuY0CzOv
 pj6Lz812RkcykNDGxyb77bWmSm4OMgmZqTmxJtZ6j2ceVS57ew9nztfCR0CnsyDnDdeyULIOA27
 Iw3cvHBcCXIIdUtcQcTWMpnpmyvog7kv5yqauwaDwP98gzNGArHsn/Gj9qHaWOdPqnwvhnd/qW7
 3a9NaXi5Mx5nH5gnG95o7E/SteeQD6AyPaab2yHc4Ogww6MDCBZ1xjTTBRc5J4S91uAFIwbAap4
 EbPZZHi6JmBCJRzBAm8i9iX/rts9xHPFWx7n7+7NPIf9nLPV6viBMV8u7LWoAM4DOngp0Srv
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=687fecd3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=TSBj-XRfAaQ4HSZEJ1QA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: CKx8KyGWVFnazz4dgFyNTd8bv9Nfr0Zy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220170
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

On 7/22/2025 7:01 PM, Dmitry Baryshkov wrote:
> On Sun, Jul 20, 2025 at 05:46:05PM +0530, Akhil P Oommen wrote:
>> A7XX_GEN2 generation has additional TCS slots. Poll the respective
>> DRV status registers before pm suspend.
>>
> 
> Fixes?

Ack. Will add the tag. It is good to ensure there are no outstanding votes.

-Akhil

> 
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 790ef2f94a0b0cd40433d7edb6a89e4f04408bf5..3bebb6dd7059782ceca29f2efd2acee24d3fc930 100644
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
>>  }
>>  
>>  /* Force the GMU off in case it isn't responsive */
>>
>> -- 
>> 2.50.1
>>
> 

