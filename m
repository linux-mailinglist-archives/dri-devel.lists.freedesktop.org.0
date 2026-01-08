Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21779D01CE5
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 10:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8804610E6C3;
	Thu,  8 Jan 2026 09:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mYqkHID8";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TtCTWUjf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D354910E6C3
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 09:22:57 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6084iKZU3751427
 for <dri-devel@lists.freedesktop.org>; Thu, 8 Jan 2026 09:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 o4qHXzXN/j3GloedtwAbja7LzZdHCV0m7/7mZLc2m/8=; b=mYqkHID8mg2NfpF8
 gqQcF0cxspHvu4+F2yjd6y/tJ9Uqj/hLpuU10za9QN/bjEQOsCrGJP0GR73LkmRl
 4UVnKKZE3pantLlDnLBq/eZAKZvrWhVa+1AgsKaGaBnd0PUBcZzKHo3MjqemZR0H
 8fIlZ2W6U6i+bUDhihG5ZkUt6Xl1IZ+LrR2y7zke+srPFoLchlm6oplP2+iE1e/2
 ESlPhKZbg0f9CQdZHSxbiqSas8groGlYgpabrEs0etQ9W59QUWMfeQibh9+usZyU
 5PiB8cxZTANW1A6enj95UlbHWFKSsUqWhGUWmXs7/Lv/WdLxdKrgZSbTDfUFd7vk
 tjKeFQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuxctnqp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 09:22:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-88885bc90a2so7491386d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 01:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767864176; x=1768468976;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o4qHXzXN/j3GloedtwAbja7LzZdHCV0m7/7mZLc2m/8=;
 b=TtCTWUjfe1jvQDgOJb8DmlG3dMN9bXmxpo6Vr1Cr2kThl3DuoU9TSKi9+WKI8zRpQK
 p3A9kWPQod1A5hzHYnE4TZsQIowHj/McTqkZ0iFZAll9xDmTWxwRo9Nr5HR5QUH4m3J7
 n4ZOFyqfWVHIHXByq+AwsBKCB8CB+B0AVKsJrT4EB0iMP8HxZhouXZ8bMjWgkwhtT9Bf
 5lp4ls8NuCyx6iseqVK5n/7FTKu+ly9s+aKBThFLdlpTej6JxoLAUq3/ktE985QdHb+9
 1D+U0mD8KUVbobp3uaigTEZrMjLnuSQ3q20aLvcMKF1JNLhhCxBFNIHfNlWQU9C2z7FQ
 MJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767864176; x=1768468976;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o4qHXzXN/j3GloedtwAbja7LzZdHCV0m7/7mZLc2m/8=;
 b=io8GtFHRCejpCAMFDfBEH7pCS+c12fB4blKaThgqZW7rkvWpxtoVp9jSq0ndpXIvSr
 uG2ciWcyT+DlWfELAtAnUSRDnDFLzQZEowrq0+yF2y9vj+NQ2YajVVqDQrr1WTfQ8erZ
 GRcc0X4VEKTCmCVtTiyLsbzJflhhdpRaS6dhd3BFQ3Algt4jGTCbZkNJ9UVO+eF0710G
 fknvvdwfzxZzYTr2bjJ8KjBsgT8IhuReoUkkIVP5+E+h5sDkKpAXX36lHTxK1vZ8AO3s
 ltuJCVcQnD/wWJGKCApwzkShxzk2vUbPsopZeIwQAy9GVCHMowMX0JEz4lcZdq7VHkYy
 h9Ug==
X-Gm-Message-State: AOJu0YwVti+R6F/3/+QERhnyzE5mitRszUxp+WuSseolxcbH7+7OpQ0K
 n5GfIE+RnCnoST8UgVmG/AqhGY1D/qUhqDJBzaLArIdrolGNSKBrgAjqzE/FnbXlCTdNaIsKz9M
 P02KbenE5b19AjcpA3FnaU9+axeykZ+U4n7SVuGb/5+I2dE+pT+2jDsvuIL+8bUQIdHCtIUs=
X-Gm-Gg: AY/fxX6sM72bYgLgtZahTnSUT7jBabEV5QkeY6GblvqvOJoWy4V5nMOOYiqTsGp5p/C
 PQezr2fsUAmp702FuwEfCm89Eao/EUuIQslpR3yzV5uuMWNHCs4njdyJfJ3wEqFSw7WbwBKBN46
 AUaRwAvpuKc7CApc7QJ2yJ80M/EDwE7SCYK3xAJYN8qXf8Th1lNPPFqFvzv46Bpxcfp8cUmpTXx
 X9M1f+D4hiF6xJN6G1sPRBxJOU30IBmaF9sZxmwLpV3fhEUPwstLG+L5rLpwL+lb/TOl4WsQJPi
 207QLzoMNl8snsl6nu62sBRPjg85k2fbdKkQa9n5uzAbMTAQ0r1Pp2BWHJdw+mx483VUQzZyFhT
 lldJmSBb1pr0vNRFem/GMcSQ0m20v4WoLFK/Kj+g2weaXQ8GkaSfyJb/zlZbbOuHocC0=
X-Received: by 2002:a05:620a:40cb:b0:8b2:e704:55fe with SMTP id
 af79cd13be357-8c3894104edmr508521785a.10.1767864176202; 
 Thu, 08 Jan 2026 01:22:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzo9qVwE2Z0L9gMrnjAB3lduyOMVsOLQ8jFn4jFHZjA763oWPC0dpsRmyX5dSTtMfXTGlU5w==
X-Received: by 2002:a05:620a:40cb:b0:8b2:e704:55fe with SMTP id
 af79cd13be357-8c3894104edmr508519885a.10.1767864175781; 
 Thu, 08 Jan 2026 01:22:55 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a230db0sm767583766b.2.2026.01.08.01.22.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 01:22:55 -0800 (PST)
Message-ID: <0b768afe-8bed-4ee3-83af-45bb51faecbd@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 10:22:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] backlight: qcom-wled: Fix ovp values for PMI8950
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
 Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>,
 Eugene Lepshy <fekz115@gmail.com>, Gianluca Boiano <morf3089@gmail.com>,
 Alejandro Tafalla <atafalla@dnyon.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-4-8687f23147d7@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108-pmi8950-wled-v2-4-8687f23147d7@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2MiBTYWx0ZWRfX8SKPLIRaemLn
 +Md7s9C53BOnEAeZaVO+EPDskg+NMrfuHRxqar89UNU5WS2Cx6rEzjZrsXxbV4cquTtNVrcBB57
 vkAvUYmjs160Lfr2z42zMTekHkfXiDRteQEAvjA28/UM8y1Oi0huOBhhhXEw9EylejdYBZEAII8
 hupQFvExP2lAqQn0yyZfx7V/gzaz+bJfJKCso6EBd4p4eXx7qHpv/1cPpKpysRI7KCPlQGcDWv2
 3+6kQ6CM1RrUNuXZFE5ZycHDi+IN10wBNSIOrMsVE/lJ3lOtAkcmRi6LVVVjOY2UNAjbVj5QDjA
 jif3y6NBGZY1vP7sAF5IX3ZMzN/RbyV5XBEOBum0BBx0sDnus2ImXSGl5pM0SQwc7DJ36KNUB5S
 8NO6Q0DfVF5T4AsWw6FHVqPBC2oNOHULvaBdtrXgvrMGaTymYox0LnFaMvx3lJE3Umau/Oi65+D
 dIP8VU37FB/RaQ5IKqA==
X-Proofpoint-ORIG-GUID: F34sJYvQJgbqFvvIO_tNm8aae2eJxUI5
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=695f7771 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=x0-Ntm4DP0gVEan9CnAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: F34sJYvQJgbqFvvIO_tNm8aae2eJxUI5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080062
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

On 1/8/26 4:43 AM, Barnabás Czémán wrote:
> PMI8950 WLED support same ovp values like PMI8994 WLED.
> 
> Fixes: 10258bf4534b ("backlight: qcom-wled: Add PMI8950 compatible")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

