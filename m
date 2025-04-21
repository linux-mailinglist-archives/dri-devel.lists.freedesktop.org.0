Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD100A94E02
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 10:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141C010E239;
	Mon, 21 Apr 2025 08:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NLw130jc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6489F10E239
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 08:21:55 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KNs5eJ015322
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 08:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=3dOV6TefbQJrNU5fY48fEav9
 8ivZ7YhZXWg/363uaxY=; b=NLw130jc/sr36xMO9dNl/g6IyD7ilOeIFbzF9qus
 2Q7pUhbsYma/bac/sVzWK5N6bHxtztyQWebdcv+txHS2qXQZLFBms/JUBq92ePYR
 uXqk1gr+l78B6NM7yF0DPGmVeBKi+/Tdbh8inaRYfXem5SvLJCnLXwInhQGg76rt
 oaeCoSPiAPzkxaFv89Sz5D3IUicTS3oVwj9/pMJxRvGnbpf4PSxZPao/wZC0MHHX
 W+LS9vx3ajkiHkhSP381maBSwCBBPqHpT1LE1LzQhes87umsssD/O1mU/4m2tUWp
 N/AaESjzu5o9/61s05AVsqSWT+q5yd2MIjKF4HCjoOeMGw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4641hhkm5y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 08:21:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5d9d8890fso845255985a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 01:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745223713; x=1745828513;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3dOV6TefbQJrNU5fY48fEav98ivZ7YhZXWg/363uaxY=;
 b=XV2in3w1xDP44Ncj1pE3auxX17wep0OQqpRweGQJ46guXqozaW9hf3mUlXZEFWzAth
 6juTfTU55jsbFW3nlhZggNRSQCn2PFL8q/2abxfe6lyjYnmjVm3miYJ/HYPCuS3zEJfD
 2+QwelmtGN/bHU2Qi1Z9C9vicjizJpzzpZbq/i3wMiykLgigtgO2CjUf3qT3WNfhLF4S
 9ASerWNB8vuCADCFIgE4FcMeOSqz0yrMQoEsivT3IwnX7+vbTj0bxjLxspho1T/MByyE
 ecr7IFXRrJ1c3r4WHyURK4MC+7Dtqi2qcEaUSV+25yXnxEdieWKz6oWTMC1c+FkkD0d1
 nk6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCpZl0Vbxt5qMmnMlGABuNnf0GHOajMr6tnmIAXZIvsZ9PIWYUUtICG6sd88zZUd8vwK9CDzK1+aw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFjc85+q8EJBigr78cb/d2yR5vbC/SKB6tEdKEiKCiJuAOvn1P
 WNL3bIvPRbH6TlsREWMDHk6+PeloRZdvIPJ1tejvB2noLV9q80MYWu6T3cH4APD10pmPHpgHAux
 8V7z1pVDfCzrt7tDTYci58r2wI3dEqthJ1OZPw9/B1+Q6d6MBNntbqKJft4cHgdeFqy6Q4/yjQd
 A=
X-Gm-Gg: ASbGnctrBUk3xThdtvPSb1QpW20B384sfhRgok3MYTADN3RAfheluM+j/k9QU4nu660
 XaRQL3pCFCNr1SHK1kFWpk3+zKpAKB8nfk4hXx1W+KQjHUPbcW/um3R+PiYNOz9+FkjLbmn/QpB
 MQNK/DO4ND35BIWrL6sLAfQT8e6LwSzggqrUsFgUIO5YXG1e6gfzsGJNMcoQWntEpORFcWS6W8l
 zdHo+1CcpFlK8cEmI223CQUsmY9ks+9veZyODKFptrW8+45evzuYSDkBvpLMWdJVzJ7/J0Jbeos
 tP57Bb/ygszfuFswzHn/Etbq9NaVBuB+GxQ+lvf9X/RpfC3vWilifwQuXoHLdqXAGJXu6+znTco
 =
X-Received: by 2002:a05:6214:2505:b0:6e8:903c:6e5b with SMTP id
 6a1803df08f44-6f2c26db1fdmr178470906d6.9.1745223712885; 
 Mon, 21 Apr 2025 01:21:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiFDbAU4iG+kC4GnIeIE42J3FEGXYRJXXp4pFCBWX4GU50la+M9HKv+Oo+djrzzh+vCDGc+A==
X-Received: by 2002:a05:6214:2505:b0:6e8:903c:6e5b with SMTP id
 6a1803df08f44-6f2c26db1fdmr178470656d6.9.1745223712436; 
 Mon, 21 Apr 2025 01:21:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d6e5f4cf2sm864754e87.215.2025.04.21.01.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 01:21:51 -0700 (PDT)
Date: Mon, 21 Apr 2025 11:21:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: webgeek1234@gmail.com
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: Assign plane type before registration
Message-ID: <nxp2vzmushnkigmyk2yv5vz2j7pc7fghtvn4uielhaqqn2dcnv@eq37j45mqpng>
References: <20250419-tegra-drm-primary-v1-1-b91054fb413f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419-tegra-drm-primary-v1-1-b91054fb413f@gmail.com>
X-Authority-Analysis: v=2.4 cv=Fe43xI+6 c=1 sm=1 tr=0 ts=68060022 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=Ikd4Dj_1AAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=ONaZQ3SXXcwgrymDYLYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ORhR1Kdw0-ieE0iiwaq4Za_ucGtwtHkS
X-Proofpoint-ORIG-GUID: ORhR1Kdw0-ieE0iiwaq4Za_ucGtwtHkS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=732 mlxscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210064
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

On Sat, Apr 19, 2025 at 07:30:02PM -0500, Aaron Kling via B4 Relay wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Changes to a plane's type after it has been registered aren't propagated
> to userspace automatically. This could possibly be achieved by updating
> the property, but since we can already determine which type this should
> be before the registration, passing in the right type from the start is
> a much better solution.
> 
> Suggested-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> Cc: stable@vger.kernel.org
> ---
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>

Your tag should come after other tags, without any separation between
those. Also, if you consider this to be a bug, please add the Fixes tag
as described in Documentation/process/submitting-patches.rst .

> ---
>  drivers/gpu/drm/tegra/dc.c  | 12 ++++++++----
>  drivers/gpu/drm/tegra/hub.c |  4 ++--
>  drivers/gpu/drm/tegra/hub.h |  3 ++-
>  3 files changed, 12 insertions(+), 7 deletions(-)
> 

-- 
With best wishes
Dmitry
