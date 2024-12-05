Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4217E9E5DB2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 18:54:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0480B10EF59;
	Thu,  5 Dec 2024 17:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="BvN0yct0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A583C10EF58
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 17:54:11 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaMuY015782;
 Thu, 5 Dec 2024 17:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MdNclNjeSKNYclxADpDhRwaPZjdeDgh7nycQPLeeEoc=; b=BvN0yct0+t0xSfM3
 dBJlzi/4XyXO/GMDzijYkE/LDb5nZ5OWrnOeITiyYEnJ2qw3lJ7rhLlg+f5MISgG
 vGs1lUATmIuTHdxzFlWgKPoKa2Z++lZFgOW+rCHUOgIcv+w+3J0ppTrMY0HnpQ+y
 H69YMSATMTHUJ2Ph99Jf9TC2kX2T2y1pm3XzhIufdEqcogz/W5lm6ohyMjv1bx11
 25XVcn9dlM5aljtC95WZw6Iq8zb+WcbvFlBDoyRgK/HUwMcVLTcaTWHBoWjYN89J
 Ta5aZ02UG5X2RwRjZ66RnJeAYc2d/uxt2LS0yC33BpTodrzMUmCJBVEhkLtu62b5
 CQJC2g==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbnmh0ku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Dec 2024 17:54:04 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B5Hs3Xi019178
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 5 Dec 2024 17:54:03 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 09:54:03 -0800
Message-ID: <e4bf2d14-395a-4147-97f1-e5fb41669822@quicinc.com>
Date: Thu, 5 Dec 2024 09:54:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panel: visionox-rm69299: Remove redundant
 assignments of panel fields
To: Chen-Yu Tsai <wenst@chromium.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241204093942.1374693-1-wenst@chromium.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20241204093942.1374693-1-wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ygAMV1OvSlLWJ0XwUx1BKKD1qQ0MU8MJ
X-Proofpoint-GUID: ygAMV1OvSlLWJ0XwUx1BKKD1qQ0MU8MJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 adultscore=0 clxscore=1011 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050131
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



On 12/4/2024 1:39 AM, Chen-Yu Tsai wrote:
> drm_panel_init() was made to initialize the fields in |struct drm_panel|.
> There is no need to separately initialize them again.
> 
> Drop the separate assignments that are redundant. Also fix up any uses
> of `ctx->panel.dev` to use `dev` directly.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
> Changes since v1:
> - Also fix uses of `ctx->panel.dev`
> 
>   drivers/gpu/drm/panel/panel-visionox-rm69299.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> index 272490b9565b..be3a9797fbce 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> @@ -193,7 +193,6 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
>   
>   	mipi_dsi_set_drvdata(dsi, ctx);
>   
> -	ctx->panel.dev = dev;
>   	ctx->dsi = dsi;
>   
>   	ctx->supplies[0].supply = "vdda";
> @@ -201,13 +200,11 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
>   	ctx->supplies[1].supply = "vdd3p3";
>   	ctx->supplies[1].init_load_uA = 13200;
>   
> -	ret = devm_regulator_bulk_get(ctx->panel.dev, ARRAY_SIZE(ctx->supplies),
> -				      ctx->supplies);
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies), ctx->supplies);
>   	if (ret < 0)
>   		return ret;
>   
> -	ctx->reset_gpio = devm_gpiod_get(ctx->panel.dev,
> -					 "reset", GPIOD_OUT_LOW);
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>   	if (IS_ERR(ctx->reset_gpio)) {
>   		dev_err(dev, "cannot get reset gpio %ld\n", PTR_ERR(ctx->reset_gpio));
>   		return PTR_ERR(ctx->reset_gpio);
> @@ -215,8 +212,6 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
>   
>   	drm_panel_init(&ctx->panel, dev, &visionox_rm69299_drm_funcs,
>   		       DRM_MODE_CONNECTOR_DSI);
> -	ctx->panel.dev = dev;
> -	ctx->panel.funcs = &visionox_rm69299_drm_funcs;
>   	drm_panel_add(&ctx->panel);
>   
>   	dsi->lanes = 4;
> -- 
> 2.47.0.338.g60cca15819-goog
> 

