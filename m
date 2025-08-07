Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B39B1D40C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 10:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8628010E0FE;
	Thu,  7 Aug 2025 08:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CKN/qU05";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2DE10E0FE
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 08:09:45 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57725iu6022167
 for <dri-devel@lists.freedesktop.org>; Thu, 7 Aug 2025 08:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=8cnnTCr0BqMwDmRXCSiVDYTd
 XzHaxhvasLyMTbeTJIc=; b=CKN/qU05FMQA+gzujiFPkSAKQUw6MA7hFbZGfL3B
 hOfHfrjY3mla9zEmM0PjyM57K7HkoioE9acrkNfsUaBTtJge7/QBPTvcYOXIL8f1
 QVZvtg9CUrlX6CYJLTRuuvNW880rVGXreMyKdtc44/H7VyKif3trXulIayw6wIaO
 0nMYOcx9hlb6Ps2NAbkacfPZAnobsaw/eYlQqkHXGWxPpHghEg1+ch/rclvVyCT1
 E+Ol65SLHeArr0UkQD1v8tzbPVeFeLQseQYC07yB/xTsUyjSzGhtJEqt34ca+Vyd
 Kw5gm8TEYCxoYJvmdczmncr3aJQYCyhBBsS6U2ay/g+kMA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy8dhjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Aug 2025 08:09:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b0791a8e8dso21878731cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Aug 2025 01:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754554183; x=1755158983;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8cnnTCr0BqMwDmRXCSiVDYTdXzHaxhvasLyMTbeTJIc=;
 b=sf0POYhB1jHTBKA/JBx5ZHsI1+m4AUF8OhnncihrlSL+LNNbAEm+0+kNL8K7hU0eju
 1tzW+nBKwj0v3r7q2jz3HqMq5Usw8vzhePNfSF0WZ1RY5c/VWYBBIi5diGbX0k5j6BeN
 D3eCeYu8AB11LlAPhfNCGY+hf5SsSQic8hv1eW7ReIfKyYMAtcsHkDBB3Wg0QDYaglNP
 6OinevagFfGou7oKb0dvmhjG+fwY6HApSOBVApINt1JuDu6MPpzs57QWTGTZEHCndsWK
 eIAo1xx/c7TJHDCHFIMmedybAyZ33BqC/OOYk3Kg9US15tkKk7Zn5TLhVVwAl5FF+oam
 CiOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPiElAKExICI1gwMcqZl7XODa6CSkLjKoExGTlcXY5nJd2RbtG1B85hmCwaCdNvkvXTfRU6BSie+w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxjit8YctU2tXHcrOSBha0CT0Uo8wEs2PHLtc9jFUDGD6TFLSYu
 IVqC8ua657D/amLofAB7ebxwAaESN9ovLSUgxhEyg6aXLfEjwd3Q2P4Ma4j0a2a26k+Su5Dae3n
 Gr4jgxLmxW18R+e16H2Xi9Kb4TQcmaA4mwsS9NVJFQIDEQEGBm9w28kU20cUfCqa00BAwRW4=
X-Gm-Gg: ASbGncu//68aajiY0qxB7kA5P0lYRzpYXB0MgwPNQ7rwy4RarHA3cteTTNZy0KDDB4Z
 uFavqquyYItZd6PI2DeXiRmfjR6CcO2sbaIb4YoxwkPKGbabvRilqYUUxYG6u6Wad55a1su9+r/
 lYNaLp4Ndzt9FTzXrJx9zTR0t02iFQ4FrtqQXGLg0mo2umg37fR3QOKgd3ZukgyR/J2HXa5hgT7
 9xEjVtL2Iwhx372s2Y5S6huAgDMXnd0oTTbSsnwWWiH5TlnI4+Pv3dxPnzrVenmykHUB6/1ZK7V
 4WVKCsDpMmDfW8Ciik2rjYSH52GJ5bjBGCqIyqzPLf9irmgjQz/rKgil2fLGMuDPHN1NBTJ8KVW
 ufVmKGte3FwCbaG1ZAOCXDvRr/hIQIUn8VB9X0wOYDD0WueXuNtYo
X-Received: by 2002:a05:622a:1a93:b0:4b0:77d7:c8b4 with SMTP id
 d75a77b69052e-4b0924fe2a8mr88796261cf.14.1754554182818; 
 Thu, 07 Aug 2025 01:09:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr6oBPT/KIywasjRNJMXRDMeHau1nVtpgPLjvj4ivB0nSsqqEOpEjGcFvOQTtB3vlNCloQQg==
X-Received: by 2002:a05:622a:1a93:b0:4b0:77d7:c8b4 with SMTP id
 d75a77b69052e-4b0924fe2a8mr88795771cf.14.1754554182037; 
 Thu, 07 Aug 2025 01:09:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-332388fce24sm27550341fa.66.2025.08.07.01.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 01:09:40 -0700 (PDT)
Date: Thu, 7 Aug 2025 11:09:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] drm/msm/dpu: avoid uninitialized variable use
Message-ID: <ouan6tfmoefwuvs7wmhpzjdwmxfhqh3ad26j5tmwdugnq7ieda@ddw6dfqtq27g>
References: <20250807072016.4109051-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807072016.4109051-1-arnd@kernel.org>
X-Proofpoint-GUID: GpE6kFf1qVQBpUOcDIbhl4GCQW4KSBKc
X-Proofpoint-ORIG-GUID: GpE6kFf1qVQBpUOcDIbhl4GCQW4KSBKc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX0emi2X5agTKG
 l7iEX18waQohixdIMa+fSX8ffNMGw8MVmrIYOZNjaKW3a45VTbtwNz+H6kivZqI96qaPFpHzDqb
 bm9PXz5ANFM4TM6Mkl/wyo+XpFMOFZChwRRBdojyMHrOz7Zk0XwIsS+mCysonYOQT6ZpsUOCbgI
 JpH8OdydHfw2iGonzUAgAqSlg4ZPvpuzoCY8M4Ga43c7mNPiA8vwXByopgSHGr9/0TpQJxlRV+V
 dIQRiuCdEVErlol4gUuLx1CWlXMLgsluvns2XfSjVfHmQKndmRyLSgYe33pZrfTizAsIdqpsC2A
 1bw+GdYDFKxTpn5s3YmL5k2wDH6w1niCUt4OLwImF4+S42M0Nlxbz4yxsbwZR6dHc4UW68Sm9uc
 h4NJtiwG
X-Authority-Analysis: v=2.4 cv=GrlC+l1C c=1 sm=1 tr=0 ts=68945f48 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=qCxGkQd1JP7TPUfVb20A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
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

On Thu, Aug 07, 2025 at 09:19:48AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang-21 points out a variable that is conditionally initialized
> but then dereferenced:
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1138:6: error: variable 'crtc_state' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>  1138 |         if (plane_state->crtc)
>       |             ^~~~~~~~~~~~~~~~~
> drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1142:58: note: uninitialized use occurs here
>  1142 |         ret = dpu_plane_atomic_check_nosspp(plane, plane_state, crtc_state);
>       |                                                                 ^~~~~~~~~~
> drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1138:2: note: remove the 'if' if its condition is always true
>  1138 |         if (plane_state->crtc)
>       |         ^~~~~~~~~~~~~~~~~~~~~~
>  1139 |                 crtc_state = drm_atomic_get_new_crtc_state(state,
> drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1132:35: note: initialize the variable 'crtc_state' to silence this warning
>  1132 |         struct drm_crtc_state *crtc_state;
>       |                                          ^
>       |                                           = NULL
> 
> The bug is real, but the suggestion from clang to set it to NULL is
> unfortunately just as harmful as dereferencing a NULL pointer is little
> better than uninitialized data.


Having no plane->crtc is a valid setting and it is handled inside
drm_atomic_helper_check_plane_state() by setting plane_state->visible =
false and returning early. Setting crtc_state to NULL is a correct fix.
Could you please send it?

> 
> Change the function to return an error in this case.
> 
> Fixes: 774bcfb73176 ("drm/msm/dpu: add support for virtual planes")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry
