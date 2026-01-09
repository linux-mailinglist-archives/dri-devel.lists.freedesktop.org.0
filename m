Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 135BED08D19
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 12:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C2A10E89D;
	Fri,  9 Jan 2026 11:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dpuIFfHM";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h0nkRQ4F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CF310E8A0
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 11:09:17 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6095SCSM1701852
 for <dri-devel@lists.freedesktop.org>; Fri, 9 Jan 2026 11:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cfOxBAB/NL8Y1LHRkR5yqZTg4muif21ux/cBVZr9MtM=; b=dpuIFfHM0GgisAWD
 pwfwW0apkVLGLOvgZl06nguD8hLBDQxeyLBo0N2hVQD6PXncccyYLsro85pdCPOd
 /054B9hOaZwSrulWucN9qbdiUl3jIJTP2YcXJNUFxQqhjGVLWuCkFL8uunRfSVO0
 Mf/Ghz6AIbzhXpCcNkYdGrHJbDCwTudG9rowmnHds3Gzcw1kDzBidHerU4TZIIQT
 LDhOSEQH8ryNejcKLbUrtQoOzUiYSpoRXKo6F8sDFU/fFkW1JDKR5p5Tq1ZjEYaQ
 urj1UBmzs2+zIA+Gh098UxRob28VLnHmC/BHOuPdyyZcy/kPSjLrioSb/eGx2ZFa
 znrZcw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjfdab313-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 11:09:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ee05927208so12587421cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 03:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767956955; x=1768561755;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cfOxBAB/NL8Y1LHRkR5yqZTg4muif21ux/cBVZr9MtM=;
 b=h0nkRQ4FxoDZq0/WjGp0fWsi2Yk/03ftk0idjsALkGlM10haTIKTuQZM3mFDHLOPVq
 o+IKGwt036r/a2Zt8HhcDDxP/AZfyZ9kp4yYytNxeVkw7R6QpbUWIuw/Bp08K08jMOb3
 +oiOPXQPUqLdADFc7VMQwdeqqQ5k7nCCyybxQoC0+LAT3a8mL6B4Cuwp7Vuk6pQxqX+x
 UgrnwLPuBgYfnGNdhn4oQLNUSUf6dZXmqLjP8L7KRSjSlJymX8fcsiGsmzfFbx1n1TSb
 0VHT7RfhAsR3agospdtapPrK+oLVog027B2jgZoKVF96Ju56g5opwWGoGseQFmXrAcQS
 Q5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767956955; x=1768561755;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cfOxBAB/NL8Y1LHRkR5yqZTg4muif21ux/cBVZr9MtM=;
 b=M6QutDdjRLdihDh7OkCqDD/+6zGHSJN+zAos3Jmj6OH9poqFulIxibnZyTPewpB7T8
 AsXQ2iQUYhVhywFPbbAZGrbqKTP1sQly/WhoEokpLYoLPOwnpwf+HeznWMtgI+nGTlOa
 JPSBiPUkO8S1DJsZ/LSwIzdHOGvRJf47yd1CHv537b0NCqs/H+tx3zuHdVmPCdny17x4
 DwQIxpm9AXXPReQ6HFcNIRCV7N+JYKFeUDkxoAHOL0o/BEkcHhbFxAdsjf/lv3u/QJLK
 S081wyFpxa0gcPpZRpsvWBCmVx29Lvp8Ur4ic4F3h9MJVI/mjMpPfl5y//Gh9sOcAiuQ
 RcYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWi+I4iZ7L4uR3An6+LqC1yLyfCN4fqiOzFa2ji0+NPNKEfvsSLMxQM0g/kK9nLtbpeeVfczjp+OIg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBiZzfrdnOqQ4p1Q0XvEA1XpSJ9lwsNKJfpsB0Yqub/VSIhexg
 +m9I8J5JHoRy+RSkQ3sJQrT70piDLEWJM/MsC9JmVxPiVxg0QoQ1kNk5RRsDNTG2kt0eATLcuM2
 F0NR6X+D9r5XiTepVQRNV/wKJZz47Z5GRjwqX5mZP0WhcJlOWii5g+db58memAHYmb7wBNok=
X-Gm-Gg: AY/fxX78pCi7QOelNEeQbN+qzi4iSigNZQeGvSrKMIXONbFbkrV9GSpUOg9BI2AZxr3
 K7n4w9xigUn2mosYITx1bATYKE43SrRrIsKFlAiJ4tYW31W9mRMq3ctonnHpOcg5XuYtwHFl976
 gPgdYHfZ39ruoM0nuGHKpZZZSWWro0sGNYMlKugzZdorspCT0byXx0QLf0IFUSVq6gSUxbcW4jA
 nRjd3Z/g5eJxbgmNJf0APPUGX1ZGOUFkmh53bfhoxkd2FKWiFJjqTtPLnAleKsJATmjX6qY/DQ4
 2jj4cR9Q2Ewm7wUhzPMKqqiKrrHeRhe85LoD/eJ5xRoLIFVyYb410/HX2XIR/SOki0TLOBWjmUe
 ghue32MfoZ+FR89QrxvKjFlfXzV5MQfxmxBVnWjVw/fWIZCcVJp224PSs2mXmZ/IadbI=
X-Received: by 2002:ac8:5d4d:0:b0:4ed:b409:ca27 with SMTP id
 d75a77b69052e-4ffb4a3c298mr106639231cf.10.1767956955262; 
 Fri, 09 Jan 2026 03:09:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuVugm+h0bz8TunWq+Dll8IN1kIYmy69NaY5S00gzUkJiOLR/Y+VssGj7zYAE7ibYohbDivA==
X-Received: by 2002:ac8:5d4d:0:b0:4ed:b409:ca27 with SMTP id
 d75a77b69052e-4ffb4a3c298mr106639061cf.10.1767956954810; 
 Fri, 09 Jan 2026 03:09:14 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507b9d508csm11212953a12.13.2026.01.09.03.09.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 03:09:14 -0800 (PST)
Message-ID: <0fe51f7f-9b77-4bff-ab1c-21c44a863a7a@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 12:09:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] backlight: qcom-wled: Support ovp values for
 PMI8994
To: barnabas.czeman@mainlining.org, Daniel Thompson <danielt@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
 Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>,
 Eugene Lepshy <fekz115@gmail.com>, Gianluca Boiano <morf3089@gmail.com>,
 Alejandro Tafalla <atafalla@dnyon.com>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-2-8687f23147d7@mainlining.org>
 <aV-UyhP7wllSBpYj@aspen.lan>
 <67acbe8ff2496e18a99165d794a7bae8@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <67acbe8ff2496e18a99165d794a7bae8@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ue1ciaSN c=1 sm=1 tr=0 ts=6960e1db cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=dvh1Nh-0K4mN0UgEr80A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: wB0-nnjLuZCP-tvDeOzJ9XKV2G6UWRmk
X-Proofpoint-GUID: wB0-nnjLuZCP-tvDeOzJ9XKV2G6UWRmk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA4MSBTYWx0ZWRfX1O7LlDHzWSBo
 wEXH6T4kfos5meovanwwQY7A4I6oGkgZK62zkX6lKzCiSkE556ZEBaIuyv7ZkgqLWFtZOnAmaR+
 P0V6O1jFD1Pmp9E3nkgvkZsXUr0KjhemiRBdyFC3ALQTxTlTyWRiQjn37mEVwxihFIgYhdyab4O
 OUCHbFqlsXAIzvYX/p4KC262/11KVCsk7Y/nb4m3EcOCSFtLRk4TriGL1hhah70KWdBUlUHLv14
 p+DLXpEAqES0io9C/jSnKLk/nXFgZuO6LrQ+N4MiotuRUwOXNAvKJ0MZGMiyTCrL9ZIHJNHZTvj
 w0tHVbTAFFPnxbeOw4IYKuiJaCk440UvpJGJ4JIWPSyE8mTep3ki4/8W4Uuz/O7I+RmCqb1V/gC
 F6scvBFSYvZxIYI7KHA6Z/Jix8b0IJC2Ubdw5qOfm9sMLLkEndpHWHtL2mTckQMfaj89nk8RW2J
 QH+AFgUn2cp1NQFkV9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090081
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

On 1/9/26 7:36 AM, barnabas.czeman@mainlining.org wrote:
> On 2026-01-08 12:28, Daniel Thompson wrote:
>> On Thu, Jan 08, 2026 at 04:43:20AM +0100, Barnabás Czémán wrote:
>>> WLED4 found in PMI8994 supports different ovp values.
>>>
>>> Fixes: 6fc632d3e3e0 ("video: backlight: qcom-wled: Add PMI8994 compatible")
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>>  drivers/video/backlight/qcom-wled.c | 41 +++++++++++++++++++++++++++++++++++--
>>>  1 file changed, 39 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
>>> index a63bb42c8f8b..5decbd39b789 100644
>>> --- a/drivers/video/backlight/qcom-wled.c
>>> +++ b/drivers/video/backlight/qcom-wled.c
>>> @@ -1244,6 +1244,15 @@ static const struct wled_var_cfg wled4_ovp_cfg = {
>>>      .size = ARRAY_SIZE(wled4_ovp_values),
>>>  };
>>>
>>> +static const u32 pmi8994_wled_ovp_values[] = {
>>> +    31000, 29500, 19400, 17800,
>>> +};
>>> +
>>> +static const struct wled_var_cfg pmi8994_wled_ovp_cfg = {
>>> +    .values = pmi8994_wled_ovp_values,
>>> +    .size = ARRAY_SIZE(pmi8994_wled_ovp_values),
>>> +};
>>> +
>>
>> Do these *have* to be named after one of the two PMICs that implement
>> this OVP range.
>>
>> Would something like wled4_alternative_ovp_values[] (and the same
>> throughout the patch) be more descriptive?
> I don't know. I don't like the PMIC naming either but at least it
> descriptive about wich PMIC is needing these values.
> I think PMIC naming would be fine if compatibles what representing the
> same configurations would be deprecated and used as a fallback compatbile
> style.
> I mean we could kept the first added compatible for a configuration.
> Maybe they should be named diferently i don't know if WLEDs have subversion.

Every PMIC peripheral is versioned.

WLED has separate versioning for the digital and analog parts:

PMIC		ANA	DIG
---------------------------
PMI8937		2.0	1.0 (also needs the quirk)
PMI8950		2.0	1.0
PMI8994		2.0	1.0
PMI8996		2.1	1.0
PMI8998		3.1	3.0
PM660L		4.1	4.0

I don't know for sure if "PMIC4 with WLED ANA/DIG 3.x" a good
discriminant though..

Konrad
