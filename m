Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C28FB3727C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 20:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B073010E3A7;
	Tue, 26 Aug 2025 18:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eX0/HKGG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4582110E399
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 18:48:01 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QCD5pm008052
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 18:48:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xf6zh+YUIyDAnG5BFHyyQbBH
 caERXoO1mxLKUdCM3WQ=; b=eX0/HKGGC5ZnAJrPQniPN0S6qGHl9c/jtuHw4P5O
 VQXKS6cwWF9w+mK8UwyEOrORYR0V3AHbw0FIfl2H6U3zpQSYRpm3Uzf5izkvAQuM
 67rD7rqs8PdHFPhuI+i735wIC5McGEnTAcfg/wt10dLByjbywOn3sH6azGPpT6Kb
 ZTsulJ82Zz4s9YqcQpwTU8kH1bZTeV7wCipmjx3BdRaI99IU22r4eq8FuhubzluA
 fBXXHqUBWIrWVagz4hFeHmpRa6Rd3MeJnsrYqE1ALaIsEPX70szIpTPjtiO9Oe2X
 IjS/r/j+GXTujzVcW6TLuXn3kVCtr5NMHhzO42/Q7MUM3g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w2t64x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 18:48:00 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70d9eb2ec70so43163586d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 11:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756234079; x=1756838879;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xf6zh+YUIyDAnG5BFHyyQbBHcaERXoO1mxLKUdCM3WQ=;
 b=FspJFiBbCVEhn1H2N7y4LpB9UZxmKE+fzpKj3mF4EMkxBemZhcUMQJDHuvc97/5vPs
 pV04mK2P0q/tWik7gSOQduZXUN2R2i/TLw0EFdf/Jr7/hxTJ88a2eW3Mu1CNYo9AuHMP
 /ZtBmEqLUNZLNq/+B3TkMH+7s4BbfA+hrYjlQKRfSNAYju70xHXbwXfPFBtxA14HKI8m
 keI5jMXMqXg71VfrLE11XZYLRifl7IS0oRBboMpvzoZOg18MNUUOuoc+jP6usnOEC5fE
 I07sMwcUMr/YgBT5//a4Z5DP07Bndv8l1PSQ8IT89iYNFnMT80EZGr6Uf/VQGxRgVhwS
 MXrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCViOgUQFyUPpRfrHMoMrDXwt4HdnzhFAu5Vlt0qtXFwo98LTz+DoIObd7dF2LdvxWSC/AA/HJr6sKY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yym6q5Hx/mdA2vGhbFp9UBOqzRn3j7K1iumUQVhis5ukADW9URE
 MeEzB6ga71L6/3x4RVcCXwag8H2Ucj1ZLJ6Fm+Xzk85fd6quBYhf7Iwoi0fN22pstnRRcJKgGej
 NrEPX+bD187/K5MTzXOw4jgfa6aEJ4V/nX4QfzS6HURUXyGYJt6t6GTqKPxohRuLSEkinzAc=
X-Gm-Gg: ASbGncvlAvVJm057aisW8qeomnxFxyIEyXuhzOuTXpFzkANblhhma4swJrmExIihp2r
 JrVuMMZFkX8JfkBXXTKY53AIZpbHiP6QrWZ2kHiHdUTxe3k8QbGtyu/rLfDSRjhgT5pUa7d8MZ/
 0UvEZXAceEJDol36UusYj/OfkCzmjjTFijeNs2k89rsC9ngcWQQqC1v1XEUFn54vEUs5A2Pgo/6
 231Jn6yS41lGmnzWC8YZ1M3EwqqHpJVhx731dBg4Y1Xby+buQLd6IDvMijbE80z+2QRobevxjj7
 WlgADT3VGaOaKqKR5LPR1UJf0f/0ABm6mEPOAEN36dI0LHLtQcey3b892AFtd7HwyzYF8WaZBek
 6tm/eFAYdpUqP2ZkjA7Oxc9Oc0c2tnQvW9VU326hPx5tmXVA37Dgm
X-Received: by 2002:ad4:5d6a:0:b0:70d:95a9:6042 with SMTP id
 6a1803df08f44-70d972fa85dmr191563796d6.29.1756234078971; 
 Tue, 26 Aug 2025 11:47:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYYuUq+/6Jzw2suyCggISeUAr69+TeoIaztg68BBBhft9Bnl7W+AOYaJVGrHe3y/GTb8mo8g==
X-Received: by 2002:ad4:5d6a:0:b0:70d:95a9:6042 with SMTP id
 6a1803df08f44-70d972fa85dmr191563366d6.29.1756234078350; 
 Tue, 26 Aug 2025 11:47:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35cb5764sm2431932e87.164.2025.08.26.11.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 11:47:57 -0700 (PDT)
Date: Tue, 26 Aug 2025 21:47:55 +0300
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
Subject: Re: [PATCH v3 33/38] drm/msm: add support for MST non-blocking commits
Message-ID: <56tbubd46myozsycduvb5ds26smzosydr5fmbvmlv6yoiqt5wr@3ib5gnspxxqa>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-33-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-33-01faacfcdedd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68ae0160 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=B68cQ6cBXuK3sqdErf8A:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX1EiftpkozZIl
 RLeacRwrrShv2YWDqSqsGw8kbgLDeOSLoxgZsrZYt+bgB2y2aGET0MZQKlJfEnDoCxZ8JEIABtK
 5kGUEEy/NHORiEcnAy5/cbLnIHuJ8JXJGFI9im/ufL4TCIrgT+JAaIzmp2P2Uw0PMGJfTm3tC5E
 SiyduHWumgaZwsN32ZZc+R9i0D84Ia32Yqks49UytkfIYpX7gbSThQljm1xXKEhKNk3aPy5IQaa
 xshMEG+z4olB4oUfhldBXmQjIxTEs15IJ+71pdbgKHu/TbVBlKxkXVhzkOjdtRo0rthj9NhfVcX
 MOH54t/JwuVSTGccmhdY4EN8FKibcO6T9d8aNMvpLFMno7dxHemv58BdFlxSnvwS1C1wdxXuu/w
 BEUYL48O
X-Proofpoint-GUID: cAIE-ACETerLEaVVNHOd1ssXatHxEUFZ
X-Proofpoint-ORIG-GUID: cAIE-ACETerLEaVVNHOd1ssXatHxEUFZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

On Mon, Aug 25, 2025 at 10:16:19PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Integrate MST framework APIs with atomic_commit_setup() and
> atomic_commit_tail() to support non-blocking atomic commits
> for DisplayPort MST.
> 
> This patch only applies to MST. For SST, non-blocking commits are
> already handled via commit_tail(), which internally calls
> drm_atomic_helper_wait_for_dependencies() in the DRM core.

I think this should be squashed into the the commit adding MST
atomic_check call.

Otherwise:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_atomic.c | 3 +++
>  drivers/gpu/drm/msm/msm_kms.c    | 2 ++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 3aa0020dec3a90b693ad3d4171cfcffc091aad4c..b1656fb456d54af11ba8a30d4971fface114c7a1 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -4,6 +4,7 @@
>   * Author: Rob Clark <robdclark@gmail.com>
>   */
>  
> +#include <drm/display/drm_dp_mst_helper.h>
>  #include <drm/drm_atomic_uapi.h>
>  #include <drm/drm_vblank.h>
>  #include <drm/display/drm_dp_mst_helper.h>
> @@ -226,6 +227,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>  
>  	trace_msm_atomic_commit_tail_start(async, crtc_mask);
>  
> +	drm_dp_mst_atomic_wait_for_dependencies(state);
> +
>  	kms->funcs->enable_commit(kms);
>  
>  	/*
> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
> index 6889f1c1e72121dcc735fa460ea04cdab11c6705..09776be1d3d854f4c77d7df3afa8d56f53639411 100644
> --- a/drivers/gpu/drm/msm/msm_kms.c
> +++ b/drivers/gpu/drm/msm/msm_kms.c
> @@ -10,6 +10,7 @@
>  #include <linux/sched/mm.h>
>  #include <uapi/linux/sched/types.h>
>  
> +#include <drm/display/drm_dp_mst_helper.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_mode_config.h>
>  #include <drm/drm_vblank.h>
> @@ -29,6 +30,7 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
>  
>  static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
>  	.atomic_commit_tail = msm_atomic_commit_tail,
> +	.atomic_commit_setup = drm_dp_mst_atomic_setup_commit,
>  };
>  
>  static irqreturn_t msm_irq(int irq, void *arg)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
