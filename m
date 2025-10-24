Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EBFC04DE1
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 09:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D9010E9F9;
	Fri, 24 Oct 2025 07:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QFraqqxm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D204210E9F9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 07:55:35 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FL64022324
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 07:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YXG68zxkoFTr/T5HZB5JaHrMfcPhG5bgKEnx+70f134=; b=QFraqqxmnmEMEzCA
 eme0XSu5wVdiHBKlLLZ2ojmPaPvd3jt1tj/r58Vyjf5EUGOcXAPiQUiulVJ5AARM
 GbdSOvhdAiF4nIV39yBQCPLgq/CDzM4vSe1/xTEgnf5oXlrC+x/INO/HknZyOgD0
 IxYkgsRvjbGD5LuVg6WYn3HY7Jh6eIETefFtblINWHxQDDAVpBhDH3mTi/+5ZvR4
 8k0W/ZTh0qoiL0O4acrT5XB50JVoKswnrWx40k4DN1yX4D7FQujmVU6Ye0dkYh0C
 yQ1C74mGKBtoS1DLuDBiaqYtVXFrhoVmT42GE3/pOcjRZ4yPXPf+XJ8Obu3LayBN
 BnFKnA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qn7c8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 07:55:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-826b30ed087so4886256d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 00:55:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761292534; x=1761897334;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YXG68zxkoFTr/T5HZB5JaHrMfcPhG5bgKEnx+70f134=;
 b=MlYNLyMYERRePt27k9DN7Y1U89zVW/bxiV//1uUjPXbVEHqzM6TIusT6HnKCRTjMW3
 KKcOE/5FkEPJyRmmepXM9SreEMjXkzxWwIqByze4KZmnOwW/p05/qO0RM/FYxadG/sV1
 lYPse2AU50ldIIHLQ2ZDQCHZ0XCwq/n/kT+AMz+KZ4NYNNScTmSsalIVYKZCH5tsAIdG
 yVU8VcmPtsMU90CDPaWvEiX1n097qpGwBWEfYuWbs8XrQj07PMD+tAH5GtQJ5EANFhUg
 6My69RyY0VokpzJrxEVJNJpwibBVdVWxeCFqrzh9wtDlr93uSE/eXeewJ7PywNMzfww8
 FWUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUR9KO/086m9K826vjN1J9YUwMD8OQ1+JF9Ug416wzGwj5UZwDLC47l1mQQ2yM5XUXeKhG4pbhra2E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1+zPuBLLQXdPh08VPYR0u1w056XAyGIQ0QFlzh7eba/Yxlc64
 CC3nSw6IqNQobdWRkDVhsfaCA748aAZHuk2+3d6RxOpaW1DKyKg3UegPnW6MniDWsXhVlgm8nFF
 ACCnpR3ZuG/3a/WX9cjcwDKmFeMxZWEgUsLLuBvAYy1S9VrfHU7JYjyvQp3dH2r0Bj6TJ/F8=
X-Gm-Gg: ASbGncuT1FfcJaLRpYv6KgiLdOfrtdbI8CV2go0gPDmXF269vk/15HIW2SOLUJAFZC2
 qf8ofpTxznfhUTqLB2MrLv6ovgoaw3FhSbdByKw/ekEnrulg7lgG+PGxThBtYM+FWFV3vDo2J/p
 kOI0F+vjcGFWsY8UI9DTK+abwJnf3NPAUHn1zlWUse5NIHng4Qk7lxCgiAvyLscZXz8NROXW0Vp
 WHSZNNEyLPPk+Y4xtFIOPLYfzRfvYQVrp0Osr29pdsWmujxW4fEUtXll/UxnYbUkxkiRqSAZkUt
 J8e0ZHPdXsbAOYUCwkqls21XL68kW0s1ktP1BA0HFlz0riQLMGR5eiLLfNA2Vur3te9w0ADjcUg
 QGPOluJ4JJdaioG381quMPsn04yPttdn6MSTEiNdW83Fswb8NO9DN6bXu
X-Received: by 2002:ad4:50ac:0:b0:87f:b0f2:91f3 with SMTP id
 6a1803df08f44-87fb0f29208mr17301386d6.8.1761292533844; 
 Fri, 24 Oct 2025 00:55:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCB0bSo2J/IJ0DIn47T5u6kinAgTO16yEd6Im0+tOd+RYrXLjQsLNxZVU3R7LS4PIuS4fb/g==
X-Received: by 2002:ad4:50ac:0:b0:87f:b0f2:91f3 with SMTP id
 6a1803df08f44-87fb0f29208mr17301106d6.8.1761292533307; 
 Fri, 24 Oct 2025 00:55:33 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e3f32423esm3747494a12.32.2025.10.24.00.55.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Oct 2025 00:55:32 -0700 (PDT)
Message-ID: <5e64c246-a424-42c9-b102-e1a2af579936@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 09:55:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/msm/a6xx: Add support for Adreno 612
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-1-0baa44f80905@oss.qualcomm.com>
 <44ff81bf-8970-475c-a4f5-c03220bc8c3f@oss.qualcomm.com>
 <97aeb6a1-fda2-440f-b14b-2f3dbc2d7e8e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <97aeb6a1-fda2-440f-b14b-2f3dbc2d7e8e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfXy1cusiHxEes5
 ZtNYgBZEScLiRvhPlhcWul2uDLREXgYgFGbRW8WqfpjQu0AYZdMZ7NtgDXQMd1AfM8v6Wg7Jinq
 xlsif86zdlnXEB0vmDR+Dspoe3HjtuF/qQ08g8vb15I3gprAGd08VsPhqMRnsvvioX8kh1BqaJT
 ffOqSLxoCMQ26v5vPcaihBh7tdwEddNmSYk9pOE3MsGTf0UYo3Kab/j8R12EP9q3k6KnKLQKKnh
 hqcgPwvwyzc1aYJsrXn3Dv4HHaWH1e2Pa4gf383KHBsPiYqOgUaXNR18lB3tchZvJkg37s9oIyW
 EjGUJ9LYO9mFNZ568CUCOvJNJFLfOa8UP9kbZEXlpvcS3sIylfwOfURoL44hEX/hW8Qs8lC6NnF
 lhy30Q3HYTWIGo1X6GfH7+5KbwPzBA==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68fb30f7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ik8sJufeG61Tn7V1IDgA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: JI13IsnLgV-j5JnhbFBGnxKhNwMEXmc5
X-Proofpoint-ORIG-GUID: JI13IsnLgV-j5JnhbFBGnxKhNwMEXmc5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168
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

On 10/24/25 12:57 AM, Akhil P Oommen wrote:
> On 10/22/2025 8:43 PM, Konrad Dybcio wrote:
>> On 10/17/25 7:08 PM, Akhil P Oommen wrote:
>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>
>>> Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
>>> A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
>>> of A615 GPU.
>>>
>>> A612 has a new IP called Reduced Graphics Management Unit or RGMU
>>> which is a small state machine which helps to toggle GX GDSC
>>> (connected to CX rail) to implement IFPC feature. It doesn't support
>>> any other features of a full fledged GMU like clock control, resource
>>> voting to rpmh etc. So we need linux clock driver support like other
>>> gmu-wrapper implementations to control gpu core clock and gpu GX gdsc.
>>> This patch skips RGMU core initialization and act more like a
>>> gmu-wrapper case.
>>>
>>> Co-developed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> @@ -350,12 +350,18 @@ static const struct a6xx_gmu_oob_bits a6xx_gmu_oob_bits[] = {
>>>  /* Trigger a OOB (out of band) request to the GMU */
>>>  int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>>>  {
>>> +	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>>> +	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>>>  	int ret;
>>>  	u32 val;
>>>  	int request, ack;
>>>  
>>>  	WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
>>>  
>>> +	/* Skip OOB calls since RGMU is not enabled */
>>
>> "RGMU doesn't handle OOB calls"
> 
> Technically RGMU can handle OOB calls. But we are not initializing rgmu.

Oh, I glossed over that..

IIRC the reason we delayed 612 support in the past was to make sure
that the RGMU FW is consumed, so that runtime requirements don't
suddenly change one day.

If you have no interest/way in getting it wholly supported right now,
can you at least make sure that the driver requests the firmware and
exits if it's absent?

Konrad
