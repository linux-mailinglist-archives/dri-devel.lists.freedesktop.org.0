Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D3AABAEEB
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 11:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE28510E0D1;
	Sun, 18 May 2025 09:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IX1RZ8in";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 023A210E16C
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:20:02 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I6j2j5029053
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:20:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=XMNoRzvP+dJ2IDW6flXZL2r3
 UaSuQqsk3IYkQeVyCxU=; b=IX1RZ8inQ8q8VUsI/v2YFQcc9kdmPTplfQM01Hjb
 cPad6MO5J0eXzOEx6nVFBWAYs6eJCod9sofTY9NUtS7qEn8bs2AvahcDnUTEqlD0
 zw7tiSviwuDTgeGXh3K7pOeUg2kfOOvTqVoDWzIXKDTyCK2u0s1R8Ceo/IuMbcpx
 MizoGebOi5NdE7/iFHf2OYPFwNGRbbGw/sv6Qoy3ubogee7hrApQy4m/gNxdCrW6
 pzOomQ0Pp+f9BdRAiDGR85tii3XOPb5ycDPsl+KCBk+THYgCLP+u3Ny8OeL+OK/6
 kMdZNgWO5gGh7hvKkViulU9+T1MsDP6SiNPvt056WFb4Ow==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjmesrvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:20:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f8b14d49a4so27670456d6.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 02:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747560000; x=1748164800;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XMNoRzvP+dJ2IDW6flXZL2r3UaSuQqsk3IYkQeVyCxU=;
 b=bGGoBBTG9IG8ri2IVc6bu9bbh9KdECN/ivcwjV/iiWA0S8+bs7B1KRUOnj2XfK7/f1
 IJC5M0x9xX29hJZHGQBDqHWwbboudrgAZ5yB/hlfVOvZ2TkS+n6w8W8wtaAjyIuGp6Zb
 XdIErKtZPhrbpWtxW6kJkkgbhIDQMZwoYEQX1c1/eEzNxzoCg3MNAN6TE9ORfwFCuHhJ
 A0IxLptQBmeaF1NtnDANNOROS1TSJbuAxRao+ZebNWFQhnCA1QzvDTdy0CKBK0i0nwkE
 atbp00OE9LmMyJecWeZVxrgSNXfin7YkGxbWQ2Gk3+qkO/fM9yhQKzDZsmo52BmDrC7U
 U/vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlHTqZk5YdulfPiHQwRPRRgzsTqt8ZBjQe1R6tz+UXPriE+MjfWVpTtkZM1gb4UGjH6LCG4UojuKE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzg0plCr/8qwv8xZ/WF91yiygEZ1qOuiGm2cBIp2nm84gLKI0jJ
 NUHtEdMjRyP+gAnT0Jn5D8Ah725UY5+hDK0iynWs3XDgBtebgOpa4AnFoNr0f31WTkIfNBL9SGf
 ELRKYWO7NJJujvXsLsru++ks0Lw4zUUz0x485qhKYJAlJW2PtAAPIwVDmaFO3TeOM7a3jhc0=
X-Gm-Gg: ASbGnct5TldJsaCmlRJwHS6viRCk8CBLQyNBx7OStJMw8+CQZGNo1LwZIIR72ET9x52
 APjYElPKMifXuL+DmGFP8YPym029gnsMF9Xp31sjJ9mQebyt9ZmazABiZjrKEyTiSVWHx6IXHxd
 vTHKzJuC+415XJVaAW7ft0JpBKJjNbbp+oN1HOgSU2IE7WeWos3rJTBJlsXAfdkADOvcxm1MQfE
 e3qiXtNA8YQ45V5rhhD907y6kMH6gmKwiHVV6eOBxznfvNg3rlRze4MJC1uBUXCs9DMSMA37XsH
 vBMG2ShQ64alxRGdT55YoFRByQrjhBjYM5sJAPx5m0szeKYtYHaKsZVGAf+ajkBXUn0Sxz9UURs
 =
X-Received: by 2002:a0c:fc50:0:b0:6f8:bfbf:5d49 with SMTP id
 6a1803df08f44-6f8bfbf5e85mr91753726d6.5.1747560000349; 
 Sun, 18 May 2025 02:20:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4RAss6MeIbi1hTLUR3LACX5ncJPrM6W25dlFKp7HPzQXdfR4gH1QWUq4qPYEW0IMg9QDf2g==
X-Received: by 2002:a0c:fc50:0:b0:6f8:bfbf:5d49 with SMTP id
 6a1803df08f44-6f8bfbf5e85mr91753586d6.5.1747559999984; 
 Sun, 18 May 2025 02:19:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328084b170esm14076851fa.15.2025.05.18.02.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 02:19:59 -0700 (PDT)
Date: Sun, 18 May 2025 12:19:57 +0300
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
Subject: Re: [PATCH RFT v3 03/14] drm/msm: Use the central UBWC config database
Message-ID: <bcsoawpz4kxuyjl4e7gvmetqtozchsazpengerm7wmkkundpal@2picdwukiail>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-3-3c8465565f86@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-3-3c8465565f86@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RoDFLDmK c=1 sm=1 tr=0 ts=6829a641 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=2JnZN4u0TTcLH5SyeT4A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: oCM-_SY0PXMd0Iyta7ga87E4Ysffvk2l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA4NiBTYWx0ZWRfX4qZNobXNJqOo
 6PdBb36phAiBXw3MlVzH2mVdfdJWnic1S+kdWR2s3TbLQshUrGDYF/JeO6O0Sx7sMPZbrAfK2r4
 CMuz76pRUvuQ1ubcpNih/kY7Z2yivefYS9ji5ytHyom2KyIBaSseI/775lJyuqOfHt+YJ6u6KVN
 bqb4MFCfm25PsvH/y4LzwPKhQ27ToxoIXoGdOtGoBF2lbrVaurshOgjt/Hhql9jZOwf588VSTaZ
 lN70YPKO5f6BI7u6ABTPTvTcIq317IB2Y/mFHg5Cm3q9iGAiMATFnu9/Xbb6PmGjIc33cT5o2w2
 5OllOdRYJMy8IbgitCGnU0yQS60KiFglWkGDuJ/JpZFwg/hc+ufEI3AspA3mbVJGO9iD3/Ygebt
 OfpKw+2vhq8hn3pikDdulgM1RhhuqyrpYRYlkQ1Pd3c8npfoubdlOT7kTR8loonmBlifblL+
X-Proofpoint-GUID: oCM-_SY0PXMd0Iyta7ga87E4Ysffvk2l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 phishscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180086
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

On Sat, May 17, 2025 at 07:32:37PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> As discussed a lot in the past, the UBWC config must be coherent across
> a number of IP blocks (currently display and GPU, but it also may/will
> concern camera/video as the drivers evolve).
> 
> So far, we've been trying to keep the values reasonable in each of the
> two drivers separately, but it really make sense to do so centrally,
> especially given certain fields (e.g. HBB) may need to be gathered
> dynamically.
> 
> To reduce room for error, move to fetching the config from a central
> source, so that the data programmed into the hardware is consistent
> across all multimedia blocks that request it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Kconfig                 |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |   6 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |   4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |   7 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |   2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |   3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |   2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |   2 +-
>  drivers/gpu/drm/msm/msm_mdss.c              | 327 +++++-----------------------
>  drivers/gpu/drm/msm/msm_mdss.h              |  28 ---
>  10 files changed, 73 insertions(+), 309 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
