Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E230396FDF4
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2024 00:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217F310EB18;
	Fri,  6 Sep 2024 22:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="GtzqpDIQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2954A10EB18
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 22:28:58 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 486IdadR001123;
 Fri, 6 Sep 2024 22:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 A0fMNr5wag5DEeQGPGtu1HaQYDHDG1GM+re7H6tfCws=; b=GtzqpDIQgT9gCsKD
 6VgYpFRWk1wWTlwZanidjoaIjsYJ5rSY1iehHvFw1r6jr2AGPqJlEfPcV7qUbbhA
 4xurnEfyuAsXD1cqrQAJRPzgotjIO5wdhMwSxnPGhBblHz+4Wz8cn+uMQMHrYn5h
 J5dCb0CEsUowvTKOY2LkNjwC6RDmrYWO8bG4YsIUOydutjzg4LmGmdUomwsykNP8
 8pPdj9Qu6RfVj6BY0vN1V4dXuYsOepqcffUfoXvDsfptSxu6XIfvPt8vEe41ngbM
 hWwldXpbXuxFkjPU++6U3qmEeBTv3Gy2XTZ1gCf5L4jBPOFOxlW4RFbX3gnKZ9lz
 MFLCcg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwtbnbj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Sep 2024 22:28:50 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 486MSnaG021912
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Sep 2024 22:28:49 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Sep 2024
 15:28:49 -0700
Message-ID: <519bdbd1-0cf6-43e1-b593-35001624cef6@quicinc.com>
Date: Fri, 6 Sep 2024 15:28:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: samsung-s6e3fa7: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>, <neil.armstrong@linaro.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>
CC: <dianders@chromium.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20240902071019.351158-1-tejasvipin76@gmail.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240902071019.351158-1-tejasvipin76@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 5VnrBDvKoPWT9VDSTtmCDxyZk_dNspMd
X-Proofpoint-ORIG-GUID: 5VnrBDvKoPWT9VDSTtmCDxyZk_dNspMd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_07,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409060167
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



On 9/2/2024 12:10 AM, Tejas Vipin wrote:
> Changes the samsung-s6e3fa7 panel to use multi style functions for
> improved error handling.
> 
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c | 71 ++++++-------------
>   1 file changed, 21 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c b/drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c
> index 10bc8fb5f1f9..27a059b55ae5 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c
> @@ -38,57 +38,38 @@ static void s6e3fa7_panel_reset(struct s6e3fa7_panel *ctx)
>   	usleep_range(10000, 11000);
>   }
>   
> -static int s6e3fa7_panel_on(struct s6e3fa7_panel *ctx)
> +static int s6e3fa7_panel_on(struct mipi_dsi_device *dsi)
>   {
> -	struct mipi_dsi_device *dsi = ctx->dsi;
> -	struct device *dev = &dsi->dev;
> -	int ret;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>   
> -	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> -		return ret;
> -	}
> -	msleep(120);
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
>   
> -	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to set tear on: %d\n", ret);
> -		return ret;
> -	}
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf4,
> +				     0xbb, 0x23, 0x19, 0x3a, 0x9f, 0x0f, 0x09, 0xc0,
> +				     0x00, 0xb4, 0x37, 0x70, 0x79, 0x69);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
>   
> -	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> -	mipi_dsi_dcs_write_seq(dsi, 0xf4,
> -			       0xbb, 0x23, 0x19, 0x3a, 0x9f, 0x0f, 0x09, 0xc0,
> -			       0x00, 0xb4, 0x37, 0x70, 0x79, 0x69);
> -	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> -	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>   
> -	ret = mipi_dsi_dcs_set_display_on(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to set display on: %d\n", ret);
> -		return ret;
> -	}
> -
> -	return 0;
> +	return dsi_ctx.accum_err;
>   }
>   
>   static int s6e3fa7_panel_prepare(struct drm_panel *panel)
>   {
>   	struct s6e3fa7_panel *ctx = to_s6e3fa7_panel(panel);
> -	struct device *dev = &ctx->dsi->dev;
>   	int ret;
>   
>   	s6e3fa7_panel_reset(ctx);
>   
> -	ret = s6e3fa7_panel_on(ctx);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +	ret = s6e3fa7_panel_on(ctx->dsi);
> +	if (ret < 0)
>   		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> -		return ret;
> -	}
>   
> -	return 0;
> +	return ret;
>   }
>   
>   static int s6e3fa7_panel_unprepare(struct drm_panel *panel)
> @@ -104,23 +85,13 @@ static int s6e3fa7_panel_disable(struct drm_panel *panel)
>   {
>   	struct s6e3fa7_panel *ctx = to_s6e3fa7_panel(panel);
>   	struct mipi_dsi_device *dsi = ctx->dsi;
> -	struct device *dev = &dsi->dev;
> -	int ret;
> -
> -	ret = mipi_dsi_dcs_set_display_off(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to set display off: %d\n", ret);
> -		return ret;
> -	}
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>   
> -	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> -		return ret;
> -	}
> -	msleep(120);
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
>   
> -	return 0;
> +	return dsi_ctx.accum_err;
>   }
>   
>   static const struct drm_display_mode s6e3fa7_panel_mode = {
> -- 
> 2.46.0
> 
