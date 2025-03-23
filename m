Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 376D9A6CDA1
	for <lists+dri-devel@lfdr.de>; Sun, 23 Mar 2025 02:18:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16FB510E1AD;
	Sun, 23 Mar 2025 01:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fuJBJc/p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B0710E176
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 01:18:47 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52N0SJrk026553
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 01:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2R9ezOTp2OXuwq2T5MuT2vKZ
 RZJiv8BpmQQIAHvkRRo=; b=fuJBJc/p1pME36ADkN25DN8/FvUuW4LGyR0BJfGw
 LkfBleFjuQmWhD3r/zLQxhZevo4KIET1dD+C2qwlXWstLq60ZJZe1UcKDJIq43L3
 CbzhVWK8TZ8GFc0blvX23vdn1TKDHrcS7vkFjFiw5H8mO7VlstReT98uuc+nBpJi
 xjoytF7/xSAbzpfbBlsjpvvIrZoK6zyJYbZivwCcOmxoSPCIXag7aj3djHnuS6IA
 GNHuEJ7oZVXqxDF68QuzHldLNY8Tx7cWhb4EjGuO2lbqa+xbjdioZdfGU/bvRc6U
 BgdttTafXS3rzpFRgTL+wxNRTAok9q0/ier+QJvHf1GFiQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hpgb99jk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 01:18:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4767e6b4596so54835911cf.2
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Mar 2025 18:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742692716; x=1743297516;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2R9ezOTp2OXuwq2T5MuT2vKZRZJiv8BpmQQIAHvkRRo=;
 b=tiZSi19R+8yWo7Q0EX/FQKI0jpDRTSN0F4q4nGOvvMzWpag51HE3DRFAuZryZbb2IY
 Sj+25Eu5l2pCqrVAWjBbsO7mkKy1oVgG/Ch0EQl6zQwT5reuP4f1RzoJ8bUlpLlOak0V
 se4tH8QWmUm4t4/+/t73XRrnGAxQD6yIY2l2KpNMm88wltzW1zlDDIWTWvVbuFRUHtEm
 EZ3aOBtkYawY3GRj2154th1W4NERkhFg7We6wkXPtyvvNbtf+IeWhsw0j9VBdZ5wrwI8
 VKyz9OarVJGytAtMo0x5/kCBEO84Fg8XwVZ9r4sg9Jf/YGzej5f1QhrUnvVGCbs0NxeN
 wFfg==
X-Gm-Message-State: AOJu0YxHpNV9rr4DABNi2SQ8/LAPMP/vB1Jh9Xyvc5YGCu/TcLSD+FEh
 rhUyqSrVYUGkzq7uRZjFRZUKGivKNgiFPstuUtWVhUMHg1ecwHKYGEQEQC8H+t8q8UIBP44Z94d
 KjExSW5YaKd2Yk0+fQ3nvKyjYIBM1DXkE4TDUeatN58Q8G9im8bw4aiRRn6KBeKQXfsw=
X-Gm-Gg: ASbGncsvWGmf4WYV+4cVY6uZSPJRGEUM7+q95mG9rTU4fI8xW7R1bwUSrpPTUROjNCz
 j24cBrjfpBhnFYz+gsoOvpnt12NrYEVh+/sh7ecNs7B/yyTheX+MEeUyeQQD8AoyeDGga6Snf9/
 LDeJI+BenfqIw4C2mbnad9xJKfnhqijP5/SncA4Cwi9dWyc2xx9RpRnmThHC9GpX79NkWPXA0Tx
 3WVDl6sTaoGMRerwF5mPswKkLunlBly/O+1EkDzClUSUx86uj5wZga+5ZkdoEIE4QpjxvibOxc4
 I3uHmhXJvTjtaITLfdvAb5ZSX9u1c7BbDyLZ0mFQT0bSwgVxViG2JWoCePH53VeUHcfhoKYI4wf
 QHKo=
X-Received: by 2002:a05:622a:906:b0:476:a655:c4a2 with SMTP id
 d75a77b69052e-4771dd922e7mr125176661cf.22.1742692716019; 
 Sat, 22 Mar 2025 18:18:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0/WAUbrypxHSD2MRLn7a/ohpYmGZD79AJWPxjbyAjULl0qmwkDIxxDUHGu7wO7VnkZgiMmw==
X-Received: by 2002:a05:622a:906:b0:476:a655:c4a2 with SMTP id
 d75a77b69052e-4771dd922e7mr125176401cf.22.1742692715594; 
 Sat, 22 Mar 2025 18:18:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ad64685besm635531e87.33.2025.03.22.18.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Mar 2025 18:18:34 -0700 (PDT)
Date: Sun, 23 Mar 2025 03:18:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Will Deacon <will@kernel.org>, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/adreno: Drop fictional address_space_size
Message-ID: <tih7arhudjn2sotdvjddzncqi7nyx3xgsvnfi472ve7xcwhhqd@2nlrtoyymkfj>
References: <20250321185437.5890-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321185437.5890-1-robdclark@gmail.com>
X-Authority-Analysis: v=2.4 cv=BoydwZX5 c=1 sm=1 tr=0 ts=67df616d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=qQjcqu3RhaNh0RZ1ZdMA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: qwS2Ihkgw9CRCs0NW8gEuSeuaIbGIDhl
X-Proofpoint-ORIG-GUID: qwS2Ihkgw9CRCs0NW8gEuSeuaIbGIDhl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-22_10,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=877 lowpriorityscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503230009
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

On Fri, Mar 21, 2025 at 11:54:37AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Really the only purpose of this was to limit the address space size to
> 4GB to avoid 32b rollover problems in 64b pointer math in older sqe fw.
> So replace the address_space_size with a quirk limiting the address
> space to 4GB.  In all other cases, use the SMMU input address size (IAS)
> to determine the address space size.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 33 +++++++++++------------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 19 ++++++++++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  2 +-
>  3 files changed, 33 insertions(+), 21 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
