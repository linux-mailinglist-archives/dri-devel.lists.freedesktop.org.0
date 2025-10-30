Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D97F5C1F64A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 10:53:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F7410E96B;
	Thu, 30 Oct 2025 09:52:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SiQEN4RF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aNIFjLzY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6ED010E96B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 09:52:58 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59U7iLfr1693360
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 09:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 v7Q8Gm4q1rlF4zxFf+h3/o0rNZAjE7F9daCHt68XXws=; b=SiQEN4RF9xbpJ1w9
 ooeOXGozPjTyHk/CPlMcm1ta05F+QIx2DzgNqWZYlDpcCjRqAqGcy+dyftb+Nyp0
 aDHX6W+XeNsxr+B/loSsfqhe5mUUGb+5xkc2hmKgkRtfYZgU7UlsUzS9ywvBEz69
 YrZFHq1IYQMGfQ1lUi9YO+b4qKPSm7qJU5x8oTZp3PwPrBWWC/DjSZxtXIGjnIHU
 uJnNykCqajYoLlHjuGuensKCBZS0mXYeTkSG8pZqRiamm9usd/v/mtFvythb6EiY
 pKe/A0+VwZq3h45hlMfV9bvbsdCT/WpYpBK2RA9n5SzNjuOpGh1y1vmatxvXQ7xZ
 S9DOkA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3trv1vb9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 09:52:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-87dfd456d01so2793376d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 02:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761817977; x=1762422777;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v7Q8Gm4q1rlF4zxFf+h3/o0rNZAjE7F9daCHt68XXws=;
 b=aNIFjLzYlwnMlTNWO44Fp75y7HY0zVTVTSgcxbkcD3uYowiPgfu+GRQolXN8RlW/vl
 0rx5L4GW2tRCkj48SjXZr2qvXn6HLYby+gnn3axfHs/yicQlCKDGeDcy+U203GPyktZg
 qEpRM9svQ7mn3Jvwz/2l4cMZ5X/avzmd9xRHSBGSlo0dtmj0AWxb0yz3JLiAS6qi7gZa
 oFtoMOl0SucVX558QsMAgcyGoBsZFIJkk1TW+TMxj203MI4cPyTOpA/XvnJUI53417gR
 bbm0RAHeldURELS3OZAbn20GYWKVKVZInIXtxenLebjVIQGywh0CyjhtIa6m3F/7WEqV
 cm/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761817977; x=1762422777;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v7Q8Gm4q1rlF4zxFf+h3/o0rNZAjE7F9daCHt68XXws=;
 b=Li85z/nTnMsUUK63GQ7g/ydVLLbRkIfmioG/km2+/H1WApXIgkpf1u5RKEqPxPxmsk
 V7gTcPeOo37cFLxkibuSwaDYNqUDNoUgoWCUmV/0XauZimCtCvLv0Lwf6fTNlNsLxocw
 JZp/5BXCPfhB47ZdA9lYCBic0rw5vQHs8odcepxosprFcivBcN5nuzHuRLkXq23/hK+9
 Me9E7r4KTO1IM+Z+G8pQDUYylal+eLXyOehyqVvtNL8wDTFOFWtdYGA9CRr/OzqLMeuI
 8cSOanuMwAaoz2uG5x7nNuvCFFo4LO6YyprgnOTdglKcw9z2nD25BQaA15YH3lJjJsbc
 nMgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAO+YxZGkEH9SokV/8GgAQVH9ee1rpzXv7fEf3gtojr9kyGGWYT4Yo1gPdu+zvheMOf4hEl4xPwIE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzF4q5MtrfvkpaZU7i5CYpDcFO1X3m9ENik1WVDs6c07q9e8kHZ
 3pZvFPZHPGkfzjeeNXa5GdQ1CGCfRzdphY6hpNp5w/NNZ67KfLAXZc3E0TBWcXlDGQjQeUTRJDn
 SBHPNdPLrOD5OSzDaMSU5PTSPcOYNhBHpFE57KgzpgnTl+pqq6/nKcUQcmCt8gWVBOwk/DN8=
X-Gm-Gg: ASbGncthqZBRhdfKuflINbpubpKyPL9dvKiH1BRZdyaGItfs2Hv334RWlYBoVOZ8Gmg
 dsR0FKh3Ehh7de42QzW3BqYCaE7seiBksZSC4K6bE6qEUtWF3FuCskyrkKoaJ7n/xCykAYN1Od+
 qWkeCMs2HKNXHsy8ZFAAK4Ge1dslxXkl2FdIKj6ciRi0ZObTK9dbAEDqpuEo6hpCWipFdK2ohD1
 KljUvVzGU7cP55KGg+8r6nFYsjmKmo8uphqRQUh/J/Dr3e/PEFlILSSxej+AimkwTjhgmVBiYEu
 Zd/4N2aRTNluyAIKU+zfFWjMOvv3NEojDLlVmHY1i7gK2+EKYFySJW/tnzKzUtyGv+r7O+BbiPM
 qLhsRiB2HCJW6zQoppETmd5XYodJsnt9cLcKFm/KHGmI/zU2dUs9U7LbC
X-Received: by 2002:a05:6214:c6c:b0:815:e14a:1f44 with SMTP id
 6a1803df08f44-880099ac8d8mr52250696d6.0.1761817976912; 
 Thu, 30 Oct 2025 02:52:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPEnRfdgeY9SqFksQVxRyzlmk8WoSCfnN23Yxc6FUxQBSZpZ7uQW7zVih/5H4U1d6Rw4R1pg==
X-Received: by 2002:a05:6214:c6c:b0:815:e14a:1f44 with SMTP id
 6a1803df08f44-880099ac8d8mr52250596d6.0.1761817976393; 
 Thu, 30 Oct 2025 02:52:56 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-640342e5acesm6138757a12.28.2025.10.30.02.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 02:52:55 -0700 (PDT)
Message-ID: <a15e8316-96cb-452d-b2b8-731eeb6d25d3@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 10:52:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC RFT] drm/msm: adreno: attach the GMU device to a driver
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
References: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
 <5d6e7303-cc57-4a50-a9ad-b45d3c89d045@oss.qualcomm.com>
 <25e829f8-60b2-4b69-8d57-ded846b5206a@linaro.org>
 <c79c55fb-3aaa-4256-a71b-fa86cd0166f7@oss.qualcomm.com>
 <bed92353-da4e-4447-97d2-10e8a333e4e0@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bed92353-da4e-4447-97d2-10e8a333e4e0@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1feMz9RYv9q1Sjgoa0jVlTLzqJF5AwH9
X-Authority-Analysis: v=2.4 cv=D+ZK6/Rj c=1 sm=1 tr=0 ts=6903357a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=M5-gK5ubkblMbbE14A4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 1feMz9RYv9q1Sjgoa0jVlTLzqJF5AwH9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA4MCBTYWx0ZWRfX5qnQhQcpIjjr
 rDEsJzmvZkXCnFqL3YVn+hino4fuZV7MEKq0H8rEpjbh7DN1OpkcMtgBNr6kN4vmTLfqIzxGD2O
 FrUY3Xmd/ZF7FsPsZCaLXFlaFEu3ypijPUBTQWpLFl44eS/S9pkjHXJhVyRlHL72zkbeOUHWqZZ
 hCvEgR++a0nHXZSS/So4QWdy7nYJuuAhfzG36AN0gMf2Tl57sUscnuTwuVklSVqglcoUFRDkLcC
 J3hdokAjIloMKob4UlVOiHDeM80Gc9wqPcsfLr9PSjVryqTG6x+yEfjolkLUQeXdqePd7wu5ZHZ
 rArUfCHvfcEdJUqA/7jFdYwdgVdMPdmh0Vy73VKxyqR35+pDAX4MIO387yMevVCgoAnCVOzKlQ9
 Zf+eSg6z72eMG/QdEo/xW4ZdAH3U/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300080
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

On 10/24/25 11:11 AM, Neil Armstrong wrote:
> On 10/24/25 10:55, Konrad Dybcio wrote:
>> On 10/23/25 10:27 AM, Neil Armstrong wrote:
>>> On 10/22/25 19:09, Konrad Dybcio wrote:
>>>> On 10/22/25 2:44 PM, Neil Armstrong wrote:
>>>>> Due to the sync_state is enabled by default in pmdomain & CCF since v6.17,
>>>>> the GCC and GPUCC sync_state would stay pending, leaving the resources in
>>>>> full performance:
>>>>> gcc-x1e80100 100000.clock-controller: sync_state() pending due to 3d6a000.gmu
>>>>> gpucc-x1e80100 3d90000.clock-controller: sync_state() pending due to 3d6a000.gmu
>>>>
>>>> Does this *actually* cause any harm, by the way?
>>>
>>> ?
>>>
>>>>
>>>> For example on x1e, GMU refers to 2 GPU_CC GDSCs, GPU_CC refers
>>>> to a pair of GCC clocks and GCC refers to VDD_CX
>>>>
>>>> and I see these prints, yet:
>>>>
>>>> /sys/kernel/debug/pm_genpd/gpu_cx_gdsc/current_state:off-0
>>>> /sys/kernel/debug/pm_genpd/gpu_gx_gdsc/current_state:off-0
>>>>
>>>> /sys/kernel/debug/pm_genpd/cx/current_state:on
>>>> /sys/kernel/debug/pm_genpd/cx/perf_state:256 # because of USB3 votes
>>>>
>>>> I'm not super sure where that sync_state comes from either (maybe
>>>> dev_set_drv_sync_state in pmdomain/core?)
>>>
>>> The way we handle the GMU so far is wrong, it abuses the driver model.
>>>
>>> And this is a symptom, whatever the impact it has, it needs to be fixed
>>> in a proper way.
>>>
>>> The sync_state is retained because the gmu device is never probed but
>>> has some clocks and power domains attached to it, which is clearly wrong.
>>
>> Yes I agree, however I'm only debating the commit message claims of
>> 'leaving the resources in full performance', which doesn't seem to be
>> true
> 
> OK so the wording may be a little bit extreme, perhaps something like:
> the GCC and GPUCC sync_state would stay pending, leaving the unused
> power domains enabled for the lifetime of the system.

The debugfs reads above suggest this is actually not happening

Konrad
