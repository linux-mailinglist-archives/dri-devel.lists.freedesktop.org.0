Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDE0C6D9FF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 10:14:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA94310E5B7;
	Wed, 19 Nov 2025 09:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NydyMXWM";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jzTSC05A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A845810E086
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 09:14:46 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AJ7OWkp971221
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 09:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Nl/6fD+Hyd7CoJDblx7nZTfga/QGoubL3gzqHpAe29Y=; b=NydyMXWMmA9jwIc5
 J/rY4/XvEd4sGjD6GoQ1QE1ZV41OPWJjbt0JWMiXFG1d8V5qZUj8zEESJXxpjkdW
 sR27d9vHTZku+TwQjFig4Y49bQqPj8w1JqwClJM5y4skK5N7mMlwldSKwQcgMYrP
 KryB9o8R3GoqXQWKVy+IaJ4l5PpDVxW5TzvvHW8mIwTi87FsuZZxvdv1jTPqqli0
 CDm01zAxRPQVuGq/E1mgiAOayX+XPAR2u+CUhSqEn/kNtBG3wRr913T6br+TR9D3
 1VHoD6zfXID42G7/W68rZcDndSBoXVM2l5VyU+IETy5tVBr+NtgY9fhVJJyzuhoK
 R1tS3w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah9fu8b8d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 09:14:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b25c5dc2c3so172253085a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 01:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763543685; x=1764148485;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nl/6fD+Hyd7CoJDblx7nZTfga/QGoubL3gzqHpAe29Y=;
 b=jzTSC05AzK98QjHTfDF+nyXufrKJoeTkCZk50GJt4ZzB83zXE0alUKyV09Qdq9oW8v
 WxFOZGjMDv6Xx7HySIsx5LT9D0SIgKezKd6/04Onx6UFCqZlPvr6M/i6gAsktF9HlImN
 EVZFsm9GvR0HWkaJv/HnrGmuLH3bgm6navWIhp98G36NDtEWmObddFQtF5gM/+D3NYav
 E8XhBaiaXwzaZLUeOR4GrhFlSCWd9obLLYRsoEZJWKuqhPxtrLQGncuQJLi4T7LOurDk
 SmAl/6nC6YQMFYCpRJLGaWQQxPnDPBn31t2wcztpu/LGG0sOrPluHfmrxTodtOWYqxVp
 d2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763543685; x=1764148485;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nl/6fD+Hyd7CoJDblx7nZTfga/QGoubL3gzqHpAe29Y=;
 b=rE/XMkDzJackvjsjlBgeHbgFgcK7GK11URWHRQHH48gJZXb9K3hmtkBnsuvXfsty8h
 9yzALqgUexRZgjfaP/A2mHy8PlXGfGfEuLlEAC9wsY1JW1DdG82qKWt9Fvsg+SOUFP4J
 PjokAGoybmFewSgC6NMZYOBmVRcBSPFfGcnFLUP+Jedcimc7Oean50vsv7e1VyPfPwBZ
 QckV9kRm8vEoX5U+wxv9j0M7MROF6C7t9oNbE7vxtfqM3vMCD4K8jIEs8LDf0j1Q/48J
 ccaJKL9YFwuSuVucyGT36s/W8w2tBe/oRSmALUd78/j8iGIHU1rMr0LSfYCq66Qr3z6i
 VObw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkhPUYup7uijDhrzJxFa4C0zQjutQmh8qIjF69AMkl9KMlHnVplVdzKWM7H0Wte1o6SNFGhBg9vOU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2kVrgIpLX6uuOAYlGVF1OW+YfCyTeQSOUHJ/k+EgK717wtFrO
 oJIQ7K8GjP8y8Vy/MmnhsIdQzIrddA0t7yIVMU3Inw9Oh5t6/zith2n6zAkquv3PJyU4FGF5UEV
 M8x4NBnJjzHIvaQ7/RQySeldguT0mOPOIC65SxcQ5z7rUtkW9PNVJx9o+MUKbrh7QVn6wAno=
X-Gm-Gg: ASbGnctKxP95QJ3vBnjz/nuy9zS38S2xWy2OCgXiGOCn0Pq7Q55FF0mEj6Z/v7Hm8bv
 D+OZsb0eoKdW41wqeVR8ezowBz3vJ8agyJbSS3Ubdi6yi0GhduBMuUTFGNFvrEwvN6H0hW6HB8+
 KlbjOmQt3vZhSNnRyhKpHXiEZaIBtulaHeWaWmW0hvXACbfD46457kDSx5g6Sqy7RxGrefmPWn5
 ds6lIa9Y9jRxHH1JRF1dsdebnIlrjIORjriyFVwgVlVfYL/qawHhSVpn8NLPbrk8oVuOIWkRTlS
 6zjtrRm1Qy5iwk5xukSCAGqBZnIPRpNEmIhQ6N3UKeKNJ+uwgdYS06qzXF9S36worrSue4oHljE
 AfzBHQVSW4Tp+kzRTSYe7DtowimsVwqL3/op8QAZs3j4P8iRDoVOgCd7kjxwQLnjwyqY=
X-Received: by 2002:ac8:5a81:0:b0:4ed:6e12:f576 with SMTP id
 d75a77b69052e-4ee317e0a64mr59638231cf.8.1763543685207; 
 Wed, 19 Nov 2025 01:14:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGObLPZkLSTwhyHEhcM8iEzSfjtGJQl79qr6rZQ0cnMOHqYjW6bF4CMAUDOqre1/Yn7BoVkmQ==
X-Received: by 2002:ac8:5a81:0:b0:4ed:6e12:f576 with SMTP id
 d75a77b69052e-4ee317e0a64mr59638001cf.8.1763543684575; 
 Wed, 19 Nov 2025 01:14:44 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fa80cb6sm1567289066b.7.2025.11.19.01.14.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Nov 2025 01:14:44 -0800 (PST)
Message-ID: <bd6b2ae7-71e0-4c65-bae2-81240bd2515f@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 10:14:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 2/2] drm/msm/dpu: use full scale alpha in
 _dpu_crtc_setup_blend_cfg()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251118-dpu-rework-alpha-v1-0-293d39402b59@oss.qualcomm.com>
 <20251118-dpu-rework-alpha-v1-2-293d39402b59@oss.qualcomm.com>
 <5c2e47f0-ba96-4433-b13e-9e819cfe2204@oss.qualcomm.com>
 <ogiiqha5ak5z4atck7ykyvbzw4juegsn4z7nazkkstiep3duwe@6qc5ag3kobj3>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ogiiqha5ak5z4atck7ykyvbzw4juegsn4z7nazkkstiep3duwe@6qc5ag3kobj3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA3MiBTYWx0ZWRfX/cT4cMQbLecZ
 oJHaWMXdqJnbjot7oYyY1U4o40IovlB4oXj/OsCJh01JAh8GioVONR2It8wcS9Q4Or2Bkb37lTa
 q0icH6iVs3bv3HVHN+Ijs4EO7YkzwfZVMDCPlXEJEJvVDlJSsRlA4lROx+14qskwKQKE/WgYdRY
 tEyEIPgcfzo471d6FHbifxvO1N8XmHmjFsBYV1tBwQsg1X4bJQoak593KOImuQHa/LqWRC8Y5iZ
 x0mlJMdcgT9gRavMYpBWtoLzun/WV0ylqFspzwbLc2ALBuuYUjefEPB2lC7+vbZqGliYa2agRwv
 UZjCfrM0NkYAqIcRxG+tdjFTVqR+ndCwXxiCvhXxEtmlIMCy0hLTiHqIr3Crl8jc1lCvzNsegJ+
 ndRVLaICZHfDjgjl2kWtRhrBQAadag==
X-Authority-Analysis: v=2.4 cv=KZTfcAYD c=1 sm=1 tr=0 ts=691d8a86 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=YLj65xLjQURtOJfc0jEA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: GPl9HlGoLu1LiKxS35db-OJiSkdmte3V
X-Proofpoint-GUID: GPl9HlGoLu1LiKxS35db-OJiSkdmte3V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190072
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

On 11/19/25 8:50 AM, Dmitry Baryshkov wrote:
> On Tue, Nov 18, 2025 at 04:02:03PM +0100, Konrad Dybcio wrote:
>> On 11/18/25 3:51 PM, Dmitry Baryshkov wrote:
>>> Both _dpu_crtc_setup_blend_cfg() and setup_blend_config_alpha()
>>> callbacks embed knowledge about platform's alpha range (8-bit or
>>> 10-bit). Make _dpu_crtc_setup_blend_cfg() use full 16-bit values for
>>> alpha and reduce alpha only in DPU-specific callbacks.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> -	const_alpha = (bg_alpha & 0xFF) | ((fg_alpha & 0xFF) << 16);
>>> +	const_alpha = ((bg_alpha >> 8) & 0xff) |
>>> +		(((fg_alpha >> 8) & 0xff) << 16);
>>
>> This begs for some bitfield.h
> 
> Which one(s) would you recommend? Ideally it should be something like
> 'get N top bits', but I don't see one.

Perhaps we can create one.. there's include/linux/wordpart.h
with upper/lower_16/32_bits().. Maybe we could add

#define lower_n_bits(x, n) (FIELD_GET(GENMASK((n - 1), 0), x)

// register def
#define CONST_ALPHA_BG	GENMASK(,)
#define CONST_ALPHA_FG	GENMASK(,)

const_alpha = FIELD_GET(CONST_ALPHA_BG, lower_n_bits(bg_alpha, 8)) |
	      FIELD_GET(CONST_ALPHA_FG, lower_n_bits(fg_alpha, 8));

At which point it arguably becomes equally difficult to read.. but I
think the rule of thumb is that syntax sugar is better than raw bitops ;)

Konrad
