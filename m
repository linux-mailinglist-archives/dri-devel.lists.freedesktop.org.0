Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6949FB2932A
	for <lists+dri-devel@lfdr.de>; Sun, 17 Aug 2025 15:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DC010E004;
	Sun, 17 Aug 2025 13:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FE1YXXVW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD2D10E004
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 13:09:52 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57H8Tc2U012747
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 13:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=co9B27B7ZsZRFkH72GN7sMHI
 4zWAQ7z8wMKYKzGl2Gc=; b=FE1YXXVWerLPOx3CjYcx4hkxLDYYu1zhu+a+aqrZ
 ebVt/Rj2lq43Hd7J+nCrBX1kW1AsCZm1X3SQKpgRIXYtCjdALwkc5Ocqzy1ZE0Gs
 ELB1o+bd10JLUz+qY4s0/2Nni0bs+G+4lhDOPyAEQTqGpuuEQts6dvOn2Gvic/Xh
 5ZAyuc/CSvgJzc80ea23DwboLxJ/GQTdz49dTlajugtXOyTQYJXj3w/pbdWedF2l
 ETZ9IQKwDK2wYislWNVzDjK4t83ME1eipfKviJ8K0+HlOpLAMsbb2Arfy1rWH0ow
 3fb4uWC4/RkF2AP0/QU/kEmW07oALuKxVZH7sTgv1Gixog==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jfbnab9g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 13:09:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70a927f4090so78370226d6.1
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 06:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755436190; x=1756040990;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=co9B27B7ZsZRFkH72GN7sMHI4zWAQ7z8wMKYKzGl2Gc=;
 b=UDRZRi0j2Z6KOjjJe7lYGtoCpWNpjZljwdXyz08YyXufwQUZc4saRP5Yyfor+2mhYM
 c3bAsd24tIBEB/l3RgL73YY3m6d/WjwiCuqXF4ewmYK1D/DB/PvSj7ZJndDsQkw+3w3Z
 2H/ZSfTS3SfdfkyMpkjtesyk9zHPogrep0EgjBQmpkHjMsPQCMLpyxdVzQGdeN926N6s
 LBvaaVumgZIQBPZodcrXz23IA1RU03tieQ5QO/iTCbVWVr9FJJz4PdDDB0UcHhzNu4Hn
 ADXd8nF8ghXxV6CYsYPrPFzD/jLu/wW+9XOHfofP2elzVrAnqN1jNXw72UtQ1tTWbVwa
 KVKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/LntdSRZng645S0eR0jWBANS1uMXCbjXBN1kv1Pf+7IKPunT6K8LOtHKvK7E0TsC9PgDDqGZNxXg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBNuPhnx1ofW3lB1C9TGiIsPk2qd172H+3l3b/Bfmy8a+8NQ/G
 iIHozh2AsOKOoosznr2AVA/WEYFsxjvXOdJeTLPKmUwQT18sTfmNyVxAwpBF+rGaD09X96xvz5b
 PcS7PhEI0KQk2rNgmAxA03+dqdTfjtUNTx0gaQxEmxQaaZuE+WhyhU/+Q+kZMVt4aHVJKNvs=
X-Gm-Gg: ASbGncvu2adlWTmodJ0DvYI5PvQZoA5Nye9bXeYrSD7NdRmRkGjq859w/zyEg3FkrD0
 XJamR3ZeaRAe5mADXZNUXv/XWFdV2lZeNscQXXsE/Oqfcie6vICmW8zJgYj/6qP/EwDWRWgMdG3
 hTKdVDqDiuZbUGUgBJKuNIfaRFf+qAtwZklCzMfkRBFXRJn0L3HfJ3CK6gzmgR7CChCcDO13hzY
 m6lLoS4ebFZ/vq0DB9lHiqt5WUYH0Xmb5jpjtC5e1bd5g/EsgPYEyaRyNfq67SXdZSZZ4yI61QD
 43gBWlHzG/jTeynTTM6ereb+fxUoI4M21bv5dAsujhekgbArgtb0IXTq3RtgQ6DDo/4ZrV5TPud
 JQFYVIOFKllIEMk0BCYQplivFs6IX/v9feh+k70kh1pBvikA7PR6T
X-Received: by 2002:a05:6214:212a:b0:707:5bc5:861a with SMTP id
 6a1803df08f44-70ba7b02e5bmr104250146d6.17.1755436190103; 
 Sun, 17 Aug 2025 06:09:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkod3PWxzu1IK2BFQPLYIHpp5/LqJmQwMh1nn/4MHAnDiw6C0KSPesILsHw3QM5iyAqWik5g==
X-Received: by 2002:a05:6214:212a:b0:707:5bc5:861a with SMTP id
 6a1803df08f44-70ba7b02e5bmr104249776d6.17.1755436189600; 
 Sun, 17 Aug 2025 06:09:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cf4d0d181sm671980e87.57.2025.08.17.06.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Aug 2025 06:09:48 -0700 (PDT)
Date: Sun, 17 Aug 2025 16:09:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, fengsheng5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 drm-dp 08/11] drm/hisilicon/hibmc: fix no showing when
 no connectors connected
Message-ID: <slyapb5axqt5kw2l3da6k2iwkrqllame5bqz6hzjsqgi5j6lnh@obhd3xluk4te>
References: <20250813094238.3722345-1-shiyongbang@huawei.com>
 <20250813094238.3722345-9-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813094238.3722345-9-shiyongbang@huawei.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAwMSBTYWx0ZWRfXzVlpYqORFEig
 /+U6zvY2PDdOT5zT1bwWLHYSJS8QUatVXKKQaaIRtGFwsdygEQ5pNIX034aPu1ZhDlVppjXqQxq
 myefnTtLk2lNws2cCZEtj2PD3QA7TZrs2Th7So42rUNEkYMX1iKWhAs1vl/PdwLwrl+AiKg5znl
 QGRX73DKmFHmeYLcFSd4HzGtzuxIRsYS+gspTjE/jNkG5dvXzHTh95Y1f3uqAFC15mPeG3Vq6zB
 Tfksan0tgKvlBjlPtBsvmLPS/2qpY9+m+Q7dLAE9k5gZo9nAfIrILqlIlKmvQfc0Xx/7+TOzFJ4
 VzGtQIIWTOZRXDMqUaeC2cHxfWCJ8+dkLGK1pfpD4cJyXYRFkF1x6M9dWG/mNhfLmPD9N/s6pg1
 YH65upFw
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=68a1d49f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=i0EeH86SAAAA:8 a=6UUJN5BFAQ85vPkPCEwA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: zWy0L6o74KDZoPbJ4lGF-rwo3n-cpMTZ
X-Proofpoint-ORIG-GUID: zWy0L6o74KDZoPbJ4lGF-rwo3n-cpMTZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-17_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160001
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

On Wed, Aug 13, 2025 at 05:42:35PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Our chip support KVM over IP feature, so hibmc driver need to support
> displaying without any connectors plugged in. If no connectors connected,
> set the vdac connector status to 'connected' to handle BMC KVM. Use
> is_connected to check all physical outputs.
> For get_modes: using BMC modes for connector if no display is attached to
> phys VGA cable, otherwise use EDID modes by drm_connector_helper_get_modes,
> because KVM doesn't provide EDID reads.
> 
> Fixes: 4c962bc929f1 ("drm/hisilicon/hibmc: Add vga connector detect functions")

It feels like being too big for a fix...

> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v3 -> v4:
>   - add KVM edid in commit message, suggested by Dmitry Baryshkov.
>   - fix magic values, suggested by Dmitry Baryshkov.
> v2 -> v3:
>   - fix hibmc_connector_get_modes() and hibmc_vdac_detect() to realize BMC KVM, suggested by Dmitry Baryshkov.
> ---
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 20 ++++--
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  2 +
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  7 +++
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c  | 62 +++++++++++++------
>  4 files changed, 68 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> index 5cac04b7d4a4..9626c60a9115 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> @@ -35,12 +35,22 @@ static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
>  static int hibmc_dp_detect(struct drm_connector *connector,
>  			   struct drm_modeset_acquire_ctx *ctx, bool force)
>  {
> -	struct hibmc_dp *dp = to_hibmc_dp(connector);
> +	struct hibmc_drm_private *priv = to_hibmc_drm_private(connector->dev);
> +	int ret;
> +
> +	mutex_lock(&priv->connect_lock);
> +
> +	if (priv->dp.hpd_status) {
> +		priv->connect_status_map |= HIBMC_DP_STATUS;
> +		ret = connector_status_connected;
> +	} else {
> +		priv->connect_status_map &= ~HIBMC_DP_STATUS;
> +		ret = connector_status_disconnected;
> +	}
>  
> -	if (dp->hpd_status)
> -		return connector_status_connected;
> -	else
> -		return connector_status_disconnected;
> +	mutex_unlock(&priv->connect_lock);
> +
> +	return ret;
>  }
>  
>  static int hibmc_dp_mode_valid(struct drm_connector *connector,
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index 289304500ab0..bdf14ad52cd3 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -162,6 +162,8 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
>  	drm_for_each_encoder(encoder, dev)
>  		encoder->possible_clones = clone_mask;
>  
> +	mutex_init(&priv->connect_lock);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> index ca8502e2760c..4eee33fbc1f4 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> @@ -24,6 +24,8 @@
>  
>  #define HIBMC_MIN_VECTORS	1
>  #define HIBMC_MAX_VECTORS	2
> +#define HIBMC_DP_STATUS		BIT(0)
> +#define HIBMC_VGA_STATUS	BIT(1)
>  
>  struct hibmc_vdac {
>  	struct drm_device *dev;
> @@ -31,6 +33,7 @@ struct hibmc_vdac {
>  	struct drm_connector connector;
>  	struct i2c_adapter adapter;
>  	struct i2c_algo_bit_data bit_data;
> +	int phys_status;
>  };
>  
>  struct hibmc_drm_private {
> @@ -43,6 +46,10 @@ struct hibmc_drm_private {
>  	struct drm_crtc crtc;
>  	struct hibmc_vdac vdac;
>  	struct hibmc_dp dp;
> +
> +	/* VGA and DP phys connect status, BIT(0) is DP, BIT(1) is VGA */
> +	u32 connect_status_map;
> +	struct mutex connect_lock; /* protect connect_status_map value */
>  };
>  
>  static inline struct hibmc_vdac *to_hibmc_vdac(struct drm_connector *connector)
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> index 841e81f47b68..922c0810723d 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> @@ -25,27 +25,18 @@
>  static int hibmc_connector_get_modes(struct drm_connector *connector)
>  {
>  	struct hibmc_vdac *vdac = to_hibmc_vdac(connector);
> -	const struct drm_edid *drm_edid;
>  	int count;
>  
> -	drm_edid = drm_edid_read_ddc(connector, &vdac->adapter);
> -
> -	drm_edid_connector_update(connector, drm_edid);
> -
> -	if (drm_edid) {
> -		count = drm_edid_connector_add_modes(connector);
> -		if (count)

Here you are refactoring to use drm_edid_connector_add_modes() and
fixing the connector issue. Please don't mix those together.

> -			goto out;
> +	if (vdac->phys_status == connector_status_connected) {
> +		count = drm_connector_helper_get_modes(connector);
> +	} else {
> +		drm_edid_connector_update(connector, NULL);
> +		count = drm_add_modes_noedid(connector,
> +					     connector->dev->mode_config.max_width,
> +					     connector->dev->mode_config.max_height);
> +		drm_set_preferred_mode(connector, 1024, 768);
>  	}
>  
> -	count = drm_add_modes_noedid(connector,
> -				     connector->dev->mode_config.max_width,
> -				     connector->dev->mode_config.max_height);
> -	drm_set_preferred_mode(connector, 1024, 768);
> -
> -out:
> -	drm_edid_free(drm_edid);
> -
>  	return count;
>  }
>  
> @@ -57,10 +48,45 @@ static void hibmc_connector_destroy(struct drm_connector *connector)
>  	drm_connector_cleanup(connector);
>  }
>  
> +static int hibmc_vdac_detect(struct drm_connector *connector,
> +			     struct drm_modeset_acquire_ctx *ctx,
> +			     bool force)
> +{
> +	struct hibmc_drm_private *priv = to_hibmc_drm_private(connector->dev);
> +	struct hibmc_vdac *vdac = to_hibmc_vdac(connector);
> +	int ret = connector_status_disconnected;
> +	int status;
> +
> +	status = drm_connector_helper_detect_from_ddc(connector, ctx, force);
> +
> +	vdac->phys_status = status;
> +
> +	mutex_lock(&priv->connect_lock);
> +
> +	if (status == connector_status_connected) {
> +		priv->connect_status_map |= HIBMC_VGA_STATUS;
> +		ret = connector_status_connected;
> +		goto exit;
> +	}
> +
> +	priv->connect_status_map &= ~HIBMC_VGA_STATUS;
> +
> +	/* if all connectors are disconnected,
> +	 * return connected to support BMC KVM display.
> +	 */
> +	if (!priv->connect_status_map)
> +		ret = connector_status_connected;
> +
> +exit:
> +	mutex_unlock(&priv->connect_lock);
> +
> +	return ret;
> +}
> +
>  static const struct drm_connector_helper_funcs
>  	hibmc_connector_helper_funcs = {
>  	.get_modes = hibmc_connector_get_modes,
> -	.detect_ctx = drm_connector_helper_detect_from_ddc,
> +	.detect_ctx = hibmc_vdac_detect,
>  };
>  
>  static const struct drm_connector_funcs hibmc_connector_funcs = {
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
