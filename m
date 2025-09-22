Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA61B8FF21
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 12:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAED110E41A;
	Mon, 22 Sep 2025 10:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YAA3KIOQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9B110E407
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 10:14:16 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8wqZ3006272
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 10:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=WsA+eTQiYoHebD0DNWYyXYRm
 Qjuc3bf4Ma1PwAwHwE4=; b=YAA3KIOQX+f9Jop2DuHAWi47L1TewNbOG7mtb3b8
 WEwTZfkQjhcngNg6Qp6Rp4OhranQpodohh7/tVMWAzN835igyp/sQWpwM8WJ7aPG
 F3H8fJLJeGLoH/20C5NcHhLa2W1M9ihgwpv5VDkqRGCPtJB0f56LDpudDPQDFEP+
 YlhoAEdZFNKatUeF1zm8JcMvR67314lOGxp+6r8yBeJJiBxzLaAuqnLUgzU8XTST
 xSXUoXnNoQ6XwGXCczo2Q/Dee5/vhrN4dopBZ+Z9NwUT4Mbge69OEmIs+8C2XhFL
 6LsNbnsInNDeo6yGLTG554oYkwOCwMGuP1UKbmUQXtjBdQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyemmnf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 10:14:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b7ad72bc9fso93302631cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 03:14:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758536055; x=1759140855;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WsA+eTQiYoHebD0DNWYyXYRmQjuc3bf4Ma1PwAwHwE4=;
 b=AuvXlXIz9I15FXfURhXCDqvDUOT8SEAlFf2hDO8mCq/ypzwHMBRI3RNgazlM4RnSQ4
 uySYPAs8JZzBpCBpXhWgbMqWSbiiJnNpuEjoXzoomdaEz9NqCbH2gduvdbN71TxG0qjj
 C4k3Y+v/YW8cK9ytBTF1zQDw0F/uKZ6kDZQ7L0A1eSKiNorVOO0MU9+QJwWEi358bzeX
 1f+6evrezRMl8+DBAegXZGEET/dVtH2DDizi5BQOGkRO6wYNaQJe8bADZgOEGsiOIrMs
 0vasPcHICqx+nolB6ygDQMkrQp8bKZzhRytA7rsHcuiTz8rHwM/jNNzkUOZZq8BCEUjr
 HaqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHDGwwG/wbqL9XIL5TynNu1wz07pJAmmuwouRWuLc9Mw9QjGepd4WOEvpZURiUllXmz6wucxJmx5k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1GM0U0yh5o4D3zQo42FsLcJE6sRgIfCBj3YG60JnKlBTM7tq8
 b61senAYBvwPeGz9hhgRpLbgEnLeRQc0grkUe47D78zarLjTvDT8pbP8dJ56Xidpz4z58F8vzVG
 mNfGSBGMQjwlgnO1j+YTEIxoo4JrIQmlVwi7JtBLuJArKb1HwXSw7dWP6k1E6GfF6hebZwIc=
X-Gm-Gg: ASbGncv5M4jQYClUqEYC+i/um/X6eW54om0AOXCEc0vgh4fpNJ6tzjjzpnNkVBPM6Kp
 FDpIZqkDgeXRQr266+SmrwUI6Y6Cb6hlzThKqVHwdvjFMIkxZhzA7BXxXcZNmXx2nhgO+5FeaZz
 p2bCdtn34irASDSHS6YEA8RNHpafc6RCOQo7a2EpnqjGTy+ahyaA15RlcQst3zAANW1AOdaQ8nG
 PG7TrHcESzJVBZ3++aYo7kFUPftG7Hmnj+uCrgbQemdlc7FYfEiLZ+V7GDx/HpnTogh/0GLlqcE
 C6tIgsxnT2itcRsDJQr1wBBmOuHzr4BHK3cUjzERuOVQqTfvVdL4av8gmprAd/cZqPmbWDmf/9U
 FRG+LWQJQjLE+jV3N14YUN4A5oeNrwQT32G+Httq3oIwVrfLyWWsB
X-Received: by 2002:ac8:5754:0:b0:4b7:a885:9659 with SMTP id
 d75a77b69052e-4c0720ad96fmr147008511cf.41.1758536054793; 
 Mon, 22 Sep 2025 03:14:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVqtW+0DIkgD31REMewxJTdsREhOwOU+TUqANZpY+KqSiKJ3RVtbsYl6C/4x3Vg0NOXJdtqA==
X-Received: by 2002:ac8:5754:0:b0:4b7:a885:9659 with SMTP id
 d75a77b69052e-4c0720ad96fmr147008291cf.41.1758536054304; 
 Mon, 22 Sep 2025 03:14:14 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-578a5f45364sm3233734e87.15.2025.09.22.03.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 03:14:13 -0700 (PDT)
Date: Mon, 22 Sep 2025 13:14:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, fengsheng5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 drm-dp 1/4] drm/hisilicon/hibmc: fix dp
 probabilistical detect errors after HPD irq
Message-ID: <4vtis3tmlxhmxjmzhi4jdfriexidtr5u2jdcpmfegyyc5gkznu@mpzganc4k5gp>
References: <20250922024943.311947-1-shiyongbang@huawei.com>
 <20250922024943.311947-2-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922024943.311947-2-shiyongbang@huawei.com>
X-Proofpoint-GUID: 3ismon0H-sFHx4mXfMDrRv02lqjss1he
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d12178 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=i0EeH86SAAAA:8 a=NrH-iARweJuqf9unkBcA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX4fDuNRk65js6
 0ETjs6CR3AT8R0Druie6PCgOts/mdgV6c3viOt4Ilry5/7WyD2BUajzDtQhKGw3bzFMQ9RsxKP9
 0pGYRJIlLjU8LLTYagFLjeEX1MZDVTLtLhdSyr3iR6TcP0gsoS4Co4lQ8ukjwYJysJLhjPku9Sv
 FXozk8Qy9PJkbgGN1vXdAo3YFsezR4PC9ebhPzkeZ7i57SMwSCfyo3Csjt+N4Z9U/dopNFxYrn3
 D76Jz8rwPJVM9jrmpWuEIRwVQzenBv1ESXEURG3Y0qbduG4hxAfF3eHRtShpOi3GHp4d2gv8Qud
 w1xsJVFZMKET9Ua10rfdPiRc1lkwLNMvCkwvbvP/vsYlJbuWb3rSxDBU7mZwzRTCk92O6FogFVf
 +3wfOIef
X-Proofpoint-ORIG-GUID: 3ismon0H-sFHx4mXfMDrRv02lqjss1he
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004
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

On Mon, Sep 22, 2025 at 10:49:40AM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> The issue is that drm_connector_helper_detect_from_ddc() returns wrong
> status when plugging or unplugging the monitor. Use HPD pin status in
> DP's detect_ctx() for real physcal monitor in/out, and keep using
> detect_frome_ddc() if it's the first time to call detect because of
> insmoding driver.

If I understand correct, this is not quite right. Consider DP-to-HDMI or
DP-to-DVI dongle being plugged without an actual monitor and then the
monitor being plugged later on.

> 
> Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v5 -> v6:
>   - use HPD status in DP detect_ctx(), suggested by Dmitry Baryshkov.
> v4 -> v5:
>   - fix the commit message and DP detect_ctx(), suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c     | 12 ++++++++++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h     |  7 +++++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h    |  3 +++
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c | 13 +++++++++++--
>  4 files changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> index 8f0daec7d174..4d8d3e4d4f84 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> @@ -2,6 +2,7 @@
>  // Copyright (c) 2024 Hisilicon Limited.
>  
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/delay.h>
>  #include "dp_config.h"
>  #include "dp_comm.h"
> @@ -305,3 +306,14 @@ void hibmc_dp_set_cbar(struct hibmc_dp *dp, const struct hibmc_dp_cbar_cfg *cfg)
>  	hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, BIT(0), cfg->enable);
>  	writel(HIBMC_DP_SYNC_EN_MASK, dp_dev->base + HIBMC_DP_TIMING_SYNC_CTRL);
>  }
> +
> +void hibmc_dp_update_hpd_status(struct hibmc_dp *dp)
> +{
> +	int status;
> +
> +	readl_poll_timeout(dp->dp_dev->base + HIBMC_DP_HPD_STATUS, status,
> +			   FIELD_GET(HIBMC_DP_HPD_CUR_STATE, status) != dp->hpd_status,
> +			   1000, 100000); /* DP spec says 100ms */
> +
> +	dp->hpd_status = FIELD_GET(HIBMC_DP_HPD_CUR_STATE, status);
> +}
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> index 665f5b166dfb..8348ad9e34a8 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> @@ -14,6 +14,11 @@
>  
>  struct hibmc_dp_dev;
>  
> +enum hibmc_hpd_status {
> +	HIBMC_HPD_OUT,
> +	HIBMC_HPD_IN,
> +};
> +
>  enum hibmc_dp_cbar_pattern {
>  	CBAR_COLOR_BAR,
>  	CBAR_WHITE,
> @@ -50,6 +55,7 @@ struct hibmc_dp {
>  	struct drm_dp_aux aux;
>  	struct hibmc_dp_cbar_cfg cfg;
>  	u32 irq_status;
> +	int hpd_status;
>  };
>  
>  int hibmc_dp_hw_init(struct hibmc_dp *dp);
> @@ -60,5 +66,6 @@ void hibmc_dp_reset_link(struct hibmc_dp *dp);
>  void hibmc_dp_hpd_cfg(struct hibmc_dp *dp);
>  void hibmc_dp_enable_int(struct hibmc_dp *dp);
>  void hibmc_dp_disable_int(struct hibmc_dp *dp);
> +void hibmc_dp_update_hpd_status(struct hibmc_dp *dp);
>  
>  #endif
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> index 394b1e933c3a..64306abcd986 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> @@ -24,6 +24,9 @@
>  #define HIBMC_DP_CFG_AUX_READY_DATA_BYTE	GENMASK(16, 12)
>  #define HIBMC_DP_CFG_AUX			GENMASK(24, 17)
>  
> +#define HIBMC_DP_HPD_STATUS			0x98
> +#define HIBMC_DP_HPD_CUR_STATE		GENMASK(7, 4)
> +
>  #define HIBMC_DP_PHYIF_CTRL0			0xa0
>  #define HIBMC_DP_CFG_SCRAMBLE_EN		BIT(0)
>  #define HIBMC_DP_CFG_PAT_SEL			GENMASK(7, 4)
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> index d06832e62e96..48c9c97eef0e 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> @@ -34,9 +34,16 @@ static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
>  static int hibmc_dp_detect(struct drm_connector *connector,
>  			   struct drm_modeset_acquire_ctx *ctx, bool force)
>  {
> -	mdelay(200);
> +	struct hibmc_dp *dp = to_hibmc_dp(connector);
> +
> +	/* if no HPD just probe DDC */
> +	if (!dp->irq_status)
> +		return drm_connector_helper_detect_from_ddc(connector, ctx, force);
>  
> -	return drm_connector_helper_detect_from_ddc(connector, ctx, force);
> +	if (dp->hpd_status == HIBMC_HPD_IN)
> +		return connector_status_connected;
> +
> +	return connector_status_disconnected;
>  }
>  
>  static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
> @@ -128,6 +135,8 @@ irqreturn_t hibmc_dp_hpd_isr(int irq, void *arg)
>  		hibmc_dp_reset_link(&priv->dp);
>  	}
>  
> +	hibmc_dp_update_hpd_status(&priv->dp);
> +
>  	if (dev->registered)
>  		drm_connector_helper_hpd_irq_event(&priv->dp.connector);
>  
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
