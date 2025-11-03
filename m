Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FEDC2B78B
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 12:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10BF10E3B9;
	Mon,  3 Nov 2025 11:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HTFTJTyj";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jCiDRhPx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1809A10E3B5
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 11:44:37 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A383LJd694040
 for <dri-devel@lists.freedesktop.org>; Mon, 3 Nov 2025 11:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YvOf+kp0ZdmTGQTGoezpj45yRTsjMynuJPHhSZjrogk=; b=HTFTJTyjdyo/guLM
 WX2vhQ8wZOIyFsXCe36gsy0kBRphrIR62eb+610H9EB0TpCX8aYS5LqQynP6PtJ/
 6v+T8yCOh51+nVYc+9+fyonlatXL5oZtPb5+QNDkR+KcVdeY4cDJ9z3ZRmOo4UPq
 ZSx8rk9SRhZ3XWifvdQ2otIH7ayKm/JmEkSY2KsrCUT+z2IuWHB71WJaZjm9zUFZ
 lc0VSywiqw7rv9DgUol3LcQ1PHggRN+37CxwNJYlaN7OaXZDAg3avUFpAfqdaW61
 /UA7nBFmgSyZKTwAj136tyNbR5RcHBgA4TtkrGS2Ro7hi5iLxAI/Xy9EIi0RzGIC
 A5Y6qQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5ak8mgam-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 11:44:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e56b12ea56so12246661cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 03:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762170275; x=1762775075;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YvOf+kp0ZdmTGQTGoezpj45yRTsjMynuJPHhSZjrogk=;
 b=jCiDRhPx76quRjpXBO/t784J1i2S4NQCGu0hBmPv8pXC6jY0lp45E53xCqIskBisxc
 oaZAx/n3tDcsyacvFagzdZTa0nR6J+UlaI+DI7F2/+fkYxHQfuxZeTqFtw4KtjN4tNYf
 DxvA2gQnsjmPk3f6AftFZhuuoVsAnhGsJBVYtmBmOBlBuRVEFOFU/dyqZlq5nl25Sh9f
 gSnl3s6b9t/PS+hvwlqeL5NvNzA4HrkjHkatBRYl4FJGLZrYyNHSxmbZvCs6/+tDqXDw
 7uVslzDCyEMdEXavSygnISOnXeD6R6pp6EwFRk/iClWqLMldrWHDopy/04iO6FGcRgIu
 vMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762170275; x=1762775075;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YvOf+kp0ZdmTGQTGoezpj45yRTsjMynuJPHhSZjrogk=;
 b=NCcoBreDRpUxI9iAJLlgQmwN1z7fSenFdVnOAGEnQMYfl0PnkRE3XYzsYpQceZ7sy4
 qYir95FzBDVBTxsCt/6nlRpYycJLUxPk6Lx0VSiXKzhNM2RRPdWNqSQqAfwKBcnGc5yr
 gmwX5M7xvOJEnriONUUw2joTmLEFVLiKVOdlimDpVlVZzFyVOsLWxY66/onDwH06jiBv
 a1QHRpTD0s0Jm24vFA8TWMuh6PAfKvreKE+hw875HwUqxtc+Ywat61/9wjO8uuqMvNkS
 kibxhxDUL0/ERV1+mcWSq+ci+sMe698lY0OlPX8KGSTcdhJcElcfLF5cVQ57cJXgfRmv
 ulqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVajz76We6eW4YO+wPLNLVFkFOP4WoVVFd29om8hsu7GHAwEMSpZSm9Kp87fZFHcrYJAXHN9FyTub4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8ndFn7qKP5lRdMiBV9Eo7bLGwFUrDAyeazxg50k7gZGkBrvsz
 eYsVFmVMe6g2ikgu/t0dp7GN2rfm84HoAOhxrxFJYNGZo+H4P3zdGo+XrvCcFw6asFpA8izSn5w
 PqXaVrG51sCJ/DhfBABubZhPkciqYfqcq9QBVY5sbEoIcuZmNLLHDK2z553AAlfzNrG36sD0=
X-Gm-Gg: ASbGnctkbnSrDVyB19s4GU1yfGr0jzpnXEK9KDBHS90iM879X68mKb0yewuhcp7eLZJ
 vH3WQAur/EhEtri5EkRrwUlnNWnYbz4xkGal0+druEf5fQm40qJLlkO/XUYrPozCpsy6iKWdrlO
 sc8rEmHLoBPNa62CUkN0yDjdFDXlJAdaitGWPDgcCbAyypUMzYB3NzvallHN10FcLJKdY/mo4A4
 +/lEkROijyG48D/7Yms5K8xrXQIG7eyNyPWGyQn8uxZRqPRquN0Qt3FrJnH3UY3ooMjI5KZgPCl
 LzTpCZCs1j0Zd1eYmQ07yHey1VNzXBBTCUIQLjGtXx1XmDUXCXHtojuQ+2m4uZWbcxQU9nSVqm2
 AzgbXB7zmcNyP+C3NFeJet7+A/M0bSmJo2WAcIWxXflNnUOyCf2fwQ/XY
X-Received: by 2002:a05:622a:607:b0:4ec:f123:230a with SMTP id
 d75a77b69052e-4ed310020c8mr119136021cf.13.1762170275304; 
 Mon, 03 Nov 2025 03:44:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnGpJTNO4VxSLqtGK2GRrVTvl345j+n/5/IOWSW5sFL9hZhQS5EOwv6lu1y5X00EWO5TIXYA==
X-Received: by 2002:a05:622a:607:b0:4ec:f123:230a with SMTP id
 d75a77b69052e-4ed310020c8mr119135761cf.13.1762170274838; 
 Mon, 03 Nov 2025 03:44:34 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6407b34a808sm9435758a12.8.2025.11.03.03.44.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 03:44:34 -0800 (PST)
Message-ID: <ff74fd52-1191-4a0f-8c3f-1dce1830c8ea@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 12:44:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/msm/a6xx: Add support for Adreno 612
To: rob.clark@oss.qualcomm.com
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV00vwbNtH47S_BVet7uP7u9t4RY=xTBn_r3u4sS91Y7Muw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: COjmYf-5Webv42I9gWaU6kokMiW4erSn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEwNiBTYWx0ZWRfX1g8OoZ3w9tHG
 tlzWwC0Shyj7knDzPPPSfHaEhusL1ae3r8Bveyrx7ToSAk9+1kzF+1o485H2k2NLN84uOT3MiSm
 pNgbNN88v/3GwhOz/8kW+b1aZG4zdcqqv36KbEZqnJfueVw7CTF9G17xDUh1NCEHycYaQklowTt
 tuXqhLQnOYlQuYiUxvp0ZkQXyhAbkM9ZKolCg2WV0l3Tq6hyTiE0ECUHcyf+eyDyGbX5zEpSuyq
 F1AyfYmM3wPMMAkn2NmKea0Gs/Uhhfa4o5rXH11l4GM+fBuAPNxo1Tp7TE4VtmU4EuMwC3xjOyN
 ppU5zkq3+o/TqqOFdHEKVxpeBR8ImatbQFskNvPvHQj22x1MIQb5pJ/ZwUgcKRtTTc/5znp+alS
 dXb4KKR2+yR5XHQA0+PBZg0ZoF4Vsw==
X-Authority-Analysis: v=2.4 cv=ZZEQ98VA c=1 sm=1 tr=0 ts=690895a4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=Kgau_Mukr_2Uqyo6pRUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: COjmYf-5Webv42I9gWaU6kokMiW4erSn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-11-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015
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

On 10/24/25 3:16 PM, Rob Clark wrote:
> On Fri, Oct 24, 2025 at 12:55 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 10/24/25 12:57 AM, Akhil P Oommen wrote:
>>> On 10/22/2025 8:43 PM, Konrad Dybcio wrote:
>>>> On 10/17/25 7:08 PM, Akhil P Oommen wrote:
>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>
>>>>> Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
>>>>> A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
>>>>> of A615 GPU.
>>>>>
>>>>> A612 has a new IP called Reduced Graphics Management Unit or RGMU
>>>>> which is a small state machine which helps to toggle GX GDSC
>>>>> (connected to CX rail) to implement IFPC feature. It doesn't support
>>>>> any other features of a full fledged GMU like clock control, resource
>>>>> voting to rpmh etc. So we need linux clock driver support like other
>>>>> gmu-wrapper implementations to control gpu core clock and gpu GX gdsc.
>>>>> This patch skips RGMU core initialization and act more like a
>>>>> gmu-wrapper case.
>>>>>
>>>>> Co-developed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> @@ -350,12 +350,18 @@ static const struct a6xx_gmu_oob_bits a6xx_gmu_oob_bits[] = {
>>>>>  /* Trigger a OOB (out of band) request to the GMU */
>>>>>  int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>>>>>  {
>>>>> +   struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>>>>> +   struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>>>>>     int ret;
>>>>>     u32 val;
>>>>>     int request, ack;
>>>>>
>>>>>     WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
>>>>>
>>>>> +   /* Skip OOB calls since RGMU is not enabled */
>>>>
>>>> "RGMU doesn't handle OOB calls"
>>>
>>> Technically RGMU can handle OOB calls. But we are not initializing rgmu.
>>
>> Oh, I glossed over that..
>>
>> IIRC the reason we delayed 612 support in the past was to make sure
>> that the RGMU FW is consumed, so that runtime requirements don't
>> suddenly change one day.
>>
>> If you have no interest/way in getting it wholly supported right now,
>> can you at least make sure that the driver requests the firmware and
>> exits if it's absent?
> 
> adreno_load_gpu() calls adreno_load_fw() first thing, and will bail if
> gmu fw is missing.  (zap fw is a bit more awkward since that could
> come from dt or device table.)

Indeed you're right

Konrad
