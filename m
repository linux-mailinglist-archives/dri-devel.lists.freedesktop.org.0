Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F76A143E1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 22:16:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67B510E23B;
	Thu, 16 Jan 2025 21:16:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FIsuU5rR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6633810E23B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 21:16:33 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GItQst025477
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 21:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 duEqSVZt1k43PZMd9QMDtaw8IMhjbIVlsCKvYGvC+i8=; b=FIsuU5rRT6YkcKNR
 zEfcrLMCxkV4jTXAlza1eF5pivhNGt00bJhnqLjV+yoFCKVz1GJD1RuSjuUAPMVp
 Cn2YC9MAWwoHpTFUuFAGPiTdMQ0MOLkX/IPuZBS4sJc1FWKKme2jDkqyEverr2CL
 6jXKsEgsqtPyDo/IvRf7uJrnajnDRL5f848A3xBSPSTAQYeDQtjyiPxE0ou8Oy+B
 EEuInlZjHTqDxNXx6HwoxhQPKgaWv0ZSdNvpinBQomGbExXyDywgLJ0rfKhB7sts
 IwfSPu5+9N6rPUS+tCkPUFwr+DIA1zkRl5jqbz5JpxFcuBHaBshZFxdihjyBnCfj
 3tlO5Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4477sa899c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 21:16:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4678aa83043so3466981cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 13:16:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737062190; x=1737666990;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=duEqSVZt1k43PZMd9QMDtaw8IMhjbIVlsCKvYGvC+i8=;
 b=ClQM7lsvOPSwAYrYq3R2ZH7zelAlNXHF6DbiB6y6WGY+Al02YaN58QQXfcE9OEc8fF
 Fz2994cDJ4zEci103RJ8n03n/otqvLeyW5kxdz2LohddKD6xQ5AH/b39TxMxhCrcjD10
 DArESuQoXcYPj+Gfp9dNfuHrhLl/Hy8ChPHxqoSmdrVI64s68y+kzZXkjd7d7pkNDMfq
 heZYReJ2Lx26/AXYaYWMcYa/sX3o+oPD8/imy4zRbABYB3NTpRFdaOO85/bt3PljHJ52
 hvNXA7KJIzAuhkHIJA/U2kjjZEW868uSxML4Xweac+eF989tRUtSf/muReD6Oa6FspXe
 tCBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+fnngsF7z0a13dU0A4f0krAxzxPhWOoPp+GvKlZ/8XicTIITTkgD04T4gBtn/tjbHEVh/KVwsYUc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtlIBzBRH4nJmrNmWbcKqG+PGubk1g8uxB9UVz3pSPM4UkGXux
 0GcnVOX2yRRRpeQ9LlqXlQ+fKNl7Wd+o+9fRqtW6+E35wHWXfMTWxC1uULRbskmg2GhyWmwNGv9
 BllOk3Po2VCKAmrDgyaiA3ox91lvs5pp5UPA0XN1OyAcV2CrQRqG2d7V1wRRIbU0kKcA=
X-Gm-Gg: ASbGncvADh3bZenHSstJfqGZ/LRSxZwUxNwqOki3qI8lEnZH196iPDtpCTk14HfXfmK
 TK+6/il9jGu4TfX5M9s1p0vMdvheIHZx56ZemyBVt0SGX9/c8TbOnS20/yu20bYkK745PJ0rW2S
 BwNeuWxOaVL9E/2xMcU3nGrngMMhgKe11fcgFXPXgTVcXC6QIbTJDQHOZJBOe5ISmNwYgb1Rzmp
 iwtZ8Q4wFVatCsG/1AfTahkbdp8AMK8JCKoKx5o9cHqPvMtlLjzorpZO1VmBVXYtRf25LDJEEK1
 gJmfbAMHsTBTaC3Yu3Ho9ITj5FVCLSrXdko=
X-Received: by 2002:a05:622a:1922:b0:464:889f:a41e with SMTP id
 d75a77b69052e-46e12a15fbfmr1292631cf.1.1737062190361; 
 Thu, 16 Jan 2025 13:16:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXt5NyVoWry2QOdDSRLx9F2O47PKP+nxPyccur8tm4EUjeKajrh/vfeX3iMMizXWvAQI/zsA==
X-Received: by 2002:a05:622a:1922:b0:464:889f:a41e with SMTP id
 d75a77b69052e-46e12a15fbfmr1292411cf.1.1737062189895; 
 Thu, 16 Jan 2025 13:16:29 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5db736428e3sm437703a12.14.2025.01.16.13.16.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2025 13:16:28 -0800 (PST)
Message-ID: <404e8b7d-30ef-47f2-8a44-927b201d60ec@oss.qualcomm.com>
Date: Thu, 16 Jan 2025 22:16:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/4] drm/msm/adreno: Add speedbin support for X1-85
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250109-x1e-speedbin-b4-v1-0-009e812b7f2a@quicinc.com>
 <20250109-x1e-speedbin-b4-v1-1-009e812b7f2a@quicinc.com>
 <356986fa-e66c-4e78-ab92-2593b037ab9a@oss.qualcomm.com>
 <837602a7-bbd5-4436-ab9f-2b101bdcaac2@quicinc.com>
 <enykcipequ4xjykcjbkpnmtlclrbbmkhncj7fx3zy4sgmo3h4n@y3k7xgjscpfc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <enykcipequ4xjykcjbkpnmtlclrbbmkhncj7fx3zy4sgmo3h4n@y3k7xgjscpfc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -sy_p4lRlfICjQ0S1_-b1NJSdyBbDdut
X-Proofpoint-GUID: -sy_p4lRlfICjQ0S1_-b1NJSdyBbDdut
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_09,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160157
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

On 15.01.2025 8:59 PM, Dmitry Baryshkov wrote:
> On Thu, Jan 16, 2025 at 01:07:17AM +0530, Akhil P Oommen wrote:
>> On 1/9/2025 7:27 PM, Konrad Dybcio wrote:
>>> On 8.01.2025 11:42 PM, Akhil P Oommen wrote:
>>>> Adreno X1-85 has an additional bit which is at a non-contiguous
>>>> location in qfprom. Add support for this new "hi" bit along with
>>>> the speedbin mappings.
>>>> ---
>>>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  5 +++++
>>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 15 ++++++++++++++-
>>>>  2 files changed, 19 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..e2261f50aabc6a2f931d810f3637dfdba5695f43 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> @@ -1412,6 +1412,11 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>  			.gmu_cgc_mode = 0x00020202,
>>>>  		},
>>>>  		.address_space_size = SZ_256G,
>>>> +		.speedbins = ADRENO_SPEEDBINS(
>>>> +			{ 0,   0 },
>>>> +			{ 263, 1 },
>>>> +			{ 315, 0 },
>>>> +		),
>>>>  		.preempt_record_size = 4192 * SZ_1K,
>>>>  	}, {
>>>>  		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>> index 75f5367e73caace4648491b041f80b7c4d26bf89..7b31379eff444cf3f8ed0dcfd23c14920c13ee9d 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>> @@ -1078,7 +1078,20 @@ void adreno_gpu_ocmem_cleanup(struct adreno_ocmem *adreno_ocmem)
>>>>  
>>>>  int adreno_read_speedbin(struct device *dev, u32 *speedbin)
>>>>  {
>>>> -	return nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
>>>> +	u32 hi_bits = 0;
>>>> +	int ret;
>>>> +
>>>> +	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	/* Some chipsets have MSB bits (BIT(8) and above) at a non-contiguous location */
>>>> +	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin_hi", &hi_bits);
>>>> +	if (ret != -ENOENT)
>>>> +		return ret;
>>>> +
>>>> +	*speedbin |= (hi_bits << 8);
>>>
>>> Now that we're overwriting speedbin, we should probably have some checks in
>>> order to make sure somebody passing a too-wide cell to one of these won't
>>> result in cripplingly-untraceable value corruption
>>>
>>> I guess we could just introduce nvmem_cell_read_variable_le_u8() and call it
>>> a day?
>>
>> X1E is an outlier here, because this was fixed from the next chipset
>> onward. For newer chipsets, we can use just the "speed_bin" node, which
>> represents a contiguous 9 bits. So, just do a "WARN_ON(fls(speedbin) >
>> 8)" here?
> 
> Or extend nvmem core to support non-contiguous fields.

This sounds more desirable, as we surely aren't the only ones with
such a "feature"..

Konrad
