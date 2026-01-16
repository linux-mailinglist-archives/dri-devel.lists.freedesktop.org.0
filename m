Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E263D2F435
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 11:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF14910E84F;
	Fri, 16 Jan 2026 10:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="m5BoFwLH";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DzIVnYC3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE60310E84F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 10:07:49 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60G8ZUJ11240933
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 10:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UQ3ilnfqSmvB3xC+tWrAFzcEml+l5XRFMGFEeRLo+JQ=; b=m5BoFwLHbwluIwbt
 ZJVAz7qbrmQSCyPOYNS79oJpdAp90QJSj1EUas0fdv5P/mk2nOJf5X6hzpAxx1Xa
 0suPQEXrZNAZyv4G/OcQP22fzdw982ay3r1PV/fbnNoP5EIkWvxPJ9WHJT0LTDSm
 OIQFzqMGP9q1NzgXqgERRpTT6Ixe7LET5gBVeBdn1uSfKQYI+CpAgcjcfAzvdd41
 PdI/dD+JWu1LTWRuwGcyfABsMUiDonKam+FL571wc9y656mTALv8bWES/XS01le8
 933vsSJ7MmamMqA+Yv7+yNilGDnbH8NwcvlPxyBfpBL96EO3Gt72rh/lv5oFNmlt
 b9Nuyg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96ssqee-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 10:07:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c69fd0a87bso93974585a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 02:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768558068; x=1769162868;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UQ3ilnfqSmvB3xC+tWrAFzcEml+l5XRFMGFEeRLo+JQ=;
 b=DzIVnYC3Bl923V2u/ngAFNU+Pf5ykaEwDQ4zQNv0ojRNn1KbAKtHb8GV/cXC+yaqSn
 r6/Lu14kpz01fbRW2HAsZiX9R7T1WkeLAF8KI3n/Cqbg1J6aEJ/ZFHRRu5Cb+7PMEpAI
 Ki+WwYdLwKaCg6InAPaXOvfVYZaCmG6cfPxv9GaCWJQ00TJZzigDtqR0xE3tWEMBtwP6
 n5xpofpnROWIFUEYQpg8mrFEZUVw06CB+1BHjuWQ6JESkhfzfSObPZtPyyKbZv0f0cnk
 Rr8qU3yDcRzWUCIQOfwyp1IVZbAz2OmblxM9bnk1VweGI3oJ9xlprrEPzGz4lhMc16Ie
 Pijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768558068; x=1769162868;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UQ3ilnfqSmvB3xC+tWrAFzcEml+l5XRFMGFEeRLo+JQ=;
 b=lNGdM7N7vybvUJHOVHlMWZ+jYdBava9iFPmpLojJ3O0Sr5MmZ4LmJHY7OE//6ya9zI
 LK0ggrdULU2y0pC3xC4JxAQBTSi5BttqZApyez1GYue4OfGRbm5lKUECMELJyPrXxphx
 qdrkcKcXq6fcmOKdKVVUlwDrwtpnAwARAA6i5befnyffuwcDkkrSmgl/gjM2tECVJJ4G
 QqRGtEQUy4gTbIaq+yByyKsO4z5eYvd4Qrrzo19Dvvf7V2yHgmkvozszgzcWIfEyJKve
 FVBrcyv4pBYHLkQV4r3/jr82LiHbyTBAbYpdQkBFCg1yCAZTmTVaERPaohCZIgKaJKcB
 kzSA==
X-Gm-Message-State: AOJu0YwP1V2KrEmsu3DMvyOW7c0cr3XWpUK+TiU0rZjloFi0hweEzMtW
 T8PUJQfSGLfninUZqXICs1t2FLGdCFHi0FDJ4r/wmqcRyxIbyWVMvnW4LIZrq9exS8iFJwuntPO
 Tdmfd3V6145ZSXsvJDsTGfFiqYm9abBewDA3DyXBjDm5TyHbTu3eiuVo9VpNWovxv5Sm14Hs=
X-Gm-Gg: AY/fxX6OTIoWBBcf7A/kjDY+HOhZoT49Fq+4gHJmCxXtGMOy+GjwPPGEFssy+6cSDGa
 5eLyXZIwHAkpy/b3H0pB/u5IKJYnlbYVdCodBqtx8oWm5EtT78M3fE3kq6rydzh429zTrZ0KYzV
 hTfgeoyPMyfW6gaHlWe/b9QQ4SuYobSUbal/La8VSrFm6oqmB6eIDXOSKuZIfZNjpZubEGy1N2s
 MLwL4D0XZ4VD5/QBvNttCyarJNh3CynMMHt+kjZa2ZPRBsdBaEp/vDWNs5osB8T+voks1GflCgw
 NVKg7B1lBiF3LkFmkotyR61gxc7T+Fv5bMCAcF3akgADUIBM58JSSXoGsSLT+fWCPdHE0jqeoYp
 hwrM86AdY4cAHFg+ojWTXElGPRT2t4Er2bEoT/A8cQMGHjtlXJPEKy3HRDXtaVHT90bA=
X-Received: by 2002:ac8:7fc8:0:b0:501:4ba0:e06a with SMTP id
 d75a77b69052e-502a165ca89mr27196381cf.8.1768558068514; 
 Fri, 16 Jan 2026 02:07:48 -0800 (PST)
X-Received: by 2002:ac8:7fc8:0:b0:501:4ba0:e06a with SMTP id
 d75a77b69052e-502a165ca89mr27196171cf.8.1768558068138; 
 Fri, 16 Jan 2026 02:07:48 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8795a350dbsm191564966b.69.2026.01.16.02.07.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jan 2026 02:07:47 -0800 (PST)
Message-ID: <1fadb442-31da-4b48-8730-5f6cf5229600@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 11:07:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] arm64: dts: qcom: msm8937-xiaomi-land: correct
 wled ovp value
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
 <20260116-pmi8950-wled-v3-6-e6c93de84079@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-pmi8950-wled-v3-6-e6c93de84079@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vskwGbw2L0NU94uKmL8y-kMcr6jcoUos
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3NSBTYWx0ZWRfX9cX8FiycIuDl
 stEQAYTIak1RLlElQzGRvBqoD+3ul7SdwCxQtW8/8yWgxHuvEH/pQJUL3qmFs6fmQVWOLTloppw
 44x7ndw/Wb6LORIsWQSvQgZ4s9b7VVjHMLm7Nsg3eIXJN29M967tkCiLFngVQHfG9rdunqTGUuM
 9ekM5GIT+E54G9VOLmVJjxTGprXY4S42M9/jDIoV+0O0eR6pquK2ORH2j5Ilf7TxeX6USNaMKOG
 qKbbBCo7dfpYrxalwfvJP6P1yKK6W9H2cooJ7vV7f3/5v64l7llsOQ7ETap9osTFJTt1O3pkM8j
 h2rQGvL1gRDnX1VUY/q+bcXJ9LiMLeZ4kahUUPZX7wbcJYskklWv9iFhf/7B2QgeF3Hi6L4baCp
 GBOsbv9umjF7Naqs8rWpYjV/Auy80X9tB3eUrQ7bXv2wsuRcqhdY4Zqr/NyHyub9GLBDvbZKMk9
 fjmo+Skuz5FD3x9zAIw==
X-Proofpoint-GUID: vskwGbw2L0NU94uKmL8y-kMcr6jcoUos
X-Authority-Analysis: v=2.4 cv=M9tA6iws c=1 sm=1 tr=0 ts=696a0df5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=ECzvPIt7qBxGGsi-YOkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160075
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
> PMI8950 doesn't actually support setting an OVP threshold value of
> 29.6 V. The closest allowed value is 29.5 V. Set that instead.
> 
> Fixes: 2144f6d57d8e ("arm64: dts: qcom: Add Xiaomi Redmi 3S")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

