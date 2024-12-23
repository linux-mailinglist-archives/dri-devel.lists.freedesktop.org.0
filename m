Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3F79FB05D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 15:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD5B10E0E2;
	Mon, 23 Dec 2024 14:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HF49Hchy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8AB710E324
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 14:53:49 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNCudZi002194
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 14:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bwPjLaIInGXOqxf5KkGwC0tPH+0F6GxMu10ZOKyI0tk=; b=HF49HchyZ46q8Qh3
 JajbX5/gqEGbPTiv9jcQbkw5NdFzVvHRd3hsyF9Y37t28IoIoBkr/sisDR71vxm7
 7YLQkw/6Xkl2g1tdM8fXc87BXzu4Ke01+H2bI3xLLfY8PdZgAmSu5pfzdUi+OISY
 bS57tFfdyqBu2jSQPTA7VJmtPk9f110aZxDlHpDGzRtoMmdvqYiFdvMwm3MKzIGe
 2YujoKd7LfW1loWskWTeTB/30vKUoM5vVLznZuJW7CY5WooLknrRKGAkrDrr/9Qf
 XgZ7dg+mroUltMs9u8ZMbWSnziWMzWn9OfDigj34dFiIWI6EJd9GQdpyFOQyxOML
 GVjSTA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q8ah89xw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 14:53:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6dd0d0e0604so7540806d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 06:53:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734965628; x=1735570428;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bwPjLaIInGXOqxf5KkGwC0tPH+0F6GxMu10ZOKyI0tk=;
 b=Mj7oS2/kkSuqWTmHXTZ8Yu183Q2ch3J84hga7SkLkHvRqsQN4e9RJtmzBiMHPuc5xi
 7r70o8DO5UzzlT4KU1bUB8U3F4M4ELXNC3mw459X9vsYcrxcaZCSp3mogb2q87iIgOs+
 WFmHXEf6VEkN21HZzlHGWHDrPrHCmV6h1AO8yH2nyv5P4HhZDr/HLmdNLI7aNNWdufs5
 uwM32Q+gYllSMfM9dz0ztMLs/X97TzLOXIsjwi+j7BPtD+ujikYEzsaDOYbyQXqIRESh
 VXUX2dPunCapoC+TjEkCMKSmfcRnWr0WwBsD/T8yiR/5JYEBemQiHo3+RmCDrMifd4X1
 535g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpNe3o40omNbAnnLHUROAhjGE2MiKOV7C2sarZf+KnuN0Icr/d6+OR5eRiFEJIS55btNpWQiEE/oc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoUZ4RdMzLSgaIoxdx8SRB02LlhYYqmR1FTFK6qbfQ5/bqBjyn
 TyH8K9Fx8EMDcx7owFznOoR+zF+V5REdizxhya4+WgQ+qjKhG4lPYswEiUPb1Mrvi1Pm7Z7WVyi
 SukEqRLwXfIJwf18iRbqtbV9VHB5h7O6TbT4QVOoJi2AIDez3M6ack3rsKH3Yg181cxU=
X-Gm-Gg: ASbGncscmN3cVq7nQdQKgXqrp3GtMASiB7X/sfcvMRslVmubcB8DU7GNDVbJBVqZE2w
 APm0KN0Ppe4BBd5TOrTa19wK51R2kXIp1VDR2jjn5E8WgLDA8qkcD8i2HbaUl3D1uBYT8f2hb7k
 Qz35RH/Sc+ISh9dqanhaEO/5pMS/r6cb0m5Xb9B6Ly8L/p9i9Qm3L/cqxV2+hlo2dPwLjtKp6Nn
 5Dd44aUqe0LR+qWEC8bw4aOUVdskCa+xNX3kl1qpLiv2NBr1xaczCWduVgesdLZk+MJHDL6W9Wh
 70j0uw6Wk3p6wRzpTQU44cDK453iAoF2xhM=
X-Received: by 2002:a05:620a:3913:b0:7b6:db16:bc85 with SMTP id
 af79cd13be357-7b9ba725035mr798630385a.4.1734965627943; 
 Mon, 23 Dec 2024 06:53:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWdkN6EFmuFJ8wzSEf6GwnVczTFA/C+T9RLpWjLxftI/V+3Z5eKYQeN1WXp4BsHL2OsjPWrw==
X-Received: by 2002:a05:620a:3913:b0:7b6:db16:bc85 with SMTP id
 af79cd13be357-7b9ba725035mr798628085a.4.1734965627628; 
 Mon, 23 Dec 2024 06:53:47 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d80678c8dbsm4961381a12.40.2024.12.23.06.53.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Dec 2024 06:53:47 -0800 (PST)
Message-ID: <430ebbd0-87da-4cb5-bfd3-8bf842f40ce9@oss.qualcomm.com>
Date: Mon, 23 Dec 2024 15:53:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/7] arm64: qcom: dts: sm8550: add interconnect and
 opp-peak-kBps for GPU
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241217-topic-sm8x50-gpu-bw-vote-v6-0-1adaf97e7310@linaro.org>
 <20241217-topic-sm8x50-gpu-bw-vote-v6-6-1adaf97e7310@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241217-topic-sm8x50-gpu-bw-vote-v6-6-1adaf97e7310@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -tYg_roIXN3z67jLqTZ9fzSn_yb516fU
X-Proofpoint-ORIG-GUID: -tYg_roIXN3z67jLqTZ9fzSn_yb516fU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxlogscore=841
 mlxscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230134
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

On 17.12.2024 3:51 PM, Neil Armstrong wrote:
> Each GPU OPP requires a specific peak DDR bandwidth, let's add
> those to each OPP and also the related interconnect path.
> 
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
