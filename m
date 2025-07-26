Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27529B12B4E
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 18:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1BB10E28B;
	Sat, 26 Jul 2025 16:03:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F+LExV5j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B31410E286
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 16:03:30 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56QEgqdL007207
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 16:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=F8YYMH9gFarS0Tc24iZ48d4j
 M4eJuDvGBE7Mq7h0k3E=; b=F+LExV5jic8uYinXfX7flw4Vd6D7ptJFKponMqZ0
 Ctya1PsH2QyVo/e7+IcYo5w9YLrz1FPv2HW74nURJhm3xHT05dSnsyqA2fENzSYt
 IirH+EQReM90OfNBtAGoUqNJSKtfam1I0jQlOOkVwIYO3dzQLvInw/Y4MopCN354
 GBVH5zAUN9JjWVSDuXKdS3ggN8EuXtHtdr6vPvtd48E/Oh3eYdBXIB+oVQcjjCLT
 CG0d6o5AlBz2C/RM2Ely0OAYMXY1nwqSqrUW3psYgmQKIiunnhk8L9r1t4Tx96ww
 MBcvAbhhQGuOa9qTU3lCmI2zWUStXXJ08bb1soO/vA8SwA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbkrvbf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 16:03:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6fad2a25b65so59777036d6.3
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 09:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753545808; x=1754150608;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F8YYMH9gFarS0Tc24iZ48d4jM4eJuDvGBE7Mq7h0k3E=;
 b=TU5SBRr8/AerKi/7BfSdHHKixAtEOwiWShvVBFY1wvUsip2n0lKtJAGsVbcShqQr7C
 QGe7D3Jg1qUXTREDnUvV7ymz3dhHiaDD+7HdDpZbR2VK7U64agDfQdm04VO3BdEqZ9cD
 i+aFsej1YPsz6Bpe97SmUgojPqxJlTB4U0qIMPbIy4pGJ66uaJZoAtdL2ot3b7eUkVn2
 2b9lerPtzNdwhqYG9Eo/JuE03JcEDmdc4HiMuwWtWpe/d/+Coa+xHJoR8unhc0K2Is5Q
 BSns746hytqLc5RAyLxfnqxuThNC62P0cA3a5nuc6MYVch59DDKtjSmjNbxksu+Mrhhu
 BM9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfWgFTl1J0qDIAGHVUF5/zTrX4SGiNxhE755M+ZO4uBvf6yxO8zU1AJU0zqCrMMs4ZepZD3YG/ynM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyElzBRWWFec202JhRKARK3K1dywcDb5yH2k/P2jGwr0OUnrN2q
 hmenCxeI/KryOXCa6AJFp0/KJ94fZAvYgi5t/vJjeRO/xSLdYOKPlRuOoGuu20gWTOyLpPBh8zR
 ktFmVkztsEEEVzqJ8gjdJQgpXsD9X5rAx78SwXxfhs3TYe5uWv8VhiyY97C/xxoRVSbEjJNM=
X-Gm-Gg: ASbGncsTDnaooo9MV3CgTm7Ub9vYzHxXY58C2piiGjJzRxPeb0awRyoog/USaJKDX7z
 tD+06PZ7G1Xe4vAP0f67Wv9bq3hHNCgcOh6qRbPW9WFSybn0BQx1A9qwu6EhYh6as+aEtTaOo2i
 PYLtxqHbJIRo1KZ/BOP7cGhI+w1ga/TusePkKALthywAhv35vgTYzv6Sf+W5ZoEfeL18Qg4E8jJ
 08mhsPhBul7CQ4gY3YXjZ3H1ubdRayBeBNiEsGnD/zIxcAgWWj/QELoLNKfvgLpjpiTgIw3dGu2
 lu//kBzrJtCzL6eyZSRcu0KEwAYpReVLxnPs+gnMhltWqnJSmfhu9a7Jk1ajwe+4/eJK+6Zwmpt
 M1SxmLUIoao1LmonqJH9bOAdeyDDEQl+8S3yFATZABREwRBj1SUpl
X-Received: by 2002:ad4:5dec:0:b0:707:151d:3234 with SMTP id
 6a1803df08f44-707205a9d4cmr62478106d6.30.1753545808045; 
 Sat, 26 Jul 2025 09:03:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhdNdjiKsH+hA/24bP2oys9SXNS9W2drat5pIegemSx766wz2FYOAMVdk+G01+gfGwX7scUA==
X-Received: by 2002:ad4:5dec:0:b0:707:151d:3234 with SMTP id
 6a1803df08f44-707205a9d4cmr62477386d6.30.1753545807317; 
 Sat, 26 Jul 2025 09:03:27 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b6316d936sm502145e87.37.2025.07.26.09.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Jul 2025 09:03:25 -0700 (PDT)
Date: Sat, 26 Jul 2025 19:03:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, fengsheng5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 drm-dp 08/11] drm/hisilicon/hibmc: fix no showing when
 no connectors connected
Message-ID: <tqbbkhod5et6yxyfhzmgelborrhwjaazk6ylkw3srlqmmkp6ou@jefvdyktsuds>
References: <20250718065125.2892404-1-shiyongbang@huawei.com>
 <20250718065125.2892404-9-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718065125.2892404-9-shiyongbang@huawei.com>
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=6884fc51 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=i0EeH86SAAAA:8 a=nBfjFdyouy9m0_FljzMA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDE0MCBTYWx0ZWRfX8TwwXGPbopjK
 lj0DTVrPosT4/Vfu96YSoM3ga59QUu470PnzC9FXroNaBc/ROcIjWpLs9XJbCpdhUm8HR+F4g+v
 tHQ5vmeSrIXcpIKniGzooiaFpJSfwuQqgaRlcpgMsijBsqNyVFaMPv91zGfFDNKvxl2jNnimVYE
 jLjJLMMBS1aQuBZxcLTtfXrCpCMLSAhcolXOXAV6690nvV69sRrcU9Nh3jn3BGtvG1WqL2Qomxa
 8pOveDQmV7gi/YkJoYDC1WZmxfalzZ2razrI4U6fo4cA7zjP9l4hugfk7JQevsJhfZqa0tPgmkk
 JtBUNkhxtM/Ca0sdYKlwMVU/rJIMh6B+HJLPBEAB0LC2Qdy4os/xHu249yePwHK7r4e7nRNOBuZ
 sMv2AqwNnTM8szYaKcMHl9gseUO5+h8q1oZwVY6lH/JBIcRt6qoAHct2CV46F8GSR0Ka1XVa
X-Proofpoint-ORIG-GUID: ZF93jtQb5LYXZNKdlU4whLirN4UdiUXZ
X-Proofpoint-GUID: ZF93jtQb5LYXZNKdlU4whLirN4UdiUXZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-26_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507260140
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

On Fri, Jul 18, 2025 at 02:51:22PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Our chip support KVM over IP feature, so hibmc diiver need to support

I assume that KVM-over-IP doesnt provide EDID reads. This needs to be
stated in the commit message.

> displaying without any connectors plugged in. If no connectors connected,
> set the vdac connector status to 'connected' to handle BMC KVM. Use
> is_connected to check all physical outputs.
> For get_modes: using BMC modes for connector if no display is attached to
> phys VGA cable, otherwise use EDID modes by drm_connector_helper_get_modes.
> 
> Fixes: 4c962bc929f1 ("drm/hisilicon/hibmc: Add vga connector detect functions")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v2 -> v3:
>   - fix hibmc_connector_get_modes() and hibmc_vdac_detect() to realize BMC KVM, suggested by Dmitry Baryshkov.
> ---
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    |  5 +-
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  4 ++
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c  | 55 +++++++++++++------
>  3 files changed, 45 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> index 99b30a6c7e06..262ebe6138f0 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> @@ -58,9 +58,12 @@ static int hibmc_dp_detect(struct drm_connector *connector,
>  {
>  	struct hibmc_drm_private *priv = to_hibmc_drm_private(connector->dev);
>  
> -	if (!hibmc_dp_detect_link(&priv->dp))
> +	if (!hibmc_dp_detect_link(&priv->dp)) {
> +		priv->is_connected |= BIT(0);

Magic value BIT(0)

>  		return connector_status_connected;
> +	}
>  
> +	priv->is_connected &= ~BIT(0);
>  	return connector_status_disconnected;
>  }
>  
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> index ca8502e2760c..d68588ecec9b 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> @@ -31,6 +31,7 @@ struct hibmc_vdac {
>  	struct drm_connector connector;
>  	struct i2c_adapter adapter;
>  	struct i2c_algo_bit_data bit_data;
> +	int phys_status;
>  };
>  
>  struct hibmc_drm_private {
> @@ -43,6 +44,9 @@ struct hibmc_drm_private {
>  	struct drm_crtc crtc;
>  	struct hibmc_vdac vdac;
>  	struct hibmc_dp dp;
> +
> +	/* VGA and DP phys connect status, BIT(0) is DP, BIT(1) is VGA */

#define those.

> +	int is_connected;

And you need a lock around this one, otherwise you might get a race
between DP's and VGA's code setting and clearing bits here.

>  };
>  
>  static inline struct hibmc_vdac *to_hibmc_vdac(struct drm_connector *connector)
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> index 841e81f47b68..3cdf640d1785 100644
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
> -			goto out;
> +	if (vdac->phys_status == connector_status_connected) {
> +		count = drm_connector_helper_get_modes(connector);
> +	} else {
> +		drm_edid_connector_update(connector, NULL);
> +		count = drm_add_modes_noedid(connector,
> +					     connector->dev->mode_config.max_width,
> +					     connector->dev->mode_config.max_height);
> +		drm_set_preferred_mode(connector, 1024, 768); // 1024x768
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
> @@ -57,10 +48,38 @@ static void hibmc_connector_destroy(struct drm_connector *connector)
>  	drm_connector_cleanup(connector);
>  }
>  
> +static int hibmc_vdac_detect(struct drm_connector *connector,
> +			     struct drm_modeset_acquire_ctx *ctx,
> +			     bool force)
> +{
> +	struct hibmc_drm_private *priv = to_hibmc_drm_private(connector->dev);
> +	struct hibmc_vdac *vdac = to_hibmc_vdac(connector);
> +	enum drm_connector_status status;
> +
> +	status = drm_connector_helper_detect_from_ddc(connector, ctx, force);
> +
> +	vdac->phys_status = status;
> +
> +	if (status == connector_status_connected) {
> +		priv->is_connected |= BIT(1);
> +		return connector_status_connected;
> +	}
> +
> +	priv->is_connected &= ~BIT(1);
> +
> +	/* if all connectors are disconnected,
> +	 * return connected to support BMC KVM display.
> +	 */
> +	if (!priv->is_connected)
> +		return connector_status_connected;
> +
> +	return connector_status_disconnected;
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
