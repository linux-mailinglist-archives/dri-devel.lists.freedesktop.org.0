Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85253C64E41
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 16:36:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B3710E3D5;
	Mon, 17 Nov 2025 15:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XMsuetOB";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="INJ8O856";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED0210E3D5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 15:36:00 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHB3YUx3517210
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 15:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IiXEW40QqYRYcgzUMb0Yc8i15orcZ89ClJbAmcNe1m0=; b=XMsuetOBcy0GkSkF
 USdYVFjgV2aWR/VSe6T+FMjJFDFePXY+h0uHQEsPMxb1fEJpetywHwvDDYEFCO8t
 k2iQZZT+riSZSvURJhpS2j7H0vnfI6dA2kN9pCS1MIX6nkbfWIYAEjB+wSko09wh
 cShAGwIwRS/3rmmcqyTgxoYBvBHnvbTuIS0Syzo/aQZwD7bP99zTNlo0BrAeS4VR
 m0T+zsBWUy7avGsQ+VE+vaW0JN8F1JH3LkTKtgsKDHXamIyOntYl+HSyYqw421aM
 9Lvb75bInj25NvQ1wkqZkyUYnxRoeEJ+2FzKIAuiZAQAHwssq1aG1EXARSjbZ+EF
 I//dmA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2gg8rty-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 15:35:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ed9122dce9so4820211cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 07:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763393759; x=1763998559;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IiXEW40QqYRYcgzUMb0Yc8i15orcZ89ClJbAmcNe1m0=;
 b=INJ8O856rGrsyb2Zqzx5+vqD0Ec5pBv1+e6D9/OPeKFZsfTFTRVpRJS3QMVFGEyyII
 IHibJfLoyIxqteM1KtNnmZG5fYCoGTzXGRWLa7h8iV8nuEPYiVugI4XZDlIDseLtgVq9
 SBTe3oHrpkrGKIMekb7ZEP2MZMnQTLNBCRqNqm18pvlDHsD4tVbTWRNumbVxnoiISvdh
 gj6uhuTn514xxv8E4LIpHAA/oEqVPZVCRiGXwp0FMbLlLKbH0+jmk8BoujeSFNEMcA3F
 2WOlaYdMqStaiFBqgHwybGNNc+7XuCzQmmyT+A/KyCT9iET5gYsU0lr4hgGIhrVXyayF
 Qj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763393759; x=1763998559;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IiXEW40QqYRYcgzUMb0Yc8i15orcZ89ClJbAmcNe1m0=;
 b=juZB4EaOSnnsj7sP/xEUcMTlnk4g5pWsMv+L+2X4XSFqLGQnOKVj1Ummet8bqPTnBP
 I39xamd4nq6ZAnhwFkbST73u+xqIbN/a/3bL2gJzvndGEbyf4SDFZtj+9zgVz4Dj9eho
 7stW481nI5Q8m4o//yfQdNEdU1McZRdPA7E6EVN5RdH5HS5CM6e0TmqjYMmBL+0N2KIJ
 38ZFjrB2aIZgkPbdcsiiXJAw1W9W38IIKICh8h3SSblgbMBUQWXgIQopZFsTz6642fl9
 CsJ3+jSz4x0nEoueBpHdLX8QDo21hRpUG8wX5VS4RgfTlqVzabMc359E0idKCv/zaR9y
 ovtQ==
X-Gm-Message-State: AOJu0YwdahkWcAvlyvOwFzKf9Fc15blvxTi7NONLUlma4FEJKYhxbfU5
 KCGvKseW5etsiwbNO8UPbNK+LWIrnBpGrCMIAU4t9NJr+OF7Lohjcky5XthVaqLee2mCRWWVj4U
 6LtR47rKH2tPnmkrDfA/qYkfga5O57JnqAiOkuwTc8/+RsA+w6m0xQNzMjlHvlmkpFo1TwVY=
X-Gm-Gg: ASbGncs0/g1uiRL2AprgxbTK91MS6KR2EMyTfUFePNcXZNljxZ64H5EDfeF9F7zWI9b
 eLFepMkjMR0+VfyLhSHYERLFzo7kcFXk5TBXLkutJsTKPrapCuupqw6wEnio0WOqeVtBhqDRJBY
 JrcclyTkPvT7qo9eKeUgCEyUhhTbShMW8KaxJADwJz9Kj2r7Ma9XLpXK1WSxSVohqyiZgVBrzwd
 Mb2Z2fNwJyLmQi9Bu+b1G45BVe9gF83gbltl6k16SyJ2+xFqNKH5NOYeEaXnqbjfUrIuM7oKTqm
 oPEKy7uAPZJJx1DEelVZ1OcIJIm9MyKFxFGQAE1KLpwec9RVHfbArGMio5V0iMrV9dRYuBSI663
 g1wKzK6Ll55/+IZA56OuPOTqTxkV1tACVx8WaJg8aeTHFEtKo7hdEcEDi
X-Received: by 2002:a05:622a:4f8d:b0:4ee:87e:dee0 with SMTP id
 d75a77b69052e-4ee087ee233mr57007411cf.9.1763393758623; 
 Mon, 17 Nov 2025 07:35:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCN8jMJkEs+s0FLri2omua4ZtiwgB/8YL6gNFMA7kDIuSsbIEkAvPGPFWPcHppT1bdBnJwIA==
X-Received: by 2002:a05:622a:4f8d:b0:4ee:87e:dee0 with SMTP id
 d75a77b69052e-4ee087ee233mr57006931cf.9.1763393757939; 
 Mon, 17 Nov 2025 07:35:57 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fd80a5dsm1091952966b.36.2025.11.17.07.35.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 07:35:56 -0800 (PST)
Message-ID: <ff773af3-d843-42ff-b4dc-e5a9d85c2285@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 16:35:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: x1e80100-vivobook-s15: add
 charge limit nvmem
To: Maud Spierings <maud_spierings@hotmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
 <20251116-asus_usbc_dp-v2-5-cc8f51136c9f@hotmail.com>
 <378c611b-f8c6-4f89-a3b3-6d8c22445e83@oss.qualcomm.com>
 <PR3P189MB1020E7393F72B285173137A2E3C9A@PR3P189MB1020.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <PR3P189MB1020E7393F72B285173137A2E3C9A@PR3P189MB1020.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oQSazV-4CC0TjZBSnUZYmm8SM6vwiWKL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEzMiBTYWx0ZWRfX+0zXMZ6sphoQ
 n3ZScoyNnbfb5AdlIPAMmlbR9ftACgAxPWI2S1WyBGSUIY1fR9gzAbGcj1DRKyXNewUNNE8T/jk
 cfVKndMArZKBbHYd44jMs0RXoVYdl/BvvEqKBiWt/ks0m4o7Y/twuVitfAReqEzQKeoDCLqVoWk
 qDyIfwZ+ddFaVVAZvHHIsuRm8psiTQS68DLSS5YOHa+zXCAR6ePMl8vS8py2l/AxqpSqib4RedQ
 RYyqrjfT7WlkFB43gNiuedYPp2hpYYg5nVjDk+roe+gkgD3xFqbEr6nxbEZism6hfY+PIGZ7og5
 MY/02KTjLTf6XPKuj0FX/HmKnoXNMrkK1lHaxVITZmEWjM5DW1yHSDbpVnl3iCedNxjH8WJ0kSZ
 74oEFju1eDQ2ma3Ej1kQynDioCSvRg==
X-Authority-Analysis: v=2.4 cv=Cryys34D c=1 sm=1 tr=0 ts=691b40df cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=69EAbJreAAAA:8 a=NI52xOD4TGehLKbkATUA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: oQSazV-4CC0TjZBSnUZYmm8SM6vwiWKL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170132
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

On 11/17/25 3:13 PM, Maud Spierings wrote:
> Hi Konrad,
> 
> On 11/17/25 13:59, Konrad Dybcio wrote:
>> On 11/16/25 11:52 AM, Maud Spierings via B4 Relay wrote:
>>> From: Maud Spierings <maud_spierings@hotmail.com>
>>>
>>> Add nvmem cells for getting charge control thresholds if they have
>>> been set previously.
>>>
>>> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
>>> ---
>>
>> Have you verified that e.g.
>>
>> connecting the charger
>> setting the charge threshold
>> rebooting to windows
>> rebooting to windows once more for good measure
>> rebooting to linux
>>
>> still has the settings persist?
> 
> Hmm I have tried several things but I can't seem to get the values to stick. I the spmi-sdam driver is compiled in, I am not quite sure if I might be missing something.

Hm, I wonder if Windows/UEFI overwrites these values or whether they're
used by something else..

Can you set a threshold in windows and see if Linux can read back that
data?

Konrad
