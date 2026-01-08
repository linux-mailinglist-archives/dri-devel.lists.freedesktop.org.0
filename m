Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A97D01CD6
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 10:22:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C6410E6C2;
	Thu,  8 Jan 2026 09:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="plQhJESP";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gBPXNsGg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF4410E6C2
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 09:22:14 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6084F7ox2593341
 for <dri-devel@lists.freedesktop.org>; Thu, 8 Jan 2026 09:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NykHxiLesQcmL2nusIInhtRLoMtoWy5GzdgE9w8Y6EM=; b=plQhJESPDxEeM+e6
 WXA3kc/FSUTvnZS1khnkQ/Vjx0lvvLW6JQ0AE4QeMbPjlI/iVXQ98yXUt3SLs8F/
 0VGcfTyI2POoi/JlLLyev8vCDbJlIy9LP6BBYnGD6SpbVlrRB4e/NicTKFXxKnBJ
 nBDzQ9QVlHg2CBAHq7ubQ2swcWWqDXD3UeZ/zyhpb649EQV45S24Qv4KGgFhM3nQ
 f7OFya0bzEfnloulgLTlSqfxe6qBs7xiFDREP9FU2hj3fip1f60e53LDINSpBOsf
 G0RdJ7zWPVd/tpneNzO8uO5uACEd050IBCJVc5KuQy6HXi9R1rMB+RzadENkNLd6
 Vnqs1Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn29446r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 09:22:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ee23b6b6fdso8184291cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 01:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767864133; x=1768468933;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NykHxiLesQcmL2nusIInhtRLoMtoWy5GzdgE9w8Y6EM=;
 b=gBPXNsGgJEq4iWrRvF5MjowGZQMCODiVrmA6Pwcicdr6WW3j0+iPm9RTwKU/Mea1x+
 wVEZ5km9mqBhjqw2P29bEpGkj3KkHXL2+plXIeJUKEHcGCaYOWMOw7oTt/AlQ4w0hify
 T6tGHrfx4nm7ijDKf4AHTk/QDhvJ6avMGj8030IAonAlzo6o7sbd6xBTfAxB9KMRWTy7
 dG9MkT07WRO9J/5ML6mdJq48bX9FOeVIWmNaClZr4Ed/UEBr25mUAL4N44w1JPtLkI8q
 mHSsso/XOj/VGTD0rK6vk1ivs9C/SVyV8EilbL+p0POPUNqF92pCLEpgt5lZixSV7ukK
 w50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767864133; x=1768468933;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NykHxiLesQcmL2nusIInhtRLoMtoWy5GzdgE9w8Y6EM=;
 b=YgYW46kYepjTc5qaWP9xMpygrQyC2/ldAGE1PKfF0YARz7HENwdOxDNpg4ap0FMNzc
 7vtZVfLRDMFAf0FwnlVOVCeOcIt7iAMF+RxxKARTgJQEmcJA/R0EV+qyH5QjnyPjaoLF
 WSkwWfpl2CB1fZaQO2oePIPmIK4QXsjG6RHonECVGpj0W6IBvq4pgng9XjG/OmVtW+7t
 crjHNenGZPMpbRvz31KZtndvVHF7g/M/ZSvEV655CGMIYuoswW4Ts1vl5232SIsVFAKF
 AdWk8IVEB2mv3dPHMXBaFv85v0YmPXeCqkFloeky8ukvqlhBcVWDfqwizhV183tJHP8j
 v4Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNy/7538BK4Bk6Etf2DTNVTRzAZ88EyDEsz8/mIfCpo+Lzg4gfU2E7mz959moVV9VLoW9tL90OOjE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+0MXndiFpXZX7CnvxS6qwH0fe3lqxXz86e4zpONU1rj4DtD1C
 Q8EW6ZKbry8MJKVEoBgT33l9/5t8ZqWWUq+gzTyWWpDEisMWKU7vNste3ttK2bsxCxI4R8mALaC
 xqdW84M1d6etJeIBtewdcAG7Rqw8OXH+TAwpc/TSPO1C1z+B/zP8x0MKZTstE2hJ/QT2qrzA=
X-Gm-Gg: AY/fxX4Xot+FbHhWAtGcexykUGpomm3uT106NWZbOt3fsECD0r0D+SixaMH+WTjuW6m
 LZIYyxBKsAoiAWEAt6X2hRLAeaIJpQGZmJEKtYbAG4xMJ92tMLQ46GeAHyYsO92BGMRUc+4tkbp
 OKWxtQbSQr8w8Xulf/aJ+7t/r+QveV+YaT5m+/CYKSYpbV1oiMBShCwj5dUl3/00yhjZ/6ufs87
 nkEVricZzIK1H9na282XFjaAAzr9c3HDzD0JRDKj3iZKP8+aCwYQkqPQHcMbEzOdnDq5nGHud7q
 w1us1VE9qqbtICOSrHUvnKbHPa2+ggLrKbBwa7pWBrswXujKlfzcPOwpCsykpE/5YDirVun/Vbe
 D1rxvhFI5VgQuHeahsUhgG9oXhKug3C7GWl8j2Cq6M/KtwCOnDW+gS5TB2Fzy5PsADl4=
X-Received: by 2002:a05:622a:211:b0:4ee:2638:ea2 with SMTP id
 d75a77b69052e-4ffb4a73847mr53808941cf.9.1767864132612; 
 Thu, 08 Jan 2026 01:22:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGY4wdNCuBrMFoo9DDpE5DqvPtrXyk71CRz9mJOSVhhSxeHi/+bMqRghkU10RrDVSHGxOxCIg==
X-Received: by 2002:a05:622a:211:b0:4ee:2638:ea2 with SMTP id
 d75a77b69052e-4ffb4a73847mr53808561cf.9.1767864132191; 
 Thu, 08 Jan 2026 01:22:12 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507be641e0sm6930953a12.22.2026.01.08.01.22.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 01:22:11 -0800 (PST)
Message-ID: <52778327-69bb-4f6c-8d64-094f33809480@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 10:22:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: backlight: qcom-wled: Document ovp
 values for PMI8994
To: barnabas.czeman@mainlining.org
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
 Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>,
 Eugene Lepshy <fekz115@gmail.com>, Gianluca Boiano <morf3089@gmail.com>,
 Alejandro Tafalla <atafalla@dnyon.com>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-1-8687f23147d7@mainlining.org>
 <45a2b510-c825-4191-975a-1389f4f18903@oss.qualcomm.com>
 <c7bca43b1b912a6a100d83229d78abde@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c7bca43b1b912a6a100d83229d78abde@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MGazbuZ2cTmu0ijSE_CTBCqFu4vQ9qhA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2MiBTYWx0ZWRfX2KNa/+QE9KSv
 dSd8CJu8KiMbD0eXuLQXfiY42DdCbp91ag1Zh+WSXG+5C97Utaq4zUpiWw6QcmefFuUzs/+6GZg
 Nucop1Feh3LQ6kVXKA3vYllRKcs78YhoV45PEXL3oaTY/8EAUfd+Ic7r7SMcK3LUHtMLlfAL6KU
 4uc+OhArlDS6Iq5Fozl3y/swnse7RKrG8QIuErStzodVLgL3ehNuHrT5ZkWcf2FXPZWTCqkcE+c
 89IMmnhS3MPLeZX+/P+2CC1bbOybpzWIb4ACbuwmYGonobC7jwEKoHl+XPL1cOrm/rBUTc6F1SF
 A72Wu60ty2dufxq1Q8v5yCaxNt8vXYcG5GYfE0bVgxx3DquX+GksK1yUEaRBAx33AoYtCzD+QTf
 RHOk4q1/8RYizr7yuns2UboBgq7jNNxyzodLlEHRterHuG3gCPauysHvjnb+WoI/4RHchzl/9/7
 /wiXskaYNOk12d9iurw==
X-Authority-Analysis: v=2.4 cv=P7k3RyAu c=1 sm=1 tr=0 ts=695f7745 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=mtDAOQl0mCcS2X4wXL4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: MGazbuZ2cTmu0ijSE_CTBCqFu4vQ9qhA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080062
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

On 1/8/26 10:17 AM, barnabas.czeman@mainlining.org wrote:
> On 2026-01-08 09:54, Konrad Dybcio wrote:
>> On 1/8/26 4:43 AM, Barnabás Czémán wrote:
>>> Document ovp values supported by wled found in PMI8994.
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> I reviewed a version of this that said PMI8950, which is very much
>> not the same..
>>
>> Let me try and get some more docs to confirm or deny what you're
>> saying..
> I have sent it for the previous revision msm-4.4 contains the documentation.
> https://lore.kernel.org/all/95f7c89fdf9b856f567a498cc56ecfa5@mainlining.org/T/#u

Right, but I didn't send any reply acknowledging that.

On v1, my review tag meant "I concur this is the case for PMI8950"

Because you carried it in v2, it appears as if I said "I concur this
is the case for PMI8994", which is not what I then said.

Konrad
