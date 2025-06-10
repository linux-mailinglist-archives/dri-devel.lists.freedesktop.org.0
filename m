Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BDEAD45BD
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 00:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E2C10E5DC;
	Tue, 10 Jun 2025 22:14:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PmLD9O9L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB6710E5DE
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 22:13:57 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPv0O012141
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 22:13:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Om5CnCqBrphXA78M8+yvq9Gl
 bcxxbkcFH/cFOjrYlio=; b=PmLD9O9L8IonovYOqFTMd5qXv6tHnFtJyIECGbO6
 13U3KoU7TCkmdKWICdAk7nrZ4Z8L1zssLa2wCjOJNNqfDjJA/p0yXen+kJFAu1Yl
 BFJPEz8gWndej4RGxMFEpX83tRuMc62VbWfZTEZEsQZYZIh7cN4ZP7Xh/GJ1qI6u
 Ayh/6Gr0QH40DbRsWpVdEaFDF3d6ZieBtTPoz/CDSkWdkj2g/1TUToBFUBxowsYF
 8d7b74SRWRyGoToE7qT/0BwF3VGLAJqhAiVt3rwixIcCxEajJABasE1h/+zV2Bwe
 kEtwKrrsF1hk2V4Jn+N7I+klosSUJZ52A9Acy0xAsn8QOg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxu6yu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 22:13:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c791987cf6so1107990485a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 15:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749593628; x=1750198428;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Om5CnCqBrphXA78M8+yvq9GlbcxxbkcFH/cFOjrYlio=;
 b=uHoCBaUSjdx7v75wnVFsf2h3I4wgR/Eo8ZUmsYBt4aDctqpwIMq1MMoAzIcGn6cw0l
 c7iMlWTHlJg7crnOXM8Lw0yY6GvfK7ykgNS+hsejYPQTTH+YM6y7n7l7BCfVeZVLUdVJ
 PWcmG+YGIxZ8rpFGMsgpJapqjX4tkmrkCnpcvHW/e7TzLYsPG9noXb3ra0qFc6XrBQCF
 cf5+iaXOMIDwZcfd7DgiLNkF+0Busmnf3enPDcZJLIKu5tO4zcxZI+Oj8T1geU3WSPWH
 xT00+E+vD4sgUIiM3hy7tqox8AczoeYHyfIBEenpmX8J2AUR+Ft0YLw9Rp0YI+cStEon
 0/kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5Unf5AeYJU2Je6LMhzM5/9HT14KtICO4dR/FPkEzHlE0I9uXafFi5apl/Qw2i5kKa8OZazySgL5E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeG+zwU3MAFY0QjIi2gu13SVXX2tbV/5VfmmGzXHOoNeAdJOda
 jZUiY5ZZ6VvUHl0eaK5NOxHxL7xZPCPe+G8AZgIykb0y/X9jTX7B308/0DWK4yKAz1AEvn/wBGm
 90kS1ZEpe1hQGqcFGlJmSZIKK6GWKdcjZV7KvraB91rCwsYl6a7MYQ1oArIsaA1g6DtbW17w=
X-Gm-Gg: ASbGnctS74v3V+hnro1RDsTdEV+6QAbk81AzA3PC34gvGBndwAYMdmffh86mnrrVbIF
 hwl0m71RZCaObFPcpGFDUOj2KpsMUJCdOIifik4NlaFUiYKipZ3KVxLMDOOMNo4YoktIJdcRc/h
 ZoFHDSN9V7L/XjgjIQ7/uboefzJnl47lNoM8FyxIWNUtbKcnLHZJWY8tncvxXdXtnX7thoCAJ/b
 qZsFc3aaoKAiR7bsrvwpt43xMlyIGSubyy8n71Lvi5ct3tonpqlwSWHZN8BvWHqf0kBfg3XBerG
 KkYNndS7SK/bc6IomJbYxVdCgpSIjgckOoa1Z9Q8MsM5G0u+1jd7T6ZePOVmxMvuJ+Skp1zfhbD
 H4Rnay12loNOQ+dzXiRkBB6sBYgnaHRp/9Ro=
X-Received: by 2002:a05:620a:1a0a:b0:7ce:c604:3f53 with SMTP id
 af79cd13be357-7d3a880db31mr144759285a.24.1749593628048; 
 Tue, 10 Jun 2025 15:13:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkR/rgawQIqItRoAtofycgRlFovtJqLTPqRUHHzSmcmfKvyj/WssHDU5FcyI0gN/rfAVoU/Q==
X-Received: by 2002:a05:620a:1a0a:b0:7ce:c604:3f53 with SMTP id
 af79cd13be357-7d3a880db31mr144756885a.24.1749593627635; 
 Tue, 10 Jun 2025 15:13:47 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55367722268sm1701751e87.112.2025.06.10.15.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 15:13:46 -0700 (PDT)
Date: Wed, 11 Jun 2025 01:13:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v3 3/4] drm/panel: Add driver for DJN HX83112B LCD panel
Message-ID: <jjfmloif6l2pljlcbo42cdxykynrl2j77n7glq7q4ka6n2bhyd@57t24neodjxn>
References: <20250610-fp3-display-v3-0-e7e7561812e1@lucaweiss.eu>
 <20250610-fp3-display-v3-3-e7e7561812e1@lucaweiss.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-fp3-display-v3-3-e7e7561812e1@lucaweiss.eu>
X-Proofpoint-GUID: qorOd9SaZ703mj-KGwbalkF5yFx72X-F
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=6848ae1f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=dlmhaOwlAAAA:8 a=0UYVBa6PcIZdzih26zYA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-ORIG-GUID: qorOd9SaZ703mj-KGwbalkF5yFx72X-F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE4MyBTYWx0ZWRfX0hEkYuI4bRDU
 6AzxwANnHqlgX2djc3daQ417uJjG+QOKwIsGb+QnFussFq2wIknWkPhrTnci2YwgbfQ8RfhMZdp
 NZGH7pDPgHXOBG5LVzqvYT+3gdDsNjD+5wcfRYFjt8dnasqZWWwWzz/ebtLd39dM7cPxuRNmeQB
 kIH0ysE/x4giE2ImvxNedDxo1fB9utDXX8FDEEAIRFfHK4vlSRQ8xfU4rpIFIGslditonNGXAXI
 lrhrALD4un/XSz/nrX9Oohmp+YyGreEehK7I6HP5MzMDrGiTvOAGEhfME6rxZcpWu+oydR+W4dv
 sMo6BDwmahTT68lT4/lZ/gH4mfUt4Ytr10lIKk0gov4fukNkDnEy6/lVaQz9xCFsZ+r9FEeiYeO
 GJhJGGAhSi2XPVcDTL3eTWA3cxVZHypzjm7cJ5dtufhNUdCoxjMfg4RTPg7dn5/j0E0oOj9V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100183
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

On Tue, Jun 10, 2025 at 09:09:21PM +0200, Luca Weiss wrote:
> Add support for the 2160x1080 LCD panel from DJN (98-03057-6598B-I)
> bundled with a HX83112B driver IC, as found on the Fairphone 3
> smartphone.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  drivers/gpu/drm/panel/Kconfig                |  10 +
>  drivers/gpu/drm/panel/Makefile               |   1 +
>  drivers/gpu/drm/panel/panel-himax-hx83112b.c | 430 +++++++++++++++++++++++++++
>  3 files changed, 441 insertions(+)

> +static int hx83112b_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct hx83112b_panel *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ret = devm_regulator_bulk_get_const(dev,
> +					    ARRAY_SIZE(hx83112b_supplies),
> +					    hx83112b_supplies,
> +					    &ctx->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ctx->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +				     "Failed to get reset-gpios\n");
> +
> +	ctx->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
> +			  MIPI_DSI_CLOCK_NON_CONTINUOUS |
> +			  MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_LPM;
> +
> +	drm_panel_init(&ctx->panel, dev, &hx83112b_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);

Please switch to devm_drm_panel_alloc(). LGTM otherwise.

> +	ctx->panel.prepare_prev_first = true;
> +
> +	ctx->panel.backlight = hx83112b_create_backlight(dsi);
> +	if (IS_ERR(ctx->panel.backlight))
> +		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
> +				     "Failed to create backlight\n");
> +
> +	drm_panel_add(&ctx->panel);
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		drm_panel_remove(&ctx->panel);
> +		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
> +	}
> +
> +	return 0;
> +}
> +

-- 
With best wishes
Dmitry
