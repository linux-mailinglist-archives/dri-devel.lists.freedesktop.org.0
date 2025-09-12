Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C91B54A96
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 13:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1320110EC08;
	Fri, 12 Sep 2025 11:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MW+FPQwl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6271010EC08
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:05:30 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fKrI017555
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ohxWiDpU3AbnS+UuB5k3uTeL
 Adfv2H657D5P1upIvkQ=; b=MW+FPQwl0WXbDItnUmSLSyc0GbmzLyjyN+1txKc9
 AT8xH8wJevXZk+3JGPM/TL/TeFRxNl3xa+KYO+gVkQJibvA1hRV14iyuYwuCQD/k
 H6TQpfFx6o9mf+cU9fgLeQWIvyXyz6gBoLqL44Lh7tsBn89d2vYo2EdJBDoMeqpt
 TT0KXvoKXXTNMHzTHYymhlwEPkYue4dvA1klpbeN+GBZIqZeU/yPXK29s1Nmj+NK
 lH2MLswbDAoOsfcI6fFPUnlcyNvueBJVPGA/xxt4gjfJXJRzefcTAKNoYcHr9XpY
 Bvy0I3PdXjtYA4YgRe7OaVCk+4JsJLwYYDlNZvhHIPwr2A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwskj10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:05:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-72048b6e865so31477916d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 04:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757675128; x=1758279928;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ohxWiDpU3AbnS+UuB5k3uTeLAdfv2H657D5P1upIvkQ=;
 b=CcA0Aky/CrJBS1cEyu39ntT94Yuh6j42ACDbMtRN5oBQhOBjau6I3IcEJPuIbRAeGA
 8w0QbzoxsAustyuaRRkiR5qMXhplGAqtIGd8ycARh7PH3s0Rc/DcDhqBC6FePWaZTaX5
 X1bI2owH/3nagYlPM9lMYav2jgmcc1tkkwg2jrO4BzHaowWw7VBNRw3T+kcXEQP6Qonv
 YONRVHBDdIQNogb1EoGDWwKZNLA+r4Vp/6by1xEN5KT9ynrQa0BBiSFeCaC8zBaKkOLw
 YiAIDxF/vFdGVWRL8hlZNYJw381z3PFNYUeNevqVQfjtcQ9E50Y80Y4+vmUj02YzVgbV
 +hrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVK49jtCunjlb3PojUUrMvSEjMwF8zHVbNuYftSUPl1eyDD0EU2P+Hq4jlupGGsYmxHF7H55Ydaks0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7A9/QYK8jrvIK0QXmCcUxQ5zVeXilCksX0nlzpnlprYYmYyhn
 wUx6DyPDU5uTkDcKqpzIPxY1bfw0x8iBFGN+3zqPSJtGBE40uvbrauUi/IqvNmnX+yaQRp2aV/D
 GM3AbjFQc+3QC0Zgpg9holbh2j1vqvwOMDThSImrSJXjGS5RnUQVtC2KNfOgElb1+a+ruJnc=
X-Gm-Gg: ASbGncuFMKg0qj4rIQchTjrjt7ZUuglHc2WIJIujsJJ9iFXsITcVg12eu6yJqA9A2+f
 ll2nCNKwiakMSZCx533W9t51wm+YHeMfPT0LX8qicLeIhd9PMuMUd38KlOqKtM/e0MlyEAqtyC9
 DqYTUXRA0w6M4XbDeOKu5GwLlMv7qZftOqXYq8cgcvnTl7AsE0qCYNuVjKy+Ry3EyjDJx7v+3+1
 LQCXT0d1DpHHmkcjDNl/o0zhziUkzHI0nQ7p966MSBSiVEyiHovPgP+mPAt3v9/WqsuJHuLRZTA
 LaLLKvevQnDaFHkeGDsunQzSVWtcNaH38J7rvvwF3Osx2S9a2LuE++BgzCO3QugASVtk/MQ7kNs
 J/d9EjAj4fSX5nuRTRPk3vHs74YYFeK9cnq30ZFhWGF1WPb4Zlo86
X-Received: by 2002:ad4:5cae:0:b0:725:cd10:3d1d with SMTP id
 6a1803df08f44-767bc5e525dmr30639386d6.16.1757675128333; 
 Fri, 12 Sep 2025 04:05:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKv2Tcc0omb5IKgx/KH/GT6a7+rHlMbIBMJwADkJ0xx5dKz4aNr6q+JalITdK6SvCqNVjAPg==
X-Received: by 2002:ad4:5cae:0:b0:725:cd10:3d1d with SMTP id
 6a1803df08f44-767bc5e525dmr30638416d6.16.1757675127615; 
 Fri, 12 Sep 2025 04:05:27 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e65564946sm1077186e87.127.2025.09.12.04.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 04:05:26 -0700 (PDT)
Date: Fri, 12 Sep 2025 14:05:24 +0300
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
Subject: Re: [PATCH v5 13/17] drm/rockchip: analogix_dp: Apply
 &analogix_dp_plat_data.attach() to attach next bridge
Message-ID: <2cu3ge6kjeibfznvt6c52xn2rp5zb3wk3pkb7gly34qrjlueem@7wqyowascpn5>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
 <20250912085846.7349-14-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912085846.7349-14-damon.ding@rock-chips.com>
X-Proofpoint-ORIG-GUID: yQNGJQhuSSteJnQKyn_2zLhWbn9NaSuP
X-Proofpoint-GUID: yQNGJQhuSSteJnQKyn_2zLhWbn9NaSuP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX+5oGldOTFjC4
 FE7iDBHqxmiIfuMOsIsjizgEqWqttdO8tBXEwhgUad4XkFT/AILAgS7lIXL7UVdXw6cAp21w5VY
 VOZse7vKJifbHFB7VeUn/9Tgf9pBdxb91pyNT1Wig7/5r5xytrYE5sjNgwzO25zRidMYOrtcfG9
 Fg4VLRkiFRGwWsWtiYIMhMLFI+1ObnpTIZpgIXJd7Mrkh8vb/j5HH35DbK0V/BkWRrh6NWZTLFq
 y+/IUPy2Pzy0WrzPEn2u+3o7dAbkP+F4OTLSVW4Q31vmKUX47JN/zE7kODr6gWK7pKGD7ZppdYg
 X34beHjF9jsOe+K94+0XWjqSf92ZVIx7MI9sFvnppbpdkza0OZxrRtZm2EtoETkz1wDumWIk5Ml
 2z4Q6KBm
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c3fe79 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=Fz8SCyDB7bCRA1NsBX0A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

On Fri, Sep 12, 2025 at 04:58:42PM +0800, Damon Ding wrote:
> There may be the panel or bridge after &analogix_dp_device.bridge.
> Add rockchip_dp_attach() to support the next bridge attachment for
> the Rockchip side.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> index 0784f19a2ed9..39f1ed293c75 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -164,6 +164,24 @@ static int rockchip_dp_powerdown(struct analogix_dp_plat_data *plat_data)
>  	return 0;
>  }
>  
> +static int rockchip_dp_attach(struct analogix_dp_plat_data *plat_data,
> +				     struct drm_bridge *bridge)
> +{
> +	struct rockchip_dp_device *dp = pdata_encoder_to_dp(plat_data);
> +	int ret;
> +
> +	if (plat_data->next_bridge) {
> +		ret = drm_bridge_attach(&dp->encoder.encoder, plat_data->next_bridge, bridge,
> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);

Can this be handled inside analogix_dp_bridge's attach callback?

> +		if (ret) {
> +			dev_err(dp->dev, "failed to attach following panel or bridge (%d)\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static bool
>  rockchip_dp_drm_encoder_mode_fixup(struct drm_encoder *encoder,
>  				   const struct drm_display_mode *mode,
> @@ -452,6 +470,7 @@ static int rockchip_dp_probe(struct platform_device *pdev)
>  	dp->plat_data.dev_type = dp->data->chip_type;
>  	dp->plat_data.power_on = rockchip_dp_poweron;
>  	dp->plat_data.power_off = rockchip_dp_powerdown;
> +	dp->plat_data.attach = rockchip_dp_attach;
>  	dp->plat_data.ops = &rockchip_dp_component_ops;
>  
>  	ret = rockchip_dp_of_probe(dp);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
