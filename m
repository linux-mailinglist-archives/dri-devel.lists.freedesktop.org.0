Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D35BCB17D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 00:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C44CF10E250;
	Thu,  9 Oct 2025 22:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MOz0kaNI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE74010E250
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 22:30:17 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EdecO005579
 for <dri-devel@lists.freedesktop.org>; Thu, 9 Oct 2025 22:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=7u9Umol56pcPf/8TeFs1AIjO
 6NYonp9MTQXBusmiU+Q=; b=MOz0kaNI3z1KFLWKgm67QvZsO4sKsIlmf3KfrSp8
 x871heTRYJHsSvvYs7zGLng62g2qwVsoLrOrPI/2rc8wC5st46CBRuKREuimw5Vt
 P1KBQZscb6ADHPZ4WDWSwG7E7Y/f6pCBi2hgIWAj3aTmav3nV5jicx/C1rC4knro
 CBsSwuMT1Ev7PilVMh6uY0c2SiQjPVjOhasPsih6JznSzDn/2rfbeR+SuqAAh+uN
 7aEyJby90yISJd3FUYWHZuesr0A9Wu4GL4PWfDQ16CWYce1edLgM1dAY2NlwhcVD
 ZRKfSKmGh9Ct6nAeusAQkEJcrv0JmkDdAHb08IIzOI37Kg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4j4ff4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 22:30:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4dfc05dec2fso83393421cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 15:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760049016; x=1760653816;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7u9Umol56pcPf/8TeFs1AIjO6NYonp9MTQXBusmiU+Q=;
 b=EnJm0SESD5DzmbpsMTRIHwZR8k9S5T9nIpWLYK4QcLgEDoA0bIzFyxmaOrLKP8e8yG
 anIi6f9Xj4h3gf6EUpw8adJbTgZXCZ94U8AJwVGjEiPXPePlTmAFtQfjk3mJFFgksIlx
 Ngq5jV0901Q4eYNCYTDBfziFJYzLKe9T78I84Wd2RgfgxLT/5jB5EMRozrygPVXy89ti
 ZIQX1hkNuCj2I2hqRjCm7Ay3UQt5g9TPAKKMQZwScyNIG8SNIRDvyBUjYKQwGVuZhkq4
 unie7ZeW2M+8qZXg+U40h2mj9wYrIRq7l2Hv7wd6vPilVfjlEDWED7A0dpsLXrxLCbIa
 V3qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRd11T+/zBX3ETti2FJjknKTP+CPX2pWpdY6uzz1bgtZTXfgyK7rMCxFuEBO4kXiYKgRZOZPT6Kyk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhGeFS83caanf2THZZnG8GnJ2q/aY5V0z7b+SVuYH5kqiOsDVz
 MYIdR5iBjIYHZ2G1HqiaWer15VshuJUviadC5BVZTYaVyfOJcmmn8q7ehbbRarSFd2wMjI+AmC6
 l3ZxkwDUvO++nRykE3EjFQWWWEL5VX7OyBiy/+bSMzfs1rlujo/V/X21AAoQ23svtXN8aNvQ=
X-Gm-Gg: ASbGnctKbcCEYfADqTVgNdPby3mmJss/ID9H69U17GtLUwOGIa5WBad5wEAdM1/INFM
 saFatYPlcpovqIefrMi7yX7sUpn43SUFTs+iHNlE0ugIW82UFyxstSgMoKFrqbaT/WCDFIj+Bvs
 D7L1hR5Fe8HsMWbNxyKd2tTTWBUNhVfG5+p083IT5bY1goWaA5KeHUzWKUSJWMbxVI26Sglo7//
 9Fohim/i6IsuMaw7BNRDBRDTVt9hGYzblIg/faRgACAbhQ6cYGKp+uyNwt5P2O33/Yau4x7/5h8
 EPhr04ZGgsJ4cLz6dr1bUjkmEFTl5XF+CI3IHQDBThYcF1+LoiWeORjHxZ8hF48M4gG5lIngCqa
 bB2sc8FxI9mAaUY7WV83Av3gv59vanNJ0ndNmi+wcjpKLe3XZWCvpsG/ACQ==
X-Received: by 2002:a05:622a:254:b0:4d5:229c:9d1f with SMTP id
 d75a77b69052e-4e6eaceb25fmr123334811cf.32.1760049015806; 
 Thu, 09 Oct 2025 15:30:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF77+YGORmN/1V00YnubDd/uwhGM0Ew5duFJ5RpvkZg8bhb7cpDezBj+R100Q6pO/HZIsgBYg==
X-Received: by 2002:a05:622a:254:b0:4d5:229c:9d1f with SMTP id
 d75a77b69052e-4e6eaceb25fmr123334311cf.32.1760049015316; 
 Thu, 09 Oct 2025 15:30:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59088579e01sm238719e87.114.2025.10.09.15.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 15:30:13 -0700 (PDT)
Date: Fri, 10 Oct 2025 01:30:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: damon.ding@rock-chips.com, m.szyprowski@samsung.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] drm/bridge: analogix_dp: Fix connector status detection
 for bridges
Message-ID: <v6aqic6kffc3x42dkb4bika5tvoqdpmmloroqio2656g74pkws@7fe3bsfzbasn>
References: <20251009193028.4952-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009193028.4952-1-heiko@sntech.de>
X-Proofpoint-GUID: e2MljeWbCl8rV2QvCoirL4r1bhqbYHf0
X-Proofpoint-ORIG-GUID: e2MljeWbCl8rV2QvCoirL4r1bhqbYHf0
X-Authority-Analysis: v=2.4 cv=f91FxeyM c=1 sm=1 tr=0 ts=68e83779 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=Zt2WjO-vMssICJJY_9YA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX+RrlEy3gBDRf
 bPmKCYiqxSuRKHZ3jEaFqvHspmf3tUtHbsVyU4v4aHQYmiTogBJGPKgUvjX5hnWaGzhe6ZoRhCS
 kxuTDQhvlmArMPe9xyDb6tvw+J0nVwel/TGtxVGe60cB3VBMUCE0CDZmxUuNGyAEjyOABU/o4k8
 Gzm8ZzdxkSPw53j81vFl06VoA1ss/ExUGRnubRpVc8DnHrZ4Ta4MDftUlT58eW4TUx0h+1NS7vp
 vaYTAIAQtb2zm50JQp59KqARaE9qqSkGUF3x+KGE9XofqFnhbNmQ8GKxIg0ptn674UUlk4yi0dm
 6jihgjCTo/4Smfis+tAg/xiJ62A2tA7qDJvrNwkJJklSeggzT1YXDZSsblWbz6OO9asTedSgVet
 lZbHZUvMO+U9q9F1pDp5YJgnw6cTsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_08,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
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

On Thu, Oct 09, 2025 at 09:30:28PM +0200, Heiko Stuebner wrote:
> Right now if there is a next bridge attached to the analogix-dp controller
> the driver always assumes this bridge is connected to something, but this
> is of course not always true, as that bridge could also be a hotpluggable
> dp port for example.
> 
> On the other hand, as stated in commit cb640b2ca546 ("drm/bridge: display-
> connector: don't set OP_DETECT for DisplayPorts"), "Detecting the monitor
> for DisplayPort targets is more complicated than just reading the HPD pin
> level" and we should be "letting the actual DP driver perform detection."
> 
> So use drm_bridge_detect() to detect the next bridge's state but ignore
> that bridge if the analogix-dp is handling the hpd-gpio.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> As this patch stands, it would go on top of v6 of Damon's bridge-connector
> work, but could very well be also integrated into one of the changes there.
> 
> I don't know yet if my ordering and/or reasoning is the correct one or if
> a better handling could be done, but with that change I do get a nice
> hotplug behaviour on my rk3588-tiger-dp-carrier board, where the
> Analogix-DP ends in a full size DP port.
> 
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index c04b5829712b..cdc56e83b576 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -983,8 +983,12 @@ analogix_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *conne
>  	struct analogix_dp_device *dp = to_dp(bridge);
>  	enum drm_connector_status status = connector_status_disconnected;
>  
> -	if (dp->plat_data->next_bridge)
> -		return connector_status_connected;
> +	/*
> +	 * An optional next bridge should be in charge of detection the
> +	 * connection status, except if we manage a actual hpd gpio.
> +	 */
> +	if (dp->plat_data->next_bridge && !dp->hpd_gpiod)
> +		return drm_bridge_detect(dp->plat_data->next_bridge, connector);

And it's also not correct because the next bridge might be a retimer
with the bridge next to it being a one with the actual detection
capabilities. drm_bridge_connector solves that in a much better way. See
the series at [1]

[1] https://lore.kernel.org/dri-devel/41c2a141-a72e-4780-ab32-f22f3a2e0179@samsung.com/

>  
>  	if (!analogix_dp_detect_hpd(dp))
>  		status = connector_status_connected;
> -- 
> 2.47.2
> 

-- 
With best wishes
Dmitry
