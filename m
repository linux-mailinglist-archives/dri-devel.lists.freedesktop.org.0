Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB291CCBD3F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 13:44:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF38710E400;
	Thu, 18 Dec 2025 12:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ghLMNOLF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tl0y1yUp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9040A10E40A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 12:44:48 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BI9BSax681049
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 12:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Vkp2NN+Wc+3qSMFRrBVcAE+6
 j4YuYUXtFj2q0Wb/h6s=; b=ghLMNOLFspgD2NgKfR3QZC1ziO5dXZr4jls8vYxi
 4HMcGbRkLNwX0Ype/SmKmKQqzZs0fDKD8qLivYCeOKNAAc/vsszcRIFJl5J1hyq8
 CWLBS+rbTq5GKkV8k6ChjW4JoXozstqymU07S2twMKqBPjCQrFgULrmV9rmLOAq8
 IckJufUnbZmH9nYz5pq3P58d/R6SZ1y8j1CQPwwEPg0LAqn/sP1SCnHDw0mCW2e1
 vTKqID5BORCVOL9uvEuuUsQeDZ+L8uTT11jrm2PjQl1cN1CVtYgdO1keBTS/0G9F
 W277MBsjQjkGpJQaQHk9fI5GGfFDmSuKBKUAwmuuWT5buA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b45bhj9cy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 12:44:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4f1d2aa793fso12466661cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 04:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766061887; x=1766666687;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Vkp2NN+Wc+3qSMFRrBVcAE+6j4YuYUXtFj2q0Wb/h6s=;
 b=Tl0y1yUpj5cic0wP+twtcdoDEn9x9x4xiY9KTsXqIk33Yme6dqNESOMePzm0ms46tV
 VZSIdu2pscBOg1M4OlGgozoW6/Dd/L4wo6ASdRGCUP8lxcKaovkSnpiTrAdg9TZVIvtp
 oYQ4d0tdnptRcxnX4ASfDr9sfElBKT+yUhlD3iN77B8/5d/ojJb9G8Xm8vJEwsoLbNJ2
 GzVbTGua6DlSJWvavcySIPCPM4xlbzoM3DDgMO/yu6y6Xc6XfohUWirAumMRESimiOsT
 7uy0RvqGOaXTcQ/tnWWRedWjoDBrBNYuu8ZNzBNeiHKtukrOJ+4qk4X5QBZBUINKmLTc
 ziEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766061887; x=1766666687;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vkp2NN+Wc+3qSMFRrBVcAE+6j4YuYUXtFj2q0Wb/h6s=;
 b=NSOwogv5jJV7r5Hl8WSDIiTkQSWrnlaaSoTM5AZfj8Ivrv76xIYB1GvzfKiH/X/wMO
 5J8zpmgWLHTo+stjd1zfoMyE/eWlHFN3UwwUtnR0qml8vMewMhHGrL6rVngCn5sber7q
 CuDctKijrc/cBqDdiSZSiRhj9nju3SxrKJpBXPKXZnuipVTVJup2uCgsPLF5SgNwiW0/
 GTCqAX+E6T1ze3J418hp8DSNhaWmdnKdIB5bOktBfh5CPRGDpGt3YU2aons+s5bOq7rU
 o41fQomT23My2Tguw0IXiNzjsGYF9Ysd1FvnTd8EKh5mNg1lUyG9Wu+94CYPi7HBnoHL
 EveA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVezGv0mw9Np4cE1pz1C7Po68q5Ojl2goI2D4qw7ytmAipf91nXlCWaEDhHmrA6VIN6s4xT7oZhy8c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCTZ1bmY32X+5lTgbXRX/HxnDj+739Cv2CbAqj02CInJHtSmxn
 Hmv5KY/0z3p2er7ZSWL53MBHHHT67/HUXJZC6RDMKEk6Hfsk52MUe26fa7QPFWectTF+HuEemsM
 feo4fexlVcx+x1zoC9WvV7nS4sxeFz5Xr6uLDG3mcZpUmcWrbtYqs5FNK02l4xP8lIJF5Xlg=
X-Gm-Gg: AY/fxX7V6q4A7MzzM6ei9y93WEpiIBCKJCKaxZsLu3ub79G3F9mn1Qz+FMB08Fgp+eC
 zMWRbrAG0F1O0GiPzS0kQBV5VuJhOt6aOJgVXy+vJkHI3wdAfg7q8aUwHcnNV0HlQ6+GX+tV4HF
 i1q7zMFiCNQacOHwGAhQkQW+A/Xb91APriy8LIXmNvhJG6i2JcUblCRQmrZ4CrlmyjKTVHpea+q
 5fhwy9QLE1g8LXHtAqeF9dOD1+gsWAkOZh2oSUSCKU+xgpcopIZOGOPVLsqFlrg7ZT8vxdS6xaj
 malcp/qPDleblF04B7YTaYVz+wTTAGjDi0Fy7fLI0cghbb5CSMMpP1cvst++mPxhD9msv6zPGVU
 rTk5tmqwuTyL/GpB+cIVJzw==
X-Received: by 2002:ac8:7fc6:0:b0:4ee:173e:c73 with SMTP id
 d75a77b69052e-4f1d05dba12mr324702281cf.60.1766061886469; 
 Thu, 18 Dec 2025 04:44:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkZvbwBL+XyDVvkuteQhWXC1sY/ZsY3GEvrYK/oeHlYP+ivcs9f0Xe75FewxfvYvy1hDenDw==
X-Received: by 2002:ac8:7fc6:0:b0:4ee:173e:c73 with SMTP id
 d75a77b69052e-4f1d05dba12mr324701771cf.60.1766061885772; 
 Thu, 18 Dec 2025 04:44:45 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b5887d4a0sm2340823a12.23.2025.12.18.04.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 04:44:45 -0800 (PST)
Date: Thu, 18 Dec 2025 14:44:43 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 09/10] drm/msm/dpu: support plane splitting in
 quad-pipe case
Message-ID: <z75wnahrp7lrl5yhfdysr3np3qrs6xti2i4otkng4ex3blfgrx@xyiucge3xykb>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
 <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-9-ff6232e3472f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-9-ff6232e3472f@linaro.org>
X-Proofpoint-GUID: pafmVzVpFqpSTlvtdLA8IeU6FOL7ZqF5
X-Proofpoint-ORIG-GUID: pafmVzVpFqpSTlvtdLA8IeU6FOL7ZqF5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEwNSBTYWx0ZWRfXzUjiDHSXwDZz
 oOvh3iXpFTAUp6bXfcTGmkxvxwly8oDzM7oIel5WzvAqiJDQYJnp1gPbCOzS9YZncxHICLRH09J
 APvXXnsX56vil/2PLXvniqb6JL7YhVMWFy4mi9uNSAJ3JJe7BFW4TRoHFfKapgfwy2b4jvGHiuQ
 Qa/125Pm1yJizLKxrlcOQ6xwOt6j81+rDXKoIgRFn0Cx0hO6lfQFPFZzGTHzV3y7a7RKtjN6ohk
 /3ob8J36TVMHSrBdz+D/UYPX4MDQz+YfDocGn8ZOrDvpVwRl5VzYnx4r3M58GPZOhNcRuWQLs8f
 8fqbyArB+cGOdQ7+zHlPfZpP2tzTwXUxTYmesoDI2ku72b1UdSNC0WcSyGsaiqkHBFS+yAjYwRB
 hVFlYlx1DFSpPDZuUfxSs1P5u5hlfw==
X-Authority-Analysis: v=2.4 cv=SZr6t/Ru c=1 sm=1 tr=0 ts=6943f73f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=sWKEhP36mHoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=1DU0rzas2IhrWo4RnhEA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 clxscore=1011 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180105
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

On 25-09-18 21:29:01, Jun Nie wrote:
> The content of every half of screen is sent out via one interface in
> dual-DSI case. The content for every interface is blended by a LM
> pair in quad-pipe case, thus a LM pair should not blend any content
> that cross the half of screen in this case. Clip plane into pipes per
> left and right half screen ROI if topology is quad pipe case.
> 
> The clipped rectangle on every half of screen is futher handled by two
> pipes if its width exceeds a limit for a single pipe.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

At least on Hamoa based devices (CRD and xps13) I have been seeing on every
boot the following:

arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x00000000, fsynr=0x3d0023, cbfrsynra=0x1c00, cb=13
arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x1c00
arm-smmu 15000000.iommu: FSYNR0 = 003d0023 [S1CBNDX=61 PNU PLVL=3]

Also there are some artifacts on eDP (no DP connected) on the xps13 with 2880x1800
(LGD 134WT1) panel. Not on CRD though.

Reverting this commit fixes it:
5978864e34b6 ("drm/msm/dpu: support plane splitting in quad-pipe case")

Discussing this off-list with Dmitry and Konrad, the conclusion was that
both this plus following commit should be reverted for the time being:

d7ec9366b15c ("drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case")
