Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 053F594C622
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 23:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8411F10E814;
	Thu,  8 Aug 2024 21:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="OcIMbpzg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E076D10E814
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 21:02:27 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 478A1H0T006798;
 Thu, 8 Aug 2024 21:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5aOhLNTr+v8KDwgXDHnpZ05L7XflBzEt1eInRR5Otls=; b=OcIMbpzgVvCHmZ7G
 ipWsG3KOH09aj6EKwhc01dgwFc2COYc1NW9dBeBI5ovjOZFuUYzdtPFtXB3JEfgt
 W1/0gwwVAQGoprhTtKl2iMPXHyJfJbyFfbAQhycJnb1ANv7inIS2fhVSYPQQClDu
 0L1eoXFBaD1ektozRM1P1Sa+KqhfF3rCWzaBFRxnh6QN8PB8uErrHeQWmqV2pTYr
 JG7NsRgjYzjM6LXSiYn3Crc1UNO44n0Oln+w9WAkW2mMIZnltHor7iqEFtsrDgCH
 ncgeRCmw38TKV9BMAtp0gRSOqI6KaxnyXgp+ky30DhAlellBBQ5+GTi0p2zkCp+s
 +CDHSw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40vuwaspvh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Aug 2024 21:02:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 478L2Hat025557
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 8 Aug 2024 21:02:17 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 Aug 2024
 14:02:17 -0700
Message-ID: <61da2ecf-88c1-4d03-afb0-98f0395ad229@quicinc.com>
Date: Thu, 8 Aug 2024 14:02:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/panel: startek-kd070fhfid015: transition to
 mipi_dsi wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>, <maarten.lankhorst@linux.intel.com>, 
 <mripard@kernel.org>, <tzimmermann@suse.de>, <neil.armstrong@linaro.org>
CC: <dianders@chromium.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240806135949.468636-1-tejasvipin76@gmail.com>
 <20240806135949.468636-3-tejasvipin76@gmail.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240806135949.468636-3-tejasvipin76@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: fr2CZduB7f0PHyj3X8kXqm-06tJOrOWZ
X-Proofpoint-GUID: fr2CZduB7f0PHyj3X8kXqm-06tJOrOWZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_21,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 mlxscore=0 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408080149
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



On 8/6/2024 6:59 AM, Tejas Vipin wrote:
> Use multi style wrapped functions for mipi_dsi in the
> startek-kd070fhfid015 panel.
> 
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   .../drm/panel/panel-startek-kd070fhfid015.c   | 115 ++++++------------
>   1 file changed, 35 insertions(+), 80 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
> index 0156689f41cd..c0c95355b743 100644
> --- a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
> +++ b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
> @@ -24,10 +24,10 @@
>   #include <drm/drm_modes.h>
>   #include <drm/drm_panel.h>
>   
> -#define DSI_REG_MCAP	0xB0
> -#define DSI_REG_IS	0xB3 /* Interface Setting */
> -#define DSI_REG_IIS	0xB4 /* Interface ID Setting */
> -#define DSI_REG_CTRL	0xB6
> +#define DSI_REG_MCAP	0xb0
> +#define DSI_REG_IS	0xb3 /* Interface Setting */
> +#define DSI_REG_IIS	0xb4 /* Interface ID Setting */
> +#define DSI_REG_CTRL	0xb6
>   
>   enum {
>   	IOVCC = 0,
> @@ -52,92 +52,55 @@ static inline struct stk_panel *to_stk_panel(struct drm_panel *panel)
>   static int stk_panel_init(struct stk_panel *stk)
>   {
>   	struct mipi_dsi_device *dsi = stk->dsi;
> -	struct device *dev = &stk->dsi->dev;
> -	int ret;
> -
> -	ret = mipi_dsi_dcs_soft_reset(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to mipi_dsi_dcs_soft_reset: %d\n", ret);
> -		return ret;
> -	}
> -	mdelay(5);
> +	struct mipi_dsi_multi_context dsi_ctx = {.dsi = dsi};
>   
> -	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to set exit sleep mode: %d\n", ret);
> -		return ret;
> -	}
> -	msleep(120);
> +	mipi_dsi_dcs_soft_reset_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 5);
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
>   
> -	mipi_dsi_generic_write_seq(dsi, DSI_REG_MCAP, 0x04);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, DSI_REG_MCAP, 0x04);
>   
>   	/* Interface setting, video mode */
> -	mipi_dsi_generic_write_seq(dsi, DSI_REG_IS, 0x14, 0x08, 0x00, 0x22, 0x00);
> -	mipi_dsi_generic_write_seq(dsi, DSI_REG_IIS, 0x0C, 0x00);
> -	mipi_dsi_generic_write_seq(dsi, DSI_REG_CTRL, 0x3A, 0xD3);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, DSI_REG_IS, 0x14, 0x08, 0x00, 0x22, 0x00);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, DSI_REG_IIS, 0x0c, 0x00);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, DSI_REG_CTRL, 0x3a, 0xd3);
>   
> -	ret = mipi_dsi_dcs_set_display_brightness(dsi, 0x77);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to write display brightness: %d\n", ret);
> -		return ret;
> -	}
> +	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x77);
>   
> -	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY,
> -			       MIPI_DCS_WRITE_MEMORY_START);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
> +				     MIPI_DCS_WRITE_MEMORY_START);
>   
> -	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x77);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to set pixel format: %d\n", ret);
> -		return ret;
> -	}
> +	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, 0x77);
> +	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0, stk->mode->hdisplay - 1);
> +	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0, stk->mode->vdisplay - 1);
>   
> -	ret = mipi_dsi_dcs_set_column_address(dsi, 0, stk->mode->hdisplay - 1);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to set column address: %d\n", ret);
> -		return ret;
> -	}
> -
> -	ret = mipi_dsi_dcs_set_page_address(dsi, 0, stk->mode->vdisplay - 1);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to set page address: %d\n", ret);
> -		return ret;
> -	}
> -
> -	return 0;
> +	return dsi_ctx.accum_err;
>   }
>   
>   static int stk_panel_on(struct stk_panel *stk)
>   {
>   	struct mipi_dsi_device *dsi = stk->dsi;
> -	struct device *dev = &stk->dsi->dev;
> -	int ret;
> +	struct mipi_dsi_multi_context dsi_ctx = {.dsi = dsi};
>   
> -	ret = mipi_dsi_dcs_set_display_on(dsi);
> -	if (ret < 0)
> -		dev_err(dev, "failed to set display on: %d\n", ret);
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>   
> -	mdelay(20);
> +	mipi_dsi_msleep(&dsi_ctx, 20);
>   
> -	return ret;
> +	return dsi_ctx.accum_err;
>   }
>   
>   static void stk_panel_off(struct stk_panel *stk)
>   {
>   	struct mipi_dsi_device *dsi = stk->dsi;
> -	struct device *dev = &stk->dsi->dev;
> -	int ret;
> +	struct mipi_dsi_multi_context dsi_ctx = {.dsi = dsi};
>   
>   	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>   
> -	ret = mipi_dsi_dcs_set_display_off(dsi);
> -	if (ret < 0)
> -		dev_err(dev, "failed to set display off: %d\n", ret);
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
>   
> -	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> -	if (ret < 0)
> -		dev_err(dev, "failed to enter sleep mode: %d\n", ret);
> -
> -	msleep(100);
> +	mipi_dsi_msleep(&dsi_ctx, 100);
>   }
>   
>   static int stk_panel_unprepare(struct drm_panel *panel)
> @@ -155,7 +118,6 @@ static int stk_panel_unprepare(struct drm_panel *panel)
>   static int stk_panel_prepare(struct drm_panel *panel)
>   {
>   	struct stk_panel *stk = to_stk_panel(panel);
> -	struct device *dev = &stk->dsi->dev;
>   	int ret;
>   
>   	gpiod_set_value(stk->reset_gpio, 0);
> @@ -175,16 +137,12 @@ static int stk_panel_prepare(struct drm_panel *panel)
>   	gpiod_set_value(stk->reset_gpio, 1);
>   	mdelay(10);
>   	ret = stk_panel_init(stk);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to init panel: %d\n", ret);
> +	if (ret < 0)
>   		goto poweroff;
> -	}
>   
>   	ret = stk_panel_on(stk);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to set panel on: %d\n", ret);
> +	if (ret < 0)
>   		goto poweroff;
> -	}
>   
>   	return 0;
>   
> @@ -250,18 +208,15 @@ static int dsi_dcs_bl_get_brightness(struct backlight_device *bl)
>   static int dsi_dcs_bl_update_status(struct backlight_device *bl)
>   {
>   	struct mipi_dsi_device *dsi = bl_get_data(bl);
> -	struct device *dev = &dsi->dev;
> -	int ret;
> +	struct mipi_dsi_multi_context dsi_ctx = {.dsi = dsi};
>   
>   	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> -	ret = mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to set DSI control: %d\n", ret);
> -		return ret;
> -	}
> +	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, bl->props.brightness);
> +	if (dsi_ctx.accum_err)
> +		return dsi_ctx.accum_err;
>   
>   	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> -	return 0;
> +	return dsi_ctx.accum_err;
>   }
>   
>   static const struct backlight_ops dsi_bl_ops = {
> -- 
> 2.46.0
> 
