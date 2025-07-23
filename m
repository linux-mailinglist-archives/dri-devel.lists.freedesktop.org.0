Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A281FB0FC39
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 23:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3EF10E06C;
	Wed, 23 Jul 2025 21:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VjClZdQ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0659610E06C
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 21:43:31 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NHBd2x020122
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 21:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Uzsd1xcUKgsxCpgkX2HBRK56tDWw0kgTphmNT2IrLUU=; b=VjClZdQ1R/6nAsi4
 mu+I9PBYb7YhfPNj0w8Fs2qNGeoI0KcHczcDEQM4o5IUFyS2ten/n4F2EaZ0523J
 rwSbI+nGvi6txycqRvmmWqGt4TqoqVyFrRTQQ8wJ2wdvV9Utxuk7JKTuhjRe+Y/+
 dzkhAyUuM20VVUAL1cUngxGKagZdTcdJO1ATwOvU7z8zjcqd478DxIqT6vGHIlBK
 l0QMIf7/80G4LjaVbL6jEL3SommuCkoaEr45iupaESdgvCqTe/FsONjzPSlsr8kd
 HOCt8TtVevPIk2MBl2ZMRe6Wejvy2H80sbG19DlAexLixjDP8noHmMTSjUhbaWW8
 klxYZA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3ese4u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 21:43:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b3f657b4badso242821a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 14:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753307010; x=1753911810;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Uzsd1xcUKgsxCpgkX2HBRK56tDWw0kgTphmNT2IrLUU=;
 b=oNkyVQ7YVY6Cn2aHajbfpeKQDwl51kCXUeHGI2O/qylFBPO6qxsu5fKjNh1S5Zz+H+
 lVNYq9sD0ZRZljHr2r2XQ1mr/nd21F1uVZn9GDLaA8iqp5Twhd3maEUwHbaJOFB65MHU
 d9zzYm5esWyzcU9Oz/FarVQlQxb9srOzhisYJddu4ld5EtnjwWyW/uaxWmhZa9A7wNmU
 4cCEQRKYAyi/WRmiYkL0+i3kwEQeZ+FOdWjt0UbY46zpZdnvK+MR9FXh+RfES80MfQcs
 vj5hZ8huo9VHlUJkiU6FNuPsszxiCJEjpwyzdqdKyGqmjVeNFtFZuDZSoBXpx+pv0ps3
 2tdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAhig2a3Rv83Jmr5vEOIYtr0Yf/AdPujQQ8vKW7x5McJ7G9OTWZkgrROxKPWbkYie4XuG2cNq1bkQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yztc7Xpz9c9CkiLp+iFhCFFCNM51nQfsexm8R7E6sYVCRZuLrgx
 W3qlH18VdCKqXUNl8YySdim4ItSjBqV/ND53FsAR70MCARVOq+pbNujxPE9WqC2HoDiNEGnBvWc
 oC9axDCr0P4m4kI47JTRxHTGFhuvIX1pKPpC11bB/R2LLtJP7nuutSCyLW5WiZlrVvjzd6ZQ=
X-Gm-Gg: ASbGncvrc+sciWoFSUfJ1zltNavKTURWMOgIpWrCtYh9zgYi5nfI1y75CMrOXiJjWj9
 8D0yBO5pqA3DH6Wk6SHmYmv6Zc489XEGZfa8AYWSTvwWmCAVgrHbDJ1YGbrsoxE3irYn8jZdNZ4
 /57DrxiqslsgpRjfuyRGdbkkCzhV9v4vk94IZU4tMOkPcrs1ylWiWz3Ar/OVeE/brcK3NdDanN7
 FFlp0SP3kuCWTF/+usRVeq80T4UZsHQ7/wGUDE7kohhFvDVwuyLvkmmpmJLqywe593KoonSDxcI
 mBam2VeCDrNWAZcsogz0iC2h/JWebwYwcyM407UPcJvOWjPv6Eip1QTqALp/rQ==
X-Received: by 2002:a17:90b:2e4f:b0:311:b0ec:1360 with SMTP id
 98e67ed59e1d1-31e507e27ccmr6472060a91.29.1753307010583; 
 Wed, 23 Jul 2025 14:43:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzTDpyK8uhEHXdusySPe7kL1WJwqg+L63lFCGjVnLvsY2leb5rLrYmu0tDVWGGC6nfTLKVxw==
X-Received: by 2002:a17:90b:2e4f:b0:311:b0ec:1360 with SMTP id
 98e67ed59e1d1-31e507e27ccmr6471989a91.29.1753307009327; 
 Wed, 23 Jul 2025 14:43:29 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.3])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e63a6677esm18638a91.3.2025.07.23.14.43.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 14:43:29 -0700 (PDT)
Message-ID: <d06c6b86-2aa0-4f59-af8f-0130897c7b26@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 03:13:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/17] drm/msm: Add support for IFPC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <20250720-ifpc-support-v1-11-9347aa5bcbd6@oss.qualcomm.com>
 <k653qq6a4xkvwadeum5kbr7cheje773vobehpzq33ec44vyxjj@vi3ekv4jwext>
 <6472bc1a-9546-4cb1-85b9-d826f76ba9f4@oss.qualcomm.com>
 <5471754b-5dec-4107-96d6-a6075328d824@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <5471754b-5dec-4107-96d6-a6075328d824@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PMEbg0XYOQbUXkDGyEodNO_t-quz2a4T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE4NiBTYWx0ZWRfX+Bi5d9rXIl9H
 wyMabNEoC1tBDYB+xY+jGryYvnNB0eo0hwOhtsNspXVYXKOGUkkEeRFgALiSEXHrpBsvY565I/n
 BaulMNOJv+gd3Wk+hFToNEGCmwyWE9SXUc2Vco2VgHqph0nG+TaO8IUdBaPGoZDAG/Lp6sz/4QK
 +TgdVUKUAyxObdzowNNw1koDdrJOYpPP1/NczR/1BB3HZP623mLPdU6Ew67hlLXHkAO+h8nvsFv
 B46SvUzRRxFWb9HKZ3HHW7CdApiVLgBvf7TPFZBOXjIXRmZEHUJvmcJRycxo4vjeGOaXJBgjWK0
 faz4NJgG7BhrgG4BAwi6nFIrOwVfwmdTmNZDQzGu+yHcjXw3j1dbgv8BKaWtxxcvogwp7NJbi3G
 /ezIw6WLHW3UO9mIUOnHCk+tVlYjudIDnsgmQ7TyXUWoZ8kRyH8USt0AOAbLCHJ3yPZdMywI
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=68815783 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=pSIa2sKh8ADkebnh61Ypzg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=-ImCKyWHiv6jzAo2IrkA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: PMEbg0XYOQbUXkDGyEodNO_t-quz2a4T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230186
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

On 7/23/2025 3:57 PM, Konrad Dybcio wrote:
> On 7/22/25 11:27 PM, Akhil P Oommen wrote:
>> On 7/22/2025 7:19 PM, Dmitry Baryshkov wrote:
>>> On Sun, Jul 20, 2025 at 05:46:12PM +0530, Akhil P Oommen wrote:
>>>> Add a new quirk to denote IFPC (Inter-Frame Power Collapse) support
>>>> for a gpu. Based on this flag send the feature ctrl hfi message to
>>>> GMU to enable IFPC support.
>>>>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
> 
> [...]
> 
>>>> +static int a6xx_hfi_enable_ifpc(struct a6xx_gmu *gmu)
>>>> +{
>>>> +	if (gmu->idle_level != GMU_IDLE_STATE_IFPC)
>>>> +		return 0;
>>>> +
>>>> +	return a6xx_hfi_feature_ctrl_msg(gmu, HFI_FEATURE_IFPC, 1, 0x1680);
>>>
>>> magic number?
>>>
>>
>> Let me check.
> 
> techpack-graphics/adreno_a6xx_gmu.c:
> 537:#define A6X_GMU_LONG_IFPC_HYST      FIELD_PREP(GENMASK(15, 0), 0x1680)
> 541:#define A6X_GMU_LONG_IFPC_HYST_FLOOR        FIELD_PREP(GENMASK(15, 0), 0x0F00)
> 
> (same value for a7/a8)
> 
> 0x0f00 is 3840, which smells oddly like the XO clock rate (possibly mul/div2)
> 
> (38.4 MHz or 19.2) / 3840 is (1000 or 500) (ms? us? cycles?) and the other one is
> (333 or 667) - without any further information I'd estimate this is some sort of
> scheduler tuning

Thats right. It is around 300us. Will add the same macro in the next rev.

-Akhil

> 
> Konrad

