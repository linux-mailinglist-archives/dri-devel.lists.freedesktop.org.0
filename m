Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD42BC56976
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 10:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A509810E7F5;
	Thu, 13 Nov 2025 09:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pTwEa0O0";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UbX5WaZb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A81510E7F5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 09:29:14 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AD65fl93563289
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 09:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dk2V+f97R7FIH+RWhnR8qR74s5z0Cna6ABS6uSkhx9Y=; b=pTwEa0O01ggQkmZ+
 aheH+/m17sgjioEGYcDKKAHqaOCVf9Ch/1rOlFiqgbN8wMlMEssOojpkhNjULEA3
 bmifele/wxUqi/ey7vdSZTQ+OWlIFhL32vvnyzt0SVXs2F63ljSbPcaEJ85OG5Zz
 vNnUQa0Pyj3BkfD4FoQx3nnB9Dih/8AGkiZIHqlitAfWYroWhJvMagRXnaVglk64
 QaA1Ywc8LWOb2r7zDljj5Yxq2VdZyMJWSeVNZTNDIjNKqv3bmDD5++hxbp7H69+g
 CCcJjvk/IIqNDt94IWpVbfYjDlcoZuIONdBk1PG5k9ihEPhCbcBkFK2wAQ+eU+Ue
 Y5HoGw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad9rvgm69-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 09:29:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed861df509so2280341cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 01:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763026153; x=1763630953;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dk2V+f97R7FIH+RWhnR8qR74s5z0Cna6ABS6uSkhx9Y=;
 b=UbX5WaZbN1CdWLvtZjeznsevbsYD/66pQ5sbFDYeP3VzauemIEMWSLmUe1rtvGEU46
 PKnOknq8EQQP1FA5wOOg/585VapoHVMuvy4esl/j3caSTyCTMYzGcZ2wmGaY+XYTqxkZ
 K7fe7AqWM+DDBbN2mzcRz83OCXhOL9lsmfREjK9/Z0C9erH3rInVBAKvT6IueVJb+SLU
 XCAKwcBnwgUMvdqu5hp7zpLoscP8yMQn91XyJvr6EANACdjaQbGzwljwW2N5SkElU78Q
 Gkts3GGaH0O6qNaWrok1Q1Cw7hsqfZxubvRdrHair0ICt6AoEQXDWKxAFOX85yKsJCMZ
 pjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763026153; x=1763630953;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dk2V+f97R7FIH+RWhnR8qR74s5z0Cna6ABS6uSkhx9Y=;
 b=LxGE1oyWdXqdoaBqxMNbrsYSKNX4X+udu1nqENZyQFT5mCVSeQW1ukmFdksK03tPZF
 RLnnNdDNpnCdsNHha2lhh2ZTVyVL/+kMTBONmtbjkjI1lkK7x2Dm9JytShepy0EUS6Ax
 XAwyAu9nv0+rWAyrTNgqFPGb4XmtX/A5+9sJjFLGGA3Xlx7pM7GVp4+xIPtSkFulwPDZ
 +IOaxKsLeI0l+6dIJ7hniI2h6f/7nn5UmoDXxZyO1zzMhHKX4f7OrbO7JK8XhEcFr6HW
 RIlzExcWkAFkKNH71vrEk7NK756wKa6ZGJlCltqtw4xTU2D/UnBA4CB5FwKhHYREnMb1
 nKnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe/DaZjshTLLubhIZ2iOnQJnDk/WXTEFYUpFBxbr93vSFCWLSjzICphAV2YPIBYhAKyqzHCw5yptw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlcAFqLFr0sRKZtHdC4l80atKrVCkSpzr2GH1MdqKqYPjhmx7W
 VcrqUHf1zPfdVh2rxkhiSRq+8rvjowk+jIFyq2oVd7ofdFeRn0ptRBjGnUPh8u33+QfKHeXjFmg
 P6GGwsBVFg2i2lL+EPCE2MsMBC8uFFvQHuybyp7vq1PqjsfilDk3Pdkc+zgJwAuWDXSIo654=
X-Gm-Gg: ASbGnct/VR1p9mXukz7IRwPTfsUNqpdcwxBVuj/FaVOS6B3YT2EPlFmZ8cZtXpCdxz5
 Wi42cNQbL6+d/RQQIkzsu6b4OXkl6mMYdDgeKxhwwd1sN1qACqJ6hISkL1jHwBstI6S8NE+YRmY
 EtyvlJZnkUcfK3bn+Cl9B/MQ+GFBSCbGU+5ZpsPuKtOlVNcZf7kvmxorLAuCsgU5GLzRi1hXyv3
 g6FI+ScJLK5gX2/IxNV1NU7YE2NNP/hWuSUyHVIeoO4q6msT36EiBi4lltNCQkRvqOLAZIKbkZ6
 gYwq6t7AaiG7JnyYwtI+9fXBDhexD6jJ6uF4votrvomW5gicU01xD4m7gfDjewxm6+Ac2Ekd/Ck
 f+l/Fsv+TrsZZqaDgDAUHEjhOuFWrn2gelX21UahtznjzQJr6uL/sjIl9
X-Received: by 2002:a05:622a:16:b0:4ed:6e12:f576 with SMTP id
 d75a77b69052e-4eddbd65318mr52613551cf.8.1763026152913; 
 Thu, 13 Nov 2025 01:29:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBKglDPCuRYE0ZGVzuJPGPVwQT3YRBKzTtOU5WmAoz7l8pjecUcIWj985OWak6SKf5r+bgQw==
X-Received: by 2002:a05:622a:16:b0:4ed:6e12:f576 with SMTP id
 d75a77b69052e-4eddbd65318mr52613171cf.8.1763026152358; 
 Thu, 13 Nov 2025 01:29:12 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a2d746bsm1057796a12.0.2025.11.13.01.29.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 01:29:11 -0800 (PST)
Message-ID: <f76b51e0-43de-40c6-8be9-cad2bd2613ce@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 10:29:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/21] drm/msm/adreno: Support AQE engine
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
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
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-14-bef18acd5e94@oss.qualcomm.com>
 <1202b66c-6d4f-4909-a010-7e5e3ec7f0c7@oss.qualcomm.com>
 <cc4ff1c7-3158-402d-b746-5aa57b4a855f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cc4ff1c7-3158-402d-b746-5aa57b4a855f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XrX3+FF9 c=1 sm=1 tr=0 ts=6915a4e9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=CPo_bn1fJaELX20lIFIA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: oUKL7CdbsQQq23bdJfkd4sc_4QT-br8A
X-Proofpoint-GUID: oUKL7CdbsQQq23bdJfkd4sc_4QT-br8A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA2OCBTYWx0ZWRfX7VD2hVLnMp8q
 ZlW3DrR7ol2UnHmz0znvnTffIT8sNqvwMJTpZhMmLLcfb7EeB9VfAjVeNZdOtks53CmIBx48OdY
 806XrWOq3nAXdEVn23DIPXaKvmbwTlEIjt7Xr0yUebjKefTP4tl4UtIZ+TC2F+nGSnvyhLBGeGU
 lXcz6b46sOkPTTTG/nUtfdSomc/DWJj/hIlYkz9qoRPsT+rs0qkJ5Jn8eRy/04ZIPn5kuV/TXKg
 A3KzN85ahb6ogtONdZbrvanmSXEQyieQhp2DtMXDYwlbFV4HtKTojS0XYwNyOxEZtrYW0n+hOds
 r7vzfCcDX4m7cdkoUVuCO67lBByt/vfkfYsaUfrP6X3kwJ96JErg+86MdG/RZ43Rv+kEBZk9zJ9
 WxW6R39Gfj41n947us7oJj6OdJN0Ig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130068
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

On 11/12/25 10:16 PM, Akhil P Oommen wrote:
> On 11/12/2025 4:37 PM, Konrad Dybcio wrote:
>> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>>> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
>>> in Raytracing related workloads. Add support for loading the AQE firmware
>>> and initialize the necessary registers.
>>>
>>> Since AQE engine has dependency on preemption context records, expose
>>> Raytracing support to userspace only when preemption is enabled.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---

[...]

>>> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>>> @@ -616,6 +616,9 @@ static int hw_init(struct msm_gpu *gpu)
>>>  		goto out;
>>>  
>>>  	gpu_write64(gpu, REG_A8XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
>>> +	if (a6xx_gpu->aqe_iova)
>>> +		gpu_write64(gpu, REG_A8XX_CP_AQE_INSTR_BASE_0, a6xx_gpu->aqe_iova);
>>
>> I believe you should also set CP_AQE_APRIV_CNTL per-pipe
> 
> We already configure CP_APRIV_CNTL_PIPE for this.

Aaaah right the register I mentioned is separate on gen7

>> Should we also enable AQE1 while at it, to reduce potential backwards
>> compatibility issues? Would that require solving the iommu woes?
> Yeah, AQE1 is strictly for LPAC workloads. So lets wait for LPAC support
> first.

Sounds good, thanks

Konrad
