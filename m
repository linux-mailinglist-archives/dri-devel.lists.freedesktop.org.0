Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 549EEA91A35
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 13:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A005C10EAB5;
	Thu, 17 Apr 2025 11:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="adcDkBd6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DB310EAB5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 11:12:57 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5lG25007060
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 11:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qxLfze/zTU8C+QNrMs305310NbgxbagwueNtXuKqL/E=; b=adcDkBd6wQd9KwXu
 Y5qcUyfKvzgCP77H6O5zK0SV93bKBEX5htjINmUWG/bw9UlxjHHMf1diagE82Jl+
 nzmjGhh4kFl1k7kNcMa1PoD7Ep3nos1gibHRpcBjOztQSAKz3iT2SXW6ebuCwVxO
 4i6d6K8fuAERCOiGwVYnJa4+QoRJCLd/aGFnaoQx267Dvyqercxlb5PsZlWC6r9R
 16fND/5wGGvmnZ1sIFuJS81Ai6iYr3MO8tJyPcfiPd3JfZq9E0+c1d5qRRQWrBef
 qxnTBx/crw9bXR+CCdw51hD/5G68rnzn/9ygQ24oemKZ7nbFx754P58AIIR7jRU/
 JegZiw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs1ejt2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 11:12:56 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6ead1d6fd54so764126d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 04:12:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744888376; x=1745493176;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qxLfze/zTU8C+QNrMs305310NbgxbagwueNtXuKqL/E=;
 b=sfhUx4EU3EPHIDEMWzOv63pdbd9VmhUgji3W462CGOQDlk7C8Rn+xhFsM/FahTItKz
 5alse0/3oL3yTNCeiztvDAjP14az2c74GE+3fOfRRu7FOKxvuMfOfE0Ze+Z/02CboXdv
 6EZbpwgvhyYuoXtwlQgFduyspih9L5rlV6mMFzD9AJD8CuZ/gUJr2YC0aerfPAlmMIMP
 7WIlNpvxkLuGkckFOYbXKqF9xnmN3YODMt4mnAsCgwVpc/wKuDTC3M71gZSzTnXdiBx4
 cgZJfvwLrrX8MuryaLvIBms8GZbKLzEPNM7OzdYssxW6M29BM9npfH8dCihagXJpIEe4
 2pGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUCqw/yX/OPT/Enym4+ixfA9YuDGMCb0l/XIxic8mIUQ61wRgd8pVY2jdSdJ7GUit7Yjm4+XOd3ns=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxpn/cuM9SnQH5tX8FE9ipTUILtq/D4Vl/81Dha+zq9uwB0ffo5
 elVtwfYsI4fFB6F1Lk1t77/Y7K/j/LIb01UZL4XwQNWjTcPdbkXShgVgBsaq4ufXPPCzaskDteQ
 lZ2m00zhyUGEwRr1GGNTxU2ay4P9cwEUtY6QXiG6bfWQrHjLM5XJWfLyRWdIXCYw/S5k=
X-Gm-Gg: ASbGncsi1ehm1v53+4dy9vh/TiOX+8LSVkU1kUw0cOGwoHlIv7cCkPLDubVpRkF0aIf
 ieNbjC1Z00vj2sXOm8I8moiGBlE7ElwCffNBGKyQH6FVZAn3HeAhd4hzc4cllL+BTyzMfnK9j/N
 xlmNwkD0jY1e0kG2Sz0dSkQCH7tu97BTYznFG1YMiIMwqOpt3lTjI9oMfgkX8OCikq7JTs/6EYK
 Nsiut0Rp7GC86UEdtiuzzFBdd5vg79q5w6cSz2a0pj9/2wlKnkstC/Z7x/wU0RZtdyNabh20vfF
 fUuJZItCRFZaq9Tz0XuDFhgcO6mENluDj/AqQURQ/r4uPRvMCty0yymitjvpPbdNyg==
X-Received: by 2002:a05:622a:19a0:b0:474:e7de:8595 with SMTP id
 d75a77b69052e-47ad8159564mr27695181cf.14.1744888375730; 
 Thu, 17 Apr 2025 04:12:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPBxjpffnmkirnLBBB0Y2hOG9UcPArMHvszmAnlUI030yse54CdKoXRd2cuVM3FD9w0+N0bA==
X-Received: by 2002:a05:622a:19a0:b0:474:e7de:8595 with SMTP id
 d75a77b69052e-47ad8159564mr27694831cf.14.1744888375327; 
 Thu, 17 Apr 2025 04:12:55 -0700 (PDT)
Received: from [192.168.65.58] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f36f527df0sm10099976a12.71.2025.04.17.04.12.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 04:12:54 -0700 (PDT)
Message-ID: <7b559f03-f131-435e-95de-b5faee37b4d5@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 13:12:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] dt-bindings: display/msm: dp-controller:
 describe SAR2130P
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
 <20250417-sar2130p-display-v4-1-b91dd8a21b1a@oss.qualcomm.com>
 <20250417-arboreal-turkey-of-acumen-e1e3da@shite>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250417-arboreal-turkey-of-acumen-e1e3da@shite>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=6800e238 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=hUMovHauaXhaw1qFzIsA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: _pgCTjxusn6-nOyS0vMUoq3Cx2PPGVQl
X-Proofpoint-ORIG-GUID: _pgCTjxusn6-nOyS0vMUoq3Cx2PPGVQl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_03,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=837 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170084
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

On 4/17/25 8:03 AM, Krzysztof Kozlowski wrote:
> On Thu, Apr 17, 2025 at 02:16:31AM GMT, Dmitry Baryshkov wrote:
>> From: Dmitry Baryshkov <lumag@kernel.org>
>>
>> Describe DisplayPort controller present on Qualcomm SAR2130P platform.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Addresses do not match. You re-authored the commit, so now everywhere is
> mess.

It's git's fault with replacing the linaro address based on .mailmap

Konrad
