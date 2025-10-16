Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CC0BE2A48
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 12:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E8A10E99A;
	Thu, 16 Oct 2025 10:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ftka8BJK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D1D10E99A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 10:07:29 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G6lIKe002591
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 10:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FgYMjbIiweStJ9TdZHgQfZpFXMpwTSBOKc/PlhGShpc=; b=ftka8BJKu73PVdl0
 WBjkxD88/mLvYKM8O8etdVjVgZoQ2CUckjqcfCm6xLfJcBLbRWl8xK1WPckZ7qsT
 DtSidaVCuG+KrLqnazg0nLMQ6Df5bwejFuQDxTFn11L0gAggw9bOPXjwM9Upio8l
 o7AVi5T4QKssCl/3fJqax1H0FQqPSGyde5WrWfkUU9X2wXGWb5PwM5XE8EcyxxCZ
 gglFAbhy2SU3K1derHGzukduPC5lAdXIAK2YduqCOzSsib0gQfBm3cpsY51hOKzR
 BCIQD7lwVDKQHGgzlvf9Epe9tq/hDfdk38xi03i/h4ttiMNmiu3DyeGWb8QYU2Fc
 /Ewyig==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa8fxa7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 10:07:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-88fcdbdb598so17493685a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 03:07:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760609247; x=1761214047;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FgYMjbIiweStJ9TdZHgQfZpFXMpwTSBOKc/PlhGShpc=;
 b=Stn0KzGBxdsWk9Eiv/OFzFTkOFGu2ek1akcBFIcYofQr2njJqBJf7FmBVodLz94b3o
 MqXVYUazGeYbVaZEKbbum6kZ33cV1uDexUGnO5Aa8wNseJfghdeWG4e67RcyM/FcQLzK
 gQ7Ms8x/LquZcKnBGoBAEkBP24eZw5qKYXuE2KEAidakBRXuQTCHjqmT2l+u4iITDtce
 up/UKcoxJ86XyoFVlwvU7czc918NG605MyPkyOeEFwdWd4sJlKwamXAFjg16+SP/Jhii
 bs9dwyWNtpC0HR4Oh1YJDrf3zYh03JXMb+QrAvlVVqlrWesaqiInD3KB+UfNh+pevKvT
 IqoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSyiGtNXh+/FwCPExew4oeLkMzt8mIAFVAwepQbJtI98j/v1ZLrWqF+o7JFxogQFylezGmJuMoIag=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFxsQEjvnTOMyKlUxH7HllcYYUh+aIITjHS2Jrf7UEdD2fweW1
 Xk4BDEB/eo0Q/BuvVRmkEOda3hCd2MJWKPLi6K8KB8HpKdwCSAroIes0ZimMOULklN0i9XNbkPs
 fxHbsM17rRoPFmvlIc2zExEMzTO2V5bNOr4QncfP77h8bGuHaJifQtGl8ix+GjdvuaiPxxyo=
X-Gm-Gg: ASbGncuBmHM91DOOC1i5eOIRz3l8IE4fOT75fFMhrSxJNx0v8z43/9vJ322Qx0V6lD4
 BJQIsNv/qpVk1cpZX8zgL1cQCSMVO4WDp1SXc2UYe1L0QdxMbQ+VhAO7MW/JREFqAXLUPkffKO8
 hdh7nL1I7QFPoX7dqWuURAzqpXoyNw5hktxqmT1P7pKtcgDJINkRXPRhp+EAP6SKamKjhNVp0CU
 Cd9x7+UGITOvYg/IOpY5v3+vKI0KgM0afR9YHxx++9HWCK3s8KjwDMJv5IL9WV9o6iv1KWxuawN
 jDo4CVoegGyUkaQ6vRLdaSRJfvYwhIfyzXpdbDhClWmKMkUv8Sgepy1BRNB4GuYJix7qOpEjb+N
 flisePgnO2Ii2V4J+33r1bCVklrbpFEl17Ffym8VHGE3x5CIx578cA26S
X-Received: by 2002:a05:620a:d8e:b0:85a:dcb:a0fc with SMTP id
 af79cd13be357-883548cf6f6mr3114894485a.13.1760609247307; 
 Thu, 16 Oct 2025 03:07:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmeMnWYXAsP+2YnvkA7zTrb0zSa4DoqPjPUBxAdsneDRLKYGXtJXU7bceLsI69WhZDfsrdDg==
X-Received: by 2002:a05:620a:d8e:b0:85a:dcb:a0fc with SMTP id
 af79cd13be357-883548cf6f6mr3114890985a.13.1760609246619; 
 Thu, 16 Oct 2025 03:07:26 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b5cba45b3cbsm466893366b.40.2025.10.16.03.07.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 03:07:26 -0700 (PDT)
Message-ID: <5a864c29-0eef-447b-a8a7-5f23f5f89e0e@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 12:07:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add xbl_config image entry for AIC200
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007221528.561242-1-youssef.abdulrahman@oss.qualcomm.com>
 <c3339f06-aaca-490b-997c-8b6b145c93c8@oss.qualcomm.com>
 <148df7bd-6410-4814-94ef-0880b596f363@oss.qualcomm.com>
 <74703f5a-243f-44ae-bf74-ab5ddfb6f685@oss.qualcomm.com>
 <d61ca50d-f9ea-40f1-a97d-090a11e49028@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d61ca50d-f9ea-40f1-a97d-090a11e49028@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vr4bqdGmfZq1TI4E2yogxsr--zdhXJoE
X-Proofpoint-ORIG-GUID: vr4bqdGmfZq1TI4E2yogxsr--zdhXJoE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX/F3GrYZfJO2A
 UWFG5w0+GecT3K0g4pUH+zheeZCUgj95uX8rNKdvFO0ovI0ysWGUZFm64IP7HDl9YXDLO13sSc6
 5W5kubm/BDx+opSJEmHy2HCGo3D7P/FcDUZ3pomaFB37DMVJyKPaHMRkOrU4onWuXBnVnjmjJh9
 CddnWXfMhzixW0a0T1f9dqvtxvhgmBI2BCbCbwlvoSKKX6iAq/so01Q17iVybuZvGBfptw+xplh
 xz6F6v9Uf7wsiWbtSw4Kbf1TAzmUN56tcccsnrYulVvHEPSDrIntwd7rN9zGuGrY7E0+lZ/LtBE
 8E3ryIanayI6lRKVVy9Y2jHPb94PcN7MTbTp1U2Ty87Bx17oIwvLzv/8bDljrEVMDE9yE1mlJoe
 oHN7IW/y4CrOt3bebUf+D8WoTukzAw==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68f0c3e0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=9xTgksZIBo2-CdbP8I8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017
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

On 10/14/25 6:48 PM, Jeff Hugo wrote:
> On 10/14/2025 1:48 AM, Konrad Dybcio wrote:
>> On 10/14/25 1:47 AM, Carl Vanderlip wrote:
>>> On 10/8/2025 12:49 AM, Konrad Dybcio wrote:
>>>> On 10/8/25 12:15 AM, Youssef Samir wrote:
>>>>> From: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
>>>>>
>>>>> Update the Sahara image table for the AIC200 to add an entry for xbl_config image at id 38.
>>>>>
>>>>> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
>>>>> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
>>>>> ---
>>>>>   drivers/accel/qaic/sahara.c | 1 +
>>>>>   1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
>>>>> index 3ebcc1f7ff58..04e8acb94c04 100644
>>>>> --- a/drivers/accel/qaic/sahara.c
>>>>> +++ b/drivers/accel/qaic/sahara.c
>>>>> @@ -194,6 +194,7 @@ static const char * const aic200_image_table[] = {
>>>>>       [23] = "qcom/aic200/aop.mbn",
>>>>>       [32] = "qcom/aic200/tz.mbn",
>>>>>       [33] = "qcom/aic200/hypvm.mbn",
>>>>> +    [38] = "qcom/aic200/xbl_config.elf",
>>>>
>>>> This is the third oneliner extending this array you sent within 24h,
>>>> please get the list of required files and update this list once and
>>>> for good
>>>>
>>>> Konrad
>>>
>>> I wish it was that easy during bring-up.
>>>
>>> These patches are being upstreamed from our internal branch and thus
>>> reflect the different latencies across the sub-teams to that request.
>>
>> That's upstream-first-first ;)
>>
>> I would assume there's a single list of files that get loaded, perhaps
>> within the device programmer image.. Unless you're altering that on the
>> fly as well?
> 
> There is no device programmer.  This device does not store runtime firmware in flash.
> 
> This device is still under development and not in the hands of anyone outside of Qualcomm, yet.  Much to my annoyance, the firmware developers are continuing to change the firmware images - adding new images, splitting up existing ones, etc.
> 
> I'm expecting to lock this down, with or without the firmware teams, once devices end up in the wild.

Sounds annoying indeed.. Hopefully this settles down

Konrad
