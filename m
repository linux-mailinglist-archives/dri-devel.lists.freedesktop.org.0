Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52550CA7809
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 13:03:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF6D10EABD;
	Fri,  5 Dec 2025 12:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HLiHqHen";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B5xHXNLX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB0910EABD
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 12:03:16 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B57oQkM2406591
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Dec 2025 12:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7ibRns9NpT7LfaypmozZ00h9uMW/vCu+51UfOTwa4xw=; b=HLiHqHen3PiMkldG
 650qsThVHMEsBaLSxlhAqqxkXk9hyckjX3twAM+eVhqgQPo+buHuUVkViDY4U5M3
 x4mjcu+QuAVSXxAJEZGIFzlwFJ9A3urUPBK89UyW0aOYcdMl2LXBtqoutVl/xLX3
 2YMDjUDdmcQPNNiezzjWfbzFc8+/40uzOfO++SQdqu+doThtkmzU/kdxoJnMC0UF
 3/sti3IUArB9nsozpPc3e39+uHwWfGA/UzaDY2yoFuetG2l6+MhdxTpYJVEupz49
 qI1eJlXHXr9ppj2MGZucS7ebu3RbhBoMRClYC0uTfHBrOs2tcBYCmDWZFh4qRH/I
 K2knPQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auhtya5nx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 12:03:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-884821f01a2so4814156d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 04:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764936195; x=1765540995;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7ibRns9NpT7LfaypmozZ00h9uMW/vCu+51UfOTwa4xw=;
 b=B5xHXNLXmJRCwZcjfJ9PcnRRO30blK6JsWGuoBvXCTWbenpVSrYCjilWDFGSzDELiR
 6GO6TVU4J1qVbx6AEpNAES/Bm3cB1ngNJJLJKJfzNs5IFF6W7jhZ1yrtWYccqmovsfz3
 ZSVmiHH35HN1tm8qS7x6i8gH0uc/xCj/zKjs+LAyqEq9vhlXNHFI43TsiYJatH2mOkCp
 1AgTBRCjR/U7UfrtZRZZTjthi6hjnV5n/1cE6i91uwX2q0TEgJ0UwfbghXMMW5roQjOG
 xPw1/+mgwRcGBOwMl915WmCA0o8zPpeoEaNAUxvp0GTUPwiqiPOsTMpIjKZSoIqp0Nnt
 VVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764936195; x=1765540995;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7ibRns9NpT7LfaypmozZ00h9uMW/vCu+51UfOTwa4xw=;
 b=XGEUisagkhv7NrvQaYhC6SbOUbLgkn9Ah/CJylmMcTuHHtvroGPQw0MA4+FBtV6TZI
 YY8xbnkLySCCL+TQ+bikRIrgUX9p9H4uKZgAgAvAR1qKxqG9bBk5LuFcl/FurN0vX4qD
 nsI8SUUxQX9kN8q8zA5EQ9FN+yK1tzmVaW3rrRQVKVWeInqr50fbkv0t5RSjGI8zQuuW
 H3JsXjgQXpIIINRrxrXofbIgBneKzURnUWKifmk2NNuU7BmojLLEFjsrQKJJzkltPdOC
 l7CEUHKEvC2LogVwkWLqKfO1zuu4a9oNzFT4f6p32FksNxjSk55ZwkzUQe8aDGSfMNjw
 lpKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtbRqPFbjgJWL2sOSbLlXvZki+kZzgJjSnORQ33kgoyxNnR6+4dfaoTK7PN+6kZZSm5IVA4KG3N7Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw47eOP7h46M2yu8zXwmaq1qEj9y0fu8NZbZ4pcurbGLdgkKeRW
 Q8M4eJC8UUi1RO3ahcp6TlVtSIMjgOefiAUCp5g2sBTw1NuIWM9Ofv7DUzWwir5xfL6tJjq+92O
 cMN7/9nxeBJ3oi8/4dZKF8979iZzT2GdmZOwvRYChrJQSQKu1ozQWjZHadUukSvHQzpLq+AM=
X-Gm-Gg: ASbGncuEXUKI099zlin3Sg0opEeWR4UeZmDaDukZJrhWE9O194ADpJt/09a3mw8qtGN
 dZ7WkuuqXppMenxqKHdqjeXOP2xAvpL0PjnGDyJw+Fi0KpBMHBFiSsOKD2hekI920ph1/H9senY
 8HcHNpHTfaxA7Tzm+qLitxPDhTz3spDsgu0RAxZWeGd+7vGtaEjiWn15yaKoFuck33LsMZia9xx
 yv9OGWpCUcDGdiCqbx3v4AyaBtxiqrg8Mzb+WlbPccwfY+uCWsFvJ/J8L+bBlxMN6/UhD/yqvaC
 VOgwSFEoRHFvpNORVoeHa08cAJuKCzFEtNC7s0lNWZ9+q9uFgN5HZuFrDBSwTcuP0qebVcVOE5U
 gVAeUqTxOP5C8pCaGpq51uN40WKVk6LqdfmdPmepvxqxhMJQujQq+wwkKQHB5dYwAcA==
X-Received: by 2002:ac8:7f54:0:b0:4ee:1588:6186 with SMTP id
 d75a77b69052e-4f0176844ddmr100919491cf.11.1764936195058; 
 Fri, 05 Dec 2025 04:03:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDtA69UwRIJoySS2OMMEYNqbCpINvG3hPdksp1reab8w5GlGFxHYYfb5cJEmOse38qlA5hXQ==
X-Received: by 2002:ac8:7f54:0:b0:4ee:1588:6186 with SMTP id
 d75a77b69052e-4f0176844ddmr100918911cf.11.1764936194568; 
 Fri, 05 Dec 2025 04:03:14 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f4975dc1sm345503666b.32.2025.12.05.04.03.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Dec 2025 04:03:13 -0800 (PST)
Message-ID: <551b45ae-0980-4bd5-bb83-2fac6d7e2ce7@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 13:03:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] drm/msm/a6xx: Retrieve gmu core range by index
To: rob.clark@oss.qualcomm.com
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-1-9f4d4c87f51d@oss.qualcomm.com>
 <9cc55934-6980-4673-8501-2d1efe2f816e@oss.qualcomm.com>
 <936b6a48-a5e5-4efb-be7c-215ac670677d@oss.qualcomm.com>
 <7b4bcb6e-fbb1-45f6-921e-dd1340a8cece@oss.qualcomm.com>
 <CACSVV03buEzs9UyDaDpamyAXwM8vrkp2P_N67Wqt3oRjhdc-sw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV03buEzs9UyDaDpamyAXwM8vrkp2P_N67Wqt3oRjhdc-sw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA4NiBTYWx0ZWRfX3dTALmxWnunR
 K4yd/vC2trCPqRGIoZcv5aA1V8dcQ4KWBPl0Ev8ayDKTTdljY/ntvyYiTZZ1l032E+aNddNtv7K
 KFJiS5gVBrik6ZJUAzsvihYXUpJhLy8FFnGYfM6z50Zr1I11buit0t+YBHccIyYmM1/bz6+jkql
 GJZmJGuMNiF08W7e1oXTknz7EW8tuaPBrcGOwjrJNvX33j7Mg0Lt9ohanaflo9j5qDOA9qWxZ84
 w2O1YNHMWS+J5YLtA0N673zxzAfLP3wsQHcAHNR9TNhgz9QPZquBVNEcMTi4C1LpF96p59E1j8N
 C10KZxekOjwHxGEJSny0IJZZchpR7NtNPqsnVcyy0Z6BltOLpAz+6n1qEH4+8Kcb2LkI4Y74QB2
 5JZyRY6S8+GArifO43WyAsiMbPUinw==
X-Proofpoint-ORIG-GUID: UzEa2JOp5eqtKKRAhFERO5gWG7QsjgOD
X-Authority-Analysis: v=2.4 cv=DplbOW/+ c=1 sm=1 tr=0 ts=6932ca04 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QGPp5zjhHj0ErSlcMgEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: UzEa2JOp5eqtKKRAhFERO5gWG7QsjgOD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050086
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

On 12/4/25 3:34 PM, Rob Clark wrote:
> On Thu, Dec 4, 2025 at 5:30 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 12/4/25 2:10 PM, Akhil P Oommen wrote:
>>> On 11/22/2025 7:08 PM, Konrad Dybcio wrote:
>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>>>> Some GPUs like A612 doesn't use a named register range resource. This
>>>>> is because the reg-name property is discouraged when there is just a
>>>>> single resource.
>>>>>
>>>>> To address this, retrieve the 'gmu' register range by its index. It is
>>>>> always guaranteed to be at index 0.
>>>>>
>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>> ---
>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 14 ++++++--------
>>>>>  1 file changed, 6 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>> index 5903cd891b49..9662201cd2e9 100644
>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>> @@ -2029,21 +2029,19 @@ static int cxpd_notifier_cb(struct notifier_block *nb,
>>>>>     return 0;
>>>>>  }
>>>>>
>>>>> -static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
>>>>> -           const char *name, resource_size_t *start)
>>>>> +static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev, resource_size_t *start)
>>>>
>>>> Can we drop this and just use devm_platform_get_and_ioremap_resource()?
>>>
>>> This API seems to lock the io region and fails with -EBUSY if the region
>>> is already in use. I am worried it may regress other chipsets. So, I
>>> dropped this idea at the last moment.
>>
>> Is there any specific platform where this would be an issue?
> 
> IIRC we've had this problem before and ended up reverting a similar
> change, due to gpucc and gpu overlap

Argh, sm8350.dtsi for example seems to be affected..

Hopefully one day we can fix that..

Konrad
