Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B833CA7D61
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 14:52:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F3D10E1DB;
	Fri,  5 Dec 2025 13:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjSsiyO6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N3BniOG0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A7810E1DB
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 13:52:17 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B586p4K2516877
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Dec 2025 13:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 o7V7r+I6IooNEU4koE9324VpoXcXhiIl5w5a8ShVyPM=; b=UjSsiyO6Kd/v6/N+
 tax2toYtJ/RVLXX//FUGyXlk95LGs8eh58dMyl5HiesmF7LntLBFOKUWrIX9DUQT
 OlIpC/FHsTk5jGCHbhnLkcn83qTduyPZ9u9lMcmQKu3wyF8KVmb8ShLbgKNu0Ktk
 HAV/wiD+SVsdGLPfKNnxLhbQgtacDS1foXORBW1vx+bfc+qEdgk25/o722iJ0O6F
 vBObym1B128TFOhdr8ZYJl2IEuK2SV69QuiJWtDcOBhdVpJwpdF0KvSSmJ686x0A
 N4vn+eG2KaznsuxGo7WLjPRwrz1XqPMyahnI4Soj7l6uv8Bu8Wi+SlmuAz6DD2qr
 z5y7Ag==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auj7n2bdd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 13:52:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b29f90f9fdso50132385a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 05:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764942736; x=1765547536;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o7V7r+I6IooNEU4koE9324VpoXcXhiIl5w5a8ShVyPM=;
 b=N3BniOG0AiyvNpQKJPHah+4dDcyf0KMTRBh+8wR0AgXwSP6FWBA0C6l2GX2ZKRQY0/
 E9kpEcFxgMZmL0PAl+yuNBPw0oPPdkPFjlvVgqEQQXvrcHEvCcdNnfGyJL7/WEPPI8Ti
 SCsEcD/YdRn1BTlPDMaEUyOwhQ2rdqx6En7C10kGJSvMZ6HaUlYvA4zOkLbe3rAPcmSQ
 4CkD6segrZgePWdP/PbYICXwp4EAaXxEce1qXKjxHlNcWjwee1VeajNlHm/fXI08iZMy
 9m/qpxhsfanRfrjf0XTar23hYN5bu6V7UbN0HIe20AnTxMEl74+4+u0YfyqpZM04D1EI
 2SpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764942736; x=1765547536;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o7V7r+I6IooNEU4koE9324VpoXcXhiIl5w5a8ShVyPM=;
 b=MkqrI3c3pGWTMU+LBInS7YY6UQtbqoIpuWyhQgg2uoWFflEF6H3WtImw+w2hSgMeoM
 8pSenfpMbM/URr9VoPjudm02c827nIsqaC+2uFJ5uP2z7/ziVpBpmnQtjCeLTRXgEeGb
 dtvJFRgiDfKkzFpcSV/fqBQ7bJY3MzQ1h0GSxOnGYD9PT9rnXxGIZyXKz8OjhbpxQljU
 QTqScw5q4L0sbE+uYJEVI1DjsqbN65Px6WiLGwFfVziTvhgDA1uWLBcFuwwOD1sYgMPQ
 zgprs8/XuLi0PsxYCB/1Piapl9RU9XjcK4rBm6SbwOq6AnVKtaDYzIeHzW7D3jeyaoFj
 EMEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3yCuGb69t+vXCvf5f8ont+pWpPZPPohI9GBhuFf0nagRJhT/BKmyUvT1SulUGE6ZUObtQu5kvMuY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPs1h6ou+PSu41FFvLkOViZn+1vNapaltTjA6YNG9AUpGCQ+Mo
 eD6Gwu7tVACjo+U1ZnrML9wA9LuNZB0Dik6r/XpVIkcTYsZ0Xuw0pllzRa0OXe+7qM8MH8YPQ08
 5l858SdAaLSxlowTYMqNvI7VyLCT3RkC6K054NCDVUol32HpPgRLLyN1PR1tVnRtm3I9tFGs=
X-Gm-Gg: ASbGncuXOGV5BzG2zRjem2q4rVkRDOCcoAbGmFooNEue4Jzal19OdJ2YNE0HEm4wHAw
 oGABgL/uuQrOqETkwz/TMbj237bVCvUINmUrGkLuw/30k7gdKhfE+234sDIHRquETGcGCGg5Wpq
 2wimkesi4VWNjQ0FRhSNzKKWKRPSA4QXi+Ea8szPJq5nUMSOTvDvGHvTAriYStlwV+EhN3iDDbi
 DjvUW++NdSAzTKXF7OW02Q3NiOHGO88C++0CIPxi5W8ZvrkDOxefAU1TOTYV0NvzD+TxVXizw2U
 G+E21dZZgdEEYzWm+9Swc0hpyAzy9kdQjwmA17TpGErpPNf93AWaMLWUac2qV2YKytuNPdaDCVO
 sJF+VPtJM7Ont06NdLgrFX16usVA/gDJau+rtLplh98AZlkcqef4hhGbcM9yk4UeRyw==
X-Received: by 2002:a05:620a:269b:b0:8b2:efb6:5ce8 with SMTP id
 af79cd13be357-8b5f95142ebmr865955185a.11.1764942736055; 
 Fri, 05 Dec 2025 05:52:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQBcoM2c3cxIuFJvmEhsFRUeWlsckBDksGI+JesDNVEXzT3aBuxsfssWhwgRDIEZEb5suwDg==
X-Received: by 2002:a05:620a:269b:b0:8b2:efb6:5ce8 with SMTP id
 af79cd13be357-8b5f95142ebmr865950385a.11.1764942735544; 
 Fri, 05 Dec 2025 05:52:15 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b413b590sm3699006a12.35.2025.12.05.05.52.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Dec 2025 05:52:08 -0800 (PST)
Message-ID: <6dc39f3e-0a2f-42ca-a088-4b62a8153001@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 14:52:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
 <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
 <z4gqro2bx6oq2ht75m2klogo5dsirb74tmc3u3shjyalxmaxil@5sy7ufmqhdgw>
 <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
 <9141e67d-2837-4e73-bd3a-9a9c5b8f72f9@oss.qualcomm.com>
 <d087dfbc-fcd9-4f01-8cc4-b206c2e87f28@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d087dfbc-fcd9-4f01-8cc4-b206c2e87f28@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DOSCIiNb c=1 sm=1 tr=0 ts=6932e390 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=prxyFuKMA2RouLmu0eAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: pIrlzwiY_tmd8E1PhAB0U9UhHrG3zjSC
X-Proofpoint-GUID: pIrlzwiY_tmd8E1PhAB0U9UhHrG3zjSC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA5OSBTYWx0ZWRfX9Ep+M6TXjwmA
 PbDm8ZRiQ4dcoLhAY+J9TGLS/F2kGVN39OyB28MmreXAt3UVHnvJDsfSvaSCrc6Lp1CiyF/g4nC
 nDPoXhHi9McgkEP/TqjgjqRvLo7wCOePA8SW1LcPCla6DCl9HbsZJgmV5JGTGtK016YtnsBBQkb
 BCpba01rFXSVWosYhMyZ5vTPESGWK3K9apSoz6Ts5Fue0hrFHYZ36dt9V4OXExz5bI4TQRy5Fvz
 bzqDianUvz/p7wMI8rzSmJJFjCQouFZL+wBy+7WGKFbaJvsglI75QAvlyiSY0W2f0WJY2ABtdqn
 SeyEbpHofZrzms5X5oNpcbhod6BEOghc1BrFCExCIcGXzhDhECeMoMa9rApnBYEKFkd5DUYtzvf
 lzBiawymRpNHAYV6NtO6THiNxeD71A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050099
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

On 12/5/25 2:41 PM, Akhil P Oommen wrote:
> On 12/4/2025 7:01 PM, Konrad Dybcio wrote:
>> On 12/4/25 11:13 AM, Akhil P Oommen wrote:
>>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
>>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
>>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>
>>>>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>>>>
>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>> +			gpu_opp_table: opp-table {
>>>>>> +				compatible = "operating-points-v2";
>>>>>> +
>>>>>> +				opp-845000000 {
>>>>>> +					opp-hz = /bits/ 64 <845000000>;
>>>>>> +					required-opps = <&rpmhpd_opp_turbo>;
>>>>>> +					opp-peak-kBps = <7050000>;
>>>>>> +				};
>>>>>
>>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
>>>>> or mobile parts specifically?
>>>>
>>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
>>>> here.
>>>
>>> The IoT/Auto variants have a different frequency plan compared to the
>>> mobile variant. I reviewed the downstream code and this aligns with that
>>> except the 290Mhz corner. We can remove that one.
>>>
>>> Here we are describing the IoT variant of Talos. So we can ignore the
>>> speedbins from the mobile variant until that is supported.
>>
>> Writing this reply took probably only slightly less time than fixing
>> the issue.. I really see no point in kicking the can down the road
> 
> We don't know the speedbin fuse register and the values applicable for
> this IoT chipset. Currently, there is only a single variant and no SKUs
> for this chipset. We can add them when those decisions are taken by the
> relevant folks from Product team.

If there's only a single variant right now, could you simply read back
the value and report it where necessary to make sure the internal teams
are aware?

There's surely *some* value fused into the cell..

Konrad
