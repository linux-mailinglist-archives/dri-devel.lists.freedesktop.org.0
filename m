Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2ACB0FAD3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 21:10:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE55410E845;
	Wed, 23 Jul 2025 19:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="koS+cKhb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA68610E191
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 19:10:54 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NI2JOU007900
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 19:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KgSt802qmdeMVi+yTHJ1x7sZur/iyrLv9PPbtqJ0DcU=; b=koS+cKhb+lq+w662
 kXqbKfL6yTiH0OJ2FtDGxz+azvW/3i8pGhqAoAaEyfTj3y/t7BLszI3SyNZq+g+B
 OTLXxVh+07Issu4T9bMhYkgcC5g7yCp3Oh09b1i0W1W4sSHSchPWCOrA+2ZrHl5Z
 IFj3fOrGB4syUhU+SerDrUSMfG+iFsOsHuiz8VkG5l7OCV0u1L7FQGXDW8b3/Ydi
 QJzdRTA2zTOs9OVl4c/FbCaLRyXCCOhHqea8WlqH7xL3DpVTkFGpN9ceovdj+QZK
 Q5L41bzy/qZmhAGRNzzWZdTVS3ZdhcZeHHANXql9pKz/R/zvMBHoAmZmxPfHaH3K
 4Dvb+Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3hvagv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 19:10:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2365ab89b52so713915ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 12:10:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753297853; x=1753902653;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KgSt802qmdeMVi+yTHJ1x7sZur/iyrLv9PPbtqJ0DcU=;
 b=uea7B1lZNdbEtVIGD35cFgzQEaXe6SNJsTIdLYf6UhjliXV4uKPNr5blxRxPdg2vHL
 kxaO63zw6e6AtauGK099h2b7Hq5X2k/gaGjqBUCN5yKdS4bJvJQ20PZoNS5gSd2rvIVf
 pA2Joy3K0vAGaS2RTLUvMoLpRUvJlxeGqVf7vcJ+6bV52dfCUg6SWmRLEed6dLtx+ncS
 eE50njSJs0/hR4XykEDske5itUzjVNZM5qHC8TrW3vrhgImu6CeBGGS8s1p4LnW7e0ok
 aU8c9cisX1tYNhEYClErcsfnqO0aGmRzcjMpVWg4CFuFgKy9TtjfIFwx6ESPvt3+tsB3
 gGRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY16dalrRswDb0XpU7dqeeCI9tFGC/sDAR+iHbUPPoZM8mmtoFrOtHkq8dQjCfPfib8PL4qWxpgcI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBMvlsnbcvC6eF1dID32byX9yPdTR77W6ty3Qlyr3QdqSt2IUD
 rBm2e0WiTl5Fg81AA9EZgd0y3mIH40pO4WyC6IBqpZQv9fS49QTXw97VtLhi/YCTQC41hyeuUuJ
 4oU7N19ixWk7392mFDXgLiMfBVSK4Cz5AHk9Q2J0AxNQZTa8euKIoewPik4zncqfJqJzNdcs=
X-Gm-Gg: ASbGnct5yIIKu95CswGH9ziidquaBTM3/9esqa5oDLaGgr6C6EyHJ0Gua81SNdjEUXV
 k69342uHwq/0sEEYeVX47uiQWesDBeswj5LrRXnuWYq3EVmf0+peijrABE3uHINAQw57WRWoQNE
 LoNiaXGYs0ZVZHazx1P1XCiZakrumTist4xXYHMgL9UjNRZaskJMIFdm21KMxp1SBo8GjZ7PehW
 uDbKJ43rLLzKdP1I8vXSBBW53JmEZAVb7d7IdwcilycSY9by5l3nbi4lLy7dMIp+HqKCmm7hCo/
 sHnYS9/R7hSkSImf2ykxLiJJ+kZOiTMTvgOMVh0TPArdcmvmL9OqlYMlx8SKBf+k
X-Received: by 2002:a17:902:e881:b0:234:8f5d:e3c0 with SMTP id
 d9443c01a7336-23f98161a50mr46228395ad.6.1753297852703; 
 Wed, 23 Jul 2025 12:10:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3CHLM1wF9WJWdlUe1Sb3b2TPPZfOnw2+jdpTbeD4nUnNJuQbnaKGQAjcRTI5pJWuujuk/7w==
X-Received: by 2002:a17:902:e881:b0:234:8f5d:e3c0 with SMTP id
 d9443c01a7336-23f98161a50mr46228085ad.6.1753297852153; 
 Wed, 23 Jul 2025 12:10:52 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b5e3c89sm101986125ad.18.2025.07.23.12.10.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 12:10:51 -0700 (PDT)
Message-ID: <100ca94f-e1c1-4cc3-8282-a14066396f5a@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 00:40:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] drm/msm: a6xx: Refactor a6xx_sptprac_enable()
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-2-9347aa5bcbd6@oss.qualcomm.com>
 <d4b46652-c4d0-44b4-aef5-e8bcf606de06@oss.qualcomm.com>
 <4832a160-344a-4140-a115-d4742f95825b@oss.qualcomm.com>
 <02b9de9b-36c8-4db8-a1dd-65a82aee0eaf@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <02b9de9b-36c8-4db8-a1dd-65a82aee0eaf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=688133be cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=iAeCgxixrUXn6QA2EFgA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE2MiBTYWx0ZWRfX1YL6Jm4wqW3w
 vzIP4lAoZY7/rlaIhZsgvW9GUTvwWhxqojfdGPpzP9i7eX33wQdb2jTUALravPTzpxzws5e+R8g
 VjBTB/lATVjqJb7N3M7W2jSAb/BEHNTgC0RfyPeFOH83eYHtmQkMDgjwLG5mVe4GFXXU+rhTy+I
 E4GBcc5qNX8xB8+md2zagEqY4+kEfB82+AWj14l+qWjmkZCO6cgIV+TZK1eDlSLaeLcH30zau9w
 UHGzZOje4t5Bye2NOzm/XR+ZaLhzOEVCeL++5nWXXN1tmqee7XiR/i5Bq7LacpTfg4zcKEoUeQ5
 NPYs7H7B0qzM7blZfjK3S82+6Mmzeq1Od4u29AW+7gCEI7zTKlXVAXjm4/GLiDZewVISdSBR1lm
 PV8eYOsXOKEzoc7AugCWYhqAQu6pHKYKmNbyDZdsHBPidKjtV0P9SR+2PMgG2JRIFjE6Jof3
X-Proofpoint-GUID: HSpF9Q_DSSvA-yj-M_obr2CXi6FgCv3n
X-Proofpoint-ORIG-GUID: HSpF9Q_DSSvA-yj-M_obr2CXi6FgCv3n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=941 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230162
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

On 7/23/2025 3:43 PM, Konrad Dybcio wrote:
> On 7/22/25 9:47 PM, Akhil P Oommen wrote:
>> On 7/22/2025 8:00 PM, Konrad Dybcio wrote:
>>> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>>>> A minor refactor to combine the subroutines for legacy a6xx GMUs under
>>>> a single check. This helps to avoid an unnecessary check and return
>>>> early from the subroutine for majority of a6xx gpus.
>>>>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
>>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> index 38c0f8ef85c3d260864541d83abe43e49c772c52..41129692d127b70e9293b82bea5ccb6b911b0bfb 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> @@ -403,7 +403,10 @@ int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
>>>>  	int ret;
>>>>  	u32 val;
>>>>  
>>>> -	if (!gmu->legacy)
>>>> +	WARN_ON(!gmu->legacy);
>>>> +
>>>> +	/* Nothing to do if GMU does the power management */
>>>> +	if (gmu->idle_level > GMU_IDLE_STATE_ACTIVE)
>>>
>>> This isn't quite a no-op, but I can't seem to find what the '1' value
>>> would map to, even in 845 kernel sources. Do we have to worry about it?
>>
>> This is fine. '1' seems to be a low power state that was removed very
>> early in the gmu firmware development stage. We can ignore that.
> 
> Ok, good - could you also add a define for it, perhaps something like:
> 
> #define GMU_IDLE_STATE_RESERVED 1 /* Cancelled feature, never exposed by fw */

Ack.

-Akhil

> 
> Konrad

