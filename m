Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A066BCE81B9
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 21:09:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCF710E6A3;
	Mon, 29 Dec 2025 20:09:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WKS8R7U0";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HCPVu4Gz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3113510E6A3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 20:09:34 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BTAHDus4078714
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 20:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 f9tLp6hB3CCjo6tl7cSfSd8cgyhOHRdEAok0lYgrgqk=; b=WKS8R7U0ELykYWeg
 Rk4296f0hNNWP+N8zzag4y6s1ujDPXjrEDOv0QQV08agymcEPJ5xJqpFvkT4JZyx
 CAS9/LVqE7mLe3aV4ta5mOaaYicWhRjJbb3NeObo2a1/jjv3ObcZN1qsWVD/WV7h
 t9+T+nJhoW6QsfaIXqO2cWeQH/N61XHVGYVNCruZRoNDLh6bjc8HBs6BLW8e5bKH
 MRNEyeRzEocpHfH6jvQkCr1PtaVxspAumvsimH034KNgljQGiq9uwSPKDDEOw6yK
 YunUCiY9gmSnAlA2+zRSaKGARZC1usbGioje+NRHKvrkZu2wj5noFmFgis0G67fF
 GGUMuA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba87bwa4e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 20:09:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4f1aba09639so28006331cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 12:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767038973; x=1767643773;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f9tLp6hB3CCjo6tl7cSfSd8cgyhOHRdEAok0lYgrgqk=;
 b=HCPVu4Gzrqin1+1X6qanSwu56jCNHNxx+l5d5V+SDzpD7sLnfAk4LfRpV0uZP4FIJ+
 lxUqohmXWx6M5HBA9beJQofwVem2Gm0IVbv6zMxdmsszZ/9OQD3oLop0rGuLNmUrMT4E
 PmRDzkXZSWYkQRV3sLvF7OZJ8c6fr8iHZ7F6Q2UMIzV7oW+ufAfE55lqi4DVxL8lmR5V
 dHO8i+WoNzzlVMAwF7e0OqqJlJZgAWUXfaDPk1uxjs1WlJ0zvXU6UC36XC01juTB/YzE
 RUyy476EMC/a/SX6//nHvPLDV0AzonmMHp8wHqjH97Aaoff7JDsAJbV4z5TdYjuS/T/Z
 JSrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767038973; x=1767643773;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f9tLp6hB3CCjo6tl7cSfSd8cgyhOHRdEAok0lYgrgqk=;
 b=Cm8CrY0bB3CYcY/qCCNf30usVFdifZcjnlSarbXye4ZX3fdF0lxgVOFbKqe9kuPhHh
 4Shs0S9rnTBVFJvuXt8OpO2OCB+V5AUp2Y2u041OYsqWwevvxgpU5FtMjEdQJlmELHbW
 Ok03SFrO6FJcJ+ps9dVKVk7wBImXvlcJxE/1iMzwIvvAH+bp9vY2dMLFEkOAVLMPUJL5
 Ai7eGw86weiJyULmlQneuda2jamGubNIPP0GOEQTfhAe7LCag09ezyfP8x4yNw2+ENAx
 hTGfk6BsuQg8PLeJQhjzP/W0/ng63WuRLC24hzFPjbcHaFGMNLDLwRzzb1aOtWp7cLns
 Kb0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAtYFb16pHCkGXiRV97ZgbEQBWCQxAVN3LK2Y4DMCfgik0D1Ek/lg+UauekF61CqSWdDckGCqMM3Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMpNcgqxprk4PYEBIN5ocer5r58jA0KwM8VGz+0VMQIfqXCT3W
 gL3kQBfPlOw/YJD1BdMC+3LbXZvFLnzu3HeIE7wDGIA7JniEaZVnMObm+BA07DPDqDRKR4wvzth
 IXcdFHishbIkPQybsR/qUAJ34bwlWZjnB3TRCtBH6ZiiPgJepPZPu4fRtLQF6BtchdYYcyog=
X-Gm-Gg: AY/fxX4nDVD3aHnoK1EsuJPfmkLw8kKv6fkO3P2SfgHHfOKIvVuyGVCAwCOTOItUg3i
 ORA0agPCJt/DE1HCHneG0GqkhREt3wyDxwvkkYyYdWuPqQY5XsTRXfbozn6LGx3jlVJHkLi/DJ8
 rpmHkq7ij0S7/eQ3yInYAkvgQK0ywsuoxwk/K3oS/69TuPXSfEpzTozDBzM9BgO369LxCUjpDLo
 6S8bn0/milxISVLh3tD5WOw4EZKE4I7vb9jyODnCJzoM5nu5UXNEPIUNmKKW+dGIQP1QYsxD0g/
 YSIWCpCwYVs1T6y+YyFYOo473t8E+BHoFM9WSWB4ytmJ1Nq/Es+HqKoQs7HYy9/tB55xSASYvei
 ODrv3Suo2I521zIzgoyXnumNropIbsgwrl/+ayv+bLgK3VBFK+jhim8z+2PbZ8696PQ==
X-Received: by 2002:a05:622a:1819:b0:4ee:87e:dedf with SMTP id
 d75a77b69052e-4f4abdc433cmr358682271cf.8.1767038972453; 
 Mon, 29 Dec 2025 12:09:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGm0o4PJ1efZdK7cCCaywgTcLp9LChUwOU7faNlTclPAySRBXp99GhA9cWhyaw0KrIm5+FEdA==
X-Received: by 2002:a05:622a:1819:b0:4ee:87e:dedf with SMTP id
 d75a77b69052e-4f4abdc433cmr358681971cf.8.1767038972051; 
 Mon, 29 Dec 2025 12:09:32 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f0cb27sm3352659966b.51.2025.12.29.12.09.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Dec 2025 12:09:31 -0800 (PST)
Message-ID: <8a64f70b-8034-45e7-86a3-0015cf357132@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 21:09:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display/msm/gpu: Narrow reg and
 reg-names for Adreno 610.0 and alike
To: Krzysztof Kozlowski <krzk@kernel.org>, rob.clark@oss.qualcomm.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251227110504.36732-3-krzysztof.kozlowski@oss.qualcomm.com>
 <CACSVV03H_oii=fuhaeBhUZSJk-2mr08jGqAs30Z_h9tzeDgdtw@mail.gmail.com>
 <2a35d31a-1a3e-4cd4-ac3a-27104ff12801@kernel.org>
 <CACSVV03FfvZVzuKGfaJrsXmE7VVxEF5zN4-R7h1PXA11jOO3gw@mail.gmail.com>
 <8288af85-13da-46e3-8d89-71995fbd17f8@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8288af85-13da-46e3-8d89-71995fbd17f8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jNQpsUww7GI6afqh1HL4zzwaiMxu8EVF
X-Proofpoint-GUID: jNQpsUww7GI6afqh1HL4zzwaiMxu8EVF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDE4NCBTYWx0ZWRfXx30WHDmfsm0o
 WZNmpY1qwZS2kmD4zr6wcPpw2/f+4sTvIOdJLG+d5UyXBNVnd8nMYWF0kaJjirWueK/6HxzH6Hp
 1cunQhLALmVFtaqfJ/cLJj0YymBbJTR8MxqVxQkr5yXuCI7N+UvKXS+6x+n/52RLqU5tVQTpxnV
 EHc77pgXDWWJSlDxtrOpCDy9vL28giwJJgrfP5XIyoav3JN6dF4bucUR4UQEQLCNRlbyyP8q6AP
 ho7FfHM2scLXMsHiFb122l4MvrKa+4fV3spfQqkTN5ppw2bJeoIGQuTl6cKb9Damz0lNMjuAd37
 8Udb2hP8IVybhEfJU4Pi0DLafNU/Xb48AlsPXP2RSjxc6qlwgSrUCYV8RtJtYJBkKihafNa9XG8
 EfpeUi3etjzlNvi12S2dFyz26l57nz18uox+EaMe0UZpGreyv2G7GjK8KM0nIulNkhQ7YQrf6nD
 4x+uPjhYD0Q4xU6R4Gw==
X-Authority-Analysis: v=2.4 cv=do7Wylg4 c=1 sm=1 tr=0 ts=6952dffd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=wQVahuwBDa5KTzDLV_QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_06,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290184
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

On 12/29/25 8:23 AM, Krzysztof Kozlowski wrote:
> On 28/12/2025 15:59, Rob Clark wrote:
>> On Sat, Dec 27, 2025 at 11:56 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>
>>> On 27/12/2025 23:01, Rob Clark wrote:
>>>> On Sat, Dec 27, 2025 at 3:05 AM Krzysztof Kozlowski
>>>> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>>>>
>>>>> DTS files for qcom,adreno-610.0 and qcom,adreno-07000200 contain only one
>>>>> "reg" entry, not two, and the binding defines the second entry in
>>>>> "reg-names" differently than top-level part, so just simplify it and
>>>>> narrow to only one entry.
>>>>
>>>> I'll defer to Akhil about whether this is actually needed (vs just
>>>> incomplete gpu devcoredump support for certain GPUs).  In general
>>>> cx_dbgc is needed to capture state for gpu devcoredump state
>>>> snapshots, but not directly used in normal operations.  It seems
>>>> similar to the situation with mapping gpucc as part of gmu, ie. not
>>>> something the CPU normally deals with directly, but necessary to
>>>> capture crash state.
>>>
>>> I don't get why binding was added with cx_dbgc, but DTS not. Neither
>>> binding nor DTS depends on actual usage, so I assume someone
>>> intentionally did not want DTS to contain cx_dbgc and binding should
>>> follow. Otherwise we should make the DTS complete and make the binding
>>> strict (leading to warnings if DTS is not updated).
>>
>> I'm not sure about the history.. but I can say that cx_dbgc is only
>> used for gpu state snapshot / devcoredump.  So it would be easy to not
>> notice if it were missing.
>>
>> We have a similar slightly ugly thing where gpucc is included in the
>> gmu map.. only for devcoredump.  Maybe we need a different way to
>> handle these things that are only mapped for state capture?
> 
> No. Either hardware has it or not. If hardware has it, then both DTS and
> binding should have it. If people decided that DTS should not have it
> (for whatever reason), then apparently that's the desired hardware
> description and let's remove it from the binding to match the ABI.

I don't recall why it was never added. It's

<0x0 0x05961000 0x0 0x800>

for both 6115 and 2290 though. I'll send a patch to fix that up.
It seems like (at a glance) that there shouldn't be much of an issue
with the crashdumper, but I'm not super sure either..

Konrad
