Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A854BAE835
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 22:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E5B10E626;
	Tue, 30 Sep 2025 20:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pe4Y/dsR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2C210E626
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:18:03 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBWlfM032523
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=sdLCuj5V1B6mGqY302QitcGK
 Fp9JJVU/Ya21+9Ly7EM=; b=Pe4Y/dsRASMVOkBpq1opV2LmbOdpxDfVc7aI+ElS
 544wIH3lQYA5SQiUMZQp28vek9ObwV7iz4w5vSnE7J6E8IHtOQJ9ckTV1jlERRwm
 /TbtSHV0W/1HHnQUknINy73i9V+ig57gpREelyC0QDOeIbrviiLhLLnyEo1lUJlu
 clNg+5gsqLIPJX8z27r3tLuiyZrTYejLf00vyCyGbF5nHBIeKquXRSrH8sn1bkA8
 4VQ+AnhjucwyY1qmVl7s9xGCGCkn67p7AurHo/w0O/S0x7arWbbM3X/Ltj67qCxd
 3eTuof2oqS+cN5qfBi+MgrgTzORxYpFN0fEgTMkCoWpdxQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fppr5u87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:18:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4de5fe839aeso114133561cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 13:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759263482; x=1759868282;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sdLCuj5V1B6mGqY302QitcGKFp9JJVU/Ya21+9Ly7EM=;
 b=ubecfpplUraoKlHkuuTqxFvRtnhAvu4MEGjcCzoigmqxzT64KF07v4fUIHeBznOBGN
 BPD8/Ri9KznmSup/kfQFUcxsm9Cincxm0kG8Sg0HOtE1LVA8Nbz5gWtSXTliRW2Ek7bw
 L1jH71rhVV8FsayYO5FkzPEmVIuQBuGrmE9P+gcDiPCYy1qszXT72WiqDCoasUlih3RF
 /d5tLl0mclnj43qXpSToiJpkDcBxs3k1ONOAGrqUiOutMGl/OTaGAnXKFUeS8nGxrh+U
 s1b6sPcgp35TH37VAuAC5d3qxdZqlx7seT18EU7OxICwJ50Nw0Z5tLF50GTx+ip3EzvA
 m1NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTy+fy/pW3S77fVwz3MgBuzUuDUJwOT0XFuOTb5JFz9Nvv7aqsvSEDFG4TIRGWUlxNG16545LYDRs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQS+AF/nhK7WSfLTqTr7tsvGDcXHvDMHUsYhsVxvVTNJ1Q6yp6
 G1P4d39KA2CzCtO9clPAL5/Xl/eqkEwWHARtv1lIs9Gmwdsr8TpCvFlkEKrkrE1PKdOD3VKHI9b
 y/nWJRh6TtmrG7x1ulAWXsQhCWtAnLzMnppTbKNS17ri25Y/4vY3D9m+XLJfA52PRxrg90zI=
X-Gm-Gg: ASbGncsgxYRWTolK7GL4YAyjOcFq0BHC6V7tlq44I9mey6mNsIX2l/gbyBeasCMUOSn
 ufWSTKEm+11/TOn/byqiZthals6B0/mM9e+5C769B/JD3L+7rQR8lJ/hhOdCn6Ogwcj5NSw/t61
 T87qZV7RYkq+1bUyHFZGiCGNpKUiroQ5GnpE88CmjZmLtt6w9kjTUmATdmAPEbqxwUEABggAbvZ
 C1RYMtuYjhi5Bq86IFFbXSuRst6gttJnYLqYpiqhMheb/WH3lISC/NfoBCQ5DPXnzZoQNmo929Z
 /Fl6xw2070uPpwrFsUJ7fPsc1U7UbexxE3IbuPFdJc9un8d8RWrqkyHht3dsCWG0nCcn88Bwflw
 MAdRfPFuK5SD1wZJU0sIW/qHckO0y/3HFVx6d/aMJ9KkAIp+a6yNDcNCWjw==
X-Received: by 2002:a05:622a:30b:b0:4db:f72a:b816 with SMTP id
 d75a77b69052e-4e41ca1cd94mr12855401cf.22.1759263481825; 
 Tue, 30 Sep 2025 13:18:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzLJ/aNHaWVThXpiXhQPhNd6bXcsrZRT/lYLsQU/H/2CL9o9NPlqCKuAEDT1vBgHAP0z6Niw==
X-Received: by 2002:a05:622a:30b:b0:4db:f72a:b816 with SMTP id
 d75a77b69052e-4e41ca1cd94mr12854801cf.22.1759263481206; 
 Tue, 30 Sep 2025 13:18:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-585f4a77b82sm3072757e87.27.2025.09.30.13.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 13:17:59 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:17:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dianders@chromium.org, m.szyprowski@samsung.com,
 luca.ceresoli@bootlin.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 07/18] drm/exynos: exynos_dp: Apply legacy bridge to
 parse the display-timings node
Message-ID: <73bpf77trhqdo5amfxbn4qhlwf4ta7hmouwfen7m3aslycd3bj@72artzwafbmq>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
 <20250930090920.131094-8-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930090920.131094-8-damon.ding@rock-chips.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDA4MiBTYWx0ZWRfX9QlZLKjD2Odq
 VO5kOpNBPIZDTa5haGsrzxrxmzUVJxUs/1sgNB9y72P1GYvwl7Pm8m22jXdLi0PdP/q14AqKA93
 fNNWzNuGI2E9R2TEcNx5EEybEa1BSCsJMHlX60jCxAdBQZFXjDRnzZfXxlltP+J82npcDsQP8Ju
 n6NDsj8te1MwRaQrYb3QHa1PXT13uSRw6dZdoHuMCPpQ6ActZEtrVr1AGmjWLmFdZOQgGNKGuNC
 NCuu9RxtwuK1Zc/evEjoID6DewswiR3HvbHLuME2xTm/zOqJdOzAbvg0lJl5diVW0FD/ZH7n0Vs
 WVFCT32bPib51fEbWSQIDFHf2L0kpi6nf/+E9axQr/1YznWXNWS/jDFfuQyXFXoOa+g8PL8xTkN
 zZdnLWh4QQkScp3S0ILaXuxZIuxnAw==
X-Proofpoint-ORIG-GUID: -vgD7Lb0oLplPBDDazNXnkDRM8s7iYRD
X-Authority-Analysis: v=2.4 cv=GLoF0+NK c=1 sm=1 tr=0 ts=68dc3afa cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=tHzXnULJKltlW3Z4dK8A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: -vgD7Lb0oLplPBDDazNXnkDRM8s7iYRD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509290082
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

On Tue, Sep 30, 2025 at 05:09:09PM +0800, Damon Ding wrote:
> If there is neither a panel nor a bridge, the display timing can be
> parsed from the display-timings node under the dp node.
> 
> In order to get rid of &analogix_dp_plat_data.get_modes() and make
> the codes more consistent, apply DRM legacy bridge to parse display
> timings.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ------
> 
> Changes in v6:
> - Apply DRM legacy bridge to parse display timings intead of
>   implementing the same codes only for Exynos DP.
> ---
>  drivers/gpu/drm/exynos/Kconfig     |  1 +
>  drivers/gpu/drm/exynos/exynos_dp.c | 71 +++++++++---------------------
>  2 files changed, 22 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
> index 0d13828e7d9e..66665d317848 100644
> --- a/drivers/gpu/drm/exynos/Kconfig
> +++ b/drivers/gpu/drm/exynos/Kconfig
> @@ -72,6 +72,7 @@ config DRM_EXYNOS_DP
>  	select DRM_ANALOGIX_DP
>  	select DRM_DISPLAY_DP_HELPER
>  	default DRM_EXYNOS
> +	select DRM_LEGACY_BRIDGE
>  	select DRM_PANEL
>  	help
>  	  This enables support for DP device.
> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
> index e20513164032..507d0a98fe5b 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
> @@ -19,6 +19,7 @@
>  #include <video/videomode.h>
>  
>  #include <drm/bridge/analogix_dp.h>
> +#include <drm/bridge/legacy-bridge.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_crtc.h>
> @@ -38,11 +39,23 @@ struct exynos_dp_device {
>  	struct drm_device          *drm_dev;
>  	struct device              *dev;
>  
> -	struct videomode           vm;
>  	struct analogix_dp_device *adp;
>  	struct analogix_dp_plat_data plat_data;
>  };
>  
> +static int exynos_dp_legacy_bridge_init(struct exynos_dp_device *dp,
> +					struct drm_bridge **bridge)
> +{
> +	if (!bridge)
> +		return -EINVAL;

Well, this can't happen, can it?

> +
> +	*bridge = devm_drm_legacy_bridge(dp->dev, dp->dev->of_node, DRM_MODE_CONNECTOR_eDP);
> +	if (IS_ERR(*bridge))
> +		return PTR_ERR(*bridge);
> +
> +	return 0;
> +}

I'd suggest inlining the function. It doesn't make sense to have
one-line wrapper.

> +
>  static int exynos_dp_crtc_clock_enable(struct analogix_dp_plat_data *plat_data,
>  				bool enable)
>  {

[...]

>  static int exynos_dp_bridge_attach(struct analogix_dp_plat_data *plat_data,
>  				   struct drm_bridge *bridge,
>  				   struct drm_connector *connector)
>  {
>  	struct exynos_dp_device *dp = to_dp(plat_data);
> +	enum drm_bridge_attach_flags flags = 0;
>  	int ret;
>  
>  	/* Pre-empt DP connector creation if there's a bridge */
>  	if (plat_data->next_bridge) {
> -		ret = drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge,
> -					0);
> +		if (drm_bridge_is_legacy(plat_data->next_bridge))

I see... You are going to kill this line in one of the next patches, but
the API will stay. I suggest adding a flag to the exynos_dp_device and
then removing the flag once you migrate to drm_bridge_connector.

> +			flags = DRM_BRIDGE_ATTACH_NO_CONNECTOR;
> +
> +		ret = drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge, flags);
>  		if (ret)
>  			return ret;
>  	}

-- 
With best wishes
Dmitry
