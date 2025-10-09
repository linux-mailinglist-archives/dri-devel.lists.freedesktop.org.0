Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C31BC950D
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 15:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F1410EA46;
	Thu,  9 Oct 2025 13:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSgjC7lf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF9110EA46
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 13:32:55 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EmNh020142
 for <dri-devel@lists.freedesktop.org>; Thu, 9 Oct 2025 13:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=RRr9DsOTbQL+IhH2cQUogvPD
 iLS8DNEDEbNUEWkTRTg=; b=NSgjC7lfbBgTxi4WQX3tdtzkY/WqL0mozpo5s32Z
 E/wukCkntqZq08uD5vOClESI3KnKzb5bsudg3ABvfFY0HOpSRctfklIdnhQTUW45
 MhfWkYbbM102O/ipBVg9zILkwap0aipTxBcPTcPTUOFrRoQRBOKDJ1nSa1KvFcMj
 WyPpeV/dOst/tb/kSGtNjerKKCelofJuz+VsmLKB9JHUclgjriAnvsvR84HbdOPg
 Kfi6UDLynP12r9cZITunI4XKApAChyAmtES3Cy7iMbnL9h7+RSTii5eTrjj9CxWE
 94Xt4f6BGN37Z/Nu27kDJckZyr5bMurQdBo9ytUJNm5mDQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ntxcc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 13:32:55 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-54a798b3508so1902171e0c.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 06:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760016774; x=1760621574;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RRr9DsOTbQL+IhH2cQUogvPDiLS8DNEDEbNUEWkTRTg=;
 b=TX+GXZQam7MZo45TaP3CUTyd3R5nw27sldra1eMJf5yNtqRBXayMcQnPw5wsPq8B8o
 XF0LTM1D/RQjxCJpxY/VLemPzYMrvLhyjibOF3AkzUr97Su0tEQ3KDDUYTZXJac+QcHQ
 VmbPtAJY8acN0mudCOgakU/Wxs6R5AfnPmLuPKhlvU1WIPzQwm/u6y/2lU3gvPt3aRXJ
 feQrFEj9sVouplYYr22r0UiVOoStOHpKNJ6mnSqwejTkQlD70b6LckQ9WgPRLjFWKOc8
 r2fjPDGMWSGdUl3FZZN4YcvWBYe4x20pvXR/91TbqzIgkvpn7zr0XmAD3a+5Q08IdpEF
 Th3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFymu/2+GT7SFM51Myrthxqy6WBsfzMa6WRVpCBPMITR/mckh2J7yzwNGCsgyW2rBhbqKUc295ZyA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZ33bJaG5n2+v/igAcmn5BR46NQtkYwRpDJAJVhrxjp6X/aUco
 R5mH9ObX8lr2u6s964nAhnpgNsulW9AZo5dyb+uOwZYxuiRnhRrPvqsdsWLDGgJG0SMBeID/Mvn
 ptItv6FSmSc/4Lf5aZNV9sVvKdssbLezTQy8qpfjV/SxtxYXEWkrnEpq2/SQvVB+4LVX2POk=
X-Gm-Gg: ASbGnctrPAauqH4vJy/oMpqTTqfaFQS0VDPqWwvqT+TK25Pu6lJCQGHuvKZhTPOlTeF
 WgUKIF6LI6BihL5I4gFyojhUMeFIp+oHQMRWFzRlsOjqaOHhRRAFfeZZKPXhbymefd58pSMfT+4
 kI2yZXvPy2nLsdGbkIrSCfLKnMIlyc8lMq/CwCopCgy5EBn7NwUPt+Q/sL7O+nNvndhEL9ma1ZN
 J0UAgK9kCULfK3v2Ef85guiw832Cn/WVU+aLRqDqN9hiQFjLQuHV5PloeBO6qyJlPBtb7XKuayZ
 NmI5QaeWaEIxKVDbP/uWyWS3aM+RE8aJVUtk1dqkme8Bek746uqScSaUmijAmcZqX85cKdeqpJl
 zPXtor4eW6FIO3oXJuPX1xDVVXtEsFZBKCf98lARB1I1eKyW0SQFLBjaI7A==
X-Received: by 2002:a05:6122:169a:b0:544:79bd:f937 with SMTP id
 71dfb90a1353d-554b8c23f89mr3464550e0c.15.1760016774159; 
 Thu, 09 Oct 2025 06:32:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF11oySDBoem7xTkH1oLPUQwPCox0qjhESMy2x1A0tSRyY/Tw898j/talcs/MTKAv8Q9vNTjA==
X-Received: by 2002:a05:6122:169a:b0:544:79bd:f937 with SMTP id
 71dfb90a1353d-554b8c23f89mr3464505e0c.15.1760016773679; 
 Thu, 09 Oct 2025 06:32:53 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5907adb1268sm1047769e87.90.2025.10.09.06.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 06:32:52 -0700 (PDT)
Date: Thu, 9 Oct 2025 16:32:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: jfalempe@redhat.com, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/4] drm/client: Add client free callback to unprepare
 fb_helper
Message-ID: <w23s7pc3diq742biiq6sah6lkps6irejtkvcwvyotbaty37hvj@j2nheyk3ir4e>
References: <20251009132006.45834-1-tzimmermann@suse.de>
 <20251009132006.45834-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009132006.45834-2-tzimmermann@suse.de>
X-Proofpoint-ORIG-GUID: RxW4fcWvww62hzA3i4qaKwlYJ0s-s8Jf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXyw9eDulv6A46
 tIPU3ufoU87d0UuAbA+lnkWhO39Str2A5DaczWpZHPGg2V0lzFM3SyKcw/ppoVyE9VlEi0Uu6jR
 2D2arC4YO3zf6xw02qPb4nKTPG2H6ACvZh8FQOv74KSnNQHcFBuoQd1gNLwCNpaAYveijgwe+sX
 Z/tGNUXH5pHC84+YLZ6qdBgaaNVSFzeOjjSgybOaRXwJzcW0+OqFKz2cXcNavM4JsBt6cfCzJ4i
 2TboWfg6vzNoNI+xXiy+VBkNh/dN1UgWIs+jFHkXgH2k9RX0fa/wrD6sUd4i12M3/6ZNBeoVlrB
 GKJsYNZGMfv6Z3fFqVnvNB0IhCccjg/v5+3sS6AbNiQtAOL3nAl6h1w043Bo9taWcrGqOEXbdN9
 fN5IplrgU0ru0A+LPNf2okOoaD8Gcg==
X-Proofpoint-GUID: RxW4fcWvww62hzA3i4qaKwlYJ0s-s8Jf
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e7b987 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=463TWv_Jhf9JylTOhJ4A:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

On Thu, Oct 09, 2025 at 03:16:28PM +0200, Thomas Zimmermann wrote:
> Add free callback to struct drm_client_funcs. Invoke function to
> free the client memory as part of the release process. Implement
> free for fbdev emulation.
> 
> Fbdev emulation allocates and prepares client memory in
> drm_fbdev_client_setup(). The release happens in fb_destroy from
> struct fb_ops. Multiple implementations of this callback exist in
> the various drivers that provide fbdev implementation. Each of them
> needs to follow the implementation details of the fbdev setup code.
> 
> Adding a free callback for the client puts the unprepare and release
> of the fbdev client in a single place.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/armada/armada_fbdev.c      |  2 --
>  drivers/gpu/drm/clients/drm_fbdev_client.c | 17 +++++++++++++++--
>  drivers/gpu/drm/drm_client.c               |  4 ++++
>  drivers/gpu/drm/drm_fbdev_dma.c            |  4 ----
>  drivers/gpu/drm/drm_fbdev_shmem.c          |  2 --
>  drivers/gpu/drm/drm_fbdev_ttm.c            |  2 --
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c  |  2 --
>  drivers/gpu/drm/gma500/fbdev.c             |  3 ---
>  drivers/gpu/drm/i915/display/intel_fbdev.c |  2 --
>  drivers/gpu/drm/msm/msm_fbdev.c            |  2 --

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # core, msm

>  drivers/gpu/drm/omapdrm/omap_fbdev.c       |  2 --
>  drivers/gpu/drm/radeon/radeon_fbdev.c      |  2 --
>  drivers/gpu/drm/tegra/fbdev.c              |  2 --
>  include/drm/drm_client.h                   | 10 ++++++++++
>  14 files changed, 29 insertions(+), 27 deletions(-)
> 

-- 
With best wishes
Dmitry
