Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69954B0A892
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 18:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA1410EA12;
	Fri, 18 Jul 2025 16:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jh5w+yIQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5019310EA0A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 16:37:35 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8UNUJ016003
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 16:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6ZegwlQ32iOxl1i+QMZet/CdzL3ki4WTCIaMhmI6DoA=; b=jh5w+yIQ/PZJavnM
 t8UNy6oanuFBNUU67lLQmR94C2gMSxvSRl8qjlSntcQePRVL8Hl2Aul5vY4n2Lhr
 34gr6hK7wj6sDUGOMm/6IlvczcwH/D5fqq+1ozSDyLXYJjqLIR17UmI6lMucjB8t
 SZi8A0yWW/oZVDhXmEvIqAmmAQoFjrQoqnyc0lghq1DSm9iOZhO2NIsN5M2iWp8A
 3MN6zqA1rRGqrWnxvhWFpx/1MnXYfzAc33p9Bn8Jc5rpvVscDsC3jYELWwVcKnE0
 2o1h7ZGy6NoqlT5UYwx2079BxL3pY3bdk0EbOVG3NJQY+xYw9Nf9vKsHkVfK8PDj
 AEsX0w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyy7ec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 16:37:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3141f9ce4e2so3367920a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752856654; x=1753461454;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6ZegwlQ32iOxl1i+QMZet/CdzL3ki4WTCIaMhmI6DoA=;
 b=AySafFqIDydcav+xq2ULcZ/YZk27TRwtthPME8wPvsCzX07vNXReUgQ1GNgVJmA8sC
 4Ti6Eek10m/fwjWoQAAbuXE98XBQgnJf7H0/lxrAwh189QKVVN56vcbRyYrUH7QS4SjM
 oEYexvAWmjcePKO96uBTC3FOddAR3FW6FaDSM/l4lC7l1WxVGGfGWMKBaescqd9IHqG6
 vV+jqC43stRtrOqnMQJAm/xajru/LVCvCnvUjpFarfsEYR/xpzZ6O87xJIc5j2c+C6xV
 LWg8UbsZH0O57pUn8FomEGMgfvL7mTMF04pRrM2zkTQuDIp31TkPWlUolHDDWGEwCc6V
 Xj3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUE08RK92ujhf+1Oym6Sy7kZNOBKXJfP5hxr+nCy5gW5jH3etsO+XScV3KZmhxzK0vOrnXayHVgOwU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyamr8n6Px2ngmJJEbwDaULl+hy8UV7+ur7Ga1BERiSkQgeT7EW
 VijuCbz50X2aLEJvX4C5Ep8+LH6Wimolv9BgCegEq2QdnNCS3B8GZ5rzMKNFyW/fLKIlKEEWpkG
 8v/NYlRC1C2+Q/Tgayta142wXCbF6EHas85z62DozyC8gO8dJEFw9kzy5saylgySfv+nKbOw=
X-Gm-Gg: ASbGncv2amrtCcTKKtKP8RO3CbGIlp9Yg6d4B8XfQLB+72KikKOBoGZaYqhPRPIQCGE
 q9KYE+3EO2ucRB/vDhjHPDcOvtGypeIz+fZ0e0TZ7iV6bGNfXiZ91X/ESTYJtPQIhW3Xf+Zbihq
 F6rhtV9ViRDrJqNcPbJ2dnfvvES8LREE/aDxZ+2D3Sw3UJr3wE3iUMMvH7a3Tmkxv/zsXj/hyN0
 UAjiSNFsX4F4N8VLr5jJFjHBHe2Ui95xBKXFplk21zGvPSvVicCrnW08tPOlN5qqhpo/M0FEDiP
 gpZq/vBGsCEaxpqL1nbuwjG7OsXlo/rRdQZQzwLZOcI0vIdiwRzA1ee1iHd/ddqjYO2rfdrOjZG
 a1MJZDYtoWWeZ9aJJsJDeNQ==
X-Received: by 2002:a17:90b:2d81:b0:313:bf67:b354 with SMTP id
 98e67ed59e1d1-31c9f2a0103mr18430789a91.0.1752856653725; 
 Fri, 18 Jul 2025 09:37:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJSpYJWt9gcJBSv5M7yM4Tjn3hnjTMDiyr0xa8abdyvUZWBHlraaApCwJghcG7Ye9/EcQihg==
X-Received: by 2002:a17:90b:2d81:b0:313:bf67:b354 with SMTP id
 98e67ed59e1d1-31c9f2a0103mr18430722a91.0.1752856653333; 
 Fri, 18 Jul 2025 09:37:33 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cb5c5da0csm3170530a91.25.2025.07.18.09.37.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 09:37:32 -0700 (PDT)
Message-ID: <0261da76-a1fa-42ff-9941-4ce235a449d0@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 09:37:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: Add MST pixel streams for
 displayport
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Danila Tikhonov
 <danila@jiaxyga.com>, cros-qcom-dts-watchers@chromium.org
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250717-dp_mst_bindings-v3-5-72ce08285703@oss.qualcomm.com>
 <17ea4f08-daf0-406c-8760-23a23417ec1f@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <17ea4f08-daf0-406c-8760-23a23417ec1f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PUdvCjNeoqnRkcNe0QU0NgbuEekRJ5E0
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=687a784e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=Q06rUcgQto-sQqt8d9IA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzMCBTYWx0ZWRfX6ZYhdp9Wy6yB
 J7st3McxSkVBUUEuhDIrw01kl1wzTXtLRP4ep7z7RE+RiwPGfDHpBUSFIBT0zB0rk6MTmX0Kcb7
 RALnhefYkVwFGoDfbr63iDe+T3bOp468gK8iQRpXrxEgJk/puCehCb5tIeL6kVcj/fk1z5jQQiA
 1H5B2J+D929FXd0RfHDp+xpGCF0NQWyPuHpMgv4VEIlgcMnn751SYny0TNl2+1FajDiM+mpaazF
 wh8kk97mGvdGQEtEcQ+gTb0DWWnt+fzvF9WgWowKGWaYoruoeaoCE7Go4y/7kUhyvnpnd2mekIB
 CkKbaOgWE3rz+DCJvXca2oFRfVk6tt2wLb2EFBetvVvmhrWzYRa64G6dq59BPCjLPDp2yCWqL5G
 t81PqAoRj2qagcVJ2vANC7ePlTQVyX0cOWMT+g/3G82PS+XXNUd6xp7zR3o2f6JeL9z2dTWu
X-Proofpoint-GUID: PUdvCjNeoqnRkcNe0QU0NgbuEekRJ5E0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=760
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180130
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



On 7/18/2025 2:23 AM, Konrad Dybcio wrote:
> On 7/18/25 1:28 AM, Jessica Zhang wrote:
>> The following chipsets support 2 total pixel streams:
>>    - sa8775p (on mdss_dp1)
>>    - sc8180x
>>    - sc8280xp (mdss_dp0-2 only)
>>    - sm8150
>>    - sm8350
> 
> I think 8250 can do 2 streams too, no?

Hi Konrad,

Yes, 8250 supports 2x MST. I will include it in the commit message.

Thanks,

Jessica Zhang

> 
> sdm845/sm7150 also have the clocks for it FWIW, but that doesn't
> necessarily mean they're consumed
> 
> Konrad

