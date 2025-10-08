Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8BDBC65B6
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 20:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A79710E8B9;
	Wed,  8 Oct 2025 18:51:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pm35HvVw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E15210E8A5
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 18:50:59 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5s1b005405
 for <dri-devel@lists.freedesktop.org>; Wed, 8 Oct 2025 18:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uITwFPVVtm5HGcZZqlMQJExGS43mnTAbnaIunuo1244=; b=pm35HvVwKYtocXkC
 KgBjxl7KJX/a84PN3g7r4RKb4r25FiSljFfF0+W+PA8oUpzKh7i19OAwbJAeQwCr
 uK4H5eZoRKU5++bwJFddNVJd+ffIZEZTvGMqtUvedUt4Vtp77DThSZmodrglKARL
 FQetzyS0hXMvZCfYIRLI51jKH9BSPfL7W9Yfsl94SY1qy7SGCRajgJyFEJcZboHR
 993RwCxyAeMkuFZlhjJtL5Bu7ESP8uLnmbefsmT9ZbgN3gS6r3Br47WlCrPpyOMn
 yDv33Tiwo6b3L3xKLwUMFrw2332qL/ViUXzWVX0/lNZsOsx3odEH5pHneOK2jail
 wvpZ8g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kr8wy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 18:50:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4d8b8c3591fso4384311cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 11:50:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759949457; x=1760554257;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uITwFPVVtm5HGcZZqlMQJExGS43mnTAbnaIunuo1244=;
 b=n4VKMmTi7vIGMV0WCQbU+9omeHruXhSU6l8TpRXdlCnYAYzlP/Q60MYSEZKEAUEOyG
 ygIC1d9/h8ZXSbBXjBpbZEcSfDKHOKXQRrNWLiGs1R69M2qlDpS71jAVJQy5CX94aKS0
 s6x0FvYgLbZefagqfjQpoHZ1eAcP/28jnhlqywUPuaHdJYpVhcN/tono2qGAqDZED9Lp
 QV3ekgncPYMN4v3MckYZQ+MXM0CnN/xVhX5tPK1+CrB5ehH24bXwIa4rsw0wAFgPkxJa
 67AbPFfLCIeRAczr3t7s7S3OJc2X9XIi2Xem2k76w5chsWAoNwz61GXe5CBsTMRW1b73
 /TAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXu+6z8A3OvKvyt1pxMKuO0JagFlhYTZ1sY3sbAdeoVrW+onqH4KgobXkL6436prQQxN7CcFvV7QF4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKL/bPKLO8/hDIrcfgf388zijsIeDqQ3qvbWqzhrw8vWXqGJpO
 mt32w+Cu/+vn9Bu4lHrTD6bTq75Nu38KekZGmSRWqHKt7ZTB+xhaZiKfFFzzOEKEEdcXHxrV7kZ
 KnlnCljAbup9L+F4THejO/nncDZLb9VrkwelxbfyNg9CMHukZKZCbXnCDZqYbl6Tp33Sk3Cw=
X-Gm-Gg: ASbGncvqYElLyF50hAAtFdsb58+E6/suclPUWtChJndoJQt70en6TeGfpegcqoxltsg
 ThpbUlfEi1YBU4+nly/cffOpQOoG2oDCoH+CdGOcjVKdzvZYScO2wZ08hCr9ZBYok7Dm9zAIoRH
 /QjhBYqwM//1WiXTLVkLMnhC+R++OJ4ctwyBPrZm3luARChVW4etdmUvtdhZ3dLCH0BxAvWMcSU
 d6fivqbfbYFflSxkIxujyLNZrt9j1fW91NM8Amoadoim0Fa3qOytako5KVn/Wvqf93uleIYDks7
 Bpr2LumB3EhQoUlKkKtrKySNYukSEYpJp4ztDYpEmKGt4mwcIK7quuA65P0bhNnBpoom/nY86x0
 wjTmMy+HoGgrS+2CHeUs3ol5w8ElUghPaoYxtyvmuqA9N1FVPGJFpS+EApw==
X-Received: by 2002:ac8:6f0c:0:b0:4e2:f1b3:3465 with SMTP id
 d75a77b69052e-4e6ead76f15mr74281781cf.38.1759949457207; 
 Wed, 08 Oct 2025 11:50:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUO4IzyC2eM+Rm083vlD0OKO2yWrQqJ+L80WsUVjuOU8S6+ZWJh0vpPqNVGqSnwQ0XcRPA2Q==
X-Received: by 2002:ac8:6f0c:0:b0:4e2:f1b3:3465 with SMTP id
 d75a77b69052e-4e6ead76f15mr74280941cf.38.1759949456598; 
 Wed, 08 Oct 2025 11:50:56 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-375f39d509bsm22551021fa.12.2025.10.08.11.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 11:50:55 -0700 (PDT)
Date: Wed, 8 Oct 2025 21:50:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 amd-gfx@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH 15/16] drm/atomic: Remove state argument to
 drm_atomic_private_obj_init
Message-ID: <wy7atek2mqkfg2nkawobibq7abt3w6g5wiu4d25nkctkxwkce4@mffhmrlfrqdy>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
 <20251008-drm-private-obj-reset-v1-15-805ab43ae65a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251008-drm-private-obj-reset-v1-15-805ab43ae65a@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX4zJIgjo5Oekn
 OZbdIyX1QHeJT0gOWf5ToO1KbEjWoiOV52QzPqRyg94Y8xCxMKJdRYuWHTHRGZ2XTvXEEoZ4+lQ
 IazaX9rDYH6ZBlJlmWbf6/EYbW/aX0RPQsHdk258Ndi8OmuBIT1nKMjRTvn2x5TvxWi4nWfxY0X
 CkfNX6+dK7Wy1KZGCngH4eH0agObXbnU2IrZrXIyfLc8ELjlf/+IsRE4mGcLvhwcFOUyD73A/FX
 GiTtZ9nbeg+vwKMqEKdgvE0wKMQVdUNQfE1MmBx2SCmUawyL2ON8smmvR3bdntxyCwUpNBC0CWw
 OWucTPbMW+jzzNgBKHxMVA8UdADCKDofw2jRixGqlejbuXgGjGnePy/DkXHO2JPTMThf1nUoTsl
 GgJzVR+NiBpYVGYPPWnv/vzVEOvfGg==
X-Proofpoint-GUID: 2aoaOd3g3M1gjHjKKl1ADfeZnwKyJXLu
X-Proofpoint-ORIG-GUID: 2aoaOd3g3M1gjHjKKl1ADfeZnwKyJXLu
X-Authority-Analysis: v=2.4 cv=SJxPlevH c=1 sm=1 tr=0 ts=68e6b292 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=QyXUC8HyAAAA:8
 a=KKAkSRfTAAAA:8 a=ER_8r6IbAAAA:8 a=P1BnusSwAAAA:8 a=pGLkceISAAAA:8
 a=Ikd4Dj_1AAAA:8 a=RF00TdSWAAAA:8 a=V2sgnzSHAAAA:8 a=EUspDBNiAAAA:8
 a=tVI0ZWmoAAAA:8 a=e5mUnYsNAAAA:8 a=4fa6rhvZphqvzmXW0hwA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=dawVfQjAaf238kedN5IG:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=cvBusfyB2V15izCimMoJ:22 a=9LHmKk7ezEChjTCyhBa9:22 a=D0XLA9XvdZm18NrgonBM:22
 a=_nx8FpPT0le-2JWwMI5O:22 a=Z31ocT7rh6aUJxSkT1EX:22 a=-BPWgnxRz2uhmvdm1NTO:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
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

On Wed, Oct 08, 2025 at 02:04:13PM +0200, Maxime Ripard wrote:
> Now that all drm_private_objs users have been converted to use reset
> instead of the old ad-hoc initialization, we can remove the state
> parameter from drm_private_obj_init and the fallback code.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> 
> ---
> 
> To: Liviu Dudau <liviu.dudau@arm.com>
> To: Andrzej Hajda <andrzej.hajda@intel.com>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Robert Foss <rfoss@kernel.org>
> To: Paul Cercueil <paul@crapouillou.net>
> To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> To: Thierry Reding <thierry.reding@gmail.com>
> To: Mikko Perttunen <mperttunen@nvidia.com>
> To: Jonathan Hunter <jonathanh@nvidia.com>
> To: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Rodrigo Siqueira <siqueira@igalia.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: "Maíra Canal" <mcanal@igalia.com>
> Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c       |  1 -
>  drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c | 16 ++++++++--------
>  drivers/gpu/drm/display/drm_dp_mst_topology.c           |  1 -
>  drivers/gpu/drm/display/drm_dp_tunnel.c                 |  2 +-
>  drivers/gpu/drm/drm_atomic.c                            | 17 ++---------------
>  drivers/gpu/drm/drm_bridge.c                            |  1 -
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c               |  2 +-
>  drivers/gpu/drm/ingenic/ingenic-ipu.c                   |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c                 |  1 -
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c                |  1 -
>  drivers/gpu/drm/omapdrm/omap_drv.c                      |  2 +-
>  drivers/gpu/drm/tegra/hub.c                             |  2 +-
>  drivers/gpu/drm/vc4/vc4_kms.c                           |  4 +---
>  include/drm/drm_atomic.h                                |  1 -
>  14 files changed, 16 insertions(+), 37 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
