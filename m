Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D024A858B8
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 12:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7536A10EB56;
	Fri, 11 Apr 2025 10:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FFjd0heH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D75110EB55
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 10:03:12 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5fU0v016413
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 10:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TChXZ6jQnWmn2gjeO8rx1Bx0hrnCDqPo46JM3visYYs=; b=FFjd0heHTi5a3EYd
 unZ891elrIymmhwRuD77Z8YwUdTRanoczY0QVd38q9z1pVI/YDa4uNdGPODFedym
 HU82fi8CsN/eAfFVmJP5+UED2p42tmmp7SO0BkHwwerMo1oMT7MPeHf1RHqtCtJV
 Ypmo9iQbnnh5rrhcmL9mAlsgpSTDCcc/m8Kr3/leJ7q3GAcWcTJgQp/owAXa6CcP
 mSH4kwBIIr6e4X/Mv8fQzaG9mGWcAMfor3A/SgYa1YlSw1hp6qtgtLgPYuyvvkwW
 hZg9H/AsZVo9Jf0DFbqDa0RKnWdx7aX6sGIoZDowrxHLh6MlhpzCkv2bjEUlfmj4
 eClHEg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1su0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 10:03:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c54734292aso46574885a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 03:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744365786; x=1744970586;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TChXZ6jQnWmn2gjeO8rx1Bx0hrnCDqPo46JM3visYYs=;
 b=bScBR7xnQbj/Ghs0EsFtcVmm0pmQjjQXUCkiEvcQHukRuPmdQ7nGETos37lRYrb2zd
 hfx7izrUy5gP/WTCyh/iDcea+BS08VZ5irVU0pNB2j+L62Y5vuZV2covqJthP90wtEW8
 izwsgsyBHejEUs9f07WEeUB4LgK3hW3SSrk0Y2AX2zLGBOtV1Ao+7UGhU79c4E7vZoQD
 0Wj0Gs3PPuBbY7hCoUA7PZvVq1k48VnKh4RF4oexRGmAhhsBdVunrHqoNzxaQ5ExHfSO
 iccXu1dLFUBm9cHcwlLw14CSUiWclQyIodG3Kl3c/vV+FsTZznzQUmVFsVaPi2qJSRss
 i3Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnk4d3UE0GJm/0V5RF2HHwSoDldgK47M06Ea92s1lG4VE6xxMKoq/jgdk7CMwu09nG0MqLhA3vNI0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKVWKwJf+YO7FDcekj43jNNZH4s+z5yrmO+35Z4Dx5ZSVcGGXs
 20ii4/ZvBWT/WayC7Gx3MpRFge3RWxTzvIPk2P/ZBokh1cfMoShyGRQexZPRxArNoMhjsYrY9BO
 BjXNgRHT+rzI43DuIV9rksskawanYs5W7i29QZZmrRiN0A/y6b8nlSLoQhgwWtjPb3FA=
X-Gm-Gg: ASbGncsJF2YnbVOAYWT6tDb74F6tDeUyUZbe1R4S8ftqMZTQsaHgSeWFSdy9ksOeSOz
 7n205M10uf/2Hq3GSEJvGHfAimqmmtUTQo6vwTWXSlbDD3Q8Jp9tSIkMZIHJr0mCiLkCekf/SmP
 oCjOCrwHif+DKyxB1s2N6kimdhSztK/+0hQgRiZBJZLB8h+yfbqIFIZNUKYyNPYQbDC3WtT60EY
 VY696eKf3DEq1e3SLSrAD1kUfqLkkrAzyXtpaGx5rDw10vlJdNzQ9VCc4w1TZW4RRPU6UUqV96y
 q89LJjqGdTosHYPApKtz8Bv8IowKDqePTSsm7rPK297StD2WcFck1AWDQhGvu4Ogbg==
X-Received: by 2002:a05:620a:3945:b0:7c0:c024:d5 with SMTP id
 af79cd13be357-7c7af116677mr129314285a.8.1744365786430; 
 Fri, 11 Apr 2025 03:03:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAMFmbhBPTTCvhJj0P5xFnbrJJ/hfR7pw3RAhhVJwTUi6Q679ffPasjTr0Us/aTCC0PySNjg==
X-Received: by 2002:a05:620a:3945:b0:7c0:c024:d5 with SMTP id
 af79cd13be357-7c7af116677mr129312285a.8.1744365785908; 
 Fri, 11 Apr 2025 03:03:05 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1ccd1ebsm424629266b.140.2025.04.11.03.03.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 03:03:05 -0700 (PDT)
Message-ID: <b04464b6-2ad9-4866-88e9-437e96645726@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 12:03:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Retrieve information about DDR from SMEM
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <685e784c-3f36-4cd1-9c34-7f98c64d50f2@oss.qualcomm.com>
 <0bec3e62-0753-4c3d-abe1-1a43356afc80@oss.qualcomm.com>
 <e7bd2840-dd93-40dd-a1bc-4cd606a34b44@oss.qualcomm.com>
 <CAO9ioeUeNeSxz7ADZ-BbJbhEKkszVS+SmbqaZCgTpL=csak=hg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAO9ioeUeNeSxz7ADZ-BbJbhEKkszVS+SmbqaZCgTpL=csak=hg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4wxTFdVwh3mS4rB4R2jZgClpQLtSBO3m
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f8e8db cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=uBBskLQT7c7fgIZri1kA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 4wxTFdVwh3mS4rB4R2jZgClpQLtSBO3m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=991 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110062
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

On 4/11/25 11:57 AM, Dmitry Baryshkov wrote:
> On Fri, 11 Apr 2025 at 12:49, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 4/9/25 5:49 PM, Konrad Dybcio wrote:
>>> On 4/9/25 5:44 PM, Dmitry Baryshkov wrote:
>>>> On 09/04/2025 17:47, Konrad Dybcio wrote:
>>>>> SMEM allows the OS to retrieve information about the DDR memory.
>>>>> Among that information, is a semi-magic value called 'HBB', or Highest
>>>>> Bank address Bit, which multimedia drivers (for hardware like Adreno
>>>>> and MDSS) must retrieve in order to program the IP blocks correctly.
>>>>>
>>>>> This series introduces an API to retrieve that value, uses it in the
>>>>> aforementioned programming sequences and exposes available DDR
>>>>> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
>>>>> information can be exposed in the future, as needed.
>>>>
>>>> I know that for some platforms HBB differs between GPU and DPU (as it's being programmed currently). Is there a way to check, which values are we going to program:
>>>>
>>>> - SM6115, SM6350, SM6375 (13 vs 14)
>>
>> SM6350 has INFO_V3
>> SM6375 has INFO_V3_WITH_14_FREQS
> 
> I'm not completely sure what you mean here. I pointed out that these
> platforms disagreed upon the HBB value between the DPU/msm_mdss.c and
> a6xx_gpu.c.
> In some cases (a610/SM6115 and a619/SM6350) that was intentional to
> fix screen corruption issues. I don't remember if it was the case for
> QCM2290 or not.

As I said below, I couldn't get a good answer yet, as the magic value
is not provided explicitly and I'll hopefully be able to derive it from
the available data

Konrad

> 
>>
>>>> - SC8180X (15 vs 16)
>>
>> So I overlooked the fact that DDR info v3 (e.g. on 8180) doesn't provide
>> the HBB value.. Need to add some more sanity checks there.
>>
>> Maybe I can think up some fallback logic based on the DDR type reported.
>>
>>>> - QCM2290 (14 vs 15)
>>
>> I don't have one on hand, could you please give it a go on your RB1?
>> I would assume both it and SM6115 also provide v3 though..
>>
>> Konrad
> 
> 
> 
