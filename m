Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC93AA75B71
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 19:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9A510E323;
	Sun, 30 Mar 2025 17:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ijIEm7yq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E1C10E323
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:35:53 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UD1o94020608
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/Ekvjy58DUNtiPQDZ5XEgPgK
 6Wx/z7Obi+jZRQ3HXGg=; b=ijIEm7yqnrGT9Yfp0O2cAXu59ZWH9N0O+764jHxa
 4i40ozH5xB9+x2VGqS3HFL/P6nzfwWQZG6KljU9MUS2rwPKv+0vZzaPTtMj3hAtm
 8UQ+nhIK3PS4ScLN2tu3CTYguCuBo9X9z1HFrlmbYpoxPaE6UHQMYFDq7Txlj9ct
 OHg/8bjR+gQ3HvqrwaVu4Pu/Fzr2CYfyjKt3jggX06GYJX7rS7iKqeZYCn0kHG41
 B3jNfDRASeQpGzMj5xIIEm2Zqj9SWI/mlSu5ky7ley8OWKSZRw/osNPOuD+lM+Qm
 ofXr/rZf0ZAloCbJZ1SaXLdZBBgsizXeD5XUE0khGVr1Ow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p86kjmqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:35:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c57f80d258so140794385a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 10:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743356150; x=1743960950;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Ekvjy58DUNtiPQDZ5XEgPgK6Wx/z7Obi+jZRQ3HXGg=;
 b=r6Td6L7WkLgrwjpnaycLcmvwjzDlxbD8LBTzvfZGnfi5PrnRdbhhmbILtSBedyp6zX
 23qmreuq7pdfNFpp7MgRkyTzPklJ4REJm1ClPwC76Uz6IPB7M81oiN7IxMiNNqjkLOxV
 ZwFMyAZ8O3UbUwEuZS+8u/mef3A/LRVcevNlOFWR5Ce1XyXYg5GKNKyCEF3pDddiHEF+
 a3Hohc0pSh3wuluyLNBxuN65FZw4fHPndVBvAXxXOmuCHz0Bk8FkaDUW4P9v0yRlXqNZ
 lbytyjJ4MXWvvw+qhphqIoyHO/rCgLDE3rzY4olMFqnEddZtPJ+YdvCEMoDCjZHMaLKS
 jFJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxrS0cMC/XWhEatvvttqkkZOZmf8Y5EL4ozDCsiFB9elRIxcdbF7Ed6AJWW1X/Sz2w3EqiwaSlTwM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLaKbbGZLNkifpUWUerECxQzTwMTeoSbBwlxeFu40q4tehquWB
 0LEODNsq79PU/Y1rHP9RrMngUKEMARcCtyy9VSp+xlivT9+1rxePWMCnV3oYPiYYyfUnrkQZ/mw
 96mfsV9q0pcw5An7/FTwlfbl8546hFUSyemIzWb4P3dSsWgxSGBixd6FElSaGpqcLFlY=
X-Gm-Gg: ASbGnctCFZvv2tmu/5M8JZj3D3ikIpCdIrTqx/gUVnw/yYu9BURiVk5HkSdbY5T78NI
 sD1YDw87pMZmiiQbPX1+QJO3ccSGB/MBqzTGK9C4DJ3DpgWmDKKQfaK2UstA92msGFggmCzMoAt
 w8aWmy9tKXTC1y2nJzDvFhYimk2zxFoTu1mgpeeCgJ4+XhJToqHFHwNHThDF0SGkSvWreJLBLIX
 7sIfUqMThFt/QchvCq0A7S96mD9iS7eiMDkVCITNDYlUKPoX+RmjnTSc3Kg3U2bNqZy+zUgmD9Q
 NmvR4IDjUGtxZDwYN3kIxHFmCK5djKBx64x6V+u39jKYsUGtOS2Zd+g28tuuvmymjF/9GN80RMU
 tcjc=
X-Received: by 2002:a05:620a:410a:b0:7c5:57cd:f1cb with SMTP id
 af79cd13be357-7c690880ce1mr851404885a.37.1743356150404; 
 Sun, 30 Mar 2025 10:35:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCWWkysvAKww1y4/OFTILfa1Qb4claB9jEA1Bsy053KnU6TzjAsIteW5I4XO78FibpVAno6A==
X-Received: by 2002:a05:620a:410a:b0:7c5:57cd:f1cb with SMTP id
 af79cd13be357-7c690880ce1mr851400785a.37.1743356149953; 
 Sun, 30 Mar 2025 10:35:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30dd2ad61f6sm11259911fa.60.2025.03.30.10.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 10:35:48 -0700 (PDT)
Date: Sun, 30 Mar 2025 20:35:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xin Ji <xji@analogixsemi.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 bliang@analogixsemi.com, qwen@analogixsemi.com, treapking@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge:anx7625: Enable DSC feature
Message-ID: <gs2pn7o33hjzfpljzjprorof3xehhui5mvsrbnnpu4gwyncw5u@zvlez4dpgv3f>
References: <20250327115616.1271635-1-xji@analogixsemi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327115616.1271635-1-xji@analogixsemi.com>
X-Authority-Analysis: v=2.4 cv=W8g4VQWk c=1 sm=1 tr=0 ts=67e980f8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=bbNUuHX0AAAA:8 a=g6djToMRWLG3Agy0AkoA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=3b-t3vAtY4IUXy2q2Ylb:22
X-Proofpoint-GUID: lkIkSeLcCOfbOjoa3WKO0DU7V_7M67eV
X-Proofpoint-ORIG-GUID: lkIkSeLcCOfbOjoa3WKO0DU7V_7M67eV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300123
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

On Thu, Mar 27, 2025 at 07:56:15PM +0800, Xin Ji wrote:
> 4K30(3840x2160 30Hz) timing pixel clock around 297M, for 24bits RGB
> pixel data format, total transport bandwidth need 297M*24(at least
> 7.2Gbps) more than anx7625 mipi rx lane bandwidth(maximum 6Gbps,
> 4lanes, each lane 1.5Gbps). Without DSC function, anx7625 cannot
> receive 4K30 video timing.
> 
> When display pixel clock exceed 250M, driver will enable DSC feature,
> and the compression ratio is 3:1, eg: 4K30's pixel clock around 297M,
> bandwidth 7.2G will be compressed to 7.2G/3 = 2.4G. Then anx7625
> can receive 4K30 video timing and do decompress, then package video
> data and send to sink device through DP link.
> 
> Anx7625 is bridge IC, sink monitor only receive normal DP signal from
> anx7625, sink device didn't know DSC information between SOC and anx7625
> 
> v2:
> 1. Add more commit message
> 2. Remove unused code
> 3. Add more comment

This part is useless, it adds no information. It is as good as 'changed
it'.

> 4. Remove dsc_en flag
> 
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 299 ++++++++++++++++++----
>  drivers/gpu/drm/bridge/analogix/anx7625.h |  31 +++
>  2 files changed, 274 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 4be34d5c7a3b..bae76d9a665f 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -9,6 +9,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/iopoll.h>
>  #include <linux/kernel.h>
> +#include <linux/math64.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/pm_runtime.h>
> @@ -22,6 +23,7 @@
>  
>  #include <drm/display/drm_dp_aux_bus.h>
>  #include <drm/display/drm_dp_helper.h>
> +#include <drm/display/drm_dsc_helper.h>
>  #include <drm/display/drm_hdcp_helper.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> @@ -476,11 +478,159 @@ static int anx7625_set_k_value(struct anx7625_data *ctx)
>  				 MIPI_DIGITAL_ADJ_1, 0x3D);
>  }
>  
> +static bool anx7625_dsc_check(struct anx7625_data *ctx)
> +{
> +	if (ctx->dt.pixelclock.min > DSC_PIXEL_CLOCK)
> +		return true;

So, now DSC is enabled unconditionally just because the clock is too
high. Let's see...

> +
> +	return false;
> +}
> +
> +static inline int anx7625_h_timing_reg_write(struct anx7625_data *ctx,
> +					     struct i2c_client *client,
> +					     u8 reg_addr, u16 val,
> +					     bool dsc_check)
> +{
> +	int ret;
> +
> +	if (dsc_check && anx7625_dsc_check(ctx))
> +		val = dsc_div(val);
> +
> +	ret = anx7625_reg_write(ctx, client, reg_addr, val);
> +	ret |= anx7625_reg_write(ctx, client, reg_addr + 1, val >> 8);
> +
> +	return ret;
> +}
> +
> +static int anx7625_h_timing_write(struct anx7625_data *ctx,
> +				  struct i2c_client *client,
> +				  bool rx_h_timing)
> +{
> +	u16 htotal;
> +	int ret;
> +
> +	htotal = ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
> +			 ctx->dt.hback_porch.min + ctx->dt.hsync_len.min;
> +	/* Htotal */
> +	ret = anx7625_h_timing_reg_write(ctx, client, HORIZONTAL_TOTAL_PIXELS_L,
> +					 htotal, rx_h_timing);
> +	/* Hactive */
> +	ret |= anx7625_h_timing_reg_write(ctx, client, HORIZONTAL_ACTIVE_PIXELS_L,
> +					  ctx->dt.hactive.min, rx_h_timing);
> +	/* HFP */
> +	ret |= anx7625_h_timing_reg_write(ctx, client, HORIZONTAL_FRONT_PORCH_L,
> +					  ctx->dt.hfront_porch.min, rx_h_timing);
> +	/* HWS */
> +	ret |= anx7625_h_timing_reg_write(ctx, client, HORIZONTAL_SYNC_WIDTH_L,
> +					  ctx->dt.hsync_len.min, rx_h_timing);
> +	/* HBP */
> +	ret |= anx7625_h_timing_reg_write(ctx, client, HORIZONTAL_BACK_PORCH_L,
> +					  ctx->dt.hback_porch.min, rx_h_timing);
> +
> +	return ret;
> +}
> +
> +static int anx7625_v_timing_write(struct anx7625_data *ctx,
> +				  struct i2c_client *client)
> +{
> +	int ret;
> +
> +	/* Vactive */
> +	ret = anx7625_reg_write(ctx, client, ACTIVE_LINES_L,
> +				ctx->dt.vactive.min);
> +	ret |= anx7625_reg_write(ctx, client, ACTIVE_LINES_H,
> +				 ctx->dt.vactive.min >> 8);
> +	/* VFP */
> +	ret |= anx7625_reg_write(ctx, client, VERTICAL_FRONT_PORCH,
> +				 ctx->dt.vfront_porch.min);
> +	/* VWS */
> +	ret |= anx7625_reg_write(ctx, client, VERTICAL_SYNC_WIDTH,
> +				 ctx->dt.vsync_len.min);
> +	/* VBP */
> +	ret |= anx7625_reg_write(ctx, client, VERTICAL_BACK_PORCH,
> +				 ctx->dt.vback_porch.min);
> +
> +	return ret;
> +}
> +
> +static int anx7625_set_dsc_params(struct anx7625_data *ctx)
> +{
> +	int ret, i;
> +	u16 htotal, vtotal;
> +
> +	if (!anx7625_dsc_check(ctx))
> +		return 0;
> +
> +	/* Video Horizontal timing */
> +	ret = anx7625_h_timing_write(ctx, ctx->i2c.tx_p2_client, false);
> +
> +	/* Video Vertical timing */
> +	ret |= anx7625_v_timing_write(ctx, ctx->i2c.tx_p2_client);
> +
> +	/* Vtotal */
> +	vtotal = ctx->dt.vactive.min + ctx->dt.vfront_porch.min +
> +		 ctx->dt.vback_porch.min + ctx->dt.vsync_len.min;
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client, TOTAL_LINES_L,
> +				 vtotal);
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client, TOTAL_LINES_H,
> +				 vtotal >> 8);
> +	/* Htotal */
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, TOTAL_PIXEL_L_7E,
> +				 htotal);
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, TOTAL_PIXEL_H_7E,
> +				 htotal >> 8);
> +	/* Hactive */
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				 ACTIVE_PIXEL_L_7E, ctx->dt.hactive.min);
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				 ACTIVE_PIXEL_H_7E, ctx->dt.hactive.min >> 8);
> +	/* HFP */
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				 HORIZON_FRONT_PORCH_L_7E,
> +				 ctx->dt.hfront_porch.min);
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				 HORIZON_FRONT_PORCH_H_7E,
> +				 ctx->dt.hfront_porch.min >> 8);
> +	/* HWS */
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				 HORIZON_SYNC_WIDTH_L_7E,
> +				 ctx->dt.hsync_len.min);
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				 HORIZON_SYNC_WIDTH_H_7E,
> +				 ctx->dt.hsync_len.min >> 8);
> +	/* HBP */
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				 HORIZON_BACK_PORCH_L_7E,
> +				 ctx->dt.hback_porch.min);
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				 HORIZON_BACK_PORCH_H_7E,
> +				 ctx->dt.hback_porch.min >> 8);
> +
> +	/* Config DSC decoder internal blank timing for decoder to start */
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> +				 H_BLANK_L,
> +				 dsc_div(htotal - ctx->dt.hactive.min));
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> +				 H_BLANK_H,
> +				 dsc_div(htotal - ctx->dt.hactive.min) >> 8);
> +
> +	/* Compress ratio  RATIO bit[7:6] */
> +	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client, R_I2C_1, 0x3F);
> +	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client, R_I2C_1,
> +				(5 - DSC_COMPRESS_RATIO) << 6);
> +	/*PPS table*/
> +	for (i = 0; i < PPS_SIZE; i += PPS_BLOCK_SIZE)
> +		ret |= anx7625_reg_block_write(ctx, ctx->i2c.rx_p2_client,
> +					       R_PPS_REG_0 + i, PPS_BLOCK_SIZE,
> +					       &ctx->pps_table[i]);
> +
> +	return ret;
> +}
> +
>  static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
>  {
>  	struct device *dev = ctx->dev;
>  	unsigned long m, n;
> -	u16 htotal;
>  	int ret;
>  	u8 post_divider = 0;
>  
> @@ -506,48 +656,12 @@ static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
>  	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client,
>  				MIPI_LANE_CTRL_0, ctx->pdata.mipi_lanes - 1);
>  
> -	/* Htotal */
> -	htotal = ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
> -		ctx->dt.hback_porch.min + ctx->dt.hsync_len.min;
> -	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> -			HORIZONTAL_TOTAL_PIXELS_L, htotal & 0xFF);
> -	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> -			HORIZONTAL_TOTAL_PIXELS_H, htotal >> 8);
> -	/* Hactive */
> -	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> -			HORIZONTAL_ACTIVE_PIXELS_L, ctx->dt.hactive.min & 0xFF);
> -	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> -			HORIZONTAL_ACTIVE_PIXELS_H, ctx->dt.hactive.min >> 8);
> -	/* HFP */
> -	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> -			HORIZONTAL_FRONT_PORCH_L, ctx->dt.hfront_porch.min);
> -	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> -			HORIZONTAL_FRONT_PORCH_H,
> -			ctx->dt.hfront_porch.min >> 8);
> -	/* HWS */
> -	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> -			HORIZONTAL_SYNC_WIDTH_L, ctx->dt.hsync_len.min);
> -	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> -			HORIZONTAL_SYNC_WIDTH_H, ctx->dt.hsync_len.min >> 8);
> -	/* HBP */
> -	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> -			HORIZONTAL_BACK_PORCH_L, ctx->dt.hback_porch.min);
> -	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> -			HORIZONTAL_BACK_PORCH_H, ctx->dt.hback_porch.min >> 8);
> -	/* Vactive */
> -	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client, ACTIVE_LINES_L,
> -			ctx->dt.vactive.min);
> -	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client, ACTIVE_LINES_H,
> -			ctx->dt.vactive.min >> 8);
> -	/* VFP */
> -	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> -			VERTICAL_FRONT_PORCH, ctx->dt.vfront_porch.min);
> -	/* VWS */
> -	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> -			VERTICAL_SYNC_WIDTH, ctx->dt.vsync_len.min);
> -	/* VBP */
> -	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> -			VERTICAL_BACK_PORCH, ctx->dt.vback_porch.min);
> +	/* Video Horizontal timing */
> +	ret |= anx7625_h_timing_write(ctx, ctx->i2c.rx_p2_client, true);
> +
> +	/* Video Vertical timing */
> +	ret |= anx7625_v_timing_write(ctx, ctx->i2c.rx_p2_client);
> +

Please split this part into two commits: one refactoring timing
programming into two functions and another one introducing DSC support.
It is hard to review timing programming otherwise.

>  	/* M value */
>  	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
>  			MIPI_PLL_M_NUM_23_16, (m >> 16) & 0xff);
> @@ -663,9 +777,15 @@ static int anx7625_dsi_config(struct anx7625_data *ctx)
>  
>  	DRM_DEV_DEBUG_DRIVER(dev, "config dsi.\n");
>  
> -	/* DSC disable */
> -	ret = anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> -				R_DSC_CTRL_0, ~DSC_EN);
> +	ret = anx7625_set_dsc_params(ctx);
> +	if (anx7625_dsc_check(ctx))
> +		/* DSC enable */
> +		ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> +					R_DSC_CTRL_0, DSC_EN);
> +	else
> +		/* DSC disable */
> +		ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> +					 R_DSC_CTRL_0, ~DSC_EN);
>  
>  	ret |= anx7625_api_dsi_config(ctx);
>  
> @@ -2083,6 +2203,7 @@ static int anx7625_setup_dsi_device(struct anx7625_data *ctx)
>  		MIPI_DSI_MODE_VIDEO_HSE	|
>  		MIPI_DSI_HS_PKT_END_ALIGNED;
>  
> +	dsi->dsc = &ctx->dsc;
>  	ctx->dsi = dsi;
>  
>  	return 0;
> @@ -2187,19 +2308,69 @@ anx7625_bridge_mode_valid(struct drm_bridge *bridge,
>  	struct device *dev = ctx->dev;
>  
>  	DRM_DEV_DEBUG_DRIVER(dev, "drm mode checking\n");
> +	if (mode->clock > SUPPORT_PIXEL_CLOCK)
> +		return MODE_CLOCK_HIGH;
> +
> +	if (mode->clock < SUPPORT_MIN_PIXEL_CLOCK)
> +		return MODE_CLOCK_LOW;
>  
> -	/* Max 1200p at 5.4 Ghz, one lane, pixel clock 300M */
> -	if (mode->clock > SUPPORT_PIXEL_CLOCK) {
> -		DRM_DEV_DEBUG_DRIVER(dev,
> -				     "drm mode invalid, pixelclock too high.\n");

Any reason for dropping debug message?

> +	/*
> +	 * If hdisplay cannot be divided by DSC compress ratio, then display
> +	 * will have overlap/shift issue
> +	 */
> +	if (mode->clock > DSC_PIXEL_CLOCK &&
> +	    (mode->hdisplay % DSC_COMPRESS_RATIO != 0))


... and there still no check that the DSI host supports generating DSC
data. Nor there is an atomic_check() that will check if the mode can be
enabled.

>  		return MODE_CLOCK_HIGH;
> -	}
>  
>  	DRM_DEV_DEBUG_DRIVER(dev, "drm mode valid.\n");
>  
>  	return MODE_OK;
>  }
>  
> +static void anx7625_dsc_enable(struct anx7625_data *ctx, bool en)
> +{
> +	int ret;
> +	struct device *dev = ctx->dev;
> +
> +	if (en) {
> +		ctx->dsc.dsc_version_major = 1;
> +		ctx->dsc.dsc_version_minor = 1;
> +		ctx->dsc.slice_height = 8;
> +		ctx->dsc.slice_width = ctx->dt.hactive.min / DSC_SLICE_NUM;
> +		ctx->dsc.slice_count = DSC_SLICE_NUM;
> +		ctx->dsc.bits_per_component = 8;
> +		ctx->dsc.bits_per_pixel = 8 << 4; /* 4 fractional bits */
> +		ctx->dsc.block_pred_enable = true;
> +		ctx->dsc.native_420 = false;
> +		ctx->dsc.native_422 = false;
> +		ctx->dsc.simple_422 = false;
> +		ctx->dsc.vbr_enable = false;
> +		ctx->dsc.convert_rgb = 1;
> +		ctx->dsc.vbr_enable = 0;

Aren't those 'false' and '0' defaults? If so, you don't need to write
those fields.

> +
> +		drm_dsc_set_rc_buf_thresh(&ctx->dsc);
> +		drm_dsc_set_const_params(&ctx->dsc);
> +
> +		ctx->dsc.initial_scale_value = drm_dsc_initial_scale_value(&ctx->dsc);
> +		ctx->dsc.line_buf_depth = ctx->dsc.bits_per_component + 1;
> +		ret = drm_dsc_setup_rc_params(&ctx->dsc, DRM_DSC_1_2_444);
> +		if (ret < 0)
> +			dev_warn(dev, "drm_dsc_setup_rc_params ret %d\n", ret);
> +
> +		ret = drm_dsc_compute_rc_parameters(&ctx->dsc);
> +		if (ret)
> +			dev_warn(dev, "drm dsc compute rc parameters failed ret %d\n", ret);
> +
> +		drm_dsc_pps_payload_pack((struct drm_dsc_picture_parameter_set *)&ctx->pps_table,
> +					 &ctx->dsc);
> +		dev_dbg(dev, "anx7625 enable dsc\n");
> +	} else {
> +		ctx->dsc.dsc_version_major = 0;
> +		ctx->dsc.dsc_version_minor = 0;
> +		dev_dbg(dev, "anx7625 disable dsc\n");
> +	}
> +}
> +
>  static void anx7625_bridge_mode_set(struct drm_bridge *bridge,
>  				    const struct drm_display_mode *old_mode,
>  				    const struct drm_display_mode *mode)
> @@ -2244,6 +2415,8 @@ static void anx7625_bridge_mode_set(struct drm_bridge *bridge,
>  	DRM_DEV_DEBUG_DRIVER(dev, "vsync_end(%d),vtotal(%d).\n",
>  			     mode->vsync_end,
>  			     mode->vtotal);
> +
> +	anx7625_dsc_enable(ctx, anx7625_dsc_check(ctx));
>  }
>  
>  static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
> @@ -2258,10 +2431,6 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
>  
>  	DRM_DEV_DEBUG_DRIVER(dev, "drm mode fixup set\n");
>  
> -	/* No need fixup for external monitor */
> -	if (!ctx->pdata.panel_bridge)
> -		return true;
> -
>  	hsync = mode->hsync_end - mode->hsync_start;
>  	hfp = mode->hsync_start - mode->hdisplay;
>  	hbp = mode->htotal - mode->hsync_end;
> @@ -2272,12 +2441,24 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
>  			     hsync, hfp, hbp, adj->clock);
>  	DRM_DEV_DEBUG_DRIVER(dev, "hsync_start(%d), hsync_end(%d), htot(%d)\n",
>  			     adj->hsync_start, adj->hsync_end, adj->htotal);
> -
>  	adj_hfp = hfp;
>  	adj_hsync = hsync;
>  	adj_hbp = hbp;
>  	adj_hblanking = hblanking;
>  
> +	if (mode->clock > DSC_PIXEL_CLOCK) {
> +		adj_hsync = DSC_HSYNC_LEN;
> +		adj_hfp = DSC_HFP_LEN;
> +		adj_hbp = DSC_HBP_LEN;
> +		vref = (u32)div_u64((u64)adj->clock * 1000 * 1000,
> +				    adj->htotal * adj->vtotal);
> +		goto calculate_timing;
> +	}
> +
> +	/* No need fixup for external monitor */
> +	if (!ctx->pdata.panel_bridge)
> +		return true;
> +
>  	/* HFP needs to be even */
>  	if (hfp & 0x1) {
>  		adj_hfp += 1;
> @@ -2349,6 +2530,8 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
>  			adj_hfp -= delta_adj;
>  	}
>  
> +calculate_timing:
> +
>  	DRM_DEV_DEBUG_DRIVER(dev, "after mode fixup\n");
>  	DRM_DEV_DEBUG_DRIVER(dev, "hsync(%d), hfp(%d), hbp(%d), clock(%d)\n",
>  			     adj_hsync, adj_hfp, adj_hbp, adj->clock);
> @@ -2357,6 +2540,10 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
>  	adj->hsync_start = adj->hdisplay + adj_hfp;
>  	adj->hsync_end = adj->hsync_start + adj_hsync;
>  	adj->htotal = adj->hsync_end + adj_hbp;
> +	if (mode->clock > DSC_PIXEL_CLOCK)
> +		adj->clock = (u32)div_u64((u64)vref * adj->htotal * adj->vtotal,
> +					  1000 * 1000);
> +
>  	DRM_DEV_DEBUG_DRIVER(dev, "hsync_start(%d), hsync_end(%d), htot(%d)\n",
>  			     adj->hsync_start, adj->hsync_end, adj->htotal);
>  

-- 
With best wishes
Dmitry
