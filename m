Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DA0B14E64
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 15:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E09A10E1F8;
	Tue, 29 Jul 2025 13:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e0F8kmoc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6592710E06A
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 13:30:16 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8OROB018159
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 13:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZkVVfMqcS22T194hcW1I5vSe52GnRrmOg+MhaqqVH00=; b=e0F8kmocfkMJoXQq
 +f69DQcn3OviJUPsS1EksTyfmXysLxm4zjTmoRPyUJOSUjhEVYeAZvNlfRNE5jyM
 ZWwizMblp4PWgzlsaXvnCnUPQmJKLHtVq9d0ZFHTpRbVNF3yqSAK6J1IC3MwV8xe
 xMcLsF6gg0BRQozsjKr4L98O1ITXlDp8HdLimdLXqeMAfEj00HeS25FdxIpqNPxo
 o1fcomAbux0r8MA7gagI2yO9P4Z4DS1fO0eDZBY+GBKqB2Ycuq+U+Bzh5KzTR3K5
 NjRp+4T14Pu9NVxHtjSmxnbuzZ/f+8LW31SxfYnVUHThzEtoanDDYmgMjZ0k1sZi
 OzGVDg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbm052s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 13:30:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e34e28a640so38285885a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 06:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753795814; x=1754400614;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZkVVfMqcS22T194hcW1I5vSe52GnRrmOg+MhaqqVH00=;
 b=HECjOjbr7P12TmAVdc6JNm9upUnztycyXwiiRQF8SMdBM9/NpRXwEwwaF0gzjGwBT8
 XeBoYOd7Peam6vntnZufZOkvZJS5oY8yTL1uptn7E3nMdI1pX4xRebBUy1PvIXTjomtI
 v3gtIY8aZV+m7vQYwqiNytos1kTA8hqMqXxANcyJREwZEASua4JTl/Qs53aomQRt+Oeg
 XQOPEyu2n353fOhiXLEyAV8/EE5I9vdTw/AU572wY2fPo6BPkRExHQXrf/Neqf9F5A4y
 hjDRzkHDECrjpgsmGSFc3J5RmGNQsef8P9k7POTQ+ie0Krmm4AwI8d0j8+Y4diQx4AtN
 BZGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNOyejeN93559LVeMpZqOcpD+AyvvGTaH2imce9/LxVIcm+VrFbnyV0BufdTwgvQCwde0SvZJtZd4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzImkSajyckI+CEZNuljc5kLDCtmoSSRMU27DAiCrJaJzj4P4Hm
 qKHlt19IiKEy3hF2qZHf+PhrpEXukKiTw3l+CPhyn28iiISqetiHVdU317F2ao74F/uaPVWGCF6
 TEAZqjlsquOZlB+pQrhn+KGbe3sRmv1B8MeH3GuwL6fLlX3GLgZ5qiBRWnX4hVbVuxcjfCH4=
X-Gm-Gg: ASbGncsPGO8RsfO7FdRChDYjA0y6grmsqYYlJy8FEtYQejlMtSCwVIH7btjlrtxMZ95
 Bwa8cwJzVXd9cOciaXlG573uE+31LzQUw65FvpyeEeF2grWa/BvGsnk5jtGGizjVzJoOVdWQiRt
 GyqhhEzWqTJw/IilBPNrDcIXGKGwUyEhAWFHIqdGasXd1l6r1MN/gEtReX2AQlSLfuy1JpdxjXh
 G0k6D4L939RzLFw2JXnQRLXufvxi7RMkSlcuTJ1Azbcv0Kc6cLRxdU6Fee71sCI6EeAi65ni5CC
 Ib2u2YXLp3aLkooN/FCurD8xSyHxkjgPi3wxBBjKKMM1HXi4zWFzcfpvCNyWUog6EijutyxOhV+
 mAb+6BZGlxYEPpEDx+w==
X-Received: by 2002:a05:620a:284c:b0:7e3:297d:ec32 with SMTP id
 af79cd13be357-7e63bfc3749mr814895985a.10.1753795814161; 
 Tue, 29 Jul 2025 06:30:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgmtqIpfxLvIlR9V46R14lP22op8xYzy/QAirfAkHBUcpzQdLdsiTffbYJQzdMY2lRH96DEg==
X-Received: by 2002:a05:620a:284c:b0:7e3:297d:ec32 with SMTP id
 af79cd13be357-7e63bfc3749mr814890485a.10.1753795813536; 
 Tue, 29 Jul 2025 06:30:13 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af635a62af3sm592795066b.84.2025.07.29.06.30.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 06:30:12 -0700 (PDT)
Message-ID: <4a1c3cf1-9688-4275-87ac-8fffd4469889@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 15:30:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/17] drm/msm/a6xx: Switch to GMU AO counter
To: rob.clark@oss.qualcomm.com
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-9-9347aa5bcbd6@oss.qualcomm.com>
 <0a2188e7-3919-48f7-b5c1-8f779f617f28@oss.qualcomm.com>
 <CACSVV02x1s9oBSV8khgPhqPJdT1igOzRSOp5wYUZowKvXsb-Dw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV02x1s9oBSV8khgPhqPJdT1igOzRSOp5wYUZowKvXsb-Dw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=6888cce7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ERHQbKNnysnh4IVj_LEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDEwNCBTYWx0ZWRfX/c/FR28YU9HB
 O+zt2QKcSp5FuW5hUZAQezVTgt90ki3Ag0osGcRE51MJZiHg9yCOMRVgzQBXm5NjWXrrbjMxyLK
 /7me0uxQzCtHyrZCWEczkiqaVI97+uPpdps7O6bHNZMWmSZS6F12jZ70kz7Xh5hoQg6EDQuabDY
 VmWReG/89jbdxQar8oQgDSe9Ep3nNmO10RtQYTdrevg5mV/RtTqlTYH67naVYhufhMd/DllLCeN
 Yz4N7uiV+d6xMeBVsYqSCb7LsL41Oo3fqddboxIvuALmN12uy50cp+I0vMrGBmqlvV0Zk5v3f3k
 c50OEI5w/71d/JvHhNK/2pOmOrFxSvBosgs0tHeFMHjVH6nWV05UeJ1fKLT8QK4bgkkCTN7jqXa
 iffJPAr1JQipU0dg65csnmlQ7bK1lB2gBoXMYaDQgzhp/NtRh5W5SwOznB+96EKULb1QrrDz
X-Proofpoint-ORIG-GUID: vznfSV8tDAgQgI5Lw44S6aGi0EQ86NZP
X-Proofpoint-GUID: vznfSV8tDAgQgI5Lw44S6aGi0EQ86NZP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290104
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

On 7/23/25 2:15 PM, Rob Clark wrote:
> On Wed, Jul 23, 2025 at 3:19 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>>> CP_ALWAYS_ON counter falls under GX domain which is collapsed during
>>> IFPC. So switch to GMU_ALWAYS_ON counter for any CPU reads since it is
>>> not impacted by IFPC. Both counters are clocked by same xo clock source.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 30 ++++++++++++++++--------------
>>>  1 file changed, 16 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> index 6770f0363e7284e4596b1188637a4615d2c0779b..f000915a4c2698a85b45bd3c92e590f14999d10d 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> @@ -16,6 +16,19 @@
>>>
>>>  #define GPU_PAS_ID 13
>>>
>>> +static u64 read_gmu_ao_counter(struct a6xx_gpu *a6xx_gpu)
>>> +{
>>> +     u64 count_hi, count_lo, temp;
>>> +
>>> +     do {
>>> +             count_hi = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
>>> +             count_lo = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_L);
>>> +             temp = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
>>> +     } while (count_hi != temp);
>>
>> The original logic is as follows:
>>
>> static u64 gen7_read_alwayson(struct adreno_device *adreno_dev)
>> {
>>         struct kgsl_device *device = KGSL_DEVICE(adreno_dev);
>>         u32 lo = 0, hi = 0, tmp = 0;
>>
>>         /* Always use the GMU AO counter when doing a AHB read */
>>         gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_H, &hi);
>>         gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_L, &lo);
>>
>>         /* Check for overflow */
>>         gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_H, &tmp);
>>
>>         if (hi != tmp) {
>>                 gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_L,
>>                                 &lo);
>>                 hi = tmp;
>>         }
>>
>>         return (((u64) hi) << 32) | lo;
>> }
>>
>> Doing this in a while-loop almost looks like you want a lot of time to
>> pass - REG_WIDTH(u32?)/19.2 MHz
> 
> would:
> 
>    } while (unlikely(count_hi != temp));
> 
> make it more clear?

I guess so

Konrad
