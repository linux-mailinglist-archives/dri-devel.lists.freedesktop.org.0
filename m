Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8163DA83ED8
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 11:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8C610E857;
	Thu, 10 Apr 2025 09:34:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RcKjTUkp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F1510E857
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 09:34:20 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75LOQ010579
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 09:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ZmRk/nIWOgv0WKjyd5+0U3H1
 c1b3isz3+5TZb7AFwxY=; b=RcKjTUkpV1+Ip9JsfFTGboUJwtRZeycIawtXHmg2
 g8qibswhWrLTQkohxCw4DCQFg/osbm9t3p5GmwYxRnvmdtI7c8SlwRvEbxrUqDDx
 2ZNYunEgJxMJogZ1cWL7aIm4OWS8e7y3Ne8FnROOHwoyUrhLNQh031T2+s5zDgNe
 y/KQ1JMzhrAC0Q2IIdYoH31lCuXka6rViGBDHt6LBbiaMUgV7geSdrKY+KVEM/Hd
 H7kDeSZMovTU6eO9I2PhcWCDC3dNt94/ya6yduAsxbnLQ2p9Sl/gEcoA7UHfU4MG
 e+KFcK0JDwCb7uFX5iEuB+iBCf8V5eGxvQ5y/WrG3u+gng==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3pbf7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 09:34:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5f7210995so114906185a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 02:34:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744277658; x=1744882458;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZmRk/nIWOgv0WKjyd5+0U3H1c1b3isz3+5TZb7AFwxY=;
 b=v/GZV2/oWVyvD/61zoTbbZQKM7QHoujvBagtadWblfDK0tqObZ6LcXJfEFHVxxOhap
 94V7Bm+HDt4vaW0QkAjOgi9it+ogofnACEQeWj5iDpDY3iZ5jcOjiRjzC3Oz1Isv5VS5
 ooEXdWr2mQHlNaZ+EL42bWs4xm/YCT3D8JvVQLlkaovOqUwcn6YfjcqTgN0O9Ijz9ETN
 lWBfStNRPTB5zIoMODReYrZ1B9SoQWNRehRQ1bAZUU6GCAIIL3IOiwys+eoOxB3MYa8m
 CodjFyt7p8ejzeyNBbqJjFiPcZtXAe/L2HqD7tRPCC8rz2Egj28ATPB6hoZk1IYABvE3
 WR7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBygO345uNT4hmT754+zXQWM2TadOasL47Y2Ymg3BVVh7nG8ap3XHb/cVlhpZmE3zCLs/ibUKPDkw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0ii5WMpJCuH6gm9/J0GkOkJV52eTg9gumVTXhz7xsYRXS27G3
 roANC5qwLt8dNS9K3F2yAMuT1O8e46rTbWT434tN1ohkYUlGXw5ilF0KjxYKbvNA5qOX61+j6By
 ewvHLZJsX2E9DNQ+LT3wb9Q5W8C6fzHnCxftPFfWPXiA7BfjHiZ7fYQHc5jmfd0s6pSQ=
X-Gm-Gg: ASbGncuuAmi+wFg3loEHKNHDy2x0+8L/V4Ld4HhDFpfvJbHVGnt2xRVBeD6r15GxudB
 JgNegKFtiV6yebV0Cetq+hGNbciq9h6Ccvq6BcyGl71vsr5MgKQPWJkXRkfgAE8EDBdL18JlFSy
 f1r/4RX7f5az0y4x4iFT5yRwAQ3zsXTR10wDHsguLFvb5Zjh18yAURaKjCZahRCqjDumatYX4t1
 VvaoNc40q6Dw9o2aMLTLiZkcpHqgc60Egj3iAErd3asPahVdhhh2GPljhZaCJ7QKBD5ERR7Awjg
 PG+zsuYOvVzBhXabGVH7WCWr+cUNr9pLNhZZne/s5iCtVGRVNq4Stz35PTdTkBZ07OHhMFH1zUA
 =
X-Received: by 2002:a05:620a:4515:b0:7c5:6b46:e1ee with SMTP id
 af79cd13be357-7c7a764cb6bmr289363785a.4.1744277658385; 
 Thu, 10 Apr 2025 02:34:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnypts5J1GX80RPlq5oY/cn8YDm3EQRJ2T3Q4Cv2aNajyp1qdx8pwYcaGhZwq9M4ps0t5HMw==
X-Received: by 2002:a05:620a:4515:b0:7c5:6b46:e1ee with SMTP id
 af79cd13be357-7c7a764cb6bmr289360385a.4.1744277658046; 
 Thu, 10 Apr 2025 02:34:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d2379ddsm91750e87.63.2025.04.10.02.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 02:34:17 -0700 (PDT)
Date: Thu, 10 Apr 2025 12:34:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] drm/panel: ilitek-ili9881c: Add support for two-lane
 configuration
Message-ID: <ioput75qsjfehxqaw2vyeeogtox43cosdk65psp4t5wp737dey@p7bwaltapdng>
References: <20250408-feature_sfto340xc-v1-0-f303d1b9a996@bootlin.com>
 <20250408-feature_sfto340xc-v1-2-f303d1b9a996@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408-feature_sfto340xc-v1-2-f303d1b9a996@bootlin.com>
X-Proofpoint-GUID: ExJuSI4W2XFHtoif3SVmbYrRBm9eQiFr
X-Proofpoint-ORIG-GUID: ExJuSI4W2XFHtoif3SVmbYrRBm9eQiFr
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f7909b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=hu4IY1Pqr02MU7G1rJkA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100071
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

On Tue, Apr 08, 2025 at 05:27:01PM +0200, Kory Maincent wrote:
> Enable support for two-lane configuration which is done by setting the
> LANSEL_SW_EN and LANSEL_SW bits in the Pad Control register.
> 
> Use the dsi-lanes device tree parameter to configure the number of lanes.
> The default configuration remains set to four lanes.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 35 +++++++++++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> index 28cd7560e5db1d5734b10babdb4e4e553c6e07d0..5c429715159755df2461063dad0971642e2b9041 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -1263,6 +1263,21 @@ static int ili9881c_send_cmd_data(struct ili9881c *ctx, u8 cmd, u8 data)
>  	return 0;
>  }
>  
> +static int ili9881c_set_lanes_cfg(struct ili9881c *ctx)
> +{
> +	int ret;
> +
> +	if (ctx->dsi->lanes != 2)
> +		/* Nothing to do */
> +		return 0;
> +
> +	ret = ili9881c_switch_page(ctx, 1);
> +	if (ret)
> +		return ret;
> +
> +	return ili9881c_send_cmd_data(ctx, 0xB7, 0x3);
> +}
> +
>  static int ili9881c_prepare(struct drm_panel *panel)
>  {
>  	struct ili9881c *ctx = panel_to_ili9881c(panel);
> @@ -1295,6 +1310,10 @@ static int ili9881c_prepare(struct drm_panel *panel)
>  			return ret;
>  	}
>  
> +	ret = ili9881c_set_lanes_cfg(ctx);
> +	if (ret)
> +		return ret;
> +
>  	ret = ili9881c_switch_page(ctx, 0);
>  	if (ret)
>  		return ret;
> @@ -1504,7 +1523,7 @@ static const struct drm_panel_funcs ili9881c_funcs = {
>  static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
>  {
>  	struct ili9881c *ctx;
> -	int ret;
> +	int ret, lanes;
>  
>  	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
>  	if (!ctx)
> @@ -1545,11 +1564,23 @@ static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
>  	if (ret)
>  		return ret;
>  
> +	ret = of_property_read_u32(dsi->dev.of_node, "dsi-lanes", &lanes);

Use dsi->lanes instead.

> +	if (ret == -EINVAL) {
> +		lanes = 4;
> +	} else if (ret) {
> +		dev_err(&dsi->dev, "Failed to get dsi-lanes property (%d)\n",
> +			ret);
> +		return ret;
> +	} else if (lanes < 2 || 4 < lanes) {
> +		dev_err(&dsi->dev, "Wrong number of dsi-lanes (%d)\n", lanes);
> +		return -EINVAL;
> +	}
> +
>  	drm_panel_add(&ctx->panel);
>  
>  	dsi->mode_flags = ctx->desc->mode_flags;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
> -	dsi->lanes = 4;
> +	dsi->lanes = lanes;
>  
>  	return mipi_dsi_attach(dsi);
>  }
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
