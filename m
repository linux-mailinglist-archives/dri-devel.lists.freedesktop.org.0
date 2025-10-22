Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EB5BFD7A0
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 19:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327BC10E80A;
	Wed, 22 Oct 2025 17:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kxIdmDez";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977C310E80E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 17:09:44 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MB0J9g004439
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 17:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DzkNgsms+I6TVQ+SQgJ1gRxGxqOmUsCmMiXjDyfl1q4=; b=kxIdmDezDNa5INVo
 j+mZbb5VZCN0UKvJBgcY+goSYKjAAz5lh9593YTsgwAGhsjfkEwbTuvL2UmOGhSv
 8myPuqr4Aqk8ITDAXJc7A/EX8gKAnHEZ8TSEF53kZlSagfdpx6Wf51PktRdNuVtn
 /57EN/ydY4tNsHu5ajMNzayLnLOuYXQ1Y8d8xU9uqDzpGOtmz+Pv4CWll27J5Eg8
 7w+AWPKYLjZg81bLJrrVtPaZszcxg9NPFFb2R2XuwN1IDZZSypycypOwh7+iC8Wo
 VfMSt82Bb1AcuuUjg6JzBlq+v9VEsoHFnz0t1y4Op0P7Hx5G6Wcg/xBozhuUrdhb
 eVSBBw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfnexa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 17:09:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e890deecf6so2298201cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 10:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761152983; x=1761757783;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DzkNgsms+I6TVQ+SQgJ1gRxGxqOmUsCmMiXjDyfl1q4=;
 b=g14D1Q6jm+xL7NMo4abjwCIB4w+xNdgcYyXlLfMR0cfpOJZ9bbto6xTjdp0YG6a/uV
 DjXu+3+CHRiJNXFxq8DOc6wTO58KwPQER6H8vT354ZRnRPd80USxKrfMeQLHzKSXT/Ug
 NAjs5+1VrP4lK0FXB5DC94dvtXp4z8X9VIZ2ha5ZvAIi/TacQixjK+T+cSnZugVC8zh4
 iblRC0BKTDTpRhXSgulYPw0hcDNy8W6ZOnfxLakGgIRV8J7Z3QI3/EeKiU2MTQwOE04U
 mW1I9jzHol6vc2gAtN01VOSgh2RRskA6yqRl5qgpwDrYtBiDjdiBGTn1Xvri0S7A4jE+
 LCmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIN9s8yj7m0knXvjVqxmPH6LeI6Pf2N8D8DuuvsHfKtp2kgHq3YOaj5/z5RTH2v9RzbIDN3LKL6WU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2AzyftgbmC0zC7EAhMkknKAPvi+NYV4fp/PlRmJHoXgfvZ6pt
 y3/iVidbDw9iskIyewQcJIEe8gCr+JUC92oKkIbZNOX+nC7k2U9SW3CPs7JJMaQPIVIR0HQjOgg
 QVhV+iNZZfaY+hYyz08WU1iaA6H+Z3IvaIw2Vw1noNsCOMUUGbz0iZLkWshg0sAWFcUFQ5rNp+S
 XDjzQ=
X-Gm-Gg: ASbGncvG+G2iPFJa/o0prLR6fUxOj9Wf8Bmbjod69F+ELpGWH5NnpKtZf/NuJX+TvDC
 D5wgGA5ogAEFO1Zw16f7ghPfTqQGe5m5qWTxoMaIrzcUk+iNWW6R+JivkK+/GZTq1E/emAig7Jt
 ybT0S3FDsUzTI4OAhFOjl/kVu3yFZxDIZB4Qo7r/A+TKFTI2DnCo0iK8czAl5Ghji685Row1cdS
 N3JlCUrfBHwdaATYqktIsNDk4Ah9p7qfpHGgi2YjWBFwlgMZmnaAN8ulfdz2V0qJNax+3kZqhpo
 IPdDbYCIIShLHTQZtXwYt3xq/C41jr6u/2xi0HuYLQ1KSiQ/NHD93cMPAcZM9FAxm/QFYAk2d95
 foMDlKbM5uzzmvOoLQYFgqtoBXo571SAheeWnS0GPlvzffyO6VXv5JCnz
X-Received: by 2002:ac8:7f41:0:b0:4dd:2916:7983 with SMTP id
 d75a77b69052e-4ea116a0a71mr62626741cf.2.1761152982648; 
 Wed, 22 Oct 2025 10:09:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1zbTlPXlUpM5403uofnWKWimc8ISr4xjVjYpjAA4lEcZwdbtZU9LT3YujrWiqGqdomX+4jQ==
X-Received: by 2002:ac8:7f41:0:b0:4dd:2916:7983 with SMTP id
 d75a77b69052e-4ea116a0a71mr62626281cf.2.1761152982190; 
 Wed, 22 Oct 2025 10:09:42 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65e7da2bc7sm1372236966b.16.2025.10.22.10.09.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 10:09:41 -0700 (PDT)
Message-ID: <5d6e7303-cc57-4a50-a9ad-b45d3c89d045@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 19:09:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC RFT] drm/msm: adreno: attach the GMU device to a driver
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HVAt0dzhtMr3GAcdSHsALRcIr5ew4Aze
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfX4PAgumDlATtb
 ETyVH4dMykGYwNFHKJ8OYbPCw+98kJGmLlo+4HXNCKm+9q5SpEyQTX91fcMJIz67Z2+pCImHHML
 OQ7X1CT5ZMZnYfHHe1ofx0W/NhJCdMD9tuXWLRVcUact7hqP1UDZABLoD9nTj5i3/NtB6UwYJO4
 Ra6NoFNQWVDR7s7YH6rsPWNZQXrA6eRzkXfrktEM+nOj+JzePg9FJr51dJAuTjz8RTrssIBJD8I
 OQWfssLLw9EIFL6mZterPo44urAU+O70Wlm9gCWjpuct6AryE9KsEWZsVMkJMSR2JeGygtuC9Qi
 K6X48orjTALXQy5qJBOHUJlc3WnieV3gpXASk+7vXnmkr6/Qb1mqV8aHXnvz/Xliq+GYcrTU5Nq
 KODKjfuOofEqJqfVTuKnNjzWjuR80g==
X-Proofpoint-GUID: HVAt0dzhtMr3GAcdSHsALRcIr5ew4Aze
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f90fd8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PIh8tp-2QVCGfq0cSFkA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027
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

On 10/22/25 2:44 PM, Neil Armstrong wrote:
> Due to the sync_state is enabled by default in pmdomain & CCF since v6.17,
> the GCC and GPUCC sync_state would stay pending, leaving the resources in
> full performance:
> gcc-x1e80100 100000.clock-controller: sync_state() pending due to 3d6a000.gmu
> gpucc-x1e80100 3d90000.clock-controller: sync_state() pending due to 3d6a000.gmu

Does this *actually* cause any harm, by the way?

For example on x1e, GMU refers to 2 GPU_CC GDSCs, GPU_CC refers
to a pair of GCC clocks and GCC refers to VDD_CX

and I see these prints, yet:

/sys/kernel/debug/pm_genpd/gpu_cx_gdsc/current_state:off-0
/sys/kernel/debug/pm_genpd/gpu_gx_gdsc/current_state:off-0

/sys/kernel/debug/pm_genpd/cx/current_state:on
/sys/kernel/debug/pm_genpd/cx/perf_state:256 # because of USB3 votes

I'm not super sure where that sync_state comes from either (maybe
dev_set_drv_sync_state in pmdomain/core?)

Konrad
