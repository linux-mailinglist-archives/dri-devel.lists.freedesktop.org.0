Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E7CAC5B58
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 22:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F325210E526;
	Tue, 27 May 2025 20:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d8Bm5WMw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA3E10E537
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 20:26:17 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RHU2en030806
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 20:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=4xUN0y9tD66f1svU9Zz7etOE
 XfYYso6YFCLNHspL5Wo=; b=d8Bm5WMwIc5IosRakZB5otsePFFFIlm+u5xuGdyk
 G4HiSOd8wHfHCOMkjdid0I2CH4tvihInQvTbhBI2IL+jgR7ArXeu53hu1iGLfh5c
 QKe5P+yARJbg4/ydA3hsWEAtzUTCvR+DCrbl1a2rVZ0IqdbNfuFT8vjc1XNgGeIB
 lZN6d6tJhn2XsOU3hDes8Fk47oN6Q+KOUj7NcsJU00+GKSe/Rjt8hdvdTOvkatxH
 1VqUlTK7UGLLGPQKb/wA9h46qckyW15Ms13fu8/G3YZk0ZAOPyZhTioDQi4DNbN4
 vS8nGh8RdsEaQd+J7r5F4qCB/EZcAWl4ohP2WeLLpbu9Mw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whuf0g5t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 20:26:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6fab07aa5e1so41074076d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 13:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748377573; x=1748982373;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4xUN0y9tD66f1svU9Zz7etOEXfYYso6YFCLNHspL5Wo=;
 b=sF+LyK7aD+hS1Sln5kvp02k6IpvlsBugWEAOBns+GBAM6eJ6VridPiGrEqvolfm6yW
 M//s9VznUakl5DmRE3zzgyJ8mju/Q60K8eDWc8ro5q+czw9TNgo/RHQ9+RkQcKdCJ0Cg
 Pu/MTUYY6dSkFS6+RkTxgOZ6sRzGM8o1DHiygSYAu+sw1Sqab5Eob8GMxMUsh6SkWONK
 OVRxQxfIj9gw5d1pN8PyKtkLksVrV2WZVwix090BpXKS4G0X7matyafn3alNf7nnyV8/
 1Gx0WBUiHTPZOzClx4e+x6beyFczG4tQuzoYb26qnzy3cz967rc8Cajjlj/qfLfTXYQW
 qoAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1dvUNxGa/XXBDCgaoZq8vpSSEGp+L+df2yPj1yWpOsX2d5d328H2pAaigPdQiHUYoaY1molyc42w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHPpNGA1gVETG0T21EAQ7BvnBGw9eYayqCk3uO4xXc1bLT4ZFq
 IEMldC+m/GNm5QMgCoDAS7UuhkxhD9r+TchtDWN4JYwkJrf/WAtXGB7AO0O+iEQ3dcEcdxS26HT
 aN1+G8My7rN+qwkyLPisfLI3rXRu4QFwrp2fa+GpPmKoMXBW11n26niXaKl2pYV9pO0SksgD7Mh
 016CU=
X-Gm-Gg: ASbGncvJIO8hUFUbjh/6ZYxk1MJmJIyXMg7O+HSTy/yfzJV3KWAbDL0IAgth2/D7JPH
 66oOwqdMz6DgOUE6jDoB9Ft/iMnjIPkiNFvtDyrPg2y4pruhorqEGWmSTKFu9tHIfHB4oOTkgsG
 kxWgtTzfDMCpC7/Gv+tZhwmAysSf2eRVObAawzxYr32wJYLs3HV/QUZc/9uLdelJydaSy9kmA8D
 GlZn3tsrIxZj18irdi8wwj4P57zFpshwfJaEbwISfLrK1rmBKl16ScDzT6MBTduYN4xPLDmq/C5
 DiEiJeCUAVxrlcmnzgsv/d7d6xztFQ83oYIzIJHQmgIJi/wESBUMj+gGNEwq4XlSzCkREOHvj/U
 =
X-Received: by 2002:ad4:5b81:0:b0:6f2:c81f:9ef0 with SMTP id
 6a1803df08f44-6fa9d3229a8mr267504416d6.28.1748377572801; 
 Tue, 27 May 2025 13:26:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIMvKx83CAGoAKuZ6b+GRDnxaFhcYLgNEmLiEF7jLpdTEpjQ2RM1yZ/MdwH+P9+KF0Ikr5Yw==
X-Received: by 2002:ad4:5b81:0:b0:6f2:c81f:9ef0 with SMTP id
 6a1803df08f44-6fa9d3229a8mr267503896d6.28.1748377572385; 
 Tue, 27 May 2025 13:26:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5532ee72cddsm13110e87.215.2025.05.27.13.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 13:26:00 -0700 (PDT)
Date: Tue, 27 May 2025 23:25:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH v3] drm/rockchip: cdn-dp: Convert to drm bridge
Message-ID: <e2dnvpbze4xuubggduqr3p5nnhg7huk3dnpdcb6tldxbrn2qtn@bfsewz5trfv3>
References: <20250527081447.304-1-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527081447.304-1-kernel@airkyi.com>
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=68361fe6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=ePr-TV-LAAAA:8 a=s8YR1HE3AAAA:8
 a=_UkGs5bstnNi4Q_uqmUA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=uGDpjx9DKq9E8W49yboe:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: 9D7H-a5JsQGS_O2E_toLR3vysQHCCSxq
X-Proofpoint-GUID: 9D7H-a5JsQGS_O2E_toLR3vysQHCCSxq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3MiBTYWx0ZWRfX4UiMyenMB1Hh
 RDT8UuZ7l4ilTk7C+847H2dlNnzI64J/5C6v7LL1gnH0HA7xs4EzeJwZI1LbXFECzjwZAAFIGgV
 PaLN8JOv/53MwfcIGvV+47+aSjT+vXZXutXaQb5XlkD/SlOuQs7oYnzsVmX2REYPjZBN91OBhAf
 eEzQ5lSOTNBH1nOY8oGn9gkZdJzQazWlPBDaVTftfAM+2uMtz4knMgGLbZYxvENDr7EkJpmcJS/
 tbhx/k+C7Q40iGTKj18ZJusOtpOHma8Nv+PSjWesm4z+pd6uV3UnzJrVKEgC38uuwTQZjKuSv7j
 blkl+y8GTG9GTEfuFXXOmW4GdyvdjadxgWgTUmWYPIT/p+IzpHxbiaXJEKf+0DQgPtPWdrcgEWT
 R2kbKTon9qqNJA+VugayMWzr373f+uVoEjqiH9VpSext+ty6gImr9u1qVYEZJC+40vr6349M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270172
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

On Tue, May 27, 2025 at 04:14:47PM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Convert it to drm bridge driver, it will be convenient for us to
> migrate the connector part to the display driver later.
> Considering that some code depend on the connector, the following
> changes have been made:
> - Only process edid in &drm_bridge_funcs.edid_read(), so no need to
> store additional edid info.
> - Now cdn_dp_get_sink_capability() only focused on reading DPCD_REV.
> - Update bpc info in cdn_dp_bridge_atomic_enable() instead of
> cdn_dp_encoder_mode_set(). Actually, the bpc data will be used in
> cdn_dp_bridge_atomic_enable().
> - Switch to use DRM_BRIDGE_OP_DP_AUDIO helpers.
> 
> This patch also convert to use devm_drm_bridge_alloc() API.
> 
> Tested with RK3399 EVB IND board.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> 
> Changes in v3:
> - Link to V2: https://lore.kernel.org/all/20250523011310.120-1-kernel@airkyi.com/
> - Switch to use DRM_BRIDGE_OP_DP_AUDIO helpers
> - Remove the dependency for connector
> - Remove the extra stored edid
> - Code cleanup
> 
> Changes in v2:
> - Link to V1: https://lore.kernel.org/all/20250507035148.415-1-kernel@airkyi.com/
> - Use drm_atomic_get_new_connector_for_encoder() to get connector
> - Convert to use devm_drm_bridge_alloc() API
> - Fix typo: cdn_dp_connector_edid_read -> cdn_dp_bridge_edid_read
> 
>  drivers/gpu/drm/rockchip/cdn-dp-core.c | 279 ++++++++++---------------
>  drivers/gpu/drm/rockchip/cdn-dp-core.h |   9 +-
>  2 files changed, 110 insertions(+), 178 deletions(-)
> 


> @@ -595,16 +546,41 @@ static bool cdn_dp_check_link_status(struct cdn_dp_device *dp)
>  static void cdn_dp_audio_handle_plugged_change(struct cdn_dp_device *dp,
>  					       bool plugged)
>  {
> -	if (dp->codec_dev)
> -		dp->plugged_cb(dp->codec_dev, plugged);
> +	if (dp->sink_has_audio)
> +		drm_connector_hdmi_audio_plugged_notify(dp->connector, plugged);

I'd say, notify always and let userspace figure it out via the ELD. Then
you shouldn't need sink_has_audio. This would match the behaviour of
HDMI drivers.

>  }
>  

[...]

> @@ -705,8 +681,6 @@ static int cdn_dp_encoder_atomic_check(struct drm_encoder *encoder,
>  
>  static const struct drm_encoder_helper_funcs cdn_dp_encoder_helper_funcs = {
>  	.mode_set = cdn_dp_encoder_mode_set,
> -	.enable = cdn_dp_encoder_enable,
> -	.disable = cdn_dp_encoder_disable,
>  	.atomic_check = cdn_dp_encoder_atomic_check,

Nit: for the future cleanup, it should probably be possible to get rid
of these encoder ops too by moving them to the bridge ops.

>  };
>  

[...]

> @@ -1006,7 +947,8 @@ static void cdn_dp_pd_event_work(struct work_struct *work)
>  
>  out:
>  	mutex_unlock(&dp->lock);
> -	drm_connector_helper_hpd_irq_event(&dp->connector);
> +	if (dp->connector)
> +		drm_connector_helper_hpd_irq_event(dp->connector);

drm_bridge_hpd_notify(). I think then you don't need dp->connector.

>  }
>  
>  static int cdn_dp_pd_event(struct notifier_block *nb,
> @@ -1062,26 +1004,35 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
>  
>  	drm_encoder_helper_add(encoder, &cdn_dp_encoder_helper_funcs);
>  
> -	connector = &dp->connector;
> -	connector->polled = DRM_CONNECTOR_POLL_HPD;
> -	connector->dpms = DRM_MODE_DPMS_OFF;
> -
> -	ret = drm_connector_init(drm_dev, connector,
> -				 &cdn_dp_atomic_connector_funcs,
> -				 DRM_MODE_CONNECTOR_DisplayPort);
> -	if (ret) {
> -		DRM_ERROR("failed to initialize connector with drm\n");
> -		goto err_free_encoder;
> -	}
> +	dp->bridge.ops =
> +			DRM_BRIDGE_OP_DETECT |
> +			DRM_BRIDGE_OP_EDID |
> +			DRM_BRIDGE_OP_HPD |
> +			DRM_BRIDGE_OP_DP_AUDIO;
> +	dp->bridge.of_node = dp->dev->of_node;
> +	dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
> +	dp->bridge.hdmi_audio_dev = dp->dev;
> +	dp->bridge.hdmi_audio_max_i2s_playback_channels = 8;
> +	dp->bridge.hdmi_audio_spdif_playback = 1;
> +	dp->bridge.hdmi_audio_dai_port = -1;
> +
> +	ret = devm_drm_bridge_add(dev, &dp->bridge);
> +	if (ret)
> +		return ret;
>  
> -	drm_connector_helper_add(connector, &cdn_dp_connector_helper_funcs);
> +	ret = drm_bridge_attach(encoder, &dp->bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +	if (ret)
> +		return ret;
>  
> -	ret = drm_connector_attach_encoder(connector, encoder);
> -	if (ret) {
> -		DRM_ERROR("failed to attach connector and encoder\n");
> -		goto err_free_connector;
> +	connector = drm_bridge_connector_init(drm_dev, encoder);
> +	if (IS_ERR(connector)) {
> +		ret = PTR_ERR(connector);
> +		dev_err(dp->dev, "failed to init bridge connector: %d\n", ret);
> +		return ret;
>  	}
>  
> +	drm_connector_attach_encoder(connector, encoder);
> +
>  	for (i = 0; i < dp->ports; i++) {
>  		port = dp->port[i];
>  
> @@ -1101,30 +1052,19 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
>  	schedule_work(&dp->event_work);
>  
>  	return 0;
> -
> -err_free_connector:
> -	drm_connector_cleanup(connector);
> -err_free_encoder:
> -	drm_encoder_cleanup(encoder);
> -	return ret;
>  }
>  
>  static void cdn_dp_unbind(struct device *dev, struct device *master, void *data)
>  {
>  	struct cdn_dp_device *dp = dev_get_drvdata(dev);
>  	struct drm_encoder *encoder = &dp->encoder.encoder;
> -	struct drm_connector *connector = &dp->connector;
>  
>  	cancel_work_sync(&dp->event_work);
> -	cdn_dp_encoder_disable(encoder);
>  	encoder->funcs->destroy(encoder);
> -	connector->funcs->destroy(connector);
>  
>  	pm_runtime_disable(dev);
>  	if (dp->fw_loaded)
>  		release_firmware(dp->fw);
> -	drm_edid_free(dp->drm_edid);
> -	dp->drm_edid = NULL;
>  }
>  
>  static const struct component_ops cdn_dp_component_ops = {
> @@ -1171,9 +1111,10 @@ static int cdn_dp_probe(struct platform_device *pdev)
>  	int ret;
>  	int i;
>  
> -	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
> -	if (!dp)
> -		return -ENOMEM;
> +	dp = devm_drm_bridge_alloc(dev, struct cdn_dp_device, bridge,
> +				   &cdn_dp_bridge_funcs);
> +	if (IS_ERR(dp))
> +		return PTR_ERR(dp);
>  	dp->dev = dev;
>  
>  	match = of_match_node(cdn_dp_dt_ids, pdev->dev.of_node);
> @@ -1209,19 +1150,11 @@ static int cdn_dp_probe(struct platform_device *pdev)
>  	mutex_init(&dp->lock);
>  	dev_set_drvdata(dev, dp);
>  
> -	ret = cdn_dp_audio_codec_init(dp, dev);
> -	if (ret)
> -		return ret;
> -
>  	ret = component_add(dev, &cdn_dp_component_ops);
>  	if (ret)
> -		goto err_audio_deinit;
> +		return ret;
>  
>  	return 0;
> -
> -err_audio_deinit:
> -	platform_device_unregister(dp->audio_pdev);
> -	return ret;
>  }
>  
>  static void cdn_dp_remove(struct platform_device *pdev)
> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.h b/drivers/gpu/drm/rockchip/cdn-dp-core.h
> index 17498f576ce7..6aa3ce489382 100644
> --- a/drivers/gpu/drm/rockchip/cdn-dp-core.h
> +++ b/drivers/gpu/drm/rockchip/cdn-dp-core.h
> @@ -8,6 +8,8 @@
>  #define _CDN_DP_CORE_H
>  
>  #include <drm/display/drm_dp_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>

This include can go to the C file instead of the header.

>  #include <drm/drm_panel.h>
>  #include <drm/drm_probe_helper.h>
>  #include <sound/hdmi-codec.h>
> @@ -65,12 +67,12 @@ struct cdn_dp_port {
>  struct cdn_dp_device {
>  	struct device *dev;
>  	struct drm_device *drm_dev;
> -	struct drm_connector connector;
> +	struct drm_bridge bridge;
> +	struct drm_connector *connector;
>  	struct rockchip_encoder encoder;
>  	struct drm_display_mode mode;
>  	struct platform_device *audio_pdev;
>  	struct work_struct event_work;
> -	const struct drm_edid *drm_edid;
>  
>  	struct mutex lock;
>  	bool connected;
> @@ -102,8 +104,5 @@ struct cdn_dp_device {
>  
>  	u8 dpcd[DP_RECEIVER_CAP_SIZE];
>  	bool sink_has_audio;
> -
> -	hdmi_codec_plugged_cb plugged_cb;
> -	struct device *codec_dev;
>  };
>  #endif  /* _CDN_DP_CORE_H */
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
