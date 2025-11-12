Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 112FBC54AFB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 23:09:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375B210E7B0;
	Wed, 12 Nov 2025 22:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YaOQ2gMv";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="InB+IHmV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C536510E7B0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 22:09:38 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ACGuUWP721987
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 22:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PKqNXD1DollfLI5h1J2Xseqpi/6Yas+Ng79HmXPNvu8=; b=YaOQ2gMvd3/T2S8/
 MFfA/GNKngL5oDoYFpGPtoDfaZtgNEd3XKI7mFuEDVr3AoHNMLQ1RveVof/P4K1C
 MBTr1vFrsSX3rd8CT/nDm0Cx7/HQSUMMxBkD2xD/pggoeQbc4UdQ0At17NM7gWW9
 5m2RJOwq74SAEruoLtIqCJDADeMt6FI2XMOwC3eITawkofhDN8nltztqtxQRHftW
 foR+RMjQpLY4n/Nag8BcHwprobmGjkMqulU/Feeqm5lHY85HMukVa2nwk57pu4Nv
 QPdO5BzUJ37cd+3xC7xlgxq0B5paVicxwtHp1lLFddI5EtFgX5NYPRo3fQUlSEkf
 j0E5tQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqu1t95b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 22:09:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-295592eb5dbso1501015ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 14:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762985378; x=1763590178;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PKqNXD1DollfLI5h1J2Xseqpi/6Yas+Ng79HmXPNvu8=;
 b=InB+IHmViIyvsMQUtku3MYBKC+0JuYk5FN9KaPC3xEC8JqCnRInKvS5dx2Ob1X8WbY
 6FwV7NJgZik7ESpW2y/GB4TLMlc7WQosvOnRTHk8NSmUn59AD0500jLfxlNH2HVKxpRQ
 qJFX+R47/4kshaP1njyI3xV7b78xWTEbH6rLzsRsNkcOKuHr/0ltJo5h8mu6njCG7Szw
 FQu+zR9OkVOpc0I7F6k1vZSKbJXkr1wwpJUO4Qmx/cB2dpdRiVR73Ji5Y38DJZoBkFIQ
 3FjD9laqweUhcfYPxtHyXai5ad4XQryIDpbJomceJwJ9KGfValWAu9cRYYMNmAw8NnQh
 kyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762985378; x=1763590178;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PKqNXD1DollfLI5h1J2Xseqpi/6Yas+Ng79HmXPNvu8=;
 b=Zte1To7D3rDiJapkFtbnLt42wyeV1eu4V4lOIObDRhgZRq+81DDZ9NxcG7tvwE8Tvn
 +ZnFSh+G9gLUhRH5lGvtgdD4HVAGE5kUonnQ78y2RajvHch0uQlZCZEel6wVjFa8j+Hn
 NzUrTgndaEDa8h2AKyFH0Fa5KzhweqvXe2bzQKMB1vqge312EQEeD/GIa5y9k5bhDd3q
 X9+kx7bitS+7XjWxV5NoWi0PO6lMOy5qOEb2yrQU1K2i5IZlSd7I89hHhKJKStq6BhWZ
 92etrTCKTnoWgu2QZ4xvLYXIzma3nabCs+jO2NQwrlPaXmfk/zo+UQAc9ja9zok/Jw9L
 yt5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9b9F+ezwsLa9dHFz4vc4IjlC6Q4HOjldVTD+5q7SphJq/lrdtfqel/FMtDq8PMn4+MKhzw+Kj5yM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxe4Yvje1Goj2mtWWEm7FscqpnzGMJHvNCcdPGIc/nDF6+RM2b5
 9O1s++A0rznQeJws/MCuafeeLJk4k6nYBJDlAdNt31yZlWUMiIKzkB2wQQnFJ+ObsxPzwUTA2no
 8TE1SudPht5g6fpFiqPrKLl5Bu7azFuqN2SG8UN1xM7vXGY40qZOUEob/alpZJdCMW6JIa8c=
X-Gm-Gg: ASbGncvPE6bW7EeG9kq0mdmfLArj/LsoDpWFRdw0HI1Szaylq8N/fZvgsZwHUDLcKfV
 lr+xTcw0O7n5/Sv006tN/QrYqknpFi/GSrR+34QgvmUmNUcUnzj9FkLMzUUQVIrDtPEjsqSK0rx
 ZTDcj6f1ZdfG3N5DBx+k/pN3xtraB2l0HetHvt4V0DdaEUs4jW4K655UR7qWYYiFN8BKJrcHmjz
 K3bEaNL2Twil6TCjX1DVNsUrwn/Mkp/6i/4gffMAfLZus4ajTvcWiEWDP1apNA62MvvVU+P7obf
 Fe2E/hGEE5cz5cp0HFtLbgHqFSuORnjiwQ8irfnIq/i6kkXNV6Ac+X9JcCNwdmopWCfPAUpV6Jm
 RnthZMgoPsDpRXJE9bYFnPQ==
X-Received: by 2002:a17:903:1b6b:b0:295:4d97:84dd with SMTP id
 d9443c01a7336-2984edd59fdmr58284545ad.51.1762985377578; 
 Wed, 12 Nov 2025 14:09:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbDPQwjbxvdgWkQp34t9iHfLbIFLfFbNnosXkOr7CJTuwb5+1HxivTIaNHyQXba3NQUZhkaQ==
X-Received: by 2002:a17:903:1b6b:b0:295:4d97:84dd with SMTP id
 d9443c01a7336-2984edd59fdmr58284135ad.51.1762985377049; 
 Wed, 12 Nov 2025 14:09:37 -0800 (PST)
Received: from [192.168.1.5] ([106.222.234.47])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2b0c9dsm1704455ad.67.2025.11.12.14.09.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 14:09:36 -0800 (PST)
Message-ID: <d4753c6b-b3cc-423b-912e-61f8b7bc3c1a@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 03:39:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/21] drm/msm/a6xx: Fix the gemnoc workaround
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-2-bef18acd5e94@oss.qualcomm.com>
 <a1273bdf-d926-48b4-877e-48d5ff45e7d9@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <a1273bdf-d926-48b4-877e-48d5ff45e7d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DD3XlkugJ718Yn-lin5ht6uaHli-xyP1
X-Authority-Analysis: v=2.4 cv=Hpl72kTS c=1 sm=1 tr=0 ts=691505a2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=2IP1oaZ8+KUWsYovLW0HHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vAHTylR2Z3b6qOykXHEA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: DD3XlkugJ718Yn-lin5ht6uaHli-xyP1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDE3OSBTYWx0ZWRfX05ysMigaTZf6
 PSmXvjCQdmouAEl4pra8dFMcHRlNyuzKHbtAF9yeQcFkL4RLDPpNiI/D8h9BQMP/mU5fzsE3YSO
 3F5w/TKgYi3T0Xz+htWVnqC80I7PWhIAy2zutVN6EtY8oZlFzV5B6FBAkq5yHtOu1Ksy5a+u1cH
 ZzsO0cjiV0dfkMMdzYoxpj9drbTLpUGWbFxKAGiuJ6/czi/nkGDG3lfQuL7epP6PiTBB5wJ7JN9
 OMAAZu8Ct8S63VqvmC0F9T3VwuEuzwWuHplrOOuKgozOQhqS78a+22ZxAu3ZPHT+rZ8uhdWuMH+
 qv07auSvT3kxNBv7C5A0zUSCmQkqN8EAXZ83ia99x33fs7NvSeKZtBILcEfZrJEteILsC6gvQeS
 w34zLL4nKqP0JrdWc11E6s0iNmrPxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120179
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

On 11/12/2025 3:48 PM, Konrad Dybcio wrote:
> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>> Correct the register offset and enable this workaround for all A7x
>> and newer GPUs to match the recommendation. Also, downstream does this
>> w/a after moving the fence to allow mode. So do the same.
> 
> It does so for _notify_slumber(), but not for _pwrctl_suspend() in kgsl,
> but in my understanding, making sure the bus arbiter doesn't gate access
> first makes more sense

Yes. I didn't change the order in a6xx_gmu_force_off() (equivalent of
kgsl_pwrctl_suspend)

-Akhil

> 
>>
>> Fixes: dbfbb376b50c ("drm/msm/a6xx: Add A621 support")
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 4e6dc16e4a4c..605bb55de8d5 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -485,8 +485,9 @@ static void a6xx_gemnoc_workaround(struct a6xx_gmu *gmu)
>>  	 * in the power down sequence not being fully executed. That in turn can
>>  	 * prevent CX_GDSC from collapsing. Assert Qactive to avoid this.
>>  	 */
>> -	if (adreno_is_a621(adreno_gpu) || adreno_is_7c3(adreno_gpu))
>> -		gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, BIT(0));
>> +	if (adreno_is_a7xx(adreno_gpu) || (adreno_is_a621(adreno_gpu) ||
>> +				adreno_is_7c3(adreno_gpu)))
>> +		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, BIT(0));
> 
> Arghhh copypasta, thanks for catching this!
> 
> Konrad

