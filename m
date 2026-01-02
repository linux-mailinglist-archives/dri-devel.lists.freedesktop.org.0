Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71673CEF7FB
	for <lists+dri-devel@lfdr.de>; Sat, 03 Jan 2026 00:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493AE10E2E3;
	Fri,  2 Jan 2026 23:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ikl6QsGW";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RV4m84eM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956E010E2E3
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 23:53:34 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6029VwPU2310158
 for <dri-devel@lists.freedesktop.org>; Fri, 2 Jan 2026 23:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/TOfMpFCdBGiMultyyH3RUnh
 JuRXi4s3p8mFm8Vl96E=; b=Ikl6QsGWiemAUO70+A/3KIr9DMMvpyEKzg9CJW0o
 jgz02hyxChW/KMBq/5PADp+08GUB6iubThTwg0Ys9UjmIV5oid5tCGnTVwyNa76W
 b5lMprAvWSuEdDn9LQpjKv4lT6yphUCw0YyLaT7ggO5/6KOBCawjmfloDJe4ik8k
 dQ4BioWSv54vEHfYiPNZtB8w/xoTdUzNAKwJQG0AcHdF1BxiSD0SzElhl9M7/f9u
 FevOlLbS4LzboEZo3qGSE+IgieZ/jPumeTWJXuwc5aPZC6HoHYk8vLDWqeWoaEM7
 BM0KvC4hZ2Uwu1zg7kycko/m8kNnWk+7v80KEmgq2KimzA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bdsc9u5y1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jan 2026 23:53:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8bb0ae16a63so1338629885a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jan 2026 15:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767398012; x=1768002812;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/TOfMpFCdBGiMultyyH3RUnhJuRXi4s3p8mFm8Vl96E=;
 b=RV4m84eM4dCYXb0cMdEdgbXbZjDDUbxUQctwrRGv+hnpphlg8kwGvnhALdtl6S/iha
 TjezMk63MmrVXOrCMhK9sUl5XqtksTDwb745EXu3fE272TZDztGfGIL5112eybjE1S31
 c9xWSYsj7JP13RlZC+GBBn180PdjVtFxicmZBKal58VElNtxuTv7Mm/CxNTz2ivwJE/a
 PYGVEy0YWKVVu1+/BtO5DiABGlDMIBDp4OXtfVrcS5ZVFCZbnxN5ZmGKR7NPoEnc1Sy0
 CltFzAmEN0U4ROnfrcHv+P+54DbOJSlCgXLdVvpYixKlBM2g84jZFFyFmvNQwuYXhone
 s64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767398012; x=1768002812;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/TOfMpFCdBGiMultyyH3RUnhJuRXi4s3p8mFm8Vl96E=;
 b=rk/tHg17IspGtlre+iCI7XkA9pKrhArT2YqC9TqJkEf+0DE9EzozQnkOAIRxZgqXbD
 U/chWiA7GdMUcFGw899F2BFAgTs9iKW4Yv2U8Yt4hFFmPtq9I5SZsaPlFb8DAbiKCxWs
 OZI7s0nyTskS/GcDqheI1PCpD6/g91U5BvXpk1BHBVT9u5MlFD9FnMzP8FVBcxnr/4EF
 hJ4mw3PwWG9JaQnw+2G5/M9W7lAouY66mXoaFG+eYGZJPbP/4EYQ+QdVOFYBfKYM2NKW
 3vwXjwfPmHS22CMGPw8N2L43x0JfqzP5QAh0PGiqMPs7ZyQPapTXfmUI77ae9oyeylVB
 K7tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcRc+/Ph1dOy4tBehm5gG1g9n8IthhuWsDYnVQMlpAeEiqbRunSpQ60iIsQqAnR0w7hNYySle69C4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaZql3Ihb8U+kY6ffOSyaWNaseDYaLfj0uzqB4vDJUR7eVfBbO
 C9ihKLQ2xZSu2YOwcTuqbxIE92cs6bTRUPKAsOE28HJ0e31/66XYDahxqX5J4YSmPRMnra4Ndhm
 FM4NdrSI/MJgpEWmDFqS60oa++bEDVmeX1a36ciL6fiL+9mrjlCxnRLMgrOF2AwGRrEr574U=
X-Gm-Gg: AY/fxX551D7SpU4/hYCoJyGYPqFo04CMWSkH3LQzBKonfgubsINr6aCpYbg2x8HAkBP
 Y0oFZprz9JRQ6IQ4w7wPn6lPM0z1wzxV4TPWhlbU0h+6po80oNUNnoOaMvVBTHU2l0z58yIs4IF
 obeh8DyshV98k3uSsA2RV66vdn6Ct+M9p80YsqAQ4ZGQWBAP1bvdKoKhmhHPAExj3iTe7VuJ5xq
 gtMIgehc1l74XkAAI6phRZez9BxlDh5dsU/pZnQdR8jGtmGD9tyAkBRSL2mNWXYEWwfPZxuTB32
 P29MnNGgvTrCz+BnremMbuBssh4ZFEyVMS8wWQs0NeIq685dLPGIe8V9lT3hjAK238HidajZKSb
 rxh4tvwGoSaj06X6m9Ai7dsz5fE/a+ceXUgHzYrh0KUTT2aXRzXEcCWSCkRc/cw9VCblmxVzYZ8
 jW+eydRDsQAEmfFwVtthETSAs=
X-Received: by 2002:a05:622a:5812:b0:4ee:1e28:acd2 with SMTP id
 d75a77b69052e-4f4abdb46e1mr659769731cf.70.1767398012552; 
 Fri, 02 Jan 2026 15:53:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0QH812ZIfQAgtd1QpMNOObOzz6T3l1UmMcjcdbYOeSWMWVdOtYvBSjohvx5B1nzJfyW6ibA==
X-Received: by 2002:a05:622a:5812:b0:4ee:1e28:acd2 with SMTP id
 d75a77b69052e-4f4abdb46e1mr659769571cf.70.1767398012135; 
 Fri, 02 Jan 2026 15:53:32 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812251b2b0sm123294051fa.18.2026.01.02.15.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 15:53:30 -0800 (PST)
Date: Sat, 3 Jan 2026 01:53:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/disp/dpu: add merge3d support for sc7280
Message-ID: <nao4o76zlvkmak6t47ubcqjnkfe3bdkdounixwdpgox26yfmg2@ltpayjaow6h5>
References: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: pysFpkgVo7_UdMe0SozMMmW8HsxEQeZ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDIxNSBTYWx0ZWRfX7dA3q3HZjvXw
 5gIrsrKg+0YwRu/RoUyjhNmaIdGKWDoVJJ8E2b4mpjyorNJJMrJqhzT1AQLis2Nwx5zf2PHr2YF
 WbmZqT0GahS2Kg9S/2lTmvv8eKvy4A6m22MBSIvSc3bulwRzklCUO8IKuxbMQOopqx6ujjvwVGq
 QwdSLGiH/Yg+BFiQ1YyOXuaTm6vzX8NdpncJPdnAtJxJCBP7XLGxUOPs8CgZyi32Q/pGJC43wvH
 GBT37URkiTa+TM5cyN3M4hgTNTmiPV3zdGkRBYTCe7HiQXuIPMZoRf/70HbpuVqSnjgUQ7zDiR3
 9HtVSsAhqutEIaK0KvoEzjaCldUF5N0AjAMMjplLPSDwFh1YS7f64vde1Qh2lFQJmxMQ7UW2jcz
 2Ta8Lrmbq5fsSUEzuuMKl3H0Uqq0hxQg4qvePfGt5SkFQNOZQe0BTvE9qzJSVWrDR0EBescZjJi
 X2RlbRrZPzQmdDtUAoQ==
X-Proofpoint-GUID: pysFpkgVo7_UdMe0SozMMmW8HsxEQeZ5
X-Authority-Analysis: v=2.4 cv=Hq972kTS c=1 sm=1 tr=0 ts=69585a7d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dt2VdzyfSrB95En7lnYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_04,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020215
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

On Thu, Jan 01, 2026 at 10:34:38AM +0530, Mahadevan P wrote:
> On SC7280 targets, display modes with a width greater than the
> max_mixer_width (2400) are rejected during mode validation when
> merge3d is disabled. This limitation exists because, without a
> 3D merge block, two layer mixers cannot be combined(non-DSC interface),
> preventing large layers from being split across mixers. As a result,
> higher resolution modes cannot be supported.
> 
> Enable merge3d support on SC7280 to allow combining streams from
> two layer mixers into a single non-DSC interface. This capability
> removes the width restriction and enables buffer sizes beyond the
> 2400-pixel limit.
> 
> Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for SC7280 target")
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
> Changes in v2:
>   - Updated commit message for clarity (Dmitry).
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
