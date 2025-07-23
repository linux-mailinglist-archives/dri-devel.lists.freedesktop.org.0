Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2146B0FAD8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 21:11:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D95D10E191;
	Wed, 23 Jul 2025 19:11:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ej0NzkNI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7E110E191
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 19:11:52 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NGNFpG018863
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 19:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 V9jA6Mn1SUrOwM4UhmLUB7hjDyvroazQdXjiBfsPsCw=; b=Ej0NzkNILdycTX5T
 esuaRP1GVX4zJvOHh8fOZB/+MpZnGQecrdbCk8vy/8otih5K7GO/k0FKrWARUsTj
 bwKdoLFdhLYDnntf/gqU/InnPDXFshmXQG5tMb/uOK/gygRBFZ08xctthVgijDcu
 oPnjpRtyg935NMbiUlFSgcmQ4use9cVUtD+SYC8npC3IjlR5D9EIDRrCssMR4elf
 V4ZXt9nWXPEqdO+YlPN/zGVdz30g6U3iUGjvqwMayeainleHSlvhHnz/KxLBu5CX
 wDJLCt+oNAel0kyA4NQIe1oPzsusSZrmhIw1dpjyp1jD4BOyMxgYp+Aqm38ZfIlG
 wC31cw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483379reb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 19:11:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-237e6963f70so2348855ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 12:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753297911; x=1753902711;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V9jA6Mn1SUrOwM4UhmLUB7hjDyvroazQdXjiBfsPsCw=;
 b=GTB16jUpuxR8XIp2dVJI2UgeWCr6pK50bae5Q/26KgcV8Ka6kqomvPE+eTPDe22IXq
 FERqC9/Sklghh8H4XYZf3AIiz6rtekUrmvDHlORr0rUHOSJU74fdFWwQgem1G4n3pnIw
 pm9pttIckFu219xA9mgWB1UrzXEFXjCcLKvJd8IIUevoRtPJNYFoMHpcBkfHJOWTXCp1
 VNfQ7xeSyy4gtrt5Hm/FQYjmWZeuHQr4KZZLZ5oqUTA5nFqzLi2RxJmd/gxXLyBG9yGt
 C/17htfDewssKhl7xp0y9HyhjzoA9N7wcW69OiuYoNOBwplfRElBZBj/vVcBfT6qbPXK
 ZbRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdD2vAdXYWERCpwI63PXxSY/6NRbRGB67xSa0kzlgG7v2jiqQX3iCYth8WhabRy4oBxq9VcEMN/XM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4/zXWmGRPd9UxeDKYPLenv/dC4/SzghXTS0QQJd5+9zPkgNYS
 YotUj4+ZBpQZyDUbwvFUf85argtjCozVFVB99f45H2tfv/idHG7MnsBCm+7IOmGPvbWGNkf2PPC
 qGOmAleUNL/MvOD6o88w6yb2ShJLPu6nFUr7wSnJdbdqDT0cLMPKaY0PzJRs/XM0i60I/YIM=
X-Gm-Gg: ASbGnctc8P/O8jBhgizvBwZ6whc+RZyDl7j6GYNsRb/8QSW0IJDD2rcej5rqTpzuonG
 zIaiI9aFS8kjGG6EELTAXENI0iAuA9fv7H7sDj1Sc9m7qJuAt5fx0QcuqNGabZb8cw0avvsw4LI
 OuKWGrqIJO61PMOaf3ekXDkrnWDrUHzSUM0DV759l/H0/K9HF6T4ITAhxY1ieqtkAbq414TAiue
 FjQPh9a48ZXTSwHzt7+nKjxy+BJ8I2v6giKwWtL4gm9fFwS3rJS0S/lWfYEQR7Nc2ppDBjCa8s/
 5M2LzbmRHK+DC8CkWcu547hffuAMefWcEjcFuQ/DpKK4uSYb8i0nYOR0tgaFQa/F
X-Received: by 2002:a17:902:e885:b0:238:120:134a with SMTP id
 d9443c01a7336-23f9814034bmr71876875ad.22.1753297910884; 
 Wed, 23 Jul 2025 12:11:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFE6DGeXECpuu6lms2ga/Vg8TctuO58RgApUp7nY5NpQJNo+xZQMgkHkcbiQe/1P/POntb0nw==
X-Received: by 2002:a17:902:e885:b0:238:120:134a with SMTP id
 d9443c01a7336-23f9814034bmr71876565ad.22.1753297910432; 
 Wed, 23 Jul 2025 12:11:50 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b5e4918sm102288265ad.41.2025.07.23.12.11.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 12:11:50 -0700 (PDT)
Message-ID: <135cbad8-6c33-4a0c-babd-31477d9be4b0@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 00:41:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] drm/msm: a6xx: Fix gx_is_on check for a7x family
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-3-9347aa5bcbd6@oss.qualcomm.com>
 <84a33e15-edaf-4951-8411-24b17ee5f4f5@oss.qualcomm.com>
 <62391e11-2f26-4e30-9c8d-b47d4985b41b@oss.qualcomm.com>
 <jeg4dw6wpxpfaio5kd5vcbqswq5nlclor7tbbh7er7zlwgdgxr@ksrw7waxj3mp>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <jeg4dw6wpxpfaio5kd5vcbqswq5nlclor7tbbh7er7zlwgdgxr@ksrw7waxj3mp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tTAAlX6X9pRUoUc9Ll-2KVxkmpfJqUf9
X-Authority-Analysis: v=2.4 cv=btxMBFai c=1 sm=1 tr=0 ts=688133f7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=R4_TJjaFeOAkSM8ik1MA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE2MiBTYWx0ZWRfX6cV3zMUtSc8f
 WyQ35bF/GDNkBLsBEuXHJcmindp+neUDC50YH9XWfHlP0hpE3rd3SOBWqlbOcQFHEYPlpi3H0pB
 pXO4m3tNKAXwgkL+EoqJrcn5O86P27OEwDUuJDayRBwwq46hlpB+YR676wbHiy+rULP+CSZAiMJ
 fbqTSdD4BzmS8g8nuVIKz7wvD/OAKTQgVoSEhnpmNzMG4rACiEuiO0lwYNjuNVSHJrwZaEgglLZ
 ZpMXZjmSOM00IQ+/1kqO9LebTB5tybWIflTkZWIRTNNkkXrajkltCxl2C44VLzN/Y4jAVzv5Abc
 WAPImET/fO8PjNVHl363lZvn6E5HSH6Uh+Ab6KKKoM/eM292UKIKQGP6hazJ+KxeN+7Mld7p7z/
 0QGY0YJq1PIhlNqIV+YlVKft7bHIA98V0qLTKFvGSazTSqcUMihwteMfQjJsKGcTTAGNHiWX
X-Proofpoint-ORIG-GUID: tTAAlX6X9pRUoUc9Ll-2KVxkmpfJqUf9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230162
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

On 7/23/2025 4:40 PM, Dmitry Baryshkov wrote:
> On Wed, Jul 23, 2025 at 01:22:20AM +0530, Akhil P Oommen wrote:
>> On 7/22/2025 8:03 PM, Konrad Dybcio wrote:
>>> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>>>> Bitfield definition for REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS register is
>>>> different in A7XX family. Check the correct bits to see if GX is
>>>> collapsed on A7XX series.
>>>>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
>>>
>>> This seems to have been introduced all the way back in the initial
>>> a7xx submission downstream, so I'll assume this concerns all SKUs
>>> and this is a relevant fixes tag:
>>>
>>> Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Dmitry/Konrad,
>>
>> We don't have to backport this change because the existing code reads a
>> couple of unused bits which are '0's and that is okay when IFPC is not
>> supported. So there is no practical benefit in cherry-picking this
>> change to older kernel versions.
> 
> Fixes tag is not about backporting. It is to point out that there was an
> issue in the original commit which is fixed by a new one.

Ack. Will add the tag. Thanks.

-Akhil
> 
>>
>> -Akhil.
>>
>>>
>>> Konrad
>>
> 

