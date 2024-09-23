Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3A49838BC
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 23:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5741710E4A1;
	Mon, 23 Sep 2024 21:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="L4OkvE7S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A2A10E4A1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 21:18:25 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48NBE5cr002020;
 Mon, 23 Sep 2024 21:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0OLZPBPwxzNvOrQ3zDFAWKC0gbGXLTAOJEfGnS4t59E=; b=L4OkvE7SKg0D3Kmb
 ev0KqXbfc9DtkTYwbcuiYZcSBk/ytPR7jF3vEdXiI7Rb75RXiwskgYWiJQlCa/LD
 9Drz4ErVHt8JJF0NvE5gurGJ/m2ocN0n4BgnwP1npYCP62Hb+tgqOer4HSh7jWo7
 FhCTm2qpBp97H5MaEGkyMN8XsMX800WUDs4KY5Vq1JmO0m16ezTuflVcCGgEf+SV
 7cN/KBd8Qkms9lKydAHv9d3J8PMRjYyhqCzW5C3+1RztisIxlGuvjhsOFP+Ey9ky
 SYB7rwZ48PtPCHJfV3tP0yAtWPwfRXDoAd46zkB9yhJib5o9/9K/gbBzKlyJw3tl
 TkzawQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sn5bpcyc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2024 21:18:17 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48NLIGM1025964
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2024 21:18:16 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Sep
 2024 14:18:16 -0700
Message-ID: <d882e279-9736-419a-a47d-c3b985517efa@quicinc.com>
Date: Mon, 23 Sep 2024 14:18:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panel: elida-kd35t133: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>, <neil.armstrong@linaro.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>
CC: <dianders@chromium.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20240923122558.728516-1-tejasvipin76@gmail.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240923122558.728516-1-tejasvipin76@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: K9QCOVYxELHU5AGK2-kdv0glJKogXu3O
X-Proofpoint-GUID: K9QCOVYxELHU5AGK2-kdv0glJKogXu3O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409230153
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



On 9/23/2024 5:25 AM, Tejas Vipin wrote:
> Changes the elida-kd35t133 panel to use multi style functions for
> improved error handling.
> 
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>

Hi Tejas,

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> ---
> Changes in v2:
>      - Changed mipi_dsi_dcs_write to mipi_dsi_dcs_write_buffer_multi
>      - Cleaned up error handling
> 
> Link to v1: https://lore.kernel.org/all/20240917071710.1254520-1-tejasvipin76@gmail.com/
> ---
>   drivers/gpu/drm/panel/panel-elida-kd35t133.c | 108 ++++++++-----------
>   1 file changed, 45 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> index 00791ea81e90..2c031301fdd2 100644
> --- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> +++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> @@ -50,55 +50,44 @@ static inline struct kd35t133 *panel_to_kd35t133(struct drm_panel *panel)
>   	return container_of(panel, struct kd35t133, panel);
>   }
>   
> -static int kd35t133_init_sequence(struct kd35t133 *ctx)
> +static void kd35t133_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
>   {
> -	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> -	struct device *dev = ctx->dev;
> -
>   	/*
>   	 * Init sequence was supplied by the panel vendor with minimal
>   	 * documentation.
>   	 */
> -	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_POSITIVEGAMMA,
> -			       0x00, 0x13, 0x18, 0x04, 0x0f, 0x06, 0x3a, 0x56,
> -			       0x4d, 0x03, 0x0a, 0x06, 0x30, 0x3e, 0x0f);
> -	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_NEGATIVEGAMMA,
> -			       0x00, 0x13, 0x18, 0x01, 0x11, 0x06, 0x38, 0x34,
> -			       0x4d, 0x06, 0x0d, 0x0b, 0x31, 0x37, 0x0f);
> -	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_POWERCONTROL1, 0x18, 0x17);
> -	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_POWERCONTROL2, 0x41);
> -	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_VCOMCONTROL, 0x00, 0x1a, 0x80);
> -	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x48);
> -	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
> -	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_INTERFACEMODECTRL, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_FRAMERATECTRL, 0xa0);
> -	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_DISPLAYINVERSIONCTRL, 0x02);
> -	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_DISPLAYFUNCTIONCTRL,
> -			       0x20, 0x02);
> -	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_SETIMAGEFUNCTION, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_ADJUSTCONTROL3,
> -			       0xa9, 0x51, 0x2c, 0x82);
> -	mipi_dsi_dcs_write(dsi, MIPI_DCS_ENTER_INVERT_MODE, NULL, 0);
> -
> -	dev_dbg(dev, "Panel init sequence done\n");
> -	return 0;
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_POSITIVEGAMMA,
> +				     0x00, 0x13, 0x18, 0x04, 0x0f, 0x06, 0x3a, 0x56,
> +				     0x4d, 0x03, 0x0a, 0x06, 0x30, 0x3e, 0x0f);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_NEGATIVEGAMMA,
> +				     0x13, 0x18, 0x01, 0x11, 0x06, 0x38, 0x34,
> +				     0x06, 0x0d, 0x0b, 0x31, 0x37, 0x0f);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_POWERCONTROL1, 0x18, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_POWERCONTROL2, 0x41);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_VCOMCONTROL, 0x00, 0x1a, 0x80);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x48);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_INTERFACEMODECTRL, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_FRAMERATECTRL, 0xa0);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_DISPLAYINVERSIONCTRL, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_DISPLAYFUNCTIONCTRL,
> +				     0x02);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_SETIMAGEFUNCTION, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_ADJUSTCONTROL3,
> +				     0x51, 0x2c, 0x82);
> +	mipi_dsi_dcs_write_buffer_multi(dsi_ctx, NULL, 0);
>   }
>   
>   static int kd35t133_unprepare(struct drm_panel *panel)
>   {
>   	struct kd35t133 *ctx = panel_to_kd35t133(panel);
>   	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> -	int ret;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>   
> -	ret = mipi_dsi_dcs_set_display_off(dsi);
> -	if (ret < 0)
> -		dev_err(ctx->dev, "failed to set display off: %d\n", ret);
> -
> -	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> -	if (ret < 0) {
> -		dev_err(ctx->dev, "failed to enter sleep mode: %d\n", ret);
> -		return ret;
> -	}
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +	if (dsi_ctx.accum_err)
> +		return dsi_ctx.accum_err;
>   
>   	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>   
> @@ -112,18 +101,20 @@ static int kd35t133_prepare(struct drm_panel *panel)
>   {
>   	struct kd35t133 *ctx = panel_to_kd35t133(panel);
>   	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> -	int ret;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>   
>   	dev_dbg(ctx->dev, "Resetting the panel\n");
> -	ret = regulator_enable(ctx->vdd);
> -	if (ret < 0) {
> -		dev_err(ctx->dev, "Failed to enable vdd supply: %d\n", ret);
> -		return ret;
> +	dsi_ctx.accum_err = regulator_enable(ctx->vdd);
> +	if (dsi_ctx.accum_err) {
> +		dev_err(ctx->dev, "Failed to enable vdd supply: %d\n",
> +			dsi_ctx.accum_err);
> +		return dsi_ctx.accum_err;
>   	}
>   
> -	ret = regulator_enable(ctx->iovcc);
> -	if (ret < 0) {
> -		dev_err(ctx->dev, "Failed to enable iovcc supply: %d\n", ret);
> +	dsi_ctx.accum_err = regulator_enable(ctx->iovcc);
> +	if (dsi_ctx.accum_err) {
> +		dev_err(ctx->dev, "Failed to enable iovcc supply: %d\n",
> +			dsi_ctx.accum_err);
>   		goto disable_vdd;
>   	}
>   
> @@ -135,27 +126,18 @@ static int kd35t133_prepare(struct drm_panel *panel)
>   
>   	msleep(20);
>   
> -	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> -	if (ret < 0) {
> -		dev_err(ctx->dev, "Failed to exit sleep mode: %d\n", ret);
> -		goto disable_iovcc;
> -	}
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 250);
>   
> -	msleep(250);
> +	kd35t133_init_sequence(&dsi_ctx);
> +	if (!dsi_ctx.accum_err)
> +		dev_dbg(ctx->dev, "Panel init sequence done\n");
>   
> -	ret = kd35t133_init_sequence(ctx);
> -	if (ret < 0) {
> -		dev_err(ctx->dev, "Panel init sequence failed: %d\n", ret);
> -		goto disable_iovcc;
> -	}
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 50);
>   
> -	ret = mipi_dsi_dcs_set_display_on(dsi);
> -	if (ret < 0) {
> -		dev_err(ctx->dev, "Failed to set display on: %d\n", ret);
> +	if (dsi_ctx.accum_err)
>   		goto disable_iovcc;
> -	}
> -
> -	msleep(50);
>   
>   	return 0;
>   
> @@ -163,7 +145,7 @@ static int kd35t133_prepare(struct drm_panel *panel)
>   	regulator_disable(ctx->iovcc);
>   disable_vdd:
>   	regulator_disable(ctx->vdd);
> -	return ret;
> +	return dsi_ctx.accum_err;
>   }
>   
>   static const struct drm_display_mode default_mode = {
> -- 
> 2.46.1
> 

