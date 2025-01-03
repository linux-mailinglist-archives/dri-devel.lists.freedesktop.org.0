Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FCCA00959
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 13:39:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5731C10E426;
	Fri,  3 Jan 2025 12:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cJ6t4GHI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88C110E426
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 12:39:41 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50375cOu031428
 for <dri-devel@lists.freedesktop.org>; Fri, 3 Jan 2025 12:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lZwRh4PseLrHdLpqPBaflijRPt0Pr7IOxsOt0iWXhpA=; b=cJ6t4GHI6o5SsFAB
 OBjd647yfxLWmY4GJSY2O2f8qhUwSfZbY3ruB4AVdGlNPvsoBhppAywvPQpDZaSI
 CqSpjYTJScad1Sp7Mz5iXOfFgvgRPj4sEm0xfwu0wsXshr9xkLSgg64Zw1KK64Lj
 11ALx/y/01RtDaO7cDYBr9+Iz9SGdjcryeLbbc6zrgatqQuQsuacbT2MN3Aextji
 W4YRs1WWNYaZkA0QEvkAL3rRLiLCgE1N6sYY6q/uJh6LudBuRSsWqZCujNggP7NB
 VFzRNcOfBSj3c7quArXxaKT0Bp5zX5ISVCyxtobAyZWqkz2IpftwlxnttwteFRjr
 CJlqUg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xb700pku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2025 12:39:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7b6f499dd80so30788685a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2025 04:39:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735907980; x=1736512780;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lZwRh4PseLrHdLpqPBaflijRPt0Pr7IOxsOt0iWXhpA=;
 b=sCkLQ/JYlCzCZ5FHih5qdF+oqEOaDCL7cRRqMsSjVjGC+fBZvWGU9Wn7rg1Ler2KMk
 Mp2+IHCxgDiBNLJaIOSG47YiqHXIul0rj5tO3TgY35pRWWdupsShm/hXf+tdzOt/Q5Wi
 SNCJdotIBd5EFMV2bXvJIFXpU+51ac7q0dKgpjZrsDyDSe9jV5fOGlPruF6fyyuZNj+E
 hUxymrTbmfnWiXgCkMc7pt9SsJbIV2fEraobfs8yc+iNZEVYiSc5So+Vi00qN9kDwwCJ
 Z+Dpju0RsRTlQLbFQ0+qtO0qlA5M8QlZLUfgZ1nX+2NRT6MrHcMtY/68NNek5JA0I3Ww
 vh9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPncbKn/en/jigeQ8E/gt10/nyTruhYD+BGz0b2AYfAsOqlUV+XzA3amaut+NSWL5AC20U0efVVOI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYx1iTFgv4x/60L6dswkgpGnC/QOM/Z8epeKSgFRd7LVtueTQx
 Z3XCIuVHld9nJ0/7NTXcUgha7LUf8nb4eOgILIwa8eL3+D2eYnUSHQDSOwdNoFctSg7smKJrLEr
 ooHnUd/DEszz5cJqBmUxSyWv4fpR4RxH6sJ2cDco4r6+aYDioOKRFdznfNilnIM5+AQA=
X-Gm-Gg: ASbGncsUS2hRYdAIqbdzUPGtchksumi30YIKs0DwODU391QYCxi8uFf/H+rcgu8tBYi
 dBwuU0ylKZcgkF9XewRvk0ylGfoSmQ/lCX5CWAcHsp9EI/ZmT/VFJd86TEFDLYrm9YVjLlsKZAd
 HUONT/OeOqUPK+nYnL97CQeLqMdo5vQEX+A5Md1oxTCkQGaYF6wBxgjLZnnfzcfoFp3EuuezTji
 zaDL36b398Ei/BYXNl+45oXCU0/+ud4+Qbcae11orlBbe6P+NWgSKYPM/uhBB/8MbqA1cM2qW1D
 Zp4zwncxFTzxMJiEGt7GR2yFd8mNPcp+J5I=
X-Received: by 2002:ac8:7fc1:0:b0:462:b46b:8bf8 with SMTP id
 d75a77b69052e-46a4a9b7558mr309385391cf.14.1735907979736; 
 Fri, 03 Jan 2025 04:39:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9T35sLA9E07WaPbgvB2yIVdP5SW11rIxHrqYYRBRo/hP/Iuy8WbY9t+3R/LoFsXxymado1w==
X-Received: by 2002:ac8:7fc1:0:b0:462:b46b:8bf8 with SMTP id
 d75a77b69052e-46a4a9b7558mr309385091cf.14.1735907979439; 
 Fri, 03 Jan 2025 04:39:39 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0efe41a6sm1914071966b.102.2025.01.03.04.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jan 2025 04:39:39 -0800 (PST)
Message-ID: <da74c183-9f4a-4b11-b747-35fc21252a4d@oss.qualcomm.com>
Date: Fri, 3 Jan 2025 13:39:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] drm/msm: a6x: Rework qmp_get() error handling
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20241231-gpu-acd-v3-0-3ba73660e9ca@quicinc.com>
 <20241231-gpu-acd-v3-2-3ba73660e9ca@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241231-gpu-acd-v3-2-3ba73660e9ca@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MyonilrFRuFtWbqzj9THSIO3x6ZpPmJA
X-Proofpoint-GUID: MyonilrFRuFtWbqzj9THSIO3x6ZpPmJA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 phishscore=0 bulkscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=899 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030111
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

On 30.12.2024 10:11 PM, Akhil P Oommen wrote:
> Fix the following for qmp_get() errors:
> 
> 1. Correctly handle probe defer for A6x GPUs
> 2. Ignore other errors because those are okay when GPU ACD is
> not required. They are checked again during gpu acd probe.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

I think this looks right

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
