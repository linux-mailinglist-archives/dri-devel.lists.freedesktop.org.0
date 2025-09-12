Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B76A4B54AA5
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 13:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F2310EC0A;
	Fri, 12 Sep 2025 11:07:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IaVkP+Qq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73AE10EC0A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:07:33 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fblw018855
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Wuz/SrWcESRGcCo6gCYLmsKe
 MNM5PGRQfy8MjBCPiko=; b=IaVkP+QqorLtlosBQlebP9mE3Uv5KNkPPk1P8+JE
 Zq9dpAgX+ekM1Zs0k/O2YbThYvj3Sx0Qwp2kKBJaM3FvKYVmgHKgOeH58p9OkycZ
 +jzas3wHOArWzLbMyOid5tMhfksUCpGsj200QR7a93K17uIMHkWg+l+PDsf/cOEU
 /rFEnbA7GHi+j/STB5y8mnnmBF+wMs/fS4aZh4hxR0a9iSKfvZQ3hWSn+UgPmWMX
 vG619QtR/QeZ9jImLqttdZdEEsagjpIAtlT2EtoAU3Z7qNuXuJDHFMV4Kaomvq7Z
 kbsyNFy+0n6rbFNxRZEL2VMUyBx12fkNcEcRHGWBCnFhrA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8akdsm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:07:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b5fb1f057fso24359731cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 04:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757675251; x=1758280051;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wuz/SrWcESRGcCo6gCYLmsKeMNM5PGRQfy8MjBCPiko=;
 b=l6Jg3h/W8q66Ofrhy9ZMimfXNR8Ky3kIaQczVBCSNHgeKWZ2/f8ERg9YIxrOEQ301O
 DbIn9GUqJ7DBThobnIYpQGQ3oauDph6AqSH1MyFuujhNLRExho2/SPjUC9YJVjYCBmfX
 H62zIUCXMLmk+kP9f+gGbd1l/+qJhwOpWx8BWjYSGLNDJuvwD1qhKmrbgyPf1wvuKMvE
 aO8s2EAMAOJdKK4sFQuPAvGJ3pdRUZXlgfUyChmqNXjXwgm6ELb5SQJ+NFtj7rHcpyfN
 O4wSxlKTClIYxNnACtfgRlYx/kafQWlkcxjB3KhLZO9A6hGs2mqLqmIDO2LJWIRpkNhZ
 wbfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQG83TIX2D5D4Tjv+PuVCafPEZiUuaXkNat41QGyWCUCvwlx0uf3SWei8ugi8EDVrFBj+MGbtgQ14=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx56MJLI3jGHeabLcizrC3VaatumXmQr2nhtN16/KsWWXuzZ7tg
 uqAcPD45042++82GHYoGNn0lT18uGbE9oW1MmZqrCYF/VH/RqiMO06UQ4e3V8TGHJbz6U6KAmak
 fZ7vmnzQQQzrFjbhrvGHlq/GGcMWHDAdaxiDpPFg4stTUoWtCjVpS6gNZv60OlR1Z7cMlUr0=
X-Gm-Gg: ASbGncvu9mbXFgfCJz+1zoNmblT6quQpnxYCtWlOC3LiqoUD2mrRLp1viFHyBtYMkyO
 AjintGv3cY4+KXMn2mDRTPtwrnSXgvvbKqdRgcxnnSPDJ+eqobcKcUwtYXwBw480h6LGldywMdB
 ImaxayQVJQZZ8sSX2XZJz2kY1nNrrbMYBw0t3i48/19IADzPv9i8FwyT8fT6HKbhh8318jLP3Cz
 jZL199tIXnvPr4vdqJWB+s9irbfHQnN67JjtPXDXhx2bRmLe9Z25+d/Xi5xu0fFOvoy0TJhZ0aL
 bdqUvkS4mjO6Q41K52J2cpn8/lsyWTvsD5+ToBhEBXKqyAlHBkKSxypwSbEoHkxcI5grxFDo+Fc
 9/2nqNzwDSFCVRm//NH0L3wWfO46ykHD1tL9DVRj/sZWIVRNtA4YV
X-Received: by 2002:a05:622a:11:b0:4b4:9773:5866 with SMTP id
 d75a77b69052e-4b77d0c8726mr26900791cf.65.1757675250830; 
 Fri, 12 Sep 2025 04:07:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEiDGwKFNmyX2dYy+yuf7JY3W0Iytw1CrXm3NUr783uLSdnhKB6N+spTNVyCrcHKwChFTEdw==
X-Received: by 2002:a05:622a:11:b0:4b4:9773:5866 with SMTP id
 d75a77b69052e-4b77d0c8726mr26900321cf.65.1757675250170; 
 Fri, 12 Sep 2025 04:07:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-34f1a8211c9sm7300031fa.37.2025.09.12.04.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 04:07:29 -0700 (PDT)
Date: Fri, 12 Sep 2025 14:07:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, dianders@chromium.org,
 m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 00/17] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
Message-ID: <s76pkp6cir2s2x6xzhnuhkmvirn3l7gnrhlpuachldbeqztwoo@xqnsyyjxctxy>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912085846.7349-1-damon.ding@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c3fef5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=TUyDhR3qWEo6SlV7cHcA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: iQt_jRoJtSZ9dhd2HozI7X6oNM6NDFeE
X-Proofpoint-ORIG-GUID: iQt_jRoJtSZ9dhd2HozI7X6oNM6NDFeE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX6z6xr5Ewz12X
 dtZn5j9thY8YCIxtJSn8SDBOKsfc6dRtqsHUaENqYzMxLZZyF6fdl/AZ8kyLkGLSvXgXFGeJEIV
 wU80n58c2Jifuo3FPOWalMZtv2xK8TJTYkNih7xoSWDnrfb4oBIhWsdmMKg04Sz+wInqpyL3p5v
 q2kQd0mgTgePlRfqMxuWW1QAeQqcweDASQ5IPDw8MvPBBurcVywp9CYE5kaSYd44g6o/RWTjtLU
 XH9FR6umw71bQdczfE0Np4adUAAcbygoC7x8ywpiiDaXqxIZn28wh4oqyIk0367o5LsZYHsfS0c
 ed7gs7g9ZiAfAf3sAjv3hsukJGll9i7aIlNreNpbw5zD//593jSKThzmjfGZR+jlZQTPZzbF9LO
 yAu+yly6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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

On Fri, Sep 12, 2025 at 04:58:29PM +0800, Damon Ding wrote:
> PATCH 1 is a small format optimization for struct analogid_dp_device.
> PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
> PATCH 3-9 are preparations for apply drm_bridge_connector helper.
> PATCH 10 is to apply the drm_bridge_connector helper.
> PATCH 11-14 are to move the panel/bridge parsing to the Analogix side.
> PATCH 15-16 are preparations for apply panel_bridge helper.
> PATCH 17 is to apply the panel_bridge helper.
> 
> Damon Ding (17):
>   drm/bridge: analogix_dp: Formalize the struct analogix_dp_device
>   drm/bridge: analogix_dp: Move &drm_bridge_funcs.mode_set to
>     &drm_bridge_funcs.atomic_enable
>   drm/bridge: analogix_dp: Add &analogix_dp_plat_data.next_bridge
>   drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
>   drm/exynos: exynos_dp: Remove unused &exynos_dp_device.connector
>   drm/bridge: analogix_dp: Remove redundant
>     &analogix_dp_plat_data.skip_connector
>   drm/exynos: exynos_dp: Add legacy bridge to parse the display-timings
>     node
>   drm/bridge: analogix_dp: Move the color format check to
>     .atomic_check() for Rockchip platforms
>   drm/bridge: analogix_dp: Remove unused
>     &analogix_dp_plat_data.get_modes()
>   drm/bridge: analogix_dp: Apply drm_bridge_connector helper
>   drm/bridge: analogix_dp: Add new API analogix_dp_finish_probe()
>   drm/rockchip: analogix_dp: Apply analogix_dp_finish_probe()
>   drm/rockchip: analogix_dp: Apply &analogix_dp_plat_data.attach() to
>     attach next bridge
>   drm/exynos: exynos_dp: Apply analogix_dp_finish_probe()
>   drm/bridge: analogix_dp: Remove panel disabling and enabling in
>     analogix_dp_set_bridge()
>   drm/bridge: analogix_dp: Remove bridge disabing and panel unpreparing
>     in analogix_dp_unbind()
>   drm/bridge: analogix_dp: Apply panel_bridge helper

This patch didn't make it to the maling list.

> 
>  drivers/gpu/drm/bridge/analogix/Kconfig       |   1 +
>  .../drm/bridge/analogix/analogix_dp_core.c    | 394 ++++++++++--------
>  .../drm/bridge/analogix/analogix_dp_core.h    |   5 +-
>  drivers/gpu/drm/exynos/exynos_dp.c            | 168 ++++----
>  drivers/gpu/drm/rockchip/Kconfig              |   1 -
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  74 ++--
>  include/drm/bridge/analogix_dp.h              |   9 +-
>  7 files changed, 342 insertions(+), 310 deletions(-)
> 
> ---
> 
> Changes in v2:
> - Update Exynos DP driver synchronously.
> - Move the panel/bridge parsing to the Analogix side.
> 
> Changes in v3:
> - Rebase for the existing devm_drm_bridge_alloc() applying commit.
> - Fix the typographical error of panel/bridge check in exynos_dp_bind().
> - Squash all commits related to skip_connector deletion in both Exynos and
>   Analogix code into one.
> - Apply panel_bridge helper to make the codes more concise.
> - Fix the handing of bridge in analogix_dp_bridge_get_modes().
> - Remove unnecessary parameter struct drm_connector* for callback
>   &analogix_dp_plat_data.attach().
> - In order to decouple the connector driver and the bridge driver, move
>   the bridge connector initilization to the Rockchip and Exynos sides.
> 
> Changes in v4:
> - Rebase for the applied &drm_bridge_funcs.detect() modification commit.
> - Rename analogix_dp_find_panel_or_bridge() to analogix_dp_finish_probe().
> - Drop the drmm_encoder_init() modification commit.
> - Rename the &analogix_dp_plat_data.bridge to
>   &analogix_dp_plat_data.next_bridge.
> 
> Changes in v5:
> - Add legacy bridge to parse the display-timings node under the dp node
>   for Exynos side.
> - Move color format check to &drm_connector_helper_funcs.atomic_check()
>   in order to get rid of &analogix_dp_plat_data.get_modes().
> - Remove unused callback &analogix_dp_plat_data.get_modes().
> - Distinguish the &drm_bridge->ops of Analogix bridge based on whether
>   the downstream device is a panel, a bridge or neither.
> - Select DRM_DISPLAY_DP_AUX_BUS for DRM_ANALOGIX_DP, and remove it for
>   ROCKCHIP_ANALOGIX_DP.
> - Apply rockchip_dp_attach() to support the next bridge attachment for
>   the Rockchip side.
> - Move next_bridge attachment from Analogix side to Rockchip/Exynos sides.
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
