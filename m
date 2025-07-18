Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E8BB0AA26
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 20:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269BA10E028;
	Fri, 18 Jul 2025 18:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oWjJPj1x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED38C10E028
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 18:30:58 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IGmaTs028071
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 18:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 r4h89Vyse17RRrUr1f05/FGG03KvAET2RVT1D25eAKE=; b=oWjJPj1xH/VrdjzL
 tWfus+B2UXGhpidyUuyT0Qii23tUed3HUFf8cgQ5yfbNEUdr3Sk55TnXlVal48y2
 XYamV9MJUv+hY9L9IyQ9PQHBELHlwhx6Pw8dsdo3CONzbheGMeam9QSeRMTp7+Yi
 toAz0LEq9CsalNqGR/C+LajHghty4fnskS2xaaKUS6eTmSHWMuCvxOQzB7SJx8pt
 1i+S3VmTR8WHN4cEjVzESrR8HwZHEjkNkEa+Gha//sq/xgtDBg6pUfWreRW/h96O
 ftGFjxkkjW47Xqy7fnSb2+H5dgewxSuJezlxSCmZMkT8nuiiHYXMwBmBNC2eDu1I
 tS+DLw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh64tkp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 18:30:58 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-886dbed0cddso2574803241.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 11:30:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752863457; x=1753468257;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r4h89Vyse17RRrUr1f05/FGG03KvAET2RVT1D25eAKE=;
 b=eTelFE2G2BUXeQJ3lBe5IVm54QL6cLmlm7sVPFoYykiydohnq89cRyQQX8NPxFAx6A
 Uucw+6CHEGZGqYUASIonKGffJwTkNKXkg7t6Gt6AKoQxkXorT8HH4P/YmybOSQzv9aVE
 81J0HMJXnA3Vi8sfrV3fQzF+h3D4LS5SuM8wsp2bUcLq2aqdjHrYY3FhJKLVWz5s6eS4
 /sYzxpmwYcL/9PeOMw1yJ/r6Gg5uyvT52Th7kw9oKz/MU68KKaoBCa5kR5/FtswG3SNo
 AW4KhUP8ysGOkps9Dz8PQYjtxe/VwBo4gz12baEZmQ84c2Q2CjS0OvfQ/wCCeuBLj+AN
 mDXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgk8dlkjmfUenHGMgwlYxwdvQe1JT7PfeqyQmuTtCDXXRURaAjvZQCWB5nEPGKgCguyrpRUpLyTHI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxM2wm5MQbxJF6gj4momaDhrm0a8okK3Cvvrx57JLTRLUoi71u4
 msbStTLAvrKg7UdvsJa7L/xtha2KAWGbDwEc/VNjCh72tjbmzNjrLtX0Oq0cGprwKCavUMV0qw+
 Dkee2xVSu+h6Rcwj+cpA1lFsjLrBiDYXnhlsxKI2q8dvm6JqsMK/ZBKbUsOnJQiqROP2Z6gA=
X-Gm-Gg: ASbGncuOwaqNcwQF/eGXEMF2XKRRDAvrUWm2lpW8aMOX6+vuyz6Omp2JlUjAgJtl3TN
 maNgjk5TDh8hdrTZwoY3jEtsv5MPueV8Gw4P7jLcPONpMcIJhRk0efz+iKIru4UKiueix7NcSEW
 qpc9otIoXMdSqHW2lL/Lb9vYhSA/na6AZS2rpzIvI2KpUQLelnCaCV5FmdiCRRjiPYMUxCX4AxC
 U8A92PGLdB6TG3q36WLYoUyxfBRa5c1Hi1dSQnGMUEIXQiLBPPoxOgglr2plPKFz1ENOjcUHg5Z
 YAZxZzxJyRKc4rpHDHXuhzUUgyUyH6fIS/9KfbbCvlMz/lRIFghpGXBVTa/X/fX7iuZtvpFHe6p
 3mZcQ3pQJU0+hj3/fxWzy/Yc4EDEHRvupaL+UXrRCfnE=
X-Received: by 2002:a05:6102:3f90:b0:4e6:f7e9:c481 with SMTP id
 ada2fe7eead31-4f955aafcc1mr7300337137.7.1752863456631; 
 Fri, 18 Jul 2025 11:30:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWyWfF3+tSP9AxR7UCyIPlKJus3GeSYS6RzS+bb0n22cuscjLeVO6oqysB5eD95XIzb3VFmA==
X-Received: by 2002:a05:6102:3f90:b0:4e6:f7e9:c481 with SMTP id
 ada2fe7eead31-4f955aafcc1mr7300253137.7.1752863455983; 
 Fri, 18 Jul 2025 11:30:55 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::55f?
 (2001-14ba-a0c3-3a00--55f.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::55f])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31a9b7c0sm357341e87.10.2025.07.18.11.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 11:30:55 -0700 (PDT)
Message-ID: <0bb0c437-e680-4160-b98f-efb816c9f049@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 21:30:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] drm/msm/dp: Work around bogus maximum link rate
To: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Xilin Wu <sophon@radxa.com>, Dale Whinham <daleyo@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250714173554.14223-1-daleyo@gmail.com>
 <20250714173554.14223-7-daleyo@gmail.com>
 <A9DB4AE061FD8BB9+3519a519-1a29-49c1-a07d-28a0577677cc@radxa.com>
 <CA+kEDGGaKrYO9Pu3un_Nq_6AOZC5L9sG+CEwh2ZEzWFeHGqtEA@mail.gmail.com>
 <eb0f5be5-3a6f-4969-affd-c01a6216ad0c@oss.qualcomm.com>
 <CA+kEDGE1kb12pW_OH1n4LmB9PVtgEsft563p9Cx_Mxev9Em3Ow@mail.gmail.com>
 <jsynzhzzt4drqcrvbuprjnvu33go4gow3l3hxgafuczdn67uhm@2eq7c5rzflr5>
 <CA+kEDGGVimBZDq1sa0gOXB7Vi6U8AVgD2E8mG_iTUJDce=56PA@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CA+kEDGGVimBZDq1sa0gOXB7Vi6U8AVgD2E8mG_iTUJDce=56PA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=687a92e2 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=ksxQWNrZAAAA:8
 a=pGLkceISAAAA:8 a=t_Of-uX1f6KDt8Xra0EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: c-pq2XGacV-bvht8pJDYsBdpT8ekUrDR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDE0NyBTYWx0ZWRfX7qUfTsGtkXBQ
 nTxOq0mUWmjg1HQttsHSDk1I8vMPyEqlSGZrRUGmYpzpnSMbilZXs6e8krtL7c+TaC/McmZksKm
 q7E79yuMddblQA/jY3PnGHHt455AAPpoMzcgnjVuHJWk/L5Pp5wXNmXc+GoyFcM/SuR1ae4ojIf
 6C9zrzzNqi4jyvOX11loTXd3xjoL5YPiNM8avavBqHgM9FI+i2wUgsuFU2aO0W3Lo2pGwrKqj8q
 qGEe251eITlhWv1c6iHcAx7lcgLhgiTaLi9vdCnJ552SpjhNxQUSBvviDhKji0OfpP7g5puEU+P
 IurA2X7YcSTz87bh0olintdx9UU4cse2ahsjIbvMkH12rVmVY1FEs4qgAuBKdkLLv7re42y6dL3
 N41l9TaqCUVs8pV3fPyDYkaDnMxxPmu1QoYWmz8vi08Lpt59cIx7pHjOkYkvnlNd3SnMSAY3
X-Proofpoint-ORIG-GUID: c-pq2XGacV-bvht8pJDYsBdpT8ekUrDR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180147
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

On 18/07/2025 21:26, Jérôme de Bretagne wrote:
> On Friday, Jul 18, 2025, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Thu, Jul 17, 2025 at 11:36:38PM +0200, Jérôme de Bretagne wrote:
>>> Le jeu. 17 juil. 2025 à 23:10, Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> a écrit :
>>>>
>>>> On 7/17/25 10:27 PM, Jérôme de Bretagne wrote:
>>>>> On 2025/7/17 04:21, Xilin Wu <sophon@radxa.com> wrote :
>>>>>>
>>>>>> On 2025/7/15 01:35:42, Dale Whinham wrote:
>>>>>>> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>>>>>>
>>>>>>> The OLED display in the Surface Pro 11 reports a maximum link rate of
>>>>>>> zero in its DPCD, causing it to fail to probe correctly.
>>>>>>>
>>>>>>> The Surface Pro 11's DSDT table contains some XML with an
>>>>>>> "EDPOverrideDPCDCaps" block that defines the max link rate as 0x1E
>>>>>>> (8.1Gbps/HBR3).
>>>>>>>
>>>>>>> Add a quirk to conditionally override the max link rate if its value
>>>>>>> is zero specifically for this model.
>>>>>>>
>>>>>>> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>>>>>> Signed-off-by: Dale Whinham <daleyo@gmail.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/msm/dp/dp_panel.c | 13 +++++++++++++
>>>>>>>    1 file changed, 13 insertions(+)
>>>>>>>
>>
>> [...]
>>
>>>
>>>>>
>>>>> Is it a feature planned in the short-medium term within the MSM driver?
>>>>> If not, would a quirk like [4] be acceptable upstream in the meanwhile?
>>>>
>>>> I'm not a display guy, but this looks like yet another block of code
>>>> begging to be commonized across DP drivers,
>>>
>>> I agree 100% in principle, but the 3 implementations are different today.
>>>
>>>> so I wouldn't expect it to be a big blocker.
>>>
>>> Well, it is for me :)
>>>
>>>> Adding a panel quirk doesn't seem in order, as the panel is /probably/
>>>> very much in spec, and it's the driver bit that's missing.
>>>
>>> I agree that a quirk shouldn't be needed. I guess we'll work on
>>> upstreaming everything else and keep an out-of-tree patch for this
>>> issue for the moment That's a bit sad as this will block regular
>>> users from easily installing / testing via the Ubuntu Concept ISO
>>> for instance.
>>>
>>> Or could the quirk be accepted temporarily with good comments
>>> then reverted when the driver adds the missing support? I guess
>>> it would depend on the time scale of this support landing.
>>
>> Unforutunately, there is more than that. We should also be writing the
>> LINK_RATE_SET register. So, just setting the max_bw is not enough.
> 
> Maybe I've misunderstood. When you say max_bw is not enough,
> are you talking about some future driver changes or about a potential
> shorter-term fix?
> 
> I can confirm that this initial simple patch (and also the updated one
> reusing the quirk list [4]) is enough to get the SP11 OLED display
> working whereas it doesn't probe and remains off without such a fix.

These parts were changed in eDP 1.4 and then 1.5, but basically, if 
MAX_LINK_RATE is 0, the driver should also write LINK_RATE_SET register. 
See how it's handled by the intel or AMD drivers.

> 
> Thanks,
> Jérôme
> 
> [4] https://github.com/JeromeDeBretagne/linux-surface-pro-11/commit/d265cfb
>> --
>> With best wishes
>> Dmitry


-- 
With best wishes
Dmitry
