Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA39ABAEEF
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 11:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D67A10E16C;
	Sun, 18 May 2025 09:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eQKz+doQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F08F10E16C
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:24:25 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I6GnZK011978
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=8adgWh/hWNFS/Xt0M8yK5bfg
 fpi+Em2QHRbR8lIk0N8=; b=eQKz+doQfwzx7JurT6dHNy6N/tar0UJZncyIGAV+
 zoO/Z4AdHSX2XkbineQUuh93Y4jBo5FA1VPz99MsWTfn9GbE0gD1Glv5a8Hlrql2
 jBZMrXwDJekjOtuiUjpE1aVgUPdG0bI6gr7BciPFMS/Di23rm+f83a8Wp2R+wM5m
 hUdI0e/0Agx+9al8cyhrlyEIbqkhFNOA9RO4WzOFD5ARulH4dwdnOxC/AOIkFzyT
 Y/KAcBaj1GU33EcyoH0cOkqDhzbxjNKGLY39KsnQd4iu++nI3ACV4moSJe8v4dxa
 ZIDTVuUSRFHAxr476ZvRkToSgStFrAYeOCz8Urt584/pLQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjmess2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:24:24 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f8af2b8e5fso53413666d6.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 02:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747560264; x=1748165064;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8adgWh/hWNFS/Xt0M8yK5bfgfpi+Em2QHRbR8lIk0N8=;
 b=SvyUjDkGtS1oNgsLNDaLXHs5bt/6th3RGDTVFZNhds76T6mM86pyh0HRZRhulLj/EP
 X9u9xswHGLhkD/UUWdjOM2aJg4jxHlmidWg8+71OAvcltjMEzD1GtsUDIvLq/9CI0Wpq
 2RpoVcYedyE87Kjy3E0tqhoNuipUq6Mt8r6yDuzSZKFmuEjHaSHLSxRJF8FOccdA7sfO
 jc7y2iFIg8LNrHjkraKyqb+8JxnLsLPz2yVY0ieX6uPWAmftUcSyYcgY9tLVDmvuTCxs
 yddOZN3DNA00r8L64F42YXOwsL/4RDOcuaO8JVX7OAVO4VinbLq4+uqpvzbx7hkJTxxw
 pO3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZal1Ar6XB9eLXZ2GU1D2rNQUU91jN6436vo6KN3+ZLrG9NFX1Lth6LguWL+Aw5uE/eeUrTpAXG9o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBml7sAKyyrPqV9XR0+0iTBy04Ztsb6fUZuA0MApXOKSity9nS
 MRCNjgc859H7RemmtwoGqf5BIgr4YpyxVQoAzWMUrqpjTqWpwCLf5dFJbmR2hHkWwsfqCv1VuIu
 jGZyicY8bDpwTDHgg0Kuylvw6AoNdmhLRRaMO1uqhl1Vpwwpa0Sw7whwRpbJbQJvtQsFJylU=
X-Gm-Gg: ASbGncuzwdGCP1+wxrLCMAeueRyq0Y+8xrI/xBjKK3BDASxhsB0MyMxsni/+bw7VkY6
 6mqSScYrwprnqQqHG4NzzkVIknbNpqhrVOnmFFchbSnYMoD43cvPHbsRbkrz3PrS9fAktqVaq/D
 jOGUz3lY4IrRB+Gykp7Ase5FL4P9meU0LFkV/H3RHP/Xo3egGGSNrz/VP2NFBX1sWZUh84HgNbg
 ROMT4dvkYxX3lvb4UNIh+kmVLZBrmYyndPcS2NKU8qIrcxRUHo0v6bEUhX8Vunm6Fo1aFzKkPRM
 np+Nx+maAjP6W86sRqIKrXiQ2e8/y6ovWbIN5HPVH5WHss+8vQ3tyld5dv36Z7KSDGWGjK8Ll3U
 =
X-Received: by 2002:a05:6214:1cca:b0:6f2:c94f:8cfe with SMTP id
 6a1803df08f44-6f8b08b7479mr165682816d6.23.1747560263951; 
 Sun, 18 May 2025 02:24:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUs9JyXLQMqLiJw+mJBxX8dsSHNhuvKCwCIcelIHVBLDBUriVWMpazHRFkx+FOTJbGlzEbsg==
X-Received: by 2002:a05:6214:1cca:b0:6f2:c94f:8cfe with SMTP id
 6a1803df08f44-6f8b08b7479mr165682586d6.23.1747560263591; 
 Sun, 18 May 2025 02:24:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e702cf90sm1359428e87.177.2025.05.18.02.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 02:24:22 -0700 (PDT)
Date: Sun, 18 May 2025 12:24:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 04/14] drm/msm/a6xx: Get a handle to the common
 UBWC config
Message-ID: <6mlja3igqehhxdxgfyhlmknmcvbz5j64vxhevejlg4om6xuhkk@6exwpmczaoqr>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-4-3c8465565f86@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-4-3c8465565f86@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RoDFLDmK c=1 sm=1 tr=0 ts=6829a748 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=93Yf4Y-vqGi4v4eIoEMA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: az64qGEX_PskEiWfL6fRIgYabEgHbbaB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA4OCBTYWx0ZWRfXw6xe1HI32O3q
 L6/OZPs7fJSCV9fKsh9bkKJJWbRuwvkTd+It6tJnsbzsA5XxCGMDRFeC0oUzQ7h0RzLk+IoOMJM
 9mmNRgWnGJeuvAKjLqpyrMX68Y+mBdsHz2l5sHfNCJX4rUKbEucbGv0zfYbGsu+oHgsv+7vcKKo
 UFuxsFXovX9pcQtZoUA/fN0X0AMLg/7r2vV5kcDkXqRJE35Sy9X5eXJJNwZU663AMXLGbQfQf+h
 jyZWfSImVVARDVdKt3Z7snICPI4snSjGr8cgLbmxIa4Tj2/LjfOXxKhKcQYh/XPzwfxysxcoTsz
 67ewFS8jKHhbUwuNFr/laMeAA2hJH7ptY5Rh/CDiqFAqerDscAA++gvvXEIZ+TvcnzLPuBShyo8
 uKaWBqKDErW1aTZ5Oh4bkry7EIi7GXKRLd6ZT7bGEWHsTm02uIxpHMz+eEostnc4Okir2nAZ
X-Proofpoint-GUID: az64qGEX_PskEiWfL6fRIgYabEgHbbaB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 phishscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180088
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

On Sat, May 17, 2025 at 07:32:38PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Start the great despaghettification by getting a pointer to the common
> UBWC configuration, which houses e.g. UBWC versions that we need to
> make decisions.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 16 ++++++++++++++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
>  2 files changed, 17 insertions(+), 2 deletions(-)

It is possible to build DPU-less DRM_MSM driver, so DRM_MSM should also
select new UBWC CONFIG entry. I've started a work on splitting GPU part,
but it is not yet merged.

-- 
With best wishes
Dmitry
