Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E439C7D21E
	for <lists+dri-devel@lfdr.de>; Sat, 22 Nov 2025 15:03:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F4010E09B;
	Sat, 22 Nov 2025 14:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jSGZukAH";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R60xNboB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 235CF10E09B
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 14:03:16 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AMCcA4Q2445545
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 14:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZFv6aFk1IpQWO3F93NnlDY2gTDZSprI4dUGFyCQW5uQ=; b=jSGZukAHy463Vhtz
 N2Cg7cwvUe1eOdUYmEy3Bv89afj0kk6Gn7C5p7Ws9udeVH7iaqY9DdFL9UFfIpYK
 xhZWRBV2WqifTX3URkRXdQnw/4rz3ItJV/XEtrN4s/eGEguSOsToVNTXGSXtxH0r
 56UAT1J3EatoYkky2qLmaHFe7wtsJYPX7a/q9jfc1YHX0F1VhlegMEbNmefRzMc1
 cJGtxrg51Zn4dn5hKvU00E3aZURXcPriLPAy294tU6EpBqY0i063HWpFA5tU+bWF
 X5qasBMoXVpYVawZZhZhJcftEa4l/DGVMSpS3z1eQFmfSWL1oDN+wzGdcHGyD8fr
 qhU/7w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak694rrkw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 14:03:15 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-5de05befb05so64439137.0
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 06:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763820195; x=1764424995;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZFv6aFk1IpQWO3F93NnlDY2gTDZSprI4dUGFyCQW5uQ=;
 b=R60xNboB5mxo8uwr/Xz1pl/HER2Asn2DymgyCtrUlAmVHvvZ83UPSG6wAqqh8YkAbF
 SXu20q3jlxi5vKvxy4LGEUMrKa8Pmub8M/9CbQjpUZ1fzGxWdu1omgI5hw9X7a+s5J8S
 v+No1NwIwmnnzcT9iMjNRvzKbzCisKbr6umS0Kp8J/P9adkm4pXCJaZY9/ptYBTrD6ET
 s0cIyVxxGoMddCb0LnL9a6a6oV/7s2sgBjrfiVD7re0vMI/Ok5dXz45YbG3KngpMZA/7
 rElEW35vUD+quq3/4KVdHIw2RjItRmcvRccxLyxtCSB39eTgcJueIFCQV4FBEQ4LHrrw
 uUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763820195; x=1764424995;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZFv6aFk1IpQWO3F93NnlDY2gTDZSprI4dUGFyCQW5uQ=;
 b=MA28/89RRO7dYVrNyiGaqgFyam8kqP9to2a0Z962KzLGWVxj1xwbI0Pgu4gyJFMNfG
 B7tIk09TTOkvKG8Lv6JaVXMDaWEbqYeE6bO+T4ZlKCSQ726dzSs/K0/CGbY0kEHLgAbi
 liPgW6by5nou4RmeVtZkMwwHX894y0aVT1/HHoQQjFbCK/oM2/bj24EZdQIP+OZLC2P4
 IWvbAt1ldNUZ4Ugp8u5qd78PBoogk8ImDSg0D8Mxd5MwhI1D4QVi3oKZoaQe+QDhL2b3
 Iu3PfZdkGbrg3EiJQ06SR6b2J+t+t0/CslvMw286FQBUIHngi0wbvoByPTjNlI+m1YeQ
 bwjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/+kByEjqiv2ijB5JRQRDCZ43pSMV6xatjhCdDwFo7df8oXvztq5i2EMCZlYh7eTUsSchoM3cKFwU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoSCPB7ANJu8L05FhCQf1xXAh7ivt1J0VyNmfaYG0frSxKBZe8
 MW9AtvwKtxw/9mJV3V7e8I01NdOtGyse5dT78tOcfctQQznouICXpu7GQsg2M0SugpvwA1xyU3m
 2sN5at81+elwvZt178P/umCjxoJn26sJl5VzkN0T3O0+67dca56kNVxLWlIHY/ebm0w5AaIk=
X-Gm-Gg: ASbGnct4GdT9rfqpKDH+IUC6mjmeTjBBSYHznGiUzB68NzC9Ji9NmwNzDosB6oLiXTN
 vPTHg6BJkLYdmUPOBM7oXwloKrqU0sRR+yM7R/qzr3/HIw79eGSVQgqG/4mkWrCwpOAgfDNa3mj
 G3TBh0Ax5g4LMmsXDSsgjPjXtESXxImlVovw+p+GfFtaHFjh+DQR8nVjIwc3Vxfk5txmGjKAX7r
 tVUXnKD7hDhEO6vSB4xmYGkI/vhNDbA0qYBkppKjsQC4o3T4IU+1Dm/E1ZOTdntR+5AK93CLmcr
 GygPj3OYoIt/swIGn+N/n6IFwxvcW+/0ZGIwuT+YDlVfjd5jWOXYH9tpYQELjR+wBPWZr+vlvpb
 oGFk8w+B37AvGzR45vclXG8beNjC66hpkfx41WPviOXhy4ZjfbBc2lmmTKAebwoh4Hg0=
X-Received: by 2002:a05:6102:f07:b0:5d5:dcc1:3bb1 with SMTP id
 ada2fe7eead31-5e1e6ab5701mr905531137.7.1763820194463; 
 Sat, 22 Nov 2025 06:03:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOa5oUdJ8Eo4PVOAHiaccaEv2w3avq9wi2Hvan5TZ2E3W36cwP0a8YCtGpXcrKuWHN8TVK2w==
X-Received: by 2002:a05:6102:f07:b0:5d5:dcc1:3bb1 with SMTP id
 ada2fe7eead31-5e1e6ab5701mr905500137.7.1763820193999; 
 Sat, 22 Nov 2025 06:03:13 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654d502fasm726258966b.17.2025.11.22.06.03.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Nov 2025 06:03:13 -0800 (PST)
Message-ID: <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 15:03:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDExNSBTYWx0ZWRfX0jcPWis25wrw
 s49ABf9r0lXVTYevArcWnKjvdDrbUSkm666vMCyc+ySQ6lEW4f1uMNlIZ1dT8T4Ok0U67vZABko
 9KTEN84J3MX2m5ECBDSmd1eMEbi9ACm8rvYITPrGCLf0l3S328pRwiQIDWq2RRStyHHUdqP+OwG
 UgMKbfPwd10kMEK6uDpmL1VApzKkhBRn3EVX0NwHzLzzDK4K6Q7pG0bMl+sTE4OgAZ4enbV0B2x
 hX9GxRcZ6S+u/AQraTFSMLJnGl0Bg4DyXeh7LIetAOS06G15bLy8257JQJZItOqlwgP5fdqQJ/V
 3tp6Qgrt2EtUlRoSEGtvmw18dE/j36hFdEPfXgj/h7Ct8EGFunUfgSrnVAqNGaZi3GFYNYivbig
 XVSgD5jBN8RoQjHk4O2Kl9ZoEGK8Zg==
X-Authority-Analysis: v=2.4 cv=YJqSCBGx c=1 sm=1 tr=0 ts=6921c2a3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=K5gqOp28Iz7Nk40COgAA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: V3wTsgJ2-5GZjL6Y9jRVCtgnccaCJqjc
X-Proofpoint-ORIG-GUID: V3wTsgJ2-5GZjL6Y9jRVCtgnccaCJqjc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220115
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

On 11/21/25 10:52 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and rgmu nodes for qcs615 chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-845000000 {
> +					opp-hz = /bits/ 64 <845000000>;
> +					required-opps = <&rpmhpd_opp_turbo>;
> +					opp-peak-kBps = <7050000>;
> +				};

I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
or mobile parts specifically?

[...]

> +
> +				opp-745000000 {
> +					opp-hz = /bits/ 64 <745000000>;
> +					required-opps = <&rpmhpd_opp_nom_l1>;
> +					opp-peak-kBps = <6075000>;
> +				};
> +
> +				opp-650000000 {
> +					opp-hz = /bits/ 64 <650000000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +					opp-peak-kBps = <5287500>;
> +				};

Here the freq map says 700 MHz

> +				opp-500000000 {
> +					opp-hz = /bits/ 64 <500000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +					opp-peak-kBps = <3975000>;
> +				};

550

Konrad
