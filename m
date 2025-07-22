Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 494B8B0E592
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 23:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D2A10E718;
	Tue, 22 Jul 2025 21:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ftvMARh3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C6F10E274
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 21:33:38 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MKU2Gw027296
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 21:33:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9qRWH5+ZW9GBx8iVLnvrSB0e+DqRvlgDbboXKfgFMmo=; b=ftvMARh32A9+CJ+d
 Hrd6jmIQGG6LkxPudAmk09lRXbIhwhWrSYq61QwIAKjYMsA574Ccq0VefBgB9qLT
 N76DtVkPsMD3TzPyUKQx7mMpi1YYd6jtMXvftLvd1T6cOsS0QtTnZpnKyrE82TWA
 POgqg9zD1YkFlWKiapVC5/q1GxRWDU646aOmBCugyDqfmtfLWfjKzwYxo3xthWSH
 nxlVADJ+rApnGFdksmGUdEabQFb//f14iQ+N7vyfVFv0IjilUzhTykLxyTW7H1Yi
 HzlNFZqub4Wu+wAJJ/1b6JmlKZHYeEY2aG3PAGXjt6mUKy2QdReAg/MHULrYZtpV
 7awRSg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qay06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 21:33:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-237f8d64263so57153385ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:33:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753220016; x=1753824816;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9qRWH5+ZW9GBx8iVLnvrSB0e+DqRvlgDbboXKfgFMmo=;
 b=VSs9T+xA+XFgBVeEb2+qiLOm1K5W4PU0c9y7WeGzPDcL2ZC1UAGg7MpxsRNBN1eqFB
 mURzEgHLZSXeIv13SrKHMQQVHG+UyU1rEsC6oyFYJ6f+Swpi3y7ISh4W7pDX00NyEpKI
 h4rkWvJj0qXEUVGUTiIClir+UL29/GlWkEO7iOeJ35/zRcmeiIAEn78mH77Sy+kZ+Ihr
 i8TEHAqClfx2AttFPZZ31NFEONEbY9calnrOqn20PJ+JH9Xlv4R11lCWBqot0pVr1ekp
 PkF8yzBLOmzzj6OEew2aDZrlVMsQLdWiR1LB5BN9SNAUuimYveYR04PCaD+koo2E+OP0
 i6GA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU00x6P1LmFgJvIqiSQg6GlLl9FJl9OuxY73ycxFOhOOxjpYZ/tJbckqgYBS71Re3R5f1MBxncGxd4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1LGK7w7p2MNvfqaZ6wJBdpHDzZRKHc2XKAV9Tfg0i/uhqHSSU
 dL5fD5Q2F6/T6lVoHW+DN2evzSRCbEQsX1dw8KBK8kaiLonpOzUNl5lKjhV9F82W10Fz+XzbfdY
 NEFligqDjbSjArAx7i10rBwwFuCzcK3+nq8fd67Dwp8zzuXPA2U3LzTT856qNs85T1y4UHi0=
X-Gm-Gg: ASbGncve874tU4SrzoXsG12v65Ljcc3dOkBfSg0jal6685w9aJjly+U4F5eq3eDBVrd
 92tp04C9orc8kuNr7D5VyVcUDLhmNQKLMD8gHSOnyZEs80OwXZAYOAD26KqPVSdNDT8MeLe3VEk
 dNz+FOTKxTFdxIwi3PpuI6NCKWPi6UA3buwhc484I8upwot0jFkVU95E/tdxSkaxeVxAbOfmKRD
 91yGimir9WGkbj9TZfSJqoeh8PoxVYgoUa9grjTXtzdDcQ38KF7s/oFv9CKnfvPJze2aurX6oqX
 ASofJ1vXWEe1snCzPnUnFIaIoFXptpWgF4yub8aLQKwn0bvKMZWq7rop53HF5Sz7
X-Received: by 2002:a17:903:b8e:b0:234:cf24:3be8 with SMTP id
 d9443c01a7336-23f9820461amr4935715ad.28.1753220014579; 
 Tue, 22 Jul 2025 14:33:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiLcMOkApVl8sBrggOyOYLjHKG4LM2qy9YFRdUAYb7bhhEcERxourvdjtEQUEK9sitkC4Pyw==
X-Received: by 2002:a17:903:b8e:b0:234:cf24:3be8 with SMTP id
 d9443c01a7336-23f9820461amr4935365ad.28.1753220014085; 
 Tue, 22 Jul 2025 14:33:34 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b5e2de8sm82627185ad.11.2025.07.22.14.33.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 14:33:33 -0700 (PDT)
Message-ID: <28b85705-dba6-46d2-ad06-ac548528fdf9@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 03:03:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/17] drm/msm/a6xx: Fix hangcheck for IFPC
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
 <20250720-ifpc-support-v1-13-9347aa5bcbd6@oss.qualcomm.com>
 <i4o3ivearks7gwg37ywyqyl4jpmbwnuczac6h7dscrmlepawag@jhedlyj2hzps>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <i4o3ivearks7gwg37ywyqyl4jpmbwnuczac6h7dscrmlepawag@jhedlyj2hzps>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE4NiBTYWx0ZWRfX1x/NR2Vat73R
 QSXZjFGCAVoOBgaNGYp49m4LJi5pIWR/BaggmM1jxW3BaxK8906qhv/SurGItHbUDRGjXltpAQy
 Fg2ACYJ+2otoo3BSXmquyX/yRQBreHDsrPlqpoBVh3yW+esw1/ftVG3zvq9G3Ps+RE5YIxGRF9X
 6jQK2AMWmoMOLEkLDsz0CkBN9amfr0vI7TFPeKoZQPTkHPhavOtNjsZpRsAfZMhYcL23zJQ8dsU
 mzdSb/J+zBWPFwUheVTusGBW1hACUDrq2Asi8+d7XwgNaJ06vVs/4Jjhx8IpTO+1r4oEOwRJkIw
 3DZBqrj+uUHSy2MhM7YXSBagEa+lJp9mo5hDOANeyJkh6nCM9khk/rzVo4VKRlSHqoEnTz4I7wr
 xpMIu+s/37GS2m+HaHiGuWjUD+ttsV17XRufRebu+Jt62Zmov77Cy7L1t6YRMwn8rsH6JMx8
X-Proofpoint-ORIG-GUID: CuT7GckuapGUKkBCX1lyu6AeQd0qW6AN
X-Proofpoint-GUID: CuT7GckuapGUKkBCX1lyu6AeQd0qW6AN
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=688003b1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=e3cV7b4uTqknVPGEt5AA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_03,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=997 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220186
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

On 7/22/2025 7:22 PM, Dmitry Baryshkov wrote:
> On Sun, Jul 20, 2025 at 05:46:14PM +0530, Akhil P Oommen wrote:
>> From the hangcheck handler, KMD checks a few registers in GX
>> domain to see if the GPU made any progress. But it cannot access
>> those registers when IFPC is enabled. Since HW based hang detection
>> is pretty decent, lets rely on it instead of these registers when
>> IFPC is enabled.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 ++++++++++++--
>>  1 file changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index e331cbdb117df6cfa8ae0e4c44a5aa91ba93f8eb..b3becb230a94163cccff4eaffb8eed44f1c29ad0 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -2399,13 +2399,23 @@ static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>>  
>>  static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>>  {
>> -	struct msm_cp_state cp_state = {
>> +	struct msm_cp_state cp_state;
>> +	bool progress;
>> +
>> +	/*
>> +	 * With IFPC, KMD doesn't know whether GX power domain is collapsed or not. So, we can't
>> +	 * blindly read the below registers in GX domain. Lets trust the hang detection in HW and
>> +	 * lie to the caller that there was progress.
> 
> I know that we've relaxed code line width to 100 chars. Would it be
> possible to reformat the comment to 72-75 chars?

Yeah, makes sense for multi-line comments. Shouldn't the limit be 80?

-Akhil

> 
>> +	 */
>> +	if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
>> +		return true;
>> +
>> +	cp_state = (struct msm_cp_state) {
>>  		.ib1_base = gpu_read64(gpu, REG_A6XX_CP_IB1_BASE),
>>  		.ib2_base = gpu_read64(gpu, REG_A6XX_CP_IB2_BASE),
>>  		.ib1_rem  = gpu_read(gpu, REG_A6XX_CP_IB1_REM_SIZE),
>>  		.ib2_rem  = gpu_read(gpu, REG_A6XX_CP_IB2_REM_SIZE),
>>  	};
>> -	bool progress;
>>  
>>  	/*
>>  	 * Adjust the remaining data to account for what has already been
>>
>> -- 
>> 2.50.1
>>
> 

