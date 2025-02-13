Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE078A34BB4
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 18:22:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2498410EB5C;
	Thu, 13 Feb 2025 17:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D5eq3HP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A181010EB59
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 17:22:30 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D9HndZ020893
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 17:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 X7/PUjGwCmpWRxWUtK4W2sPA0ZnQnvaVucugb62nb9E=; b=D5eq3HP+tMC8gmJu
 c8Ku3aXF7snUBfQSsjWuI0RLwtym21RBWvGLwPDc/m1xQu9BqX/Hnw565FBcaU/z
 fHkOSGnp5BOYKlpdS0EymHWjDcaCWxowMy7Z4K0+lpI74ucKMzY5oRlyVIAzCs6R
 sEeRNInfaRvqo/V+UDhispc/rtLNNZSYZ8iyRYLkLO4Fy5GCfftvjcwyNt5lIEId
 n0JCHpDoJhSDE7PICdAvA/G53E6nnTVfJEuAy1LmH9MFNxoqMkSxybzjDdalxtJr
 kKrUrdUc7KCHht+u5uktdwnj5+McC0Th/QF8M/qdZh1zggPZjXC8VrisMXT+TDPn
 +0j3+Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sdyxs98u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 17:22:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e4287d04e4so3302666d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 09:22:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739467349; x=1740072149;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X7/PUjGwCmpWRxWUtK4W2sPA0ZnQnvaVucugb62nb9E=;
 b=XPL9pQzyO9VNkTtkkkbIxpFuE2qG8nqIJgXNT0BL1XHUngWVRu7JoTImz3kK17K0ZL
 abz/HpC5oFoY3O7ZYsMEDNnKOpiDSrZ75LUX6cLlmrUy3EzFTSWkN2JvZZ/Oym8evCLs
 Dls+4f6Swm5KR3kae4Vu4dEObpLFcdQATaY0XMoIoj6oJpYA1fCYK79pSr9zvFE3RS40
 gfpMc6jYZec6gx4yehxbNQ5cIF2zQTk4ViquWFAmFPI5jh/DNiy456CV/J83pbpm2suQ
 6Mx5pXpHqD2Cx5SQRjZCgwgdJztPZwdDeXLBLOQ9aUn+qo8CbCWMtiX4LDGxrOCa7nQ/
 Bmlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7RhP/lMIwyLdW7tvCy4lEUUo/eL9cS54xgoMkAABbD2+jL5Y4K0dM+UCOkHLgzL3Yw1gL1PP6McM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyX3kk82IZFjTuukHv504tMjqrRF9BHVVmL1wU448Z4EUvmYWrX
 X1ziVTbD2DlTiPCeMqvv2qsvUyE+BKjP48ROQY4v9USX2cdt/e3jHIaf7Vho2h2U7OS1kLsLL6r
 VLl+YFN4LmFV09do37R6A1lGpt9nDLDMrbIw1fG5dOJXp5wD9zOln20WzOzJKQ0O5bACG4hOXmk
 I=
X-Gm-Gg: ASbGncsQ49sAqaNJZAv6LPa0uNTELU8M9FysmogZ2pgi/RRkUStCEL05/W/DGGwIrAM
 524pnECnucXL0r0/XBn3Zb0po/oNrom5r6kM7Qftp+mvB6tF2hIZSzFfCIJQzmIeCo2lc4+y5gs
 ERwQ37RNI5UbKA1pbWHcmojmPzgLrmCVGIb4WIlVjAfHSX3iyV5g+GJJKLQQLsMQg2s4+6+U0QC
 xC4pQ4E2gM850H+3lqr1dAwx898MaZVQNAIozJmav/e41WLiSLJkqncMDHucWM7AgOQeyzTgGhv
 +kSQ4q/uGUexyIG0tNAHWACvZ+YQFADxNSEeppiKqdn60soMGYJ9ewLlZvI=
X-Received: by 2002:a05:6214:1cc9:b0:6d8:a150:3eee with SMTP id
 6a1803df08f44-6e46f8d9580mr36939386d6.9.1739467348682; 
 Thu, 13 Feb 2025 09:22:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmfP2aHbNd1c/gB4XKIkYhnCqiIT8aj9i7HRo2I1/gnzLpGgVGu1VWam9QZaenn/3b5fmEyQ==
X-Received: by 2002:a05:6214:1cc9:b0:6d8:a150:3eee with SMTP id
 6a1803df08f44-6e46f8d9580mr36939206d6.9.1739467348348; 
 Thu, 13 Feb 2025 09:22:28 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba532322f1sm170303766b.19.2025.02.13.09.22.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 09:22:27 -0800 (PST)
Message-ID: <0c753d83-d49d-43b4-b871-301b8a93797e@oss.qualcomm.com>
Date: Thu, 13 Feb 2025 18:22:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/msm/a6xx: Fix gpucc register block for A621
To: Rob Clark <robdclark@gmail.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>,
 Rob Clark <robdclark@chromium.org>
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
 <20250213-a623-gpu-support-v1-1-993c65c39fd2@quicinc.com>
 <2bfaa1ce-0233-456d-ba2e-5b14533f3812@oss.qualcomm.com>
 <CAF6AEGv6q59dpktR-zR7+4nuz05HMrY7givk8-E4rwCyJ0zNjQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGv6q59dpktR-zR7+4nuz05HMrY7givk8-E4rwCyJ0zNjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OTgshzpsAUs72ZFysqxE4KOt2-8toKC2
X-Proofpoint-GUID: OTgshzpsAUs72ZFysqxE4KOt2-8toKC2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130124
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

On 13.02.2025 6:19 PM, Rob Clark wrote:
> On Thu, Feb 13, 2025 at 8:36 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 13.02.2025 5:10 PM, Akhil P Oommen wrote:
>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>
>>> Adreno 621 has a different memory map for GPUCC block. So update
>>> a6xx_gpu_state code to dump the correct set of gpucc registers.
>>>
>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>> ---
>>
>> So GPU_CC is outside what we consider GPU register region upstream..
>>
>> And I've heard voices (+Caleb) lately that we should get some clock register
>> dumping infrastructure..
>>
>> So while I'm not against this patch fixing a bug, perhaps we can get rid of
>> dumping GPU_CC here in the near future
> 
> but we'd still want this to end up in the gpu devcoredump...

I suppose if the clock dump is implemented as sysfs, we can export that
func and call it from gpu dump code

Konrad
