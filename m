Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB04B59F75
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 19:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CBD10E3AA;
	Tue, 16 Sep 2025 17:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XjSML6OU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB95010E12D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 17:37:50 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAPoag012544
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 17:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=asmJMTOYWO6MF0j8LTYTYFsk
 hlkUXWRnPY3+bCKiCFM=; b=XjSML6OUsA7YEzsSUp9jzWcCdOj2nMcPPedHkIu9
 SiBG0MbFV6Eh9qVS+Xi9etlfsevozD7saVGyecfN/LKtlqdw1bGuB3a3EInXjH2B
 dPbYiMHzMSydct75/ZBHqiqAc0JzK9XTfbWVBUYKb4uiVjkQ9EZYsVRIfbojdbw2
 oflzVPFO8/qEfWOD91rhhvYmkL6vor2rSW+mTDuiagjZLfVjj7aVnwj4tdX6sKTF
 DnoPQ0AcJyG3kDCZCNmn2+/akw+kwI3gA5vyKlAFzpbmERkFAcAIwufRc6qF5w/N
 SJ6er7IRlPl+rAL/GMAAxSL5jceGigwoA/poIUa4/As7Fg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495072sueg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 17:37:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b60dd9634dso134743561cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:37:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758044269; x=1758649069;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=asmJMTOYWO6MF0j8LTYTYFskhlkUXWRnPY3+bCKiCFM=;
 b=KT+RND4zHnonWl4XvsfVCVOrCdpGqbrBZfMHAckOBjzqrevErFSSOHlxyGzvXhxLoz
 KXArNw0JoX4ybA+C7mUcoWhYIF/AaTONJbqJwiQZrHV+PRD+gfkT8WOiIhgZ/NYYWfNg
 qWv1/X8GXdNQEZlPMkM6fgDGssu5zRkdI8f6Q91fxcxJ285DY1poLZfu4ViE0gRDRlzU
 MQdJhWQHUOtYlm3WyfO/UUYdP4dZhvcXFL6Jd0uyliiZCejczlCIcC8hPcphSPp+98dO
 VktDiY23I56gkuSFJzeO9fT3JEeI5ew4pWzz4XzeV0c1d6SxreqpopEoz41eOiN6Dk7X
 Qbrg==
X-Gm-Message-State: AOJu0Yx8j+epF+MNORCpDwLrjRD/zvD/Wk2VpBkT4wAD3kM9Qa8QGtcH
 fd+t/+uM3mTHPP8nyJxLTugoc4oxxgmC8WKI3k2oDWtHjgC8mtnxzY8PPICRLUcODE1ArYjvK6F
 lOs0fqsXNn79Ih0HY0TNFYqJ0saQKH0+akB7i8rYLyCTmJ70l588ZrDBapUp6dK1fHv+SsN4=
X-Gm-Gg: ASbGnct16ev7scsYXi+8HgXRDGBfdZuUR99Au2nk+CW4SIalPnkgjCyZDx88of3U0uy
 J1vSi/DWSqRrBf9g/7WW7qaVRrQDb+fgQT4d59GWYrJl/8njszjaNP/bJPcNSSEH8O3BCYrjW48
 HysxNDfcbrBs/YNjgAV0A21RfUWXIlgjVkB/8mcX8bseQtESebjG68SalbceELESuhY8dgI32r8
 /sh4RI5zQH4Zvw4aTrq8rmhiUNv1AJ9oDC22TnHipD5IWxomBUQDUyWCCVoIrcm+Ug5vKCxH3Z8
 21JgH0TIQt7JnfBLbgqbQRn6FOPhJNWQnWdVuqr7uoOHxQFZ1LMeVQUOYYJIXc4dVifXdZiPkFB
 flMYukTEuxvL+eiFKQtDchGtp5HhLBul3yxR7nol2ViSSsb8ztNJC
X-Received: by 2002:a05:622a:428d:b0:4b6:2336:7005 with SMTP id
 d75a77b69052e-4b77d08c1dfmr178883531cf.19.1758044268969; 
 Tue, 16 Sep 2025 10:37:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEINTEPiFvuj+G9ik9pEiQhi0J/sHmetYeMmXJ12N3mEWuP8rQExfbslVak9k+CMhjZMs47OA==
X-Received: by 2002:a05:622a:428d:b0:4b6:2336:7005 with SMTP id
 d75a77b69052e-4b77d08c1dfmr178883081cf.19.1758044268385; 
 Tue, 16 Sep 2025 10:37:48 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e6460f61dsm4437835e87.113.2025.09.16.10.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 10:37:47 -0700 (PDT)
Date: Tue, 16 Sep 2025 20:37:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH RESEND 0/2] drm/bridge: lontium-lt9611uxc: switch to
 DRM_BRIDGE_OP_HDMI_AUDIO
Message-ID: <3n5gjebxuafxgsl7yl6ife76cnfwblsggsp2kkcrbjjansbvi7@smi7zeexy5gy>
References: <20250803-lt9611uxc-hdmi-v1-0-cb9ce1793acf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250803-lt9611uxc-hdmi-v1-0-cb9ce1793acf@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyNSBTYWx0ZWRfX9sEVuCdpZPFd
 tgRzD1fLgc5Q8JxfkJViZvYOw1mHMMmkNwuKTTzMcgVbcjyx87IUwfMth1gt0Bhg7jXtwzuUflc
 yrETtzKLewSLwhM22pzV2QSdk/F4pAyoc/jwt78BM3w3aShl3ncxWiBB8rHvECeZ892e0Z4cjLf
 fcJEEfoL1SEPVAr1J9PoCXbwAz17nYBuKHcivrAGqYGyGiEk14jsGqOnQa1mWwEmCVwxYIliKdk
 In2jp2rTU3G/x6MO97L0pLa83vQ4Nwc9Fridpi1R7kQCR74HvjF+qNm7SMlg5YnUAC4Sq+8LjWl
 4mE2XP9EFdHeS/XF3uROdOGa8A2yi+JHP0i+rxIXV0wnF0nDDbqra344y7g41y3vzslDU5CKP9w
 aIwR8Ze6
X-Proofpoint-GUID: mhNRPGbUfceKKIfU_ENNv1s_MRQ0JZSc
X-Authority-Analysis: v=2.4 cv=WcsMa1hX c=1 sm=1 tr=0 ts=68c9a06d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=BgkF6ddApZc5WCf5u_gA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: mhNRPGbUfceKKIfU_ENNv1s_MRQ0JZSc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130025
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

On Sun, Aug 03, 2025 at 02:53:50PM +0300, Dmitry Baryshkov wrote:
> Use DRM HDMI audio helpers in order to implement HDMI audio support for
> Lontium LT9611UXC bridge.

It's been waiting a while, it got posted as a part of another series,
but I think I'd like to apply this by the end of the week if nobody
objects.

A note regarding OP_HDMI vs OP_HDMI_AUDIO: there is really no point in
going through the OP_HDMI other than bridging the HPD even to the HDMI
audio through the framework code. The bridge driver doesn't implement
atomic_check (on purpose), the mode_valid() check is also performed
against a fixed table of modes handled by the firmware.

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (2):
>       drm/bridge: add connector argument to .hpd_notify callback
>       drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers
> 
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c     | 125 ++++++++++---------------
>  drivers/gpu/drm/display/drm_bridge_connector.c |   2 +-
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c     |   1 +
>  drivers/gpu/drm/msm/dp/dp_display.c            |   3 +-
>  drivers/gpu/drm/msm/dp/dp_drm.h                |   3 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c            |   1 +
>  include/drm/drm_bridge.h                       |   1 +
>  7 files changed, 57 insertions(+), 79 deletions(-)
> ---
> base-commit: 024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
> change-id: 20250718-lt9611uxc-hdmi-3dd96306cdff
> 
> Best regards,
> -- 
> With best wishes
> Dmitry
> 

-- 
With best wishes
Dmitry
