Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBFCC680B6
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 08:47:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3422E10E41B;
	Tue, 18 Nov 2025 07:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b5BXBk9H";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W5epfE+F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D462010E41B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 07:47:11 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI6fdFo2343601
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 07:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 q1LWjTec/cNj1zznlk0UfLKuZfQ9QSNnT3txdizlw+Q=; b=b5BXBk9HdZKRGk83
 OyMwQ4JGrVT010MvU+JoNyjHmGDP+XCZLfK47dTGZp2pnD8WyXJy13JAy3DR6VzV
 SNlt/6zOK2nBd4uJY+ldaU/v66O0Ic+ZjRyw1Em+/X79j4nx2/q1hTvDe0pIahLE
 yrOf4jX9spDnZhgVJFhv8kOLuF78huV44JXvNkynFnua1+VTUZVNGaI0JNk8FfbT
 s2BpuPK/CSKJVhcYEp9GU8nSw79DY5BJZGka1g8bjcpjGD6US3ndEwXcaJ9RMeQD
 8ElvHrHnrZ9/eOc2BozpEulbn8ZO08rRC047KBgIY2rElg9DNh4tk8kQqUp9UjQj
 tdosCQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agkrn060w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 07:47:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-341616a6fb7so6525234a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 23:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763452030; x=1764056830;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q1LWjTec/cNj1zznlk0UfLKuZfQ9QSNnT3txdizlw+Q=;
 b=W5epfE+FDM50hcYIqhdb1AS5aXkvTUGm6J5e+04T1j4ZDsBPg37qZ25BFpsnHTj6mh
 /YQtJVENcVeWNmMp2zXoBHVzlr8BxFUt/TWZx3ca8eVFq+wIlLAa1RpDvjmp24rt2aHC
 Vo9OxeZQdEis20WWCKccHACP6BIc+nhXMLRjSUhXRmtf2s4142DHEdVoAzXtJrBuJunU
 izV7S81bOib9obEsKirPZ/RENuNRq+H83oMClZr7B4n4bqCesqz9cK+NQJ1c6mcI6oTc
 odJaQwZ3eIyMhNMacm4+qIg2PbO6cnKEfkqvP15cB12WXRk8VJZABK93+mWA+ciefizb
 Bj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763452030; x=1764056830;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q1LWjTec/cNj1zznlk0UfLKuZfQ9QSNnT3txdizlw+Q=;
 b=o/kDkvejJay7N3ht4WsmfJvov+ms5sAlG6PQNrTaWuv1I8MhOjdQ46/v/lguoftPMo
 vfU66Y6LIp0di+xWMTULv4frtNnW5j4N3O9X0/TVg/QzxBdBAQI+XNgIKJ8XWo+DVvL3
 4Bnvgxlbn16QjfN6hQfFTHm69MbqpFBEKqQXORMmKm2umVKqroQa3DlKsvifZwUV8aeN
 jdZaGLKO1jgzghD+Xczz/i4ht3cKCqc13n3MIAONw1snkEV/jFfvTT1KEKA6PIMSDH2Z
 siirU4H4H1pBvHlil8UdlhR9TmMLWAHumoLGLEjxTVCjtYReK2c4P4ml2wES876pKzzc
 2otg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJRQTSjNFkauP43qTkjtlY/mIrvV8VVzcclitB9giqdgqyUbftx2YA4BtgEErRdm4ionLYh3pUWVo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsVNbd+VlwNqGUzMGvA2by+Ym8mWrXAZjJW63Knk16fgsidd8i
 qIpnFINR4IQkbdRjuiNke3U2uVl8mvsIJmzUxKmIz5mctUmkoEJ3YU5mRIgDvjtFylydAJA3Ixf
 6GkMoHnvSAXXiH32jEyh0onKppdcQMQS+dpuHxn47gwI0NDnhv1gyR0m9yrNVtA3MFcQ4n9E=
X-Gm-Gg: ASbGnct3DjPi1aiATUoHDyK//OAmMO6ZY5AYg2hqkXI7AAk4qvEaRH35IiwEIeFeb2H
 1MfX9eBk1OJQGL9M1la3wSj51PlggeeVuyXViYS9JdO9dMfI3Y7Jud135SqwjZt3tmDwr+oyvX0
 7C/TDZV1CI5iZNPt66e9kO16KQs+6S2GAJ6ry57dukUdh8z26k6u14Pqlsv+Zu873Q/hOpFDuA/
 Ld41u43o9Cthu84/97OLlil99ED8yTlvL45bY8DFSAPIMQjyHdZO3w9wP+hXgXtLJV+Lao4Zhu4
 PycwrdFiYJlw2bT68wbFg0UNlB4G3CN5fIrpX5fPK70+mkpxVrq6W4k/N9TMXcl0+wLVbFmjYcc
 mxRfGjpf4ArLjvEPrwx383mRVWotiUg9rXlJvVN/M+znCmvnVXee3y+H3EpeO
X-Received: by 2002:a17:90b:2d85:b0:340:bc27:97b8 with SMTP id
 98e67ed59e1d1-343f9e9fed3mr16849642a91.10.1763452029755; 
 Mon, 17 Nov 2025 23:47:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUOPpGmBx8rKkZzj0uTmBKIWodmlBH/li4fkOhajEWnDrqLQS2O3q75qH/Lbykyu6xMmPnMA==
X-Received: by 2002:a17:90b:2d85:b0:340:bc27:97b8 with SMTP id
 98e67ed59e1d1-343f9e9fed3mr16849592a91.10.1763452029261; 
 Mon, 17 Nov 2025 23:47:09 -0800 (PST)
Received: from ?IPV6:2401:4900:1cb4:7658:a83f:a091:98a7:4ddd?
 ([2401:4900:1cb4:7658:a83f:a091:98a7:4ddd])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b924aee147sm15589487b3a.13.2025.11.17.23.47.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 23:47:08 -0800 (PST)
Message-ID: <a874d12a-6da4-4a2a-bea3-20c69bd53c6b@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 13:17:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: adreno: fix deferencing ifpc_reglist when not
 declared
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251117-topic-sm8x50-fix-a6xx-non-ifpc-v1-1-e4473cbf5903@linaro.org>
 <04aec988-59ba-4c98-b922-510d86b10ea5@oss.qualcomm.com>
 <1488f09b-63b7-4412-ba56-28b1c81528ac@linaro.org>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <1488f09b-63b7-4412-ba56-28b1c81528ac@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: U_54INv_YJ1_QVkSBw1Q0XODoMzz14Dj
X-Proofpoint-ORIG-GUID: U_54INv_YJ1_QVkSBw1Q0XODoMzz14Dj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2MCBTYWx0ZWRfX27UkWRSTZOPM
 F4S8w67bUqfRgHk66I6WcDH5skSaKqvDZainllQMhLr9hnKILGxAV6+Op/2+TenXvnpKtuL6dqJ
 53sooD5yOXwdrBLiZszfmq/xMjH4JZ/eiqSxngT9NFeSp4lF902vYyjZ5iiUGvW+vPVWU9DOCeD
 UR6e7gfWJPlMX5AbjxB7ka5ZxSU7ZQRuGgpkdF7ebaplnTsFZQ3hsO69ml1xjsFNf+epIuhYcuN
 9rioNqY/85Z6WNiALmUkYNexKb5HGDbbWePxO5d/PHeoh15sz0gsOwoDQpPUdOPhQE+nlj8NZDc
 u6x5f1h7dkVSCrl67Ji9Jqpt4lee0wIcsUxVbqUAf7mEk9+9RCtwf71bXnbxSHcEANTvYlm2Z6p
 e3/LqMnR+pYOEongJR1GtXh3YyNIJw==
X-Authority-Analysis: v=2.4 cv=L+kQguT8 c=1 sm=1 tr=0 ts=691c247e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=O7ohuQCFNY90Bn7chwgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180060
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

On 11/17/2025 9:17 PM, Neil Armstrong wrote:
> On 11/17/25 16:02, Konrad Dybcio wrote:
>> On 11/17/25 3:51 PM, Neil Armstrong wrote:
>>> On plaforms with an a7xx GPU not supporting IFPC, the ifpc_reglist
>>> if still deferenced in a7xx_patch_pwrup_reglist() which causes
>>> a kernel crash:
>>> Unable to handle kernel NULL pointer dereference at virtual address
>>> 0000000000000008
>>> ...
>>> pc : a6xx_hw_init+0x155c/0x1e4c [msm]
>>> lr : a6xx_hw_init+0x9a8/0x1e4c [msm]
>>> ...
>>> Call trace:
>>>    a6xx_hw_init+0x155c/0x1e4c [msm] (P)
>>>    msm_gpu_hw_init+0x58/0x88 [msm]
>>>    adreno_load_gpu+0x94/0x1fc [msm]
>>>    msm_open+0xe4/0xf4 [msm]
>>>    drm_file_alloc+0x1a0/0x2e4 [drm]
>>>    drm_client_init+0x7c/0x104 [drm]
>>>    drm_fbdev_client_setup+0x94/0xcf0 [drm_client_lib]
>>>    drm_client_setup+0xb4/0xd8 [drm_client_lib]
>>>    msm_drm_kms_post_init+0x2c/0x3c [msm]
>>>    msm_drm_init+0x1a4/0x228 [msm]
>>>    msm_drm_bind+0x30/0x3c [msm]
>>> ...
>>>
>>> Check the validity of ifpc_reglist before deferencing the table
>>> to setup the register values.
>>>
>>> Fixes: a6a0157cc68e ("drm/msm/a6xx: Enable IFPC on Adreno X1-85")
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>
>> I think it should be fine to skip calling this func altogether
>> if !ifpc || !pwrup_reglist
>>
>> Although ifpc && !pwrup_reglist should probably scream very loud

That's correct. It is a weird combo.

> 
> Sorry but why? pwrup_reglist was introduced way earlier than IFPC.

Pwrup list is shared with preemption feature too. And preemption support
was introduced before IFPC.

nit: It is nice to have a similar NULL check for pwrup reglist too. We
sometimes skip these during initial GPU bringup (like A840 for eg:).

-Akhil

> 
> Why would we be skipping the a7xx_patch_pwrup_reglist() because
> ifpc_reglist is not declared ???
> 
> Neil
> 
>>
>> Konrad
> 

