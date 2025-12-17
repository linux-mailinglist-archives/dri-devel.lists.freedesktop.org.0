Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E713CC79EC
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 13:31:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45A110ECB3;
	Wed, 17 Dec 2025 12:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="H1A/aMKO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ArXsGFPk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF7010E2EE
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 12:31:28 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BHCKrtb3203916
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 12:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nxVppHwCu+8rzGZFO+lxpcmtmdfr8y4QCMH3zpU7R4s=; b=H1A/aMKOhk/+gM5V
 mdApKa3vGivdomtYsqENHApdIbqjY7Tuy/zC6Vl9TqwQNDkpmrdRW/HgVnaMNqRJ
 5vB5KXP2X3D/HtzMTavuPd9BWDda9qAfH4VbJzv3zqKomr0XwOqReMQK43TSJvdp
 gMtHjyv/LmFlN8ua1ASvfTXDgsACSV04uCauTgSV+nPLkXPnBmABMkVh97mzCaL+
 bCHi65VwY2PYWBzUsa0oGwR5KYP5SFW9fREAZqEkddqspy9f7hu+9npIV+stBNed
 AuiQUadRg1SfGv+6E1jlFobUacL4uUOkOBumYa7GkuYR91e6L1AtkK4SUywddCzO
 f7HgFg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3j39j09r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 12:31:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b5ff26d6a9so82124485a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 04:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765974687; x=1766579487;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nxVppHwCu+8rzGZFO+lxpcmtmdfr8y4QCMH3zpU7R4s=;
 b=ArXsGFPkOysAIC0JZoDedG+xCSjfD61FUqg9EX2BkRcbSag+7PHiTjkX0uHO0OVMxV
 2+QWZn1oI4S+LwvcIs2xdyOFs1EfZWOmozjOXwgm87XwzsQjfd6GdxEqdbRTwsWmJIqp
 LPAF8HxKefcGRtn2N36IFCf8HTdA8gQDUlYda8otpycPi5z+Fn0DfJVjf6WkxHuKiHno
 bj7P3dSrGpGqzmI9YzmAvIq/slDu35Kf0VK3dpBg/DF7jMqYj2SEwTqip4H/YuDGYgxP
 VxbFL9eYrvKhW7k/OJ1PizVssL8enSiyr/dON9h79dHKXCIYdtuZahY42HMddIc/V9d2
 zvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765974687; x=1766579487;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nxVppHwCu+8rzGZFO+lxpcmtmdfr8y4QCMH3zpU7R4s=;
 b=buy7591wJV/KgSB8sdGGSFNcAgwuwba3ryw51c27nmNKGI4rqqZ4ZfjtSPL9+AbOo3
 30mRwoSo8OLAZ7i1lNbzSaljhnuOwWjlZXr/az/esyhn11valkOxMK1x7OmMsFNwc05a
 goeWKOFiFBZWAF6obqLhegy3u05zsTchNDg01pBhUnfDnjkUg3nnMeNTGFq2zTn0kW4F
 EyDJxzFeR3Q1aUeeaxFcq74eMhIcxsba+LCO+FpZyhd0/8YWE7Vwi61GfvXcRWhiZLqo
 5ud0KX1WGfnlMpli5CuU0ESMRz1AUI0vx5WW6tbUwQTfxPLkdSoYPe5e5v2JWWF0qTxg
 WCuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1j/+aRoTs5xQ69UdQe9ep6ruo9pZGd9DF5ELWrEg8tl+y3wcDPLyecKbcbsWtuonAE99eQjxi4TI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXitU/ewglkwdmtDiysb5WDXRNeuE7VS9o4E6Jolej+aQhkO2J
 wCk7sGNmQrpxY+GF77+Iv6Z5RIKsGVDN2SQfW6SQPN3Ya6D+bz+JlfQpjygDqlr3pFBYtcVg0IB
 IoZhf8y84sz7U+NvHvAJzUEcG685kThVC/+EmLZo2HZtMduqEGoq9Dhb5WNhpRmgCkoy4Qcc=
X-Gm-Gg: AY/fxX6XKCFYFp6DhPgNP110K+npxQdjWdATgYXT8nY3FARJ6bHsDxfWdN+Hg4p+gGg
 WpfQNgBQSg+RrL9MkS1hGGepBpNMifZPWimKD6ZOO9rGmniD+e18YZVhKBh98zaZ/2Ng2QqMBdP
 iJ3uwM4s/e2zqnmmO9lYhOl0MMxmiB0U/GvuJJJkQ221QX+zMdBUT5XLhIwEPKZ95CdcfchWJZQ
 kgrfUrUJcB4TdXmM9V4PhEEzSWfb/GqLOF9kj+cvr3MoR49FQY3HCb2GFr7jEVC95rTzXG1whZo
 vJlDYUkOVjuKwnAXbeURiGcAH1yMFyCJKN7wVPdyUQQRZ9uKMJl87LGr8SBjqX0QkC/HHhrbdDy
 3Yw6uCHPO7Rz88A5Z/hiFtpqcqegupPYUBc1k70TkCUXaB95JAjLc4QlXOklW5t9sQA==
X-Received: by 2002:ac8:584a:0:b0:4d0:3985:e425 with SMTP id
 d75a77b69052e-4f1d05c4201mr187452771cf.7.1765974686659; 
 Wed, 17 Dec 2025 04:31:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnU9DbqrhK2XEvuuPlNpfpmPEgKFxchCz9pi8QCpDey3PqjG8IsmXy18lP1a+VjNcjkHkDyw==
X-Received: by 2002:ac8:584a:0:b0:4d0:3985:e425 with SMTP id
 d75a77b69052e-4f1d05c4201mr187452261cf.7.1765974686190; 
 Wed, 17 Dec 2025 04:31:26 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b80013c7ea0sm321246666b.65.2025.12.17.04.31.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Dec 2025 04:31:25 -0800 (PST)
Message-ID: <7e1b7b46-f4d6-4028-8518-80e954dbb7cf@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 13:31:22 +0100
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
 <6dc39f3e-0a2f-42ca-a088-4b62a8153001@oss.qualcomm.com>
 <ed4b1e3c-bb30-42fd-a171-12121db2dbec@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ed4b1e3c-bb30-42fd-a171-12121db2dbec@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA5NyBTYWx0ZWRfX3v48uaOSrPbI
 P5sCF0vtDS27vsVtt1AdcO21fNwHUJmcB9pIVAtf1n5bhOhH0mwy07garWyuP1zVk81vxLqwbPl
 N0SVVYlb4VF089QUOEliXZ7bTuo57tL5LxAlwQ3mR5gwLTU0Cyyz3GGOsSV8ayye/hbtoZCd2Ig
 Rq1hSVw47VJC4q3oTSD5oPl2696+t3r7uRQI4uFrXVGHJcQp/65gVkV4CTTE5+5l4syuvWZHX15
 mxFRxeUSf/IAr+6fjILlQgZXqWLhcRHqK8izv/Ic2DBpumll2Ttwjf0c+/806F3Fks2DRRtPK/d
 fneigsQcxp1+7J4CETZDWrhH4zJI8xh5Zmr4surPyvMXeeqdXnQuUAb3Jg0DdQ9AUMCBQWUL+Vy
 Pwogwhr9dlBdYKpOmVIWyGvnewGFfg==
X-Proofpoint-ORIG-GUID: SYvqijVMdC91GVLPRgyHaO286eBWb8Ao
X-Proofpoint-GUID: SYvqijVMdC91GVLPRgyHaO286eBWb8Ao
X-Authority-Analysis: v=2.4 cv=ToXrRTXh c=1 sm=1 tr=0 ts=6942a29f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=trE_h3K6eqWXygPE4hIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170097
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

On 12/5/25 3:05 PM, Akhil P Oommen wrote:
> On 12/5/2025 7:22 PM, Konrad Dybcio wrote:
>> On 12/5/25 2:41 PM, Akhil P Oommen wrote:
>>> On 12/4/2025 7:01 PM, Konrad Dybcio wrote:
>>>> On 12/4/25 11:13 AM, Akhil P Oommen wrote:
>>>>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
>>>>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
>>>>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>>>
>>>>>>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>>>>>>
>>>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>
>>>>>>> [...]
>>>>>>>
>>>>>>>> +			gpu_opp_table: opp-table {
>>>>>>>> +				compatible = "operating-points-v2";
>>>>>>>> +
>>>>>>>> +				opp-845000000 {
>>>>>>>> +					opp-hz = /bits/ 64 <845000000>;
>>>>>>>> +					required-opps = <&rpmhpd_opp_turbo>;
>>>>>>>> +					opp-peak-kBps = <7050000>;
>>>>>>>> +				};
>>>>>>>
>>>>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
>>>>>>> or mobile parts specifically?
>>>>>>
>>>>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
>>>>>> here.
>>>>>
>>>>> The IoT/Auto variants have a different frequency plan compared to the
>>>>> mobile variant. I reviewed the downstream code and this aligns with that
>>>>> except the 290Mhz corner. We can remove that one.
>>>>>
>>>>> Here we are describing the IoT variant of Talos. So we can ignore the
>>>>> speedbins from the mobile variant until that is supported.
>>>>
>>>> Writing this reply took probably only slightly less time than fixing
>>>> the issue.. I really see no point in kicking the can down the road
>>>
>>> We don't know the speedbin fuse register and the values applicable for
>>> this IoT chipset. Currently, there is only a single variant and no SKUs
>>> for this chipset. We can add them when those decisions are taken by the
>>> relevant folks from Product team.
>>
>> If there's only a single variant right now, could you simply read back
>> the value and report it where necessary to make sure the internal teams
>> are aware?
>>
>> There's surely *some* value fused into the cell..
> 
> We don't know which register to read at the moment. It could be the hard
> fuse register or some soft fuse register at an arbitrary location.
> 
> It is better to leave it as it is for now. Who knows, maybe there won't
> any SKUs at all.

Please don't take it the wrong way, but who else would know that? :/

Konrad
