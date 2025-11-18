Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFCCC699D1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 14:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046EC10E4AD;
	Tue, 18 Nov 2025 13:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dwiZvw1p";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FyLNP0j6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BACC10E4A4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 13:35:54 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI6fS0D2272085
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 13:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KnPI+HvRCXHtDrr9MXHrsjdWCFalSnw5mTh9evIOeJM=; b=dwiZvw1pSJE/Grhw
 HJLYohoJE/tE3hqI2z9myan7EXkTKrpsrp5iiWmH2eWqe/p6LTvD57U3Zj80KZY+
 pszgS1llZ5I6c1r8vGXWQzcMdl3EbzGvYzVRUbz1x1IUFbYfz/CsSjLwY68jnyEI
 dvAr+rgwTNMCedd87Xhef8v8jprP0wYcrqmCUsSgEFr1Ra21sVdUN0Xy4AW0GoRu
 4xNmEhEQ7CSgTtIkT4VRvXx6ZQLnGwU2ul4Cnc5ujy88ZUQ1G/nxokjQgdTL/oe8
 7it8ld9jgLeQmF+5I+JCCyRElF4Y6sNqRVF0/e3NPuCglFFILhkHRYhQ64/RhAIm
 4xWBeg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agkrmh59x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 13:35:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee24e1559aso4368591cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 05:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763472952; x=1764077752;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KnPI+HvRCXHtDrr9MXHrsjdWCFalSnw5mTh9evIOeJM=;
 b=FyLNP0j6Tsa45j+gFvmat8hDRlXkPqoSR+HxXUvfvykgCGqF1RSgmVRpEEYYFeQDvf
 FsLSbx/KwiqyXsrc7ek/H3II+S2hu4aZ/4jya3Klv+ADoSG//yazkGr75OwPMnU6tEw3
 8ub4sbkErFRBHVN4TdnKfq/WyhQSWCb0mbDsRmEfN2Snx+3R3dvdZks6X1sC7D1ZunN/
 qlGeZZ1y1SuiddV8xtHDzH8KtTDxLWoBqJWtrhQvSL89AMDvhwefjqwCoEoFFaXim70C
 ppMUH3ZvNcDFmHLLq6CfdaruPljCZskYkYrr1yxT/7zQe5l3gTYJtigWD4keY2oc0tbk
 vWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763472952; x=1764077752;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KnPI+HvRCXHtDrr9MXHrsjdWCFalSnw5mTh9evIOeJM=;
 b=Z4pjTHPx57mDSM3zRcU54mduGi2ZtJ6fbkHtfK7p5LMTj4viwSBEekzP9IwTVlChah
 tFB/1AIiZg8iReOBgOXoU1IhwONxp2LDOoBh1xjgP5cn9tomXad0YywAta0n07rZ0d11
 c91KCxn23bn6HFgGYP3HAE8kg+WSlngWv2FKyinEFpTe77O3ALGbIeeQaOI5boCjKzK9
 hmKJOdZZt/hsyqBX2AUW7fVJ45/87qnCLW4q4ZqWbSfgHRqmzVpYF7Db8LDKCcHIaRo0
 ScOSnmL003rObTwLc8RawxuO/o55ELgQcC1oTRauf9IqgbJ1elu69i8mqlDqPCZ0o2yy
 aSPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWpDlrh38g6qLsL10I5ZekTyfLFzTcFT9nIccDxVLLn1/iuogwr73q1fwXiSBq0YQ+ePgg8SP+718=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAS5U8uyOBRwwQGoyUfYYI8KW7sQaS684cNb1kCA/pLdS7iFXh
 HSYEnnMs/50k5ZRFNqZysRjhtr2klObLlmKRhRqzI13W90Hw4R/iIBvl+CYDGrfhd1haAJhnIQb
 qWqul1O5LRlNp0m3+lOUv+XQSY5k3aLeDNJ1r3s1TrO1Jn+ZQIR8L7rmvaZjXH8wmp3tTrXg=
X-Gm-Gg: ASbGnct8aSS8nm3aL5uIaksXilxjOlc0MtOZaLAuFFI6nDsXxnPyXQ7VZ5ZMRIK/xjm
 ccjoh9mFSV18H6p+LvEXmctSvDG6s8329XdN8h5tGsFWc2ON4+TgNBoEz7UizUJf8Tc7udH2sXQ
 mn5tqhVixNB5tI1IspqCVcG0IwzVTNvxl/kLT/otZVuOVgH1p8GE/8iAOtB3DZAxBK6ruCe5sgK
 dE+kkDB6vUlQvE9dfFSVWfPHW/U86sCouBfNi5LJc8oes1ufyPv9EM0SiaMvuqYU/cIVuluLIWh
 tASWO5Hj4xIp/6eDAQSML1ovbKgZ/4AMapfBleP5yVoWMy1YDvnsJcLzAzQp9svHxAM8vuD8Ivo
 F5CnoMVvlbR9lqJRMLjCUtR+88H81+S+lHPqJCMQrmCEU1dHgeU7mMaofOF2mIGSPb8A=
X-Received: by 2002:a05:622a:1a19:b0:4ee:1063:d0f3 with SMTP id
 d75a77b69052e-4ee317fa73emr26551681cf.11.1763472952276; 
 Tue, 18 Nov 2025 05:35:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGY1KZXSYMRxPN6HY6CHGoASb9AG9wqGfmmmqFipQhKzeaiMu/659NOr1Ib5Am/aZalUkf8vw==
X-Received: by 2002:a05:622a:1a19:b0:4ee:1063:d0f3 with SMTP id
 d75a77b69052e-4ee317fa73emr26551291cf.11.1763472951811; 
 Tue, 18 Nov 2025 05:35:51 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734e9e0f20sm1371741666b.0.2025.11.18.05.35.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 05:35:51 -0800 (PST)
Message-ID: <0d0e85b1-a70f-430d-b75f-a74cd19f9895@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:35:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: adreno: fix deferencing ifpc_reglist when not
 declared
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251117-topic-sm8x50-fix-a6xx-non-ifpc-v1-1-e4473cbf5903@linaro.org>
 <04aec988-59ba-4c98-b922-510d86b10ea5@oss.qualcomm.com>
 <1488f09b-63b7-4412-ba56-28b1c81528ac@linaro.org>
 <a874d12a-6da4-4a2a-bea3-20c69bd53c6b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a874d12a-6da4-4a2a-bea3-20c69bd53c6b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEwOCBTYWx0ZWRfX8QmY9QfGMqZ3
 GOId+ozNUM/hmjwLrduBqcBzHP9v+kE6wTWivQrzZqUiD8ibbt4tJzeRTSD4q1+gs6HMdPa1yWv
 T0Gi/QnFH4STgZsnzbPkZ50cuZQEUuWE2nQedeWOUYLgSOlMyUgNrO8QKl6NNZvXHirZ4aVD7Zm
 vWkWCKfP7l+E2P7hPiQVn3g+KEHqGHAjSM8CPrKZsDxkHZ4Bs9nNq5AxVWirMg+O3zmORq4zmrY
 NlGqwvGAdu+tSlfnsBrZ6DMNvv/pdOH+MkttGl9F8ABw3KplO5oO8Sznai1ITRE3THjPUMQpVOT
 A1wkO62LoUAjPZrliYBAkUAlOwGUOmXR7jKUH8DzKWqeiqGwQYp2BP1E/scMX47TgOxruSTnWiP
 yoeg5iR1IYWMO5Tt6sA36+Sp4sQ6Vw==
X-Proofpoint-ORIG-GUID: sRAdPo4THkbbAPxQMzYaYbkkhnJUJVV2
X-Proofpoint-GUID: sRAdPo4THkbbAPxQMzYaYbkkhnJUJVV2
X-Authority-Analysis: v=2.4 cv=JfWxbEKV c=1 sm=1 tr=0 ts=691c7638 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=sUuaTTKWZZLiqq4pnuYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180108
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

On 11/18/25 8:47 AM, Akhil P Oommen wrote:
> On 11/17/2025 9:17 PM, Neil Armstrong wrote:
>> On 11/17/25 16:02, Konrad Dybcio wrote:
>>> On 11/17/25 3:51 PM, Neil Armstrong wrote:
>>>> On plaforms with an a7xx GPU not supporting IFPC, the ifpc_reglist
>>>> if still deferenced in a7xx_patch_pwrup_reglist() which causes
>>>> a kernel crash:
>>>> Unable to handle kernel NULL pointer dereference at virtual address
>>>> 0000000000000008
>>>> ...
>>>> pc : a6xx_hw_init+0x155c/0x1e4c [msm]
>>>> lr : a6xx_hw_init+0x9a8/0x1e4c [msm]
>>>> ...
>>>> Call trace:
>>>>    a6xx_hw_init+0x155c/0x1e4c [msm] (P)
>>>>    msm_gpu_hw_init+0x58/0x88 [msm]
>>>>    adreno_load_gpu+0x94/0x1fc [msm]
>>>>    msm_open+0xe4/0xf4 [msm]
>>>>    drm_file_alloc+0x1a0/0x2e4 [drm]
>>>>    drm_client_init+0x7c/0x104 [drm]
>>>>    drm_fbdev_client_setup+0x94/0xcf0 [drm_client_lib]
>>>>    drm_client_setup+0xb4/0xd8 [drm_client_lib]
>>>>    msm_drm_kms_post_init+0x2c/0x3c [msm]
>>>>    msm_drm_init+0x1a4/0x228 [msm]
>>>>    msm_drm_bind+0x30/0x3c [msm]
>>>> ...
>>>>
>>>> Check the validity of ifpc_reglist before deferencing the table
>>>> to setup the register values.
>>>>
>>>> Fixes: a6a0157cc68e ("drm/msm/a6xx: Enable IFPC on Adreno X1-85")
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>
>>> I think it should be fine to skip calling this func altogether
>>> if !ifpc || !pwrup_reglist
>>>
>>> Although ifpc && !pwrup_reglist should probably scream very loud
> 
> That's correct. It is a weird combo.
> 
>>
>> Sorry but why? pwrup_reglist was introduced way earlier than IFPC.
> 
> Pwrup list is shared with preemption feature too. And preemption support
> was introduced before IFPC.

Sorry, I somehow erased that from my memory

Konrad
