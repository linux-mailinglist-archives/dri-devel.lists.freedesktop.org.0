Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F6EA9D763
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 05:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F216A10E030;
	Sat, 26 Apr 2025 03:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bct77xIn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A9610E030
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 03:31:48 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGKMIW001950
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 03:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=nb2+1xFk7BZuxdwzNv1w1PjS
 dGuUBpiFl52TtbVo8Lg=; b=bct77xInLU4F/Zg4JqSihOVKoczpiYloGZcTT9b7
 GNIKcMGKBkFPLIfubEngoYMtVx6tjfDkMFp/ptk0n7Yhgbs22m9tFYqxC5XdU80S
 u/wsvAZ2d0FI5rt6slKXUVpmXNLRxKQteHFZQAbaoZ5RJmiORV4/Sj4zJohztTPv
 DmxqVdWgFog10Y6Q1y/vnNiX2j4aoyvrW/RqHtPhEoVBfKeQlO35wLE65Wx6UuJa
 tT8b7cBVCobhbt8QgDayaFfA13c/ikFyzxRWMwacXpK6qYAhWCF25KXH/jNOX5oQ
 elc7CVBBW6uLyc4tmGtElF+959N7mtYyi8MLUJuslsMMnQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3jt2w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 03:31:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5e28d0cc0so493532885a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 20:31:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745638302; x=1746243102;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nb2+1xFk7BZuxdwzNv1w1PjSdGuUBpiFl52TtbVo8Lg=;
 b=PBGVklBnB/tzra8Pgl+WB8B3dINzvRI5e0X3ViOKiST8dihwUshdRmlos1sly6TRRI
 3vCwdWWCxsksd5FLpz6gMhhcFRYyas65x9WqmVcnZc6DpYonWWZbGl8bh7aSPBTiRfX6
 RQIJwtrer48iRJKT5gqwrEBtyoTZnTOWXjsZ9dATrSX6Ff9crKnDgdUR+8RwIk/M0AOG
 /Ans+QfmynY5wmEhzTwEIyH5wVL839+1EsHJvkNR5u+9V5i65re496K+vI0DyL4ELGZ8
 P4nU3Fxl+1tsHsp0JCr5nuE1TvL0QTLUb40FRN0if6ZdC1hAWpM2BsGJpfBpiO+wKM+y
 Kk6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfgkeX34gsgxWDaJBYvM/s5aMQ2QZjvWkizJohsdLnhl6pWc5IzSvMkPAMe14Qu9YmdBwyTIOEwio=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3kMadLr+i6EXveMshOcn76Ksqh8Q4zy1wFd0wPRDrO9hEvU9y
 EeTwhmaRMsvAKHRYI7ORL2sUOxpIbI3Fwob7SZyED6+Z60iMpkY3cdu/+XGFPX6A0jpUmMpmezJ
 V8bnhlUSY8uzqR/mUCz3kXwpB2iePQ6/FuEcIk/14oyVu72/BXB7WEbOr1nYuihMHZAY=
X-Gm-Gg: ASbGncvdc3RmPLJb2HCtMrF2RsP2YSZ1zUFSxeMzGnubnrFFdE2n+B07oj36k0HLsIW
 XStF/c4NYt7YIq7kf5N3cqXqMLR7hkI2CVvSwmzOBtNjLzWve0dGhHeZlgamiiRYw33ILx6M4CU
 pbfkK28vYZCTWAGO8ILy4GzLMSHpKBGHwpGQYMDjVlUb8mg+zJm9o3Y6ZUTCvvkfgbXn4gNkUEY
 h0PGyUqNL5q56vN1GZ6P/ttO8DDgQfsdVoyuiIYWYmnCpx/x9kZK6Uj/LC6+25ruLf2WpJFgxLa
 86iubaK6Kmgu4EPgzW8ZBVOpUaTNEpMIxotGoGCEFdQDjKDEU4zmCD0lw7u3Xcz5IojPJI8Bn0w
 =
X-Received: by 2002:a05:620a:410f:b0:7c5:a951:3518 with SMTP id
 af79cd13be357-7c9619dee3dmr565507285a.39.1745638301652; 
 Fri, 25 Apr 2025 20:31:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPsDVbT5wRnNn3wZRbjqS3ukXEBA3GuxdZEx/4kBmATEj4JvK+jgHrnp1useeN5CfFa4sw5Q==
X-Received: by 2002:a05:620a:410f:b0:7c5:a951:3518 with SMTP id
 af79cd13be357-7c9619dee3dmr565505085a.39.1745638301308; 
 Fri, 25 Apr 2025 20:31:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d16a84a7sm10432701fa.80.2025.04.25.20.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 20:31:40 -0700 (PDT)
Date: Sat, 26 Apr 2025 06:31:38 +0300
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
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v2 3/5] drm/panel: ilitek-ili9881c: Add support for
 two-lane configuration
Message-ID: <ng2vjguqrfrxhw6vdzcrrlzegkepfvzwz24zj2fqddkt2df3mw@7biqwyndc2vz>
References: <20250424-feature_sfto340xc-v2-0-ff7da6192df2@bootlin.com>
 <20250424-feature_sfto340xc-v2-3-ff7da6192df2@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-feature_sfto340xc-v2-3-ff7da6192df2@bootlin.com>
X-Proofpoint-ORIG-GUID: FmWegDggQ3WYyvHqk1k1irPu3mT413P8
X-Proofpoint-GUID: FmWegDggQ3WYyvHqk1k1irPu3mT413P8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAyNCBTYWx0ZWRfX8APDgVqd3pIt
 eD4RIMjxaB9i66dCf69Izcz0Q3vtzLRYowDLAbEMeVuZnYu0wbmZ4buFJmYDJYTY1n2rfl7Hizy
 KsiC6RmXaOhZenV8tbcw3gc0AsaqbCzyo2kwGLmN50kGdHTPz4knu+piS2otDFJ3IhCqtql3BS8
 yymSy+P+dFIf+nXvN+UwekD1DMhioH9AI7o9waNl5wNTiBWDNpzh/7x/aDhfDzeeOz0R4riHdyb
 DURocbUBdcd3f7J8nSjSion9nSzZqyFtJFxohZDNPSelGHqtMu/KXv8KP7tR/wbFD7irTeVLRNl
 mv8qeX2QZ29h7AlsI5iKKQDJLWdB2P4C1CdR5EoPWSF9bydQ+8T5YBVaC4gPGGyplegXuBfn/Sz
 DZgULUXdf77y5MeT2khcH58bDu2T7l/2p0GdghvixYjzarQ54+jBJjyCIErmWUycX7K0BAJR
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680c539f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=80Bd5mv2Iwua2QL-_kwA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260024
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

On Thu, Apr 24, 2025 at 05:07:41PM +0200, Kory Maincent wrote:
> Enable support for two-lane configuration which is done by setting the
> LANSEL_SW_EN and LANSEL_SW bits in the Pad Control register.
> 
> Use the data-lanes device tree parameter to configure the number of lanes.
> The default configuration remains set to four lanes.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
> 
> Change in v2:
> - Read the data-lanes parameter from the port endpoint and use
>   drm_of_get_data_lanes_count instead of of_property_read_u32.
> ---
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 33 +++++++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> index 28cd7560e5db1d5734b10babdb4e4e553c6e07d0..2e38dea28336f445cb6a074dbbec006f0659287a 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -16,6 +16,7 @@
>  
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_modes.h>
> +#include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
>  
>  #include <video/mipi_display.h>
> @@ -1263,6 +1264,21 @@ static int ili9881c_send_cmd_data(struct ili9881c *ctx, u8 cmd, u8 data)
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
> @@ -1295,6 +1311,10 @@ static int ili9881c_prepare(struct drm_panel *panel)
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
> @@ -1503,8 +1523,9 @@ static const struct drm_panel_funcs ili9881c_funcs = {
>  
>  static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
>  {
> +	struct device_node *endpoint;
>  	struct ili9881c *ctx;
> -	int ret;
> +	int ret, lanes;
>  
>  	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
>  	if (!ctx)
> @@ -1545,11 +1566,19 @@ static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
>  	if (ret)
>  		return ret;
>  
> +	endpoint = of_graph_get_endpoint_by_regs(dsi->dev.of_node, -1, -1);
> +	lanes = drm_of_get_data_lanes_count(endpoint, 2, 4);
> +	of_node_put(endpoint);

I think you can use drm_of_get_data_lanes_count_ep() here.

> +	if (lanes == -EINVAL)
> +		lanes = 4;
> +	else if (lanes < 0)
> +		return lanes;
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
