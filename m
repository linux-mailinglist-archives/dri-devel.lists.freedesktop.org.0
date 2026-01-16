Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D920D2F43D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 11:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F15D610E850;
	Fri, 16 Jan 2026 10:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJwTJJGg";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UxQFvcEE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ADF910E850
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 10:08:01 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60G8QWvR3596353
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 10:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gMp21ney8bm54p1fps9Pw9iiGOGyYYMunTK1tTna0vY=; b=FJwTJJGgW7eFqUaI
 6GTfqzIUGeKJva8mYQ4CVVPw6t0zLMsTCiZZKCkfHsi3cbvl2mQdJ5oq+t8mYnPq
 wY8cD7SvhiT1K3pMBK810jXv382zUkBCW9Js8ZxE+9Ot274WqpxhD1eNAMtM9VCV
 C2faTy3nsHxuLLb1MpBhVnKEamC9ZRxWK+ydhrrdLsBogMYmspZ8YBIq4+mnqE3X
 fiUCq4sY0KJuIVFZoQqR9BI+jcSVJMs4C5W4Qr13hXCOmTQfT7GBemWVRnPt7Cgj
 b8cG/XzCI8Giifi7jz4SX+gAfjDSGqZB8rbXFW/SzztNmhzPTZtu6ivTK6yRVplF
 t85RWg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96rsr0y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 10:08:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c6a182d4e1so38664885a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 02:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768558080; x=1769162880;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gMp21ney8bm54p1fps9Pw9iiGOGyYYMunTK1tTna0vY=;
 b=UxQFvcEEqmFJLYp+ZvMt5MG0n9W3VeDk9xwGZhPTLfhm4GdlcS1QmsXle7YLNAQIpC
 /G/UXpkmFNJYiUKEaf9E+odRtU+8HSVZrd/4A7VSxYKnvGB2kaawFEovqrHQcWVVuBE/
 LApSjGCqsSLF5IXEckTvtMRaIGjst6FVbnGmx9F9NVQY0RQAKLwC9rEpX0V0xlHLKCs3
 thccxWqCyt7KNpyuxD/coyxgbnhHg1QNdoMuGUgjK3P/FknsAOeGzGMx0DaGdPCPZk2S
 3w581hFZwucJsZlFS0tFVNAaBaLIqRIraTZXCT2oAgLDo0le9t6fAsTq1xNO+9r1bDo/
 8SoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768558080; x=1769162880;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gMp21ney8bm54p1fps9Pw9iiGOGyYYMunTK1tTna0vY=;
 b=RuWHsO26TZeTk2HAc+Cu1L2s/8eh1t0wEyvXaJWrV1RbTyYRx1cWSu5GUr9ekwfJtP
 EUSsA18SQRIzSdBZQh1K7Y4ZBn0Je/JuAZYzv7KC/x+5W2IG5ezr+vShwa2fudSQxtaj
 6vUYeJFAXJbmgkDqObwG5oe0MWyvqTPh2VjbLB8kJVe20eve80Vm1Uf8mszWVKacVzw1
 x6w/MAS5CyJHudiZfmrl68VSSKHf1SMJdO93fYrUSCiClYfXMn0EEzwoKcEdXvOZsoMV
 9lAl5JDpDQ0BpA6V7UmmV4vPoyxH4rJvUYMSgzk5ItgORAn9LoJUrXtzEL62hE2mTH2m
 NExw==
X-Gm-Message-State: AOJu0YxPPbwWV/C2CUTZET13TzpiW1pZB5ao2BD6JbAJ0hWPejdyvG3d
 V+OIJH7M3f4+zzzujYY0mqQ0dobBt79y9jyQZCPRWHUgQujiDN9WiVBqtLlVNSdasGOMDc4G86Q
 FWDGW4oSa8ZN+/A44+9t6iVkl1qwd+J0GZvE9g8ISPN6VPMlnDwPxt6BydMifGAYmxycGdb0=
X-Gm-Gg: AY/fxX5wQjMpmGyq76TwD5DhYTVROpZEce+wnot4gDkutDq5gzbb+1KW5yorwBFYYaU
 nR1VnFQVS33GIkmOSxwEvz3jPGyfnqoKK0XtqBy3h98ps9xNboC2+6mI9YY+geW0+FH6VBbv2nG
 PZ015z/k0TgC5ADZZPTd2GMmd9XKKjA7sVuSSEsOEs3d13uQIno6QCyQrefLF7ZyESG3u8AJ6r/
 GixgWo2k9QQJG3nTjz1k2M4Nkuq+YCustBQEUbJ/7az8AdUkueAOttCSSLoRdqicGKPxQ2that0
 smOg8ZfoocKsSGeBM7xL9zYZ43RQpXRUja6wicqUrEOCjt6Ym7g3eIcZ2hQ8Ja1P7bLIA0MQK/K
 oCtJBwbn5RPSzQrcsj8MNB6Mss+VaWwTOGd2chiC+roLf0yjW7MCE9z16pJidP6KgnP0=
X-Received: by 2002:a05:620a:4111:b0:8b1:fa2a:702f with SMTP id
 af79cd13be357-8c6a670cca8mr237361985a.3.1768558079686; 
 Fri, 16 Jan 2026 02:07:59 -0800 (PST)
X-Received: by 2002:a05:620a:4111:b0:8b1:fa2a:702f with SMTP id
 af79cd13be357-8c6a670cca8mr237358785a.3.1768558079218; 
 Fri, 16 Jan 2026 02:07:59 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-654534c8c82sm2074279a12.29.2026.01.16.02.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jan 2026 02:07:58 -0800 (PST)
Message-ID: <66a1716a-47f1-42ce-a72d-8c69d29410d3@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 11:07:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] arm64: dts: qcom: msm8953-xiaomi-daisy: fix
 backlight
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
References: <20260116-pmi8950-wled-v3-0-e6c93de84079@mainlining.org>
 <20260116-pmi8950-wled-v3-7-e6c93de84079@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-pmi8950-wled-v3-7-e6c93de84079@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3NSBTYWx0ZWRfX65J+UB8PhuI0
 GIzKWlmDQkre443BcoHhm1/5jSCtXj4dCJJEwaU8dJT01V0t54DVNrqCPRRLa6T6wUXx6ycY5KO
 17365PB/Zx9nY47EiYyUl49NSta0L4VeEs0rm7g0zfq3vezg9xxs/U6Cz89jVYW5SPeD+J5WMTc
 Pf1iZEpo/i+fldEsW3SZ1yZyUdj9TUCmoeVA8M251UyS1IT2OUZAFV1fHeXhi7UJmz32ZzHGZJ8
 5EsnlSimI3+ww3bfE8bIIYPbWM302Zp4fJz0NTOIQlD1TgLJwVWCtBhEZwW/t1koU2s+6nMgqtJ
 snPPP3BGZDRqqCXC9wv6WQ0zNIrcpEe1HZdTCnnBVg/dhFy/ZxHfri5umIJF5VPZ0PEeVw4qmGT
 uWVCcoboX/lT5Hw4LZ35J8xodHWqyQM9gXnI3kYauGjnp/IfA66pE2lrToIyIjJlax1JEUDlDou
 DCu+ORhayG8jWDAoJ1Q==
X-Proofpoint-ORIG-GUID: PVYt7BqeGfqPemuEgUmvwLdcqXjA2ywb
X-Proofpoint-GUID: PVYt7BqeGfqPemuEgUmvwLdcqXjA2ywb
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=696a0e00 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=HVKn8-F_4eW3eUG8FJoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601160075
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

On 1/16/26 8:07 AM, Barnabás Czémán wrote:
> The backlight on this device is connected via 3 strings. Currently,
> the DT claims only two are present, which results in visible stripes
> on the display (since every third backlight string remains unconfigured).
> 
> Fix the number of strings to avoid that.
> 
> Fixes: 38d779c26395 ("arm64: dts: qcom: msm8953: Add device tree for Xiaomi Mi A2 Lite")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

