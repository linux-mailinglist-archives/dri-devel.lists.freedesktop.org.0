Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3407FD1D9A4
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 10:38:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9121F10E5E6;
	Wed, 14 Jan 2026 09:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JLzesBQl";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CWRajWEU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B9410E5E6
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 09:38:56 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60E7j9DD2497478
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 09:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HaaIfuet+WloNaLSPkAqR4z1R5fxpgk8RlbsTuisYMA=; b=JLzesBQlYUcf9Ggd
 pr7OxN+d21DBV4892AwsKQZ/j2eY7rkxmYgeEVwod0XuXJq/NTPnLsCcJaR+IRjV
 GGJ9Itb4jKAdpx8B2sEKaPrRIDFKvpkh0YQu6ns3mtQxuPngVNY20wmfYsDXwFKW
 Z7kL04sUU1Wv3uX7/aZLU3PQMjxtslYZ8eolgGgI7aQ/uVpOhZzbi1+3YU9VGq8k
 x9pma2MOwRi/KKL3UlBIO9MUUsGTbvzsdvImCaDokX080aRm+ZFUjlhZlUqMN9Bq
 4nkK3uiuRU2le7B7t88TMt4ZMOhnnQaSSSW41U2mIF0EuworIY3Id3XGL1IF37aB
 CfBwtQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp16x1qfc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 09:38:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c536c9d2f7so534585a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 01:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768383535; x=1768988335;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HaaIfuet+WloNaLSPkAqR4z1R5fxpgk8RlbsTuisYMA=;
 b=CWRajWEUEFj2nbkE1p5iWbwHWnalLoHeiyq0QQzC0LJ72abo8KvNy00VzEPyHDxlK3
 /pAPpGlK56L1LBx9U+DY/OQ1VQwek9po+8K2hRRZ+F43egxwqfxTjs0QZH+d6cwSaVCy
 IJZJqmw8aXOEyP4bzkehFh3ExuOHk7xewPjy2/6QrXeOyQ9/cbKJAsTm0mueocnYpvUW
 7asiBbdZtGWDe+4PyY6Vy4t9kLx5ed5hR0gq2K32Xd5G36qu9RBKpPeFzQdkjnlXeUWu
 jlp99MoM3sOPNWhCokW7wvEkzCS+CIl70vElVNAbOIzk0wzQJiBma5GwVcsq7Vm1867k
 dkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768383535; x=1768988335;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HaaIfuet+WloNaLSPkAqR4z1R5fxpgk8RlbsTuisYMA=;
 b=CAd0uy3y4fS4rJM2834Gr9rDf1JH7OnDwC6dnoTDYK/r6LwAI9vFAscbF3INehN3D5
 b+PYYnRv5YeoUq89qQ3HDvn2LNJlTngVN5Fiwg03EEl2Mja3cNzdfbysus/xU1DHG+GD
 V0cGfYtTKPydD10xW6UeULCkikFfU5gffzr+VBNrOPpXb93Rm11ya0FRB9M2xV475k4s
 htVWDHa2ZymBLafdlCst5+sce+je6y1Aa5idPThZ30j85tHB0lAbPOpIdklWJeLCf7Jz
 riP7XN7ewHMWLu7VAQqpPo8Y40hLQ/fAvU1Yy8mX8a6qdD4b153EmK2SQROqNPmYtCYt
 Ls1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN1x6WqkE3sz9n61jauoynPwfb1dnq5LbFFdIxEURCP14iPHcM02UWxNHenSW2+d9VX67YIny/r0o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4I5kNu8M4O5uKeLsfVfUYuviWyjmiiN0pYuYieoi2+cffs9N0
 2E81sOZ3GNYAewBpGUTREwptObnEb3a+NCbIrlMNPmop0SnLv/zqUbzE8HjMxKguelPM9iyqMC6
 wxMeW+V8e+WVIpBiHae5QkkQAGOmQp0mIsXTYqv0jKIJoIHVbHoGMySezmFQoLrCltBdaYws=
X-Gm-Gg: AY/fxX5vV9Xzck2VryQD3IlvtotNWTg4mXKRJeGcLpRvFsHCX8WHww9jRKE0MW9i8JJ
 7DPyjvfQOVo7+hrfuPI1GRfgQFMkj7Nl62S4rLEyJShs6470Hr8pu9JXDzxHD+atXQvkAt8kYCg
 cTygQfHIaxTvkxXhkHckGfg0cKVPQO/yV9OLutYLpoTlvxMviK3/J3fH6h77/k6pNU2/Kn5n5eo
 VhfeMwz/5aHLhlQ//+k+JRuDD42BocQnpmLVVsPUmm2mMs3IvGkRpV9yVlgt8af4o+evLqsJq6l
 LLnn0ULdcVG1K/TFLCmDmK4vKACKoyFkSDuoV1PPURGkWGVmYDoZp163uVYrC0axfArH1dcXCwT
 58LzYywnS0gKLlCPIhrWjKC7dO83Te6qTyZ7Ysk5vIHlaL8iYdWjFK4YM85BC1dr7Oho=
X-Received: by 2002:a05:620a:bc3:b0:8b9:fa81:5282 with SMTP id
 af79cd13be357-8c52fb16342mr214671885a.3.1768383535322; 
 Wed, 14 Jan 2026 01:38:55 -0800 (PST)
X-Received: by 2002:a05:620a:bc3:b0:8b9:fa81:5282 with SMTP id
 af79cd13be357-8c52fb16342mr214669185a.3.1768383534889; 
 Wed, 14 Jan 2026 01:38:54 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507b8c4c15sm22444115a12.4.2026.01.14.01.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 01:38:54 -0800 (PST)
Message-ID: <87699223-c2ab-4aa8-821b-aefe7d2c6b29@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 10:38:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] media: iris: retrieve UBWC platform configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
 <20260113-iris-ubwc-v2-3-4346a6ef07a9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-3-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: a8Jv2ogIg_0Kqdc4i2kIQrRkzbRRc9V7
X-Proofpoint-ORIG-GUID: a8Jv2ogIg_0Kqdc4i2kIQrRkzbRRc9V7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA3OCBTYWx0ZWRfX6PsyFlmdmYHh
 0HLvC4CbtVx3AY3fUCJokb/jNq7UmaGfSIJNXdcVCg9ItL2KBPpr4emtcLdDV5pQDXst9k82aE8
 IpDCCW39bimUYJpDeiJlNFVUa/Km0QkktrJCyDeY2YzWeN/TkoZDoutals8eOZ4vFwcY2J3z4wh
 22yEefmbxeMYmgbRvERIxJpLJFLLgI5P8d1aDY6JpSYnN0bgOx93zDtZY4LDxx2iZmNDtXQrIhg
 EYQD4/jBrvVHnipcdu0zpa6uqM1A75XGpf3JiHOzejDRz2XoulQvTON/ESPAYrCg+q4nYQoEfK+
 jWOhzZyPyFsXacDftnVusRFIAqlZOidSQF/60qx4pdr7krXQzsOFSbm2L2kmmW6NMOqE96XqJoh
 126xXx7tUo+U9y4FHzEpFOyFqvkn10gs1XIFeC+LJdZ6b0k/DXm1yAbbQc6WKwW29b2rAtQmI7h
 IGHTdik1b+VQ7UBpOFQ==
X-Authority-Analysis: v=2.4 cv=JvT8bc4C c=1 sm=1 tr=0 ts=69676430 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=cAxcSLUL-m0wKPm7p5wA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140078
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

On 1/13/26 5:57 PM, Dmitry Baryshkov wrote:
> Specifying UBWC data in each driver doesn't scale and is prone to
> errors. Request UBWC data from the central database in preparation to
> using it through the rest of the driver.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

