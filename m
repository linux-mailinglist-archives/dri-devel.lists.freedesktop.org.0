Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B9DB0FC18
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 23:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41F510E1A7;
	Wed, 23 Jul 2025 21:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZRh9zb5o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521F310E077
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 21:23:01 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NI2JWa007900
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 21:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5/z+nOL74D8w9vAYW+IhxAClZgEjiAjEMElrQIQE8RM=; b=ZRh9zb5op1HY/obI
 UCGTeWI5u9C68rNnudRJA34p1jMqbwcBS3oO0Re3H2Bwvf6ubd3nDCmPJZaQE9Qx
 FBYC6VP1VnBlcGGQlJdg7NOqrDvab9MLLvYYuAL8f4rsBZPVyrVTp+3fSwYmtPn4
 e/pQaDhpbOnS5/CIGWcm6mctTuLCPhSuZdVNc1Fe7yvd39HycAOnbOw08ictgRza
 lChhdyVun5sAXIEi6peN11qjkgxculfH3n0CBBhS+45FQfO0FMuCHkBJ2IoiRZwf
 ep9Lqjh02Tmn6/nMojFb81fg9n7OkKxAFrBObXS4TRCj3IZnjhqEf4CMWWrCCAH4
 l+ysnA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3hvkkw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 21:23:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-23494a515e3so1885265ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 14:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753305779; x=1753910579;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5/z+nOL74D8w9vAYW+IhxAClZgEjiAjEMElrQIQE8RM=;
 b=hCJWNmCnutncOU1OIWq5WSMsn2IJRHKtwiTP+60j2QyloC0Dm+1kjrdS57wVTUtD8I
 Zt7760TgnqYupL/4dHylrK13bkS/wrFOxm2ynAb3E7gNll1B0aCMP5elOSRWbtIRCfYC
 NARs1YNAeA4+EFsfhnK1i0lWWJtaWG4sdJLI1k93hGKLxUCSkaVFXH6KypcWpK7iAyqY
 PjrhUAwpJ4FaDSkimKtZlqCVmS7l5+vqKy5/sIJxubmVyRl5EljNHbzHECRZJab2tCso
 ertR9jXHKASXbYctzwg6rNsTS3Y6XKkobNg+axSbFVhJIKdFsown15d+w/dC3l27gowE
 0Anw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCzWhvdNSy8G9xf6mGiB++miAM8UVoDtQjQClTBJdWTHJQO41A06YMOagHJ2P9xZOt58tZpXEEXV0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYL73LYQzXxTM+anXjQu9whF2wMkjqemO2tgCTb/LKkIeYpFxw
 nS9uqZgT0LGPj2lrJRMhHcqnlAG123gt9BuQLADN0er+ChslhgGsLYf2o/OEJL3BpyfeCndK1w/
 /ugjquVb6migLDC28Tr8UfzvVP/voG9mKUWqe4opCBOBPu1o2Q9VMKvYG3wCGtZB5Wcyr2Tg=
X-Gm-Gg: ASbGncvTqeKtgbkRAB9/D8JHUdWInxwDr83iCw/5UHdA7iaeB5NVN1Igi2slQyeOgUS
 IJ06G0RbolVagtztt/YfoHpfWfHXbwQN+khHL6KU9g28BtCv1IzxC0u8aZypwqho9+qw6Zq4NsK
 R3Pc8tjeYz4y9J/j9YGvChU1APtRa+LbwtPk0867i8p81shYDohID2DNEpmPXXQbFpCihgN6UZL
 AjNYBlQzxcCVcbUaXzQ/wd5ZWV4AJCPpHcUhb6GOYzi2nMYjy0js11KlkwyJjICyxOU+ZnKr4uQ
 hLIGmNEruSGoZulks1gGcq51Zfl/tv29lOdtIB08HoKQ0IB0rV6wcCCFcM2PNg==
X-Received: by 2002:a17:902:dace:b0:231:d0a8:5179 with SMTP id
 d9443c01a7336-23f981ab03dmr63604495ad.23.1753305779152; 
 Wed, 23 Jul 2025 14:22:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAnCXs/FfPCFuiouSfivDnKR2aZyEWeXP92FqAGxP/yYXM4uPOB9jhUhkeFLnVtSM7YSM/Iw==
X-Received: by 2002:a17:902:dace:b0:231:d0a8:5179 with SMTP id
 d9443c01a7336-23f981ab03dmr63604205ad.23.1753305778738; 
 Wed, 23 Jul 2025 14:22:58 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23f8c3f14d5sm41141445ad.192.2025.07.23.14.22.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 14:22:58 -0700 (PDT)
Message-ID: <9322badb-9f94-4bd1-9e3f-447a9134cd7d@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 02:52:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/17] drm/msm/a6xx: Set Keep-alive votes to block IFPC
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
 <20250720-ifpc-support-v1-8-9347aa5bcbd6@oss.qualcomm.com>
 <jvn44gmttkidyy4emnz6mytqqjbwltlxibywfr6bfbqjfbq35e@fuvvefesqbzw>
 <0427769f-62a1-4a20-af94-b340413296ab@oss.qualcomm.com>
 <644a81ff-bbce-4cc7-a364-8e0c591898b3@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <644a81ff-bbce-4cc7-a364-8e0c591898b3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=688152b4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=pSIa2sKh8ADkebnh61Ypzg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=CLd7HrSr3Nb56GcGzJUA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE4MyBTYWx0ZWRfX4H5UoOYUqZLG
 e74yUg7hhbXvVrQjcH31FcBlnuFsdZqL+2kXte/+qnf+/gmokbGOTyzN4Fl7xQsMf8hglXuLsBE
 nLcmtQH58pRKodbdR5QJvF+n71Oq1BXSuZQXBmpE4o3ITJLZ2wDkrXm7w2Tixap7AsrHdhf4rN2
 TAFufkRfI5vcEI2ctEa8dwyPHWMQm3MUKOYA+4vSE5YudnGZAwlGWE4tipqoxS8tOTogkVX8R78
 3nyr8ge7e6HRanrblvzUXNePDcFhBNKKkGPiyIfp9ezED7fGtEexnzGSMioU4vkY1gxEWZq69JM
 kRLtqUFwZMOdyYcy/Cdw/i1lpEMUsWzpcKA40escl5cOS+S0Q0D+hvAy/y6uV8SYvSg+Y8EnS6C
 XB1ELwUtfNCgVmlBcdzLvKbye6gbZHYvhYLvAC33fpjbHA/6gvnkJ79oY++a2K04gH1QPede
X-Proofpoint-GUID: aa_AnJvilZd5hriycBqrTFgCYoJRyuRL
X-Proofpoint-ORIG-GUID: aa_AnJvilZd5hriycBqrTFgCYoJRyuRL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=803 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230183
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

On 7/23/2025 3:35 PM, Konrad Dybcio wrote:
> On 7/22/25 11:24 PM, Akhil P Oommen wrote:
>> On 7/22/2025 7:14 PM, Dmitry Baryshkov wrote:
>>> On Sun, Jul 20, 2025 at 05:46:09PM +0530, Akhil P Oommen wrote:
>>>> Set Keepalive votes at appropriate places to block IFPC power collapse
>>>> until we access all the required registers. This is required during gpu
>>>> IRQ handling and also during preemption.
>>>>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
> 
> [...]
> 
>>>> +static void set_keepalive_vote(struct msm_gpu *gpu, bool on)
>>>
>>> a6xx_set_keepalive_vote()
>>
>> static fn! Why do we need prefix here?
> 
> It's good practice to namespace-prefix your functions, so that you
> can more easily find them, e.g. in a backtrace.

It would be obvious from the parent functions in the backtrace, right?

A bit subjective! I feel that the prefixes are unnecessary for small
local helper fns. Prefix for *every* single routine in a source file
makes the code look a little bit bloated.

-Akhil.

> 
> For a prefix, adreno_gmu_ would be even better, as the register doesn't
> seem to have changed across generations
> 
> Konrad

