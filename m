Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A927D01ACB
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 09:55:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F5310E6A7;
	Thu,  8 Jan 2026 08:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="J6el5agI";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DOrFtsrE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E1E10E6A7
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 08:55:45 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6087VbUp1838799
 for <dri-devel@lists.freedesktop.org>; Thu, 8 Jan 2026 08:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 F+LUBAWmsVKlASWBuram6zTfQJk0Q97+yOU2s3t9Be4=; b=J6el5agIdb0Tv0H6
 AweZ0W4e0nDdcw6KClr0kxkxvvWoaHjpy6kcoeFZjAHksZ9JORlHI33VBmUyiXNZ
 acCvd8okWKfonyTboawiXCvDBQ3lCF2mozB9amhs1tXGSSj0mL40Y9bQ/h7QpYHL
 G5rPr4mqfumhYo/0MT5F5bk0F0fCImunLaedL4Ee8PjE9acJ7ECMNmCuOZ6D5KLO
 OL0R5DffkJuXu4g34WsFaS54u5+QfEp3D06xvlf9ivL6kg6L2ciT8yXNQmvk/BJm
 NzDNTqR7Vkscyqu/t2R8AEJEWZ+XyabSlRussylCI5FbIuJJRupxtmDuUnYzEEVD
 Hmmyqg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj89207py-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 08:55:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ffc6560f05so252871cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 00:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767862544; x=1768467344;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F+LUBAWmsVKlASWBuram6zTfQJk0Q97+yOU2s3t9Be4=;
 b=DOrFtsrEWEIWmGWPGWdKudOZttr7kl2h4ClR67ir8rkLKyEfG/X3f05YCgggUO0yo1
 6m8FvMncjDCypXu8x2R0lkfgXOpfMn36vFxbGb9C6rV+qr9q40M9wRz/GFfOmlS1hJ4+
 kQjqrRddkakU+GqSqGEkKhzG9o7QVGvDCRKSO/p8mVE4lGp9p7o91myo4upa1AECdzWV
 RidH3jFXmGxlWOXVURmdM1jHJILAdasQZe2+QAPUZj/hC9yenNs3uhaHUlfrYzpUDZfP
 AWTlaOHfrQd/t9/PkHCjEMxgje+XYWln/MPa661i8XsHIHhsFGRugKT/JuYQaO8xx+sv
 +sHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767862544; x=1768467344;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F+LUBAWmsVKlASWBuram6zTfQJk0Q97+yOU2s3t9Be4=;
 b=XlJDLVNNPqPEVy8114RatWAxzOrHMn1j9YANGI8DU2iU1UINkqUxBdsz6OvnJxEtrc
 4YjuQV+HhfgqsKsrCIzzXnoXrmoagHN6/w6gZhpj7W8xnkjPWDyUmwr/rAke6vpSwv4J
 uP8CovrNYfmpvCAEUpf1DtLZOrNgS0hgadbMAeDP9ANf2YqsX/1dIbdR7IFx1KfUnHbw
 EP1P9g4IpX0GVWnmmgx0pCCXuXbsSeC1681uooVj6YwxHuI0V0OHI0HDRoNaNbBPNQxm
 HbyGYjCUA/9KHbN8vc9EHq+zquxK3qTo87oBJh1BqPO+WizGMfqP9G/QET9vRZdnkRP1
 iGog==
X-Gm-Message-State: AOJu0YwNLbJRAlwyVnZF4YdQZSYSM8oCzwk+0zwon+UVRuLUEpAlDWt3
 TbDJw3qPI7b3x0Pvp1I8MSk+euimyDGnMszhCJGKSnHMkybqp0m8baVKTAqBcAPXNIxHAAOh311
 Uk1JZm6Gzw87oUC4xj8n07MmahwLKWbfUFNlN+CFHVn7aSJsZfuS8MlI3SLI0KAh8jyBqn6M=
X-Gm-Gg: AY/fxX5fqpdg9ooUMb+zdR12O5o7eauMe1XebH4VfZ7u2Avo3wv59HGVyjqyN3+jjE9
 L/LmF9/jX5uqY/wyl4oQeF1y886XitJz/4mG2nSMHKONWU+MJEIAgIzZjCwIEXh/KHRIokLuDRx
 tK4sgeG68qtJqXUnmggXmrzB4oxFeB2RdMy4OiBzge4RzWiwfHkaDUWoUU9V1uI9HQagE0113jy
 +kP7mVbFP9UqLSxxpkG+ItPdLeo4hb7AJ8NVnpEfjRH6IOZigGAobjIQRHgrwTvLHcYgUG4a6V3
 421XguXWeBl6Gd0kRdWDguCRmh727xttL+NTa3ly7UCMfTZvRrLv/t23nyQ/0hVa0h9XupP+3ox
 kypIBSW8yK0WMz4q3ZzNTsnb8bhRnoKf8e40mvmcN0E+zNGEohOwse0HuvIHTaxtZ6D4=
X-Received: by 2002:a05:622a:2cb:b0:4f1:b580:fba8 with SMTP id
 d75a77b69052e-4ffb48d3b42mr58398651cf.3.1767862543705; 
 Thu, 08 Jan 2026 00:55:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9Lv86d+HKglAfIaITF0v/1w20K9Yw1Cy6aKrCbkHCUfrjyUTzhk3wIiJr3LYFJQaOUvw//A==
X-Received: by 2002:a05:622a:2cb:b0:4f1:b580:fba8 with SMTP id
 d75a77b69052e-4ffb48d3b42mr58398381cf.3.1767862543327; 
 Thu, 08 Jan 2026 00:55:43 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8429fdf4e7sm780584966b.0.2026.01.08.00.55.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 00:55:42 -0800 (PST)
Message-ID: <736c8986-7adf-446e-9720-c4a71272825b@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 09:55:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] backlight: qcom-wled: Support ovp values for
 PMI8994
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
 <20260108-pmi8950-wled-v2-2-8687f23147d7@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108-pmi8950-wled-v2-2-8687f23147d7@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M45A6iws c=1 sm=1 tr=0 ts=695f7110 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8
 a=GYwjzM_fwieWSpg0kukA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: s5exnkww2_XXaD0YF5Regq1v4uXmbXvj
X-Proofpoint-GUID: s5exnkww2_XXaD0YF5Regq1v4uXmbXvj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfX/0oAiz79IMyh
 3EkdLTevM001LNTyXUMiFjF0MUEfO1xaQZlp9G3rt+1dHfQ8FhOQjxVfsb7i4Y6bUb0SmFP0gL8
 VN/i7OYasHPPCvecY35/b2MiLFOBzrEqPcBN1l5KYe5orGIeIQl1QPslFC1DtFeI7VIZ9rILT6b
 VCguv8qa0KJU5V0NFe5UpfG+RjCm1Si+bV3bnFdDuu1QMffEsaDAVnQMX2DSw1PBxuzeFIP+ytW
 zqfAmjHWyVadaFUZm7KX+sZ8eLGvMuvLdOtnjUVc9qp2AnjC1j9Sau4xwqNZJ1HCRgAAiJ0/4Ll
 FiB4FrQkVaA700Ob93bQBd98nyde5e9mYj7Ultotxvkyj1g+yPLDhZHgJeTLrDL87cBNAQXp0fP
 DLPzEEhtRkBBaalK/keOSidUBWj5UpJcMQFcDjyHzHDuNpAD9A2QDxIHZVC44L+g7VqBRpdgTlx
 8n6K478+lIKAL+Yzosg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080059
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
> WLED4 found in PMI8994 supports different ovp values.
> 
> Fixes: 6fc632d3e3e0 ("video: backlight: qcom-wled: Add PMI8994 compatible")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Likewise, I reviewed a version that said PMI8950 instead.

Konrad
