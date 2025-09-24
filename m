Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDD6B9C44C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 23:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B500D10E7F5;
	Wed, 24 Sep 2025 21:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AJjVsTMY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64CC10E7F4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 21:25:57 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCGQne016438
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 21:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/q7ck5ZyxDPq0cljoMqHt8gL
 Qtmb0+gJMZIvbJmIoeg=; b=AJjVsTMYWe8KNtGxUliteivSdRkvmVN37VkR8vQF
 81Lr7iwa6AFnulnbbWu+5Oeqs0JVdbxizZ7SbK6cXDLnHiMCvM89NE3m3c83QY9B
 D7mGjjnRSzaVRTHUqZ56u3PTtxTXR/qlHdU89+HWgbnme0gCCt7f4hfti9q1r4KR
 2YcapPTFg3cizBULbi7I25kjZ451aa7wEkWTUWydbSWqTyQ4amxLfEk7O0Q3XA/o
 s1Bp6k7brfs1hdpi6/hf7sP/vTkC2V5Q2MVmNPq0WdXr8KUgKJDQJaTgOTt+RvaK
 k+AE9gYXmECSk95qhMes4YN0gcRbryckYbSQGagVlI92Rg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nyhm4u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 21:25:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4d9ec6e592bso6121931cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 14:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758749156; x=1759353956;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/q7ck5ZyxDPq0cljoMqHt8gLQtmb0+gJMZIvbJmIoeg=;
 b=lAhVKnUIPdTyqDNxzzxOG8kk5ZYIYMiOquVo3IFlkQFJtwANK1UwzOUSUCXiBJxIdX
 7nl3cUMESze2yz+QkeCIeQyjonwniGM9gGOpYzMGp6hcqeoHJySaE750FowO4x1bjzAM
 VQ6pfRTCZwvZvK/KQpNWxFmN4DH30dINiwlemXT1j5vfEO9sP+G/khmJNfoeNRHg35L2
 wyhYuapT9fbe+w6UbDb7v6XB3c51+FC5RCoznlk26u9id2ZJ7Atws3kfAJPMdu5M3VGG
 1KC1y/xkdfSU5z56L7KmNZ2DjCKoyP26/DCs94PRal/IOd1sn2Y2HzA+XgxSbioMpaXn
 1AzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz1X5ywCWU5XM3tGvSn8udp2cQdCLgnno67cv4YtNevzFE0yypUMtRGqwE64zPCEAARYqD/31yx6w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDhqMJIDuT7pJEYkqWZSk7f96D1avrBEn06q/zhNoySGYmZXyM
 d3V/EqnVfzdxMN6lrxpAGCTLllbrepoPCNAYVpth2kFMlMXk3dk2iO9ehayCrY2YmqrCxSCvOpw
 DRm9ZfJa0ppRXYwLsGG1rdV/y2lCmdQIVTzjYbXnwz8YB0uliFox5gQQCRJsKsxKlV10p22I=
X-Gm-Gg: ASbGnctEc/D6um61Q3vv7b3DehiX58D64UgUHNDdbaEfd/pi4Ykt3z1T0xASIBVt9fp
 kCoU2EK1DJ1VpHQZPIfFMCRWXTCy3gNXERCzEbqBQXi04sOx8ic3GpmqaiGoQLdy6QKdmH+hIf/
 /FDkhZzqlKY3U+/fG81jUmbYo2PWeIuMtN0r20YmRrkfBLMg9DPXcblXVq/KKp/psskSp9nu5Nz
 rlLxyj/R5L/lVpUSRMM8fQTgEifpCtjalsLT/wzScjbu4hobWP4x9pD36Fkaj6/pCTmiE65A9vc
 1P9u2PyFh4owW6LumAuqjtK/UtC1XUmGm5LttyJf/TGiLeh9ZLH/2we9kLJLVQRbS0toAycuJGK
 5DYxe5qKuQQjby+iIJ3zpf/QkM8NLerSfemFNzmyX9ZmlbdHY0Vd7
X-Received: by 2002:ac8:7c42:0:b0:4b7:aaa2:c8f6 with SMTP id
 d75a77b69052e-4da4b42c83cmr16927671cf.43.1758749155776; 
 Wed, 24 Sep 2025 14:25:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFa2soASBumvR1Wp37An6aFpQ1N0R0qrYSFiiAAmklOZuBLiBN8NvuSKWYrA3++YveaEu9QLA==
X-Received: by 2002:ac8:7c42:0:b0:4b7:aaa2:c8f6 with SMTP id
 d75a77b69052e-4da4b42c83cmr16927471cf.43.1758749155363; 
 Wed, 24 Sep 2025 14:25:55 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583139f9915sm33226e87.39.2025.09.24.14.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 14:25:54 -0700 (PDT)
Date: Thu, 25 Sep 2025 00:25:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v2] drm/msm/dpu: Fix adjusted mode clock check for 3d merge
Message-ID: <3h57fefla2kv5mh2fmldma5v57do7uohljnzyd2pnkpsdugxle@ylqizvhtril5>
References: <20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d461e5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=1bp3yVi2_WrJ7BMISZwA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: mBcdJm8XBUO2VmnqQAp6QmtX9F6rwvW4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfX+deaaHpuIl47
 5fBs1pgeYdwFV5uGLQxIDofJyFx+iMVVPQ7mAcQ8WJeQCoirrXXMX2LcppompoM4ZG4wKWCcLYP
 nF+//KrHlQEBofNPaXA8qLCUn3WmGpqw1b77y3qJqDHtiwCgPRtdIsD0HQt6P9GuRursYRDYuyF
 KGQJxjy676iSiAAKLyJAhWAKztUsKM/Zcc3pENWpY6mPMQGK4g9zo+HjgShpffK+8pjaE2pmBlq
 w3OY48UL0Y/k60YQn/ls68TgOZbhfZgxHI8eG8gsNZEnTj1qkRgYvZkEfSXZMYX/5CTaWuyhqJF
 Jt7YRBakgCV19BuHIgCCHqquOJiukl3ZGyj2Rl+aIrKM1L34wqIGESaMLU+TezAWH/AjZi+Sz7d
 c1U37Wgn
X-Proofpoint-ORIG-GUID: mBcdJm8XBUO2VmnqQAp6QmtX9F6rwvW4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_06,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090
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

On Tue, Sep 23, 2025 at 04:03:50PM -0700, Jessica Zhang wrote:
> Since 3D merge allows for larger modes to be supported across 2 layer
> mixers, filter modes based on adjusted mode clock / 2 when 3d merge is
> supported.
> 
> Reported-by: Abel Vesa <abel.vesa@linaro.org>
> Fixes: 62b7d6835288 ("drm/msm/dpu: Filter modes based on adjusted mode clock")
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
> Changes in v2:
> - Divide adjusted mode clock by 2 if 3d merge enabled (Dmitry)
> - Link to v1: https://lore.kernel.org/r/20250922-modeclk-fix-v1-1-a9b8faec74f8@oss.qualcomm.com
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
