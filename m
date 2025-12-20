Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCCECD33A7
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 17:41:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4401510E27A;
	Sat, 20 Dec 2025 16:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SfDymMwa";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cO0F/Yeg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E521010E241
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 16:41:01 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BKBOkbp3402201
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 16:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=v6GNQuSH/qpxPrgBm42fdwp7
 zr7vPXWJPpjiuOQ47vE=; b=SfDymMwaCU9x53xejNLTJyqgVJm9ccK7FPYh1msk
 JXyAMSoNPLokeJNUwy5sO7sfLcCA5R7+iVYIcn1FQYMrseCRN1zXyheM+FgiE1vB
 oDLbpSXr27arxLAR1kRMf+/7p3fVtt0IfsLuIACXq7xbgHqkhTHwwnMtRY5f1SF/
 ZjMXISCHNhQByEhBtdB9kniigxNaAUiNkusbP/JMFDj+9okThN8uZpz9ArJtKO2H
 ZqcpO1P9cApZN0SL5S04/xi+dwM4mj5QdCuyQ9kOD5NvX0v0XAlqzbCishLwCC2c
 RPEw9tnM3FrPgQRVNIoDc6iwa+xhUVW7cS1VhnYklIGYvw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mtqgyf0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 16:41:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ee1b7293e7so91522331cf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 08:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766248860; x=1766853660;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=v6GNQuSH/qpxPrgBm42fdwp7zr7vPXWJPpjiuOQ47vE=;
 b=cO0F/YeglAlxCsNOtH6cbnAcy9YkoXvjHuMiIWZ21V/dC02ae9lbLEamPNvoRgFigm
 7zOjtAi3FwCyn/s5YKjpgvaB1J+Y8bE5omz6fFXIzpCB5mHjHM1pHfBeXlVxjV+unAGo
 3KhkpU7fPUdK3HyT0E/0F3yxDXCGEh6gzekUR+c1ck5/3ve5YpPoUkupFckVTc66xc4d
 ZVm8DnAm0WiyHpXch5Q/s1c3wC8nhNmnKw09LJas3ZNKHIke4ErcYyoZkehVZ+dPVRbE
 EFrzN26XpzSun7j5zS/Skx8jaWmhh71b84UOEbNVTF5wDSG8uoiUuxfyBQFkmdS/yqj3
 ifVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766248860; x=1766853660;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v6GNQuSH/qpxPrgBm42fdwp7zr7vPXWJPpjiuOQ47vE=;
 b=e5Gqyc5Yas9Rm/5haf8BeDx+ovgxeIo/1qyhlSMmTr7CRBpPnn7RzyMOk92giXU2L5
 p9sWfByVUcnbxI5WxEYtzJPDVzwmsWMG5kxrwMJy2Zp31ocHq1eFBsl8K+mHspNvfDWk
 /xEQOsdyl9XcLV5oMtwNozO3ok0Ih8CIA8vslpJEod9ECi55GvZ/BO0L2F7dYvGlhaVB
 tFiYeSDS6R/+Ygcsmw7NMeI4yHkRqZD9s9A8AYuBJdhvGpgPgqV2LKkwniRyD3LZm8z5
 0x+lTcNcbqL53yQlsOroc9Sg24jV7q+pL8kRVH1Rqzjcwai9TZW+VD2Ue6FbZWh5PIGw
 rWZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR514HejIFNxQF3fzGX+rZ6VfyYPDEg7xUQdizVPxsJ2I6bmQgyM2+e2AJPx5XA+R0MxZLji/rha8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCDOjDaczwtMZ18DDiOoiz1k2rOOv2QKxEEVlTw7qLS5IgBQwr
 f9mefkHPGKrdREhrkbGchIBjc5ROi9bKO/cxDNSjijLyo/nXCr+uq+xls9Ty/IhNJop1Y8jdp7c
 0OZhC6mmb20Zk2pzWMqS6ykJzDpT43TffE6vIqNmTV6PZv6tjR4MVmKPe6IEzLF8hSIJAbxQ=
X-Gm-Gg: AY/fxX4DiqxjLlYbQbRD29/KUu6nqgCbnNFjjNyogDWh8xrSPxpISh8+IfXcU5WGpRh
 Jf0IxfUfobtF+rZbVURyW/1Ry/eV4ZnBRTrxrpd/2aIJPhmPqouRiYFYQLoAINdMBJ6JWuTQ61U
 zh5bP1B5z9BIKQyRpvI0MBqphm8OWy+6ox1nsTCb1U/NOrOmHAY/MK+5Y2uXQTekoPBHetIFPbA
 OEnurcj5CcV43sIgBtLm8tn4EA+eQbUhPlW/81Th+wMgE9oUxChw52tyaJkY8ag0n3AAC39NxBc
 aHUXKDoNnVz282WXH1uvi9auJYvb8TnolJUK8MABrr+qzzRY7aTnepGKEVF6zM07J7XwcMdgW/g
 8PgRHXcho0rK7WXZH/sk1vFbYAwJ/+8TDaG660JDLYd3zJoASurkO5HjbzF96eukcSQLy3KLsTS
 I/f8li9/GnerI8630SF8xsabM=
X-Received: by 2002:a05:622a:1e8e:b0:4f3:5889:2a79 with SMTP id
 d75a77b69052e-4f4abdcb97amr92050441cf.81.1766248859889; 
 Sat, 20 Dec 2025 08:40:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1yrfw0nPqMO1h68f/V7vtTzPbAM11st4i88h0pn9nPirrUnZ2f67Kg7nuyDy8LlO+k3wUVw==
X-Received: by 2002:a05:622a:1e8e:b0:4f3:5889:2a79 with SMTP id
 d75a77b69052e-4f4abdcb97amr92050041cf.81.1766248859457; 
 Sat, 20 Dec 2025 08:40:59 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812262ccefsm13123671fa.23.2025.12.20.08.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Dec 2025 08:40:57 -0800 (PST)
Date: Sat, 20 Dec 2025 18:40:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Revert "drm/msm/dpu: support plane splitting in
 quad-pipe case"
Message-ID: <krmtynkrnpdmunksxwntrnhsopbv4hu3evv5hanm2zukip7zy5@tqtyscekzqfq>
References: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com>
 <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-1-654b46505f84@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-1-654b46505f84@oss.qualcomm.com>
X-Proofpoint-GUID: k76w8eo-UV79f0ta_xGvyJenpbxuBtUq
X-Authority-Analysis: v=2.4 cv=dPWrWeZb c=1 sm=1 tr=0 ts=6946d19c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=sWKEhP36mHoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=lw3N_3V8nENtiHrPz88A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: k76w8eo-UV79f0ta_xGvyJenpbxuBtUq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE0NSBTYWx0ZWRfXyaSeOzq32gNx
 hsHYjqaDkRpobmOrmyXdtYzWDmDBZmEF9wIWZPiW2JHfH1NX9PrGNye4kDpq+jpahk+9vYVEiV2
 mOuo9FHeO/+ymmPETt3mh3lfUNk0AtAlrRTlciqfF1bN8K7MF97Mt2u5/KGrB8cIMNPEBRzg1O+
 7wwz61KfAF+uOrk5m8+xwfbPvUcSqd3S51qVc6Qsco+f11CQYVI8o4FDQPhml4WRctHOL8kEBS1
 8626haDQDqxgLVHphOpl7oobRlU7pT+885yQN9gu6wO82cSevXbw5VAODFyPnZXldOxbe17Zk3g
 ezzP7X9CqPbvIljB34CiLCqWXsYvfyS1zIB2XxoKsmbJY1mCtNtlYyEKAGjGcNt0gd6vlmgpwfb
 7Jwg+ELh8LfFegL6gM8r/7ZjDnZVBsLX6WvYq7iyAzTq4M5BFIMok4VKCqw0kD38C72mDEA2NWf
 gbYdhxP1VTYArIoRLgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200145
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

On Fri, Dec 19, 2025 at 12:39:01PM +0200, Abel Vesa wrote:
> This reverts commit 5978864e34b66bdae4d7613834c03dd5d0a0c891.
> 
> At least on Hamoa based devices, there are IOMMU faults:
> 
> arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x00000000, fsynr=0x3d0023, cbfrsynra=0x1c00, cb=13
> arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x1c00
> arm-smmu 15000000.iommu: FSYNR0 = 003d0023 [S1CBNDX=61 PNU PLVL=3]
> 
> While on some of these devices, there are also all sorts of artifacts on eDP.
> 
> Reverting this fixes these issues.
> 
> Closes: https://lore.kernel.org/r/z75wnahrp7lrl5yhfdysr3np3qrs6xti2i4otkng4ex3blfgrx@xyiucge3xykb/
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Fixes: 5978864e34b6 ("drm/msm/dpu: support plane splitting in quad-pipe case")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 137 +++++++++---------------------
>  3 files changed, 40 insertions(+), 110 deletions(-)
> 

-- 
With best wishes
Dmitry
