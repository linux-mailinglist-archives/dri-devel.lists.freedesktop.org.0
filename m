Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6BEB0AF67
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 12:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1936310E04D;
	Sat, 19 Jul 2025 10:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SdRgksaU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE3B10E04D
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 10:53:53 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J4F3Dp016537
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 10:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=aqHtp61gi/MVVqpPkBkPz7nq
 zj2NZMIcHn+kla2ZN4c=; b=SdRgksaU3n0/sMpQ8XUiiDYGoQ70xrm0QbQr8PDg
 S0+acoJzMc8l4SYRgpySDuIJSlEcsc2Hwby8/Wt/hNGd90zWTuI0BQ+7oE+t49ht
 9apLGxz83+0t7M2CAMACWcMiYuCppt0E9xdoBFGUlExRGIjTvBP6mXG2regVuHzR
 qZu6bD8W4MID62X2DgD9kIkEIDjO6koIqjP7ry4/5SGzaLyayxxeNQXfaREoEUVQ
 hPUFsnGMEKXZHeHrcXFxqM41p+xgeQISAbSFix/xXhW1WDcGLBO/73pKi172Zfk+
 NMogtuaHI361nKygSHQn/MvffjIaC+BaWrXm4J6RaFdMaA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045h8h50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 10:53:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5cd0f8961so535721385a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 03:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752922432; x=1753527232;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aqHtp61gi/MVVqpPkBkPz7nqzj2NZMIcHn+kla2ZN4c=;
 b=FoUvXw3ncY0+kQBruBtCsAjww0IrTMTYl0V7ECZqffX4//aeUDRdJi5TZFKN1laWk0
 +G5DPJsfeZFyzD9Xzwle4OAKMF4UNkLz6rTM+SMJH3dniwo/ypCoeNRKrY+6/m9FPeO6
 ZJ7rYmEyS4mhKzJx1Li4vN/b7t2u2Sm6rjYB8Ovwgyk7EPX8gPYJVc+aCK+VHdDPwcUo
 oetLnaXLMzd4V9x1CNx04Q/NM18MQebguNBgHG9rmC8xz2KExPP2sxH+ON9WTJFbaZ57
 LnpgtQzUC5sSi/1UNFemQwktlMZtVyFEg2D9q/4uK//K20o9E6lJezAvYvfvPryy5Zst
 LIlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZynZDOtWSLKpNED6H+89X8kFbx0e3Rdavw3NIoTZC5cYDTOVdgxKM6Jxy2jpIrfiMJlQln2jiSyI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyiw8W1KeUGgvlRYKzmRvDo2VzrmRoZlYk0/0R45v0JiUsnDRM5
 Z/lnfUZBWuJqHPQuw/6GWTms4h9W52DEArtZ2u+zrQlqWokfhpmBMCEIPnKCta9SPcfFJiwXw+5
 s5Arqt8lpduFj+D1hyF9Dm+8Qwy2GekE9Y+wpNf3plrh0j7IsR5yl9RenI/nsCFUaLZaUhZg=
X-Gm-Gg: ASbGncvsVvC9v1aasNa6wKo/PHGixRSNgBVkyk2kJF3SJdQqrn+GHwLVsenIgqBB1tQ
 NM3e5UPu7DP/yQb7sYQwQ20r9sqp3E2xxu2hTE7D1H1PgqREBdSycxmiHLUm/04n2QNQAvUaOuW
 cN3Pvgo6zNwf/JwDgOixQxtspkbyn/HnDzobXIMMXkaKQNjoQ75OtysDFLG3q3ghKb0NGEV+CM/
 6Up4qFSeJvKCkqnQkj07mdhfBGT8QF59RP2sp8bvj0OzAA8dHqXoKBWxFp6sJktk7dq+mEiQBrS
 cFS8dBwPG6tMjxjCRNyqIhjFcNyXJYLcxhLNkxA0ifRJ3LGI+H4FCvLBk2Qg1hS6yFQUyZUwAsi
 wiMCe1B+i62SaSoMYyb6+WAsDUavkoAve25ss9Qpd8nCnYgLyfTmU
X-Received: by 2002:a05:620a:440a:b0:7d4:49fa:3c59 with SMTP id
 af79cd13be357-7e34356c61bmr2239107885a.15.1752922432069; 
 Sat, 19 Jul 2025 03:53:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPrmyV8egRcX0tplCS17IxY7fqr0+H6cJp69VeGuqF/GMP4bJno9IhBcl041AaSBLD5rosBg==
X-Received: by 2002:a05:620a:440a:b0:7d4:49fa:3c59 with SMTP id
 af79cd13be357-7e34356c61bmr2239105885a.15.1752922431592; 
 Sat, 19 Jul 2025 03:53:51 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31a9b1b1sm677727e87.35.2025.07.19.03.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 03:53:50 -0700 (PDT)
Date: Sat, 19 Jul 2025 13:53:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 3/5] drm/rockchip: cdn-dp: Support handle lane info
 and HPD without extcon
Message-ID: <t3th2tqbnkmsqssypxvye6vsfhpw37sf7wyl53cso3r5pqa7qp@gn74pj75j4pb>
References: <20250718062619.99-1-kernel@airkyi.com>
 <20250718062619.99-4-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718062619.99-4-kernel@airkyi.com>
X-Authority-Analysis: v=2.4 cv=ZtDtK87G c=1 sm=1 tr=0 ts=687b7940 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=ady2-bcLGFUvj2b528oA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDEwOCBTYWx0ZWRfX8eWOsWNygizg
 Ct/SgCErDA+wFItSNCwnWr1ihKsTkmmih8pVRBlwHiMcTMDkqMHV5gZvdh6/PIqZhfM8qWW82Q3
 vxCrRnFVxJc0uqO8s7kVU1zHny7+a/daGediF0hOyqSM5LsP/1Vaxl0hzezPt8BJiNcbBTFFiFn
 K/EE08wfZkbNCdyJHjIO530Lh7k+RAbjfFk1U7FhK4DTQAc9EX8P73tIzELP2Dx2doHJ/pRyWm5
 JeP5y8GfZf16bHOwFQr359h2Ba2GTFsaJap+rcNAWDa5hAJ14RnCtmSCf25LSlI6ff0lgztP/Qd
 bNNAxwQ4FQ41waHqQRr8G4UH2uBmOwJC6nC6HZy6HQs/Zs6IFsoVOYT+Uv+FbZjdHkAT+jsVwsj
 sjmLCKlafQWkgQw8pLBGUZ+mm+f4xx5hW7H9pUjkXIPABh44M5Lhk2XaqZ1F6yAEtdL8l8zX
X-Proofpoint-GUID: 7CC7LKhe6kfQrQMAfsjHSGPFIkG6puT5
X-Proofpoint-ORIG-GUID: 7CC7LKhe6kfQrQMAfsjHSGPFIkG6puT5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507190108
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

On Fri, Jul 18, 2025 at 02:26:17PM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> This patch add support for get PHY lane info and handle HPD state
> without help of extcon.
> 
> There is no extcon needed if the Type-C controller is present. In this
> case, cdn_dp_hpd_notify() will handle HPD event from USB/DP combo PHY,
> and the lane info can be get from PHY instead of extcon.

The DP AltMode driver will send drm_connector_oob_hotplug_event() to the
DRM connector associated with the USB-C connector fwnode. However your
DP connector will have fwnode set to the DP controller, if I'm not
mistaken. So I doubt that HPD events are going to be delivered
correctly.

> 
> The extcon device should still be supported if Type-C controller is
> not present.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> 
> Changes in v2:
> - Ignore duplicate HPD events.
> 
>  drivers/gpu/drm/rockchip/cdn-dp-core.c | 37 ++++++++++++++++++++------
>  1 file changed, 29 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> index 24f6b3879f4b..b574b059b58d 100644
> --- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
> +++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> @@ -156,6 +156,9 @@ static int cdn_dp_get_port_lanes(struct cdn_dp_port *port)
>  	int dptx;
>  	u8 lanes;
>  
> +	if (!edev)
> +		return phy_get_bus_width(port->phy);
> +
>  	dptx = extcon_get_state(edev, EXTCON_DISP_DP);
>  	if (dptx > 0) {
>  		extcon_get_property(edev, EXTCON_DISP_DP,
> @@ -219,7 +222,7 @@ static bool cdn_dp_check_sink_connection(struct cdn_dp_device *dp)
>  	 * some docks need more time to power up.
>  	 */
>  	while (time_before(jiffies, timeout)) {
> -		if (!extcon_get_state(port->extcon, EXTCON_DISP_DP))
> +		if (port->extcon && !extcon_get_state(port->extcon, EXTCON_DISP_DP))
>  			return false;
>  
>  		if (!cdn_dp_get_sink_count(dp, &sink_count))
> @@ -385,11 +388,14 @@ static int cdn_dp_enable_phy(struct cdn_dp_device *dp, struct cdn_dp_port *port)
>  		goto err_power_on;
>  	}
>  
> -	ret = extcon_get_property(port->extcon, EXTCON_DISP_DP,
> -				  EXTCON_PROP_USB_TYPEC_POLARITY, &property);
> -	if (ret) {
> -		DRM_DEV_ERROR(dp->dev, "get property failed\n");
> -		goto err_power_on;
> +	property.intval = 0;
> +	if (port->extcon) {
> +		ret = extcon_get_property(port->extcon, EXTCON_DISP_DP,
> +					  EXTCON_PROP_USB_TYPEC_POLARITY, &property);
> +		if (ret) {
> +			DRM_DEV_ERROR(dp->dev, "get property failed\n");
> +			goto err_power_on;
> +		}
>  	}
>  
>  	port->lanes = cdn_dp_get_port_lanes(port);
> @@ -821,6 +827,17 @@ static int cdn_dp_audio_mute_stream(struct drm_connector *connector,
>  	return ret;
>  }
>  
> +static void cdn_dp_hpd_notify(struct drm_bridge *bridge,
> +			      enum drm_connector_status status)
> +{
> +	struct cdn_dp_device *dp = bridge_to_dp(bridge);
> +	enum drm_connector_status last_status =
> +		dp->connected ? connector_status_connected : connector_status_disconnected;
> +
> +	if (last_status != status)
> +		schedule_work(&dp->event_work);
> +}
> +
>  static const struct drm_bridge_funcs cdn_dp_bridge_funcs = {
>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> @@ -831,6 +848,7 @@ static const struct drm_bridge_funcs cdn_dp_bridge_funcs = {
>  	.atomic_disable = cdn_dp_bridge_atomic_disable,
>  	.mode_valid = cdn_dp_bridge_mode_valid,
>  	.mode_set = cdn_dp_bridge_mode_set,
> +	.hpd_notify = cdn_dp_hpd_notify,
>  
>  	.dp_audio_prepare = cdn_dp_audio_prepare,
>  	.dp_audio_mute_stream = cdn_dp_audio_mute_stream,
> @@ -1028,6 +1046,9 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
>  	for (i = 0; i < dp->ports; i++) {
>  		port = dp->port[i];
>  
> +		if (!port->extcon)
> +			continue;
> +
>  		port->event_nb.notifier_call = cdn_dp_pd_event;
>  		ret = devm_extcon_register_notifier(dp->dev, port->extcon,
>  						    EXTCON_DISP_DP,
> @@ -1120,14 +1141,14 @@ static int cdn_dp_probe(struct platform_device *pdev)
>  		    PTR_ERR(phy) == -EPROBE_DEFER)
>  			return -EPROBE_DEFER;
>  
> -		if (IS_ERR(extcon) || IS_ERR(phy))
> +		if (IS_ERR(phy) || PTR_ERR(extcon) != -ENODEV)
>  			continue;
>  
>  		port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
>  		if (!port)
>  			return -ENOMEM;
>  
> -		port->extcon = extcon;
> +		port->extcon = IS_ERR(extcon) ? NULL : extcon;
>  		port->phy = phy;
>  		port->dp = dp;
>  		port->id = i;
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
