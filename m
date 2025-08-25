Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A4FB348B3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 19:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DBB10E51A;
	Mon, 25 Aug 2025 17:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NVZ9EhpK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F3910E518
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:32:46 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PFP2aU021128
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=PtOiqEStQKZ77zF7pAKUnMDX
 Hl86zn3BR3KKMOrL/y8=; b=NVZ9EhpKamed2usnZ22OuD7deiCJJtYDOVcRZlh4
 C7h0LGQNQm4BhPWhv5UxLXdQSm6CPiDDWxMgkf8XfW4x/0ShSHHRDa988lxJHkdY
 NMkcr10gI4fWSRf3z3vL78XnME/a7n3ijNuUXGwpfJFzZVXbJ30z2xzJ0rlP3MuP
 CNOc6p3+/nvhLe+EUYefcW/fhy5KdLsVz+Wepweh0hDQMC41mRXMR51xnSJCOeJP
 3JaDIIjgRpaJNIKcglNm6TILMfgVSJ1BlG0wpkw255znSohOILxAJL9i+Vg4xdBs
 H8GcFpp5dOTcDqddrRJs4zhsj07NveIQud2D/+C0TDQXOA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um61nd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:32:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b10946ab41so112919381cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 10:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756143165; x=1756747965;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PtOiqEStQKZ77zF7pAKUnMDXHl86zn3BR3KKMOrL/y8=;
 b=seawDMyA1AKxTqXVwwGXSsyvC1cOBWpR4KCrg58wY5j9pG/f9V7xedEyZZCrBC4OzK
 NnPCNJTr0Rwv5zzOmczh4NaKmsRZD4cGKhykHk71ZYUY0nYDW7+7XjfY1TiZ/OKVMW4Z
 eIozwiyGZvavbcQUqBsRoPHAe/r2vrDiN27uli5Yo5tCMjf9Vo8fp3hPZ1Ghxdr4YKfY
 vb0OMk9ZuFsZPf0UnPqG8hFiI1dbp6tdaTtOmrNiAsNwQfnBM0RQ+haUrggrxK5wigfz
 R2wQmmp2MTbHrpqnNW1WLHSkCPjdPa0FQfO4Prz9iYFWuIdq3Zx3nn0as0WElOJixjfv
 pQbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDg+CwHrdvBM4JhBnvs/9H9UR+WNpJP8yohU9D8Te72l9jGskjd2rNwsSzjwrVYUbVc1mkk22OIm8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyVKBEUagqh053vhgE6icy9dQd3FZcxXdXGAd8pjc1Kqr3iNLm
 MuUyUoNInGlS+k5sr7Oh9WAxtcr/Cx6r+jG9hsAjMuznRnIyoXgdx/SVn0Ael+aoy2zggEndp4f
 HArJ3ir7e6GXb/RD/+CJg4vwUV51Jn0fV8vxqQc9wuRXenU4PNIfq93PHZZ9RM9w+v0z7IzY=
X-Gm-Gg: ASbGncshHpkY1zfVh/DPjLDyeEw6EOLjd55sAgqkN1+Q/lIICDQIuPbfiX/S87D2zug
 j1GtYiqIAl+JaFlhkw6vy8+VRdIEFkKzgfbymTYxcO3jNLjT6MXozzV+9BdrtoNH0Z0RGonCIq3
 12fgiC53zupu5IPpvL12ZaNhgiR8pe2fTvODskducdDEb+fr3jLL2ejcGpq6H/Qx9nhMfhCsYtW
 R9GvrOa8BDntOsmEopdSiYYJHTEwnHv0cA+CK2m79zTQUW5F888sBrHd3N4dCeHoIMR5cotg/YZ
 VaPAOSht2A5Zfefa4KgNgGdzucrmVOQxo1vF0fHNGqtMH2g6W9O4BrKHTLFu1jQ81N3SEPmMzAo
 +2MerwTrSxclDIRYM1Di2MqCz5EuKlu+iHP8CW3/dFrIKRyvuBVCT
X-Received: by 2002:ac8:7c41:0:b0:4b2:8ac4:f098 with SMTP id
 d75a77b69052e-4b2e0a20a11mr6080981cf.34.1756143164599; 
 Mon, 25 Aug 2025 10:32:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyWUI9/JcuNq34IRC/iYRA3AEnS2Qy6SSU8Z7TfujwVKyou4G/jnYD5HrIwMTWY66+zeUXJg==
X-Received: by 2002:ac8:7c41:0:b0:4b2:8ac4:f098 with SMTP id
 d75a77b69052e-4b2e0a20a11mr6080081cf.34.1756143163891; 
 Mon, 25 Aug 2025 10:32:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f3d4d1afasm1436815e87.58.2025.08.25.10.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 10:32:43 -0700 (PDT)
Date: Mon, 25 Aug 2025 20:32:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 07/38] drm/msm/dp: allow dp_ctrl stream APIs to use
 any panel passed to it
Message-ID: <jlgm2fgkyflflphtb4cv5gqedvbrstc64rz5iihjvvwvncha2q@5mrwxuq3i7jx>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-7-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-7-01faacfcdedd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68ac9e3e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=6Lrzk36WTCfDkofcdswA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX0qF+8wKZVj8t
 PgchVMw2P2MDuIEZg37ALrHewYjDUvRfTWwJwMthf9XP4DR57Ou3G/tMkfxjHHz4DISoSPwxxCV
 x175QmQDf6rBVjcfEXBO4PSYfnB5RJ7mRQqkLU5+ALtLPjisf1xdXmouiJJGhNkjk5r4RhKbrWJ
 CxbSifDCFgxDw0fDQf+ap+s0qi/PMqaQnj4MP6q0Pr71PbWsb1gWHUyLVPK0Xec10HdOSmuYXbZ
 epSMTQi468S/uWCIrFaC2p+Fwhdvf87KFj06iTwKd/V3Mfhy+bZBLxXu4NT6m7Cpv4PK2refRp+
 /3G+6/+071SOvZF5/tuFWiddcWSeoawA7lFOru+AjKjdgH2ETCPtczXKeKzpSnDpGM4oMLDLDhP
 P5g55TI8
X-Proofpoint-GUID: 4nqE52BffKhk0cIRKrw46aa9K7i7rwcV
X-Proofpoint-ORIG-GUID: 4nqE52BffKhk0cIRKrw46aa9K7i7rwcV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032
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

On Mon, Aug 25, 2025 at 10:15:53PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Currently, the dp_ctrl stream APIs operate on their own dp_panel
> which is cached inside the dp_ctrl's private struct. However with MST,
> the cached panel represents the fixed link and not the sinks which
> are hotplugged. Allow the stream related APIs to work on the panel
> which is passed to them rather than the cached one. For SST cases,
> this shall continue to use the cached dp_panel.

cached -> stored

I think that for MST case we should not be using the msm_dp_panel for
the link handling at all. Does that make sense or would it require too
big refactoring?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 21 +++++++++++----------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
>  3 files changed, 13 insertions(+), 12 deletions(-)
> 

The patch LGTM.

-- 
With best wishes
Dmitry
