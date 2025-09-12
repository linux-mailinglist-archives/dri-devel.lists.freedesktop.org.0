Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F440B54AB2
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 13:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A0710EC0B;
	Fri, 12 Sep 2025 11:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bl+MZNeR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D73210EC0B
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:09:19 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fCPO017410
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=RXs862lHntqXQwNUIePs3juX
 TkdDKRSL4lc3ieGUpc4=; b=bl+MZNeRJm2odMXHbz5MBmppwbDpNzrIZUDhXYto
 oiHlHMedpKDBvrKEV9cQVUoTs3htou36PF/hMhh2kQ2OWZjice3mAmYehnUKCDxw
 9Qk5tAJ7EuA/S1VSGHIbv0dBNL3Qa8P2zzCd1xPRK9J9l0OIJBUiBQGgJUNxURtl
 54AzGO30qSd1N1QJtKRnyLUIMsuYPa2tuwlZ00w8d1/bxQcz27udyvhOciGRVu3Q
 fa+OYXWq3b/k1YX/UvASSsDig9EMaLum0zGnMGFbAoBDVOw21J+YsVeb/zdZuSzP
 JKUUO3z+3kf8nud9zavD8wMGa61CFYaEHfrHXPyn5gRx7w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8uge4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:09:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7fff4abc97cso425739085a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 04:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757675357; x=1758280157;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RXs862lHntqXQwNUIePs3juXTkdDKRSL4lc3ieGUpc4=;
 b=OB5xRD0LA3IIK5wKG17Pz2xdXmNcfi8AEBHMEwY1nXo7f6x61xr9gu7NgGOvuzSg2z
 xfyDs354V+3+LxIFOfTCA20ugdViLB3AV5pQUbuDex7ULbywYoJmZHUD1X5EqwTqP4ar
 SCtDkRzMQ9labArvSsbFMCVB1OIed9kKs0zKces7PeK8zcX+nS6Cosbk6DLLQl6GDQ1T
 tOAPwErLVLdK2kRxY0B7RIvXIvJ7qhI1vwASorGtLcwl3M5O8p7pZqnUIQ5vAbREni6f
 7r/Zq/7zR1deEWG06054YIj3yxSadukImToGc3mV9fpy+SEIttajaktkfOwjsCNOXLFH
 7Sng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD9HPD3R6mxIQwV4LsMTTAjeOlGZY+puVKdRVa01hJ1xahvzSMvqnJdwkhZrCPmQRmElxHcmsTUjc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyvNU5A3n+m5yolKpKFkM6lWJ6AOXWhITKjWSTZW6EjqnBVLVY
 WahUUgiP5IElrZM3AcaC0l1Dq5cji8p6LWmdt+4h4CYbKy8PkTvsXU2NRinV+QQAMBlcuOqMwut
 Aho1y5unOQAlQ5yt8gWTegz5glXfGC5qIOsmxXdDuHKY87ebUgl30G/0WD13Lr9zuKgQ0LC0=
X-Gm-Gg: ASbGncsAbuNJRbFcb9aiPbZa65N7lkd7PLvlY+5b+Kggi0lIPBZTc1GVv71jJ8zxI5I
 7CdL+4Cm6FlgfFXY3rS8N3UmYj2wnCPT9gwPBGNvFk95yck6upehfwZzbtSKq+1Kl3WI7x+EJ7F
 jZxcke6Y7e3jGiBDdp9Ib55UeCpolcG2tE1UZV0PwQdSSncylVAfu6HxMF4hRlGUe5FZm9xE5kC
 DgyYhbMOCZpemTsa75vBkhwod+kY2WV0vxyqR5hpPAV2D3ry74nBz/jGEcb8m3HvbglfNB4Untd
 k4zo2khK7Hrn/3BfvTmva8Xx2HO7RYRYqoLdeUiRXht5X3Pu+PesvvF3GvFlkfimJWjGNtiB/zT
 FoU/XY4D68k1RaWtZb6CsOvzc+qsf6u4MrKuw/SJnaJ3QQiIh7t2o
X-Received: by 2002:a05:6214:5292:b0:729:3942:651e with SMTP id
 6a1803df08f44-767c46ccbd0mr29918306d6.48.1757675357062; 
 Fri, 12 Sep 2025 04:09:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwpwkiF7tmyFiOg9b2iM6+kt1wZ6fedFzLrjDmSArDmyBGneXRRy71xO9JbYjDDc2/GjMUTg==
X-Received: by 2002:a05:6214:5292:b0:729:3942:651e with SMTP id
 6a1803df08f44-767c46ccbd0mr29917766d6.48.1757675356530; 
 Fri, 12 Sep 2025 04:09:16 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-34f1a8212e3sm7522231fa.41.2025.09.12.04.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 04:09:14 -0700 (PDT)
Date: Fri, 12 Sep 2025 14:09:12 +0300
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
Subject: Re: [PATCH v5 15/17] drm/bridge: analogix_dp: Remove panel disabling
 and enabling in analogix_dp_set_bridge()
Message-ID: <tywxkfjhulxsgdphngtfs24whslbkmnza7yx2sb7c4ulea6val@46pi6e2sjs6c>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
 <20250912085846.7349-16-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912085846.7349-16-damon.ding@rock-chips.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfXw7K2oo+1uZ+S
 aEI7Mgu/8CXKv/PsYbePA6vkZApIYAEPaWeuMgxHrFN4yORmdI+vj6FwPW6Q3NyHjVsuuQjFcwp
 s1C2H52eqbdhbejGB/EWzdW1yBjFXrJN2uZ97I3jmV2T3pptuM/hqCQ17vQoLc/c1wrkd6GcynL
 p3mdGP2j3IsQrV+IiJmgmC6Sk2RvYiK8Nkd0bN65Axq6MuFfRhd81DLkBYPmORfRi46qlrwF/qR
 vGnxGQ86WebzXAQjXeSeH2avOVbGSzrDEixA8NDvokjtjH4XEGKvf+zNWh24y8iu9JYVPwTZaC/
 j7EpC/yHg2dWcpubyq++tDpfh1uLPfqtrk78cz4f4Warf1tclXn5Dqn3j96qFAxBU+wtChfMgZF
 nt36aB+R
X-Proofpoint-ORIG-GUID: TWSCrM2k8YDXICh-JlaugD110uabu4ce
X-Proofpoint-GUID: TWSCrM2k8YDXICh-JlaugD110uabu4ce
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c3ff5e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=xk9nQhndt_Gh6lZpDTgA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031
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

On Fri, Sep 12, 2025 at 04:58:44PM +0800, Damon Ding wrote:
> The &drm_panel_funcs.enable() and &drm_panel_funcs.disable() mainly
> help turn on/off the backlight to make the image visible, and the
> backlight operations are even needless if drm_panel_of_backlight() or
> drm_panel_dp_aux_backlight() is applied, in which case the enabling
> and disabling process just add necessary delays.

Not necessary, it can actually be turning the panel off and on. Maybe
it's worth squashing this patch into the panel_bridge conversion as it
will point out that these functions are still being called at a correct
times by the DRM bridge framework.

> 
> Therefore, it should make sense to remove panel disabling and move
> panel enabling after analogix_dp_set_bridge() finished.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 66d0cca1f268..c98058e9c917 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -749,9 +749,6 @@ static int analogix_dp_commit(struct analogix_dp_device *dp)
>  {
>  	int ret;
>  
> -	/* Keep the panel disabled while we configure video */
> -	drm_panel_disable(dp->plat_data->panel);
> -
>  	ret = analogix_dp_train_link(dp);
>  	if (ret) {
>  		dev_err(dp->dev, "unable to do link train, ret=%d\n", ret);
> @@ -771,9 +768,6 @@ static int analogix_dp_commit(struct analogix_dp_device *dp)
>  		return ret;
>  	}
>  
> -	/* Safe to enable the panel now */
> -	drm_panel_enable(dp->plat_data->panel);
> -
>  	/* Check whether panel supports fast training */
>  	ret = analogix_dp_fast_link_train_detection(dp);
>  	if (ret)
> @@ -1156,6 +1150,7 @@ static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>  	while (timeout_loop < MAX_PLL_LOCK_LOOP) {
>  		if (analogix_dp_set_bridge(dp) == 0) {
>  			dp->dpms_mode = DRM_MODE_DPMS_ON;
> +			drm_panel_enable(dp->plat_data->panel);
>  			return;
>  		}
>  		dev_err(dp->dev, "failed to set bridge, retry: %d\n",
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
