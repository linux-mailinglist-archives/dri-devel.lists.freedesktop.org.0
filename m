Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E82B56DC9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 03:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2140E10E27C;
	Mon, 15 Sep 2025 01:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cdr20FT1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2281510E27C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 01:20:05 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EMP1on009721
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 01:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=kC3dy0Ydy9pej0oh1AKYYFVt
 Xx1bBtEXYrmcDESrP0Y=; b=Cdr20FT198HdV3ipeZN72jm9E37fw/UB0p2aVu0Z
 G1VH7b8q1/BiNY48XCEl1NlnpeCDYrEcbgjjGiohjRRdzuidl7QsyPa/JkrJ4Gcm
 cA3vCvL+65XBj9cuTkJbmW3ix/G2wUBiDoot0bM5Iwd0loigNq2T+j0jbXTWugD+
 pm6vTEhWLQkAr4FsFglqaxyIBJcKf+Rbo0bNwNcO3YUVgZc6VSF7fV7ZpG/4Z+4B
 VWdHb33bWSgCBBf0BxXhb8MGRx3zrzeK42UbZhq6+kklNCMPbhWRCf5ZYUJ+KcHH
 WNTCZem0Q9pn50eNDzSYLQCWDIye6LotDqXc6oSfzpHdMQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49510ab184-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 01:20:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b62de0167aso103221261cf.0
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Sep 2025 18:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757899203; x=1758504003;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kC3dy0Ydy9pej0oh1AKYYFVtXx1bBtEXYrmcDESrP0Y=;
 b=gDJtOpi3qDoZPqjVqas//frclgqg9qksYSVulhHIncsqHfjyfIFyXoLRCqXIZKRfvv
 VAkRhzlSnXTit3VjkOi6+YUuVaSRA7jq+9gPtfJoWV7F6erRQcXZmg+o+caJbM1ZvgVX
 oBVIfRG77/jhWg10xQ+jCdzZxzwo1g3sr8xhFzkadbDGfwKYFJbUKr1hdIBcIqeoCId+
 x4cpB3Upb7UMamOYVtqwY4+KdmuKNwx4w+kts8ZsCcpQYCRMCeLdRyFfSOcQBJetiH7b
 cQGK6b5bJ8RvMcQ6PH2qcYmjvPaaRrbMprpAZ93SjgCdQQM8aH2CceBkcjgT/96lhKxw
 f0RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWatBUYftQsfAyhEpmFdMXpTOidzFpOK1uq8SknqPgeeOo9bPNxeQN0tFUqL8DOqka2kjBqwBQu0lk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIs8cGowvngPjf6/TlV0r5i8tWAZ5XU9a2Hv+O69TJQygw2qmg
 UfOimkJLdri25dTEwBHlMPwg0GSTlNNbYIfOoJMpJBJYds9rZXDzp2SjDI6mCxcKqM9ComLF32v
 pQ/lPurYKoSyPj5hp43HlBLBrjtINouVWc+cITEtscItN3ofQ+yaR1Yy4gZQh5wuIhl65aFY=
X-Gm-Gg: ASbGncvFsHXQk/Zy82V234JHQ4bFNeTlP9Uif8LfzH7zMbMf1W2RI/Eo8+y2F7/oJfw
 nnazqT3Hn9hepDf+g/Pqh0pFySm4p6TZWOJOlGBvi+oFoMroFzt32iZ6OYd/9MuKUDB4vCoebfs
 j7YtAC24l99a9eNOP4d+QzVx70qupOSSLiIEOWgPcE9cM8Vkj2e0TOgzPA5hKqFPYohJBGGOkSS
 7n9XnER/tw3q8TLnvBUwNDHBCIFFiR7td8KQIDm1Hek6V+PLy8nH3JV+I4CPQeVrmc/7vGJy/hx
 X/2r5IIJ+DogRuuQiBP9pfJzXsRtIQSWYC2bAECA60xuubgcCDjdkAUuvixN2n0SvGoPtlgSt5L
 nAoWH63Tr3hBC+v2kxFmCbxKabOBKUBMHETDY3EfO6wVac2Cf7LQB
X-Received: by 2002:a05:622a:82:b0:4b7:9a33:20a7 with SMTP id
 d75a77b69052e-4b79a3328e6mr57012771cf.44.1757899203092; 
 Sun, 14 Sep 2025 18:20:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9CZYfSYW+TABFs6uglKtc4u48qpkkdh2gPDe08pCBH50zFvLoZZq/5tHLa55VxlaT2BybHQ==
X-Received: by 2002:a05:622a:82:b0:4b7:9a33:20a7 with SMTP id
 d75a77b69052e-4b79a3328e6mr57012481cf.44.1757899202573; 
 Sun, 14 Sep 2025 18:20:02 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-34f1a8211d6sm25824891fa.43.2025.09.14.18.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Sep 2025 18:20:00 -0700 (PDT)
Date: Mon, 15 Sep 2025 04:19:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 Yi Zhang <zhanyi@qti.qualcomm.com>
Subject: Re: [PATCH] drm/bridge: add support for lontium lt9211c bridge
Message-ID: <n3hycqdiupxhfuswrhckwel5q2qc2a354t5dueoaa3x2bviuza@xgqkkhfmr5o4>
References: <20250911-lt9211c-bridge-support-v1-1-c221202cbcd5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-lt9211c-bridge-support-v1-1-c221202cbcd5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I/plRMgg c=1 sm=1 tr=0 ts=68c769c4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=QKdoYT3tgUPYWJkqUfMA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzMiBTYWx0ZWRfX83VQiYsV/ssn
 CXYuvy+evTILTFmaMTpVvzt6moEuB6oUuHaXJVSthN3eBhv9gwxjZEqhtxmi9TlPdSAf71BIcsU
 MAA/s8BxhJSS7GJPeXtK1Lu6DsV78iKBIw4UiQJqIA3Q3sNlls/bRJhWm+An1eKvF5bDjJBbWNg
 9fEVtxSg/Mb83YTDhJenO+CgW4APW6FiACnNEb0kGozw+l/heaDunrYenGCBtLB+FKT8iZ8cGVn
 19XlIyKTAz3NtyGRDK+HbzmccwISRq6/5rz8jmg0T/yrFRBCu5z8V7KardOshd/B3BnzPHsjfH2
 PTr+GIdXIueijPID8Eaf8XCWrjPI98evXsTyVZD00K6bR04XWiioWEVimsClZv2iQtq+X7MrxR0
 0F9kC6ud
X-Proofpoint-ORIG-GUID: WzqLON7WGOEWq4Gh9wpmiSiBvENluipU
X-Proofpoint-GUID: WzqLON7WGOEWq4Gh9wpmiSiBvENluipU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130032
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

On Thu, Sep 11, 2025 at 08:25:27PM +0530, Nilesh Laad wrote:
> From: Yi Zhang <zhanyi@qti.qualcomm.com>
> 
> LT9211c is a Single/Dual-Link DSI/LVDS or Single DPI input to
> Single-link/Dual-Link DSI/LVDS or Single DPI output bridge chip.
> Add support for DSI to LVDS bridge configuration.
> 
> Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
> Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>

Please send the driver together with the bindings, in one series.

The driver looks pretty similar to the existing LT9211 driver. Please
explain why you can't extend that one.

> ---
>  drivers/gpu/drm/bridge/Kconfig           |   13 +
>  drivers/gpu/drm/bridge/Makefile          |    1 +
>  drivers/gpu/drm/bridge/lontium-lt9211c.c | 1105 ++++++++++++++++++++++++++++++
>  3 files changed, 1119 insertions(+)
> 
> +	const struct reg_sequence lt9211c_tx_ssc_seq[] = {
> +		{ 0x8234, 0x00 },
> +		{ 0x856e, 0x10 },
> +		{ 0x8181, 0x15 },
> +		{ 0x871e, 0x00 },
> +		{ 0x8717, 0x02 },
> +		{ 0x8718, 0x04 },
> +		{ 0x8719, 0xd4 },
> +		{ 0x871A, 0x00 },
> +		{ 0x871B, 0x12 },
> +		{ 0x871C, 0x00 },
> +		{ 0x871D, 0x24 },
> +		{ 0x871F, 0x1c },

lowercase the hex, please.

> +		{ 0x8720, 0x00 },
> +		{ 0x8721, 0x00 },
> +		{ 0x871e, 0x02 },
> +	};
> +

[...]

> +
> +static void lt9211c_atomic_enable(struct drm_bridge *bridge,
> +				struct drm_atomic_state *state)
> +{
> +	struct lt9211c *ctx = bridge_to_lt9211c(bridge);
> +	const struct drm_bridge_state *bridge_state;
> +	const struct drm_crtc_state *crtc_state;
> +	struct drm_connector *connector;
> +	struct drm_crtc *crtc;
> +	u32 bus_flags;
> +	int ret;
> +
> +	ret = regulator_enable(ctx->vccio);
> +	if (ret) {
> +		dev_err(ctx->dev, "Failed to enable vccio: %d\n", ret);
> +		return;
> +	}
> +
> +	/* Deassert reset */
> +	gpiod_set_value(ctx->reset_gpio, 1);
> +	usleep_range(20000, 21000);	/* Very long post-reset delay. */
> +
> +	/* Get the LVDS format from the bridge state. */
> +	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
> +	bus_flags = bridge_state->output_bus_cfg.flags;
> +	ctx->de = !!(bus_flags & DRM_BUS_FLAG_DE_HIGH);
> +
> +	switch (bridge_state->output_bus_cfg.format) {
> +	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
> +		ctx->bpp24 = false;
> +		ctx->jeida = true;
> +		break;
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> +		ctx->bpp24 = true;
> +		ctx->jeida = true;
> +		break;
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> +		ctx->bpp24 = true;
> +		ctx->jeida = false;
> +		break;
> +	default:
> +		/*
> +		 * Some bridges still don't set the correct
> +		 * LVDS bus format, use SPWG24 default
> +		 * format until those are fixed.
> +		 */
> +		ctx->bpp24 = true;
> +		ctx->jeida = false;
> +		dev_warn(ctx->dev,
> +			 "Unsupported LVDS bus format 0x%04x\n",
> +			 bridge_state->output_bus_cfg.format);
> +		break;
> +	}
> +
> +	/*
> +	 * Retrieve the CRTC adjusted mode. This requires a little dance to go
> +	 * from the bridge to the encoder, to the connector and to the CRTC.
> +	 */
> +	connector = drm_atomic_get_new_connector_for_encoder(state,
> +							     bridge->encoder);
> +	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
> +	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +	drm_mode_copy(&ctx->mode, &crtc_state->adjusted_mode);
> +
> +	dev_dbg(ctx->dev, "width=%d,height=%d,clock=%d\n",
> +			ctx->mode.hdisplay,
> +			ctx->mode.vdisplay,
> +			ctx->mode.clock);
> +
> +	ret = lt9211c_read_chipid(ctx);
> +	if (ret)
> +		return;
> +
> +	/* Lt9211c must enable after mipi clock enable */
> +	queue_delayed_work(ctx->wq, &ctx->lt9211c_dw,
> +		msecs_to_jiffies(100));

At this point MIPI clock should be enabled.

> +
> +	dev_dbg(ctx->dev, "LT9211 enabled.\n");
> +}
> +

[...]

> +
> +MODULE_DESCRIPTION("Lontium LT9211C DSI/LVDS/DPI bridge driver");
> +MODULE_LICENSE("GPL");

Missing MODULE_AUTHOR

> 
> ---
> base-commit: f50b969bafafb2810a07f376387350c4c0d72a21
> change-id: 20250911-lt9211c-bridge-support-9209f7cc7697
> prerequisite-message-id: <20250910-add-lt9211c-bridge-v1-1-4f23740fe101@oss.qualcomm.com>
> prerequisite-patch-id: 79524a1aaba6b39f49603db725539cf11176820b
> 
> Best regards,
> --  
> Nilesh Laad <nilesh.laad@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
