Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B01BCB4772E
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 22:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29C010E174;
	Sat,  6 Sep 2025 20:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pouNVh+O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B71F10E155
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 20:56:21 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 586JagJQ017236
 for <dri-devel@lists.freedesktop.org>; Sat, 6 Sep 2025 20:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KWeNW4vApSp5Fjhfu882/TynnsrQdubrSOZdGp7Z6M4=; b=pouNVh+OGEzOITO/
 C2+htmLJcDpkMljryRhFF3jCT11A6chBEAfC9wZfCWBMpTotzZxpxo8cPQS4Mutg
 ua9xM/VsgUoHsKmmgjFtDNvdzSagwf4CStdvmYUj2rKHh3yYfBiA5ks1QCwhoo8A
 /XXGcbqspmUAxyS/wfi/NDfc8ubPhbaZMRmjUWc2C/YCA57mq4DPpHGMlVeLg4Vy
 pNbOeoPM7lyzIEqMXrpwc3E/uhVo2yV7LC82Iyn3ZyTbG8+rVNUhwiKoqZaHE/QF
 9vPAod/us/XXjjhgjpfKhKixXDPD/PFBA8j7rJcWEp+j3M5QBO90shOY2fff909D
 qWI7gA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by8s8ve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 20:56:20 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b522037281bso566349a12.3
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 13:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757192179; x=1757796979;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KWeNW4vApSp5Fjhfu882/TynnsrQdubrSOZdGp7Z6M4=;
 b=v9AC83SxjdJDHhy7MXd4xpSTxuBBntACkgjqCkSz/KINVtXNcLjfysLuNaHzzn987W
 VFEEsZ3lyxHZnad+g77QqXthqIbFjlBDzzTv20E2D+ygsFAB9CHPtW1TNqOfDcAZPyOR
 73wTn+X/XuvniPmsgqZxVPZZsBMp38A4XZhcwwC8qLY7rDr0S/tTHr3sjpNo5YDpyOIM
 aYpBlKsa/FXYRIFIlkVrZwj9H8Ae51+DTdCLP62rLygZ2rDNzQMcqCpj4U2V3BFqhElj
 G6Cq27dtz29BkNhMUOdRu6YXU1lofEfy/EbiDKGdbTLmn8YXfJsXgY22Dps8ZnArqCJ5
 aU8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6DjFbVyDRIrsnfzl4Hfl65OFm+2Pimjjr7o6bVVKzKxsoWBl8rGkRmB9c2isd4WjcK/tBBFIYdOk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3aUwuW5W8wq8wUMiLRRoFnfnjaDMRNIhqAL/6ysW7WGjy4PyC
 aVvX6jD38fzGJQniw9hEE/0OFIDg7KvcIyFXXmaY5tCD+9deR8D0e7nevcIYn4fTA46/gAFk/ye
 MXymWtSvpJzDOn6bN59tGNFKqnMTpyGk0UuP+OGsXN8NPNBLJceBkPrr9QhDTbLSyQ2quYkU=
X-Gm-Gg: ASbGncuIAwz1guhYzN27txs45j8wZaPIHFfrdC4TlU5/MspdavVOmcFfUhAnmKTFf/h
 cQxpE3Pxc6XPKGycra7b1EXYFeIVRvwsOPMZkipztZjXmyVbSCHbmg1R0kPaz3d3ZrSAXyTHmKT
 gknwPDc6xX/MKpLHnJID/ZXUaV4bycHrLJWH4gQyEUTo+Y35MiydebXdnLIwYUU1iZlWVojq8Yh
 NaOUt8mVOVG3hKVMGbQJ0WziLriuZMLrDoNSZ+6nyFS6zGtyySTLpMXfw00uWGbNkFbrckLmgoo
 rVIf60g1H4RAWzMYyc6H1VNumO/d59fbDv8qxeiWmvnAXrwn79BA+lzZQhzr+Hal
X-Received: by 2002:a05:6a20:734c:b0:24a:69c5:e9d9 with SMTP id
 adf61e73a8af0-2534557a858mr4403387637.39.1757192179033; 
 Sat, 06 Sep 2025 13:56:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSFjvOo/qTGxHXp3wiVQKj7HoGwmGtWzfJpDenuCSbN2DKNJDPXY8f/qc5OOKz5fQQXodCEg==
X-Received: by 2002:a05:6a20:734c:b0:24a:69c5:e9d9 with SMTP id
 adf61e73a8af0-2534557a858mr4403357637.39.1757192178483; 
 Sat, 06 Sep 2025 13:56:18 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.231.120])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7727822817asm12558174b3a.98.2025.09.06.13.56.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Sep 2025 13:56:18 -0700 (PDT)
Message-ID: <14b5db9f-8b31-4baa-a03d-12112425fbbe@oss.qualcomm.com>
Date: Sun, 7 Sep 2025 02:26:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
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
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>,
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
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c3de911c-e80a-429d-8a5c-c693546d4abf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68bc9ff4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=LaKoERy2ZarllCCVqnwusw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=fXDYdZQTyQKxOPRIeewA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: EsQInHzX0mqfFwWtdmXsoQ5CD0Toov6j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfXwnkwz0nJWoOO
 T/cHPtJuLtx4lz7dH11TDpP04HIx563dKNJ0pKKSsUujGCytrM87pY2hRrmrSQg+RStJxf8XihU
 UbPNz5PTfoy/N918sSFEBE7XH/g4hLqkPq/iOUeGJbsi65TyfoqjfOLjMJhPSHCBlBfk37K7UFs
 ubE7tJaubyIg3WBA8Fw7nJ7htd9+sDsDmc9G2IzR2cNapfb2p9arbnLEmlDmlts3HUQaLmeBTSs
 pmpdA/yNVJaHlBRvmniA77/a6j9YOITFsYLI+C06DPn63GpCDqsEu1tHWEBUXemDYAMiFgKyoCQ
 Ao2hLV+5/8oFoLdldpurbBzZHM9xraS3m6yo1D4IBtKx0ShK2S5C+1DMtF034pZmsy0z/Dy5JYU
 XcTQqmSA
X-Proofpoint-ORIG-GUID: EsQInHzX0mqfFwWtdmXsoQ5CD0Toov6j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-06_07,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

On 9/3/2025 8:44 PM, Konrad Dybcio wrote:
> On 9/3/25 4:00 PM, Dmitry Baryshkov wrote:
>> On Wed, Sep 03, 2025 at 03:36:34PM +0200, Konrad Dybcio wrote:
>>> On 9/3/25 2:39 PM, Dmitry Baryshkov wrote:
>>>> On Wed, Sep 03, 2025 at 02:26:30PM +0200, Konrad Dybcio wrote:
>>>>> On 8/21/25 8:55 PM, Akhil P Oommen wrote:
>>>>>> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>>>>>>
>>>>>> Add gpu and gmu nodes for sa8775p chipset. As of now all
>>>>>> SKUs have the same GPU fmax, so there is no requirement of
>>>>>> speed bin support.
>>>>>>
>>>>>> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/qcom/lemans.dtsi | 116 +++++++++++++++++++++++++++++++++++
>>>>>>  1 file changed, 116 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>>>> index 8ceb59742a9fc6562b2c38731ddabe3a549f7f35..8eac8d4719db9230105ad93ac22287850b6b007c 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>>>> @@ -1097,6 +1097,18 @@ ipcc: mailbox@408000 {
>>>>>>  			#mbox-cells = <2>;
>>>>>>  		};
>>>>>>  
>>>>>> +		qfprom: efuse@784000 {
>>>>>> +			compatible = "qcom,sa8775p-qfprom", "qcom,qfprom";
>>>>>> +			reg = <0x0 0x00784000 0x0 0x2410>;
>>>>>
>>>>> len = 0x3000
>>>>>
>>>>> [...]
>>>>>
>>>>>> +		gmu: gmu@3d6a000 {
>>>>>> +			compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
>>>>>> +			reg = <0x0 0x03d6a000 0x0 0x34000>,
>>>>>
>>>>> This bleeds into GPU_CC, len should be 0x26000
>>>>
>>>> gpucc is in the middle of GMU, see other platforms.
>>>
>>> This is not the case here
>>
>> Why? I think GPU CC is a part of the GMU by design: GMU accesses GPU CC
>> registers directly from the firmware.
> 
> Correct, however this is only a similarly sounding argument - the DT
> describes the hardware from the main Arm cluster POV. The GMU Cortex-M
> core has its own address map etc.

We have been keeping GPUCC region in the GMU's reg range in all chipsets
for the purpose of coredump.

Can we leave this as is until we have a mechanism to dump these into gpu
coredump (via gpucc driver??)? I recall you proposed something similar
sometime back.

-Akhil

> 
> Konrad

