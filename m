Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD4BB10FDB
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 18:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53DE210E3F2;
	Thu, 24 Jul 2025 16:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DJrqaO4N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4348F10E3F2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 16:45:34 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9oZUQ031241
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 16:45:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VaRb9zpC453+UAqZ78fHrEC7c8i38sw8zSJ4myj40SY=; b=DJrqaO4N52X51pv3
 sIf/AZ0g8O9a9g3sWh9QteNUucHQYbDp159CRn0BmNmlwIvEO9kVBPhQnrEPEX0A
 rtAxBfKwGPAdzkkk7qqSk7e4qEMVmgWDPMdRdgGvPJ++bgDYktprHKPyk8ONEefg
 gkLXDm9watwyPB+WR86btA9vb6WOPzFXkBhw6Tio3lbZoCCTbOA+BtH2esyD93fw
 VRv9Zs07Imu8ukGf//I8a1h/2S7wJSvlcd/p76mnADzcm17lXnlJg1mXqRfBUY2J
 cfqXsVDRv4now9TNMCzZCNsvoeEA7v7lqKfhM8THFjjicddUxFMyFlPWmTqoaSnt
 +mLydw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048vfuf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 16:45:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-23494a515e3so9609205ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 09:45:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753375531; x=1753980331;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VaRb9zpC453+UAqZ78fHrEC7c8i38sw8zSJ4myj40SY=;
 b=uVH7Hh1rq/6WqXxx2wo+xOGP899/C+TFqSHFHNKkq0KG+dV3B2kUhpqGiz0Q09y+gv
 bUiIDCcGLAmg/kxyaEtFO+XaOtBvCIeohJFkTaMrEYx7MOAv76iWKHUK6l8ZKhG4azzj
 YGN4XpV+uPSbOXfRD2TPl4PjX/n4xAT/1+0HPZax/BgUjJ4VfU+lLYdTWP+DkFI75Wvc
 Fy2LWB5ie9XC3MU8ZNvO109g/RZgCFq9Sq+gnZEneJslr2ar2KwRUIn/N449KKe/I+80
 SSf/eCc9PfwnqTalSnUOyprfHv4E5kazFQ1o6zG0IZ/KeOEw4XUH1yOU16xsb7kL7j2Z
 2toQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhyBqaELEZ3dvDWmxe8TjBxBUn83qHZspdQm/aStU6i6ZY4nxZCKUu9LQkMsNU5kbw2hmpve1E0e4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrP/i40+go47t6QP8SjLRegumJIOSpPoJF2Tegd0saQLI0+4S/
 aTZlwHDJ47ecV4UZGoUeDuVwP/GrHrUCP+mUngDCy2pYA1ZIeuJIznYq8HK5LG4vBG4Af0dN1mH
 sGRI7Qmn8KreZcJH5AxKLg4PVkPdz+cIZN+b9AYbDq+3Buiju4DjKkumA3zmtXCK17dIKOjQ=
X-Gm-Gg: ASbGnctFsQM1qp1eZ/8oKu43lIkgN+5/xTK7J/VMXitXz1Ciub4zNBV8ysje0DA4Bib
 TZVXapN5HN35Y0MqMnqJKN0BBkRjCwjUoDhHK2RDHQzKlhA7Ol+BndnUaU0gZgbWruPQq46/PFY
 qr0dE1Gfl8xGvC4P1SH7Hv7tY9byTVpOqWd59jHqKKuv7qarDlHLJ9SJPlTJkZ5LasFPKs9uShW
 ss4n8CaePGl2k4WYxYBCiSex+Q43lQr/cr/XaHrW49Wbi6loQ4lWuJhzeJm4NsKpi6UyM55upMx
 gj0Iwh8O4l1AQoDtbTmYX+PkuasD90ozYF4twyEoQoTdzfYcJTOV2qGrKsNlAg==
X-Received: by 2002:a17:902:db06:b0:231:e331:b7df with SMTP id
 d9443c01a7336-23f98204677mr132438765ad.29.1753375530647; 
 Thu, 24 Jul 2025 09:45:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpvYX2jYW1U/FwxOyFgTM+kx5Cd2w9I9tAzBvo64AFEnqPhhsH7VtWSVH5081qu+meM2GojA==
X-Received: by 2002:a17:902:db06:b0:231:e331:b7df with SMTP id
 d9443c01a7336-23f98204677mr132438245ad.29.1753375530206; 
 Thu, 24 Jul 2025 09:45:30 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fa475f3bcsm19431635ad.10.2025.07.24.09.45.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 09:45:29 -0700 (PDT)
Message-ID: <2820a69c-6ea2-4740-9264-7413ae5be70d@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 22:15:24 +0530
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
 <ac476949-d0e7-4058-ad76-c3cc45691092@oss.qualcomm.com>
 <53e0ae24-c32a-4b6b-a0ea-b056540c2f3d@linaro.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <53e0ae24-c32a-4b6b-a0ea-b056540c2f3d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GybGaYkuP0mfls_qSBcesfz3mHJA75jR
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=6882632d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=pSIa2sKh8ADkebnh61Ypzg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=bFu9_hsFAaDUiof9l7EA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEyNyBTYWx0ZWRfX0fSkis8uQu7X
 QHzwUJ+ReLK/Ts/CMShgUETJ8U33H/klBQRXC0cm3YftbEj9era2TZKeQwuovhrj0E7nt1mUDZl
 HfmVk3C2vlP3z35cCEK3sTDQAUZ8plPtGQrztFkMC6zv/pxX8hozeJoi9Ea7uXJpcefvzYfoHnl
 3dCmEceM3bW7YAsqqWZeAHBrRKMorcV6YhP5NmyjLaF6QHepVeF8BEyDA/udzlpsUd7Ldsqupro
 EihlepcxrLLzzQI6bdUl7GbOQ+b7qECb0KsowbfkXAoOOJbgQnv0F8gTSrOp5rcpgrlARTs9RHr
 2reGe3FygXRhuauca95cFIsaVGGXxXrqqlf432I8ymhD4KxwOS9QXtoLC/bdfOUgJBi0a60EmT1
 SrOeFUjWHFWFrM8rTZtJ8+pSpPwdCTbK1l/+588uAkgWGWicX42QdLaGflXv1FyN61eSvgX4
X-Proofpoint-ORIG-GUID: GybGaYkuP0mfls_qSBcesfz3mHJA75jR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240127
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

On 7/24/2025 8:14 PM, Neil Armstrong wrote:
> On 24/07/2025 16:35, Akhil P Oommen wrote:
>> On 7/21/2025 6:05 PM, Neil Armstrong wrote:
>>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
>>> the Frequency and Power Domain level, but by default we leave the
>>> OPP core scale the interconnect ddr path.
>>>
>>> Declare the Bus Control Modules (BCMs) and the corresponding parameters
>>> in the GPU info struct to allow the GMU to vote for the bandwidth.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>>>   1 file changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/
>>> drm/msm/adreno/a6xx_catalog.c
>>> index
>>> 00e1afd46b81546eec03e22cda9e9a604f6f3b60..b313505e665ba50e46f2c2b7c34925b929a94c31 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>>               .pwrup_reglist = &a7xx_pwrup_reglist,
>>>               .gmu_chipid = 0x7050001,
>>>               .gmu_cgc_mode = 0x00020202,
>>> +            .bcms = (const struct a6xx_bcm[]) {
>>> +                { .name = "SH0", .buswidth = 16 },
>>> +                { .name = "MC0", .buswidth = 4 },
>>> +                {
>>> +                    .name = "ACV",
>>> +                    .fixed = true,
>>> +                    .perfmode = BIT(2),
>>> +                    .perfmode_bw = 10687500,
>>
>> This configurations should be similar to X1-45.
> 
> Including the perfmode bit ?
> 
> +                    .perfmode = BIT(3),
> +                    .perfmode_bw = 16500000,
> 

Yes, both.

-Akhil

> 
> Neil
> 
>>
>> -Akhil
>>
>>> +                },
>>> +                { /* sentinel */ },
>>> +            },
>>>           },
>>>           .preempt_record_size = 4192 * SZ_1K,
>>>           .speedbins = ADRENO_SPEEDBINS(
>>>
>>> ---
>>> base-commit: 97987520025658f30bb787a99ffbd9bbff9ffc9d
>>> change-id: 20250721-topic-x1e80100-gpu-bwvote-9fc4690fe5e3
>>>
>>> Best regards,
>>
> 

