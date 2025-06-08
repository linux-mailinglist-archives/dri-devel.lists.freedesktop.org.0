Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8444AD11ED
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 13:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2019910E1C6;
	Sun,  8 Jun 2025 11:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nVGkSVzM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308A110E19B
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 11:37:15 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558AudY9028468
 for <dri-devel@lists.freedesktop.org>; Sun, 8 Jun 2025 11:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2XzvULEwIZqT6WbSLPw/hGHn
 Rhu/r9F1q68TDz91od0=; b=nVGkSVzMEP1BV1NPpXFEm//Y8xlsVTHbXklUQdsw
 hRYoGCCfXJUf085a+4LwnRpBw6Upzv/bYjxhzZJ4dDf7cgo+JpX8NpDgbHe7bW5y
 c+BhrJjVYCKdOjPNtxFtxi0hMcQWLaCw5QcEvI8oXd/8ulhoZUpiHdC+PBryLNTx
 g9IQmtJOdN8D+NwBBtyUK9hHvjgfeYrR7IVENdHr1HTQlnNMPXiou4ppMlzumYVc
 E9fSqoerTPIQRy69XVhp/5uKrGWcNUcG30eqDvolnNRZNx2wlCEB06NcwgUICHF8
 xPGusO5EHGrGm6WiUWgTk/MlYEvbylzRmbshseR110OMYw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn62j88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 11:37:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d09bc05b77so556571585a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 04:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749382633; x=1749987433;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2XzvULEwIZqT6WbSLPw/hGHnRhu/r9F1q68TDz91od0=;
 b=Vc5EJuNChHILQE27czvo+LJF3PTCDfFn31zi331rvzIlISAE8O3YulEeX2S7LINbyb
 t2r9iMab9pP3tTM18d44sAppdRlUNnsxLt1PJoWy91v8IW4vAY8YKwzkGPS6bQlmGPkE
 /pU9lh6UKxhOoISR3Gty+heNu8UtTDpDKtocIiKtn1gC669Rj8bkQupQMgt4bg4+JVY4
 OPfOHCixV8ydx/ptsRGzPgsuIqem9ESQ6I9VSsHN/Bud99y7TzrWtApKv7yFS/m+fX3T
 ppxMTqENPwP/dP+RtsCT6cdQPEs116f37YUBFYATSxT15Hmd/BwDreTt7Koze7Ta0R3/
 Nezg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCy8VvBmPqFzF5IHMWgGSnHkBeiZO6fpNG/KOc52d29tXLWO/YS52oVZVRDnLBkqbmBQauKdGIpYE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvKTjyPD9y0F9Ngu+vdRNEPwXK4uoEvP0nv3p1slR1+8ne7ZoK
 H+r6uarIiJJfL4obX0RqxkIOHG5oGBg5PHW+AUxNP/QqOWVaFwjuQSuCetJgKNuTfaZSe6VtawE
 JxID7oO+2GCM2ZDKhNG6LgcN5p3ub0lw+Q68AgFfkANaZ7mYSKiubqAKmcdqD0uAPcoYRxnA=
X-Gm-Gg: ASbGncuAfxXErwzq8vB61ISxkq4FaKBFuBVQdq04izasGPsfQZCFtSAf+MUV2raztfv
 Yz1lvjWoVvYDtNP3do8iRLGiuemn1bagV+hUgBoTA10/QhIw6QDSEdzD0AZzOZjq0uj1hpevNgD
 /eLwh/GZ+Ul9m11Q310DeEtDl5eUAurZyJJyPnAggl2iLNyQz9qgwtxppXFVtaMY8R1qO7gxSWo
 w/DyjYnEF1zdTj1DJy+vxBQMVoMeUxdyBqpJrY0xtRqhNlrXaYwEA1+3Vs6HczKRWEXHLJhto6J
 F4GXtjiNqVkJ9AucRUZ0S7w4CELe3Ocwau5Tn3W2tPiJhPh7frnJY5KpOPO8PzgITm61hHqqF7k
 UuPiniNNugQ==
X-Received: by 2002:a05:620a:454e:b0:7d3:9108:2f55 with SMTP id
 af79cd13be357-7d3910831e4mr275252785a.50.1749382632817; 
 Sun, 08 Jun 2025 04:37:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMwLr0kqZ/s9Dd7WLfEY/47VaiSC3va5UAfPRrc1sQoQyVjYy/udgQ25TowUq/UHeft7uV0w==
X-Received: by 2002:a05:620a:454e:b0:7d3:9108:2f55 with SMTP id
 af79cd13be357-7d3910831e4mr275250185a.50.1749382632465; 
 Sun, 08 Jun 2025 04:37:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55367731451sm741875e87.203.2025.06.08.04.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jun 2025 04:37:10 -0700 (PDT)
Date: Sun, 8 Jun 2025 14:37:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH drm-dp 02/10] drm/hisilicon/hibmc: fix dp probabilistical
 detect errors after HPD irq
Message-ID: <r3tnmjl5bnlyhgblhfqwouu57oh5tfpmfsrx5xczzmsovalvse@mujphkc4mv5k>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-3-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530095432.1206966-3-shiyongbang@huawei.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDA5MCBTYWx0ZWRfX9XEv5dZB4I5F
 MANauFjlbZuMTnTckVup1rZL49LMUYs2+VokHIno/Jv9/fhMEZw6c93lgNwIqiSlpI4BHIfFZe0
 6TRnHm4zyDbtebsOIoi37WDvjSh0A9xh+GX0BypuYOxDbq8WgaIB9nOhcj9nBefuxe9s9QIg5EI
 X4bvluEbvTckll9+kS10XP6zLxhhVnv/3pqjAqwIa2ryH73OO2g5GgtkTqSNCPBvwlrx4R/JCmp
 ACk6UPRfqAEGlFHEGV5jOC+Si0iqxWWL4rXzZ5uO5LJ3TiyEE90mUcGr4enNiXnuLWjjI7JbaWe
 ffAtvycVkLNu2BA8XX4LzywBSeRObDgmfXJPJPGvgVdtuIjsNnMa8cx6W5sVR0SwhlHRXstMk94
 OO5C0ql3esiPBmNa6iFWlyeeueydJHarkoAY/drkEag2VzHngTtsfp2/58LgTWBQkwlYZv5z
X-Proofpoint-GUID: kOR4yg8yMPFKSmhmGFGFh2hvrPL9ffNF
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=684575ea cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=2Qv6WW4UP-kDLlFIgDAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: kOR4yg8yMPFKSmhmGFGFh2hvrPL9ffNF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080090
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

On Fri, May 30, 2025 at 05:54:24PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> The debouncing when HPD pulled out still remains sometimes, 200ms still can
> not ensure helper_detect() is correct. So add a flag to hold the sink
> status, and changed detect_ctx() functions by using flag to check status.
> 
> Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  1 +
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 38 +++++++++++++------
>  2 files changed, 28 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> index 665f5b166dfb..68867475508c 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> @@ -50,6 +50,7 @@ struct hibmc_dp {
>  	struct drm_dp_aux aux;
>  	struct hibmc_dp_cbar_cfg cfg;
>  	u32 irq_status;
> +	int hpd_status;
>  };
>  
>  int hibmc_dp_hw_init(struct hibmc_dp *dp);
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> index d06832e62e96..191fb434baa7 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> @@ -13,7 +13,8 @@
>  #include "hibmc_drm_drv.h"
>  #include "dp/dp_hw.h"
>  
> -#define DP_MASKED_SINK_HPD_PLUG_INT	BIT(2)
> +#define HIBMC_DP_MASKED_SINK_HPD_PLUG_INT	BIT(2)
> +#define HIBMC_DP_MASKED_SINK_HPD_UNPLUG_INT	BIT(3)
>  
>  static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
>  {
> @@ -34,9 +35,12 @@ static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
>  static int hibmc_dp_detect(struct drm_connector *connector,
>  			   struct drm_modeset_acquire_ctx *ctx, bool force)
>  {
> -	mdelay(200);
> +	struct hibmc_dp *dp = to_hibmc_dp(connector);
>  
> -	return drm_connector_helper_detect_from_ddc(connector, ctx, force);
> +	if (dp->hpd_status)
> +		return connector_status_connected;
> +	else
> +		return connector_status_disconnected;
>  }
>  
>  static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
> @@ -115,22 +119,34 @@ irqreturn_t hibmc_dp_hpd_isr(int irq, void *arg)
>  {
>  	struct drm_device *dev = (struct drm_device *)arg;
>  	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
> +	struct hibmc_dp *dp = &priv->dp;
>  	int idx;
>  
>  	if (!drm_dev_enter(dev, &idx))
>  		return -ENODEV;
>  
> -	if (priv->dp.irq_status & DP_MASKED_SINK_HPD_PLUG_INT) {
> -		drm_dbg_dp(&priv->dev, "HPD IN isr occur!\n");
> -		hibmc_dp_hpd_cfg(&priv->dp);
> +	if (dp->hpd_status) { /* only check unplug int when the last status is HPD in */

I think this way you'll ignore HPD short pulses. Could you possibly
clarify whether it is the case or not?

> +		if ((dp->irq_status & HIBMC_DP_MASKED_SINK_HPD_UNPLUG_INT)) {
> +			drm_dbg_dp(dev, "HPD OUT isr occur.");
> +			hibmc_dp_reset_link(dp);
> +			dp->hpd_status = 0;
> +			if (dev->registered)
> +				drm_connector_helper_hpd_irq_event(&dp->connector);
> +		} else {
> +			drm_warn(dev, "HPD OUT occurs, irq status err: %u", dp->irq_status);

These should be ratelimited.

> +		}
>  	} else {
> -		drm_dbg_dp(&priv->dev, "HPD OUT isr occur!\n");
> -		hibmc_dp_reset_link(&priv->dp);
> +		if (dp->irq_status & HIBMC_DP_MASKED_SINK_HPD_PLUG_INT) {
> +			drm_dbg_dp(&priv->dev, "HPD IN isr occur.");
> +			hibmc_dp_hpd_cfg(dp);
> +			dp->hpd_status = 1;
> +			if (dev->registered)
> +				drm_connector_helper_hpd_irq_event(&dp->connector);
> +		} else {
> +			drm_warn(dev, "HPD IN occurs, irq status err: %u", dp->irq_status);
> +		}
>  	}
>  
> -	if (dev->registered)
> -		drm_connector_helper_hpd_irq_event(&priv->dp.connector);

There is no need to, just call this function always at the end of the
ISR handler as it is done currently.

> -
>  	drm_dev_exit(idx);
>  
>  	return IRQ_HANDLED;
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
