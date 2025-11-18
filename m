Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC53C67FCF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 08:36:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D571A10E2FD;
	Tue, 18 Nov 2025 07:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KRkHZLpx";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VHzbOsDb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D8710E31B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 07:36:32 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI3Aqum027471
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 07:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CVinXdjILSV5+JiZoUxO2kalWseMGqwJaCbzkxN41D8=; b=KRkHZLpxjmHfXXKh
 oQe3FkNW27uWFRVun+8U1fAhoyGctgOahbqKwvjOZrKUGZ7BqT24IjxkUxgQp6Gh
 h2e2fRmW12U8lqq2PDgPN4EUdyXiPEQyhNeV0YU215WhD20gPIcqSq8ckkzeyYBo
 87FwvuBmq9QuzokZIpbPJRMuy0IIivPBazXCqNEz7jXp4bvrAppM7ySMv1zumyhn
 mtuJsPxTdQWL1zc0GZj7SZEmgjMoraCMS5gp4CwSptTTjqEHhKJXKMr1WM5SH3oC
 KylGLSBnHJ0WdzQTr7U4ZL7HLeJxPpzQRzhkDPrZTRWf1l1hlpGfzm8x9D4ZT9+A
 K22YPQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag77t27s4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 07:36:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7bf15b82042so3355642b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 23:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763451391; x=1764056191;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CVinXdjILSV5+JiZoUxO2kalWseMGqwJaCbzkxN41D8=;
 b=VHzbOsDb7amUbJb0lbYKr3V+Gd46rBu2axsWtAa8yh7xb+zAnMlffv514H4NZGrApJ
 V6cCIzeX721N5WfgY36TYbTG2H6bwJ4hM8kHVlHy6YyDJ9hzneiCQiIDvMPRPYH/1eZz
 Kp4L1zOspqEPOn+r0jto5ZUjkfCDcTyyQExEaBg5z3ZbSJY7a+4oCnlw7I7ZsF3vv4Kl
 fgLPiSMHOkmSpiiVrswSsQ6/3+vpYb8NWK0BpST6ah7ZjnJdaZQNX1ypmTllunAmjyL6
 WYxTDEKcfj6yNo+aDdfaHVqdBFqnxRwmKYfUir2R99J7NNEcLB2oAxSC0i0LAFdPtWCP
 K+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763451391; x=1764056191;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CVinXdjILSV5+JiZoUxO2kalWseMGqwJaCbzkxN41D8=;
 b=K/XKmgqzHI1526HdBeeZEPcGjyaFxQCuApLsnONYNUp5zyHY620J3QpdjcMOv7xo0G
 CPxvCKKi1fUYmHCDzlpChTQc5eIzd8I1zeue2hvfYwMedRr/4na2U8twX2LI8mk3zOkm
 l1uoQXYlF48uRzt7FaIUX/yTS4+tHOjVVcjqVstRy/Fl1m3pNJouEe57rG5lM6Q9RETz
 2SOFXIGdBXQJc3CXKwqB+Y5nVz9Ga8oLqS2wohIWeVzF0GjVej/883Ai6+TDhEJltF0C
 rEK1f64PCiMl54U6b00mxaXIU6MafW95HEhcG5NSpnPkcFGkUoSUjnEIKgD1J/xWuEht
 s2Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzy/nDY0K+4CFfQznyIeYTqAa8TfLKwsr7zEtbrIuB2huApl6+Z/SC1WNOU0zzNa+qvfsWJYgd3qo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzM6yeN1fnbcSBwYoqaLxXeKNFhOo6hx5tRDE+p87pGPlUGQisn
 bvcLTKb/tbNaEEUXDclj0/hdoD+P1IQwX5/N3DxN2GwKYDIvKiCrHmZVR1JQCqdAvrIurLuBPig
 V7PSUx004EZ0ijYI0H6YWww6dh78zC9i8ge2WSQ1HKt/PJ9KTw1Rl0PlZ6D7PftNJwh0XXrs=
X-Gm-Gg: ASbGncvV9vT03bubfZP73EGTfRHm/9bXI8n1MKejXbbPwm4k2tYY1rHA8BERU0FJU7w
 XNdMzYpVk5UtcW+5+5DeEZYD9JeVUTpTtLReZXP2S2Voh8YqEUj7wusiQP6ybnyqb0AqKblcocf
 WGAaJYr/AGZQXk1LJWGQ+TF9PAL4wRwzWPJu1d4yVrT2sJBorSDsBSzPsSILIPVvOFDP7+0Deo0
 +Y1oFtSXo0yZyh71vNHtN4slvHqpafxD2+Hn/Tvm8vak/M4yI5L0vK7qWUE3HUK7wGzp9ZN0HhX
 UxN+72L3nHZNWGqgb8j9ZL7ZhXe0e89uk9xrtdVoNgBTTwhjR554ZX44jcByrMCNnQV1WzDPDl3
 bmLAAMAgLbfTeiQqLA58MBZt3wWXhS3aWyrvjB+hdHFaH2jmDZFscFDbd//m+
X-Received: by 2002:a05:6a00:3d42:b0:7ab:3454:6f2b with SMTP id
 d2e1a72fcca58-7ba3bb94a6fmr17351046b3a.19.1763451391390; 
 Mon, 17 Nov 2025 23:36:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHukQGXJp1dGw+SE5YsWPfaB2imyUIP4jehWGiPYigS52alyMJZbGUghC4jAi+ug2iDnAHAA==
X-Received: by 2002:a05:6a00:3d42:b0:7ab:3454:6f2b with SMTP id
 d2e1a72fcca58-7ba3bb94a6fmr17351014b3a.19.1763451390941; 
 Mon, 17 Nov 2025 23:36:30 -0800 (PST)
Received: from ?IPV6:2401:4900:1cb4:7658:a83f:a091:98a7:4ddd?
 ([2401:4900:1cb4:7658:a83f:a091:98a7:4ddd])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b924be37fbsm15673576b3a.1.2025.11.17.23.36.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 23:36:30 -0800 (PST)
Message-ID: <0ba8dda1-96a7-497f-b0a3-7d6581bfb184@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 13:06:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: adreno: fix deferencing ifpc_reglist when not
 declared
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
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
 <8d94324f-80e0-4952-b344-23740d1dbf54@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8d94324f-80e0-4952-b344-23740d1dbf54@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA1OSBTYWx0ZWRfXyvg32I8zxXFi
 r5CS4UlIFJkzF6ahj04m5hgrxZNUYFxqcevjESdQ1dbrJYOf3+gIaLAN6J1TYTvQLFZn4ieqFFO
 8EpAIM5/7pHm9SdocsiRUChoTUte8VBIv3MKRTlaEyW6C3mp5KtniOyex00HR23AUaZ9O7jGe7k
 WP+81XqKqYpjVzMV5UHmTX9QyzkDYPl8uLanI3sDd4wt86RXoo8SwLjesM0SNQgqKD7rwmGAn+z
 S7JkR/WiDRl5lJ/oUdp/YSZ/0Yl9bLn2SQZt+lie/5ZYa2pvXX6zcPr+f7yMuxeiIfng4ve8MYR
 PuWtljXN5x9XF8W+OAwt1Chm0+FnEfU03JH1cMJGI8H44Y0/1+XqQ+KuVzPk9xI+gbzDa3rMHFk
 FoDemAE/3EjAwPiSxLiJAw81eWWzFA==
X-Authority-Analysis: v=2.4 cv=EPoLElZC c=1 sm=1 tr=0 ts=691c2200 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=IXbB0Ub-vNnPxA_Vui4A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0NN-u7BKag0a-yREYX6TxQVEhZ-SAwDJ
X-Proofpoint-GUID: 0NN-u7BKag0a-yREYX6TxQVEhZ-SAwDJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180059
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

On 11/18/2025 1:05 PM, Akhil P Oommen wrote:
> On 11/17/2025 8:21 PM, Neil Armstrong wrote:
>> On plaforms with an a7xx GPU not supporting IFPC, the ifpc_reglist
>> if still deferenced in a7xx_patch_pwrup_reglist() which causes
>> a kernel crash:
>> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
>> ...
>> pc : a6xx_hw_init+0x155c/0x1e4c [msm]
>> lr : a6xx_hw_init+0x9a8/0x1e4c [msm]
>> ...
>> Call trace:
>>   a6xx_hw_init+0x155c/0x1e4c [msm] (P)
>>   msm_gpu_hw_init+0x58/0x88 [msm]
>>   adreno_load_gpu+0x94/0x1fc [msm]
>>   msm_open+0xe4/0xf4 [msm]
>>   drm_file_alloc+0x1a0/0x2e4 [drm]
>>   drm_client_init+0x7c/0x104 [drm]
>>   drm_fbdev_client_setup+0x94/0xcf0 [drm_client_lib]
>>   drm_client_setup+0xb4/0xd8 [drm_client_lib]
>>   msm_drm_kms_post_init+0x2c/0x3c [msm]
>>   msm_drm_init+0x1a4/0x228 [msm]
>>   msm_drm_bind+0x30/0x3c [msm]
>> ...
>>
>> Check the validity of ifpc_reglist before deferencing the table
>> to setup the register values.
>>
>> Fixes: a6a0157cc68e ("drm/msm/a6xx: Enable IFPC on Adreno X1-85")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 
> Thanks for fixing this. Chia reported this issue a couple of weeks back.
> Probably, we can add his S-b tag.

Sorry, I meant R-b tag.

> https://lore.kernel.org/lkml/CAPaKu7QvBZmx0b8SDBY1H3u-Em+0py0BrGkmrfGUXkx1uQrg3A@mail.gmail.com/
> 
> -Akhil
> 

