Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3C1BBCDD0
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 01:22:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FDBD10E2CB;
	Sun,  5 Oct 2025 23:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lSZqoVy/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0DED10E2CB
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Oct 2025 23:22:06 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595NLjhK016170
 for <dri-devel@lists.freedesktop.org>; Sun, 5 Oct 2025 23:22:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Tb08ffW4DbsnaOmuGQXt22LR
 uzui+lNjPwPW3k8wy1s=; b=lSZqoVy/4aXEtSB+LkhqFrCu5WmeS1yItyTkUslR
 TeMNRjI1gyFIeY5cKmyvs22hVPxtjr8sCbLUgRqAPMHBYCzWsgj4KgIaMhnXa/Ix
 LRe1mNpfRBLosC7iQijY6tzDHImClzkBjJGyzFEV6uRFKqf3V/Sr4wvP0c/5P4kM
 CISymuSyY2T3IMg5BiyvAOnSpSx/BWiEJXdI1R1HebMjSJoKgNjOm43WAzRNjlGy
 Br6DZfU8BygeuY3gOrJIb5/wolDAniUGavobQj+XxCVfOq18fmXCq/XWjxUTz5fo
 ntnbqHHAi4eeBfNAsEmJEOgshz6bGGuN/lwMf4Cs+N20lw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvv7jedf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Oct 2025 23:22:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4d6a41b5b66so114236071cf.1
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Oct 2025 16:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759706525; x=1760311325;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tb08ffW4DbsnaOmuGQXt22LRuzui+lNjPwPW3k8wy1s=;
 b=cYjAJ8h+euYtT0kii7gbQcmyUuwPIjA2s6TetL99Hp6z/aUfOdLrk91fgnOpDbD+sM
 vOQBD3AY/qxInIM1aRtAjYcbsuyRBJ2jkmXoVDClZ+YxE5iGe6HyoXXImbysmEHvEy12
 VrG9PuJ91uS/Is4uXhb1+pY4pfkEGPRV4DHIG0Kw1hm7Ek3rVZip9TVcpD++8hTMIu6S
 RbfWnzg7ugB+o8xDgx8XFoEaryzmNdm3oQW0QlUirOXY8Mwe+DKoaLKXZpX8ee8z79V1
 gMzw18NUe471zDlU70WGdWumTu5sx3y9vdGPQXw4dXA+LJZJQAJdx1wv/Ikeld23CdVu
 QouA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7TUV1c5fDMJyScTRXfnVtv18/cQnzqOrhXK4sjWsZY3nI64dmzF/LZCLM8WkT6WRqjwCB5xGKnPI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGVpsp7CO7ysaa/6Kr+LJEYxMalDwvkHC3LvufmM6l7IutvYkR
 majr6M3M5s8bBhjcryA6JQR7nR1Su0bw19SN6qd4IuXyqF3WBPvTVY19CYFIl7P7J7DizDZ4d4q
 6cPgWOApKbuRpLOWxmEhggMexTp3CBpM4F663L8SwbgNIsUY74zZKcNBkOaJd19l75eYVmMw=
X-Gm-Gg: ASbGncs8uzp5E8PXICQ+WicufdeUTmENMpNjuMMM5jB4TorAE5QcjtcfptOCc2UGgw9
 tTnFcfz12lg3gnVGm6LbY/Fl3dZq88e6IjBW4m9AdqjTRAD2nRIl3LmmIAzb2Av2vbw/fOkQJq1
 6YIXscaGENRjfPHT2WhVerZhehPcBBUuSrhcRPOqNf987PBdMhpEAVEBAcSZcEX77DOm+GJdNUD
 mlvGsFIUoJhLPuVl0NRkviT9lGBxyMqQnG3L86O6kX6FvqSEWtpX1Cj031c6xbebWrfiFrA51/2
 cbzT9kZUac4g6tbh2zGvkRcEr4X8nnDbWmNj9ig/VDk1b0gQlgyF69GSL1I/93fVM7vTfBgRC/C
 NU91K/Csm1GIRlSqAaIVb2VCqVb8xkfalKh1IrG9+clHRv2W6HdF++R5QfQ==
X-Received: by 2002:a05:622a:998:b0:4db:9c75:abad with SMTP id
 d75a77b69052e-4e576b307c5mr126255661cf.74.1759706524728; 
 Sun, 05 Oct 2025 16:22:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJULL2VZQjCLXKuYta5vackW0AYBFaK3yrYJMbji+l7aGMwmBnu+kqmtXsQ9JSHKRG6CXTOA==
X-Received: by 2002:a05:622a:998:b0:4db:9c75:abad with SMTP id
 d75a77b69052e-4e576b307c5mr126255421cf.74.1759706524145; 
 Sun, 05 Oct 2025 16:22:04 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0118d88fsm4371863e87.69.2025.10.05.16.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Oct 2025 16:22:02 -0700 (PDT)
Date: Mon, 6 Oct 2025 02:21:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] drm/panel: Add driver for Tianma TL121BVMS07-00
 panel
Message-ID: <anldo4jltvbu2smqo4ognxkauqs6aomm742f5v7bhryi6jappx@lfcig7pn5go6>
References: <20250930075044.1368134-1-yelangyan@huaqin.corp-partner.google.com>
 <20250930075044.1368134-3-yelangyan@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930075044.1368134-3-yelangyan@huaqin.corp-partner.google.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNyBTYWx0ZWRfX37wVPPp6AFKr
 ieIsjAeai67Dxb4rPCIQCHrPdq3FvHLOzGkde2oZzBXtqnvKTx58l/QtKO1S/9XqZjgXNCLxTGi
 pVF3CVnDL96WNi32dt45T0eMw5JQsGR3murL+S4f6b5sD5HDQGOq7OGqbwVlWYhZ6Y1GYujsRvE
 cBWIU3x+21rJDICbLXUCDeNT0RSErpsB0s6Z20O5KUiKSP8+CfO//k+Gxijlz5Afs8Gs5F4Rdrq
 nGKCcYJ5T4gPSr5De9fx4NAFK3FbVYOU7SRm6K1TNUWho9LBe4/rqbpEkXrYWPcpXmAhe/fIU+r
 oJQe7LNYbz1WKE1e6u1lKAnY8U82PPX6dc3rLaz2/eEi883dUS/n4JD1wrurgUNyee/knB1clT9
 ytewWQI4w1AJUya7y+aRbfWeGgOTAA==
X-Proofpoint-ORIG-GUID: xYuMF0T4qvvBVasg09D4B9Wcaw7dEmrB
X-Authority-Analysis: v=2.4 cv=WIdyn3sR c=1 sm=1 tr=0 ts=68e2fd9e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=1XWaLZrsAAAA:8 a=NJAL_iFP5D2qNw8AoYUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: xYuMF0T4qvvBVasg09D4B9Wcaw7dEmrB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-05_08,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040037
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

On Tue, Sep 30, 2025 at 03:50:44PM +0800, Langyan Ye wrote:
> Add a DRM panel driver for the Tianma TL121BVMS07-00 12.1"
> MIPI-DSI TFT LCD panel. The panel requires multiple power
> supplies (AVDD, AVEE, 1.8V logic), an enable GPIO, and a
> backlight device. The panel is based on the Ilitek IL79900A
> controller.

The rest of panels based on Ilitek controllers are handled by
panel-ilitek-iliNNNN.c drivers (which might or might not be shared by
several panels). Is there a reason to deviate from that custom?

> 
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  .../drm/panel/panel-tianma-tl121bvms07-00.c   | 419 ++++++++++++++++++
>  1 file changed, 419 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-tianma-tl121bvms07-00.c
> 
> diff --git a/drivers/gpu/drm/panel/panel-tianma-tl121bvms07-00.c b/drivers/gpu/drm/panel/panel-tianma-tl121bvms07-00.c
> new file mode 100644
> index 000000000000..5facffeda864
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-tianma-tl121bvms07-00.c
> @@ -0,0 +1,419 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * DRM panel driver for Tianma TL121BVMS07-00 12.1" MIPI-DSI TFT LCD panel
> + *
> + * Based on drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> + */
> +
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_connector.h>
> +#include <drm/drm_crtc.h>

Unnecessary

> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_panel.h>
> +
> +#include <video/mipi_display.h>
> +
> +struct tm_panel;
> +
> +struct panel_desc {
> +	const struct drm_display_mode *modes;
> +	unsigned int bpc;
> +
> +	/**
> +	 * @width_mm: width of the panel's active display area
> +	 * @height_mm: height of the panel's active display area
> +	 */
> +	struct {
> +		unsigned int width_mm;
> +		unsigned int height_mm;
> +	} size;
> +
> +	unsigned long mode_flags;
> +	enum mipi_dsi_pixel_format format;
> +	int (*init)(struct tm_panel *tm);
> +	unsigned int lanes;
> +	bool discharge_on_disable;
> +	bool lp11_before_reset;
> +};
> +
> +struct tm_panel {
> +	struct drm_panel base;
> +	struct mipi_dsi_device *dsi;
> +
> +	const struct panel_desc *desc;
> +
> +	enum drm_panel_orientation orientation;
> +	struct regulator *pp1800;
> +	struct regulator *avee;
> +	struct regulator *avdd;
> +	struct gpio_desc *enable_gpio;
> +
> +	bool prepared;
> +};
> +
> +static int tm_tl121bvms07_00_init(struct tm_panel *tm)
> +{
> +	struct mipi_dsi_multi_context ctx = { .dsi = tm->dsi };
> +	struct mipi_dsi_device *dsi = ctx.dsi;
> +
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x5a, 0xa5, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3e, 0x62);
> +
> +
> +	mipi_dsi_generic_write_seq(dsi, 0xff, 0x5a, 0xa5, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1b, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5d, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5e, 0x40);
> +
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x5a, 0xa5, 0x07);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0X29, 0x00);
> +
> +	mipi_dsi_generic_write_seq(dsi, 0xff, 0x5a, 0xa5, 0x00);
> +
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0X11);
> +
> +	if (ctx.accum_err)
> +		return ctx.accum_err;
> +
> +	msleep(120);
> +
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0X29);
> +
> +	if (ctx.accum_err)
> +		return ctx.accum_err;
> +
> +	msleep(80);
> +
> +	return 0;
> +};
> +
> +static inline struct tm_panel *to_tm_panel(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct tm_panel, base);
> +}

I'd expect this function to be present right after struct tm_panel
definition.

> +
> +static int tm_panel_enter_sleep_mode(struct tm_panel *tm)
> +{
> +	struct mipi_dsi_device *dsi = tm->dsi;
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_set_display_off(dsi);

Use _multi.

> +	if (ret < 0)
> +		return ret;
> +
> +	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int tm_panel_disable(struct drm_panel *panel)
> +{
> +	struct tm_panel *tm = to_tm_panel(panel);
> +	int ret;
> +
> +	ret = tm_panel_enter_sleep_mode(tm);

Inline

> +	if (ret < 0) {
> +		dev_err(panel->dev, "failed to set panel off: %d\n", ret);
> +		return ret;
> +	}
> +
> +	msleep(150);

And here use DSI-specific wrapper.

> +
> +	return 0;
> +}
> +
> +static int tm_panel_unprepare(struct drm_panel *panel)
> +{
> +	struct tm_panel *tm = to_tm_panel(panel);
> +
> +	if (!tm->prepared)
> +		return 0;
> +
> +	if (tm->desc->discharge_on_disable) {
> +		regulator_disable(tm->avee);
> +		regulator_disable(tm->avdd);
> +		usleep_range(5000, 7000);
> +		gpiod_set_value(tm->enable_gpio, 0);
> +		usleep_range(5000, 7000);
> +		regulator_disable(tm->pp1800);
> +	} else {
> +		gpiod_set_value(tm->enable_gpio, 0);
> +		usleep_range(1000, 2000);
> +		regulator_disable(tm->avee);
> +		regulator_disable(tm->avdd);
> +		usleep_range(5000, 7000);
> +		regulator_disable(tm->pp1800);
> +	}
> +
> +	tm->prepared = false;
> +
> +	return 0;
> +}
> +
> +static int tm_panel_prepare(struct drm_panel *panel)
> +{
> +	struct tm_panel *tm = to_tm_panel(panel);
> +	int ret;
> +
> +	if (tm->prepared)
> +		return 0;
> +
> +	ret = regulator_enable(tm->pp1800);
> +	if (ret < 0)
> +		return ret;
> +
> +	usleep_range(6000, 8000);
> +
> +	ret = regulator_enable(tm->avdd);
> +	if (ret < 0)
> +		goto poweroff1v8;
> +	ret = regulator_enable(tm->avee);
> +	if (ret < 0)
> +		goto poweroffavdd;
> +
> +	usleep_range(11000, 12000);
> +
> +	gpiod_set_value(tm->enable_gpio, 1);
> +
> +	if (tm->desc->lp11_before_reset) {
> +		ret = mipi_dsi_dcs_nop(tm->dsi);
> +		if (ret < 0) {
> +			dev_err(&tm->dsi->dev, "Failed to send NOP: %d\n", ret);
> +			goto poweroff;
> +		}
> +		usleep_range(1000, 2000);
> +	}
> +	gpiod_set_value(tm->enable_gpio, 0);
> +	usleep_range(1000, 2000);
> +	gpiod_set_value(tm->enable_gpio, 1);
> +	usleep_range(20000, 21000);
> +
> +	ret = tm->desc->init(tm);
> +	if (ret < 0)
> +		goto poweroff;
> +
> +	tm->prepared = true;
> +	return 0;
> +
> +poweroff:
> +	gpiod_set_value(tm->enable_gpio, 0);
> +	regulator_disable(tm->avee);
> +poweroffavdd:
> +	regulator_disable(tm->avdd);
> +poweroff1v8:
> +	usleep_range(5000, 7000);
> +	regulator_disable(tm->pp1800);
> +
> +	return ret;
> +}
> +
> +static int tm_panel_enable(struct drm_panel *panel)
> +{
> +	msleep(130);
> +	return 0;
> +}
> +
> +static const struct drm_display_mode tm_tl121bvms07_00_default_mode = {
> +	.clock = 264355,
> +	.hdisplay = 1600,
> +	.hsync_start = 1600 + 20,
> +	.hsync_end = 1600 + 20 + 4,
> +	.htotal = 1600 + 20 + 4 + 20,
> +	.vdisplay = 2560,
> +	.vsync_start = 2560 + 82,
> +	.vsync_end = 2560 + 82 + 2,
> +	.vtotal = 2560 + 82 + 2 + 36,
> +};
> +
> +static const struct panel_desc tm_tl121bvms07_00_desc = {
> +	.modes = &tm_tl121bvms07_00_default_mode,
> +	.bpc = 8,
> +	.size = {
> +		.width_mm = 163,
> +		.height_mm = 260,
> +	},
> +	.lanes = 3,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +		      MIPI_DSI_MODE_LPM,
> +	.init = tm_tl121bvms07_00_init,
> +	.lp11_before_reset = true,
> +};
> +
> +static int tm_panel_get_modes(struct drm_panel *panel,
> +			       struct drm_connector *connector)
> +{
> +	struct tm_panel *tm = to_tm_panel(panel);
> +	const struct drm_display_mode *m = tm->desc->modes;
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(connector->dev, m);
> +	if (!mode) {
> +		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
> +			m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
> +		return -ENOMEM;
> +	}

See drm_connector_helper_get_modes_fixed()

> +
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	drm_mode_set_name(mode);
> +	drm_mode_probed_add(connector, mode);
> +
> +	connector->display_info.width_mm = tm->desc->size.width_mm;
> +	connector->display_info.height_mm = tm->desc->size.height_mm;
> +	connector->display_info.bpc = tm->desc->bpc;
> +	/*
> +	 * TODO: Remove once all drm drivers call
> +	 * drm_connector_set_orientation_from_panel()
> +	 */
> +	drm_connector_set_panel_orientation(connector, tm->orientation);
> +
> +	return 1;
> +}
> +

-- 
With best wishes
Dmitry
