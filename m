Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9F183E55F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 23:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6858A10FF70;
	Fri, 26 Jan 2024 22:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AB810FF6F;
 Fri, 26 Jan 2024 22:25:59 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40QM1FQb002837; Fri, 26 Jan 2024 22:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=u/55wnDM2O25v/XLbI4dGn+shzkPTv2rqVUgsk7jRHk=; b=jZ
 F9vLIoBs/sH6ezpejOxuV1j1Ua5fqc3rhCPib12SVHe8hxfZjxKd1S6+mHZUZxhc
 SrWzGblqjtv3+xDp/7JWaT0lCEGfptCELIGKgt/tmuES0dkzOUFG4nae2ci5Pet5
 eXddoB9wHNJ/uBchSx0m3VsLjFxA5jkIz9ZAZNZdfSJKonRyL/f8L3kAwTleJDiq
 c+ZGnGoXt8/jjQUDEBqlwFUQHWPi5TdyuaHpgpRf1pd2vqCELPFTd/HVnji+m3oS
 IzHAKa7Pguf0QliPvdpj4HM5JwXD8SgRo/BOXM2bRNHOXUDlUsvKJGLazxGG20KX
 uN1B1l1ttSXhMIpr6xmQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvmmmg35f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 22:25:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QMPrRV016097
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 22:25:53 GMT
Received: from [10.110.48.234] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 14:25:52 -0800
Message-ID: <f5b431ed-cd86-0706-97b9-723dbbd69393@quicinc.com>
Date: Fri, 26 Jan 2024 14:25:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v3 15/15] drm/msm/dp: drop dp_parser
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd
 <swboyd@chromium.org>
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
 <20240126-dp-power-parser-cleanup-v3-15-098d5f581dd3@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-15-098d5f581dd3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: GCo9OGaY58g8F2U4bm_2r38x8_m4jzdT
X-Proofpoint-ORIG-GUID: GCo9OGaY58g8F2U4bm_2r38x8_m4jzdT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 mlxscore=0 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401260164
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/26/2024 10:26 AM, Dmitry Baryshkov wrote:
> Finally drop separate "parsing" submodule. There is no need in it
> anymore. All submodules handle DT properties directly rather than
> passing them via the separate structure pointer.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/Makefile        |  1 -
>   drivers/gpu/drm/msm/dp/dp_aux.h     |  1 +
>   drivers/gpu/drm/msm/dp/dp_catalog.h |  1 -
>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 +-
>   drivers/gpu/drm/msm/dp/dp_debug.c   |  1 -
>   drivers/gpu/drm/msm/dp/dp_display.c | 18 +++++------
>   drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
>   drivers/gpu/drm/msm/dp/dp_parser.c  | 61 -------------------------------------
>   drivers/gpu/drm/msm/dp/dp_parser.h  | 39 ------------------------
>   9 files changed, 12 insertions(+), 115 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 8dbdf3fba69e..543e04fa72e3 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -127,7 +127,6 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
>   	dp/dp_drm.o \
>   	dp/dp_link.o \
>   	dp/dp_panel.o \
> -	dp/dp_parser.o \
>   	dp/dp_audio.o
>   
>   msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
> index 16d9b1758748..f47d591c1f54 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.h
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.h
> @@ -16,6 +16,7 @@ void dp_aux_init(struct drm_dp_aux *dp_aux);
>   void dp_aux_deinit(struct drm_dp_aux *dp_aux);
>   void dp_aux_reconfig(struct drm_dp_aux *dp_aux);
>   
> +struct phy;
>   struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
>   			      struct phy *phy,
>   			      bool is_edp);
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 989e4c4fd6fa..a724a986b6ee 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -8,7 +8,6 @@
>   
>   #include <drm/drm_modes.h>
>   
> -#include "dp_parser.h"
>   #include "disp/msm_disp_snapshot.h"
>   
>   /* interrupts */
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 6e9f375b856a..fa014cee7e21 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -9,7 +9,6 @@
>   #include "dp_aux.h"
>   #include "dp_panel.h"
>   #include "dp_link.h"
> -#include "dp_parser.h"
>   #include "dp_catalog.h"
>   
>   struct dp_ctrl {
> @@ -17,6 +16,8 @@ struct dp_ctrl {
>   	bool wide_bus_en;
>   };
>   
> +struct phy;
> +
>   int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
>   int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train);
>   void dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
> diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
> index 6c281dc095b9..ac68554801a4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> @@ -9,7 +9,6 @@
>   #include <drm/drm_connector.h>
>   #include <drm/drm_file.h>
>   
> -#include "dp_parser.h"
>   #include "dp_catalog.h"
>   #include "dp_aux.h"
>   #include "dp_ctrl.h"
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index de1306a88748..67956e34436d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -9,12 +9,12 @@
>   #include <linux/debugfs.h>
>   #include <linux/component.h>
>   #include <linux/of_irq.h>
> +#include <linux/phy/phy.h>
>   #include <linux/delay.h>
>   #include <drm/display/drm_dp_aux_bus.h>
>   
>   #include "msm_drv.h"
>   #include "msm_kms.h"
> -#include "dp_parser.h"
>   #include "dp_ctrl.h"
>   #include "dp_catalog.h"
>   #include "dp_aux.h"
> @@ -87,7 +87,6 @@ struct dp_display_private {
>   	struct drm_device *drm_dev;
>   	struct dentry *root;
>   
> -	struct dp_parser  *parser;
>   	struct dp_catalog *catalog;
>   	struct drm_dp_aux *aux;
>   	struct dp_link    *link;
> @@ -704,14 +703,11 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
>   	struct dp_panel_in panel_in = {
>   		.dev = dev,
>   	};
> +	struct phy *phy;
>   
> -	dp->parser = dp_parser_get(dp->dp_display.pdev);
> -	if (IS_ERR(dp->parser)) {
> -		rc = PTR_ERR(dp->parser);
> -		DRM_ERROR("failed to initialize parser, rc = %d\n", rc);
> -		dp->parser = NULL;
> -		goto error;
> -	}
> +	phy = devm_phy_get(dev, "dp");
> +	if (IS_ERR(phy))
> +		return PTR_ERR(phy);
>   
>   	dp->catalog = dp_catalog_get(dev);
>   	if (IS_ERR(dp->catalog)) {
> @@ -722,7 +718,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
>   	}
>   
>   	dp->aux = dp_aux_get(dev, dp->catalog,
> -			     dp->parser->phy,
> +			     phy,
>   			     dp->dp_display.is_edp);
>   	if (IS_ERR(dp->aux)) {
>   		rc = PTR_ERR(dp->aux);
> @@ -753,7 +749,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
>   
>   	dp->ctrl = dp_ctrl_get(dev, dp->link, dp->panel, dp->aux,
>   			       dp->catalog,
> -			       dp->parser->phy);
> +			       phy);
>   	if (IS_ERR(dp->ctrl)) {
>   		rc = PTR_ERR(dp->ctrl);
>   		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 70759dd1bfd0..234dada88687 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -10,6 +10,8 @@
>   #include <sound/hdmi-codec.h>
>   #include "disp/msm_disp_snapshot.h"
>   
> +#define DP_MAX_PIXEL_CLK_KHZ	675000
> +
>   struct msm_dp {
>   	struct drm_device *drm_dev;
>   	struct platform_device *pdev;
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> deleted file mode 100644
> index f95ab3c5c72c..000000000000
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
> - */
> -
> -#include <linux/of_gpio.h>
> -#include <linux/phy/phy.h>
> -
> -#include <drm/drm_of.h>
> -#include <drm/drm_print.h>
> -#include <drm/drm_bridge.h>
> -
> -#include "dp_parser.h"
> -#include "dp_reg.h"
> -
> -static int dp_parser_ctrl_res(struct dp_parser *parser)
> -{
> -	struct platform_device *pdev = parser->pdev;
> -
> -	parser->phy = devm_phy_get(&pdev->dev, "dp");
> -	if (IS_ERR(parser->phy))
> -		return PTR_ERR(parser->phy);
> -
> -	return 0;
> -}
> -
> -static int dp_parser_parse(struct dp_parser *parser)
> -{
> -	int rc = 0;
> -
> -	if (!parser) {
> -		DRM_ERROR("invalid input\n");
> -		return -EINVAL;
> -	}
> -
> -	rc = dp_parser_ctrl_res(parser);
> -	if (rc)
> -		return rc;
> -
> -	return 0;
> -}
> -
> -struct dp_parser *dp_parser_get(struct platform_device *pdev)
> -{
> -	struct dp_parser *parser;
> -	int ret;
> -
> -	parser = devm_kzalloc(&pdev->dev, sizeof(*parser), GFP_KERNEL);
> -	if (!parser)
> -		return ERR_PTR(-ENOMEM);
> -
> -	parser->pdev = pdev;
> -
> -	ret = dp_parser_parse(parser);
> -	if (ret) {
> -		dev_err(&pdev->dev, "device tree parsing failed\n");
> -		return ERR_PTR(ret);
> -	}
> -
> -	return parser;
> -}
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> deleted file mode 100644
> index 38fd335d5950..000000000000
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
> - */
> -
> -#ifndef _DP_PARSER_H_
> -#define _DP_PARSER_H_
> -
> -#include <linux/platform_device.h>
> -
> -#include "msm_drv.h"
> -
> -#define DP_MAX_PIXEL_CLK_KHZ	675000
> -
> -/**
> - * struct dp_parser - DP parser's data exposed to clients
> - *
> - * @pdev: platform data of the client
> - * @phy: PHY handle
> - */
> -struct dp_parser {
> -	struct platform_device *pdev;
> -	struct phy *phy;
> -};
> -
> -/**
> - * dp_parser_get() - get the DP's device tree parser module
> - *
> - * @pdev: platform data of the client
> - * return: pointer to dp_parser structure.
> - *
> - * This function provides client capability to parse the
> - * device tree and populate the data structures. The data
> - * related to clock, regulators, pin-control and other
> - * can be parsed using this module.
> - */
> -struct dp_parser *dp_parser_get(struct platform_device *pdev);
> -
> -#endif
>
