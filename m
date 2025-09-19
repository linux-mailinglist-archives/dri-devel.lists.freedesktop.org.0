Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9195B8AA91
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 18:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB8110E250;
	Fri, 19 Sep 2025 16:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lzejlcw+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2375310E250
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 16:57:25 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58J9KphH028314
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 16:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2SMDH20YTKikXCE41BaWkB66
 TeohJUYWgem0sV6RAUA=; b=lzejlcw+i1oBedZfaNudsMlavk3kgScMIid84gJe
 pW9ux9XX/6CJYWa/LZgO89bvsDFUDjY6X/zCuvr/wbSvFpz1jdcSrXoVLklOmTyu
 +nKbzo2RQ/JzD78ltijCipZSZEPetdnBGRGBWGDcIbSTd0kWdPJ/vbNUwpRZUE7J
 V2V+o57ltvjq0m6g1RYMnnVivLzSljWY12aW4lDtd3JMkZ1xuhQxZaYOqg/KeIO1
 GnWJw/NrV42nrWBcRA5wHTydBSca0OMox5kU/0096QiaI9+ncNl82tQA22s7lWfZ
 UWmqNzEUx0axd44nKN2Hb8L2OZdALFJ914tp8V+mj+KO9g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497v1jh5p8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 16:57:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b7a5595a05so49854981cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 09:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758301043; x=1758905843;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2SMDH20YTKikXCE41BaWkB66TeohJUYWgem0sV6RAUA=;
 b=gkTsJ+Z/N1K+zwp9/OAbX33zw9nbbahneqBoFfRIiZT8IKLpiihHOHuR3SSpoT8WpY
 9sMhtCyDEXuR84vEcAXTlDkxz3J+xnupO2VftiTgNXfaZF45PQV6VVa8PPQGxlz01HLo
 3+TzWL2QYkvQMMwxFY4+Ftt1jBR6xGr0JdAzYz/uOtxXaeY5lhxFnQjKhEONs/3NprZ3
 QBXuzHHjAQaEXb40kh3YKNRZyRzSBiQW0oil2rOjzhaPTohMrz0Y69kHk2t4pDRmwoqg
 56/TYFuUgj+fmmNcTYYDFd6ji7YX3v24YkQY9uuMH04sJU8WrQP6xDHC/Jo8O4wAQO2Y
 YbiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxOH77/y9PUITp+tQjHd1OSSKWs5EdHK8V09b5c9QNeTRpw2QuSiPCFmEjNp5Sgf2WEsJevsb1yzc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4UvEa4xgsxEYpedQTSBN5SwPLUPfxt0c6Bz2aQftDXK3ScaqG
 wbGaYbl3wnqijMe6RvXEP8DdkuaHz9TxGlw3UfVCN0D9GWPpPYw6GiEAooxA3ablKIoT3ESwOdK
 mJRVg2XleqhWTERbDAIzRw0W11dMiCfQDOXDxzw5+z7/uJQgBIS1WMoweskuN5gtOtQtGB04=
X-Gm-Gg: ASbGncuxAyujFgOGqeSQKQLt4xltfjh/jFXkm65lpmGLKqvX5qcXybKLWYxcl8TJJBK
 glO0n8sNBIQ3unestpbeyd1JN8uMex3KbiB3ZtKaJLKh6Spy2vOg9MmbwKe4OWhOhLVxrF0e3iG
 cbu/OaUzAmrmR8/n3tp8kaaea6343iZgVk8cQkZdLLwauCybAocU0tQHPsLDIfZhcv+K9Aw3Bva
 G8eAGPmwBUKdfbGyVqZnsCokXDlfdVd54u9rrvwzSd6ChAJZBt41VuEiI1gni8m1VtegavcVeex
 z8mDxhHYa04BuPm69RQCWdnXvmGpNFUWUjYa4j+Xmaa0+VzJJiU93YA4dgJ0RLfZM22W36/oApv
 tXy0Oh/N5FAyeS0rCJEOf1Ul23VenolYfzQx0a8aYYdBTQ6DICGtl
X-Received: by 2002:a05:622a:550b:b0:4b7:a887:9e68 with SMTP id
 d75a77b69052e-4c06fc182a2mr52471561cf.4.1758301043037; 
 Fri, 19 Sep 2025 09:57:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3Y/hhgM/FH1MUqyFEYlRSM4m13q51NUGUOwCJl1YfmyFvHD8/eWgbghS7pUxj3fFOk2haZw==
X-Received: by 2002:a05:622a:550b:b0:4b7:a887:9e68 with SMTP id
 d75a77b69052e-4c06fc182a2mr52470981cf.4.1758301042221; 
 Fri, 19 Sep 2025 09:57:22 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-36371919865sm9009371fa.62.2025.09.19.09.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 09:57:20 -0700 (PDT)
Date: Fri, 19 Sep 2025 19:57:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v16 10/10] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
Message-ID: <46syobyexy3ya3jjemmxc5g4tfkup62cks7gg7qpbnrga4fdhw@4ramayspl5uw>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
 <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-10-ff6232e3472f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-10-ff6232e3472f@linaro.org>
X-Proofpoint-ORIG-GUID: KUqDwcNkB2ttA0WmFhTMhkytI-xG7Z-N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDExMCBTYWx0ZWRfXwHM/iTjiidek
 kzZ7MRLxHpXbC3++PlWr+2Ps9jPXURtD3gVtbIaQUnrc420qWcBOzaC69RldxVccg/ppJ2m3L7b
 WnrnZRqUGqE85w4HN1OneBEX6ETyreTX2GNUNDCKWeT8R9pZvd7SnYdzeCP4KT58lfdPMCtbx00
 5iaeYKFY+PvvbOk5d6lw8isg2JwVLM/XFh6EnhPSbWwFfcotybj0SehLY/GR9g+RhWYpLH9HwuJ
 o4vnQq4+aDmkI6xYe0FDJg2Czzn7BH25EScpX88rUdJovPy6hR0O2rb/nC+AEzQQ/L3qqe7pg4Z
 DaJgsx2SMEHDrWvnxCNuLHeadgyAfaykayZoafEhH/rEheCfEnC5ZTRoqYS8nKwNFg/viA+pehh
 GoHFyUIK
X-Authority-Analysis: v=2.4 cv=AeqxH2XG c=1 sm=1 tr=0 ts=68cd8b74 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=CHF6AoUvwY4jIHrWGZsA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: KUqDwcNkB2ttA0WmFhTMhkytI-xG7Z-N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170110
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

On Thu, Sep 18, 2025 at 09:29:02PM +0800, Jun Nie wrote:
> To support high-resolution cases that exceed the width limitation of
> a pair of SSPPs, or scenarios that surpass the maximum MDP clock rate,
> additional pipes are necessary to enable parallel data processing
> within the SSPP width constraints and MDP clock rate.
> 
> Request 4 mixers and 4 DSCs for high-resolution cases where both DSC
> and dual interfaces are enabled. More use cases can be incorporated
> later if quad-pipe capabilities are required.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 27 +++++++++++++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 28 ++++++++----------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
>  6 files changed, 35 insertions(+), 32 deletions(-)
> 
Please fix the LKP report.

-- 
With best wishes
Dmitry
