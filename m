Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1187EC0DF99
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 14:20:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2426710E489;
	Mon, 27 Oct 2025 13:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AsJIKiYD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3245510E489
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:20:35 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59R8VuAS1049326
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kSYlZ3f9vesYlsVsHAw5CyHtqlY6CNOY4YSlAreQ86A=; b=AsJIKiYDX7kcD3co
 6PZLgnIqmYG/LL/pHgMcBHT11BIh91Z7LYbNNQVvHu1xWRSw9gAunsQTONhVfDwI
 ITR3u+nNFYJQFCLvkVCrb6paN8FYonx2DUFv1g1Czkct8v0KAiO8XONyMF7fnsbz
 bgM59tHq1ZtXmxOjyBs3HZtPCLMOQVtASfBQpiLu0/cXQvd82j97EleYA1WIkqOh
 YEH2ZAgVbLmTReh+l2cfNS6e+V98JwfuPaYXrMPluj3X+l7XbY+3jfWLI5qq8LEY
 fS7a8JfwR/0Ap/7UuEI/O97HALdCarFl/ym+Vd8dUHAzbHbrI64IzCIQNIxGGg2Y
 /aFgKg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0ps14mjk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:20:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-87c28cecb4cso19271046d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 06:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761571234; x=1762176034;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kSYlZ3f9vesYlsVsHAw5CyHtqlY6CNOY4YSlAreQ86A=;
 b=U7FkwYnd1BlVHMbGOPXRhNb5fJicBJCPO7AsQws3R8X0XzzxmU47kmPx7PZXUyoGs2
 u5k1IiE8aD8MekcHwoAQzDbEeVfdnHxjOopR/vni2jXrWhtEGvY430tVaoHXlJqno59H
 cH+RHWL+0KE127NEbnCP0QPrBfJCV729FM/ASx3WVfXOhrfv+imVZJl74AN7X/CaXBPR
 BTaI4nKxefi949FYFu96K7COvQVYPP4n5YtMTva8E6TnCb+3oGrFLW+wat1H+f2eV33d
 vkGUKxubiEILpZ18IibdWUmMWiUlxxieihL1zymcY2bnYhT9ouRn9VPOmiSxqBfqYDbm
 briQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCURYh+w6ist0xOO0hsxYKMlo+ATnrej8nFQngdeJlEeUqYBNS47StqKQMORAMxrL2trvLhjiKqwov8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVCrziT73wJVQOoX5tfIc2slkUAZrJnwSHzci5l14b88ZbfnJ3
 UHWVSEh5ShoG0YpytOkSje/D7/qVtCRsUMpjtbeG14mCKGzcJp2ZLsW1EHdILSSnUpJJhuQptUS
 GsGSFnpvPO2rtDskRRyePLOULHsR2bu/6qMglQCQ+M/HiFzmScZSQu1pEe+6ellgsDasavgU=
X-Gm-Gg: ASbGncsTMi6omQ8tAbdSEumIXmJOnaaI5M2jgsthia867QVMTU2/8iL5Z9grhdtJOHH
 KG7I+WL9pv1ZGcw52bB8Hi2NN60uZomNTE7SkFAWySzCL2C+VQI3fLv0hRmGn9dSxun+++4eob2
 Ryj381ncrmB+W/JXwCaDcE4knB47vDMyHYQHLgeuoEqaLftP1LOXrI5R8KTlYgSr3yENnqUJLtX
 G0UsnHLIsR5jNpMFHqBQxf1v57VRWtbuk+bEsxrkXMKuLXKA3Y2pP4owvAGeI7GghuHFgav+fJs
 shFnm8tsI2mDLVhBrCrEMeXrfqji7Ps2MI3wqdTK1qohkhfCirw+yTN8n/BQZJw43/TR9O1n3jO
 JXmzg1uQOOEnqdHnzX0PB579JaNKeghKWCDzmbYAZktqRzLn3tW4T6+Mt
X-Received: by 2002:a05:622a:5c8:b0:4b7:9ae7:4cdd with SMTP id
 d75a77b69052e-4ea1177c842mr202134921cf.8.1761571232035; 
 Mon, 27 Oct 2025 06:20:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdz/wQ0BK9pQjwusme3Hz0+MCw4EcI0EDUElKxUQ9hHLgGZIHDtysKRoKXFj8XSgwXP6Dm/A==
X-Received: by 2002:a05:622a:5c8:b0:4b7:9ae7:4cdd with SMTP id
 d75a77b69052e-4ea1177c842mr202133331cf.8.1761571229943; 
 Mon, 27 Oct 2025 06:20:29 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e7ef95d5bsm6279668a12.16.2025.10.27.06.20.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 06:20:29 -0700 (PDT)
Message-ID: <0291d0f2-483f-48d8-8c75-f1bbcd1ab18f@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 14:20:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] drm/msm/dsi/phy: Add support for Kaanapali
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
 <omlhiywjr46ik6bj2aiutgcf4aifen4vsvtlut7b44ayu4g4vl@zn4u3zkf6cqx>
 <ad906eb5-c08f-4b66-9e37-aaba99889ad4@oss.qualcomm.com>
 <aPryORKIuSwtXpon@yuanjiey.ap.qualcomm.com>
 <einog245dsbqtx3by2cojyzmyctk2fffpwndwoe24puwqq4fta@cu6iiidxqgr4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <einog245dsbqtx3by2cojyzmyctk2fffpwndwoe24puwqq4fta@cu6iiidxqgr4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ju78bc4C c=1 sm=1 tr=0 ts=68ff71a2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NCk8XzW7qX7BC1ZPH1kA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: h1aGGRK0VtbtDQSG9y6WBJbSGBtFaQJb
X-Proofpoint-GUID: h1aGGRK0VtbtDQSG9y6WBJbSGBtFaQJb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEyNCBTYWx0ZWRfX+JNFCKliatl1
 HZHqGh+EP98xzqsnN6iaS2kgLK8gSlAevuChyFOvSO5mx2zL9xloQzfjKZ7vfwjfCz3r6MFgjiw
 gWsyW2TaNOhkltr7gnZ40asOpebX1crS4joZ/qiGedfXMF0J88NVXjAqVUtLkvdTbdBdfg+Ta6/
 OR9hvOM9uwYVI7E7u4F5qcJ3Uv5eH44ml221Kb5Ex3ejktzD8rUc2SxxXZLUArcJ9+tnAJQFGnX
 WaAoDXhVtrJKLNx6fJryh2oh/m2SyioKtnc4H5oo2aLOMsmf/V4g2qsU6vZaMAVrYA3OVTsFeW7
 ztvWJMYndf+3ySkN9lu/EWF0um4wsYzGgxXN3TydXOL+Txze6mRoe+X6Qo87YRBL1qMGPHcRQvm
 slnU7yzfjM+22nki3xgR0YFRNDHJGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270124
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

On 10/27/25 2:14 PM, Dmitry Baryshkov wrote:
> On Fri, Oct 24, 2025 at 11:27:53AM +0800, yuanjiey wrote:
>> On Thu, Oct 23, 2025 at 02:02:45PM +0200, Konrad Dybcio wrote:
>>> On 10/23/25 1:48 PM, Dmitry Baryshkov wrote:
>>>> On Thu, Oct 23, 2025 at 03:53:50PM +0800, yuanjie yang wrote:
>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>>>>
>>>>> Add DSI PHY support for the Kaanapali platform.
>>>>>
>>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>>>> ---
>>>
>>> [...]
>>>
>>>>> +	.io_start = { 0x9ac1000, 0xae97000 },
>>>>
>>>> These two addresses are very strange. Would you care to explain? Other
>>>> than that there is no difference from SM8750 entry.
>>>
>>> They're correct.
>>> Although they correspond to DSI_0 and DSI_2..
>>>
>>> Yuanjie, none of the DSI patches mention that v2.10.0 is packed with
>>> new features. Please provide some more context and how that impacts
>>> the hw description.
>>
>> Thanks for your reminder.
>>
>> Correct here:
>> io_start = { 0x9ac1000, 0x9ac4000 }  DSI_Phy0 DSI_phy1
>>
>> And v2.10.0 no clearly meaningful changes compared to v2.9.0.
>> just some register address change.
> 
> Addition of DSI2 is a meaningful change, which needs to be handled both
> in the core and in the DSI / DSI PHY drivers.

DSI2 was introduced in 8750 already, but it was done without any
fanfare..

I see a diagram that shows an XBAR with inputs from DSI0 and DSI2,
and an output to DSI0_PHY (same thing on kaanapali - meaning this
patch is potentially wrong and should ref DSI1_PHY instead?)

Konrad
