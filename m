Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59636D031F1
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 14:44:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3B710E731;
	Thu,  8 Jan 2026 13:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SSFZslUn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KU9DXhuJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6C410E730
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 13:44:03 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6089comf126653
 for <dri-devel@lists.freedesktop.org>; Thu, 8 Jan 2026 13:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=9IG5R1B/DNG4pTgEjrKT98zy
 +g5kbLjmMUpTgn0aHJI=; b=SSFZslUn8XqWiuDPXedoq8AO7SJPBQSvcaIZGoEk
 Um5cltnwmCW6xdIRb1SStvjsXCHXVT+nPS7ueec6mBoI25d1rAs8H8Po/BKjZ+cG
 t/6dpHk4Nemwbcr4662Er6kyhe/Gl1ilwhBuB5aG3ocigrvQIGW0NrTb0RkoQUYy
 UeiJo3f0PV+q4RYzc+Tdq3rnSjDJdR/WCXMUAVc4/rItZOYg8tmyUofykR3ICOw1
 ZWFoalngPyGwcKMamMEh2OlO7bQ8asuQmTFIccFu96HrrNt2SRt6Bbe1nd0JI4sF
 V1GAj0HLd/TfRsCUFpFfcs1vrfLl46njOhCU/OSEiMBR1g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj3d6a0dk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 13:44:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b9fa6f808cso925336585a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 05:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767879841; x=1768484641;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9IG5R1B/DNG4pTgEjrKT98zy+g5kbLjmMUpTgn0aHJI=;
 b=KU9DXhuJEPUsx+mU32t8ipS+6xwnrQ78Yt6uxUs0srBFHA1s86Q7zxfOigYdG5q7K1
 52W1EuxvsWMbVJI22gROxwIlu/3SdLfdBmilznmA49Gd+Xu1wF3NXn3ZrCSA7b0ibPNa
 JQ1n+62088htBsYdoMgHy+IBb8Uj7sdKweCI5l5YtsJPIdurMnP+lZhCbqSCA5XiSynC
 m7K8faT2HqzPu+oJgjBNXMK266oQ09/JR9isWXXO1pufJW9yZkB/7qGLNOru0kJj+tSI
 OJ0RWkRJAtPUafjUqVpCmNZMdhR+fHHknUrm7qsYjmVsPS210x4LZKfuK9JSIPz5W7Pu
 Ciqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767879841; x=1768484641;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9IG5R1B/DNG4pTgEjrKT98zy+g5kbLjmMUpTgn0aHJI=;
 b=glHYJ/t3jZ1JPMpQAF6F5t/q5CdrHRSE7f2nXzRjptPiBZTr7A8Xpk01YkUMx4xrAi
 nO68pZrp3GA0GcXiO/L/E2UEd6T1ETvAiu+puu4VSri44nSVtylykWDUVsHCdurMgSYB
 fVqQsJvBD4suQwwmm8KxFwmxyMECiI5/2UEmbn7aOO7vD8O1RprP6jKTRJ2SrkwFI+gx
 3kU/QIM5oBmHeBBtyqYd8sLd4ZCmI6q5sZkRw8wYV8mvrLBTNcW6HiOKH8QPsvs9Wmvs
 m6iBd4NaMsthNYRXsMT98+bFvCkm9XnhqB/c/bLw1+/mURj/diUvb3FVo7aZ9y4TO+4L
 ahhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4d6MG1eCqfFrdoyc5q/1GpTo0+wL1pOsPyOw2bhw3vYGH+IuloOc9N5ZLcDTuoA1VkB3gU9WxNzg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUmfMiHISCHG5RQKvNCPiJpOUpDGj9VEcYa0vrrxJFS4Zi41nO
 TY7KEo/QmdBNB+LQkqePgSosEvfrpzE+5okmauA0Nqfz/f+0HXr1jO9aJgqfqjPXrOA6TAh+M9F
 nW005m5u54Xx3IuNcEwPQZJHnbHVSAH9iKkfJuDJGd4V9nNPQOnGAssh6Jd9rDeuDbbOInvU=
X-Gm-Gg: AY/fxX6k1W7ZIsoNxMKVVh+ETdNX2578h8L85u8DHrs+1SPAF4XI+HAPI/4i1Uk9EaN
 7SZfG0TAPC9St33j6fqRr80+xLp1qsLodCF25uXTktUQFKl2LJBvO/prvOTIPjGIct95Vhc7jQB
 N5h0lPfTgfCngcoNzyt58KRGRfsfbD9F6r36CJvj85UTAXUFx97LTFo1qxH7DECldYZJ5TYlHVk
 INkI73oVkUiE2v5xUlSpsfRl+AynqcfcD4oQyYSSv4sqrBDuUX1+8pqnY+PGlrp0uu82CFAOIMs
 cVAynVg+4Z40Nw5igz8T33AwJnUFA+H+vdv9A+cs2JunTiGoyMdW+t5GEVr9tZEJ/5/9MD6IWrS
 Ke/qrQgnh1KBjAIkGa2eINgNaD/uw8MBOEQls9ZOwgEOX2B564xxeOxbvqc4DUQZXYPJOwvzxoQ
 IDW5I6pN7vS2fTCgD1tliFAcE=
X-Received: by 2002:a05:620a:1726:b0:8b2:ea2b:923c with SMTP id
 af79cd13be357-8c3893688f5mr835606985a.14.1767879840699; 
 Thu, 08 Jan 2026 05:44:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHw24bHW3oIFsvmb8e4lRriEpl5Nr6dkfNLKdXFFfpxh47NA7FTc8dVRffTR3vOBjsIlWDfRw==
X-Received: by 2002:a05:620a:1726:b0:8b2:ea2b:923c with SMTP id
 af79cd13be357-8c3893688f5mr835602285a.14.1767879840191; 
 Thu, 08 Jan 2026 05:44:00 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b6ac0a769sm1706120e87.21.2026.01.08.05.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 05:43:59 -0800 (PST)
Date: Thu, 8 Jan 2026 15:43:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v5 09/12] drm/msm/dpu: Refactor SSPP to compatible DPU
 13.0.0
Message-ID: <b7weoxyja6glxeqal3iz26mglyvknxa45btkcaipgdl7zmeahi@ab5qc7go5xex>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
 <20260108085659.790-10-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108085659.790-10-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-GUID: 5cSboTsGhJcfyOu83iCEpmt5oysU8Cmv
X-Authority-Analysis: v=2.4 cv=APfYzRIR c=1 sm=1 tr=0 ts=695fb4a1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=qJVVUtC8YRK5WH-1NpMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA5NiBTYWx0ZWRfX5PVq/O3AVUXS
 RuZISVl/nMsfwr6XucdDxXCfQtTUQFthPSg40SpWozvcirWvvMm62e/HsWKJ/P1jNxgaPiQw+I1
 ZfJjg+h1R4W3SrCyVs1im90MD5N8j61XjSC/lCYg+eeC+0WTFLh21tLLDNVhijWSungl8cGUgBT
 V0SlW5ZQF+xlAZex5QP7hc6xDDAgghI5BqmLCjTCWL02+v+VDiaG0Yja/NdimIvoZB42xVM39He
 r2I4m1Mkmk1LYsLC12of+Ytuxum0uZb8ioHaQetZ4CbqN6y0madycMyeQucuM/UshVPBqH+VpY6
 Rmvvx5R0MVm9FlRwBL3QhKQcJ6RLftsjAPrX2sZiJBgY7i5YWDz/ilGaU/ge39KKnYeTXjss8+6
 lkcRnrKklRXq1A5jc3msv+O7KKUFt0JM8GJm3tJ4HFmoRUEIH2nq36LTmHVBArVXwltfkpXIXxH
 8k47zDSv61P5op9xHkg==
X-Proofpoint-ORIG-GUID: 5cSboTsGhJcfyOu83iCEpmt5oysU8Cmv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080096
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

On Thu, Jan 08, 2026 at 04:56:56PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> DPU version 13.0.0 introduces structural changes including
> register additions, removals, and relocations.
> 
> Refactor SSPP-related code to be compatible with DPU 13.0.0
> modifications.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 110 ++++++++++++--------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  52 +++++++++
>  2 files changed, 116 insertions(+), 46 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
