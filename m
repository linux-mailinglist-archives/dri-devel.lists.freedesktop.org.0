Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C10A34A01
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:36:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D4B10E411;
	Thu, 13 Feb 2025 16:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JNg1ffw5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2BF10EB1F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:36:28 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D9gnic027489
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jRC9JvP4VHXNyNMipFwDuEvtSP6Ksiyg5e611bESZ68=; b=JNg1ffw54vq6vn0N
 HjZdNMLtyascFWWDAvd3gRaNKL6yhM86wZdWNJMFZ4VyfZ1vTnz+U+xJoHIR5hri
 o2pgpR9RMJjggd+7MRVjOJjEh0d/uB8G8hdGSFtXp8WBOBnwnpQi6aN1kLbbDl9v
 manfatZU67QSLS/+Fs6iATNYhdOwxuwEyHJe85BeOjGh68DT9w+VZdt+nhLIpW57
 hhehWoXSbW5VzVcpMykCpR5IT4EK2rGw16kkEsfTpdxfb/Ern9bZ3iW//bQ6K2j+
 TwHglL3QsTigQrmqHvWYuDfsofyDVsolNFTp9H4L8AB0dbl8sn50XFqxmM83OPSd
 j/WOgg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sebn93pb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:36:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-46e78a271d3so761161cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:36:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739464587; x=1740069387;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jRC9JvP4VHXNyNMipFwDuEvtSP6Ksiyg5e611bESZ68=;
 b=usNbBdjdCFnwDcpv60wLVd9MgbNx43cSBK3UQMtHPeao9X2IVWhehnYHgmzwXafsLT
 HwdkpXn2Op72Y2rsRNTu8wG8Hnc+Q+hvwvtD9NsVatkJo2A7AQ5TR3t9Hd+Z7iTgwSHf
 W4sEAAc63KOC49p4UFGp1xrnKY47ztVX7LgWYpzyK6/UuxyQqFmGOON46+LRAFWhJV+h
 U6sqvPcL2o6C2ehmwQwkng/hzuJg8rFI3qvqINNyXo3qkd16lngwXclluBMXQE3UD2oL
 cqPEngvCGkiRGY2Ya4+YomTMn3IBdLdBdsaI5E3M5ipS84sxjeD6odIeKq8cD04eY7Dp
 tr0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0prB93Bmm3zBNkl3u4xgf7qjiWtD4XeReAZu+7YAFw1dgbEEN84hNLft3Ml6C3fAv74mG1rCFcuA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwflXEprO4BxN7UvJzD9JuhcEwuWpapguDvmZcHvPyif5aermTI
 KfhHr/MphGOivU/mCB5CIFhcqUf8eub9mtdC/3SxU7htZxVATTR5oujA4c2wP0VEK9q/lGu+E/V
 I0+84l+DwZDFhQelSeQGCT3ahspDbj8lMe0DP9RAOBnPFf7nWmbuIcxTnhZya70/R33s=
X-Gm-Gg: ASbGncupZocguUtC1k5H/jjTENxybcK/k3RfWSppth742xwpgQhCMq0UWoV1NkhH9i1
 NrKZSUGHty4YKagqAEDTj5HYm2rAoaLKg/HoJKHHA1gzslyeJwpv+m0myuyhphAqcToMv5LD+ar
 odGaHjeCdbuX726N1SqqhL7mZWab6BxFCjZbPtxpPU3/PxFg+9m/DLWbKgTHCbdsX/hCKObLJSc
 QenJXoCYYNH+tZB9YZO7RWHceSdkYI2jv1HXyTHcKhGvNlUGOclS1roqmKnh+/CYIzQrWUfag4B
 hLHIRiwkYW9GtMGqga1tF5Dxs1BOFVnZBzOCLrwVJKExdcBUfeBzEu0UAqI=
X-Received: by 2002:a05:622a:1303:b0:467:5d34:aa84 with SMTP id
 d75a77b69052e-471afe57ae7mr39969131cf.9.1739464586939; 
 Thu, 13 Feb 2025 08:36:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE65B4BdI80A2hYuehypNi18VnhTOKeJzxy4QZub8Qv8xnIyZZrKkYGRhBtPZp8LP3QGhc+eA==
X-Received: by 2002:a05:622a:1303:b0:467:5d34:aa84 with SMTP id
 d75a77b69052e-471afe57ae7mr39968921cf.9.1739464586479; 
 Thu, 13 Feb 2025 08:36:26 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba5339d94asm161583966b.143.2025.02.13.08.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 08:36:26 -0800 (PST)
Message-ID: <2bfaa1ce-0233-456d-ba2e-5b14533f3812@oss.qualcomm.com>
Date: Thu, 13 Feb 2025 17:36:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/msm/a6xx: Fix gpucc register block for A621
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
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
 Caleb Connolly <caleb.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
 <20250213-a623-gpu-support-v1-1-993c65c39fd2@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250213-a623-gpu-support-v1-1-993c65c39fd2@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Sc8p3xQ7tSgyYS23l6RBX9r6lTIrx7DC
X-Proofpoint-ORIG-GUID: Sc8p3xQ7tSgyYS23l6RBX9r6lTIrx7DC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=905 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130119
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

On 13.02.2025 5:10 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Adreno 621 has a different memory map for GPUCC block. So update
> a6xx_gpu_state code to dump the correct set of gpucc registers.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

So GPU_CC is outside what we consider GPU register region upstream..

And I've heard voices (+Caleb) lately that we should get some clock register
dumping infrastructure..

So while I'm not against this patch fixing a bug, perhaps we can get rid of
dumping GPU_CC here in the near future

Konrad
