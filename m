Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E760DAA48B3
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 12:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038B410E723;
	Wed, 30 Apr 2025 10:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="j5+fx0Jo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB8F10E725
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 10:39:03 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U98gXn021317
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 10:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tTiniXOe50bWwoWCn68Sn+g32IeeFnNdfbw7A7ZGjr4=; b=j5+fx0Jo0PfTfwae
 r4fJXEQZm7/q/1U8/tiHRK7oFGTDIbCLsIw4diFG3EPx/nPJw6RosXpIEO1kFDvj
 dNOPul2XKiH2+UXo30R/a0AuwlkV6R/JzWXqT+V3zIBSdyvCd34cMA6QF/EEdBpU
 BJm7a0KRj5Y+wOPgmSMQNcEY6KnDHQOp6SN+0s18tvDmBYDcZi86Yp0FxldsgvoX
 iCt6JXcqZr+I4cWX21ySOxWsN6F6EFD0kSNhkBK8V1HevDPxdu2UvSeBD6TCqkzK
 e/4n7BcReNGPwxYPBUY3oURRuG2++kP0IA7afSu1nW4xwKJtdMazGUGoOnIxh08A
 wfRiOQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u71tks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 10:39:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6ead1d6fd54so12689546d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 03:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746009541; x=1746614341;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tTiniXOe50bWwoWCn68Sn+g32IeeFnNdfbw7A7ZGjr4=;
 b=Hl7Ly+ymE9iabsVxjz48Hg4ghjf65z5FAqQHlyRHTv3MFpAOWgD2S6U1cZNKYb2onE
 UKLHsMjSLFpLVncRLTiNp0kBuzbnSNIwfrMdUgC04p+/5G6XPzhhuCSUUr9Qen5RKb7v
 l7AQaJ/PDD5T1PW2oUCtfKrIkXEN1Q2QhqI9poWy/rME6crodfScbf7ePsST99xzk3Js
 uqgDr9qxxxgAsr7UArPpMu01HQfB4m6pPXYlTpIzbhw13bOIZjK99I6Lps0hz/pRHlSp
 3WGnZRVWtLqv7Mnz7vLPlBcTxNMPAQN949bR+kpSg7d983HfasGiPHHhBWQcXjkO/n4O
 CA8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKKe/U0vFX7dRVNXiv5jGA9bCWpLz5HjJAfUiwIM28XU1+vRVEw0lVLvPDOdT3rercsZY0UbO1G+I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0HtsSXCOHB0Ajay6vzjA9Rc18vPEEYsL6FCx5VPuJTPMEkhfZ
 M/tfc+eNZNRkv8nPIz3ItY8k88zLWYbdr1h2UG0h25Qk9OSgLMU2KM1/N+7+xOrMIw1h9us7kWP
 g/Xk3/fgvU8r67vhEmqQHfLOwaG20dwB6SZJ1dosUAlLAA6j2A2oT7VNTYLN8elUAQgQ=
X-Gm-Gg: ASbGnctJh/t2nAe6xCDQXgQVL/Hz44gZSYMH0oHPpEa685ay4EPXkifBXHXlb0ad7C9
 Ljx+sEpAsZq6MZ+j6LwYJh4x4JiqxKaULqRD23/CS4ZTvqLJFkl1yb5Fflsl2pRnx5jsH/MGXdF
 xHxuUX1vAyfcdNU3HIOZOFIYaeXma0GSIYV/EP7XvvhK7bOZ1ok9qkZ3iKQPdll9ze+6wkP1Z7h
 rKdgwwEwpp70niNhEhCgBHkA9g2wG7tknAg8Be4poSWH1Gwcb2ThI1h6UgTJWhtJqwyO6fweTbA
 33O8SlXJUbvr7x2ge66xzif41TlHIliwZ/U+s/BgabsSF0OVHyWj0tTa6Xaoos/300k=
X-Received: by 2002:a05:6214:3012:b0:6f0:e2d4:226e with SMTP id
 6a1803df08f44-6f4fcf8da52mr14601376d6.8.1746009541641; 
 Wed, 30 Apr 2025 03:39:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZlDZ7fgacYzToVTLAIqF1SbHulHpm3F3MMH+wjGvrRzv5uoIFNvo0UB+Ri+k9t28tLdOxCA==
X-Received: by 2002:a05:6214:3012:b0:6f0:e2d4:226e with SMTP id
 6a1803df08f44-6f4fcf8da52mr14601096d6.8.1746009541285; 
 Wed, 30 Apr 2025 03:39:01 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f7035462c2sm8439702a12.58.2025.04.30.03.38.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 03:39:00 -0700 (PDT)
Message-ID: <f1fcf9fb-3be2-4097-a372-a76bfba6043e@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 12:38:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
References: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
 <20250228-a623-gpu-support-v2-5-aea654ecc1d3@quicinc.com>
 <e22daaae-57fc-4523-b594-87d202d255f3@oss.qualcomm.com>
 <aa8ebd50-683b-4043-9494-5675a2d9a01e@quicinc.com>
 <41df5398-79f6-484a-8ad3-f3488eb1b71c@oss.qualcomm.com>
 <hpfqpvkex3dtj6ieosce4phukodnoidh55vxpujyekoehhotqn@l434nae5gzdi>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <hpfqpvkex3dtj6ieosce4phukodnoidh55vxpujyekoehhotqn@l434nae5gzdi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA3NSBTYWx0ZWRfX/pvEQVyQ4Q/T
 ga/e8cY3Lw245l9LZh5eUX5F09VFlAqOks72idte7qfgq4N5+d2+LfNuyQK4bbdPyAgc2/fpQyn
 raapP/+c/knw04ieVuIcIAQoMaYHldp80ArMow1ZhIWMiVdhshS35fjyUnl2tnFPvagmp0YpRsC
 +QJlDsWb8WNAuSx1M3HtGo/oaz5B8k4sFSI3j4FNmKUQTJr8D2Rz+p0XIBo3Ehf09P5k4owhFgm
 29d7MvF289q/VXjegwOBtb6yDEg9vpoTDAmKmuIDHgtjMQKK6l0j+XDQXiJ77qLdDWy9p2D0nCz
 sQDWhcpW0iqIZEzYXKkqCYt09CPy+/8h3tmf22SalufeVmWgPbRhXsoohKmGn33OcHeEN7YEoM6
 Rp3k8u1aMOLS7SfC0wi3k3VGBxibnomhyIiYPY5wnW2y40R1UuY90NIobta5zkgHgBGXUhUO
X-Proofpoint-GUID: 8P2VCPfXq2xsPb7ZOZ4gP_Oe3DqkBjsl
X-Proofpoint-ORIG-GUID: 8P2VCPfXq2xsPb7ZOZ4gP_Oe3DqkBjsl
X-Authority-Analysis: v=2.4 cv=b6Wy4sGx c=1 sm=1 tr=0 ts=6811fdc6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=Y1ZdfsrSitFJjnkYTe0A:9
 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=835 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300075
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

On 4/29/25 2:17 PM, Dmitry Baryshkov wrote:
> On Mon, Apr 28, 2025 at 11:19:32PM +0200, Konrad Dybcio wrote:
>> On 4/28/25 12:44 PM, Akhil P Oommen wrote:
>>> On 4/14/2025 4:31 PM, Konrad Dybcio wrote:
>>>> On 2/27/25 9:07 PM, Akhil P Oommen wrote:
>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>
>>>>> Add gpu and gmu nodes for qcs8300 chipset.
>>>>>
>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +		gmu: gmu@3d6a000 {
>>>>> +			compatible = "qcom,adreno-gmu-623.0", "qcom,adreno-gmu";
>>>>> +			reg = <0x0 0x03d6a000 0x0 0x34000>,
>>>>
>>>> size = 0x26000 so that it doesn't leak into GPU_CC
>>>
>>> We dump GPUCC regs into snapshot!
>>
>> Right, that's bad.. the dt heuristics are such that each region
>> is mapped by a single device that it belongs to, with some rare
>> exceptions..
> 
> It has been like this for most (all?) GMU / GPUCC generations.

Eeeeh fine, let's keep it here and fix it the next time (tm)

Konrad
