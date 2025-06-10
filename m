Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A41AD3B50
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 16:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1585E10E570;
	Tue, 10 Jun 2025 14:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tvc5Ue1N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F69810E570
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 14:39:11 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8plq7017883
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 14:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4pw5nq7+Bj/Ac4lWh78WSk34rnPTAijZmCV+DGEjR6Q=; b=Tvc5Ue1NTVvtqo8o
 yOpjgjwsKLep1BvG8wafzxNyght58u8GSohG6CRMXmhuL6zYsGegs7ft2BRQLHBU
 UAzcFNwkHxgCJGGe+KthukAfiuV8P15a/s1QHRKMirw0DtBGx6AJHONUhAcr2Fze
 awtmYShBqwXz8Ekn+iMnF0qhg7q3kP89FywP1GiBClsMTNm5Htw1aOQCnyFDh/oW
 Jzg/LIGAB49aCDdo4TcpT2dTJ2TPMufCIIxtWsyVGBScKTJmrhqHsW92e9/K0c79
 djQdNBuSJBtTjwQH7mbPSftwrWqO7mn4BsVMrgVSLlc9+7Gb91jI9kcR5V9XnDoN
 WlBQTg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4766mcjh7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 14:39:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4a517ff0ebdso15722191cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 07:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749566350; x=1750171150;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4pw5nq7+Bj/Ac4lWh78WSk34rnPTAijZmCV+DGEjR6Q=;
 b=NqjJX7vD+ISJE/kqU+US97PTUkAus2i+kd2g/i7cIYPA5OjWXwqzokm8mKa1PrRXGv
 wvUV9aqX81Gnn1v/eBjYhSilMwU5GzEyRsiS9gfnAJNcjxkPTWTi/+sU58vLcL/noXXU
 55qMqTLKBlRqz/XSXZiq/zVDKVF2Owvl9XbmTsQxnnKCsIUSktAGuu0LOkNnqGl06s9N
 UjBCwV92H0pf5czRl6o6H9xvgmAufgDS5RwyZjipVZvk3wQyL3IfhwiOEMQGu/spDDFg
 VloJpIBTUylnlqGntVzSCOxk9C9HCF4wo23FbC1ryOTiX4wrjSFhMw36nfHA7e19ufjS
 nbgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7QskEOY8cA9iTxI+l5gXZFr/ULazJw/9o2cH07UaEBG9B8CdevYMbZ+omwqRMjBaQ+R4ILrZeOZw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIQmyzMDJXw+Zc4S+k2hpJZxiWnlfcgBrQL6roPGUw0eLdTtIi
 0d1cYDYiirM96ts9twOoG3Cfbfun8ofh8Q+ab3FCJ1iXjwC67tcDiNrj0EJ8fzG9gYgNIC4xVnK
 GChF+Joo1jzaWDrARDdb0Q9FealomLMa8dXisVuPGsYx/hvWEMuBNduC3arluQefS02MK2sQ=
X-Gm-Gg: ASbGncsEYsNBhfbclZJku4GXYORK5z3J3IQe8xTs6gk6TNtHaLUak8qLe3RR1Fc46y8
 xGsyOlQ1HRIEzqqX2qtYro7pCvNZ8EfdcfJxr1OtmOVh/NaqVnr+bh3uCwhqCC+ARbkIYBdBdp9
 xro2ugxpnj5GN6aK6/4PMoZXNsYWH0pXks8R+PMyXL4ceEAdzNuya/OPptZN0BFVtw031xK+GDJ
 xY+FuXbXT+DnAZ2KLzbbbD4GkTX3TnECYuxw+93q4Ef4u9of/gCD8WHDcbvxrb1Ahkn5Kdji16L
 V3LzKobmDisz8zlKHbLlOX/spoIoZ/+kSHEbzpxIkcyohLxNlVkK1wtANTBWIxLuGsiijtXNKr2
 v
X-Received: by 2002:ac8:5a0d:0:b0:494:5984:1022 with SMTP id
 d75a77b69052e-4a6690a28dfmr95786561cf.11.1749566349768; 
 Tue, 10 Jun 2025 07:39:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGouqX7qoKwblwHdCsP8sXYcazh4DdthTicdnTn7xgesyInCIp3oCS88Mi1046CwU/GY9svig==
X-Received: by 2002:ac8:5a0d:0:b0:494:5984:1022 with SMTP id
 d75a77b69052e-4a6690a28dfmr95786261cf.11.1749566349310; 
 Tue, 10 Jun 2025 07:39:09 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1db55b68sm738346266b.59.2025.06.10.07.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 07:39:08 -0700 (PDT)
Message-ID: <1b26fd75-f316-4cbd-b60b-6b3496551314@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 16:39:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add GPU support to X1P42100 SoC
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-3-a8ea80f3b18b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250607-x1p-adreno-v1-3-a8ea80f3b18b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T8KMT+KQ c=1 sm=1 tr=0 ts=6848438e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=nNJ8jBrhinZ9UXkNAM4A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: SkH8YrYghib_uGOV7n_7PHynA11CQQoU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDExNiBTYWx0ZWRfX9lLQdkGbszk5
 3SPRrXolx1ojxXM7W25qlSYwznNk/zg1renJSi2rYdPVDBpWAEAn9seW7pgVtqwMShhzeI5llRq
 rn79cW8XZqbsU9BMPTUn5atmIPlQan1Tkm31zFEO4wXeQ2dDYfEeyLk+xDHheErA8+bDoy7JAWa
 wyvnrpqkAvmciExlbUPiqHGkRFD8B7A25SsF1kwVL3wK6ehVxGOPR88/f9zgGuI+rVntnnGfLcX
 qJhNmNYGZaqfQFnJXjZv3XelbcCkXOa5OBsVErZYpOJwUXVTdahk9oDB0Sh04+Q0Ff4werEhD6t
 BljusK8rPKE3Ww5xbXI/yvF2VVbCqOkXZ+d+Lb9R7D8LM6Z75LWlQMu2lXUNkC1EEbUuRflguvV
 8KBnnEneQLpYL6m8sxwZBh10rrnVTfhWdakOaUgV6A3GuCY0OrnK2/8UK1u6+t6mG20WDMO8
X-Proofpoint-GUID: SkH8YrYghib_uGOV7n_7PHynA11CQQoU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 phishscore=0
 mlxlogscore=906 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100116
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

On 6/7/25 4:15 PM, Akhil P Oommen wrote:
> X1P42100 SoC has a new GPU called Adreno X1-45 which is a smaller
> version of Adreno X1-85 GPU. Describe this new GPU and also add
> the secure gpu firmware path that should used for X1P42100 CRD.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> -/* The GPU is physically different and will be brought up later */
> +&gmu {
> +	/delete-property/ compatible;
> +	compatible = "qcom,adreno-gmu-x145.0", "qcom,adreno-gmu";
> +};
> +
> +&qfprom {
> +	gpu_speed_bin: gpu_speed_bin@119 {
> +		reg = <0x119 0x2>;
> +		bits = <7 9>;
> +	};
> +};

Please sort the label references alpabetically

> +
>  &gpu {

Konrad
