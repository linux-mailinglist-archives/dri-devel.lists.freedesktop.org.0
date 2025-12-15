Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 801A2CBFD1D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 21:48:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B6D10E51F;
	Mon, 15 Dec 2025 20:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVIB/ia/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BaI0O6HF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B8D10E4FF
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 20:48:37 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BFGj6IV1824278
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 20:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5pki75WPCYaCGC32sVPKpS6f
 I/bdegMiprelgAi5BB8=; b=mVIB/ia/kCldiJCOFdtrqEX8ET1h29tPZY/1LXy8
 4JpU7W5CxK7bpSMjdxiN853d5HA3oj13c+QnU8zcg0clU8Rr+chRIVKYRdB3Ny7b
 ceNarShcH4Jtdh5deNfnN5SFH54ErI7yrdWZaud8JRipqx0cgxBdCB4BljSQbPQb
 M0nH0N/ccvFiCRhwBEE1823BnTfTIAr/9576ZN9IyK+M8Nbw6+HfxSIethdj92SP
 hq++FHIoHvc10yIAxAonWwkGYfT5NCBsEbeHJq5a+DK09UmC5u1WV7ARgk/OSa23
 djsE629VE5UT3ekub+jP0+XdnOAUbvpK5evOKtY1L9KmNQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2p4f0kp4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 20:48:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88a2cc5b548so41915806d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 12:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765831715; x=1766436515;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5pki75WPCYaCGC32sVPKpS6fI/bdegMiprelgAi5BB8=;
 b=BaI0O6HF7LzVZ/6G3j1IzoN1z8L/vK8fvZNmF95521Ydrh0z+yZwIcpANuflW4KZjP
 FGxkj0qSH6yHVMIhfINxLwK93JFGNLoFmdCrcV9R8WPdh2IBXvo2zeEJvnTS8XzCThfu
 QA37bHrAnGarHX7KaTya95LVVN/0dYyB+wZoJq02IkuY911+6JYCqtizj8sg6OGp2jNY
 brQDmWPScbsK1OIbz8Z+4eDlhLAUv3X+q+um3aAocUsfFT7bQUwH9X4meloyjUQbMy0Z
 iK/loZQHYBef5zYnrsYQDXH6kBha+/yk8XJ0udNRYdqfWlgbRiRLcOSYXzQHu/NpGu81
 F8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765831715; x=1766436515;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5pki75WPCYaCGC32sVPKpS6fI/bdegMiprelgAi5BB8=;
 b=bDBsRUiOCFfXVBKeF2eGX79X32oWD0XlKISH978PsIhniCWrp9yIaBVtx7zWWqtQhM
 vtZvl3J6PfYd78cjyZmBQvS8q7ATCRFHsSeFKoJJzLIn/QM1z7qdG/1JllFn8paG86hQ
 vk4e9L/lqgYC/ZGvEbuv5vw5fFjL/65924kLec0H82iSJ5kp048jHzOLy/IdkKauPGpT
 omOKzYXzUgz1eAinMdTT5nHRwzrue5DHyG3yF9XlOZG05Z0hn8Qdd8RPP2mS1ZvfZkRM
 Gxsy5Cy986g4dmLgGTR/nU/qOWrlQKat7ISfpA+lexcGg+reJcLkplrsQgWwP8kfrW6Y
 l9mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlwMWNb2Dfv6PvLEYKms7yKiZCh7JuOoJuMO1m2NsnEzITkbCqzuQSiobaM/4GdvNQGLkLzvj9GFU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxI33x1Wd98tR+WQ1lE0aAqBWSLV9PHaY6l3CN51TijLN2XW7iZ
 yL24hoSOmS2eM0gHxZ1W0dFUSVqTdmbZ/Wk7/RMil+TYyiAeEr8iEuqSWzir8JBbK/IoZtLZux4
 Iq6BqjOyVE5wmKbWbzopcV85CewButXP4upEV6rXrWCDVvYKKFsmEPPdk9syt6947NqJ4MQ7gZg
 Zcwzs=
X-Gm-Gg: AY/fxX4zOgiqVODfdufDxgM1wGL5TQMDI7gpH5MqKI1ltNVV0DP/kg1yZguwmOgZTxn
 PQw+ek4PAgb47SNI8U5tceAM/XzwqRtGTSlIdCLzV2xrUqiO9xlATDpM0uUNf7rFpjaDnKCWTWx
 mi4BUgFR/P/pShBoOGs6YSS73xboNKhP7RpIYIujh/cMkj3dswWhujtub8/xHEXv2n4Ew8CBMYb
 TBDyLMjxaBljE5jH7Q/ozmE9LeORyA4dER/4TPcc5241V3MT8CuTTv9h3knuUafOrl3ihRzQBl5
 q46jXUL7kg2gPoo9BsOI1RS+n2Gcmv4XaRcgkaAuAy8dN9pHG7rZW0ONWcuuZh6jm+c2OKvBOXd
 /jqMALfE0lCnPXCCFCcaLL6AnEwENuxL1x8DHHfdFeg7WxmbiUGHmu0Qloie1vtqzVYFM1Zgmzp
 MnAD8q3IrRYTRqU2UatWLin84=
X-Received: by 2002:a05:622a:2c3:b0:4ef:bed6:5347 with SMTP id
 d75a77b69052e-4f1bfc527c9mr243417661cf.30.1765831715573; 
 Mon, 15 Dec 2025 12:48:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmN/KDpj3W3F4CvCXgAdna9To5O6vhU/HOdmJWgcrxO14nwGW/q0vweBv6qM8C0DSy566hBA==
X-Received: by 2002:a05:622a:2c3:b0:4ef:bed6:5347 with SMTP id
 d75a77b69052e-4f1bfc527c9mr243416891cf.30.1765831714718; 
 Mon, 15 Dec 2025 12:48:34 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5990da5dc5asm131302e87.77.2025.12.15.12.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 12:48:32 -0800 (PST)
Date: Mon, 15 Dec 2025 22:48:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "open list:DRM DRIVER for Qualcomm display hardware"
 <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER for Qualcomm display hardware"
 <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER for Qualcomm display hardware"
 <freedreno@lists.freedesktop.org>, 
 open list <linux-kernel@vger.kernel.org>, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com
Subject: Re: [PATCH] drm/msm: Replace custom dumb_map_offset with generic
 helper
Message-ID: <cv4we57zxltpys6qf43nxldwwogjwxyglp2hj3ld6talvlteqp@dsen5g3v24t7>
References: <20251215022850.12358-1-swarajgaikwad1925@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215022850.12358-1-swarajgaikwad1925@gmail.com>
X-Proofpoint-GUID: CJVHAD1Im5mlJJObXht-xPoHtAWTly2o
X-Authority-Analysis: v=2.4 cv=OK8qHCaB c=1 sm=1 tr=0 ts=69407424 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=26i9lwY6jznW_AXw1HAA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: CJVHAD1Im5mlJJObXht-xPoHtAWTly2o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE3OSBTYWx0ZWRfX4OVCPvsuzG0h
 SWb65uY+eB4wTApR2mTuNC4wZTdUe+nmnM5o0XTk5v1DGvf3lz6R0wgJwRGhTsRF7J3nMwHnBE8
 DabxUfy9d/IR+LV4YSEKUEEzbFUGXfyQt8ShtJZNwbJ80bmmpSoJy20pBkF+aoENA30B+lbms2v
 E4nmaN1cfxrajDVcDRI73drda4fyr3/Z+lNClDlQwGHn9sHbuHupI0oGqDB/0nOSCZFSVwVdtRS
 OYVnOVLh2/fK6LfkMG0Hgs+G/3Z0M6tHTkbyLrd2rn5QsC2h4eymsgnIL6R4xkylBD/8A5UFgHV
 6Vbs+egNnd5BWU+AuAk1DJaEfPmj7HMMiKTMEOsRIA/XpLILQSEX4BvuEn/xvmYi6BeKbXiBtXG
 D0X5VIWJoJvUk+55t0E2PMk5teZadw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_05,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150179
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

On Mon, Dec 15, 2025 at 02:28:50AM +0000, Swaraj Gaikwad wrote:
> The msm driver implements a custom dumb_map_offset callback. This
> implementation acquires the msm_gem_lock, but the underlying
> drm_gem_create_mmap_offset() function is already thread-safe regarding
> the VMA offset manager (it acquires the mgr->vm_lock internally).

Other pieces are using msm_gem_lock() / msm_gem_unlock(), which
translates to dma_resv_lock() / dma_resv_unlock(), so you need to
describe, why it's still safe wrt. that code.

> 
> Switching to the generic drm_gem_dumb_map_offset() helper provides
> several benefits:
> 1. Removes the unnecessary locking overhead (locking leftovers).
> 2. Adds a missing check to reject mapping of imported objects, which is
>    invalid for dumb buffers.
> 3. Allows for the removal of the msm_gem_dumb_map_offset() wrapper and
>    the msm_gem_mmap_offset() helper function.
> 
> The logic from msm_gem_mmap_offset() has been inlined into
> msm_ioctl_gem_info() to maintain functionality without the separate
> helper.
> 
> This addresses the TODO:
> "Documentation/gpu/todo.rst: Remove custom dumb_map_offset implementations"
> 
> Signed-off-by: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
> ---
> 
>  Compile-tested only.
> 

-- 
With best wishes
Dmitry
