Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7812C2B794
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 12:44:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F8B10E3B5;
	Mon,  3 Nov 2025 11:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="k/J1m/Im";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BDu9rn+r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26BF110E3CB
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 11:44:48 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A368XC42269724
 for <dri-devel@lists.freedesktop.org>; Mon, 3 Nov 2025 11:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MGzSna7Z/0B1jw6cXgA4Dygu5B4WwM9yg+V4B8uyOFw=; b=k/J1m/ImlB9cCQ+6
 +Zx/PgZAw1e3i7vHCdFl9/4d4licSm+zsOjG1QwjJBURgVfMRtrKRIAjjDy7AB8a
 7DuQzVNORWJl7NsZsoCXNhWY+iLEaNHVhityKe8jgqHTRDuQusLeYfFBB9RwRmfg
 tU5x9eF+VBr75+J9Im20Weza9EwpnO0iClIt2rllD+Z/4xRJZsAgcpuHagIMU2CJ
 nfR58M1yWWRKKgWe281wVJBJ12otuktl4/csA7v3oIqeRQGW5CpgA4c96EhvOnnw
 nQmSD75YdS9XvxC6mW9aY0wa5ogkyckLuibOnaF2FSBEsBbBCJPTWJENggEGALHs
 0EII0Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6pv7905k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 11:44:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-880415ba763so6146166d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 03:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762170286; x=1762775086;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MGzSna7Z/0B1jw6cXgA4Dygu5B4WwM9yg+V4B8uyOFw=;
 b=BDu9rn+rYZnOvLdl0ruvKF/d4lpxoUIT65Z+rQxD1Taee1xEee1aoZSw6GzrSC6SuY
 TE4jfajNEwHDf2IMJ06yqZCIusGXAefYApuCevb2vmrMKmxL7+yYFYQbFw4LLGnKRlpX
 0iaRYNZesHt/ZBGyafjYLDfyaCWFZmzn3DZKqDSQaqpua9LYT4GXWvILd6KyASyb4/nq
 1+saBdUm63uMFMg/8CM1qguEEzyH041S6ushyeeDTdiLWRUBcEL5c7sN/BJd8B+33mWS
 4wCg2Rf1J8f+7E+sPizqwvLheXC7dQBevTVIcGtjgjHxT74UoSmetUXyE6Znia+/M5w+
 SFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762170286; x=1762775086;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MGzSna7Z/0B1jw6cXgA4Dygu5B4WwM9yg+V4B8uyOFw=;
 b=Yn0QqJKxFGAchgMT8RyFudaTUNrsEatsdKrsY4/2bJJOT5rLr//wwZvsa7P/fZiIvJ
 dcjg1akRHLDKBGo/szUtw5NuFAuHZAVxd+I/mRTuBL6E8y06DwI4XZ+BwdrJoaxxCdL9
 UlrFQQPK1vWnXZTfxFz7oKt6soIP2mkXyrFqcrmakKfYwManGldKCCwuBvs3uIJNATVH
 M+eBuAvQyN/4NQbE8hZ+1WNATw8p4K5/2PlgSW0ib412ColwhAw7GrSEIZSvvQSvCulV
 tUP5cvOFpioHJhX2aG9UQ2BOQiI1vMuFTveBVOcykmhdwoh8tJzlK1Hd8zrJzZALF1Y9
 ziIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzmNdS6QbYVpXUj/VB7KwOdYKThEqJ65keb9mAfQ/vdiN8hMxtW+DdRZBjO4+ogEmj+icTYgsGeJw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXAzwXb9bWQrrcdg04PDS1B8e0eTf12wR42NUWzv3knhphZDf7
 0P3vcDf08ZCQH+nVFAeFlhUK48BKaVUXvLI6WcikKcOh5lCDSDfsMB09Acnmh2wc4FgEQ7SXtdT
 0UTtVWcrKX6271m3sKc81gKXGMSSyht1TIOnD4HEqT7J9ivY9L6N6jQ9jm/bq24gXZLL13FM=
X-Gm-Gg: ASbGncuacPfoPtKNFU6AvMOpmFjqY4uQzf3Hv7kV9+c8UpksvyUbQM3JIA8Bwpapqo1
 TaJUzEbjy6Yo1foVe9Dnx8bnLeOVnZ4H8tzujywrpY4V8PvMzQ2U0G6QD6F3ojGm/EQI2h6mb+T
 fiZXRhV6rjwivXdQJzEgZi6kSKYKvycS07ctyM+bzI+Q4nLyJrihDl4sT1mn4KS8AEA5T50yqB3
 2BSTBh0KWpvBKzulVSBiRB4kUxQonHoUZfHh0s6gasBTs3sRhfnHv1As5Lzvi13PdMDs0xKQM87
 c8JuksRuw9YqMWpBSzcHL8i3esYCA8gdeHKl/XFiKaL+irxUay71ky+8v0LKdmDpsJleqnLIz96
 7TtHAAQjf+DVLRSELjGSKjsaga8djSchQWzJYsJGNzbsvQvFaulbqTQZD
X-Received: by 2002:a05:6214:2b08:b0:87d:c7db:7897 with SMTP id
 6a1803df08f44-8802f26f50fmr113779626d6.2.1762170286351; 
 Mon, 03 Nov 2025 03:44:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7HDR4oGKE7YvjUNK4SfxIARE+xpgeOD3N+t+XaeA+ttAVIE8suSRw89bGxUKlp/o0DJTuMw==
X-Received: by 2002:a05:6214:2b08:b0:87d:c7db:7897 with SMTP id
 6a1803df08f44-8802f26f50fmr113779286d6.2.1762170285777; 
 Mon, 03 Nov 2025 03:44:45 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64092e1a405sm7542470a12.31.2025.11.03.03.44.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 03:44:45 -0800 (PST)
Message-ID: <0ab3c556-8876-4598-a7d5-ba7f9eb33391@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 12:44:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/msm/a6xx: Add support for Adreno 612
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, rob.clark@oss.qualcomm.com
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-1-0baa44f80905@oss.qualcomm.com>
 <44ff81bf-8970-475c-a4f5-c03220bc8c3f@oss.qualcomm.com>
 <97aeb6a1-fda2-440f-b14b-2f3dbc2d7e8e@oss.qualcomm.com>
 <5e64c246-a424-42c9-b102-e1a2af579936@oss.qualcomm.com>
 <CACSVV00vwbNtH47S_BVet7uP7u9t4RY=xTBn_r3u4sS91Y7Muw@mail.gmail.com>
 <7c563e83-031c-445c-bcfa-c04f4729622d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7c563e83-031c-445c-bcfa-c04f4729622d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: po0TsQGRqgZ6na8LdF3We71xwujPrZCB
X-Authority-Analysis: v=2.4 cv=A7dh/qWG c=1 sm=1 tr=0 ts=690895af cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=IwubUePDlzt84yfe0skA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: po0TsQGRqgZ6na8LdF3We71xwujPrZCB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEwNiBTYWx0ZWRfX8yzkHaoIWXxO
 88G9JGqdpsjMCV50u8DrefE4XUV4T+yxkJvH47JfxNG2GqIKub1du10r37ngVNF+ULitdEYkFix
 V7x/gacugAX3slimNOaolAn2v0D66ro4Zls/zWfskF2fFty9CDV5HvSfAkmOZ2kE7820RfwJtli
 vhV/O2PJsVc9ruHSRejy7+rWBiGlfxKZKIXvIiFrRplz8Lwj03aPWvzw/mWcRCJ82+zwlf6Lg28
 hsa099xtefWn0mGuWDRT0Qar6ugLQ0zMN/RmpJFrUwuz0wPzMuMO/mnQqa/y29gUxINBNkaoW39
 r28QEcByVe0Sms41TLruf5kyssxxEuXPhYTpuLGn4lXvUqoA+tau+K2oL47Hr3zbO9zbXIsTMlX
 DxiUsW6VAaDgV8CSoZC7is2VCBj9Dg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-11-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030106
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

On 10/24/25 4:23 PM, Akhil P Oommen wrote:
> On 10/24/2025 6:46 PM, Rob Clark wrote:
>> On Fri, Oct 24, 2025 at 12:55 AM Konrad Dybcio
>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>
>>> On 10/24/25 12:57 AM, Akhil P Oommen wrote:
>>>> On 10/22/2025 8:43 PM, Konrad Dybcio wrote:
>>>>> On 10/17/25 7:08 PM, Akhil P Oommen wrote:
>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>
>>>>>> Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
>>>>>> A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
>>>>>> of A615 GPU.
>>>>>>
>>>>>> A612 has a new IP called Reduced Graphics Management Unit or RGMU
>>>>>> which is a small state machine which helps to toggle GX GDSC
>>>>>> (connected to CX rail) to implement IFPC feature. It doesn't support
>>>>>> any other features of a full fledged GMU like clock control, resource
>>>>>> voting to rpmh etc. So we need linux clock driver support like other
>>>>>> gmu-wrapper implementations to control gpu core clock and gpu GX gdsc.
>>>>>> This patch skips RGMU core initialization and act more like a
>>>>>> gmu-wrapper case.
>>>>>>
>>>>>> Co-developed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>> @@ -350,12 +350,18 @@ static const struct a6xx_gmu_oob_bits a6xx_gmu_oob_bits[] = {
>>>>>>  /* Trigger a OOB (out of band) request to the GMU */
>>>>>>  int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>>>>>>  {
>>>>>> +   struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>>>>>> +   struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>>>>>>     int ret;
>>>>>>     u32 val;
>>>>>>     int request, ack;
>>>>>>
>>>>>>     WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
>>>>>>
>>>>>> +   /* Skip OOB calls since RGMU is not enabled */
>>>>>
>>>>> "RGMU doesn't handle OOB calls"
>>>>
>>>> Technically RGMU can handle OOB calls. But we are not initializing rgmu.
>>>
>>> Oh, I glossed over that..
>>>
>>> IIRC the reason we delayed 612 support in the past was to make sure
>>> that the RGMU FW is consumed, so that runtime requirements don't
>>> suddenly change one day.
>>>
>>> If you have no interest/way in getting it wholly supported right now,
>>> can you at least make sure that the driver requests the firmware and
>>> exits if it's absent?
>>
>> adreno_load_gpu() calls adreno_load_fw() first thing, and will bail if
>> gmu fw is missing.  (zap fw is a bit more awkward since that could
>> come from dt or device table.)
> 
> Correct. And RGMU firmware is available in linux-firmware repo.

Thanks!

Konrad
