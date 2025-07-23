Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EDFB0FC5F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 23:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0208C10E077;
	Wed, 23 Jul 2025 21:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yufwob0b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851A910E864
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 21:57:25 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NHsEA4011562
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 21:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OJ+IYU0/ojEVW5G9zuKC8BY7swUqGdFQH23X2V5IKK8=; b=Yufwob0bDJ0w5GdB
 hm0F8+3TFob3MdtZgWS6cMYBLdvKv5Fts8AocKCXK4LgymsH5kvtHT2UWTEOq67E
 yXFdvBoS9yVC0zuLi62tjyaV7g3wDxrJ5e7zlQAwU7IFcgmSEzeOy2C/sqVa5MVO
 +Y1Mevz1D3P1UF+lBgOR5XcF/Gjdrys1rq0pYVRYw1F0l6012olMXSZVAb0tXE1+
 81FwbRcLFkN0HSVha2rqEerBXhWcZQVHdtvx6UjlPeYjZh7KOTjpDjUFPF+bbyR7
 TUX26bcaBskO/1xcRzdedmyaOQ6jQOc/C18YYQSaB93j0l8oXcnj754E6FRBDdg1
 2+DzaQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qemt2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 21:57:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-74b537e8d05so288617b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 14:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753307843; x=1753912643;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OJ+IYU0/ojEVW5G9zuKC8BY7swUqGdFQH23X2V5IKK8=;
 b=ZYMXx7QZzOydwMc8uTL3pOLXX/5AFkkegURRsWevIzTjqdGpgzyYDFHpRb7JzHZ9QN
 DLDEF+4UEW30j64KW4GqHSoAu3nJFnZ1S5483fEAYW6MKk5tc+OFP067MhkJGSa6rhKJ
 eyOR4NhIh+frZ1L0k25Lc1UrXRhWfmi5aUQZMJaQD9b3Kohk1UtccZP6KNBq50HuSZLM
 UIMKP0ueVtTwUa0qVwsaFWsogTHtOllQEYVTwWhNmpERPLCNUkCk/fX9y5m+QWQKQ+Ci
 y5t1GMRC5/sf2cqa1W9a/by3jETUeOocP2E0V9x37axLfoeKUjfWER696lTIfz9eWMm8
 dmpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJkbqnAJ5B8u586D2SNJHlf430aWE+jAetf5nvHSZzDV+eOh7QYIMfPzySt6jNuLLgwVhK9mfV2ew=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjDxWzgb+iW5CGvHlePTaNPjKfReR5sU/5LWVQnY1D8cgJz25B
 C0o5rjsXcT1V05qj1XMJqSCmRz7Q6puI2C2Q08gj2DaKt61xqlq1HPvO8Jb0joDDVZc+MmykCt5
 4moT4G9MIwtXP3acQZubzy8aS6iZpkKYFwPkxEJOlgTe3WzI+uLGIL6SnGSEtL9DS0u1IV3E=
X-Gm-Gg: ASbGnctiBncdzpdhM6uwuqdkAdK02kR6FCU5bx4yTsoA35P2n5vb2S0oPL0e+M6Wcct
 BI9kDOMxuPWl/ywVLajf3vy43SWrwdPGQQjsZZWJqO/ejhS3lrQ84MM7gmxeCp2+c37PK1FtzBF
 aZRMPKjo3lILZMlBfSLPGc8fIdho2UChSa3rHJk5GSA86FfVl70YYEFo4DOAlYUGv1E0+A/WSPY
 HrMuUnybKjtVDtxChWCFjJGS6Ci28t6290kUGUUIFbQhZptb1Suv8ypwfvrEb5+6RAO6WWhOBXU
 GoL/qhhK0hwpnB+UdQDMJ1+s0BC0E6T+lqvAmOttTrUWuP9pT+ROxNIcAqdxjA==
X-Received: by 2002:a05:6a00:1914:b0:75f:8239:5c2b with SMTP id
 d2e1a72fcca58-76035ff3a9dmr6809743b3a.23.1753307843082; 
 Wed, 23 Jul 2025 14:57:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWT5EGhznLq4VFRgdd229b0EV7FZUBLIcTF0ozLJKJ43/pxYlu8O0H+tTREYzCfpQFAEhI7A==
X-Received: by 2002:a05:6a00:1914:b0:75f:8239:5c2b with SMTP id
 d2e1a72fcca58-76035ff3a9dmr6809712b3a.23.1753307842602; 
 Wed, 23 Jul 2025 14:57:22 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.3])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-761b04b3517sm124546b3a.84.2025.07.23.14.57.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 14:57:22 -0700 (PDT)
Message-ID: <bd0d5470-04e3-4545-be5d-a71b9d3fb5a0@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 03:27:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] drm/msm/a6xx: Enable IFPC on Adreno X1-85
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
 <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
 <37nuk4kevhpwlzbpgm4tyhnmk6vi3a75oosz7l7xbvvn7qwq22@oomdnizhc673>
 <85073de3-3933-439d-9912-1f0ff145df97@oss.qualcomm.com>
 <50d6a7dd-46a4-4281-968d-d7df041f21ae@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <50d6a7dd-46a4-4281-968d-d7df041f21ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE4NyBTYWx0ZWRfX3W7UyGPxGE20
 069EUAhPI4A/ivLgzVzK4s/4o6fM90MIIQWStllG/govjSzhGpj5n0ad14+41qeDArs8E9GhAsz
 siISHHOlCQf6VKt+QJNQG2W/6nRXEBEBpxMrwaxmBwZOI4493lZRPeSDSNT1LXeYf9xsFPpTbeL
 6cGS2JZxk/gpYBGzP4XmGN+q01O9pzeevH2o6IGgu4D9xuIKiDGHCytlGb2XM8FPjExOC2NDIWF
 R+qdP7S35fGUkBs/ZbayLtdeciTAQfoX9SJDEBXgzOqyDMRPhSGpMqBk6RM596BOAXmKnset0mr
 zrRVL5OpGstd+F7ofISoz/fyK/KLLG58Wt6dJGmlfGqw0xdkogn5LTbeOTvRzkl60td20MG+HPp
 DdhU2XUewRDM13z3o/Mg04d+t432Aj2a9KWafan4hENqg4VJzrSv/ky4TzYhDa47JUSTmqEZ
X-Proofpoint-ORIG-GUID: X__QbRbT1uk4Br-UhAqBOCnDEKvbYOo5
X-Proofpoint-GUID: X__QbRbT1uk4Br-UhAqBOCnDEKvbYOo5
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=68815ac4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=pSIa2sKh8ADkebnh61Ypzg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=LD9g5RzjIN7if3dsUIgA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=823 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230187
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

On 7/23/2025 4:03 PM, Konrad Dybcio wrote:
> On 7/22/25 11:37 PM, Akhil P Oommen wrote:
>> On 7/22/2025 7:25 PM, Dmitry Baryshkov wrote:
>>> On Sun, Jul 20, 2025 at 05:46:17PM +0530, Akhil P Oommen wrote:
>>>> Add the IFPC restore register list and enable IFPC support on Adreno
>>>> X1-85 gpu.
>>>
>>> Nit: GPU
>>>
>>> I can't stop but notice that KGSL enables IFPC for a bigger set of
>>> SKUs, starting from a630v2 and a615. Is there a plan to get IFPC
>>> supported on those platforms?
>>
>> Sorry, no access to those hardwares. But I can certainly help if someone
>> wants to do that. :)
> 
> Let's get the groundwork merged first ;) 
> 
> Nowadays you can reasonably assume we have access to at least one board,
> no matter which SoC

We just need to add a proper ifpc restore register list for most
chipsets. But the legacy gmu firmware (a630 derivatives) might have some
quirks.

-Akhil.


> 
> Konrad

