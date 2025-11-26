Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9EFC8799E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 01:36:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92AB310E4C4;
	Wed, 26 Nov 2025 00:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nf9oO2VI";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AA9qhval";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B5910E4C1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 00:36:13 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5APGgntX3588312
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 00:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=kUmhtGKileNcr5d1+kHjKgJg
 QZ3oEKqCuynOnc1D3Ms=; b=Nf9oO2VIJJLviXbqo+9exi8tx6bWVyUtLj4B0IYJ
 vdJocpRAAPfT0m80IjKwOEQhZojD5dceTmBYX9oio9rmXBr3ekEeDUUMqqppCGpx
 XmbTfmKF3woQfqOXZ/L9PTwhs9gdceidTXPqvnqgScR+riczL4EQyxQhPZ/hX8Yb
 3BvBigJKntbIJLEyP/wxR61i/P4aCT80/5044kKQOnev+v01fFhwvv8akD1ILWHn
 pqxlb/6l0jmAOLzYCtnSQj1KrK7sig9TDDU4SdKPjsreYtsXLqcrzhfAA2qdrU15
 zDQ91trvCCdiA9/0J8OFjfFTtrrJLRiw+cgmlXbqRxGtNg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ang79136b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 00:36:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b234bae2a7so1666970085a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 16:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764117372; x=1764722172;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kUmhtGKileNcr5d1+kHjKgJgQZ3oEKqCuynOnc1D3Ms=;
 b=AA9qhvalk8zqks+N7X5HQIeHVGc3Yu6ddmrRsF/6L862VgOHrJpWVC/8e8aSNhUDgU
 PyyxAWZHBFXnZXvtVg8DQbMX+bCcII0szbOKQLPvIFn9y8XtCegz1HbFz2W1vGaCZeLP
 QYMlKO2VtzE0nKyz8UiHFaSeAumKVjkhCHr+mcKUeARB/ZfIZ1i34ncpaWuWCcE7Ssm9
 qPXC9TQU0Wkak1sbclIQc440YTWfnkT8GozstBj8r+b2phPRYlEhVLVaDFLPtWlzfEq7
 v+QYolpKmOhoaF0hmWTGflkIwGVJbiM/7QHYg7akvAM5G+KGgqD6BCeA10ECNqACAQZd
 Slsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764117372; x=1764722172;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kUmhtGKileNcr5d1+kHjKgJgQZ3oEKqCuynOnc1D3Ms=;
 b=nl0vXOZF/kMZxT2BJxgrPua++a/p/PbLCHtvLVsc8DZg+2ejd+8FNiaIpJNY178SXH
 1Xn3C8L6l1RRsYLMni69ngRh8NTrE5cGPqBvNVaHyeEJvmbwzxqCvaPq+gDi/hZmZHNV
 NS3QfPDXD26PabaeTXGByxoBUzRzoTN6WEw3S1ng2imJKGjy0U9wVt15eBZnwdwwBjP5
 eS2Zik6e8Y0s5AzU21mwfgLFpQ2ZSGLMwiuR1+8Qftuy2wy3Ff8tPROEQ690KkN8Z6kU
 LJktctAvq79qsdXLhDg5r2fqw/5pKxbM55Yx1vYPxvb89X5IKvpeTzGHRoUaI83jPlRd
 a3zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV85ktKCsXwpT6B1cjnTzLATVtMNbJcq+8cmirmKjf1YlVqxMihtHtaq9O9DqtRW4QvjPy08BALZr4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzwMA7U7b5SBsRrHEDvQEJzbQg+KXMV+XNbtVGxBh8B+kjXPB8
 DLequpNSzO2qv2rlPkJkqIOdrS3QI0IjkxyCtxF3bUsS/gKnflyjRfNlBvDmr58awn2A2YIZem9
 mKnOFZN1O7KZ+HvsToZbSec04w9EhG4yV4bHIA7RDn7YVOPIMoBhlhleucYzfqOD5iT79vWc=
X-Gm-Gg: ASbGnctJeCYNAM6X7L5qGpYTdzs6uPh4owDS5wypI00jsciyUgTq0IMz1j9p8VB/zia
 jfyQsaSEpLPNxXaxx3qIr0tCdV8PktHA45JlKRczQkQUHZGbha+vyIHgOIxj9pEPJsPR5Mn4yAm
 Aowg42eOsFA4KP1xHimevqvhjVZ9pvO3YYELD7xoQntQ3s8Cy/7TgWH046yl88aoqN/ozUnxLfi
 Nax0rPBdn3QLNHxguOYW3jc0E1Feqxq0ObT8fE70piNEKnFOlAfm7jfsX7xoIqM4a99Np7oBJL7
 0nJaCZi+2vgWJiq2aIVgpwXNhNer0pzloKw3ewQgARd/LB8HcFzbbfvw45pcUGbCexsc7yiC4X8
 d0yYPcZys4s47b1yM2+9C+nYvH2voXb8M9ORn4FtT6RDOSCe/0/n2S30952T0TWzpmYDQUX0lTp
 bGxXcC6HDSlx3Q7f2MtIuWfz8=
X-Received: by 2002:a05:620a:4721:b0:8b2:598d:6e78 with SMTP id
 af79cd13be357-8b33d1cfa05mr2248613685a.20.1764117372082; 
 Tue, 25 Nov 2025 16:36:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbUaNky8a208Ayn7g+O3N1SROBIZYsA2yB5s5KH6Rgu9PO7xh9bnordGESPhEkayE8CbD0yw==
X-Received: by 2002:a05:620a:4721:b0:8b2:598d:6e78 with SMTP id
 af79cd13be357-8b33d1cfa05mr2248610585a.20.1764117371653; 
 Tue, 25 Nov 2025 16:36:11 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969dbbee7bsm5579665e87.50.2025.11.25.16.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 16:36:09 -0800 (PST)
Date: Wed, 26 Nov 2025 02:36:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v4] drm/msm/dp: fix the intf_type of MST interfaces
Message-ID: <3cnujrkkcui34wg3jrfoezradc5itm2paw5mgkii2d2snlac2a@lerj4ldbvf4l>
References: <20251125-mdss_catalog-v4-1-df651fba2702@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-mdss_catalog-v4-1-df651fba2702@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=P9Q3RyAu c=1 sm=1 tr=0 ts=69264b7d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=OLtbIiM-HhkAdaCUfmYA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: HcbHZxi2HCoxOvXwn3VyFGWCEwo1FiSL
X-Proofpoint-ORIG-GUID: HcbHZxi2HCoxOvXwn3VyFGWCEwo1FiSL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAwMiBTYWx0ZWRfX8MjjhCu13sZI
 ZcvEKM+9EZiq3S5sYVwodu4FsWeD6i1lxr1jAioGGIeHlKA4ttIbKrxHVyqmoGOCiu8QZyb3BJm
 Mc6K1BiCECdi8eHDeL5S360G2voWwPqCmrHYaQyhDw2iRjS1LFlA3uo322JLBvOdChbiq5u6w0v
 7HGKlxBkeK/S+6b3OS87+d5QEZfpI8n9HyyjAWGd7pRRaBDch5bfIblnyRCprtM4olKGzMq6Mvw
 BKWhUCU10ysCLgCW7HakatutOMqhPjRO1eJUkhvy1LsKiF7H8IDvG5fu0qDu+OZCriMDUkaU+2O
 muzxL36EpREe+csnnKn4os9CU2TSg/Tz1o8DbcMRNpXH1J81kOoeyE3rHZVvmt2U6+DY2mvIVe/
 XJ3/ddZkRxOYjmKRZw2ZxAOfrqNUAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260002
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

On Tue, Nov 25, 2025 at 04:22:12PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Interface type of MST interfaces is currently INTF_NONE. Update this to
> INTF_DP. And correct the intf_6 intr_underrun/intr_vsync index for
> dpu_8_4_sa8775p.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> This patch was split out from the MST V3 patch series:
> https://lore.kernel.org/all/20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com/
> ---
> Changes in v4:
> - Splite chagne out from the MST V3 series.

Why?

> - Link to v3: https://lore.kernel.org/all/20250825-msm-dp-mst-v3-37-01faacfcdedd@oss.qualcomm.com/
> 
> Changes in v3:
> - Fix through the whole catalog
> - Link to v2: https://lore.kernel.org/all/20250609-msm-dp-mst-v2-37-a54d8902a23d@quicinc.com/
> 
> Changes in v2:
> - Change the patch order in the series.
> - Link to v1: https://lore.kernel.org/all/20241205-dp_mst-v1-3-f8618d42a99a@quicinc.com/
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  6 +++---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 12 ++++++------
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  6 +++---
>  3 files changed, 12 insertions(+), 12 deletions(-)
> 
> @@ -363,15 +363,15 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
>  	}, {
>  		.name = "intf_6", .id = INTF_6,
>  		.base = 0x3A000, .len = 0x280,
> -		.type = INTF_NONE,
> +		.type = INTF_DP,
>  		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
>  		.prog_fetch_lines_worst_case = 24,
> -		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
> -		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),

This is a separate fix, it should be a separate patch.

-- 
With best wishes
Dmitry
