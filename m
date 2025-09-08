Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1F5B493BB
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 17:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9423110E157;
	Mon,  8 Sep 2025 15:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kr2tOBst";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B71710E157
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 15:39:11 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5889Ga6s022660
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 15:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9ix8Lxn9DP2aA0chOL91fW2+iXcks/DUCOCWwGLcOgI=; b=Kr2tOBstZ6FlTNhO
 h+ImuNoASmfh+AhJM9R4LNr1x87C5DPsXFQIwrrXGYlGj9O9/ECKXyEg0g84gRev
 7L8F/8LVRbJuOUv591x2ewQLznBtxspvcp7r2Edaq9Z3xNBLvwhxkc0nupfHMCFW
 NZiLN+Zj2nhn+cqfK1/1+OFhXHokjCmM3a522MndM8IqbRJ2RZcSXwiOlFQmkPva
 VnV05oxNXhw157PBFwTgUbys/c7ixabSE8pE0GzmFLDlAxGyRByhgBvNFY+otpbW
 uuZGfw/DqxL6PyYQ4sSDtCybmI4OxX3CFcfyxZCixulNEAGa3stSv1+HAsRWJRuj
 hFsnpw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc211gy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 15:39:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b601ceb41cso9453231cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 08:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757345950; x=1757950750;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9ix8Lxn9DP2aA0chOL91fW2+iXcks/DUCOCWwGLcOgI=;
 b=DndCSTvAfUGpSJx/6ODWd8dy2wc2Of74ubiIlLEh+KcWPGBgfWyHKXxiXY7nHxFxQf
 86C6KC7Oxel9Y9s6ajYHhFjqHso3Ztzejl1ksNdIh9TXMphyzadqdKtHmml1AzkcHqV1
 W0PnRhdakI1DbYbXQERcF7WMNevY6u1K6QzTiTwSQfbw4aLN8EMd4qhxSIr0nBquy9Eb
 lUZmpAxZuvn0un5Z79J5oIVg0wSm7eAGnDKN0AvuC2ojaoMUs1Q8Vs0hpDmtS4V/CMek
 nC2z4yGUX6PVXeb1cBj79b0uJymPfIFe+qbx/Uo5TEfPtIOBEy/I4uUvJDyuTi/tdNkY
 USxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZMXrPlSiGJgPGaneObjx+1fKvaZPgYw7RyDRIY2cwgfjRQI2V3uCeJj+vU5hLQOsECyG33XeSQIs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLlzV00QABn6SO2jI2TjMQw2amFMMReOw4U6vKG2cw7mlguD2r
 i5c6NfwbAkEfRCMRZzwan5a8QWME6uYWEVHYRWDQpfPn7OCgybQ8iBw8ow7lQlX2WQiJw+APQD4
 Ere2emjkyfyMDaYJ7Hp9rb6zn8rxgKfTB/HlvFmp1j5CB0W4nTb3+L6OnZE1m/2spirtSvio=
X-Gm-Gg: ASbGncvuMzXl0qwJHXi1rptJsO9r72j0lwEGe30beWeUaBaqZb6pm616smCQZYimgWs
 ZNN3pOux3tzyKchZl4ldy4l+Il4/wYFm4/ENiNMtCuKDWk9gANX8C4joXGG04vZKNGqy8hQwhXy
 EUoTnkf3u+vCQShTeHVx3mfI1cVQvxXsHXu+XxHGDHZCoCQa1TVt/ouBbRs0nrq6USBI9PRh394
 e93lQx6/GE89R38itS1B/JuSUn+RKjsgn1XY/jpxEF9ldLO2KyQ/+ntXPLSYzjNIpV+lT1BJ6kc
 BK3OZfYp4a0I8SZaVLbQOwIZJPRqx9idDd53vdEnWTu6OmKiY/7z87B/u8lpqB63FGsGKCCGmVF
 UwXqv/3Nl7MCdr3kwOxxcWg==
X-Received: by 2002:a05:622a:19a7:b0:4b4:9070:f27e with SMTP id
 d75a77b69052e-4b5f826059cmr55448811cf.0.1757345949544; 
 Mon, 08 Sep 2025 08:39:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSjAuw3MqqByPMWEwcaVGXJrt8t0L5vdGx6BjurjDCr+ZzKHljYEOvuS1tfcYm8a1jnOKGwQ==
X-Received: by 2002:a05:622a:19a7:b0:4b4:9070:f27e with SMTP id
 d75a77b69052e-4b5f826059cmr55448481cf.0.1757345948792; 
 Mon, 08 Sep 2025 08:39:08 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0423ed35e4sm1961096966b.25.2025.09.08.08.39.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 08:39:08 -0700 (PDT)
Message-ID: <5bbe77f0-185f-4905-8097-8769f0d5f518@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 17:39:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: rob.clark@oss.qualcomm.com, Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-3-97d26bb2144e@oss.qualcomm.com>
 <f11b778d-eba1-4712-81c7-b83f2cb38b46@oss.qualcomm.com>
 <exkrgx6rdotfrrsnklsd7zk4ydehsk5vaoevibpqisyq2dwbd4@sa4kgnuexlna>
 <f169be5a-faa5-4824-861e-27bd2083b9cf@oss.qualcomm.com>
 <t5pxum74q3fwf6wgcbaeaginjvtjfn357pkfswvafsggtmvxfv@jl5qjfhpmmow>
 <c3de911c-e80a-429d-8a5c-c693546d4abf@oss.qualcomm.com>
 <14b5db9f-8b31-4baa-a03d-12112425fbbe@oss.qualcomm.com>
 <CACSVV02h8AUX8WtEuu5w-g2XnfBkfozHQQ15zGK6+LVX_w=d1g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV02h8AUX8WtEuu5w-g2XnfBkfozHQQ15zGK6+LVX_w=d1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68bef89e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=am1a1fgwjgo6KoPeU6gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: TuXR3aRNkqcZPIrda9uq5tLw4cztm-ah
X-Proofpoint-GUID: TuXR3aRNkqcZPIrda9uq5tLw4cztm-ah
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX56hDG0hq8U2G
 AEIoNh7s/yjmd7KL+WGnwyVFW/a9xAT1dQfIjFkTAUEenMmm0DZyTEdazvhQOAkrO5STQu4mmtz
 U+RU7rGm7c4iCYdk2jDOilglX2AYUqhp5Ab+Dq/2gpiayGOf6RMI+cqaMrZqxX1kADqAv2hh3jf
 TW424tVWz/2ASahMlzEV6lF7f29rOAMaGA2bm6TGq+xb5C5OwnpAIm5PazfAQL8BSUhW5q5zkF6
 8HpYOAPHyQVRgxUXBgLw7pKKAAu7Ue1QOgG48q9z/Z/Y5O2aIszdIl9htbM9QL7fpNbX+d6e9TP
 r/1s1zRz6bYcWTnUNhpfOpXBC9BboqTeZ8yfTcb5KykIbokU5TVjpFTVeca2T65xUO3CZWEYwSa
 cVp6mSc/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_05,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094
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

On 9/7/25 1:02 AM, Rob Clark wrote:
> On Sat, Sep 6, 2025 at 1:56 PM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> On 9/3/2025 8:44 PM, Konrad Dybcio wrote:
>>> On 9/3/25 4:00 PM, Dmitry Baryshkov wrote:
>>>> On Wed, Sep 03, 2025 at 03:36:34PM +0200, Konrad Dybcio wrote:
>>>>> On 9/3/25 2:39 PM, Dmitry Baryshkov wrote:
>>>>>> On Wed, Sep 03, 2025 at 02:26:30PM +0200, Konrad Dybcio wrote:
>>>>>>> On 8/21/25 8:55 PM, Akhil P Oommen wrote:
>>>>>>>> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>>>>>>>>
>>>>>>>> Add gpu and gmu nodes for sa8775p chipset. As of now all
>>>>>>>> SKUs have the same GPU fmax, so there is no requirement of
>>>>>>>> speed bin support.
>>>>>>>>
>>>>>>>> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>>> ---
>>>>>>>>  arch/arm64/boot/dts/qcom/lemans.dtsi | 116 +++++++++++++++++++++++++++++++++++
>>>>>>>>  1 file changed, 116 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>>>>>> index 8ceb59742a9fc6562b2c38731ddabe3a549f7f35..8eac8d4719db9230105ad93ac22287850b6b007c 100644
>>>>>>>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>>>>>> @@ -1097,6 +1097,18 @@ ipcc: mailbox@408000 {
>>>>>>>>                          #mbox-cells = <2>;
>>>>>>>>                  };
>>>>>>>>
>>>>>>>> +                qfprom: efuse@784000 {
>>>>>>>> +                        compatible = "qcom,sa8775p-qfprom", "qcom,qfprom";
>>>>>>>> +                        reg = <0x0 0x00784000 0x0 0x2410>;
>>>>>>>
>>>>>>> len = 0x3000
>>>>>>>
>>>>>>> [...]
>>>>>>>
>>>>>>>> +                gmu: gmu@3d6a000 {
>>>>>>>> +                        compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
>>>>>>>> +                        reg = <0x0 0x03d6a000 0x0 0x34000>,
>>>>>>>
>>>>>>> This bleeds into GPU_CC, len should be 0x26000
>>>>>>
>>>>>> gpucc is in the middle of GMU, see other platforms.
>>>>>
>>>>> This is not the case here
>>>>
>>>> Why? I think GPU CC is a part of the GMU by design: GMU accesses GPU CC
>>>> registers directly from the firmware.
>>>
>>> Correct, however this is only a similarly sounding argument - the DT
>>> describes the hardware from the main Arm cluster POV. The GMU Cortex-M
>>> core has its own address map etc.
> 
> but the firmware is part of how the hardware appears to the main arm cluster
> 
>> We have been keeping GPUCC region in the GMU's reg range in all chipsets
>> for the purpose of coredump.
>>
>> Can we leave this as is until we have a mechanism to dump these into gpu
>> coredump (via gpucc driver??)? I recall you proposed something similar
>> sometime back.
> 
> IMO we should keep this in the GMU range.. if in the future we have
> some other mechanism to dump gpucc state, then for future platforms we
> can start using that (ie. new dt but old kernel should be a thing we
> at least pretend to try to keep working), but for current/past
> platforms we should stick with keeping this in the GMU's range

Eh, right, sorry, we discussed this with I think x1e, let's keep it
as-is until more infra is in place

Konrad
