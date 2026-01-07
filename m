Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 980BCCFE347
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 15:13:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1116A10E5ED;
	Wed,  7 Jan 2026 14:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DrmMxHN9";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MKT+k/uw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC05210E5ED
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 14:13:10 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 607CsXtP2239586
 for <dri-devel@lists.freedesktop.org>; Wed, 7 Jan 2026 14:13:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 i88csJUcM2ULCrqraGjde9aKEzx82JPtrxGeziCgzEU=; b=DrmMxHN9fMHEppWv
 Xj5gayauNSS8e1mPVGpyWWqwnIjNqm9W5d4QjFtObGKEPP1wy0h0EnFKuDkDQl50
 kNcvZPQ0qyHGhvJMw5K1IKBzBgtt1mhs077WbJAYYq7oY4FNnDiISvtSiLjd9Bwr
 Irc4BojmDTTiDWqAAzQF/qayX/cDJBoax+NPc749Upi4dZyJnT2E330Ln+CAvQl2
 edV9ikj04F0s7Wugk77UXB3uNeBqKdnqAWj3axGFzw9DHseUOMjBFhJAf8ViX7SG
 BdnyNPiM7YGN5LTry9r3HsjuSXCzg90FdtgcY22XBDMEr4qtDday3GjwNYnkOOLk
 Tokrrg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhqwg07d8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 14:13:09 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-890072346c2so5704536d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 06:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767795189; x=1768399989;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i88csJUcM2ULCrqraGjde9aKEzx82JPtrxGeziCgzEU=;
 b=MKT+k/uwJ7PVhpjI7zw9JiHSOqlgxGnptCorRuUVp72uY0libRPiP6fg0TjYvA90Qs
 Q5N0uirmClUuViyoQOngBUWom6YWwfezkybIdmT6HTroNOlbtx1OCMZcMOHRbhBfB0af
 zlHwSgStEe13ZdQu5O0ke2MWcP2RfqGCfreLIP2PgrgKibA+ppXsxdYKgELEcHJyj7Qq
 Db6jp/HzN1gr8yszbH3KLyxMxbHEV16tHH3lr/lt0BWAZU4C/JSQboPgsDAzZ9BNkeJP
 +KZHjE35eNXit7g7u5q3PF1lmxv6CNXQSTfERxcAclA4wWODAd8nPzBZc5mTlNvebiaT
 4yGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767795189; x=1768399989;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i88csJUcM2ULCrqraGjde9aKEzx82JPtrxGeziCgzEU=;
 b=UMwkj5YOwhfyUUNgJxCytbwgXsUDP2eNQOBTJKRMpCcelssp2cifuJama0vXrx92PI
 qDnFmJjfJzrMiwgT87ZGECfbofv/oY/4hUUlRveTwvM4T3OixVmgRH6pWGiGvWn7POiX
 nM2ldMAU8vfOE4aFAP5YiZv623uQV8VGjy6PZTgpbKV05Q+EBfh0yX1pt6k2qpcwh/Hw
 cNxxqEW/5t7/CJ4GKbG4jb/DydnX9KtxBWFCTA+qllgTUL6jFtU47TW+9WE0730WI6pM
 6dpv2VqbqAgckB9x22LgWV2TTNe0iGOmGOUdeqicih6ExoK81j66Bv+l2lavRJlwSjoz
 eikg==
X-Gm-Message-State: AOJu0YxizeGs4PPSOn44xxWZIGf6oyPBuxrUEf+xXs65Nzab/LBVmJMV
 g0tBfXNzSmnjP5dEMCvuLGy7H3nDC+zpHUdQ8mJZEzx77jM1YLEiVZKFLr1a3ENKqsAbyhaLYT+
 NBRIn7kscAuh7wkPzqO5kIpkLw7DF8NhUl1BQOkH3+Pker69r9J8H+FjLvniaa4QwO2dH3z0=
X-Gm-Gg: AY/fxX6J94GbHO2fcp3uY3LHtWIn8abxYYlebEil+cX64EV96dx2Mmc3X1hPd0XZkoN
 3YQO4uGJp4877e2ithgPXL0MOZ7x4d4xWesswG1Aq3BUgv/wp6hOmD8MSNjpj9n3B7E/OwFc6Ph
 BACrXLb/x4+YSDetuQ4a6+x6zfPLPXpa8QQCeRILQ+t1RUPD6fJq3ug1bAxALgkTM8CNeGkK28B
 y2/XwVvvXjjVwJRXG+FkhYl0Gh0+WT1nsg2EaiwA/TsnggW7mZjSFGutyH1NOfe8v7s3IT2OYz7
 AcUDPzo/G1nmkzlkVvj6+pBN0/XldzzlrCYQAAQsADBKPECPMv3gd1bH/x1S+BY9+8xzuQ9sbnT
 iqtPBB+D2X3ut5E/XMZs6+eQfZh77ycOKLNEUndatm4xKMt3V9ohJvj+hajhWU4qbq58=
X-Received: by 2002:a05:622a:4cd:b0:4ee:1063:d0f3 with SMTP id
 d75a77b69052e-4ffb4a8df70mr25633731cf.11.1767795189107; 
 Wed, 07 Jan 2026 06:13:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBwq+C7m0bosWHj3HTwVxZmMkUGfTBcl5hp78f4iYACKooL8OU/CX/+Ny3sPLi5gByEeejsQ==
X-Received: by 2002:a05:622a:4cd:b0:4ee:1063:d0f3 with SMTP id
 d75a77b69052e-4ffb4a8df70mr25632931cf.11.1767795188359; 
 Wed, 07 Jan 2026 06:13:08 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507bf6d89csm4659986a12.35.2026.01.07.06.13.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 06:13:07 -0800 (PST)
Message-ID: <db0ee006-44bb-4587-b4d5-3f767cedc3cc@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 15:13:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: msm8953-xiaomi-daisy: fix backlight
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
References: <20260107-pmi8950-wled-v1-0-5e52f5caa39c@mainlining.org>
 <20260107-pmi8950-wled-v1-5-5e52f5caa39c@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260107-pmi8950-wled-v1-5-5e52f5caa39c@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: C2f2XWY46ZXMCKvN87yl4b8ycHrz2b4c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEwOSBTYWx0ZWRfX73pcLXJiKP3n
 Lpe7mhk9Ypke+1Gy6PIorW/lOqpChXFCST1f+EEIA3VkjmaaR0spDksm/efBRTuL/sxYM/ca7CD
 WJVQhwq/dSgtXRzp1nNE9+A9nEH57Wvt4Thzbrr6qoJy5rU07fRQtqubp5oCX5z8I+eAu5pzIkY
 ZwcqEuBhXiKQ8JUHMmEdxM96ayl+4Y5M1Wy+WG0aNtVYJgrM2pJrKsWQ456xX6EWcUt8dcivP8v
 nLiSOsl36POXtoS220vcVhuSRQOhnwe58FrNTvLfvQ+6OLg3rAYj5E79KYkpSGi+H8ZcEe4kLBe
 bnM6dOczkytlPzs/O7peh7nK+7j7mK5nx96cwxrZ0D3JHcxgKilZVOekgbXt45vNBnOsexL7Kzm
 7dI36De4nTbbcG3qO4QXequLie+qVw3WY0kUPvR+guvNW3srIiZnFj5VT13KFc6dwag75r+5chd
 qUJe5J+wrs2ZEaV85gw==
X-Authority-Analysis: v=2.4 cv=Pa7yRyhd c=1 sm=1 tr=0 ts=695e69f5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=tgJsgVuRmq43osI8c0oA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: C2f2XWY46ZXMCKvN87yl4b8ycHrz2b4c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070109
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

On 1/7/26 2:31 PM, Barnabás Czémán wrote:
> Set qcom,num-strings to 3 instead of 2 for avoid stripes.

"""
The backlight on this device is connected via 3 strings. Currently,
the DT claims only two are present, which results in visible stripes
on the display (since every third backlight string remains unconfigured).

Fix the number of strings to avoid that
"""

Konrad

> 
> Fixes: 38d779c26395 ("arm64: dts: qcom: msm8953: Add device tree for Xiaomi Mi A2 Lite")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts
> index ddd7af616794..59f873a06e4d 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts
> @@ -157,7 +157,7 @@ &pm8953_resin {
>  
>  &pmi8950_wled {
>  	qcom,current-limit-microamp = <20000>;
> -	qcom,num-strings = <2>;
> +	qcom,num-strings = <3>;
>  
>  	status = "okay";
>  };
> 
